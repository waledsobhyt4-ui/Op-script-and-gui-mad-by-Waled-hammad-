local player = game.Players.LocalPlayer

-- Orion Lib laden
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Hauptfenster erstellen
local Window = OrionLib:MakeWindow({
    Name = "Example Hub (Rename This!)", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "OrionTest"
})

-- Tab erstellen
local Tab = Window:MakeTab({
    Name = "Tab 1", 
    Icon = "rbxassetid://4483345998", 
    PremiumOnly = false 
})

-- Willkommens-Notification
OrionLib:MakeNotification({
    Name = "Welcome!",
    Content = "Welcome to my hub!",
    Image = "rbxassetid://4483345998",
    Time = 5
})

-- Section für LocalPlayer
local Section = Tab:AddSection({
    Name = "LocalPlayer"
})

-- High Speed Button
Tab:AddButton({
    Name = "High Speed",
    Callback = function()
        if player.Character and player.Character.Humanoid then
            player.Character.Humanoid.WalkSpeed = 500
        end
    end
})

-- High Jump Power Button
Tab:AddButton({
    Name = "High Jump Power",
    Callback = function()
        if player.Character and player.Character.Humanoid then
            player.Character.Humanoid.JumpPower = 100
        end
    end
})

-- Low Gravity Button
Tab:AddButton({
    Name = "Low Gravity",
    Callback = function()
        game.Workspace.Gravity = 10
    end
})

-- Optionale: Reset Gravity Button
Tab:AddButton({
    Name = "Reset Gravity",
    Callback = function()
        game.Workspace.Gravity = 196.2
    end
})

-- Orion Lib initialisieren (wichtig!)
OrionLib:Init()
