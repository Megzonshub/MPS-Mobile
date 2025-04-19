-- GUI Reach Test für Arceus X Neo

local Players = game:GetService("Players")
local lp = Players.LocalPlayer

-- GUI löschen, wenn es schon existiert
if lp:FindFirstChild("PlayerGui"):FindFirstChild("MegzonsReachGUI") then
    lp.PlayerGui.MegzonsReachGUI:Destroy()
end

-- GUI erstellen
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MegzonsReachGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = lp:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 280, 0, 160)
frame.Position = UDim2.new(0.5, -140, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "Megzons Reach Test"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = frame

local reachSlider = Instance.new("TextBox")
reachSlider.Size = UDim2.new(0, 200, 0, 40)
reachSlider.Position = UDim2.new(0, 40, 0, 60)
reachSlider.PlaceholderText = "Gib Reach-Wert ein (z. B. 15)"
reachSlider.Text = ""
reachSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
reachSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
reachSlider.Font = Enum.Font.Gotham
reachSlider.TextSize = 16
reachSlider.Parent = frame

reachSlider.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local num = tonumber(reachSlider.Text)
        if num then
            print("Setze Reach auf: " .. num)
            -- Hier deine echte Reach-Funktion aufrufen
        else
            warn("Ungültiger Wert eingegeben")
        end
    end
end)
