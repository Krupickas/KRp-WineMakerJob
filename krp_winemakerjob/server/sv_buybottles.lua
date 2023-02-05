ESX.RegisterServerCallback('krp:winemaker:buy:bottles', function(source, cb, price, item, pocet)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem(item, pocet)
        cb(true)
    else
        cb(false)    
    end
end)