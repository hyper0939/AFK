Config = {}

Config.LocalVersion = "0.0.1"
Config.GitHubVersionURL = "https://github.com/hyper0939/AFK/tree/main"
-- Github

-- AFK
Config.AfkTimeLimit = 300 -- Seconds, 5 Minutes
Config.WarningTime = 15 -- 15 Seconds
Config.CheckAfk = 1000 -- 1 Second
Config.DropReason = "You were kicked for inactivity!"

Config.Notify = function(msg)
    TriggerEvent("delta_hud:notification", "success", "AFK-System", msg, 5000)
end