-- Megzons MPS Key-Loader (OHNE Rayfield, 100% Handy-kompatibel)
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Key
local correctKey = game:HttpGet("https://raw.githubusercontent.com/Megzonshub/MPS-Mobile/main/key.txt")

-- GUI erstellen
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "MegzonsKeyGui"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 8)

local TextBox = Instance.new("TextBox", Frame)
TextBox.Size = UDim2.new(0.8, 0, 0, 40)
TextBox.Position = UDim2.new(0.1, 0, 0.25, 0)
TextBox.PlaceholderText = "Key hier eingeben"
TextBox.Text = ""
TextBox.ClearTextOnFocus = false
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextScaled = true

local Button = Instance.new("TextButton", Frame)
Button.Size = UDim2.new(0.8, 0, 0, 35)
Button.Position = UDim2.new(0.1, 0, 0.65, 0)
Button.Text = "Bestätigen"
Button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextScaled = true

-- Funktion bei Klick
Button.MouseButton1Click:Connect(function()
	if TextBox.Text:lower() == correctKey:lower() then
		Button.Text = "Key korrekt!"
		wait(1)
		ScreenGui:Destroy()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Megzonshub/MPS-Mobile/main/Reach.lua"))()
	else
		Button.Text = "Falscher Key!"
		wait(1)
		Button.Text = "Bestätigen"
	end
end)
