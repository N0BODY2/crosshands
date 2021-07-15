
local crosshands = false
RegisterNetEvent("crosshands")
AddEventHandler("crosshands", function()
  local playerped = PlayerPedId()
	if crosshands then
		ClearPedTasks(playerped)
		crosshands = false
	else
    TaskPlayAnim(playerped, dict, "base", 8.0, 8.0, -1, 50, 0, false, false, false)
		crosshands = true
	end
end)

Citizen.CreateThread(function()
  dict = "amb@world_human_hang_out_street@female_arms_crossed@base"
  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do
    Citizen.Wait(100)
  end
end)

RegisterKeyMapping('crosshands', 'Cross Hands', 'keyboard', 'G')
RegisterCommand('crosshands', function()
  TriggerEvent("crosshands")
end)