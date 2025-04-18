-- Megzons MPS Hidden Reach GUI

local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local foot = char:WaitForChild("RightFoot")

local reachSize = 45 -- Startgröße

local function removeOldHitbox()
    if char:FindFirstChild("MegzonReach") then
        char:FindFirstChild("MegzonReach"):Destroy()
    end
end

local function createReachHitbox(size)
    removeOldHitbox()
    local reach = Instance.new("Part")
    reach.Name = "MegzonReach"
    reach.Size = Vector3.new(size, size, size)
    reach.Transparency = 1
    reach.Anchored = false
    reach.CanCollide = false
    reach.Massless = true
    reach.Parent = char

    local weld = Instance.new("WeldConstraint")
    weld.Part0 = reach
    weld.Part1 = foot
    weld.Parent = reach
end

createReachHitbox(reachSize)

-- GUI erstellen
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.ResetOnSpawn = false

local button = Instance.new("TextButton", ScreenGui)
button.Size = UDim2.new(0, 140, 0, 40)
button.Position = UDim2.new(0.5, -70, 0.5, -20)
button.Text = "Reach: " .. tostring(reachSize)
button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
button.TextColor3 = Color3.new(1, 1, 1)
button.TextScaled = true
button.Font = Enum.Font.GothamSemibold
button.BorderSizePixel = 0
button.Active = true
button.Draggable = true

button.MouseButton1Click:Connect(function()
    reachSize = reachSize + 5
    if reachSize > 100 then
        reachSize = 15
    end
    button.Text = "Reach: " .. tostring(reachSize)
    createReachHitbox(reachSize)
    print("Bigfoot Reach auf", reachSize)
end)
