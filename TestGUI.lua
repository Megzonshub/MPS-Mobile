-- Megzons MPS GUI (ohne Anti-Kick)
-- Erstellt für Arceus X Neo | by ChatGPT & Megzonshub

local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.ResetOnSpawn = false

local MiniButton = Instance.new("TextButton", ScreenGui)
MiniButton.Size = UDim2.new(0, 120, 0, 30)
MiniButton.Position = UDim2.new(0.5, -60, 0, 100)
MiniButton.BackgroundTransparency = 0.2
MiniButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MiniButton.Text = "Megzonshub"
MiniButton.TextColor3 = Color3.new(1, 1, 1)
MiniButton.Active = true
MiniButton.Draggable = true

local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 350, 0, 300)
Main.Position = UDim2.new(0.5, -175, 0.5, -150)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.Visible = false

local UIList = Instance.new("UIListLayout", Main)
UIList.FillDirection = Enum.FillDirection.Vertical
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 5)

MiniButton.MouseButton1Click:Connect(function()
	Main.Visible = not Main.Visible
end)

-- Hitbox-Funktion
function createHitbox(name, size, partName)
	local hitbox = Instance.new("Part", workspace)
	hitbox.Name = name
	hitbox.Size = size
	hitbox.Transparency = 0.8
	hitbox.Anchored = false
	hitbox.CanCollide = false
	hitbox.Massless = true
	hitbox.Shape = Enum.PartType.Ball
	hitbox.Color = Color3.new(1, 1, 1)

	game:GetService("RunService").RenderStepped:Connect(function()
		local char = Player.Character
		if char and char:FindFirstChild(partName) then
			hitbox.Position = char[partName].Position
		end
	end)
end

-- GUI Funktionen
local function addSlider(title, default, min, max, callback)
	local label = Instance.new("TextLabel", Main)
	label.Size = UDim2.new(1, -10, 0, 20)
	label.Text = title .. ": " .. tostring(default)
	label.TextColor3 = Color3.new(1, 1, 1)
	label.BackgroundTransparency = 1

	local button = Instance.new("TextButton", Main)
	button.Size = UDim2.new(1, -10, 0, 30)
	button.Text = "Set " .. title
	button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	button.TextColor3 = Color3.new(1, 1, 1)

	button.MouseButton1Click:Connect(function()
		local val = tonumber(game:GetService("StarterGui"):PromptInput("Set " .. title .. " Reach", "Value from "..min.." to "..max)) or default
		val = math.clamp(val, min, max)
		label.Text = title .. ": " .. tostring(val)
		callback(val)
	end)
end

local function addButton(title, callback)
	local btn = Instance.new("TextButton", Main)
	btn.Size = UDim2.new(1, -10, 0, 30)
	btn.Text = title
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.MouseButton1Click:Connect(callback)
end

-- Sliders & Buttons
addSlider("Foot Reach", 15, 1, 30, function(val)
	createHitbox("FootReach", Vector3.new(val, val, val), "RightFoot")
end)

addSlider("GK Reach", 15, 1, 30, function(val)
	createHitbox("GKReach", Vector3.new(val, val, val), "LeftHand")
end)

addSlider("Arm Reach", 15, 1, 30, function(val)
	createHitbox("ArmReach", Vector3.new(val, val, val), "RightHand")
end)

addButton("Activate Powershot", function()
	print("Powershot activated!") -- Dein Powershot-Code hier
end)

addButton("Activate Aimbot", function()
	print("Aimbot activated!") -- Dein Aimbot-Code hier
end)
