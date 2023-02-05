local spawnedvehicle = false
local CurrentActionData, Blips, PlayerData = {}, {}, {}
local PlayerData, GUI, CurrentActionData, JobBlips = {}, {}, {}, {}

ESX = nil

ESX = exports["es_extended"]:getSharedObject()

exports.qtarget:AddCircleZone("spawn_vehicle", vec3(-1901.4703, 2060.5876, 140.8606), 0.75, {
    useZ = true,
    name = "spawn_vehicle",
    debugPoly = false
}, {
    options = {
        {
            action = function()
                local pedmodel = 'csb_hao'
                local coords = Config.Coords[math.random(1,#Config.Coords)]
                local companyvehicle = Config.CompanyVehicle
                if not spawnedvehicle then
                    lib.progressBar({
                        duration = 2000,
                        label = _U('calling_rent'),
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            car = true,
                        },
                    })
                    RequestModel(GetHashKey(pedmodel))
                    while not HasModelLoaded(GetHashKey(pedmodel)) do
                        Wait(15)
                    end
                    ClearAreaOfVehicles(coords.x, coords.y, coords.z, 15.0, false, false, false, false, false)
                    ESX.Game.SpawnVehicle(companyvehicle, vec3(coords.x, coords.y, coords.z), coords.w, function(vehicle)
                        spawnedvehicle = true
                        SetEntityAsMissionEntity(vehicle, true, true)
                        SetVehicleOnGroundProperly(vehicle)
                        --PED 1
                        local ped = CreatePedInsideVehicle(vehicle, 4, GetHashKey(pedmodel), -1, true, true)
                        TaskVehicleDriveToCoordLongrange(ped, vehicle, -1907.3188, 2056.9617, 140.7383,
                        GetVehicleModelMaxSpeed(GetHashKey(companyvehicle)) / 2, 786603, 7.0)
                        lib.progressBar({
                            duration = 19000,
                            label = '...',
                            useWhileDead = false,
                            canCancel = false,
                            disable = {
                                car = true,
                            },
                        })
                        TaskLeaveVehicle(ped, vehicle, 0)
                        Wait(3000)
                        DeletePed(ped)
                end)
            else
                lib.notify({
                    title = 'ERROR',
                    description = _U('vehicle_is_already_rented'),
                    type = 'error'
                })
            end
            end,
            icon = "fas fa-phone-volume",
            label = _U('rent_vehicle'),
            job = 'winemaker'
        },
        {
            action = function()
                if spawnedvehicle then
                    ESX.Game.DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                    spawnedvehicle = false
                else
                    lib.notify({
                        title = 'ERROR',
                        description = _U('you_dont_have_anything_to_return'),
                        type = 'error'
                    })
                end
            end,
            icon = "fas fa-phone-volume",
            label = _U('return_vehicle'),
            job = 'winemaker'
        }
    },
    distance = 3.5
})

--NPC
local coordonate = {
    { -1901.4703, 2060.5876, 139.8606, "", 129.7422, 0x07DD91AC, "a_m_m_eastsa_02" },
    { 134.8698, 323.6442, 115.6335, "", 210.1379, 0x0F977CEB, "s_m_y_chef_01" },
    { 223.2490, -176.2969, 56.9173, "", 71.6830, 0xA9EB0E42, "a_m_m_golfer_01" }
}
Citizen.CreateThread(function()

    for _, v in pairs(coordonate) do
        RequestModel(GetHashKey(v[7]))
        while not HasModelLoaded(GetHashKey(v[7])) do
            Wait(1)
        end

        RequestAnimDict("amb@world_human_leaning@male@wall@back@smoking@base")
        while not HasAnimDictLoaded("amb@world_human_leaning@male@wall@back@smoking@base") do
            Wait(1)
        end
        ped = CreatePed(4, v[6], v[1], v[2], v[3], 3374176, false, true)
        SetEntityHeading(ped, v[5])
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        TaskPlayAnim(ped, "amb@world_human_leaning@male@wall@back@smoking@base", "base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    end
end)

