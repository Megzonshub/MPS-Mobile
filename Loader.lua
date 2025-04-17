-- Megzons MPS | Loader mit einfachem One-Time-Key-System

if not getgenv then
    return warn("Dein Executor unterstützt keine Globals (getgenv).")
end

local HttpService = game:GetService("HttpService")
local player = game.Players.LocalPlayer
local keyStorage = "MegzonshubMPSKey_Used"

-- Wenn der Key schon mal eingegeben wurde, skip direkt
if getgenv()[keyStorage] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Megzonshub/MPS-Mobile/main/Reach.lua"))()
    return
end

local function requestKey()
    local input = tostring(game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Megzons MPS",
        Text = "Bitte Key eingeben im Prompt",
        Duration = 8
    }))

    local userKey = tostring(string.lower(HttpService:PromptAsync("Key erforderlich", "Gib deinen Zugangscode ein (nur einmal nötig):", "Megzonshubmps")))
    return userKey
end

local function isKeyValid(k)
    local correctKey = game:HttpGet("https://raw.githubusercontent.com/Megzonshub/MPS-Mobile/main/key.txt")
    return string.lower(k) == string.lower(correctKey)
end

local function start()
    local enteredKey = requestKey()
    if isKeyValid(enteredKey) then
        getgenv()[keyStorage] = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Megzonshub/MPS-Mobile/main/Reach.lua"))()
    else
        warn("Falscher Key.")
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Key falsch!",
            Text = "Bitte Script erneut ausführen.",
            Duration = 5
        })
    end
end

start()
