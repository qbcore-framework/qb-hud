QBCore.Commands.Add('cash', 'Check Cash Balance', {}, false, function(source, args)
	TriggerClientEvent('hud:client:ShowMoney', source, 'cash')
end)

QBCore.Commands.Add('bank', 'Check Bank Balance', {}, false, function(source, args)
	TriggerClientEvent('hud:client:ShowMoney', source, 'bank')
end)