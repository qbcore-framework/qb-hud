local QBCore = exports['qb-core']:GetCoreObject()

local config = Config
local speedMultiplier = config.UseMPH and 2.23694 or 3.6
local seatbeltOn = false
local cruiseOn = false
local nos = 0
local stress = 0
local hunger = 100
local thirst = 100
local cashAmount = 0
local bankAmount = 0

-- Events

RegisterNetEvent('hud:client:UpdateNeeds', function(newHunger, newThirst) -- Triggered in qb-core
    hunger = newHunger
    thirst = newThirst
end)

RegisterNetEvent('hud:client:UpdateStress', function(newStress) -- Add this event with adding stress elsewhere
    stress = newStress
end)

RegisterNetEvent('seatbelt:client:ToggleSeatbelt', function() -- Triggered in smallresources
    seatbeltOn = not seatbeltOn
end)

RegisterNetEvent('seatbelt:client:ToggleCruise', function() -- Triggered in smallresources
    cruiseOn = not cruiseOn
end)

RegisterNetEvent('hud:client:UpdateNitrous', function(hasNitro, nitroLevel, bool)
    nos = nitroLevel
end)

local prevPlayerStats = { nil, nil, nil, nil, nil, nil, nil, nil, nil }

local function updatePlayerHud(data)
    local shouldUpdate = false
    for k, v in pairs(data) do
        if prevPlayerStats[k] ~= v then
            shouldUpdate = true
            break
        end
    end
    prevPlayerStats = data
    if shouldUpdate then
        SendNUIMessage({
            action = 'hudtick',
            show = data[1],
            health = data[2],
            armor = data[3],
            thirst = data[4],
            hunger = data[5],
            stress = data[6],
            voice = data[7],
            radio = data[8],
            talking = data[9],
        })
    end
end

local prevVehicleStats = { nil, nil, nil, nil, nil, nil, nil, nil, nil, nil }

local function updateVehicleHud(data)
    local shouldUpdate = false
    for k, v in pairs(data) do
        if prevVehicleStats[k] ~= v then shouldUpdate = true break end
    end
    prevVehicleStats = data
    if shouldUpdate then
        SendNUIMessage({
            action = 'car',
            show = data[1],
            isPaused = data[2],
            direction = data[3],
            street1 = data[4],
            street2 = data[5],
            seatbelt = data[6],
            cruise = data[7],
            speed = data[8],
            nos = data[9],
            fuel = data[10],
        })
    end
end

local lastCrossroadUpdate = 0
local lastCrossroadCheck = {}

local function getCrossroads(player)
    local updateTick = GetGameTimer()
    if (updateTick - lastCrossroadUpdate) > 1500 then
        local pos = GetEntityCoords(player)
        local street1, street2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
        lastCrossroadUpdate = updateTick
        lastCrossroadCheck = { GetStreetNameFromHashKey(street1), GetStreetNameFromHashKey(street2) }
    end
    return lastCrossroadCheck
end

local lastFuelUpdate = 0
local lastFuelCheck = {}

local function getFuelLevel(vehicle)
    local updateTick = GetGameTimer()
    if (updateTick - lastFuelUpdate) > 2000 then
        lastFuelUpdate = updateTick
        lastFuelCheck = math.floor(exports['LegacyFuel']:GetFuel(vehicle))
    end
    return lastFuelCheck
end

local function GetDirectionText(head)
    if ((head >= 0 and head < 45) or (head >= 315 and head < 360)) then return 'North'
    elseif (head >= 45 and head < 135) then return 'West'
    elseif (head >= 135 and head < 225) then return 'South'
    elseif (head >= 225 and head < 315) then return 'East' end
end

-- HUD Update loop

CreateThread(function()
    local wasInVehicle = false;
    while true do
        Wait(50)
        if LocalPlayer.state.isLoggedIn then
            local show = true
            local player = PlayerPedId()
            -- player hud
            local talking = NetworkIsPlayerTalking(PlayerId())
            local voice = 0
            if LocalPlayer.state['proximity'] ~= nil then
                voice = LocalPlayer.state['proximity'].distance
            end
            if IsPauseMenuActive() then
                show = false
            end
            updatePlayerHud({
                show,
                GetEntityHealth(player) - 100,
                GetPedArmour(player),
                thirst,
                hunger,
                stress,
                voice,
                LocalPlayer.state['radioChannel'],
                talking
            })
            -- vehcle hud
            local vehicle = GetVehiclePedIsIn(player)
            if IsPedInAnyVehicle(player) and not IsThisModelABicycle(vehicle) then
                if not wasInVehicle then
                    DisplayRadar(true)
                end
                wasInVehicle = true
                local crossroads = getCrossroads(player)
                updateVehicleHud({
                    show,
                    IsPauseMenuActive(),
                    GetDirectionText(GetEntityHeading(player)),
                    crossroads[1],
                    crossroads[2],
                    seatbeltOn,
                    cruiseOn,
                    math.ceil(GetEntitySpeed(vehicle) * speedMultiplier),
                    nos,
                    getFuelLevel(vehicle),
                })
            else
                if wasInVehicle then
                    wasInVehicle = false
                    SendNUIMessage({
                        action = 'car',
                        show = false,
                        seatbelt = false,
                        cruise = false,
                    })
                    seatbeltOn = false
                    cruiseOn = false
                end
                DisplayRadar(false)
            end
        else
            SendNUIMessage({
                action = 'hudtick',
                show = false
            })
            DisplayRadar(false)
            Wait(500)
        end
    end
end)

CreateThread(function() -- Raise Minimap
    local minimap = RequestScaleformMovie('minimap')
    while not HasScaleformMovieLoaded(minimap) do Wait(1) end

    SetMinimapComponentPosition('minimap', 'L', 'B', -0.0045, -0.012, 0.150, 0.188888)
    SetMinimapComponentPosition('minimap_mask', 'L', 'B', 0.020, 0.022, 0.111, 0.159)
    SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.03, 0.012, 0.266, 0.237)
    Wait(5000)
    SetRadarBigmapEnabled(true, false)
    Wait(0)
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

CreateThread(function() -- Speeding
    while true do
        if LocalPlayer.state.isLoggedIn then
            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped, false) then
                local speed = GetEntitySpeed(GetVehiclePedIsIn(ped, false)) * speedMultiplier
                local stressSpeed = seatbeltOn and config.MinimumSpeed or config.MinimumSpeedUnbuckled
                if speed >= stressSpeed then
                    TriggerServerEvent('hud:server:GainStress', math.random(1, 3))
                end
            end
        end
        Wait(10000)
    end
end)

local function IsWhitelistedWeapon(weapon)
    if weapon ~= nil then
        for _, v in pairs(config.WhitelistedWeapons) do
            if weapon == GetHashKey(v) then
                return true
            end
        end
    end
    return false
end

CreateThread(function() -- Shooting
    while true do
        if LocalPlayer.state.isLoggedIn then
            local ped = PlayerPedId()
            local weapon = GetSelectedPedWeapon(ped)
            if weapon ~= `WEAPON_UNARMED` then
                if IsPedShooting(ped) and not IsWhitelistedWeapon(weapon) then
                    if math.random() < config.StressChance then
                        TriggerServerEvent('hud:server:GainStress', math.random(1, 3))
                    end
                end
            else
                Wait(500)
            end
        end
        Wait(8)
    end
end)

-- Stress Screen Effects

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        if stress >= 100 then
            local ShakeIntensity = GetShakeIntensity(stress)
            local FallRepeat = math.random(2, 4)
            local RagdollTimeout = (FallRepeat * 1750)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
            SetFlash(0, 0, 500, 3000, 500)

            if not IsPedRagdoll(ped) and IsPedOnFoot(ped) and not IsPedSwimming(ped) then
                SetPedToRagdollWithFall(ped, RagdollTimeout, RagdollTimeout, 1, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
            end

            Wait(500)
            for i=1, FallRepeat, 1 do
                Wait(750)
                DoScreenFadeOut(200)
                Wait(1000)
                DoScreenFadeIn(200)
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
                SetFlash(0, 0, 200, 750, 200)
            end
        elseif stress >= config.MinimumStress then
            local ShakeIntensity = GetShakeIntensity(stress)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
            SetFlash(0, 0, 500, 2500, 500)
        end
        Wait(GetEffectInterval(stress))
    end
end)

function GetShakeIntensity(stresslevel)
    local retval = 0.05
    for k, v in pairs(config.Intensity['shake']) do
        if stresslevel >= v.min and stresslevel <= v.max then
            retval = v.intensity
            break
        end
    end
    return retval
end

function GetEffectInterval(stresslevel)
    local retval = 60000
    for k, v in pairs(config.EffectInterval) do
        if stresslevel >= v.min and stresslevel <= v.max then
            retval = v.timeout
            break
        end
    end
    return retval
end
