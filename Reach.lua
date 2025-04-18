-- Megzons Simple Reach GUI (funktioniert mit setReach)

-- setReach Funktion
_G.setReach = function(value)
    print("Setze Reach auf:", value)
    -- Hier kannst du deine echte Reach-Logik einsetzen
end

-- GUI erstellen
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local Button = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UICorner2 = Instance.new("UICorner")
local UICorner3 = Instance.new("UICorner")

ScreenGui.Name = "MegzonsReachGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.Position = UDim2.new(0.4, 0, 0.4, 0)
Frame.Size = UDim2.new(0, 250, 0, 140)
UICorner.Parent = Frame

TextBox.Parent = Frame
TextBox.PlaceholderText = "Reach-Wert z.B. 30"
TextBox.Text = ""
TextBox.Position = UDim2.new(0.1, 0, 0.2, 0)
TextBox.Size = UDim2.new(0, 200, 0, 40)
TextBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
UICorner2.Parent = TextBox

Button.Parent = Frame
Button.Text = "Setze Reach"
Button.Position = UDim2.new(0.1, 0, 0.6, 0)
Button.Size = UDim2.new(0, 200, 0, 40)
Button.BackgroundColor3 = Color3.fromRGB(80, 130, 180)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
UICorner3.Parent = Button

Button.MouseButton1Click:Connect(function()
    local input = tonumber(TextBox.Text)
    if input then
        _G.setReach(input)
    else
        warn("Ungültiger Reach-Wert")
    end
end)
