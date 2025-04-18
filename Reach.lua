-- Megzons MPS Reach Test GUI (Einfach & sichtbar)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Funktion um die Reach zu setzen
_G.SetReach = function(range)
    print("Reach wurde auf ".. tostring(range) .. " Studs gesetzt.")
    -- Hier deine Reach-Logik einfügen
end

-- GUI erstellen
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextBox = Instance.new("TextBox")
local SetButton = Instance.new("TextButton")

ScreenGui.Name = "ReachGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Position = UDim2.new(0.35, 0, 0.4, 0)
Frame.Size = UDim2.new(0, 220, 0, 100)
UICorner.Parent = Frame

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.Position = UDim2.new(0.1, 0, 0.2, 0)
TextBox.Size = UDim2.new(0, 180, 0, 30)
TextBox.PlaceholderText = "Gib Reach ein (z. B. 50)"
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)

SetButton.Parent = Frame
SetButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
SetButton.Position = UDim2.new(0.1, 0, 0.6, 0)
SetButton.Size = UDim2.new(0, 180, 0, 30)
SetButton.Text = "Setze Reach"

SetButton.MouseButton1Click:Connect(function()
    local value = tonumber(TextBox.Text)
    if value then
        _G.SetReach(value)
    else
        warn("Ungültiger Reach-Wert")
    end
end)
