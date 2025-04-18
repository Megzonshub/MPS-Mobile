-- Megzons MPS Reach GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local UICorner2 = Instance.new("UICorner")

-- Funktion zum Setzen der Reach
function setReach(amount)
    print("Reach gesetzt auf:", amount)
    -- Hier kannst du später deine echte Reach-Logik einbauen
end

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
TextButton.Position = UDim2.new(0.2, 0, 0.25, 0)
TextButton.Size = UDim2.new(0, 140, 0, 50)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Set Reach auf 45"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 18.0
UICorner2.Parent = TextButton

-- Button Funktion
TextButton.MouseButton1Click:Connect(function()
    setReach(45)
end)
