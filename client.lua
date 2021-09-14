local speed = 0.0
local seatbeltOn = false
local cruiseOn = false
local radarActive = false
local nos = 0
local stress = 0
local hunger = 100
local thirst = 100
local cashAmount = 0
local bankAmount = 0
local isLoggedIn = false

-- Events

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('hud:client:UpdateNeeds') -- Triggered in qb-core
AddEventHandler('hud:client:UpdateNeeds', function(newHunger, newThirst)
    hunger = newHunger
    thirst = newThirst
end)

RegisterNetEvent('hud:client:UpdateStress') -- Add this event with adding stress elsewhere
AddEventHandler('hud:client:UpdateStress', function(newStress)
    stress = newStress
end)

RegisterNetEvent('seatbelt:client:ToggleSeatbelt') -- Triggered in smallresources
AddEventHandler('seatbelt:client:ToggleSeatbelt', function()
    seatbeltOn = not seatbeltOn
end)

RegisterNetEvent('seatbelt:client:ToggleCruise') -- Triggered in smallresources
AddEventHandler('seatbelt:client:ToggleCruise', function()
    cruiseOn = not cruiseOn
end)

RegisterNetEvent('hud:client:UpdateNitrous')
AddEventHandler('hud:client:UpdateNitrous', function(hasNitro, nitroLevel, bool)
    nos = nitroLevel
end)

-- Player HUD
Citizen.CreateThread(function()
    while true do
        Wait(500)
        if isLoggedIn then
            local show = true
            local player = PlayerPedId()
            local talking = NetworkIsPlayerTalking(PlayerId())
            local voice = 0
            if LocalPlayer.state['proximity'] ~= nil then
                voice = LocalPlayer.state['proximity'].distance
            end
            if IsPauseMenuActive() then
                show = false
            end
            SendNUIMessage({
                action = 'hudtick',
                show = show,
                health = GetEntityHealth(player) - 100,
                armor = GetPedArmour(player),
                thirst = thirst,
                hunger = hunger,
                stress = stress,
                voice = voice,
                radio = LocalPlayer.state['radioChannel'],
                talking = talking
            })
        else
            SendNUIMessage({
                action = 'hudtick',
                show = false
            })
        end
    end
end)

-- Vehicle HUD
Citizen.CreateThread(function()
    while true do
        Wait(500)
        if isLoggedIn then
            local player = PlayerPedId()
            local inVehicle = IsPedInAnyVehicle(player)
            local vehicle = GetVehiclePedIsIn(player)
            local isBicycle = IsThisModelABicycle(vehicle)
            if inVehicle and not isBicycle then
                DisplayRadar(true)
                radarActive = true
                local pos = GetEntityCoords(player)
                local speed = GetEntitySpeed(vehicle) * 2.23694
                local street1, street2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(),
                    Citizen.ResultAsInteger())
                local fuel = exports['LegacyFuel']:GetFuel(vehicle)
                SendNUIMessage({
                    action = 'car',
                    show = true,
                    isPaused = IsPauseMenuActive(),
                    direction = GetDirectionText(GetEntityHeading(player)),
                    street1 = GetStreetNameFromHashKey(street1),
                    street2 = GetStreetNameFromHashKey(street2),
                    seatbelt = seatbeltOn,
                    cruise = cruiseOn,
                    speed = math.ceil(speed),
                    nos = nos,
                    fuel = fuel
                })
            else
                SendNUIMessage({
                    action = 'car',
                    show = false,
                    seatbelt = false
                })
                DisplayRadar(false)
                radarActive = false
            end
        else
            DisplayRadar(false)
        end
    end
end)

function GetDirectionText(heading)
    if ((heading >= 0 and heading < 45) or (heading >= 315 and heading < 360)) then
        return 'North'
    elseif (heading >= 45 and heading < 135) then
        return 'South'
    elseif (heading >= 135 and heading < 225) then
        return 'East'
    elseif (heading >= 225 and heading < 315) then
        return 'West'
    end
end

-- Raise Minimap

Citizen.CreateThread(function()
    local minimap = RequestScaleformMovie('minimap')
    while not HasScaleformMovieLoaded(minimap) do
        Wait(0)
    end

    SetMinimapComponentPosition('minimap', 'L', 'B', -0.0045, -0.012, 0.150, 0.188888)
    SetMinimapComponentPosition('minimap_mask', 'L', 'B', 0.020, 0.022, 0.111, 0.159)
    SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.03, 0.012, 0.266, 0.237)

    SetRadarBigmapEnabled(true, false)
    Wait(500)
    SetRadarBigmapEnabled(false, false)
end)

-- Money HUD

RegisterNetEvent('hud:client:ShowAccounts')
AddEventHandler('hud:client:ShowAccounts', function(type, amount)
    if type == 'cash' then
        SendNUIMessage({
            action = 'show',
            type = 'cash',
            cash = amount
        })
    else
        SendNUIMessage({
            action = 'show',
            type = 'bank',
            bank = amount
        })
    end
end)

RegisterNetEvent('hud:client:OnMoneyChange')
AddEventHandler('hud:client:OnMoneyChange', function(type, amount, isMinus)
    QBCore.Functions.GetPlayerData(function(PlayerData)
        cashAmount = PlayerData.money['cash']
        bankAmount = PlayerData.money['bank']
    end)
    SendNUIMessage({
        action = 'update',
        cash = cashAmount,
        bank = bankAmount,
        amount = amount,
        minus = isMinus,
        type = type
    })
end)

-- Stress Gain

Citizen.CreateThread(function() -- Speeding
    while true do
        if QBCore ~= nil --[[ and isLoggedIn ]] then
            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped, false) then
                speed = GetEntitySpeed(GetVehiclePedIsIn(ped, false)) * 2.237 -- mph
                if speed >= Config.MinimumSpeed then
                    TriggerServerEvent('hud:server:GainStress', math.random(1, 3))
                end
            end
        end
        Citizen.Wait(20000)
    end
end)

Citizen.CreateThread(function() -- Shooting
    while true do
        if QBCore ~= nil --[[ and isLoggedIn ]] then
            if IsPedShooting(PlayerPedId()) and not IsWhitelistedWeapon() then
                if math.random() < Config.StressChance then
                    TriggerServerEvent('hud:server:GainStress', math.random(1, 3))
                end
            end
        end
        Citizen.Wait(6)
    end
end)

function IsWhitelistedWeapon()
    local weapon = GetSelectedPedWeapon(PlayerPedId())
    if weapon ~= nil then
        for _, v in pairs(Config.WhitelistedWeapons) do
            if weapon == GetHashKey(v) then
                return true
            end
        end
    end
    return false
end

-- Stress Screen Effects

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local Wait = GetEffectInterval(stress)
        if stress >= 100 then
            local ShakeIntensity = GetShakeIntensity(stress)
            local FallRepeat = math.random(2, 4)
            local RagdollTimeout = (FallRepeat * 1750)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
            SetFlash(0, 0, 500, 3000, 500)

            if not IsPedRagdoll(ped) and IsPedOnFoot(ped) and not IsPedSwimming(ped) then
                local player = PlayerPedId()
                SetPedToRagdollWithFall(player, RagdollTimeout, RagdollTimeout, 1, GetEntityForwardVector(player), 1.0,
                    0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
            end

            Citizen.Wait(500)
            for i = 1, FallRepeat, 1 do
                Citizen.Wait(750)
                DoScreenFadeOut(200)
                Citizen.Wait(1000)
                DoScreenFadeIn(200)
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
                SetFlash(0, 0, 200, 750, 200)
            end
        elseif stress >= Config.MinimumStress then
            local ShakeIntensity = GetShakeIntensity(stress)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
            SetFlash(0, 0, 500, 2500, 500)
        end
        Citizen.Wait(Wait)
    end
end)

function GetShakeIntensity(stresslevel)
    local retval = 0.05
    for k, v in pairs(Config.Intensity['shake']) do
        if stresslevel >= v.min and stresslevel <= v.max then
            retval = v.intensity
            break
        end
    end
    return retval
end

function GetEffectInterval(stresslevel)
    local retval = 60000
    for k, v in pairs(Config.EffectInterval) do
        if stresslevel >= v.min and stresslevel <= v.max then
            retval = v.timeout
            break
        end
    end
    return retval
end