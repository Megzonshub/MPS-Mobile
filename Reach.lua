-- Megzons MPS Reach GUI mit Rayfield (Mobilfreundlich)

local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source.lua"))()

local Window = Rayfield:CreateWindow({
   Name = "Megzons MPS Reach GUI",
   LoadingTitle = "Megzons Hub",
   LoadingSubtitle = "MPS Mobile Version",
   ConfigurationSaving = {
      Enabled = false
   }
})

local ReachTab = Window:CreateTab("Reach", 4483362458)

local reachValue = 10

ReachTab:CreateInput({
   Name = "Reach-Wert (z. B. 15)",
   PlaceholderText = "Gib die Reichweite in Studs ein",
   RemoveTextAfterFocusLost = false,
   Callback = function(Value)
      reachValue = tonumber(Value) or 10
   end,
})

ReachTab:CreateButton({
   Name = "Aktiviere Reach",
   Callback = function()
      local player = game.Players.LocalPlayer
      local char = player.Character or player.CharacterAdded:Wait()

      if char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("RightFoot") then
         local reachPart = Instance.new("Part")
         reachPart.Name = "MegzonsReach"
         reachPart.Anchored = false
         reachPart.CanCollide = false
         reachPart.Massless = true
         reachPart.Size = Vector3.new(3, 3, 3)
         reachPart.Transparency = 1
         reachPart.Shape = Enum.PartType.Ball
         reachPart.Parent = char

         local weld = Instance.new("WeldConstraint")
         weld.Part0 = char:FindFirstChild("RightFoot")
         weld.Part1 = reachPart
         weld.Parent = reachPart

         reachPart.Position = char.RightFoot.Position
         reachPart.Size = Vector3.new(reachValue, reachValue, reachValue)
      end
   end,
})
