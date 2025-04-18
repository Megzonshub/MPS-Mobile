-- Megzons MPS Reach Test GUI (Einfach & sichtbar)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local UICorner2 = Instance.new("UICorner")

-- GUI Einstellungen
ScreenGui.Name = "ReachGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Position = UDim2.new(0.35, 0, 0.4, 0)
Frame.Size = UDim2.new(0, 220, 0, 100)

UICorner.Parent = Frame

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
TextButton.Position = UDim2.new(0.1, 0, 0.25, 0)
TextButton.Size = UDim2.new(0, 180, 0, 50)
TextButton.Text = "Reach Test starten"

UICorner2.Parent = TextButton

-- Testfunktion
local function createReachHitbox()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local foot = character:FindFirstChild("RightFoot") or character:FindFirstChild("Right Leg")

    if foot then
        local reachPart = Instance.new("Part")
        reachPart.Name = "ReachHitbox"
        reachPart.Size = Vector3.new(10, 10, 10)
        reachPart.Transparency = 0.5
        reachPart.Anchored = false
        reachPart.CanCollide = false
        reachPart.BrickColor = BrickColor.new("Bright red")
        reachPart.Massless = true
        reachPart.Parent = character

        local weld = Instance.new("WeldConstraint")
        weld.Part0 = foot
        weld.Part1 = reachPart
        weld.Parent = reachPart

        reachPart.Position = foot.Position
        print("Reach Hitbox erstellt!")
    else
        warn("Kein Fuß gefunden!")
    end
end

-- Button klick
TextButton.MouseButton1Click:Connect(function()
    createReachHitbox()
end)
