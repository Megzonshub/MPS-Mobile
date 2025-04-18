--// Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

--// Load Rayfield
loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source.lua"))()
local Window = Rayfield:CreateWindow({
    Name = "MPS Mobile Reach GUI",
    LoadingTitle = "Megzons Mobile Hub",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "MegzonsHub",
        FileName = "MPSReach"
    }
})

--// Variables
local FootReachBox = nil
local GKReachBox = nil
local FootReach = 0
local GKReach = 0
local AntiAFKEnabled = false

--// Functions
local function createHitbox(name, color)
    local part = Instance.new("Part")
    part.Name = name
    part.Anchored = true
    part.CanCollide = false
    part.Transparency = 1
    part.Size = Vector3.new(5, 5, 5)
    part.Color = color
    part.Parent = workspace
    return part
end

local function setReach(type, size)
    if type == "Foot" then
        FootReach = size
        if not FootReachBox then
            FootReachBox = createHitbox("FootHitbox", Color3.fromRGB(255, 0, 0))
        end
        FootReachBox.Size = Vector3.new(size, size, size)
    elseif type == "GK" then
        GKReach = size
        if not GKReachBox then
            GKReachBox = createHitbox("GKHitbox", Color3.fromRGB(0, 0, 255))
        end
        GKReachBox.Size = Vector3.new(size, size, size)
    end
end

--// GUI
local MainTab = Window:CreateTab("Reach", 4483362458)

MainTab:CreateSlider({
    Name = "Foot Reach",
    Range = {1, 100},
    Increment = 1,
    Default = 0,
    Callback = function(Value)
        setReach("Foot", Value)
    end,
})

MainTab:CreateSlider({
    Name = "GK Reach",
    Range = {1, 100},
    Increment = 1,
    Default = 0,
    Callback = function(Value)
        setReach("GK", Value)
    end,
})

MainTab:CreateToggle({
    Name = "Anti-AFK",
    CurrentValue = false,
    Callback = function(Value)
        AntiAFKEnabled = Value
    end,
})

--// Render Loop
RunService.RenderStepped:Connect(function()
    Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    
    local FootPart = Character:FindFirstChild("LeftFoot") or Character:FindFirstChild("RightFoot")
    local GKPart = Character:FindFirstChild("RightHand") or Character:FindFirstChild("LeftHand")

    if FootReachBox and FootPart then
        FootReachBox.Position = FootPart.Position
    end

    if GKReachBox and GKPart then
        GKReachBox.Position = GKPart.Position
    end

    if AntiAFKEnabled then
        VirtualInputManager = game:GetService("VirtualInputManager")
        VirtualInputManager:SendKeyEvent(true, "Space", false, game)
        VirtualInputManager:SendKeyEvent(false, "Space", false, game)
    end
end)
