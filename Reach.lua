-- Megzons Reach GUI für MPS 4-A-SIDE
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()

local Window = Rayfield:CreateWindow({
    Name = "Megzons Mobile Hub",
    LoadingTitle = "MPS 4-A-SIDE",
    LoadingSubtitle = "Reach GUI by Megzonshub",
    ConfigurationSaving = {
        Enabled = false
    }
})

local ReachTab = Window:CreateTab("Reach", 4483362458)

ReachTab:CreateSlider({
    Name = "Foot Reach",
    Range = {1, 30},
    Increment = 1,
    Suffix = "Studs",
    CurrentValue = 10,
    Callback = function(val)
        local hitbox = char:FindFirstChild("HumanoidRootPart"):FindFirstChild("FootHitbox")
        if hitbox then
            hitbox.Size = Vector3.new(val, val, val)
        else
            local box = Instance.new("Part", char.HumanoidRootPart)
            box.Name = "FootHitbox"
            box.Anchored = false
            box.CanCollide = false
            box.Transparency = 1
            box.Size = Vector3.new(val, val, val)
            box.Massless = true

            local weld = Instance.new("WeldConstraint", box)
            weld.Part0 = char.HumanoidRootPart
            weld.Part1 = box
        end
    end
})
