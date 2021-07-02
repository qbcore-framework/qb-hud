isLoggedIn = false

Citizen.CreateThread(function()
    if QBCore ~= nil then
        TriggerEvent("hud:client:SetMoney")
        return
    end
end)

RegisterNetEvent("QBCore:Client:OnPlayerUnload")
AddEventHandler("QBCore:Client:OnPlayerUnload", function()
    isLoggedIn = false
    QBHud.Show = false
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    isLoggedIn = true
    QBHud.Show = true
end)