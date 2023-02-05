
function IsGradeBoss()
    if PlayerData ~= nil then
        local IsGradeBoss = false
        if PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'viceboss' then
            IsGradeBoss = true
        end
        return IsGradeBoss
    end
end



exports.qtarget:AddCircleZone("grab_grapes", vec3(-1877.3103, 2137.1990, 126.4061), 35.75, {
    useZ = true,
    name = "grab_grapes",
    debugPoly = false
}, {
    options = {
        {
            action = function()

                lib.progressBar({
                    duration = 4000,
                    label = _U('u_picking_grapes'),
                    useWhileDead = false,
                    canCancel = false,
                    disable = {
                        car = true,
                        move = true,
                    },
                    anim = {
                        dict = 'misshair_shop@hair_dressers',
                        clip = 'keeper_hair_cut_a' 
                    },
                    prop = {
                        model = `prop_cs_scissors`,
                        pos = vec3(0.12, 0.0, 0.0),
                        rot = vec3(0.0, 0.0, 0.0) ,
                    },
                    bone = '18905'
                })

                TriggerServerEvent('krp_winemaker_pickupgrapes', 'grape')
            end,
            icon = "fas fa-door-open",
            label = _U('pick_grapes'),
            job = 'winemaker'
        }
    },
    distance = 1.0
})


exports.qtarget:AddCircleZone("grab_grapes_white", vec3(-1916.8090, 1941.1378, 159.7859), 35.75, {
    useZ = true,
    name = "grab_grapes_white",
    debugPoly = false
}, {
    options = {
        {
            action = function()

                lib.progressBar({
                    duration = 4000,
                    label = _U('u_picking_grapes'),
                    useWhileDead = false,
                    canCancel = false,
                    disable = {
                        car = true,
                        move = true,
                    },
                    anim = {
                        dict = 'misshair_shop@hair_dressers',
                        clip = 'keeper_hair_cut_a' 
                    },
                    prop = {
                        model = `prop_cs_scissors`,
                        pos = vec3(0.12, 0.0, 0.0),
                        rot = vec3(0.0, 0.0, 0.0) ,
                    },
                    bone = '18905'
                })

                TriggerServerEvent('krp_winemaker_pickupgrapes_white', 'white_grape')
            end,
            icon = "fas fa-hand",
            label = _U('pick_grapes'),
            job = 'winemaker'
        }
    },
    distance = 1.0
})      


--bossmenu
exports.qtarget:AddCircleZone("bossmenu", vec3(-1897.7615, 2068.8508, 140.4808), 0.75, {
    useZ = true,
    name = "bossmenu",
    debugPoly = false
}, {
    options = {
        {
            action = function()
                if Config.esxsociety then
                    TriggerEvent('esx_society:openBossMenu', 'winemaker', function(data, menu)
                    end, { wash = false }) -- disable washing money
                end
            end,
            icon = "fas fa-credit-card",
            label = _U('boss_menu')
        }
    },
    distance = 1.5
})