local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "MegzonsCustomHub"
gui.ResetOnSpawn = false

-- Hauptfenster
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 400, 0, 300)
main.Position = UDim2.new(0.5, -200, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.BorderSizePixel = 0
main.Visible = true

-- Titel
local title = Instance.new("TextLabel", main)
title.Text = "Megzons Mobile Hub"
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 22

-- Tab Buttons
local function createTabButton(name, pos, callback)
	local btn = Instance.new("TextButton", main)
	btn.Size = UDim2.new(0, 120, 0, 30)
	btn.Position = UDim2.new(0, pos, 0, 50)
	btn.Text = name
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.SourceSans
	btn.TextSize = 18
	btn.MouseButton1Click:Connect(callback)
end

-- Tabs
local tabs = {}

local function createTab(name)
	local frame = Instance.new("Frame", main)
	frame.Name = name
	frame.Size = UDim2.new(1, -20, 1, -90)
	frame.Position = UDim2.new(0, 10, 0, 90)
	frame.BackgroundTransparency = 1
	frame.Visible = false
	tabs[name] = frame
	return frame
end

local function switchToTab(name)
	for t, f in pairs(tabs) do
		f.Visible = (t == name)
	end
end

-- Reach Tab
local reachTab = createTab("Reach")
local footReach = Instance.new("TextBox", reachTab)
footReach.PlaceholderText = "Foot Reach (1–30)"
footReach.Size = UDim2.new(0, 200, 0, 40)
footReach.Position = UDim2.new(0, 10, 0, 10)
footReach.Text = ""
footReach.TextSize = 18
footReach.FocusLost:Connect(function()
	print("Foot Reach:", tonumber(footReach.Text))
end)

-- Aimbot Tab
local aimbotTab = createTab("Aimbot")
local aimBtn = Instance.new("TextButton", aimbotTab)
aimBtn.Text = "Aimbot aktivieren"
aimBtn.Size = UDim2.new(0, 200, 0, 40)
aimBtn.Position = UDim2.new(0, 10, 0, 10)
aimBtn.MouseButton1Click:Connect(function()
	print("Aimbot aktiviert")
end)

-- Powershot Tab
local powerTab = createTab("Powershot")
local powerBtn = Instance.new("TextButton", powerTab)
powerBtn.Text = "Powershot aktivieren"
powerBtn.Size = UDim2.new(0, 200, 0, 40)
powerBtn.Position = UDim2.new(0, 10, 0, 10)
powerBtn.MouseButton1Click:Connect(function()
	print("Powershot aktiviert")
end)

-- Tab Buttons
createTabButton("Reach", 10, function() switchToTab("Reach") end)
createTabButton("Aimbot", 140, function() switchToTab("Aimbot") end)
createTabButton("Powershot", 270, function() switchToTab("Powershot") end)

-- Standardtab
switchToTab("Reach")
