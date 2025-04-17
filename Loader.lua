-- Megzons MPS | Sicherer Mobile-Loader mit Key-System
local HttpService = game:GetService("HttpService")
local keyStorage = "MegzonshubMPS_Key_Used"
local savedKey = getgenv()[keyStorage]

local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source.lua"))()

local function loadMain()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Megzonshub/MPS-Mobile/main/Reach.lua"))()
end

if savedKey then
    loadMain()
    return
end

local Window = Rayfield:CreateWindow({
	Name = "Megzons MPS",
	LoadingTitle = "Key benötigt",
	LoadingSubtitle = "Bitte gib den Key ein",
	ConfigurationSaving = {
		Enabled = false,
	},
})

local Tab = Window:CreateTab("🔐 Key Login", 4483362458)

Tab:CreateParagraph({Title = "Key nötig", Content = "Gib unten deinen Key ein, um Megzons Script zu laden."})

Tab:CreateInput({
	Name = "Key eingeben",
	PlaceholderText = "z. B. Megzonshubmps",
	RemoveTextAfterFocusLost = false,
	Callback = function(input)
		local correctKey = game:HttpGet("https://raw.githubusercontent.com/Megzonshub/MPS-Mobile/main/key.txt")
		if input:lower() == correctKey:lower() then
			Rayfield:Notify({
				Title = "Key korrekt",
				Content = "Lade Megzons Script...",
				Duration = 4,
			})
			getgenv()[keyStorage] = true
			loadMain()
		else
			Rayfield:Notify({
				Title = "Falscher Key",
				Content = "Versuch es nochmal.",
				Duration = 4,
			})
		end
	end,
})
