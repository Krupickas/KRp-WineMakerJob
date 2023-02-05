Citizen.CreateThread(function()
    local boxik = CreateObject('prop_ld_crate_01', -1891.5934, 2085.7134, 139.9957, true, true, true)
    local tablek = CreateObject('prop_table_04', -50.4997, 1898.7261, 194.361, true, true, true)
    FreezeEntityPosition(boxik, true)
    FreezeEntityPosition(tablek, true)
end)


exports.qtarget:AddCircleZone("sqish_grapes", vec3(-1891.7982, 2085.6021, 141.1018), 1.20, {
    useZ = true,
    name = "sqish_grapes",
    debugPoly = false
}, {
    options = {
        {
            event = 'crush_grepe',
            icon = "fas fa-shoe-prints",
            label = _U('crush_grapes'),
            job = 'winemaker'
        }
    },
    distance = 1.5
})  


RegisterNetEvent('crush_grepe', function(data)
    lib.registerContext({
        id = 'crush_grapes',
        title = _U('crush_menu'),
        menu = 'crush_grapes',
        options = {
            [ _U('white_grape')] = {
                metadata = { _U('crush_grapes') },
                onSelect = function()
                    ESX.TriggerServerCallback('krp_winemaker_checkitems', function(ano)
                        if ano >= 5 then
                                TriggerServerEvent('krp_winemaker_crushgrapes', 'crushed_white_grape')
                                SetEntityCoords(PlayerPedId(), -1891.6608, 2085.6265, 141.1017, false, false, false, true)
                                lib.progressBar({
                                    duration = 5000,
                                    label = _U('crushing_grapes'),
                                    useWhileDead = false,
                                    canCancel = true,
                                    disable = {
                                        car = true,
                                        move = true
                                    },
                                    anim = {
                                        dict = 'amb@world_human_jog@male@base',
                                        clip = 'base'
                                    },
                                })
                                SetEntityCoords(PlayerPedId(), -1892.3751, 2086.5730, 140.9955, false, false, false, true)
                            else
                                lib.notify({
                                    title = 'ERROR',
                                    description = _U('dont_have_grapes'),
                                    type = 'error'
                                })
                            end 
                    end, 'white_grape')
                end
            },
            [ _U('red_grape')] = {
                metadata = { _U('crush_grapes') },
                onSelect = function()
                    ESX.TriggerServerCallback('krp_winemaker_checkitems', function(ano)
                        if ano >= 5 then
                                TriggerServerEvent('krp_winemaker_crushgrapes', 'crushed_grape')
                                SetEntityCoords(PlayerPedId(), -1891.6608, 2085.6265, 141.1017, false, false, false, true)
                                lib.progressBar({
                                    duration = 5000,
                                    label = _U('crushing_grapes'),
                                    useWhileDead = false,
                                    canCancel = true,
                                    disable = {
                                        car = true,
                                        move = true
                                    },
                                    anim = {
                                        dict = 'amb@world_human_jog@male@base',
                                        clip = 'base'
                                    },
                                })
                                SetEntityCoords(PlayerPedId(), -1892.3751, 2086.5730, 140.9955, false, false, false, true)
                            else
                                lib.notify({
                                    title = 'ERROR',
                                    description = _U('dont_have_grapes'),
                                    type = 'error'
                                })
                            end 
                    end, 'grape')
            end
            },
        }
    })
    lib.showContext('crush_grapes')
  end)
