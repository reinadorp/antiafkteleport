Citizen.CreateThread(function()
	local tiempo = Config.afkTime
	while true do
		Wait(1000)
		local ped = PlayerPedId()
		print(tiempo)
		if ped then
			local PossActual = GetEntityCoords(ped, true)
			if PossActual == PossPrevia then
				if tiempo > 0 then
					if tiempo == Config.warningTime  then
						TriggerEvent('chat:addMessage', { args = { Config.warning } }) -- print chat message
					end
					tiempo = tiempo - 1
				else
					TriggerEvent('chat:addMessage', { args = { Config.messageteleport } }) -- print chat message
          SetEntityCoords(ped, Config.coords.x, Config.coords.y, Config.coords.z, 0.0, 0.0, 0.0, false)
				end
			else
				tiempo = Config.afkTime
			end
			PossPrevia = PossActual
		end
	end
end)
