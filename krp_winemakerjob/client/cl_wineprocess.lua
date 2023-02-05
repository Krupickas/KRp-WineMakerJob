

exports.qtarget:AddCircleZone("processwine", vec3(-50.6082, 1898.8931, 195.1664), 0.95, {
    useZ = true,
    name = "processwine",
    debugPoly = false
}, {
    options = {
        {
            event = 'process_grepe',
            icon = "fas fa-creative-commons-nd",
            label = _U('process_wine'),
            job = 'winemaker'
        }
    },
    distance = 1.5
})

RegisterNetEvent('process_grepe', function(data)
    lib.registerContext({
        id = 'procesgrepes',
        title = _U('what_to_process'),
        menu = 'procesgrepes',
        options = {
            [_U('white_wine')] = {
                metadata = { _U('process_white_wine') },
                onSelect = function()
                    ESX.TriggerServerCallback('krp_winemaker_checkitems_forprocess2', function(ano)
                        if ano.prvy >= 3 then
                            if ano.druhy >= 1 then
                              TriggerServerEvent('krp_winemaker_processgrapes', 'white_wine')
                                local plasticbox = CreateObject('v_serv_plastic_box', -50.0128, 1898.6105, 195.15, true, true, true)
                                local grapefruit = CreateObject('prop_grapes_01', -50.7953, 1898.8839, 195.1660, true, true, true)
                                lib.progressBar({
                                    duration = 8000,
                                    label = _U('processing'),
                                    useWhileDead = false,
                                    canCancel = true,
                                    disable = {
                                        car = true,
                                        move = true,
                                    },
                                    anim = {
                                        dict = 'mini@repair',
                                        clip = 'fixing_a_ped'
                                    },
                                    prop = {
                                        model = `prop_wine_bot_01`,
                                        pos = vec3(0.15, -0.1, 0.05),
                                        rot = vec3(450.0, -340.0, -175.0)
                                    },
                                    bone = '18905'
                                })
                                
                                DeleteObject(plasticbox)
                                DeleteObject(grapefruit)
                            else
                                lib.notify({
                                    title = 'Process',
                                    description = _U('you_dont_have_enough_bottles'),
                                    type = 'error'
                                })
                            end
                        else
                            lib.notify({
                                title = 'Process',
                                description = _U('you_dont_have_enough_crushed_white'),
                                type = 'error'
                            })
                        end
                    end, 'crushed_white_grape', 'wine_bottle')
                end
            },
            [_U('red_wine')] = {
                metadata = { _U('process_red_wine') },
                onSelect = function()
                    ESX.TriggerServerCallback('krp_winemaker_checkitems_forprocess2', function(ano)
                        if ano.prvy >= 3 then
                            if ano.druhy >= 1 then
                              TriggerServerEvent('krp_winemaker_processgrapes', 'red_wine')
    
                                local plasticbox = CreateObject('v_serv_plastic_box', -50.0128, 1898.6105, 195.15, true, true, true)
                                local grapefruit = CreateObject('prop_grapes_01', -50.7953, 1898.8839, 195.1660, true, true, true)
                                lib.progressBar({
                                    duration = 8000,
                                    label = _U('processing'),
                                    useWhileDead = false,
                                    canCancel = true,
                                    disable = {
                                        car = true,
                                        move = true,
                                    },
                                    anim = {
                                        dict = 'mini@repair',
                                        clip = 'fixing_a_ped' 
                                    },
                                    prop = {
                                        model = `prop_wine_bot_01`,
                                        pos = vec3(0.15, -0.1, 0.05),
                                        rot = vec3(450.0, -340.0, -175.0)
                                    },
                                    bone = '18905'
                                })
                                
                                DeleteObject(plasticbox)
                                DeleteObject(grapefruit)
                            else
                                lib.notify({
                                    title = 'Process',
                                    description = _U('you_dont_have_enough_bottles'),
                                    type = 'error'
                                })
                            end
                        else
                            lib.notify({
                                title = 'Process',
                                description = _U('you_dont_have_enough_crushed_red'),
                                type = 'error'
                            })
                        end
                    end, 'crushed_grape', 'wine_bottle')
                end
            },
        }
    })
    lib.showContext('procesgrepes')
end)
