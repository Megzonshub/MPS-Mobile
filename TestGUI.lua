-- Megzons Custom GUI - MPS Script (Final Version)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "MegzonsHub"
ScreenGui.ResetOnSpawn = false

local openButton = Instance.new("TextButton")
openButton.Size = UDim2.new(0, 150, 0, 40)
openButton.Position = UDim2.new(0, 10, 0.5, -20)
openButton.Text = "Megzonshub"
openButton.Parent = ScreenGui
openButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
openButton.TextColor3 = Color3.new(1, 1, 1)
openButton.TextSize = 16

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 350)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -175)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = ScreenGui

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Megzons Mobile Hub"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
title.TextSize = 20

local function createSlider(name, min, max, callback, posY)
	local label = Instance.new("TextLabel", mainFrame)
	label.Position = UDim2.new(0, 10, 0, posY)
	label.Size = UDim2.new(0, 330, 0, 20)
	label.Text = name
	label.TextColor3 = Color3.new(1, 1, 1)
	label.BackgroundTransparency = 1
	label.TextXAlignment = Enum.TextXAlignment.Left

	local slider = Instance.new("TextBox", mainFrame)
	slider.Position = UDim2.new(0, 10, 0, posY + 20)
	slider.Size = UDim2.new(0, 330, 0, 30)
	slider.PlaceholderText = tostring(min) .. " - " .. tostring(max)
	slider.TextColor3 = Color3.new(1, 1, 1)
	slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	slider.Text = ""
	slider.ClearTextOnFocus = false

	slider.FocusLost:Connect(function()
		local val = tonumber(slider.Text)
		if val and val >= min and val <= max then
			callback(val)
		end
	end)
end

local function createButton(name, callback, posY)
	local button = Instance.new("TextButton", mainFrame)
	button.Position = UDim2.new(0, 10, 0, posY)
	button.Size = UDim2.new(0, 330, 0, 30)
	button.Text = name
	button.TextColor3 = Color3.new(1, 1, 1)
	button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	button.MouseButton1Click:Connect(callback)
end

local function createToggle(name, callback, posY)
	local toggle = Instance.new("TextButton", mainFrame)
	toggle.Position = UDim2.new(0, 10, 0, posY)
	toggle.Size = UDim2.new(0, 330, 0, 30)
	toggle.Text = name .. " [OFF]"
	toggle.TextColor3 = Color3.new(1, 1, 1)
	toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

	local state = false
	toggle.MouseButton1Click:Connect(function()
		state = not state
		toggle.Text = name .. (state and " [ON]" or " [OFF]")
		callback(state)
	end)
end

-- GUI Logic
openButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = not mainFrame.Visible
end)

-- Functional Callbacks
local function setFootReach(val)
	print("Foot Reach set to: " .. val)
end

local function setGKReach(val)
	print("GK Reach set to: " .. val)
end

local function setArmReach(val)
	print("Arm Reach set to: " .. val)
end

local function activateAimbot()
	print("Aimbot activated")
end

local function activatePowershot()
	print("Powershot activated")
end

local function toggleAntiKick(enabled)
	print("Anti-Kick is now: " .. tostring(enabled))
end

-- Creating UI Components
createSlider("Foot Reach", 1, 30, setFootReach, 50)
createSlider("GK Reach", 1, 30, setGKReach, 110)
createSlider("Arm Reach", 1, 30, setArmReach, 170)

createButton("Aimbot", activateAimbot, 230)
createButton("Powershot", activatePowershot, 270)
createToggle("Anti-Kick", toggleAntiKick, 310)
