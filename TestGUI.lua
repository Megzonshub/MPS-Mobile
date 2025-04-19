-- Megzons Custom GUI (Final)

-- Gui Setup local ScreenGui = Instance.new("ScreenGui") local Main = Instance.new("Frame") local Tabs = Instance.new("Frame") local ReachTab = Instance.new("TextButton") local AimbotTab = Instance.new("TextButton") local PowerTab = Instance.new("TextButton") local AntiTab = Instance.new("TextButton") local Title = Instance.new("TextLabel")

-- Tabs local ReachFrame = Instance.new("Frame") local AimbotFrame = Instance.new("Frame") local PowerFrame = Instance.new("Frame") local AntiFrame = Instance.new("Frame")

-- GUI Design ScreenGui.Name = "MegzonsGUI" ScreenGui.Parent = game.CoreGui

Main.Name = "Main" Main.Parent = ScreenGui Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30) Main.Position = UDim2.new(0.3, 0, 0.2, 0) Main.Size = UDim2.new(0, 300, 0, 320) Main.Active = true Main.Draggable = true

Tabs.Name = "Tabs" Tabs.Parent = Main Tabs.Size = UDim2.new(1, 0, 0, 30) Tabs.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local function makeTab(name, position) local tab = Instance.new("TextButton") tab.Size = UDim2.new(0, 75, 1, 0) tab.Position = UDim2.new(0, position, 0, 0) tab.BackgroundColor3 = Color3.fromRGB(40, 40, 40) tab.Text = name tab.TextColor3 = Color3.new(1, 1, 1) tab.Font = Enum.Font.SourceSansBold tab.TextSize = 14 tab.BorderSizePixel = 0 tab.Name = name .. "Tab" tab.Parent = Tabs return tab end

ReachTab = makeTab("Reach", 0) AimbotTab = makeTab("Aimbot", 75) PowerTab = makeTab("Power", 150) AntiTab = makeTab("Anti", 225)

local function makeContentFrame() local frame = Instance.new("Frame") frame.Size = UDim2.new(1, 0, 1, -30) frame.Position = UDim2.new(0, 0, 0, 30) frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35) frame.Visible = false frame.Parent = Main return frame end

ReachFrame = makeContentFrame() AimbotFrame = makeContentFrame() PowerFrame = makeContentFrame() AntiFrame = makeContentFrame()

local function showOnly(frame) for _, f in pairs({ReachFrame, AimbotFrame, PowerFrame, AntiFrame}) do f.Visible = false end frame.Visible = true end

ReachTab.MouseButton1Click:Connect(function() showOnly(ReachFrame) end) AimbotTab.MouseButton1Click:Connect(function() showOnly(AimbotFrame) end) PowerTab.MouseButton1Click:Connect(function() showOnly(PowerFrame) end) AntiTab.MouseButton1Click:Connect(function() showOnly(AntiFrame) end)

-- Reach Sliders local function makeReachSlider(label, default, callback) local box = Instance.new("TextBox") box.Size = UDim2.new(0, 250, 0, 30) box.Position = UDim2.new(0, 25, 0, 10 + (#ReachFrame:GetChildren() * 35)) box.BackgroundColor3 = Color3.fromRGB(50, 50, 50) box.Text = label .. ": " .. default box.TextColor3 = Color3.new(1,1,1) box.Font = Enum.Font.SourceSans box.TextSize = 16 box.Parent = ReachFrame box.FocusLost:Connect(function() local val = tonumber(box.Text:match("%d+")) if val then box.Text = label .. ": " .. val callback(val) end end) end

makeReachSlider("Foot Reach", 10, function(val) print("[Reach] Foot Reach set to", val) end)

makeReachSlider("GK Reach", 10, function(val) print("[Reach] GK Reach set to", val) end)

makeReachSlider("Arm Reach", 10, function(val) print("[Reach] Arm Reach set to", val) end)

-- Aimbot Button local aimbotBtn = Instance.new("TextButton") aimbotBtn.Size = UDim2.new(0, 250, 0, 30) aimbotBtn.Position = UDim2.new(0, 25, 0, 25) aimbotBtn.Text = "Enable Aimbot" aimbotBtn.TextColor3 = Color3.new(1,1,1) aimbotBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60) aimbotBtn.Parent = AimbotFrame aimbotBtn.MouseButton1Click:Connect(function() print("[Aimbot] Activated") end)

-- PowerShot Button local powerBtn = Instance.new("TextButton") powerBtn.Size = UDim2.new(0, 250, 0, 30) powerBtn.Position = UDim2.new(0, 25, 0, 25) powerBtn.Text = "Activate Powershot" powerBtn.TextColor3 = Color3.new(1,1,1) powerBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60) powerBtn.Parent = PowerFrame powerBtn.MouseButton1Click:Connect(function() print("[Powershot] Activated") end)

-- Anti-Kick Toggle local antiBtn = Instance.new("TextButton") antiBtn.Size = UDim2.new(0, 250, 0, 30) antiBtn.Position = UDim2.new(0, 25, 0, 25) antiBtn.Text = "Toggle Anti-Kick" antiBtn.TextColor3 = Color3.new(1,1,1) antiBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60) antiBtn.Parent = AntiFrame antiBtn.MouseButton1Click:Connect(function() print("[Anti-Kick] Toggled") end)

-- Initial visibility showOnly(ReachFrame) print("[Megzons GUI] Loaded")

