ESX = nil

ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('krp_winemaker_crushgrapes')
AddEventHandler('krp_winemaker_crushgrapes', function(itemValue)
    local _source = source
    local _itemValue = itemValue

    if _itemValue == 'crushed_grape' then
        SetTimeout(5000, function()        

            local xPlayer = ESX.GetPlayerFromId(_source)

            local aalephQuantity = xPlayer.getInventoryItem('grape').count

            if aalephQuantity < 5 then
                xPlayer.showNotification("...")
            else
                TriggerClientEvent('esx:showNotification', _source, _U('sucessfully_crushed'))
                xPlayer.removeInventoryItem('grape', 1)
                xPlayer.addInventoryItem('crushed_grape', 1)
            end
        end)
    elseif _itemValue == 'crushed_white_grape' then
        SetTimeout(5000, function()        
    
            local xPlayer = ESX.GetPlayerFromId(_source)
    
            local WhiteGrapeQuantity = xPlayer.getInventoryItem('white_grape').count
    
            if WhiteGrapeQuantity < 5 then
                xPlayer.showNotification("...")
            else
                TriggerClientEvent('esx:showNotification', _source, _U('sucessfully_crushed'))
                xPlayer.removeInventoryItem('white_grape', 5)
                xPlayer.addInventoryItem('crushed_white_grape', 1)
            end
        end)
    end
 end)


 ESX.RegisterServerCallback('krp_winemaker_checkitems', function(source, cb, item)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local items = xPlayer.inventory
    cb(exports.ox_inventory:Search(source, 'count', item))
  end)