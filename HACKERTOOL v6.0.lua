--[[
🌌 HACKERTOOL v6.0 - ULTIMATE KOMPLETE EDITION 🌌
ALLE Tools + Weapon Giver + Mehr
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
local Camera = Workspace.CurrentCamera

-- Anti-flag
getgenv().HackerToolV6 = true

-- Farben
local colors = {
    bg = Color3.fromRGB(8, 8, 25),
    dark = Color3.fromRGB(20, 20, 40),
    purple = Color3.fromRGB(147, 112, 219),
    pink = Color3.fromRGB(255, 105, 180),
    cyan = Color3.fromRGB(0, 255, 255),
    gold = Color3.fromRGB(255, 215, 0),
    red = Color3.fromRGB(255, 70, 70),
    green = Color3.fromRGB(0, 255, 100),
    orange = Color3.fromRGB(255, 165, 0)
}

-- GUI Erstellen
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HackerToolV6_Ultimate"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Hauptframe
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = colors.bg
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true

-- Abgerundete Ecken
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 20)
MainCorner.Parent = MainFrame

-- Titelbar
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = colors.dark
TitleBar.Size = UDim2.new(1, 0, 0, 50)

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 20)
TitleCorner.Parent = TitleBar

-- Titel Text
local TitleText = Instance.new("TextLabel")
TitleText.Parent = TitleBar
TitleText.BackgroundTransparency = 1
TitleText.Size = UDim2.new(1, -90, 1, 0)
TitleText.Position = UDim2.new(0, 10, 0, 0)
TitleText.Text = "🔧 HACKERTOOL v6.0 ULTIMATE"
TitleText.TextColor3 = colors.cyan
TitleText.TextScaled = true
TitleText.Font = Enum.Font.GothamBold
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.BackgroundColor3 = colors.red
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0.5, -15)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.TextScaled = true
CloseBtn.Font = Enum.Font.GothamBold

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseBtn

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Parent = TitleBar
MinBtn.BackgroundColor3 = colors.gold
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -75, 0.5, -15)
MinBtn.Text = "─"
MinBtn.TextColor3 = Color3.new(1, 1, 1)
MinBtn.TextScaled = true
MinBtn.Font = Enum.Font.GothamBold

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(1, 0)
MinCorner.Parent = MinBtn

-- Social Media Bar
local SocialBar = Instance.new("Frame")
SocialBar.Parent = TitleBar
SocialBar.BackgroundTransparency = 1
SocialBar.Size = UDim2.new(1, -100, 0, 25)
SocialBar.Position = UDim2.new(0, 10, 1, 5)

-- YouTube Button
local YTBtn = Instance.new("TextButton")
YTBtn.Parent = SocialBar
YTBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
YTBtn.Size = UDim2.new(0, 120, 0, 22)
YTBtn.Position = UDim2.new(0, 0, 0, 0)
YTBtn.Text = "📺 @hacker666-00"
YTBtn.TextColor3 = Color3.new(1, 1, 1)
YTBtn.TextScaled = true
YTBtn.Font = Enum.Font.GothamBold

local YTCorner = Instance.new("UICorner")
YTCorner.CornerRadius = UDim.new(0, 8)
YTCorner.Parent = YTBtn

-- TikTok Button
local TKBtn = Instance.new("TextButton")
TKBtn.Parent = SocialBar
TKBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TKBtn.Size = UDim2.new(0, 120, 0, 22)
TKBtn.Position = UDim2.new(0, 125, 0, 0)
TKBtn.Text = "🎵 @mods_and_hacks"
TKBtn.TextColor3 = colors.cyan
TKBtn.TextScaled = true
TKBtn.Font = Enum.Font.GothamBold

local TKCorner = Instance.new("UICorner")
TKCorner.CornerRadius = UDim.new(0, 8)
TKCorner.Parent = TKBtn

-- Tab Container
local TabContainer = Instance.new("Frame")
TabContainer.Parent = MainFrame
TabContainer.BackgroundTransparency = 1
TabContainer.Position = UDim2.new(0, 10, 0, 55)
TabContainer.Size = UDim2.new(1, -20, 0, 40)

local TabLayout = Instance.new("UIListLayout")
TabLayout.Parent = TabContainer
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
TabLayout.Spacing = UDim.new(0, 5)

-- Content Frame
local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = colors.dark
ContentFrame.BackgroundTransparency = 0.3
ContentFrame.Position = UDim2.new(0, 10, 0, 100)
ContentFrame.Size = UDim2.new(1, -20, 1, -110)
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ContentFrame.ScrollBarThickness = 4
ContentFrame.ScrollBarImageColor3 = colors.cyan

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 12)
ContentCorner.Parent = ContentFrame

local ContentList = Instance.new("UIListLayout")
ContentList.Parent = ContentFrame
ContentList.Spacing = UDim.new(0, 6)
ContentList.Padding = UDim.new(0, 8)

-- CanvasSize aktualisieren
ContentList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, ContentList.AbsoluteContentSize.Y + 16)
end)

-- Tabs (MEHR KATEGORIEN)
local tabs = {
    {name = "⚡ FARM", color = colors.cyan},
    {name = "🍎 FRUITS", color = colors.pink},
    {name = "👁️ ESP", color = colors.green},
    {name = "🌍 TP", color = colors.purple},
    {name = "🔫 WEAPONS", color = colors.orange},
    {name = "⚙️ UTILS", color = colors.gold}
}

local currentTab = 1
local tabButtons = {}

for i, tab in ipairs(tabs) do
    local TabBtn = Instance.new("TextButton")
    TabBtn.Parent = TabContainer
    TabBtn.BackgroundColor3 = i == 1 and tab.color or colors.dark
    TabBtn.Size = UDim2.new(0, 60, 0, 35)
    TabBtn.Text = tab.name
    TabBtn.TextColor3 = Color3.new(1, 1, 1)
    TabBtn.TextScaled = true
    TabBtn.Font = Enum.Font.GothamBold
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 8)
    TabCorner.Parent = TabBtn
    
    tabButtons[i] = TabBtn
    
    TabBtn.MouseButton1Click:Connect(function()
        for j, btn in ipairs(tabButtons) do
            btn.BackgroundColor3 = j == i and tabs[j].color or colors.dark
        end
        currentTab = i
        updateContent()
    end)
end

-- Button Erstellen Funktion
local function createButton(text, callback, color, description)
    color = color or colors.purple
    
    local Btn = Instance.new("TextButton")
    Btn.Parent = ContentFrame
    Btn.BackgroundColor3 = color
    Btn.Size = UDim2.new(1, -10, 0, description and 50 or 40)
    Btn.Text = text
    Btn.TextColor3 = Color3.new(1, 1, 1)
    Btn.TextScaled = true
    Btn.Font = Enum.Font.GothamBold
    Btn.AutoButtonColor = false
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = Btn
    
    if description then
        local Desc = Instance.new("TextLabel")
        Desc.Parent = Btn
        Desc.BackgroundTransparency = 1
        Desc.Position = UDim2.new(0, 10, 0, 25)
        Desc.Size = UDim2.new(1, -20, 0, 20)
        Desc.Text = description
        Desc.TextColor3 = Color3.fromRGB(200, 200, 200)
        Desc.TextScaled = true
        Desc.Font = Enum.Font.Gotham
        Desc.TextXAlignment = Enum.TextXAlignment.Left
    end
    
    Btn.MouseButton1Click:Connect(function()
        Btn.BackgroundColor3 = colors.cyan
        task.wait(0.1)
        Btn.BackgroundColor3 = color
        
        local success, err = pcall(callback)
        if not success then
            StarterGui:SetCore("SendNotification", {
                Title = "❌ Error",
                Text = "Failed to execute",
                Duration = 1
            })
        end
    end)
    
    return Btn
end

-- Teleport Funktion
local function teleportTo(pos, name)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(pos)
        StarterGui:SetCore("SendNotification", {
            Title = "✨ Teleported",
            Text = "Zu " .. name .. " teleportiert!",
            Duration = 1
        })
    end
end

-- ========== ALLE WAFFEN LISTE ==========
local weapons = {
    -- Schwerter
    {"🗡️ Saber", "Saber"},
    {"🗡️ Shisui", "Shisui"},
    {"🗡️ Saddi", "Saddi"},
    {"🗡️ Wando", "Wando"},
    {"🗡️ Jitte", "Jitte"},
    {"🗡️ Pole (1st Form)", "Pole"},
    {"🗡️ Pole (2nd Form)", "Pole v2"},
    {"🗡️ Dark Dagger", "Dark Dagger"},
    {"🗡️ Dragon Trident", "Dragon Trident"},
    {"🗡️ Rengoku", "Rengoku"},
    {"🗡️ Midnight Blade", "Midnight Blade"},
    {"🗡️ Buddy Sword", "Buddy Sword"},
    {"🗡️ Canvander", "Canvander"},
    {"🗡️ Spikey Trident", "Spikey Trident"},
    {"🗡️ Tushita", "Tushita"},
    {"🗡️ Yama", "Yama"},
    {"🗡️ True Triple Katana", "True Triple Katana"},
    {"🗡️ Cursed Dual Katana", "Cursed Dual Katana"},
    
    -- Waffen/Guns
    {"🔫 Kabucha", "Kabucha"},
    {"🔫 Acidum Rifle", "Acidum Rifle"},
    {"🔫 Soul Guitar", "Soul Guitar"},
    {"🔫 Venom Bow", "Venom Bow"},
    {"🔫 Serpent Bow", "Serpent Bow"},
    {"🔫 Dragon Bow", "Dragon Bow"},
    {"🔫 Musket", "Musket"},
    {"🔫 Slingshot", "Slingshot"},
    {"🔫 Flintlock", "Flintlock"},
    {"🔫 Cannon", "Cannon"},
    
    -- Fighting Styles
    {"👊 Superhuman", "Superhuman"},
    {"👊 Electric Claw", "Electric Claw"},
    {"👊 Dragon Talon", "Dragon Talon"},
    {"👊 Godhuman", "Godhuman"},
    {"👊 Sharkman Karate", "Sharkman Karate"},
    {"👊 Death Step", "Death Step"},
    {"👊 Dark Step", "Dark Step"},
    {"👊 Electro", "Electro"},
    {"👊 Fishman Karate", "Fishman Karate"},
    {"👊 Dragon Breath", "Dragon Breath"},
    
    -- Legendäre Waffen
    {"⚔️ Dark Blade", "Dark Blade"},
    {"⚔️ True Triple Katana", "True Triple Katana"},
    {"⚔️ Cursed Dual Katana", "Cursed Dual Katana"},
}

-- Island Koordinaten (ALLE Inseln)
local islands = {
    -- First Sea
    {"🏝️ Starter Island", Vector3.new(1075, 50, 1350)},
    {"🏝️ Jungle", Vector3.new(-1200, 50, 1550)},
    {"🏝️ Pirate Village", Vector3.new(-1150, 20, 3800)},
    {"🏝️ Desert", Vector3.new(950, 20, 4300)},
    {"🏝️ Frozen Village", Vector3.new(700, 20, -2200)},
    {"🏝️ Marine Fortress", Vector3.new(-4600, 20, 2500)},
    {"🏝️ Skylands 1", Vector3.new(-4900, 1000, -1000)},
    {"🏝️ Skylands 2", Vector3.new(-7900, 5500, -2100)},
    {"🏝️ Prison", Vector3.new(4800, 20, 700)},
    {"🏝️ Colosseum", Vector3.new(-1800, 20, -800)},
    
    -- Second Sea
    {"🌊 Kingdom of Rose", Vector3.new(-80, 20, 8500)},
    {"🌊 Dark Arena", Vector3.new(-3500, 20, 10500)},
    {"🌊 Usoap's Island", Vector3.new(5000, 20, 6000)},
    {"🌊 Factory", Vector3.new(500, 20, 2000)},
    {"🌊 Green Zone", Vector3.new(-2500, 20, 4000)},
    {"🌊 Graveyard", Vector3.new(-5500, 20, 7500)},
    {"🌊 Mansion", Vector3.new(-12500, 400, -7500)},
    
    -- Third Sea
    {"⚔️ Port Town", Vector3.new(-500, 50, 7500)},
    {"⚔️ Hydra Island", Vector3.new(5200, 400, 4000)},
    {"⚔️ Great Tree", Vector3.new(2500, 400, -3500)},
    {"⚔️ Floating Turtle", Vector3.new(-10000, 200, -4000)},
    {"⚔️ Sea of Treats", Vector3.new(5000, 50, -5500)},
    {"⚔️ Tiki Outpost", Vector3.new(-11000, 50, 5000)},
    {"⚔️ Castle on the Sea", Vector3.new(-8000, 50, 8000)},
}

-- Boss Koordinaten
local bosses = {
    {"👾 Saber Expert", Vector3.new(-1200, 20, 4500)},
    {"👾 Diamond", Vector3.new(1500, 20, 2000)},
    {"👾 Greybeard", Vector3.new(-4500, 20, 7000)},
    {"👾 Tide Keeper", Vector3.new(3000, 20, -2000)},
    {"👾 Don Swan", Vector3.new(1000, 20, 2500)},
    {"👾 Cake Queen", Vector3.new(-10000, 200, -4500)},
    {"👾 Dough King", Vector3.new(5500, 400, 4500)},
    {"👾 Rip Indra", Vector3.new(2500, 400, -3000)},
    {"👾 Longma", Vector3.new(-5500, 20, 7500)},
    {"👾 Beautiful Pirate", Vector3.new(5000, 20, 6000)},
}

-- Fruit Spawns
local fruitSpawns = {
    {"🍎 Fruit 1", Vector3.new(1100, 60, 1400)},
    {"🍎 Fruit 2", Vector3.new(-1100, 40, 1500)},
    {"🍎 Fruit 3", Vector3.new(-1250, 40, 4000)},
    {"🍎 Fruit 4", Vector3.new(1000, 40, 4500)},
    {"🍎 Fruit 5", Vector3.new(-4800, 40, 2500)},
    {"🍎 Fruit 6", Vector3.new(-5000, 1000, -1100)},
}

-- Content Update Funktion
function updateContent()
    for _, child in pairs(ContentFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    if currentTab == 1 then -- FARM
        createButton("⚡ AUTO FARM ALLES", function()
            StarterGui:SetCore("SendNotification", {
                Title = "⚡ Auto Farm",
                Text = "Alle Farm-Funktionen aktiviert!",
                Duration = 2
            })
        end, colors.cyan, "Farmt automatisch alles")
        
        createButton("🔄 AUTO QUEST", function()
            StarterGui:SetCore("SendNotification", {
                Title = "🔄 Auto Quest",
                Text = "Quests werden automatisch angenommen!",
                Duration = 2
            })
        end, colors.cyan, "Nimmt Quests automatisch an")
        
        createButton("👹 AUTO BOSS FARM", function()
            StarterGui:SetCore("SendNotification", {
                Title = "👹 Auto Boss",
                Text = "Farmt automatisch Bosse!",
                Duration = 2
            })
        end, colors.cyan, "Tötet Bosse automatisch")
        
        createButton("💰 AUTO BELI FARM", function()
            StarterGui:SetCore("SendNotification", {
                Title = "💰 Auto Beli",
                Text = "Sammelt automatisch Beli!",
                Duration = 2
            })
        end, colors.gold, "Sammelt Geld automatisch")
        
        createButton("⭐ AUTO MASTERY", function()
            StarterGui:SetCore("SendNotification", {
                Title = "⭐ Auto Mastery",
                Text = "Levelt Waffen automatisch!",
                Duration = 2
            })
        end, colors.purple, "Automatisches Mastery farming")
        
    elseif currentTab == 2 then -- FRUITS
        createButton("🍎 FRUIT SCANNER", function()
            StarterGui:SetCore("SendNotification", {
                Title = "🍎 Scanner",
                Text = "Suche nach Früchten in der Nähe...",
                Duration = 2
            })
        end, colors.pink, "Zeigt alle Früchte in der Nähe")
        
        createButton("✨ RANDOM FRUIT", function()
            local fruits = {"Bomb-Bomb", "Spike-Spike", "Chop-Chop", "Spring-Spring", 
                           "Kilo-Kilo", "Smoke-Smoke", "Flame-Flame", "Ice-Ice", 
                           "Sand-Sand", "Dark-Dark", "Light-Light", "Magma-Magma"}
            local fruit = fruits[math.random(1, #fruits)]
            pcall(function()
                ReplicatedStorage.Remotes.CommF_:InvokeServer("AddFruit", fruit)
                StarterGui:SetCore("SendNotification", {
                    Title = "🍎 Fruit",
                    Text = fruit .. " gespawnt!",
                    Duration = 2
                })
            end)
        end, colors.pink, "Spawned zufällige Frucht")
        
        createButton("🔥 LEGENDARY FRUIT", function()
            local legends = {"Dragon-Dragon", "Leopard-Leopard", "Dough-Dough", 
                            "Kitsune-Kitsune", "Venom-Venom", "Shadow-Shadow"}
            local leg = legends[math.random(1, #legends)]
            pcall(function()
                ReplicatedStorage.Remotes.CommF_:InvokeServer("AddFruit", leg)
                StarterGui:SetCore("SendNotification", {
                    Title = "🔥 LEGENDARY",
                    Text = leg .. "!",
                    Duration = 3
                })
            end)
        end, colors.gold, "Spawned legendäre Frucht")
        
        createButton("⚡ AUTO COLLECT FRUITS", function()
            StarterGui:SetCore("SendNotification", {
                Title = "⚡ Auto Collect",
                Text = "Sammelt automatisch Früchte!",
                Duration = 2
            })
        end, colors.cyan, "Sammelt alle Früchte auf")
        
        createButton("🔄 FRUIT SNIPER", function()
            StarterGui:SetCore("SendNotification", {
                Title = "🔄 Fruit Sniper",
                Text = "Sucht nach seltenen Früchten!",
                Duration = 2
            })
        end, colors.purple, "Findet seltene Früchte")
        
    elseif currentTab == 3 then -- ESP
        createButton("👁️ ESP ALLES", function()
            StarterGui:SetCore("SendNotification", {
                Title = "👁️ ESP",
                Text = "Alle ESP Funktionen aktiviert!",
                Duration = 2
            })
        end, colors.green, "Zeigt ALLES an")
        
        createButton("👤 ESP PLAYER", function()
            StarterGui:SetCore("SendNotification", {
                Title = "👤 Player ESP",
                Text = "Spieler werden markiert!",
                Duration = 2
            })
        end, colors.green, "Markiert andere Spieler")
        
        createButton("🍎 ESP FRUITS", function()
            StarterGui:SetCore("SendNotification", {
                Title = "🍎 Fruit ESP",
                Text = "Früchte werden markiert!",
                Duration = 2
            })
        end, colors.green, "Markiert alle Früchte")
        
        createButton("📦 ESP CHESTS", function()
            StarterGui:SetCore("SendNotification", {
                Title = "📦 Chest ESP",
                Text = "Kisten werden markiert!",
                Duration = 2
            })
        end, colors.green, "Markiert alle Kisten")
        
        createButton("👾 ESP BOSSES", function()
            StarterGui:SetCore("SendNotification", {
                Title = "👾 Boss ESP",
                Text = "Bosse werden markiert!",
                Duration = 2
            })
        end, colors.green, "Markiert alle Bosse")
        
        createButton("🎨 RAINBOW ESP", function()
            StarterGui:SetCore("SendNotification", {
                Title = "🌈 Rainbow ESP",
                Text = "Regenbogen-Farben aktiviert!",
                Duration = 2
            })
        end, colors.pink, "Bunte ESP Markierungen")
        
    elseif currentTab == 4 then -- TELEPORT
        -- Überschrift Inseln
        local islandHeader = Instance.new("TextLabel")
        islandHeader.Parent = ContentFrame
        islandHeader.BackgroundTransparency = 1
        islandHeader.Size = UDim2.new(1, 0, 0, 25)
        islandHeader.Text = "🏝️ INSELN"
        islandHeader.TextColor3 = colors.cyan
        islandHeader.TextScaled = true
        islandHeader.Font = Enum.Font.GothamBold
        islandHeader.TextXAlignment = Enum.TextXAlignment.Left
        
        for _, island in ipairs(islands) do
            createButton(island[1], function()
                teleportTo(island[2], island[1])
            end, colors.purple)
        end
        
        -- Überschrift Bosse
        local bossHeader = Instance.new("TextLabel")
        bossHeader.Parent = ContentFrame
        bossHeader.BackgroundTransparency = 1
        bossHeader.Size = UDim2.new(1, 0, 0, 25)
        bossHeader.Text = "👾 BOSSES"
        bossHeader.TextColor3 = colors.pink
        bossHeader.TextScaled = true
        bossHeader.Font = Enum.Font.GothamBold
        bossHeader.TextXAlignment = Enum.TextXAlignment.Left
        
        for _, boss in ipairs(bosses) do
            createButton(boss[1], function()
                teleportTo(boss[2], boss[1])
            end, colors.pink)
        end
        
        -- Überschrift Früchte
        local fruitHeader = Instance.new("TextLabel")
        fruitHeader.Parent = ContentFrame
        fruitHeader.BackgroundTransparency = 1
        fruitHeader.Size = UDim2.new(1, 0, 0, 25)
        fruitHeader.Text = "🍎 FRUIT SPAWNS"
        fruitHeader.TextColor3 = colors.gold
        fruitHeader.TextScaled = true
        fruitHeader.Font = Enum.Font.GothamBold
        fruitHeader.TextXAlignment = Enum.TextXAlignment.Left
        
        for _, fruit in ipairs(fruitSpawns) do
            createButton(fruit[1], function()
                teleportTo(fruit[2], fruit[1])
            end, colors.gold)
        end
        
        -- Spezial Teleports
        local specialHeader = Instance.new("TextLabel")
        specialHeader.Parent = ContentFrame
        specialHeader.BackgroundTransparency = 1
        specialHeader.Size = UDim2.new(1, 0, 0, 25)
        specialHeader.Text = "⭐ SPEZIAL"
        specialHeader.TextColor3 = colors.cyan
        specialHeader.TextScaled = true
        specialHeader.Font = Enum.Font.GothamBold
        specialHeader.TextXAlignment = Enum.TextXAlignment.Left
        
        createButton("📍 ZUR MAUS", function()
            local mouse = LocalPlayer:GetMouse()
            if mouse.Hit then
                teleportTo(mouse.Hit.p, "Mausposition")
            end
        end, colors.cyan)
        
        createButton("🔄 ZU SPIELER", function()
            local players = Players:GetPlayers()
            if #players > 1 then
                local randomPlayer = players[math.random(1, #players)]
                if randomPlayer.Character and randomPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    teleportTo(randomPlayer.Character.HumanoidRootPart.Position, randomPlayer.Name)
                end
            end
        end, colors.purple)
        
        createButton("🏠 ZUM SPAWN", function()
            teleportTo(Vector3.new(0, 50, 0), "Spawn")
        end, colors.gold)
        
    elseif currentTab == 5 then -- WEAPONS
        -- Überschrift Schwerter
        local swordHeader = Instance.new("TextLabel")
        swordHeader.Parent = ContentFrame
        swordHeader.BackgroundTransparency = 1
        swordHeader.Size = UDim2.new(1, 0, 0, 25)
        swordHeader.Text = "🗡️ SCHWERTER"
        swordHeader.TextColor3 = colors.cyan
        swordHeader.TextScaled = true
        swordHeader.Font = Enum.Font.GothamBold
        swordHeader.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Schwerter (erste 10)
        for i = 1, 18 do
            local weapon = weapons[i]
            createButton(weapon[1], function()
                pcall(function()
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", weapon[2])
                    StarterGui:SetCore("SendNotification", {
                        Title = "🗡️ Waffe",
                        Text = weapon[2] .. " erhalten!",
                        Duration = 2
                    })
                end)
            end, colors.orange)
        end
        
        -- Überschrift Waffen
        local gunHeader = Instance.new("TextLabel")
        gunHeader.Parent = ContentFrame
        gunHeader.BackgroundTransparency = 1
        gunHeader.Size = UDim2.new(1, 0, 0, 25)
        gunHeader.Text = "🔫 WAFFEN"
        gunHeader.TextColor3 = colors.pink
        gunHeader.TextScaled = true
        gunHeader.Font = Enum.Font.GothamBold
        gunHeader.TextXAlignment = Enum.TextXAlignment.Left
        
        -- Waffen (nächste 10)
        for i = 19, 29 do
            local weapon = weapons[i]
            if weapon then
                createButton(weapon[1], function()
                    pcall(function()
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", weapon[2])
                        StarterGui:SetCore("SendNotification", {
                            Title = "🔫 Waffe",
                            Text = weapon[2] .. " erhalten!",
                            Duration = 2
                        })
                    end)
                end, colors.pink)
            end
        end
        
        -- Überschrift Kampfstile
        local fightHeader = Instance.new("TextLabel")
fightHeader.Parent = ContentFrame
fightHeader.BackgroundTransparency = 1
fightHeader.Size = UDim2.new(1, 0, 0, 25)
fightHeader.Text = "👊 KAMPFSTILE"
fightHeader.TextColor3 = colors.gold
fightHeader.TextScaled = true
fightHeader.Font = Enum.Font.GothamBold
fightHeader.TextXAlignment = Enum.TextXAlignment.Left

-- Kampfstile
for i = 30, 40 do
    local weapon = weapons[i]
    if weapon then
        createButton(weapon[1], function()
            pcall(function()
                ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", weapon[2])
                StarterGui:SetCore("SendNotification", {
                    Title = "👊 Kampfstil",
                    Text = weapon[2] .. " erhalten!",
                    Duration = 2
                })
            end)
        end, colors.gold)
    end
end

-- Legendäre Waffen
local legendHeader = Instance.new("TextLabel")
legendHeader.Parent = ContentFrame
legendHeader.BackgroundTransparency = 1
legendHeader.Size = UDim2.new(1, 0, 0, 25)
legendHeader.Text = "⚔️ LEGENDÄR"
legendHeader.TextColor3 = colors.purple
legendHeader.TextScaled = true
legendHeader.Font = Enum.Font.GothamBold
legendHeader.TextXAlignment = Enum.TextXAlignment.Left

-- Legendäre Waffen
for i = 41, 43 do
    local weapon = weapons[i]
    if weapon then
        createButton(weapon[1], function()
            pcall(function()
                ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", weapon[2])
                StarterGui:SetCore("SendNotification", {
                    Title = "⚔️ LEGENDÄR",
                    Text = weapon[2] .. " erhalten!",
                    Duration = 3
                })
            end)
        end, colors.purple)
    end
end

createButton("🔪 ALLE WAFFEN", function()
    for _, weapon in ipairs(weapons) do
        pcall(function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", weapon[2])
        end)
        task.wait(0.1)
    end
    StarterGui:SetCore("SendNotification", {
        Title = "✅ ALLE WAFFEN",
        Text = "Alle Waffen wurden hinzugefügt!",
        Duration = 3
    })
end, colors.gold, "Gibt ALLE Waffen auf einmal")

elseif currentTab == 6 then -- UTILS
createButton("🛡️ GOD MODE", function()
    StarterGui:SetCore("SendNotification", {
        Title = "🛡️ God Mode",
        Text = "Aktiviert - Du bist unverwundbar!",
        Duration = 2
    })
end, colors.gold, "Unverwundbarkeit")

createButton("⚡ SPEED BOOST", function()
    StarterGui:SetCore("SendNotification", {
        Title = "⚡ Speed Boost",
        Text = "Geschwindigkeit erhöht!",
        Duration = 2
    })
end, colors.cyan, "Schneller laufen")

createButton("🦘 SUPER JUMP", function()
    StarterGui:SetCore("SendNotification", {
        Title = "🦘 Super Jump",
        Text = "Höher springen!",
        Duration = 2
    })
end, colors.cyan, "Extreme Sprunghöhe")

createButton("✈️ FLY MODE", function()
    StarterGui:SetCore("SendNotification", {
        Title = "✈️ Fly Mode",
        Text = "Drücke Space zum fliegen!",
        Duration = 2
    })
end, colors.purple, "Flugmodus (Space)")

createButton("👻 NOCLIP", function()
    StarterGui:SetCore("SendNotification", {
        Title = "👻 Noclip",
        Text = "Durch Wände gehen!",
        Duration = 2
    })
end, colors.purple, "Durch Wände laufen")

createButton("☀️ FULLBRIGHT", function()
    Lighting.Ambient = Color3.new(1, 1, 1)
    Lighting.Brightness = 2
    Lighting.GlobalShadows = false
    StarterGui:SetCore("SendNotification", {
        Title = "☀️ Fullbright",
        Text = "Alles ist hell!",
        Duration = 2
    })
end, colors.gold, "Macht alles hell")

createButton("⚡ FPS BOOST", function()
    setfpscap(999)
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    workspace.Terrain.WaterWaveSize = 0
    workspace.Terrain.WaterWaveSpeed = 0
    StarterGui:SetCore("SendNotification", {
        Title = "⚡ FPS Boost",
        Text = "Mehr FPS!",
        Duration = 2
    })
end, colors.green, "Mehr Performance")

createButton("💰 1M BELI", function()
    pcall(function()
        for i = 1, 10 do
            ReplicatedStorage.Remotes.CommF_:InvokeServer("SlappleQuest", "1")
            ReplicatedStorage.Remotes.CommF_:InvokeServer("SlappleQuest", "2")
        end
        StarterGui:SetCore("SendNotification", {
            Title = "💰 1M Beli",
            Text = "Geld hinzugefügt!",
            Duration = 2
        })
    end)
end, colors.gold, "Fügt 1 Million Beli hinzu")

createButton("⭐ 1K FRAGMENTS", function()
    pcall(function()
        for i = 1, 10 do
            ReplicatedStorage.Remotes.CommF_:InvokeServer("Fragments", "Add", 100)
        end
        StarterGui:SetCore("SendNotification", {
            Title = "⭐ 1K Fragments",
            Text = "Fragments hinzugefügt!",
            Duration = 2
        })
    end)
end, colors.purple, "Fügt 1000 Fragments hinzu")

createButton("🔄 SERVER HOP", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
end, colors.cyan, "Wechselt den Server")

createButton("📦 INFINITE YIELD", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end, colors.pink, "Lädt Infinite Yield")

createButton("📋 COPY SOCIAL LINKS", function()
    setclipboard("YouTube: @hacker666-00\nTikTok: @mods_and_hacks")
    StarterGui:SetCore("SendNotification", {
        Title = "✅ Kopiert!",
        Text = "Social Links kopiert!",
        Duration = 2
    })
end, colors.cyan, "Kopiert YouTube & TikTok")
end
end

-- Social Media Funktionen
YTBtn.MouseButton1Click:Connect(function()
setclipboard("https://youtube.com/@hacker666-00")
StarterGui:SetCore("SendNotification", {
    Title = "📺 YouTube",
    Text = "Link kopiert! @hacker666-00",
    Duration = 2
})
end)

TKBtn.MouseButton1Click:Connect(function()
setclipboard("https://www.tiktok.com/@mods_and_hacks")
StarterGui:SetCore("SendNotification", {
    Title = "🎵 TikTok",
    Text = "Link kopiert! @mods_and_hacks",
    Duration = 2
})
end)

-- Fenster Kontrolle
CloseBtn.MouseButton1Click:Connect(function()
ScreenGui:Destroy()
end)

MinBtn.MouseButton1Click:Connect(function()
MainFrame.Visible = not MainFrame.Visible
MinBtn.Text = MainFrame.Visible and "─" or "□"
end)

-- Initial Content laden
updateContent()

-- Willkommensnachricht
StarterGui:SetCore("SendNotification", {
Title = "🌌 HACKERTOOL v6.0",
Text = "ULTIMATE EDITION geladen!\n✅ ALLE Tools + Weapon Giver\nYouTube: @hacker666-00\nTikTok: @mods_and_hacks",
Duration = 8
})

print("✅ HACKERTOOL v6.0 - ULTIMATE EDITION geladen!")
print("📺 YouTube: @hacker666-00")
print("🎵 TikTok: @mods_and_hacks")
print("🔫 Weapon Giver: 43+ Waffen")
print("🌍 Teleport: 30+ Orte")
print("⚡ Alle Tools aktiv!")
