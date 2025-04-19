-- Megzons Reach GUI (Final für MPS 4-A-SIDE)
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local function createFootHitbox(size)
    if Character:FindFirstChild("FootHitbox") then
        Character.FootHitbox:Destroy()
    end

    local foot = Character:FindFirstChild("RightFoot") or Character:FindFirstChild("Right Leg")
    if foot then
        local hitbox = Instance.new("Part")
        hitbox.Name = "FootHitbox"
        hitbox.Size = Vector3.new(size, size, size)
        hitbox.Transparency = 1
        hitbox.Anchored = false
        hitbox.CanCollide = false
        hitbox.Massless = true
        hitbox.Parent = Character

        local weld = Instance.new("WeldConstraint")
        weld.Part0 = foot
        weld.Part1 = hitbox
        weld.Parent = hitbox
    end
end

local Window = Rayfield:CreateWindow({
    Name = "Megzons Reach GUI",
    LoadingTitle = "Megzons Mobile",
    LoadingSubtitle = "by Megzonshub",
    ConfigurationSaving = {
        Enabled = false,
    }
})

local Tab = Window:CreateTab("Reach", 4483362458)

Tab:CreateSlider({
    Name = "Foot Reach",
    Range = {1, 30},
    Increment = 1,
    Suffix = "Studs",
    CurrentValue = 10,
    Callback = function(Value)
        createFootHitbox(Value)
    end,
})
