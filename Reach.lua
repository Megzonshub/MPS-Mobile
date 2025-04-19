-- Lade Rayfield
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source.lua"))()

-- Erstelle GUI
local Window = Rayfield:CreateWindow({
   Name = "Megzons Reach",
   LoadingTitle = "Megzons Hub lädt...",
   LoadingSubtitle = "by Megzonshub",
   ConfigurationSaving = {
      Enabled = false
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false,
})

-- Erstelle Tab
local ReachTab = Window:CreateTab("Reach Settings", 4483362458)

-- Reach-Slider
ReachTab:CreateSlider({
   Name = "Foot Reach",
   Range = {1, 30},
   Increment = 1,
   Suffix = "Studs",
   CurrentValue = 10,
   Flag = "FootReach",
   Callback = function(Value)
       -- Beispiel: Erhöhe Fußreichweite mit unsichtbarem Part
       if _G.FootReachPart then
           _G.FootReachPart.Size = Vector3.new(1, 1, Value)
       end
   end,
})

-- Beispielhafte Reach-Setup Funktion (du kannst das an dein Spiel anpassen)
if not _G.FootReachPart then
   local part = Instance.new("Part")
   part.Size = Vector3.new(1, 1, 10)
   part.Transparency = 1
   part.CanCollide = false
   part.Anchored = false
   part.Parent = game.Workspace
   _G.FootReachPart = part

   -- Beispiel: Folge dem rechten Fuß
   local player = game.Players.LocalPlayer
   local char = player.Character or player.CharacterAdded:Wait()
   local foot = char:WaitForChild("RightFoot")

   game:GetService("RunService").RenderStepped:Connect(function()
       if foot and _G.FootReachPart then
           _G.FootReachPart.CFrame = foot.CFrame
       end
   end)
end
