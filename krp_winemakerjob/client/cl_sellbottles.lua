RegisterNetEvent('sell_wine_as_item', function(sellprice, redwinequantity)

    lib.registerContext({
        id = 'sellwine',
        title = _U('wine_bottle_buyer'),
        options = {
            {
                title = _U('red_wine'),
                icon = 'bottle-water',
                arrow = true,
                onSelect = function()
                    local input = lib.inputDialog(_U('how_much_to_sell'), {_U('how_much')})

                    if not input then return end
                    local lockerNumber = tonumber(input[1])
                    sellprice = Config.RedWinePrice
                    redwinequantity = tonumber(input[1])
                    sellpricetag = (sellprice * redwinequantity)
                    TriggerServerEvent("krp_winemaker:sellredwine",redwinequantity, sellpricetag)

            end
            },
            {
                title = _U('white_wine'),
                icon = 'bottle-water',
                arrow = true,
                onSelect = function()
                    local input = lib.inputDialog(_U('how_much_to_sell'), {_U('how_much')})

                    if not input then return end
                    local whitewine = tonumber(input[1])
                    sellpriceWhite = Config.WhiteWinePrice
                    whitewinequantity = tonumber(input[1])
                    sellpricetagWhite = (sellpriceWhite * whitewinequantity)
                    TriggerServerEvent("krp_winemaker:sellwhitewine",whitewinequantity, sellpricetagWhite)

            end
            },
        }
    })
    lib.showContext('sellwine')
end)

exports.qtarget:AddCircleZone("buy_bottler", vec3(223.1687, -176.3325, 57.9173), 0.75, {
    useZ = true,
    name = "buy_bottler",
    debugPoly = false
}, {
    options = {
        {
            event = 'sell_wine_as_item',
            icon = "fas fa-dollar-sign",
            label = _U('sell_bottles'),
            job = 'winemaker'
        }
    },
    distance = 1.5
})
