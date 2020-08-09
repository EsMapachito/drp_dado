-- RECURSO MODIFICADO PARA EL SERVIDOR RP DESPERADOSRP.COM --
-- Implementado por Mapachito --
local keys = { ['G'] = 0x760A9C6F, ['S'] = 0xD27782E3, ['W'] = 0x8FD015D8, ['H'] = 0x24978A28, ['G'] = 0x5415BE48, ["ENTER"] = 0xC7B5340A, ['E'] = 0xDFF812F9,["BACKSPACE"] = 0x156F7119 }

local usergroup = 'user'

Citizen.CreateThread(function()
    TriggerEvent("vorp:ExecuteServerCallBack", "getGroupReport", function(group)
        usergroup = group
    end, 'i')
end)

RegisterNetEvent('drp_dado:sendProximityMessage')
AddEventHandler('drp_dado:sendProximityMessage', function(playerId, title, message, color)
	local player = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local playerPed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local playerCoords, targetCoords = GetEntityCoords(playerPed), GetEntityCoords(targetPed)

	if target == player or #(playerCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {args = {title, message}, color = color})
	end
end)

--- Animación:

--RegisterCommand("rio", function(source, args, rawCommand) -- slash COMMAND
AddEventHandler('drp_dado:sendProximityMessage', function()
    local _source = source
            if rio ~= 0 then
                SetEntityAsMissionEntity(rio)
                DeleteObject(nativerioprop)
                rio = 0
                end
                local playerPed = PlayerPedId()
                Citizen.Wait(0)
                ClearPedTasksImmediately(PlayerPedId())
                TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_PLAYER_PICKUP_WEAPON_THROWN_TOMAHAWK_ANCIENT'), -1, true, false, false, false)
                local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
                --local prop = CreateObject(GetHashKey("p_shavingbox01x"), x, y, z, true, false, true)
                SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
                PlaceObjectOnGroundProperly(prop)
                rio = prop
    
    --end, false)
end)

Citizen.CreateThread(function()
    while true do
	local playerPed = PlayerPedId()
        Citizen.Wait(0)
		
        if whenKeyJustPressed(keys['BACKSPACE']) then --RETROCESO PARA DETENER ACCIÓN
            if rio ~= 0 then
            SetEntityAsMissionEntity(rio)
            DeleteObject(rio)
			ClearPedTasksImmediately(PlayerPedId())
            rio = 0
            end
     end
	end
end)

function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end