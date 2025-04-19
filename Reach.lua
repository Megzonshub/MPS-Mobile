local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local character = lp.Character or lp.CharacterAdded:Wait()

local reachParts = {
    Foot = nil,
    Arm = nil,
    GK = nil
}

function createHitbox(name, size, followPart)
    if reachParts[name] then
        reachParts[name]:Destroy()
    end

    local hitbox = Instance.new("Part")
    hitbox.Name = name .. "_ReachPart"
    hitbox.Size = Vector3.new(size, size, size)
    hitbox.Transparency = 1
    hitbox.Anchored = false
    hitbox.CanCollide = false
    hitbox.Massless = true
    hitbox.Parent = character

    local weld = Instance.new("WeldConstraint")
    weld.Part0 = hitbox
    weld.Part1 = followPart
    weld.Parent = hitbox

    hitbox.Position = followPart.Position

    reachParts[name] = hitbox
end

function setReach(part, value)
    local char = lp.Character or lp.CharacterAdded:Wait()
    if part == "Foot" then
        local foot = char:FindFirstChild("RightFoot") or char:FindFirstChild("Right Leg")
        if foot then
            createHitbox("Foot", tonumber(value), foot)
        end
    elseif part == "Arm" then
        local arm = char:FindFirstChild("RightHand") or char:FindFirstChild("Right Arm")
        if arm then
            createHitbox("Arm", tonumber(value), arm)
        end
    elseif part == "GK" then
        local torso = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
        if torso then
            createHitbox("GK", tonumber(value), torso)
        end
    end
end

print("Megzons Reach loaded")
