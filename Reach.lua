-- Megzons MPS Reach Script (Mobile Edition)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- GUI
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "MPSReachGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 220)
Frame.Position = UDim2.new(0.5, -150, 0.5, -110)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)

-- Titel
local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "Megzons MPS Reach"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.BackgroundTransparency = 1
Title.TextScaled = true

-- Slider-Funktion
local function createSlider(name, yPos, minStuds, maxStuds, callback)
	local TextLabel = Instance.new("TextLabel", Frame)
	TextLabel.Position = UDim2.new(0.05, 0, yPos, 0)
	TextLabel.Size = UDim2.new(0.9, 0, 0, 20)
	TextLabel.Text = name..": "..minStuds
	TextLabel.BackgroundTransparency = 1
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextScaled = true

	local Slider = Instance.new("TextBox", Frame)
	Slider.Position = UDim2.new(0.05, 0, yPos + 0.05, 0)
	Slider.Size = UDim2.new(0.9, 0, 0, 30)
	Slider.Text = tostring(minStuds)
	Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
	Slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Slider.TextScaled = true

	Slider.FocusLost:Connect(function()
		local val = tonumber(Slider.Text)
		if val and val >= minStuds and val <= maxStuds then
			TextLabel.Text = name..": "..val
			callback(val)
		else
			Slider.Text = tostring(minStuds)
			callback(minStuds)
		end
	end)
end

-- Reach-Werte
local footReach = 15
local gkReach = 15

createSlider("Bigfoot Reach", 0.2, 15, 100, function(val)
	footReach = val
end)

createSlider("GK Reach", 0.5, 15, 100, function(val)
	gkReach = val
end)

-- Hitbox-Manipulation (unsichtbar)
RunService.RenderStepped:Connect(function()
	for _, v in pairs(workspace:GetDescendants()) do
		if v:IsA("Part") and v.Parent:FindFirstChild("Humanoid") and v.Parent ~= LocalPlayer.Character then
			if v.Name == "LeftFoot" or v.Name == "RightFoot" then
				v.Size = Vector3.new(footReach, footReach, footReach)
				v.Transparency = 1
			elseif v.Name == "LeftHand" or v.Name == "RightHand" then
				v.Size = Vector3.new(gkReach, gkReach, gkReach)
				v.Transparency = 1
			end
		end
	end
end)
