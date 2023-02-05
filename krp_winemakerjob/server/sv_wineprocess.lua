ESX = nil

ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('krp_winemaker_processgrapes')
AddEventHandler('krp_winemaker_processgrapes', function(itemValue)
    local _source = source
    local _itemValue = itemValue

    if _itemValue == 'red_wine' then
        SetTimeout(8000, function()        

            local xPlayer = ESX.GetPlayerFromId(_source)

            local CrushedGrapeQuantity = xPlayer.getInventoryItem('crushed_grape').count

            local WineBottlesQuantity = xPlayer.getInventoryItem('wine_bottle').count
    
            if CrushedGrapeQuantity < 3 then
                xPlayer.showNotification("CLIENT SIDED")
            elseif
            WineBottlesQuantity < 1 then
                xPlayer.showNotification("CLIENT SIDED")
            else
                TriggerClientEvent('esx:showNotification', _source, _U('you_made_wine'))
                xPlayer.removeInventoryItem('wine_bottle', 1)
                xPlayer.removeInventoryItem('crushed_white_grape', 3)
                xPlayer.addInventoryItem('white_wine', 1)
            end
        end)
    elseif _itemValue == 'white_wine' then
        SetTimeout(8000, function()        

            local xPlayer = ESX.GetPlayerFromId(_source)
    
            local CrushedWhiteGrapeQuantity = xPlayer.getInventoryItem('crushed_white_grape').count

            local WineBottlesQuantity = xPlayer.getInventoryItem('wine_bottle').count
    
            if CrushedWhiteGrapeQuantity < 3 then
                xPlayer.showNotification("CLIENT SIDED")
            elseif
            WineBottlesQuantity < 1 then
                xPlayer.showNotification("CLIENT SIDED")
            else
                TriggerClientEvent('esx:showNotification', _source, _U('you_made_wine'))
                xPlayer.removeInventoryItem('wine_bottle', 1)
                xPlayer.removeInventoryItem('crushed_white_grape', 3)
                xPlayer.addInventoryItem('white_wine', 1)
            end
        end)
    end
 end)


 ESX.RegisterServerCallback('krp_winemaker_checkitems_forprocess', function(source, cb, item)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local items = xPlayer.inventory
    cb(exports.ox_inventory:Search(source, 'count', item))
  end)

  
  ESX.RegisterServerCallback('krp_winemaker_checkitems_forprocess2', function(source, cb, item, item2)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local items = xPlayer.inventory
    local prvy = exports.ox_inventory:Search(source, 'count', item)
    local druhy = exports.ox_inventory:Search(source, 'count', item2)
    local data = {prvy = prvy, druhy = druhy}

    cb(data)
  end)