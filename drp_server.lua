-- RECURSO MODIFICADO PARA EL SERVIDOR RP DESPERADOSRP.COM --
-- Implementado por Mapachito --
RegisterCommand('lanzar', function(source, args, rawCommand)
    local _source = source
    TriggerEvent("vorp:getCharacter", _source, function(user)
        local playerName = user.firstname..' '..user.lastname
        TriggerClientEvent('drp_dado:sendProximityMessage', -1, _source, "["..playerName.."]:", "Lanza un dado, sacando un "..math.ceil(math.random() + math.random(0, 5)), {255, 0, 0})
    end)
end, false)