-- Megzons Custom GUI - Final Version
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()

-- GUI erstellen
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "MegzonsMobileHub"
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 320, 0, 360)
Frame.Position = UDim2.new(0.5, -160, 0.5, -180)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

local UIListLayout = Instance.new("UIListLayout", Frame)
UIListLayout.Padding = UDim.new(0, 5)

-- Funktion: CreateLabel
local function CreateLabel(text)
	local label = Instance.new("TextLabel", Frame)
	label.Size = UDim2.new(1, 0, 0, 30)
	label.BackgroundTransparency = 1
	label.Text = text
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.Font = Enum.Font.GothamBold
	label.TextScaled = true
end

-- Funktion: CreateSlider
local function CreateSlider(name, callback)
	local slider = Instance.new("TextBox", Frame)
	slider.Size = UDim2.new(1, 0, 0, 30)
	slider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	slider.Text = name .. ": 10"
	slider.PlaceholderText = "Wert eingeben (1–30)"
	slider.TextColor3 = Color3.fromRGB(255, 255, 255)
	slider.Font = Enum.Font.Gotham
	slider.TextScaled = true
	slider.FocusLost:Connect(function()
		local val = tonumber(slider.Text:match("%d+"))
		if val then
			callback(val)
			slider.Text = name .. ": " .. val
		end
	end)
end

-- Funktion: CreateButton
local function CreateButton(text, callback)
	local button = Instance.new("TextButton", Frame)
	button.Size = UDim2.new(1, 0, 0, 30)
	button.BackgroundColor3 = Color3.fromRGB(50, 120, 255)
	button.Text = text
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.GothamBold
	button.TextScaled = true
	button.MouseButton1Click:Connect(callback)
end

-- Funktion: CreateToggle
local function CreateToggle(text, callback)
	local toggle = Instance.new("TextButton", Frame)
	toggle.Size = UDim2.new(1, 0, 0, 30)
	toggle.BackgroundColor3 = Color3.fromRGB(120, 50, 255)
	toggle.Text = text .. ": OFF"
	toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
	toggle.Font = Enum.Font.GothamBold
	toggle.TextScaled = true
	local state = false
	toggle.MouseButton1Click:Connect(function()
		state = not state
		toggle.Text = text .. ": " .. (state and "ON" or "OFF")
		callback(state)
	end)
end

-- Tabs / Sektionen
CreateLabel("Reach Settings")
CreateSlider("Foot Reach", function(v)
	-- Deine Foot Reach Logik
	print("Foot Reach auf", v)
end)

CreateSlider("GK Reach", function(v)
	print("GK Reach auf", v)
end)

CreateSlider("Arm Reach", function(v)
	print("Arm Reach auf", v)
end)

CreateLabel("Features")
CreateButton("Aimbot aktivieren", function()
	print("Aimbot aktiviert")
end)

CreateButton("Powershot aktivieren", function()
	print("Powershot aktiviert")
end)

CreateToggle("Anti-Kick", function(state)
	print("Anti-Kick:", state and "Aktiviert" or "Deaktiviert")
end)
