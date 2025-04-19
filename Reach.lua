-- Megzons Reach GUI (Arceus X Neo kompatibel)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local ReachBox = Instance.new("TextBox")
local SetButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "MegzonsReach"
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 200, 0, 140)
Frame.Position = UDim2.new(0.35, 0, 0.4, 0)
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
UICorner.Parent = Frame

TextLabel.Parent = Frame
TextLabel.Text = "Reach-Wert eingeben:"
TextLabel.Size = UDim2.new(1, 0, 0, 30)
TextLabel.BackgroundTransparency = 1
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.Font = Enum.Font.Gotham
TextLabel.TextSize = 14

ReachBox.Parent = Frame
ReachBox.PlaceholderText = "z.B. 30"
ReachBox.Size = UDim2.new(0.8, 0, 0, 30)
ReachBox.Position = UDim2.new(0.1, 0, 0.35, 0)
ReachBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ReachBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ReachBox.Font = Enum.Font.Gotham
ReachBox.TextSize = 14
UICorner:Clone().Parent = ReachBox

SetButton.Parent = Frame
SetButton.Text = "SetReach"
SetButton.Size = UDim2.new(0.8, 0, 0, 30)
SetButton.Position = UDim2.new(0.1, 0, 0.7, 0)
SetButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
SetButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SetButton.Font = Enum.Font.GothamBold
SetButton.TextSize = 14
UICorner:Clone().Parent = SetButton

-- Funktion zum Anwenden des Reach-Werts
SetButton.MouseButton1Click:Connect(function()
    local reach = tonumber(ReachBox.Text)
    if reach and type(setReach) == "function" then
        setReach(reach)
    else
        warn("Ungültiger Wert oder setReach nicht vorhanden.")
    end
end)
