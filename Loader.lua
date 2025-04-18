-- Megzons MPS Loader ohne GUI (lädt Reach.lua direkt)
local key = "Megzonshubmps"

if _G.Key == key then
    print("Key korrekt! Lade Reach Script...")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Megzonshub/MPS-Mobile/main/Reach.lua"))()
else
    warn("Falscher Key! Zugriff verweigert.")
end
