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
isLoggedIn = false

-- Events

Citizen.CreateThread(function()
    if isLoggedIn then
        TriggerEvent('hud:client:SetMoney')
        return
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
    QBHud.Show = false
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    QBHud.Show = true
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
    SendNUIMessage({
        action = 'seatbelt',
        seatbelt = seatbeltOn,
    })
end)

RegisterNetEvent('seatbelt:client:ToggleCruise') -- Triggered in smallresources
AddEventHandler('seatbelt:client:ToggleCruise', function()
    cruiseOn = not cruiseOn
    SendNUIMessage({
        action = 'cruise',
        cruise = cruiseOn,
    })
end)

RegisterNetEvent('hud:client:UpdateNitrous')
AddEventHandler('hud:client:UpdateNitrous', function(hasNitro, nitroLevel, bool)
    nos = nitroLevel
end)

-- Player HUD

Citizen.CreateThread(function()
    Citizen.Wait(500)
    while true do 
        if QBCore ~= nil and isLoggedIn and QBHud.Show then
            local player = PlayerPedId()
            speed = GetEntitySpeed(GetVehiclePedIsIn(player, false)) * 2.23694
            local pos = GetEntityCoords(player)
            local talking = NetworkIsPlayerTalking(PlayerId())
            local street1, street2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
            local fuel = exports['LegacyFuel']:GetFuel(GetVehiclePedIsIn(player))
            SendNUIMessage({
                action = 'hudtick',
                show = IsPauseMenuActive(),
                health = GetEntityHealth(player) - 100,
                armor = GetPedArmour(player),
                thirst = thirst,
                hunger = hunger,
                stress = stress,
                voice = LocalPlayer.state['proximity'].distance,
                talking = talking,
                direction = GetDirectionText(GetEntityHeading(player)),
                street1 = GetStreetNameFromHashKey(street1),
                street2 = GetStreetNameFromHashKey(street2),
                speed = math.ceil(speed),
                nos = nos,
                fuel = fuel,
            })
            Citizen.Wait(500)
        else
            Citizen.Wait(1000)
        end
    end
end)

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

-- Vehicle HUD

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(1000)
        if IsPedInAnyVehicle(PlayerPedId()) and isLoggedIn and QBHud.Show then
            DisplayRadar(true)
            SendNUIMessage({
                action = 'car',
                show = true,
            })
            radarActive = true
        else
            DisplayRadar(false)
            SendNUIMessage({
                action = 'car',
                show = false,
            })
            seatbeltOn = false
            cruiseOn = false

            SendNUIMessage({
                action = 'seatbelt',
                seatbelt = seatbeltOn,
            })

            SendNUIMessage({
                action = 'cruise',
                cruise = cruiseOn,
            })
            radarActive = false
        end
    end
end)

function GetDirectionText(heading)
    if ((heading >= 0 and heading < 45) or (heading >= 315 and heading < 360)) then
        return 'North'
    elseif (heading >= 45 and heading < 135) then
        return 'South'
    elseif (heading >=135 and heading < 225) then
        return 'East'
    elseif (heading >= 225 and heading < 315) then
        return 'West'
    end
end

-- Money HUD

RegisterNetEvent('hud:client:SetMoney')
AddEventHandler('hud:client:SetMoney', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData ~= nil and PlayerData.money ~= nil then
            cashAmount = PlayerData.money['cash']
            bankAmount = PlayerData.money['bank']
        end
    end)
    if QBHud.Money.ShowConstant then
        SendNUIMessage({
            action = 'open',
            cash = cashAmount,
            bank = bankAmount,
        })
    end
end)

RegisterNetEvent('hud:client:ShowMoney')
AddEventHandler('hud:client:ShowMoney', function(type)
    TriggerEvent('hud:client:SetMoney')
    SendNUIMessage({
        action = 'show',
        cash = cashAmount,
        bank = bankAmount,
        type = type,
    })
end)

RegisterNetEvent('hud:client:OnMoneyChange')
AddEventHandler('hud:client:OnMoneyChange', function(type, amount, isMinus)
    QBCore.Functions.GetPlayerData(function(PlayerData)
        cashAmount = PlayerData.money['cash']
        bankAmount = PlayerData.money['bank']
    end)
    
    if QBHud.Money.ShowConstant then
        SendNUIMessage({
            action = 'open',
            cash = cashAmount,
            bank = bankAmount,
        })
    else
        SendNUIMessage({
            action = 'update',
            cash = cashAmount,
            bank = bankAmount,
            amount = amount,
            minus = isMinus,
            type = type,
        })
    end
end)

-- Stress Gain

Citizen.CreateThread(function() -- Speeding
    while true do
        if QBCore ~= nil and isLoggedIn then
            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped, false) then
                speed = GetEntitySpeed(GetVehiclePedIsIn(ped, false)) * 2.237 --mph
                if speed >= QBHud.MinimumSpeed then
                    TriggerServerEvent('hud:server:GainStress', math.random(2, 4))
                end
            end
        end
        Citizen.Wait(20000)
    end
end)

Citizen.CreateThread(function() -- Shooting
    while true do
        if QBCore ~= nil and isLoggedIn then
            if IsPedShooting(PlayerPedId()) then
                local StressChance = math.random(1, 40) -- Generate Random # between 1-40
                local odd = math.random(1, 40) -- Generate Random # between 1-40
                if StressChance == odd then -- If Those Two Numbers Match Then
                    local PlusStress = math.random(1, 3) / 100
                    TriggerServerEvent('hud:server:GainStress', PlusStress)
                end
            end
        end
        Citizen.Wait(6)
    end
end)

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
                SetPedToRagdollWithFall(player, RagdollTimeout, RagdollTimeout, 1, GetEntityForwardVector(player), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
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
        elseif stress >= QBHud.MinimumStress then
            local ShakeIntensity = GetShakeIntensity(stress)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
            SetFlash(0, 0, 500, 2500, 500)
        end
        Citizen.Wait(Wait)
    end
end)

function GetShakeIntensity(stresslevel)
    local retval = 0.05
    for k, v in pairs(QBHud.Intensity['shake']) do
        if stresslevel >= v.min and stresslevel < v.max then
            retval = v.intensity
            break
        end
    end
    return retval
end

function GetEffectInterval(stresslevel)
    local retval = 60000
    for k, v in pairs(QBHud.EffectInterval) do
        if stresslevel >= v.min and stresslevel < v.max then
            retval = v.timeout
            break
        end
    end
    return retval
end