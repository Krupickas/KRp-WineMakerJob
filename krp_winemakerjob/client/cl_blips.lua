local PlayerData
local PlayerJob

local createdBlips = {}

Citizen.CreateThread(function()
		while ESX == nil do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			Citizen.Wait(0)
		end
		
		while ESX.GetPlayerData().job == nil do
			Citizen.Wait(10)
		end
		
		PlayerData = ESX.GetPlayerData()
		PlayerJob = PlayerData.job
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	PlayerJob = PlayerData.job
	Wait(2000)
	loadBlips()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	PlayerJob = job
	for k,v in pairs(createdBlips) do
		RemoveBlip(v)
	end
	Wait(500)
	loadBlips()
end)



function loadBlips()
	print(getJob())
	for k,v in pairs(Config.Blips) do
		local canSee = false
		if #v.JobsThatSeesIt == 0 then
			canSee = true
		end
		for key,val in pairs(v.JobsThatSeesIt) do
			if val == getJob() then
				canSee = true
			end
		end
		if canSee then
			local blip = AddBlipForCoord(v.Coords.x, v.Coords.y, v.Coords.z)
			SetBlipSprite(blip, v.Blip.sprite)
			SetBlipDisplay(blip, 4)
			SetBlipScale(blip, v.Blip.size)
			SetBlipColour(blip, v.Blip.color)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(v.Blip.name)
			EndTextCommandSetBlipName(blip)
			table.insert(createdBlips, blip)
		end
	end
end

function getJob()
		PlayerJob = PlayerData.job
		return PlayerJob.name
end


--#MAINBLIP
Citizen.CreateThread(function()
    local blipMarker = Config.BlipsForEveryone.Blip
    local blipCoord = AddBlipForCoord(blipMarker.Pos.x, blipMarker.Pos.y, blipMarker.Pos.z)

    SetBlipSprite(blipCoord, blipMarker.Sprite)
    SetBlipDisplay(blipCoord, blipMarker.Display)
    SetBlipScale(blipCoord, blipMarker.Scale)
    SetBlipColour(blipCoord, blipMarker.Colour)
    SetBlipAsShortRange(blipCoord, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('VineYard Marlowe')
    EndTextCommandSetBlipName(blipCoord)
end)