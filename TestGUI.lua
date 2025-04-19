--// Megzons Mobile Hub – Fix Version (Draggable + TextBox Input) //

local player = game.Players.LocalPlayer local character = player.Character or player.CharacterAdded:Wait() local mouse = player:GetMouse()

-- GUI local gui = Instance.new("ScreenGui", game.CoreGui) local openButton = Instance.new("TextButton") local mainFrame = Instance.new("Frame") local title = Instance.new("TextLabel") local footBox = Instance.new("TextBox") local armBox = Instance.new("TextBox") local gkBox = Instance.new("TextBox") local aimbotButton = Instance.new("TextButton") local powershotButton = Instance.new("TextButton") local antiKick = Instance.new("TextButton")

-- GUI Styling gui.Name = "MegzonsHub" openButton.Size = UDim2.new(0, 120, 0, 30) openButton.Position = UDim2.new(0, 20, 0.5, -15) openButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) openButton.Text = "Megzonshub" openButton.TextColor3 = Color3.new(1, 1, 1) openButton.BackgroundTransparency = 0.2 openButton.Parent = gui openButton.Active = true openButton.Draggable = true

mainFrame.Size = UDim2.new(0, 300, 0, 300) mainFrame.Position = UDim2.new(0.5, -150, 0.5, -150) mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) mainFrame.Visible = false mainFrame.Parent = gui mainFrame.Active = true mainFrame.Draggable = true

openButton.MouseButton1Click:Connect(function() mainFrame.Visible = not mainFrame.Visible end)

title.Size = UDim2.new(1, 0, 0, 40) title.BackgroundColor3 = Color3.fromRGB(20, 20, 20) title.Text = "Megzons Mobile Hub" title.TextColor3 = Color3.new(1, 1, 1) title.Font = Enum.Font.SourceSansBold title.TextSize = 20 title.Parent = mainFrame

local function createBox(name, posY) local box = Instance.new("TextBox") box.Size = UDim2.new(0.9, 0, 0, 30) box.Position = UDim2.new(0.05, 0, 0, posY) box.PlaceholderText = name .. " Reach" box.Text = "" box.TextColor3 = Color3.new(1, 1, 1) box.BackgroundColor3 = Color3.fromRGB(60, 60, 60) box.Font = Enum.Font.SourceSans box.TextSize = 16 box.ClearTextOnFocus = false box.Parent = mainFrame return box end

footBox = createBox("Foot", 50) armBox = createBox("Arm", 90) gkBox = createBox("GK", 130)

aimbotButton.Size = UDim2.new(0.9, 0, 0, 30) aimbotButton.Position = UDim2.new(0.05, 0, 0, 170) aimbotButton.Text = "Aimbot" aimbotButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80) aimbotButton.TextColor3 = Color3.new(1, 1, 1) aimbotButton.Parent = mainFrame

powershotButton.Size = UDim2.new(0.9, 0, 0, 30) powershotButton.Position = UDim2.new(0.05, 0, 0, 210) powershotButton.Text = "Powershot" powershotButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80) powershotButton.TextColor3 = Color3.new(1, 1, 1) powershotButton.Parent = mainFrame

antiKick.Size = UDim2.new(0.9, 0, 0, 30) antiKick.Position = UDim2.new(0.05, 0, 0, 250) antiKick.Text = "Anti Kick" antiKick.BackgroundColor3 = Color3.fromRGB(80, 80, 80) antiKick.TextColor3 = Color3.new(1, 1, 1) antiKick.Parent = mainFrame

-- Funktionale Logik function setFootReach(value) local foot = character:FindFirstChild("RightFoot") if foot and value then local hitbox = foot:FindFirstChild("FootHitbox") or Instance.new("Part", foot) hitbox.Name = "FootHitbox" hitbox.Size = Vector3.new(value, value, value) hitbox.Transparency = 0.8 hitbox.Anchored = false hitbox.CanCollide = false hitbox.Massless = true local weld = Instance.new("WeldConstraint") weld.Part0 = foot weld.Part1 = hitbox weld.Parent = hitbox end end

footBox.FocusLost:Connect(function(enter) if enter then local val = tonumber(footBox.Text) if val then setFootReach(val) end end end)

-- Dummy Funktionen powershotButton.MouseButton1Click:Connect(function() print("Powershot aktiviert!") end)

aimbotButton.MouseButton1Click:Connect(function() print("Aimbot aktiviert!") end)

antiKick.MouseButton1Click:Connect(function() print("Anti-Kick aktiviert!") end)

