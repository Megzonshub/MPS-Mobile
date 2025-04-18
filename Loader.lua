-- Megzons MPS Loader (ohne GUI, fix)
local key = "Megzonshubmps"

if _G.Key == key then
    print("Key korrekt! Lade Reach Script...")

    -- Richtiger RAW-Link zu Reach.lua
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Megzonshub/MPS-Mobile/main/Reach.lua"))()
else
    warn("Falscher Key! Zugriff verweigert.")
end
