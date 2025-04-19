-- Megzons Custom GUI Test
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Button = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "MegzonsTestGui"

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Active = true
Frame.Draggable = true

Title.Parent = Frame
Title.Text = "Megzons GUI Test"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

Button.Parent = Frame
Button.Text = "Klick mich!"
Button.Position = UDim2.new(0.25, 0, 0.5, 0)
Button.Size = UDim2.new(0.5, 0, 0.3, 0)
Button.BackgroundColor3 = Color3.fromRGB(80, 80, 255)
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.Gotham
Button.TextSize = 16
Button.MouseButton1Click:Connect(function()
    print("Button funktioniert! GUI ist geladen.")
end)
