-- Megzons MPS Loader mit Key-System (Delta/Handy ready)

local function isKeyValid(key)
	local correctKey = game:HttpGet("https://raw.githubusercontent.com/Megzonshub/MPS-Mobile/main/key.txt")
	return key == correctKey
end

local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source.lua"))()
local hasKeyFile = pcall(function() readfile("megzon_key.txt") end)

if hasKeyFile then
	local savedKey = readfile("megzon_key.txt")
	if isKeyValid(savedKey) then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Megzonshub/MPS-Mobile/main/Reach.lua"))()
		return
	end
end

local Window = Rayfield:CreateWindow({
	Name = "Megzons MPS | Key System",
	LoadingTitle = "Megzons Hub",
	LoadingSubtitle = "Authentifizierung...",
	ConfigurationSaving = {
		Enabled = false,
	},
})

Rayfield:Notify({
	Title = "Key benötigt!",
	Content = "Bitte gib den Key ein, um fortzufahren.",
	Duration = 6.5,
	Image = nil,
	Actions = {},
})

Rayfield:CreateInput({
	Name = "Key eingeben",
	PlaceholderText = "Key hier eingeben...",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		if isKeyValid(Text) then
			writefile("megzon_key.txt", Text)
			Rayfield:Notify({
				Title = "Erfolg!",
				Content = "Key akzeptiert!",
				Duration = 4,
			})
			wait(1)
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Megzonshub/MPS-Mobile/main/Reach.lua"))()
		else
			Rayfield:Notify({
				Title = "Fehler!",
				Content = "Ungültiger Key.",
				Duration = 4,
			})
		end
	end,
})
