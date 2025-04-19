-- Megzons Custom GUI (Foot Reach v1)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- GUI erstellen
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "MegzonsGUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 250, 0, 150)
Frame.Position = UDim2.new(0.5, -125, 0.4, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Name = "MainFrame"
Frame.Active = true
Frame.Draggable = true

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "Foot Reach"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.BorderSizePixel = 0
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20

local Slider = Instance.new("TextBox", Frame)
Slider.Position = UDim2.new(0, 10, 0, 50)
Slider.Size = UDim2.new(0, 230, 0, 30)
Slider.PlaceholderText = "Reichweite (1-30)"
Slider.Text = ""
Slider.ClearTextOnFocus = false
Slider.Font = Enum.Font.SourceSans
Slider.TextSize = 18
Slider.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Slider.TextColor3 = Color3.new(1, 1, 1)

-- Unsichtbare Hitbox
local function createHitbox()
	local part = Instance.new("Part")
	part.Anchored = false
	part.CanCollide = false
	part.Transparency = 1
	part.Size = Vector3.new(2, 2, 2)
	part.Name = "FootHitbox"
	part.Parent = workspace
	local weld = Instance.new("WeldConstraint", part)
	weld.Part0 = part
	weld.Part1 = character:WaitForChild("RightFoot") or character:FindFirstChild("Right Leg") or character:FindFirstChild("RightLowerLeg")
	return part
end

local hitbox = createHitbox()

-- Verbindung zum Slider
Slider.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		local value = tonumber(Slider.Text)
		if value and value >= 1 and value <= 30 then
			hitbox.Size = Vector3.new(value, value, value)
			print("Foot Reach gesetzt auf: " .. value)
		else
			Slider.Text = ""
			Slider.PlaceholderText = "Nur Werte von 1-30!"
		end
	end
end)
