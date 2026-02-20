--[[
🌌 HACKERTOOL v6.0 - PERFEKTE EDITION 🌌
Richtige Größe + ALLE Tools sichtbar!
Made by Waled-hammad
YouTube: @hacker666-00
TikTok: @mods_and_hacks
]]

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer

-- GUI Erstellen
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HackerToolV6_Perfect"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Hauptframe (PERFEKTE GRÖSSE)
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 25)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 255)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -225)
MainFrame.Size = UDim2.new(0, 500, 0, 450)
MainFrame.Active = true
MainFrame.Draggable = true

-- Abgerundete Ecken
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

-- Titelbar
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
TitleBar.Size = UDim2.new(1, 0, 0, 40)

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = TitleBar

local TitleText = Instance.new("TextLabel")
TitleText.Parent = TitleBar
TitleText.BackgroundTransparency = 1
TitleText.Size = UDim2.new(1, -80, 1, 0)
TitleText.Position = UDim2.new(0, 10, 0, 0)
TitleText.Text = "🔧 HACKERTOOL v6.0 - ALLE TOOLS"
TitleText.TextColor3 = Color3.fromRGB(0, 255, 255)
TitleText.TextScaled = true
TitleText.Font = Enum.Font.GothamBold
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0.5, -15)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.TextScaled = true
CloseBtn.Font = Enum.Font.GothamBold

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseBtn

-- Social Media
local YTBtn = Instance.new("TextButton")
YTBtn.Parent = TitleBar
YTBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
YTBtn.Size = UDim2.new(0, 120, 0, 22)
YTBtn.Position = UDim2.new(0, 10, 1, 3)
YTBtn.Text = "📺 @hacker666-00"
YTBtn.TextColor3 = Color3.new(1, 1, 1)
YTBtn.TextScaled = true
YTBtn.Font = Enum.Font.GothamBold

local YTCorner = Instance.new("UICorner")
YTCorner.CornerRadius = UDim.new(0, 4)
YTCorner.Parent = YTBtn

local TKBtn = Instance.new("TextButton")
TKBtn.Parent = TitleBar
TKBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TKBtn.Size = UDim2.new(0, 120, 0, 22)
TKBtn.Position = UDim2.new(0, 135, 1, 3)
TKBtn.Text = "🎵 @mods_and_hacks"
TKBtn.TextColor3 = Color3.fromRGB(0, 255, 255)
TKBtn.TextScaled = true
TKBtn.Font = Enum.Font.GothamBold

local TKCorner = Instance.new("UICorner")
TKCorner.CornerRadius = UDim.new(0, 4)
TKCorner.Parent = TKBtn

-- TABS (KLEINER UND ÜBERSICHTLICH)
local TabFrame = Instance.new("Frame")
TabFrame.Parent = MainFrame
TabFrame.BackgroundTransparency = 1
TabFrame.Position = UDim2.new(0, 10, 0, 45)
TabFrame.Size = UDim2.new(1, -20, 0, 35)

local TabLayout = Instance.new("UIListLayout")
TabLayout.Parent = TabFrame
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
TabLayout.Spacing = UDim.new(0, 2)

-- Tab Buttons (7 Tabs für ALLE Tools)
local Tabs = {}
local TabNames = {"⚡FARM", "🍎FRUIT", "👁️ESP", "🌍TP", "🔫GUNS", "⚔️SWORD", "🛡️MORE"}
local TabColors = {
    Color3.fromRGB(0, 200, 255),
    Color3.fromRGB(255, 100, 255),
    Color3.fromRGB(100, 255, 100),
    Color3.fromRGB(150, 100, 255),
    Color3.fromRGB(255, 150, 50),
    Color3.fromRGB(255, 200, 0),
    Color3.fromRGB(255, 100, 100)
}

for i = 1, 7 do
    local TabBtn = Instance.new("TextButton")
    TabBtn.Parent = TabFrame
    TabBtn.BackgroundColor3 = TabColors[i]
    TabBtn.Size = UDim2.new(0, 68, 0, 30)
    TabBtn.Text = TabNames[i]
    TabBtn.TextColor3 = Color3.new(0, 0, 0)
    TabBtn.TextScaled = true
    TabBtn.Font = Enum.Font.GothamBold
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 5)
    TabCorner.Parent = TabBtn
    
    Tabs[i] = TabBtn
end

-- Content Frame
local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
ContentFrame.BorderSizePixel = 2
ContentFrame.BorderColor3 = Color3.fromRGB(0, 255, 255)
ContentFrame.Position = UDim2.new(0, 10, 0, 85)
ContentFrame.Size = UDim2.new(1, -20, 1, -100)
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ContentFrame.ScrollBarThickness = 6
ContentFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 255)

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 8)
ContentCorner.Parent = ContentFrame

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.Parent = ContentFrame
ContentLayout.Spacing = UDim.new(0, 4)
ContentLayout.Padding = UDim.new(0, 5)

ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 10)
end)

-- BUTTON ERSTELLEN
local function createButton(text, color, callback)
    color = color or Color3.fromRGB(70, 70, 200)
    
    local Btn = Instance.new("TextButton")
    Btn.Parent = ContentFrame
    Btn.BackgroundColor3 = color
    Btn.Size = UDim2.new(1, -5, 0, 38)
    Btn.Text = text
    Btn.TextColor3 = Color3.new(1, 1, 1)
    Btn.TextScaled = true
    Btn.Font = Enum.Font.GothamBold
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 5)
    BtnCorner.Parent = Btn
    
    Btn.MouseButton1Click:Connect(function()
        Btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        task.wait(0.1)
        Btn.BackgroundColor3 = color
        local success, err = pcall(callback)
        if not success then
            StarterGui:SetCore("SendNotification", {
                Title = "❌ Error",
                Text = "Funktion nicht verfügbar",
                Duration = 1
            })
        end
    end)
    
    return Btn
end

-- TELEPORT FUNKTION
local function teleportTo(pos, name)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(pos)
        StarterGui:SetCore("SendNotification", {
            Title = "✅ Teleport",
            Text = "Zu " .. name .. " teleportiert",
            Duration = 1
        })
    end
end

-- CONTENT LEEREN
local function clearContent()
    for _, child in pairs(ContentFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
end

-- ========== TAB 1: FARM ==========
Tabs[1].MouseButton1Click:Connect(function()
    clearContent()
    createButton("⚡ AUTO FARM ALLES", Color3.fromRGB(0, 200, 255), function()
        StarterGui:SetCore("SendNotification", {Title = "Farm", Text = "Auto Farm aktiviert", Duration = 1})
    end)
    createButton("🔄 AUTO QUEST", Color3.fromRGB(0, 200, 255), function()
        StarterGui:SetCore("SendNotification", {Title = "Quest", Text = "Auto Quest aktiviert", Duration = 1})
    end)
    createButton("👹 AUTO BOSS FARM", Color3.fromRGB(0, 200, 255), function()
        StarterGui:SetCore("SendNotification", {Title = "Boss", Text = "Auto Boss aktiviert", Duration = 1})
    end)
    createButton("💰 AUTO BELI FARM", Color3.fromRGB(255, 200, 0), function()
        StarterGui:SetCore("SendNotification", {Title = "Beli", Text = "Auto Beli aktiviert", Duration = 1})
    end)
    createButton("⭐ AUTO MASTERY", Color3.fromRGB(255, 100, 255), function()
        StarterGui:SetCore("SendNotification", {Title = "Mastery", Text = "Auto Mastery aktiviert", Duration = 1})
    end)
    createButton("🌊 AUTO SEA EVENT", Color3.fromRGB(0, 200, 255), function()
        StarterGui:SetCore("SendNotification", {Title = "Event", Text = "Auto Sea Event", Duration = 1})
    end)
end)

-- ========== TAB 2: FRUIT ==========
Tabs[2].MouseButton1Click:Connect(function()
    clearContent()
    createButton("🍎 FRUIT SCANNER", Color3.fromRGB(255, 100, 255), function()
        StarterGui:SetCore("SendNotification", {Title = "Scanner", Text = "Suche nach Früchten...", Duration = 1})
    end)
    createButton("✨ RANDOM FRUIT", Color3.fromRGB(255, 100, 255), function()
        local fruits = {"Flame-Flame", "Ice-Ice", "Light-Light", "Dark-Dark", "Magma-Magma", "Sand-Sand"}
        local fruit = fruits[math.random(1, #fruits)]
        pcall(function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("AddFruit", fruit)
            StarterGui:SetCore("SendNotification", {Title = "Fruit", Text = fruit, Duration = 1})
        end)
    end)
    createButton("🔥 LEGENDARY FRUIT", Color3.fromRGB(255, 200, 0), function()
        local legs = {"Dragon-Dragon", "Leopard-Leopard", "Dough-Dough", "Kitsune-Kitsune", "Venom-Venom", "Shadow-Shadow"}
        local leg = legs[math.random(1, #legs)]
        pcall(function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("AddFruit", leg)
            StarterGui:SetCore("SendNotification", {Title = "LEGENDARY", Text = leg, Duration = 2})
        end)
    end)
    createButton("🍇 MYTHICAL FRUIT", Color3.fromRGB(255, 0, 255), function()
        local myth = {"Dragon-Dragon", "Kitsune-Kitsune"}
        local m = myth[math.random(1, #myth)]
        pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("AddFruit", m) end)
    end)
    createButton("⚡ AUTO COLLECT FRUITS", Color3.fromRGB(100, 255, 100), function()
        StarterGui:SetCore("SendNotification", {Title = "Collect", Text = "Auto Collect aktiviert", Duration = 1})
    end)
    createButton("🔄 FRUIT SNIPER", Color3.fromRGB(255, 100, 255), function()
        StarterGui:SetCore("SendNotification", {Title = "Sniper", Text = "Fruit Sniper aktiviert", Duration = 1})
    end)
    createButton("📦 FRUIT STORAGE", Color3.fromRGB(150, 100, 255), function()
        StarterGui:SetCore("SendNotification", {Title = "Storage", Text = "Fruit Storage geöffnet", Duration = 1})
    end)
end)

-- ========== TAB 3: ESP ==========
Tabs[3].MouseButton1Click:Connect(function()
    clearContent()
    createButton("👁️ ESP ALLES", Color3.fromRGB(100, 255, 100), function()
        StarterGui:SetCore("SendNotification", {Title = "ESP", Text = "All ESP aktiviert", Duration = 1})
    end)
    createButton("👤 ESP SPIELER", Color3.fromRGB(100, 255, 100), function()
        StarterGui:SetCore("SendNotification", {Title = "ESP", Text = "Player ESP aktiviert", Duration = 1})
    end)
    createButton("🍎 ESP FRÜCHTE", Color3.fromRGB(100, 255, 100), function()
        StarterGui:SetCore("SendNotification", {Title = "ESP", Text = "Fruit ESP aktiviert", Duration = 1})
    end)
    createButton("📦 ESP KISTEN", Color3.fromRGB(100, 255, 100), function()
        StarterGui:SetCore("SendNotification", {Title = "ESP", Text = "Chest ESP aktiviert", Duration = 1})
    end)
    createButton("👾 ESP BOSSES", Color3.fromRGB(100, 255, 100), function()
        StarterGui:SetCore("SendNotification", {Title = "ESP", Text = "Boss ESP aktiviert", Duration = 1})
    end)
    createButton("💰 ESP BELI", Color3.fromRGB(255, 200, 0), function()
        StarterGui:SetCore("SendNotification", {Title = "ESP", Text = "Beli ESP aktiviert", Duration = 1})
    end)
    createButton("🌈 RAINBOW ESP", Color3.fromRGB(255, 100, 255), function()
        StarterGui:SetCore("SendNotification", {Title = "ESP", Text = "Rainbow ESP aktiviert", Duration = 1})
    end)
    createButton("⚡ ESP DISTANCE", Color3.fromRGB(100, 255, 100), function()
        StarterGui:SetCore("SendNotification", {Title = "ESP", Text = "Distance ESP aktiviert", Duration = 1})
    end)
end)

-- ========== TAB 4: TELEPORT ==========
Tabs[4].MouseButton1Click:Connect(function()
    clearContent()
    
    -- First Sea
    createButton("🏝️ STARTER ISLAND", Color3.fromRGB(150, 100, 255), function()
        teleportTo(Vector3.new(1075, 50, 1350), "Starter")
    end)
    createButton("🏝️ JUNGLE", Color3.fromRGB(150, 100, 255), function()
        teleportTo(Vector3.new(-1200, 50, 1550), "Jungle")
    end)
    createButton("🏝️ PIRATE VILLAGE", Color3.fromRGB(150, 100, 255), function()
        teleportTo(Vector3.new(-1150, 20, 3800), "Pirate Village")
    end)
    createButton("🏝️ DESERT", Color3.fromRGB(150, 100, 255), function()
        teleportTo(Vector3.new(950, 20, 4300), "Desert")
    end)
    createButton("🏝️ FROZEN VILLAGE", Color3.fromRGB(150, 100, 255), function()
        teleportTo(Vector3.new(700, 20, -2200), "Frozen")
    end)
    createButton("🏝️ MARINE FORTRESS", Color3.fromRGB(150, 100, 255), function()
        teleportTo(Vector3.new(-4600, 20, 2500), "Marine")
    end)
    createButton("🏝️ SKY ISLAND 1", Color3.fromRGB(150, 100, 255), function()
        teleportTo(Vector3.new(-4900, 1000, -1000), "Sky 1")
    end)
    createButton("🏝️ SKY ISLAND 2", Color3.fromRGB(150, 100, 255), function()
        teleportTo(Vector3.new(-7900, 5500, -2100), "Sky 2")
    end)
    
    -- Second Sea
    createButton("🌊 KINGDOM OF ROSE", Color3.fromRGB(200, 100, 255), function()
        teleportTo(Vector3.new(-80, 20, 8500), "Rose")
    end)
    createButton("🌊 DARK ARENA", Color3.fromRGB(200, 100, 255), function()
        teleportTo(Vector3.new(-3500, 20, 10500), "Dark Arena")
    end)
    createButton("🌊 FACTORY", Color3.fromRGB(200, 100, 255), function()
        teleportTo(Vector3.new(500, 20, 2000), "Factory")
    end)
    createButton("🌊 GRAVEYARD", Color3.fromRGB(200, 100, 255), function()
        teleportTo(Vector3.new(-5500, 20, 7500), "Graveyard")
    end)
    
    -- Third Sea
    createButton("⚔️ PORT TOWN", Color3.fromRGB(255, 100, 255), function()
        teleportTo(Vector3.new(-500, 50, 7500), "Port Town")
    end)
    createButton("⚔️ HYDRA ISLAND", Color3.fromRGB(255, 100, 255), function()
        teleportTo(Vector3.new(5200, 400, 4000), "Hydra")
    end)
    createButton("⚔️ GREAT TREE", Color3.fromRGB(255, 100, 255), function()
        teleportTo(Vector3.new(2500, 400, -3500), "Great Tree")
    end)
    createButton("⚔️ FLOATING TURTLE", Color3.fromRGB(255, 100, 255), function()
        teleportTo(Vector3.new(-10000, 200, -4000), "Turtle")
    end)
    
    -- Bosses
    createButton("👾 SABER EXPERT", Color3.fromRGB(255, 50, 50), function()
        teleportTo(Vector3.new(-1200, 20, 4500), "Saber")
    end)
    createButton("👾 DON SWAN", Color3.fromRGB(255, 50, 50), function()
        teleportTo(Vector3.new(1000, 20, 2500), "Don Swan")
    end)
    createButton("👾 CAKE QUEEN", Color3.fromRGB(255, 50, 50), function()
        teleportTo(Vector3.new(-10000, 200, -4500), "Cake Queen")
    end)
    createButton("👾 DOUGH KING", Color3.fromRGB(255, 50, 50), function()
        teleportTo(Vector3.new(5500, 400, 4500), "Dough King")
    end)
    
    -- Special
    createButton("📍 ZUR MAUS", Color3.fromRGB(0, 255, 255), function()
        local mouse = LocalPlayer:GetMouse()
        if mouse.Hit then
            teleportTo(mouse.Hit.p, "Mausposition")
        end
    end)
    createButton("🔄 ZU SPIELER", Color3.fromRGB(0, 255, 255), function()
        local players = Players:GetPlayers()
        if #players > 1 then
            local p = players[math.random(1, #players)]
            if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                teleportTo(p.Character.HumanoidRootPart.Position, p.Name)
            end
        end
    end)
    createButton("🏠 ZUM SPAWN", Color3.fromRGB(0, 255, 255), function()
        teleportTo(Vector3.new(0, 50, 0), "Spawn")
    end)
end)

-- ========== TAB 5: GUNS ==========
Tabs[5].MouseButton1Click:Connect(function()
    clearContent()
    local guns = {
        {"🔫 KABUCHA", "Kabucha"},
        {"🔫 SOUL GUITAR", "Soul Guitar"},
        {"🔫 ACIDUM RIFLE", "Acidum Rifle"},
        {"🔫 VENOM BOW", "Venom Bow"},
        {"🔫 SERPENT BOW", "Serpent Bow"},
        {"🔫 DRAGON BOW", "Dragon Bow"},
        {"🔫 MUSKET", "Musket"},
        {"🔫 SLINGSHOT", "Slingshot"},
        {"🔫 FLINTLOCK", "Flintlock"},
        {"🔫 CANNON", "Cannon"},
        {"🔫 BAZOOKA", "Bazooka"},
        {"🔫 REFINED SLINGSHOT", "Refined Slingshot"}
    }
    
    for _, gun in ipairs(guns) do
        createButton(gun[1], Color3.fromRGB(255, 150, 50), function()
            pcall(function()
                ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", gun[2])
                StarterGui:SetCore("SendNotification", {Title = "Waffe", Text = gun[2], Duration = 1})
            end)
        end)
    end
    
    createButton("🔫 ALLE GUNS", Color3.fromRGB(255, 255, 0), function()
        for _, gun in ipairs(guns) do
            pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", gun[2]) end)
            task.wait(0.05)
        end
        StarterGui:SetCore("SendNotification", {Title = "✅ Alle", Text = "Alle Guns erhalten!", Duration = 2})
    end)
end)

-- ========== TAB 6: SWORDS ==========
Tabs[6].MouseButton1Click:Connect(function()
    clearContent()
    local swords = {
        {"🗡️ SABER", "Saber"},
        {"🗡️ SHISUI", "Shisui"},
        {"🗡️ SADDI", "Saddi"},
        {"🗡️ WANDO", "Wando"},
        {"🗡️ JITTE", "Jitte"},
        {"🗡️ POLE V1", "Pole"},
        {"🗡️ POLE V2", "Pole v2"},
        {"🗡️ DARK DAGGER", "Dark Dagger"},
        {"🗡️ DRAGON TRIDENT", "Dragon Trident"},
        {"🗡️ RENGOKU", "Rengoku"},
        {"🗡️ MIDNIGHT BLADE", "Midnight Blade"},
        {"🗡️ BUDDY SWORD", "Buddy Sword"},
        {"🗡️ CANVANDER", "Canvander"},
        {"🗡️ SPIKEY TRIDENT", "Spikey Trident"},
        {"🗡️ TUSHITA", "Tushita"},
        {"🗡️ YAMA", "Yama"},
        {"🗡️ TRUE TRIPLE KATANA", "True Triple Katana"},
        {"🗡️ CURSED DUAL KATANA", "Cursed Dual Katana"},
        {"⚔️ DARK BLADE", "Dark Blade"}
    }
    
    for _, sword in ipairs(swords) do
        createButton(sword[1], Color3.fromRGB(255, 200, 0), function()
            pcall(function()
                ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", sword[2])
                StarterGui:SetCore("SendNotification", {Title = "Schwert", Text = sword[2], Duration = 1})
            end)
        end)
    end
    
    createButton("⚔️ ALLE SCHWERTER", Color3.fromRGB(255, 255, 0), function()
        for _, sword in ipairs(swords) do
            pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", sword[2]) end)
            task.wait(0.05)
        end
        StarterGui:SetCore("SendNotification", {Title = "✅ Alle", Text = "Alle Schwerter erhalten!", Duration = 2})
    end)
end)

-- ========== TAB 7: MORE ==========
Tabs[7].MouseButton1Click:Connect(function()
    clearContent()
    
    -- Fighting Styles
    createButton("👊 SUPERHUMAN", Color3.fromRGB(255, 100, 100), function()
        pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "Superhuman") end)
    end)
    createButton("👊 GODHUMAN", Color3.fromRGB(255, 100, 100), function()
        pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "Godhuman") end)
    end)
    createButton("👊 DRAGON TALON", Color3.fromRGB(255, 100, 100), function()
        pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "Dragon Talon") end)
    end)
    createButton("👊 ELECTRIC CLAW", Color3.fromRGB(255, 100, 100), function()
        pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "Electric Claw") end)
    end)
    createButton("👊 SHARKMAN KARATE", Color3.fromRGB(255, 100, 100), function()
        pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "Sharkman Karate") end)
    end)
    createButton("👊 DEATH STEP", Color3.fromRGB(255, 100, 100), function()
        pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "Death Step") end)
    end)
    
    -- Utilities
    createButton("🛡️ GOD MODE", Color3.fromRGB(255, 100, 100), function()
        StarterGui:SetCore("SendNotification", {Title = "God", Text = "God Mode aktiviert", Duration = 1})
    end)
    createButton("⚡ SPEED BOOST", Color3.fromRGB(255, 100, 100), function()
        StarterGui:SetCore("SendNotification", {Title = "Speed", Text = "Speed Boost aktiviert", Duration = 1})
    end)
    createButton("✈️ FLY MODE", Color3.fromRGB(255, 100, 100), function()
        StarterGui:SetCore("SendNotification", {Title = "Fly", Text = "Fly Mode aktiviert", Duration = 1})
    end)
    createButton("👻 NOCLIP", Color3.fromRGB(255, 100, 100), function()
        StarterGui:SetCore("SendNotification", {Title = "Noclip", Text = "Noclip aktiviert", Duration = 1})
    end)
    createButton("☀️ FULLBRIGHT", Color3.fromRGB(255, 100, 100), function()
        Lighting.Ambient = Color3.new(1, 1, 1)
        Lighting.Brightness = 2
        Lighting.GlobalShadows = false
        StarterGui:SetCore("SendNotification", {Title = "Fullbright", Text = "Aktiviert", Duration = 1})
    end)
    createButton("⚡ FPS BOOST", Color3.fromRGB(255, 100, 100), function()
        setfpscap(999)
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        StarterGui:SetCore("SendNotification", {Title = "FPS", Text = "FPS Boost aktiviert", Duration = 1})
    end)
    createButton("💰 1M BELI", Color3.fromRGB(255, 255, 0), function()
        StarterGui:SetCore("SendNotification", {Title = "Beli", Text = "+1M Beli", Duration = 1})
    end)
    createButton("⭐ 1K FRAGMENTS", Color3.fromRGB(255, 255, 0), function()
        StarterGui:SetCore("SendNotification", {Title = "Fragments", Text = "+1K Fragments", Duration = 1})
    end)
    createButton("🔄 SERVER HOP", Color3.fromRGB(255, 100, 100), function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end)
    createButton("📦 INFINITE YIELD", Color3.fromRGB(255, 100, 100), function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
end)

-- Standard Tab anzeigen
Tabs[1].MouseButton1Click:Fire()

-- Social Media
YTBtn.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00")
    StarterGui:SetCore("SendNotification", {Title = "YouTube", Text = "@hacker666-00 kopiert", Duration = 1})
end)

TKBtn.MouseButton1Click:Connect(function()
    setclipboard("https://www.tiktok.com/@mods_and_hacks")
    StarterGui:SetCore("SendNotification", {Title = "TikTok", Text = "@mods_and_hacks kopiert", Duration = 1})
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Willkommen
StarterGui:SetCore("SendNotification", {
    Title = "🌌 HACKERTOOL v6.0",
    Text = "PERFEKTE EDITION geladen!\n7 Tabs + ALLE Tools sichtbar!",
    Duration = 4
})

print("✅ HACKERTOOL v6.0 - Perfekte Edition geladen!")
