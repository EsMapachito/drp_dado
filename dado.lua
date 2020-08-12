-- RECURSO MODIFICADO PARA EL SERVIDOR RP DESPERADOSRP.COM --
-- Implementado por Mapachito --

RegisterNetEvent('drp_dado:sendProximityMessage')
AddEventHandler('drp_dado:sendProximityMessage', function(playerId, title, message, color)
	local player = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local playerPed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local playerCoords, targetCoords = GetEntityCoords(playerPed), GetEntityCoords(targetPed)

    if target == player or #(playerCoords - targetCoords) < 20 then
        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_PLAYER_PICKUP_WEAPON_THROWN_TOMAHAWK_ANCIENT'), -1, true, false, false, false)
        Wait(2500)
        TriggerEvent('chat:addMessage', {args = {title, message}, color = color})
	end
end)