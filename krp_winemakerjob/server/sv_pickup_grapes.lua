TriggerEvent('esx_society:registerSociety', 'winemaker', 'WineMaker', 'society_winemaker', 'society_winemaker', 'society_winemaker', {type = 'private'})

RegisterServerEvent('krp_winemaker_pickupgrapes')
AddEventHandler('krp_winemaker_pickupgrapes', function(itemValue)
    local _source = source
    local _itemValue = itemValue
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem('grape', math.random(Config.GrapeRandom[1], Config.GrapeRandom[2]))
end)

RegisterServerEvent('krp_winemaker_pickupgrapes_white')
AddEventHandler('krp_winemaker_pickupgrapes_white', function(itemValue)
    local _source = source
    local _itemValue = itemValue
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem('white_grape', math.random(Config.GrapeRandom[1], Config.GrapeRandom[2]))
end)
