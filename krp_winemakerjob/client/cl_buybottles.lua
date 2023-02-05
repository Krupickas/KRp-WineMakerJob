--shoporignal
RegisterNetEvent('zakoupeni:prazdne:flasky', function()

    lib.registerContext({
        id = 'flasky',
        title = _U('wine_bottles_seller'),
        options = {
            {
                title = _U('wine_bottle'),
                icon = 'bottle-water',
                arrow = true,
                onSelect = function()
                    local inputpocet = lib.inputDialog(('dialog_title'), { ('quantity') })
                    if inputpocet then
                        TriggerEvent('prazdne:flasky:zakupuje', inputpocet[1])
                    end
                end
            },
        }
    })
    lib.showContext('flasky')
end)

RegisterNetEvent('prazdne:flasky:zakupuje')
AddEventHandler('prazdne:flasky:zakupuje', function(pocet)
    local price = Config.BottlePrice * pocet
    ESX.TriggerServerCallback("krp:winemaker:buy:bottles", function(beybottels)
        if beybottels then
            local success = lib.progressCircle({
                duration = 5300,
                position = 'bottom',
                useWhileDead = false,
                canCancel = false,
                disable = {
                    car = true,
                },
                anim = {
                    dict = 'misscarsteal4@actor',
                    clip = 'actor_berating_loop'
                },
            })

            Wait(50)
            FreezeEntityPosition(PlayerPedId(), false)
            ClearPedTasks(PlayerPedId())
        else
            lib.notify({
                title = 'ERROR',
                description = _U('you_dont_have_enought_money'),
                type = 'error'
            })
        end
    end, price, 'wine_bottle', pocet)
end)


exports.qtarget:AddCircleZone("buy_bottler", vec3(134.8698, 323.6442, 116.6335), 0.75, {
    useZ = true,
    name = "buy_bottler",
    debugPoly = false
}, {
    options = {
        {
            event = 'zakoupeni:prazdne:flasky',
            icon = "fas fa-wine-bottle",
            label = _U('wine_bottles_seller_eye'),
            job = 'winemaker'
        }
    },
    distance = 1.5
})