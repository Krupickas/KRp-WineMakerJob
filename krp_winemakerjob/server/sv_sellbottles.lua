
-- red wine


RegisterServerEvent("krp_winemaker:sellredwine")
AddEventHandler("krp_winemaker:sellredwine", function(redwinequantity, sellpricetag)
	local xPlayer = ESX.GetPlayerFromId(source)
	local itemLabel = ESX.GetItemLabel('red_wine')
	if xPlayer.getInventoryItem('red_wine').count >= redwinequantity then
		xPlayer.addMoney(sellpricetag)
		xPlayer.removeInventoryItem('red_wine', redwinequantity)
		TriggerClientEvent("esx:showNotification",source,"You sold "..redwinequantity.."x "..'Red Wine    '.."for $"..sellpricetag.."")
	else
		TriggerClientEvent('esx:showNotification', source, _U('you_need_more_bottles'))
	end
end)


-- red wine


RegisterServerEvent("krp_winemaker:sellwhitewine")
AddEventHandler("krp_winemaker:sellwhitewine", function(whitewinequantity, sellpricetagWhite)
	local xPlayer = ESX.GetPlayerFromId(source)
	local itemLabel = ESX.GetItemLabel('white_wine')
	if xPlayer.getInventoryItem('white_wine').count >= whitewinequantity then
		xPlayer.addMoney(sellpricetagWhite)
		xPlayer.removeInventoryItem('white_wine', whitewinequantity)
		TriggerClientEvent("esx:showNotification",source,"You sold ".."x "..'White wine   '.."for $"..sellpricetagWhite.."")
	else
		TriggerClientEvent('esx:showNotification', source, _U('you_need_more_bottles'))
	end
end)
