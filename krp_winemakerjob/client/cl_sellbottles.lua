RegisterNetEvent('sell_wine_as_item', function()

    lib.registerContext({
        id = 'sellwine',
        title = _U('wine_bottle_buyer'),
        options = {
            {
                title = _U('red_wine'),
                icon = 'bottle-water',
                arrow = true,
                onSelect = function()
                    lib.progressCircle({
                        duration = 5300,
                        position = 'bottom',
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            car = true,
                            move = true,
                        },
                        anim = {
                            dict = 'misscarsteal4@actor',
                            clip = 'actor_berating_loop'
                        },
                    })
                        TriggerServerEvent('krp:winemaker:sell:red_wine')
            end
            },
            {
                title = _U('white_wine'),
                icon = 'bottle-water',
                arrow = true,
                onSelect = function()
                    lib.progressCircle({
                        duration = 5300,
                        position = 'bottom',
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            car = true,
                            move = true,
                        },
                        anim = {
                            dict = 'misscarsteal4@actor',
                            clip = 'actor_berating_loop'
                        },
                    })
                        TriggerServerEvent('krp:winemaker:sell:white_wine')
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
