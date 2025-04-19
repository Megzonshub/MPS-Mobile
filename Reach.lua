-- Megzons MPS GUI (Ohne Keysystem) für Arceus X Neo
loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
    Name = "Megzons MPS Hub",
    LoadingTitle = "MPS Mobile",
    LoadingSubtitle = "by Megzonshub",
    ConfigurationSaving = {
        Enabled = false,
    }
})

local reachValues = {
    Foot = 2,
    GK = 2,
    Arm = 2
}

-- Tab: Reach Settings
local ReachTab = Window:CreateTab("Reach", 4483362458)
ReachTab:CreateSlider({
    Name = "Foot Reach",
    Range = {1, 30},
    Increment = 1,
    CurrentValue = reachValues.Foot,
    Callback = function(Value)
        reachValues.Foot = Value
    end,
})
ReachTab:CreateSlider({
    Name = "GK Reach",
    Range = {1, 30},
    Increment = 1,
    CurrentValue = reachValues.GK,
    Callback = function(Value)
        reachValues.GK = Value
    end,
})
ReachTab:CreateSlider({
    Name = "Arm Reach",
    Range = {1, 30},
    Increment = 1,
    CurrentValue = reachValues.Arm,
    Callback = function(Value)
        reachValues.Arm = Value
    end,
})
ReachTab:CreateButton({
    Name = "Apply Reach",
    Callback = function()
        if setReach then
            setReach(reachValues.Foot, reachValues.GK, reachValues.Arm)
        else
            warn("setReach-Funktion nicht gefunden")
        end
    end,
})

-- Tab: Aimbot
Window:CreateTab("Aimbot", 4483362458):CreateToggle({
    Name = "Aimbot aktivieren",
    CurrentValue = false,
    Callback = function(state)
        print("Aimbot: ", state)
    end,
})

-- Tab: Powershot
Window:CreateTab("Powershot", 4483362458):CreateToggle({
    Name = "Powershot aktivieren",
    CurrentValue = false,
    Callback = function(state)
        print("Powershot: ", state)
    end,
})

-- Tab: Anti-Kick
Window:CreateTab("Anti-Kick", 4483362458):CreateToggle({
    Name = "Anti-Kick aktivieren",
    CurrentValue = false,
    Callback = function(state)
        print("Anti-Kick: ", state)
    end,
})

-- Dummy setReach Funktion (zum Testen – anpassen wenn du deine eigene hast)
function setReach(foot, gk, arm)
    print("Reach angewendet: Foot =", foot, "GK =", gk, "Arm =", arm)
end
