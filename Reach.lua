-- Megzons Reach GUI (Comeback)
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Megzons Mobile Hub - Comeback",
    LoadingTitle = "Megzons MPS GUI",
    LoadingSubtitle = "by Megzonshub",
    ConfigurationSaving = {
        Enabled = false,
    }
})

local Tab = Window:CreateTab("Reach", 4483362458)
local Tab2 = Window:CreateTab("Aimbot", 4483362458)
local Tab3 = Window:CreateTab("Powershot", 4483362458)

-- Variablen
_G.FootReach = 10
_G.GKReach = 10
_G.ArmReach = 10

-- Funktion für unsichtbare Hitbox
function createReach(part, size)
    if part:FindFirstChild("ReachHitbox") then
        part.ReachHitbox:Destroy()
    end
    local hitbox = Instance.new("Part")
    hitbox.Name = "ReachHitbox"
    hitbox.Size = Vector3.new(size, size, size)
    hitbox.Transparency = 1
    hitbox.Anchored = false
    hitbox.CanCollide = false
    hitbox.Massless = true
    hitbox.Parent = part
    local weld = Instance.new("WeldConstraint", hitbox)
    weld.Part0 = part
    weld.Part1 = hitbox
    hitbox.CFrame = part.CFrame
end

-- Sliders
Tab:CreateSlider({
    Name = "Foot Reach",
    Range = {1, 30},
    Increment = 1,
    Suffix = "Studs",
    CurrentValue = _G.FootReach,
    Callback = function(Value)
        _G.FootReach = Value
        local char = game.Players.LocalPlayer.Character
        if char then
            createReach(char:FindFirstChild("RightFoot") or char:FindFirstChild("Foot"), Value)
        end
    end,
})

Tab:CreateSlider({
    Name = "GK Reach",
    Range = {1, 30},
    Increment = 1,
    Suffix = "Studs",
    CurrentValue = _G.GKReach,
    Callback = function(Value)
        _G.GKReach = Value
        local char = game.Players.LocalPlayer.Character
        if char then
            createReach(char:FindFirstChild("LeftHand") or char:FindFirstChild("Hand"), Value)
        end
    end,
})

Tab:CreateSlider({
    Name = "Arm Reach",
    Range = {1, 30},
    Increment = 1,
    Suffix = "Studs",
    CurrentValue = _G.ArmReach,
    Callback = function(Value)
        _G.ArmReach = Value
        local char = game.Players.LocalPlayer.Character
        if char then
            createReach(char:FindFirstChild("RightHand") or char:FindFirstChild("Hand"), Value)
        end
    end,
})

-- Aimbot Button
Tab2:CreateButton({
    Name = "Aimbot Aktivieren",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Megzonshub/MPS-Mobile/main/Aimbot.lua"))()
    end,
})

-- Powershot Button
Tab3:CreateButton({
    Name = "Powershot Aktivieren",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Megzonshub/MPS-Mobile/main/Powershot.lua"))()
    end,
})
