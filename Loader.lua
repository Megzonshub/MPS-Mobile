-- Megzons MPS GUI für Arceus X Neo (ohne Key-System) -- Erstellt mit Rayfield Library

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({ Name = "Megzons MPS Hub", LoadingTitle = "Megzons MPS", LoadingSubtitle = "by Megzonshub", ConfigurationSaving = { Enabled = false }, Discord = { Enabled = false }, KeySystem = false })

-- Reach Settings Tab local ReachTab = Window:CreateTab("Reach", 4483362458)

ReachTab:CreateSlider({ Name = "Foot Reach", Range = {1, 30}, Increment = 1, CurrentValue = 5, Flag = "FootReach", Callback = function(Value) _G.FootReach = Value print("Foot Reach gesetzt auf:", Value) end })

ReachTab:CreateSlider({ Name = "GK Reach", Range = {1, 30}, Increment = 1, CurrentValue = 5, Flag = "GKReach", Callback = function(Value) _G.GKReach = Value print("GK Reach gesetzt auf:", Value) end })

-- Aimbot Tab local AimbotTab = Window:CreateTab("Aimbot", 4483362458)

AimbotTab:CreateButton({ Name = "Aimbot Aktivieren", Callback = function() print("Aimbot aktiviert") -- Aimbot Code hier einfügen end })

-- Powershot Tab local PowershotTab = Window:CreateTab("Powershot", 4483362458)

PowershotTab:CreateButton({ Name = "Powershot Aktivieren", Callback = function() print("Powershot aktiviert") -- Powershot Code hier einfügen end })

-- Anti-Kick Tab local AntiKickTab = Window:CreateTab("Anti-Kick", 4483362458)

AntiKickTab:CreateToggle({ Name = "Anti-Kick Aktivieren", CurrentValue = false, Flag = "AntiKickToggle", Callback = function(Value) _G.AntiKick = Value print("Anti-Kick:", Value) -- Anti-Kick Funktionalität aktivieren/deaktivieren end })
