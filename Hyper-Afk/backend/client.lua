local isAfk = false
local lastActivity = GetGameTimer()
local warningShown = false

CreateThread(function()
    while true do
        Wait(Config.CheckAfk)

        if IsControlJustPressed(0, 1) or IsControlJustPressed(0, 2) or IsPedInAnyVehicle(PlayerPedId(), false) or IsPlayerFreeAiming(PlayerId()) then
            lastActivity = GetGameTimer()
            if warningShown then
                warningShown = true
                Config.Notify("AFK warning lifted. You're active again!")
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(Config.CheckAfk)
        
        local currentTime = GetGameTimer()
        local timeInactive = (currentTime - lastActivity) / 1000

        if timeInactive >= Config.AfkTimeLimit then
            if not isAfk then
                isAfk = true
                TriggerServerEvent("Hyper:KickPlayer")
            end
        elseif timeInactive >= (Config.AfkTimeLimit - Config.WarningTime) and not warningShown then
            warningShown = true
            Config.Notify("You are inactive! You will be in " .. Config.WarningTime .. " kicked for seconds if you do nothing!")
        end
    end
end)
-- Main Code