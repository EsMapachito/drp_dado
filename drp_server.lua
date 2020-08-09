-- RECURSO MODIFICADO PARA EL SERVIDOR RP DESPERADOSRP.COM --
-- Implementado por Mapachito --
RegisterCommand('lanzar', function(source, args, rawCommand)
    local source = source
    local playerName
    args = table.concat(args, ' ')
    TriggerEvent("vorp:getCharacter", source, function(user)
        if user.lastname == nil then
            playerName = user.firstname
        else
            playerName = user.firstname..' '..user.lastname
        end
        TriggerClientEvent('drp_dado:sendProximityMessage', -1, source, "["..playerName.."] Lanza un dado, sacando un", math.ceil (math.random() + math.random(0, 5)), args, {255, 0, 0})
    end)
end, false)