local speed = 0.0
local seatbeltOn = false
local cruiseOn = false
local radarActive = false
local bleedingPercentage = 0
local hunger = 100
local thirst = 100

function CalculateTimeToDisplay()
	hour = GetClockHours()
    minute = GetClockMinutes()
    
    local obj = {}
    
	if minute <= 9 then
		minute = "0" .. minute
    end
    
    obj.hour = hour
    obj.minute = minute

    return obj
end

Citizen.CreateThread(function()
    Citizen.Wait(500)
    while true do 
        if QBCore ~= nil and isLoggedIn and QBHud.Show then
            speed = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false)) * 2.23694
            local pos = GetEntityCoords(PlayerPedId())
            local time = CalculateTimeToDisplay()
            local street1, street2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
            local fuel = exports['LegacyFuel']:GetFuel(GetVehiclePedIsIn(PlayerPedId()))
            SendNUIMessage({
                action = "hudtick",
                show = IsPauseMenuActive(),
                health = GetEntityHealth(PlayerPedId()),
                armor = GetPedArmour(PlayerPedId()),
                thirst = thirst,
                hunger = hunger,
                bleeding = bleedingPercentage,
                direction = GetDirectionText(GetEntityHeading(PlayerPedId())),
                street1 = GetStreetNameFromHashKey(street1),
                street2 = GetStreetNameFromHashKey(street2),
                speed = math.ceil(speed),
                fuel = fuel,
                time = time,
            })
            Citizen.Wait(500)
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(1000)
        if IsPedInAnyVehicle(PlayerPedId()) and isLoggedIn and QBHud.Show then
            DisplayRadar(true)
            SendNUIMessage({
                action = "car",
                show = true,
            })
            radarActive = true
        else
            DisplayRadar(false)
            SendNUIMessage({
                action = "car",
                show = false,
            })
            seatbeltOn = false
            cruiseOn = false

            SendNUIMessage({
                action = "seatbelt",
                seatbelt = seatbeltOn,
            })

            SendNUIMessage({
                action = "cruise",
                cruise = cruiseOn,
            })
            radarActive = false
        end
    end
end)

RegisterNetEvent("hud:client:UpdateNeeds")
AddEventHandler("hud:client:UpdateNeeds", function(newHunger, newThirst)
    hunger = newHunger
    thirst = newThirst
end)

RegisterNetEvent("seatbelt:client:ToggleSeatbelt")
AddEventHandler("seatbelt:client:ToggleSeatbelt", function()
    seatbeltOn = not seatbeltOn
    SendNUIMessage({
        action = "seatbelt",
        seatbelt = seatbeltOn,
    })
end)

RegisterNetEvent("seatbelt:client:ToggleCruise")
AddEventHandler("seatbelt:client:ToggleCruise", function()
    cruiseOn = not cruiseOn
    SendNUIMessage({
        action = "cruise",
        cruise = cruiseOn,
    })
end)

Citizen.CreateThread(function()
    while true do
        if isLoggedIn and QBHud.Show and QBCore ~= nil then
            QBCore.Functions.TriggerCallback('hospital:GetPlayerBleeding', function(playerBleeding)
                if playerBleeding == 0 then
                    bleedingPercentage = 0
                elseif playerBleeding == 1 then
                    bleedingPercentage = 25
                elseif playerBleeding == 2 then
                    bleedingPercentage = 50
                elseif playerBleeding == 3 then
                    bleedingPercentage = 75
                elseif playerBleeding == 4 then
                    bleedingPercentage = 100
                end
            end)
        end

        Citizen.Wait(2500)
    end
end)

function GetDirectionText(heading)
    if ((heading >= 0 and heading < 45) or (heading >= 315 and heading < 360)) then
        return "North"
    elseif (heading >= 45 and heading < 135) then
        return "South"
    elseif (heading >=135 and heading < 225) then
        return "East"
    elseif (heading >= 225 and heading < 315) then
        return "West"
    end
end