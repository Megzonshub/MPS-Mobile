-- Megzons MPS Mobile Hub Loader
local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Megzonshub/MPS-Mobile/main/Reach.lua"))()
end)

if not success then
    warn("Fehler beim Laden von Reach.lua: " .. tostring(err))
end
