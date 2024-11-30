RegisterNetEvent("Hyper:KickPlayer")
AddEventHandler("Hyper:KickPlayer", function()
    local playerId = source
    DropPlayer(playerId, Config.DropReason)
    print("[AFK-System] Players with ID " .. playerId .. " was kicked for inactivity.")
end)
-- Main Code

local function CheckForUpdates()
    PerformHttpRequest(Config.GitHubVersionURL, function(statusCode, response, headers)
        if statusCode == 200 then
            local githubVersion = response:match("^%s*(.-)%s*$")

            if githubVersion and githubVersion ~= Config.LocalVersion then
                print("^3[Update-Checker]^0 There is a new version: ^2" .. githubVersion .. "^0 (current: ^1" .. Config.LocalVersion .. "^0)")
                print("^3[Update-Checker]^0 Download the new version from GitHub: https://github.com/hyper0939/AFK/tree/main/Hyper-Afk")
            else
                print("^3[Update-Checker]^0 The script is up to date (Version: ^2" .. Config.LocalVersion .. "^0)")
            end
        else
            print("^1[Update-Checker]^0 Failed to get GitHub version. Status code: " .. statusCode)
        end
    end, "GET")
end

AddEventHandler("onResourceStart", function()
    CheckForUpdates()
end)
-- Github Checker