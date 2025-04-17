-- Megzons MPS | Reach Script für Mobile

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source.lua"))()

local Window = Rayfield:CreateWindow({
	Name = "Megzons MPS | Mobile Reach",
	LoadingTitle = "Megzons Hub",
	LoadingSubtitle = "Bigfoot & GK Reach",
	ConfigurationSaving = {
		Enabled = false,
	},
})

local Tab = Window:CreateTab("Reach", 4483362458)

local BigfootReach = 15
local GKReach = 15

local function updateReach()
	for _, partName in ipairs({"LeftFoot", "RightFoot"}) do
		local part = Character:FindFirstChild(partName)
		if part then
			part.CanTouch = true
			part.Massless = true
			part.Size = Vector3.new(0.5, 0.5, BigfootReach)
		end
	end

	local arm = Character:FindFirstChild("Left Arm") or Character:FindFirstChild("LeftUpperArm")
	if arm then
		arm.CanTouch = true
		arm.Massless = true
		arm.Size = Vector3.new(0.5, 0.5, GKReach)
	end
end

Tab:CreateSlider({
	Name = "Bigfoot Reach",
	Range = {15, 100},
	Increment = 1,
	Suffix = "Studs",
	CurrentValue = 15,
	Callback = function(Value)
		BigfootReach = Value
		updateReach()
	end,
})

Tab:CreateSlider({
	Name = "GK Reach",
	Range = {15, 100},
	Increment = 1,
	Suffix = "Studs",
	CurrentValue = 15,
	Callback = function(Value)
		GKReach = Value
		updateReach()
	end,
})

Rayfield:Notify({
	Title = "Megzons MPS aktiv",
	Content = "Reach-Slider geladen!",
	Duration = 4,
})
