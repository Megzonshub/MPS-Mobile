print("Megzons Reach aktiviert!")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- Unsichtbarer Bigfoot-Reach (100 Studs lang, keine sichtbare Vergrößerung)
for _, part in pairs(Character:GetChildren()) do
    if part:IsA("BasePart") and (part.Name == "RightFoot" or part.Name == "LeftFoot") then
        part.Size = Vector3.new(2, 2, 100) -- lange, schmale Hitbox
        part.Transparency = 1
        part.CanTouch = true
        part.Massless = true

        part.Touched:Connect(function(hit)
            if hit:IsA("BasePart") and not hit:IsDescendantOf(Character) then
                firetouchinterest(part, hit, 0)
                firetouchinterest(part, hit, 1)
            end
        end)
    end
end
