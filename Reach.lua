-- Megzons MPS Loader ohne GUI
local key = "Megzonshubmps"

if _G.Key == key then
    print("Key korrekt! Lade Reach Script...")

    -- Reach Script von GitHub laden
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Megzonshub/MPSMobile/main/Reach.lua"))()
else
    warn("Falscher Key! Zugriff verweigert.")
end
