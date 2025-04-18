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
TextButton.Position = UDim2.new(0
