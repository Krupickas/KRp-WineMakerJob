-- red wine
RegisterServerEvent('krp:winemaker:sell:red_wine')
AddEventHandler('krp:winemaker:sell:red_wine', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local redw = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "red_wine" then
			redw = item.count
		end
	end
    
    if redw > 0 then
        xPlayer.removeInventoryItem('red_wine', 10)
        xPlayer.addMoney(Config.RedWinePrice)
    else 
		TriggerClientEvent('esx:showNotification', _source, _U('you_need_more_bottles'))
    end
end)

-----white wine

RegisterServerEvent('krp:winemaker:sell:white_wine')
AddEventHandler('krp:winemaker:sell:white_wine', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local whitew = 0

	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]

		if item.name == "white_wine" then
			dwhitew = item.count
		end
	end
    
    if whitew > 0 then
        xPlayer.removeInventoryItem('white_wine', 10)
        xPlayer.addMoney(Config.WhiteWinePrice)
    else 
		TriggerClientEvent('esx:showNotification', _source, _U('you_need_more_bottles'))
    end
end)
