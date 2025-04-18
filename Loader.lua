-- Megzons MPS Loader ohne GUI (mit sichtbarer Bestätigung)
local key = "Megzonshubmps"

if _G.Key == key then
    game.StarterGui:SetCore("SendNotification", {
        Title = "Zugang erlaubt!";
        Text = "Key korrekt – Reach wird geladen...";
        Duration = 4;
    })

    -- Reach Script von GitHub laden
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Megzonshub/MPSMobile/main/Reach.lua"))()
else
    game.StarterGui:SetCore("SendNotification", {
        Title = "Falscher Key!";
        Text = "Zugriff verweigert.";
        Duration = 4;
    })
end
