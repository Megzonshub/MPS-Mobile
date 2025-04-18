-- Megzons Stealth Reach Script (Konsole-Version)
-- Nutze: setreach(15–100) und setgk(15–100) in der Konsole
-- Sichtbar nur für dich – kein öffentlicher Chat!

print("Megzons Stealth Menu aktiviert!")
print("Nutze die Befehle in der Executor-Konsole:")
print("→ setreach(50)   -- für Fuß-Reach")
print("→ setgk(70)      -- für GK-Reach")

-- Spieler & Charakter abrufen
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()

-- Funktion für Fuß-Reach
function setreach(size)
    if size < 15 or size > 100 then
        print("Ungültiger Wert für Reach! (15–100 erlaubt)")
        return
    end
    for _, part in pairs(char:GetChildren()) do
        if part:IsA("BasePart") and part.Name == "RightFoot" then
            part.Size = Vector3.new(0.5, 0.5, size)
            print("Foot Reach auf "..size.." gesetzt.")
        end
    end
end

-- Funktion für GK-Reach
function setgk(size)
    if size < 15 or size > 100 then
        print("Ungültiger Wert für GK Reach! (15–100 erlaubt)")
        return
    end
    for _, part in pairs(char:GetChildren()) do
        if part:IsA("BasePart") and part.Name == "RightHand" then
            part.Size = Vector3.new(size, 0.5, 0.5)
            print("GK Reach auf "..size.." gesetzt.")
        end
    end
end
