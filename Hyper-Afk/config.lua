Config = {}

Config.LocalVersion = "0.0.2"
Config.GitHubVersionURL = "https://raw.githubusercontent.com/hyper0939/AFK/refs/heads/main/Hyper-Afk/version.txt"
-- Github

-- AFK
Config.AfkTimeLimit = 300 -- Seconds, 5 Minutes
Config.WarningTime = 15 -- 15 Seconds
Config.CheckAfk = 1000 -- 1 Second
Config.DropReason = "You were kicked for inactivity!"

Config.Notify = function(msg)
    TriggerEvent("delta_hud:notification", "success", "AFK-System", msg, 5000)
end