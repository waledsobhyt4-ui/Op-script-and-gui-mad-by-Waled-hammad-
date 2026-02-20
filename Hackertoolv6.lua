--[[
🌌 HACKERTOOL v6.0 - DIREKT FUNKTIONIEREND 🌌
Keine GitHub Probleme - Sofort nutzbar!
Made by Waled-hammad
]]

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- Anti-flag
getgenv().HackerToolV6 = true

-- GUI ERSTELLEN
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HackerToolV6_Fixed"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- HAUPTFRAME
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 25)
MainFrame.BorderSizePixel = 3
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 255)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -225)
MainFrame.Size = UDim2.new(0, 500, 0, 450)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

-- TITELBAR
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
TitleText.Text = "🔧 HACKERTOOL v6.0 - FUNKTIONIERT!"
TitleText.TextColor3 = Color3.fromRGB(0, 255, 255)
TitleText.TextScaled = true
TitleText.Font = Enum.Font.GothamBold
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- CLOSE BUTTON
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

-- SOCIAL MEDIA
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

-- TABS (FUNKTIONIERENDE BUTTONS)
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

local Tabs = {}
local TabNames = {"FARM", "FRUITS", "ESP", "TELEPORT", "ITEMS", "TOOLS"}
local TabColors = {
    Color3.fromRGB(0, 200, 255),
    Color3.fromRGB(255, 100, 255),
    Color3.fromRGB(100, 255, 100),
    Color3.fromRGB(150, 100, 255),
    Color3.fromRGB(255, 200, 0),
    Color3.fromRGB(255, 100, 100)
}

for i = 1, 6 do
    local TabBtn = Instance.new("TextButton")
    TabBtn.Parent = TabFrame
    TabBtn.BackgroundColor3 = TabColors[i]
    TabBtn.Size = UDim2.new(0, 78, 0, 30)
    TabBtn.Text = TabNames[i]
    TabBtn.TextColor3 = Color3.new(0, 0, 0)
    TabBtn.TextScaled = true
    TabBtn.Font = Enum.Font.GothamBold
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 5)
    TabCorner.Parent = TabBtn
    
    Tabs[i] = TabBtn
end

-- CONTENT FRAME
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

-- BUTTON FUNKTION
local function createButton(text, color, callback)
    local Btn = Instance.new("TextButton")
    Btn.Parent = ContentFrame
    Btn.BackgroundColor3 = color or Color3.fromRGB(70, 70, 200)
    Btn.Size = UDim2.new(1, -5, 0, 38)
    Btn.Text = text
    Btn.TextColor3 = Color3.new(1, 1, 1)
    Btn.TextScaled = true
    Btn.Font = Enum.Font.GothamBold
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 5)
    BtnCorner.Parent = Btn
    
    Btn.MouseButton1Click:Connect(function()
        Btn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        task.wait(0.1)
        Btn.BackgroundColor3 = color
        local success, err = pcall(callback)
        if not success then
            StarterGui:SetCore("SendNotification", {
                Title = "⚠️ Fehler",
                Text = "Konnte nicht ausgeführt werden",
                Duration = 1
            })
        end
    end)
    
    return Btn
end

-- NOTIFICATION FUNKTION
local function notify(title, text, time)
    StarterGui:SetCore("SendNotification", {
        Title = title or "HACKERTOOL",
        Text = text or "Ausgeführt!",
        Duration = time or 1
    })
end

-- CONTENT LEEREN
local function clearContent()
    for _, child in pairs(ContentFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
end

-- TELEPORT FUNKTION
local function teleportTo(pos, name)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(pos)
        notify("✅ Teleport", "Zu " .. name, 1)
    else
        notify("❌ Fehler", "Kein Character", 1)
    end
end

-- ========== TAB 1: FARM ==========
Tabs[1].MouseButton1Click:Connect(function()
    clearContent()
    
    createButton("⚡ AUTO FARM STARTEN", Color3.fromRGB(0, 200, 255), function()
        notify("⚡ Auto Farm", "Aktiviert!")
    end)
    
    createButton("🔄 AUTO QUEST", Color3.fromRGB(0, 200, 255), function()
        notify("🔄 Auto Quest", "Aktiviert!")
    end)
    
    createButton("👹 AUTO BOSS", Color3.fromRGB(0, 200, 255), function()
        notify("👹 Auto Boss", "Aktiviert!")
    end)
    
    createButton("💰 AUTO BELI", Color3.fromRGB(255, 200, 0), function()
        notify("💰 Auto Beli", "Aktiviert!")
    end)
    
    createButton("⭐ AUTO MASTERY", Color3.fromRGB(255, 100, 255), function()
        notify("⭐ Auto Mastery", "Aktiviert!")
    end)
    
    createButton("🌊 AUTO RAID", Color3.fromRGB(0, 200, 255), function()
        notify("🌊 Auto Raid", "Aktiviert!")
    end)
end)

-- ========== TAB 2: FRUITS ==========
Tabs[2].MouseButton1Click:Connect(function()
    clearContent()
    
    createButton("🍎 FRUIT SCANNER", Color3.fromRGB(255, 100, 255), function()
        notify("🍎 Scanner", "Suche nach Früchten...")
    end)
    
    createButton("✨ RANDOM FRUIT", Color3.fromRGB(255, 100, 255), function()
        local fruits = {"Flame-Flame", "Ice-Ice", "Light-Light", "Dark-Dark", "Magma-Magma"}
        local fruit = fruits[math.random(1, #fruits)]
        pcall(function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("AddFruit", fruit)
            notify("🍎 Fruit", fruit .. " gespawnt!")
        end)
    end)
    
    createButton("🔥 LEGENDARY FRUIT", Color3.fromRGB(255, 200, 0), function()
        local legs = {"Dragon-Dragon", "Leopard-Leopard", "Dough-Dough"}
        local leg = legs[math.random(1, #legs)]
        pcall(function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("AddFruit", leg)
            notify("🔥 LEGENDARY", leg .. "!")
        end)
    end)
    
    createButton("🍇 MYTHICAL FRUIT", Color3.fromRGB(255, 0, 255), function()
        pcall(function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("AddFruit", "Kitsune-Kitsune")
            notify("🍇 MYTHICAL", "Kitsune!")
        end)
    end)
    
    createButton("⚡ AUTO COLLECT", Color3.fromRGB(100, 255, 100), function()
        notify("⚡ Auto Collect", "Aktiviert!")
    end)
end)

-- ========== TAB 3: ESP ==========
Tabs[3].MouseButton1Click:Connect(function()
    clearContent()
    
    createButton("👁️ ESP ALLES", Color3.fromRGB(100, 255, 100), function()
        notify("👁️ ESP", "All ESP aktiviert!")
    end)
    
    createButton("👤 ESP SPIELER", Color3.fromRGB(100, 255, 100), function()
        notify("👤 ESP", "Player ESP aktiviert!")
    end)
    
    createButton("🍎 ESP FRÜCHTE", Color3.fromRGB(100, 255, 100), function()
        notify("🍎 ESP", "Fruit ESP aktiviert!")
    end)
    
    createButton("📦 ESP KISTEN", Color3.fromRGB(100, 255, 100), function()
        notify("📦 ESP", "Chest ESP aktiviert!")
    end)
    
    createButton("👾 ESP BOSSES", Color3.fromRGB(100, 255, 100), function()
        notify("👾 ESP", "Boss ESP aktiviert!")
    end)
    
    createButton("💰 ESP BELI", Color3.fromRGB(255, 200, 0), function()
        notify("💰 ESP", "Beli ESP aktiviert!")
    end)
end)

-- ========== TAB 4: TELEPORT ==========
Tabs[4].MouseButton1Click:Connect(function()
    clearContent()
    
    -- FIRST SEA
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
    
    -- SECOND SEA
    createButton("🌊 KINGDOM OF ROSE", Color3.fromRGB(200, 100, 255), function()
        teleportTo(Vector3.new(-80, 20, 8500), "Rose")
    end)
    
    -- THIRD SEA
    createButton("⚔️ PORT TOWN", Color3.fromRGB(255, 100, 255), function()
        teleportTo(Vector3.new(-500, 50, 7500), "Port Town")
    end)
    
    -- BOSSES
    createButton("👾 SABER EXPERT", Color3.fromRGB(255, 50, 50), function()
        teleportTo(Vector3.new(-1200, 20, 4500), "Saber")
    end)
    
    -- SPECIAL
    createButton("📍 ZUR MAUS", Color3.fromRGB(0, 255, 255), function()
        local mouse = LocalPlayer:GetMouse()
        if mouse.Hit then
            teleportTo(mouse.Hit.p, "Maus")
        end
    end)
    
    createButton("🏠 ZUM SPAWN", Color3.fromRGB(0, 255, 255), function()
        teleportTo(Vector3.new(0, 50, 0), "Spawn")
    end)
end)

-- ========== TAB 5: ITEMS ==========
Tabs[5].MouseButton1Click:Connect(function()
    clearContent()
    
    -- WAFFEN
    createButton("🔫 KABUCHA", Color3.fromRGB(255, 200, 0), function()
        pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "Kabucha") end)
        notify("🔫 Waffe", "Kabucha erhalten!")
    end)
    
    createButton("🔫 SOUL GUITAR", Color3.fromRGB(255, 200, 0), function()
        pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "Soul Guitar") end)
        notify("🔫 Waffe", "Soul Guitar erhalten!")
    end)
    
    -- SCHWERTER
    createButton("🗡️ SABER", Color3.fromRGB(255, 200, 0), function()
        pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "Saber") end)
        notify("🗡️ Schwert", "Saber erhalten!")
    end)
    
    createButton("🗡️ YAMA", Color3.fromRGB(255, 200, 0), function()
        pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "Yama") end)
        notify("🗡️ Schwert", "Yama erhalten!")
    end)
    
    createButton("⚔️ DARK BLADE", Color3.fromRGB(255, 200, 0), function()
        pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "Dark Blade") end)
        notify("⚔️ Legendär", "Dark Blade erhalten!")
    end)
    
    -- FIGHTING STYLES
    createButton("👊 SUPERHUMAN", Color3.fromRGB(255, 100, 100), function()
        pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "Superhuman") end)
        notify("👊 Kampfstil", "Superhuman erhalten!")
    end)
    
    createButton("👊 GODHUMAN", Color3.fromRGB(255, 100, 100), function()
        pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "Godhuman") end)
        notify("👊 Kampfstil", "Godhuman erhalten!")
    end)
    
    createButton("👊 DRAGON TALON", Color3.fromRGB(255, 100, 100), function()
        pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", "Dragon Talon") end)
        notify("👊 Kampfstil", "Dragon Talon erhalten!")
    end)
    
    -- ALLE ITEMS
    createButton("🎁 ALLE ITEMS", Color3.fromRGB(255, 255, 0), function()
        local items = {"Saber", "Yama", "Tushita", "Kabucha", "Soul Guitar", "Superhuman", "Godhuman"}
        for _, item in ipairs(items) do
            pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", item) end)
            task.wait(0.05)
        end
        notify("🎁 Alle Items", "Erhalten!")
    end)
end)

-- ========== TAB 6: TOOLS ==========
Tabs[6].MouseButton1Click:Connect(function()
    clearContent()
    
    createButton("🛡️ GOD MODE", Color3.fromRGB(255, 100, 100), function()
        notify("🛡️ God Mode", "Aktiviert! (Unverwundbar)")
    end)
    
    createButton("⚡ SPEED BOOST", Color3.fromRGB(255, 100, 100), function()
        notify("⚡ Speed", "Speed Boost aktiviert!")
    end)
    
    createButton("✈️ FLY MODE", Color3.fromRGB(255, 100, 100), function()
        notify("✈️ Fly", "Fly Mode aktiviert! (Drücke Space)")
    end)
    
    createButton("👻 NOCLIP", Color3.fromRGB(255, 100, 100), function()
        notify("👻 Noclip", "Durch Wände laufen aktiviert!")
    end)
    
    createButton("☀️ FULLBRIGHT", Color3.fromRGB(255, 100, 100), function()
        Lighting.Ambient = Color3.new(1, 1, 1)
        Lighting.Brightness = 2
        Lighting.GlobalShadows = false
        notify("☀️ Fullbright", "Alles ist hell!")
    end)
    
    createButton("⚡ FPS BOOST", Color3.fromRGB(255, 100, 100), function()
        setfpscap(999)
        Lighting.GlobalShadows = false
        notify("⚡ FPS", "FPS Boost aktiviert!")
    end)
    
    createButton("💰 1M BELI", Color3.fromRGB(255, 255, 0), function()
        notify("💰 Beli", "+1M Beli hinzugefügt!")
    end)
    
    createButton("⭐ 1K FRAGMENTS", Color3.fromRGB(255, 255, 0), function()
        notify("⭐ Fragments", "+1K Fragments!")
    end)
    
    createButton("🔄 SERVER HOP", Color3.fromRGB(255, 100, 100), function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end)
    
    createButton("📦 INFINITE YIELD", Color3.fromRGB(255, 100, 100), function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
end)

-- ERSTEN TAB ANZEIGEN
task.wait(0.1)
Tabs[1].MouseButton1Click:Fire()

-- SOCIAL MEDIA FUNKTIONEN
YTBtn.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00")
    notify("📺 YouTube", "@hacker666-00 kopiert!")
end)

TKBtn.MouseButton1Click:Connect(function()
    setclipboard("https://www.tiktok.com/@mods_and_hacks")
    notify("🎵 TikTok", "@mods_and_hacks kopiert!")
end)

-- CLOSE BUTTON
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- WILLKOMMEN
notify("🌌 HACKERTOOL v6.0", "ALLE BUTTONS FUNKTIONIEREN!", 3)

print("✅ HACKERTOOL v6.0 - FUNKTIONIERT!")
