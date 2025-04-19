-- Megzons MPS Mobile Hub (Custom GUI Version)
-- Features: Foot Reach (Hitbox), GK Reach, Arm Reach (Sliders), Aimbot, Powershot, Anti-Kick, Dragbarer Button, Transparenter Öffnungsbutton

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- GUI
local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "MegzonsGUI"
screenGui.ResetOnSpawn = false

-- Öffnungsbutton
local openButton = Instance.new("TextButton")
openButton.Name = "OpenButton"
openButton.Text = "Megzonshub"
openButton.Size = UDim2.new(0, 120, 0, 35)
openButton.Position = UDim2.new(0.05, 0, 0.5, 0)
openButton.BackgroundTransparency = 0.2
openButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
openButton.TextColor3 = Color3.fromRGB(255, 255, 255)
openButton.Parent = screenGui
openButton.Active = true
openButton.Draggable = true

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 320, 0, 330)
mainFrame.Position = UDim2.new(0.2, 0, 0.25, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = screenGui

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Text = "X"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Parent = mainFrame

-- Tabs (Einfach)
local tabLabel = Instance.new("TextLabel")
tabLabel.Size = UDim2.new(1, 0, 0, 30)
tabLabel.Position = UDim2.new(0, 0, 0, 0)
tabLabel.Text = "Megzons MPS Hub"
tabLabel.TextColor3 = Color3.new(1, 1, 1)
tabLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tabLabel.Parent = mainFrame

-- Foot Reach Slider
local footSlider = Instance.new("TextBox")
footSlider.PlaceholderText = "Foot Reach (1 - 30)"
footSlider.Size = UDim2.new(0, 280, 0, 30)
footSlider.Position = UDim2.new(0, 20, 0, 50)
footSlider.Text = ""
footSlider.ClearTextOnFocus = false
footSlider.Parent = mainFrame

-- GK Reach
local gkSlider = footSlider:Clone()
gkSlider.PlaceholderText = "GK Reach (1 - 30)"
gkSlider.Position = UDim2.new(0, 20, 0, 90)
gkSlider.Parent = mainFrame

-- Arm Reach
local armSlider = footSlider:Clone()
armSlider.PlaceholderText = "Arm Reach (1 - 30)"
armSlider.Position = UDim2.new(0, 20, 0, 130)
armSlider.Parent = mainFrame

-- Powershot Button
local powerBtn = Instance.new("TextButton")
powerBtn.Text = "Activate Powershot"
powerBtn.Size = UDim2.new(0, 280, 0, 30)
powerBtn.Position = UDim2.new(0, 20, 0, 180)
powerBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
powerBtn.TextColor3 = Color3.new(1, 1, 1)
powerBtn.Parent = mainFrame

-- Aimbot Button
local aimbotBtn = powerBtn:Clone()
aimbotBtn.Text = "Activate Aimbot"
aimbotBtn.Position = UDim2.new(0, 20, 0, 220)
aimbotBtn.Parent = mainFrame

-- Anti Kick Toggle
local antiKickBtn = powerBtn:Clone()
antiKickBtn.Text = "Toggle Anti-Kick"
antiKickBtn.Position = UDim2.new(0, 20, 0, 260)
antiKickBtn.Parent = mainFrame

-- Funktion GUI öffnen/schließen
openButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = true
	openButton.Visible = false
end)

closeButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
	openButton.Visible = true
end)

-- Funktion: Reach-Hitbox (unsichtbar)
local function createHitbox(partName, size)
	local char = LocalPlayer.Character
	if not char then return end
	local part = char:FindFirstChild(partName)
	if not part then return end
	if part:FindFirstChild("Hitbox") then part.Hitbox:Destroy() end

	local hitbox = Instance.new("Part")
	hitbox.Name = "Hitbox"
	hitbox.Size = Vector3.new(size, size, size)
	hitbox.Transparency = 0.8
	hitbox.CanCollide = false
	hitbox.Anchored = false
	hitbox.Massless = true
	hitbox.Parent = part
	local weld = Instance.new("WeldConstraint", hitbox)
	weld.Part0 = hitbox
	weld.Part1 = part
end

-- Listeners
footSlider.FocusLost:Connect(function()
	local size = tonumber(footSlider.Text)
	if size then createHitbox("RightFoot", size) end
end)

gkSlider.FocusLost:Connect(function()
	local size = tonumber(gkSlider.Text)
	if size then createHitbox("LeftFoot", size) end
end)

armSlider.FocusLost:Connect(function()
	local size = tonumber(armSlider.Text)
	if size then createHitbox("LeftHand", size) end
end)

powerBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Megzonshub/MPS-Mobile/main/Powershot.lua"))()
end)

aimbotBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Megzonshub/MPS-Mobile/main/Aimbot.lua"))()
end)

antiKickBtn.MouseButton1Click:Connect(function()
	LocalPlayer.CharacterRemoving:Connect(function(char)
		if char == LocalPlayer.Character then
			wait(0.1)
			LocalPlayer.Character = char
		end
	end)
end)
