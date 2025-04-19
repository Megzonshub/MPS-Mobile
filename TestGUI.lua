-- Megzons Mobile Hub - Ultimate MPS GUI (Custom GUI + Hitbox System)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Mouse = LocalPlayer:GetMouse()

-- Create ScreenGui
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "MegzonsHub"
gui.ResetOnSpawn = false

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.Visible = false
mainFrame.Parent = gui

-- Drag Button
local dragButton = Instance.new("TextButton")
dragButton.Text = "Megzonshub"
dragButton.Size = UDim2.new(0, 120, 0, 40)
dragButton.Position = UDim2.new(0, 20, 0, 120)
dragButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
dragButton.TextColor3 = Color3.new(1, 1, 1)
dragButton.BackgroundTransparency = 0.2
dragButton.Active = true
dragButton.Draggable = true
dragButton.Parent = gui

dragButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = not mainFrame.Visible
end)

-- Tabs
local tabs = {}
local currentTab

local function createTab(name)
	local button = Instance.new("TextButton")
	button.Text = name
	button.Size = UDim2.new(0, 100, 0, 30)
	button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	button.TextColor3 = Color3.new(1, 1, 1)
	button.Parent = mainFrame

	local tabFrame = Instance.new("Frame")
	tabFrame.Size = UDim2.new(1, 0, 1, -40)
	tabFrame.Position = UDim2.new(0, 0, 0, 40)
	tabFrame.BackgroundTransparency = 1
	tabFrame.Visible = false
	tabFrame.Parent = mainFrame

	button.MouseButton1Click:Connect(function()
		if currentTab then currentTab.Visible = false end
		tabFrame.Visible = true
		currentTab = tabFrame
	end)

	tabs[#tabs + 1] = button
	return tabFrame
end

-- Layout Tabs
for i, btn in ipairs(tabs) do
	btn.Position = UDim2.new(0, 100 * (i - 1), 0, 0)
end

-- Reach Tab
local reachTab = createTab("Reach")
local function createSlider(parent, label, default, callback)
	local slider = Instance.new("TextButton")
	slider.Text = label .. ": " .. default
	slider.Size = UDim2.new(0, 300, 0, 30)
	slider.Position = UDim2.new(0, 50, 0, 10 + (#parent:GetChildren() * 35))
	slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	slider.TextColor3 = Color3.new(1, 1, 1)
	slider.Parent = parent

	local value = default
	slider.MouseButton1Click:Connect(function()
		local input = tonumber(game:GetService("StarterGui"):PromptInput("Enter reach value (5–30):"))
		if input and input >= 5 and input <= 30 then
			value = input
			slider.Text = label .. ": " .. input
			callback(value)
		end
	end)
end

local function createHitbox(partName, size)
	local part = Instance.new("Part", workspace)
	part.Anchored = false
	part.CanCollide = false
	part.Size = Vector3.new(size, size, size)
	part.Transparency = 0.8
	part.Color = Color3.fromRGB(255, 0, 0)
	part.Name = "ReachHitbox_" .. partName

	RunService.RenderStepped:Connect(function()
		if Character and Character:FindFirstChild(partName) then
			part.CFrame = Character[partName].CFrame
		end
	end)
end

createSlider(reachTab, "Foot Reach", 15, function(value)
	createHitbox("RightFoot", value)
end)

createSlider(reachTab, "Arm Reach", 15, function(value)
	createHitbox("RightHand", value)
end)

createSlider(reachTab, "GK Reach", 15, function(value)
	createHitbox("LeftHand", value)
end)

-- Aimbot Tab
local aimbotTab = createTab("Aimbot")
local aimBtn = Instance.new("TextButton")
aimBtn.Text = "Activate Aimbot"
aimBtn.Size = UDim2.new(0, 200, 0, 40)
aimBtn.Position = UDim2.new(0.5, -100, 0.3, 0)
aimBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
aimBtn.TextColor3 = Color3.new(1, 1, 1)
aimBtn.Parent = aimbotTab
aimBtn.MouseButton1Click:Connect(function()
	print("Aimbot aktiviert")
	-- Hier dein Aimbot-Code
end)

-- Powershot Tab
local powerTab = createTab("Powershot")
local powerBtn = Instance.new("TextButton")
powerBtn.Text = "Activate Powershot"
powerBtn.Size = UDim2.new(0, 200, 0, 40)
powerBtn.Position = UDim2.new(0.5, -100, 0.3, 0)
powerBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
powerBtn.TextColor3 = Color3.new(1, 1, 1)
powerBtn.Parent = powerTab
powerBtn.MouseButton1Click:Connect(function()
	print("Powershot aktiviert")
	-- Hier dein Powershot-Code
end)

-- Anti-Kick Tab
local akTab = createTab("Anti-Kick")
local akToggle = Instance.new("TextButton")
akToggle.Text = "Anti-Kick: OFF"
akToggle.Size = UDim2.new(0, 200, 0, 40)
akToggle.Position = UDim2.new(0.5, -100, 0.3, 0)
akToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
akToggle.TextColor3 = Color3.new(1, 1, 1)
akToggle.Parent = akTab

local akOn = false
akToggle.MouseButton1Click:Connect(function()
	akOn = not akOn
	akToggle.Text = "Anti-Kick: " .. (akOn and "ON" or "OFF")
	if akOn then
		hookfunction(game:GetService("Players").LocalPlayer.Kick, function() end)
	end
end)

-- Show default tab
tabs[1].MouseButton1Click:Fire()
