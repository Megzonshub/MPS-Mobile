-- Megzons Mobile Hub - Loader
local modules = {
    "Reach.lua",
    "Aimbot.lua",
    "Powershot.lua",
    "AntiKick.lua"
}

for _, module in ipairs(modules) do
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Megzonshub/MPS-Mobile/main/" .. module))()
    end)
    if success then
        print(module .. " geladen.")
    else
        warn("Fehler beim Laden von " .. module .. ": " .. tostring(err))
    end
end
