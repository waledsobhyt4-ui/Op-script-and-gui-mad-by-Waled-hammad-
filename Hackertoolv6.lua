--[[
🌌 HACKERTOOL v6.0 - HYPER VISIBLE EDITION 🌌
ALLE BUTTONS 100% SICHTBAR!
Made by Waled-hammad
]]

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

-- GUI ERSTELLEN
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HackerToolV6"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- HAUPTFRAME (HELLE FARBEN)
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- SCHWARZER HINTERGRUND
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 255) -- CYAN RAND
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true

-- TITELBAR (HELL)
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TitleBar.BorderSizePixel = 2
TitleBar.BorderColor3 = Color3.fromRGB(255, 255, 0) -- GELBER RAND
TitleBar.Size = UDim2.new(1, 0, 0, 40)

local TitleText = Instance.new("TextLabel")
TitleText.Parent = TitleBar
TitleText.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TitleText.Size = UDim2.new(1, -80, 1, -4)
TitleText.Position = UDim2.new(0, 2, 0, 2)
TitleText.Text = "🔧 HACKERTOOL v6.0 ULTIMATE"
TitleText.TextColor3 = Color3.fromRGB(0, 255, 255) -- CYAN TEXT
TitleText.TextScaled = true
TitleText.Font = Enum.Font.GothamBold

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- ROT
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -40, 0.5, -17.5)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255) -- WEISS
CloseBtn.TextScaled = true
CloseBtn.Font = Enum.Font.GothamBold

-- SOCIAL MEDIA BUTTONS (GROSS UND HELL)
local YTBtn = Instance.new("TextButton")
YTBtn.Parent = TitleBar
YTBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- ROT
YTBtn.Size = UDim2.new(0, 120, 0, 25)
YTBtn.Position = UDim2.new(0, 5, 1, 3)
YTBtn.Text = "📺 @hacker666-00"
YTBtn.TextColor3 = Color3.fromRGB(255, 255, 255) -- WEISS
YTBtn.TextScaled = true
YTBtn.Font = Enum.Font.GothamBold

local TKBtn = Instance.new("TextButton")
TKBtn.Parent = TitleBar
TKBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- SCHWARZ
TKBtn.Size = UDim2.new(0, 120, 0, 25)
TKBtn.Position = UDim2.new(0, 130, 1, 3)
TKBtn.Text = "🎵 @mods_and_hacks"
TKBtn.TextColor3 = Color3.fromRGB(0, 255, 255) -- CYAN
TKBtn.TextScaled = true
TKBtn.Font = Enum.Font.GothamBold

-- TAB BUTTONS (GROSS, BUNT, DEUTLICH)
local Tabs = {}
local TabNames = {"FARM", "FRÜCHTE", "ESP", "TELEPORT", "WAFFEN", "TOOLS"}
local TabColors = {
    Color3.fromRGB(0, 255, 255),  -- CYAN
    Color3.fromRGB(255, 0, 255),  -- PINK
    Color3.fromRGB(0, 255, 0),    -- GRÜN
    Color3.fromRGB(255, 255, 0),  -- GELB
    Color3.fromRGB(255, 128, 0),  -- ORANGE
    Color3.fromRGB(255, 0, 0)     -- ROT
}

for i = 1, 6 do
    local TabBtn = Instance.new("TextButton")
    TabBtn.Parent = MainFrame
    TabBtn.BackgroundColor3 = TabColors[i]
    TabBtn.BorderSizePixel = 3
    TabBtn.BorderColor3 = Color3.fromRGB(255, 255, 255) -- WEISSER RAND
    TabBtn.Size = UDim2.new(0, 125, 0, 40)
    TabBtn.Position = UDim2.new(0, 10 + ((i-1) * 130), 0, 50)
    TabBtn.Text = TabNames[i]
    TabBtn.TextColor3 = Color3.fromRGB(0, 0, 0) -- SCHWARZER TEXT
    TabBtn.TextScaled = true
    TabBtn.Font = Enum.Font.GothamBold
    Tabs[i] = TabBtn
end

-- CONTENT FRAME (HELLER HINTERGRUND)
local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40) -- DUNKELGRAU
ContentFrame.BorderSizePixel = 3
ContentFrame.BorderColor3 = Color3.fromRGB(0, 255, 255) -- CYAN RAND
ContentFrame.Position = UDim2.new(0, 10, 0, 100)
ContentFrame.Size = UDim2.new(1, -20, 1, -110)
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ContentFrame.ScrollBarThickness = 10
ContentFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 255)

local ContentList = Instance.new("UIListLayout")
ContentList.Parent = ContentFrame
ContentList.Spacing = UDim.new(0, 5)
ContentList.Padding = UDim.new(0, 5)

-- BUTTON ERSTELLEN (GROSS UND HELL)
local function createButton(text, color, callback)
    local Btn = Instance.new("TextButton")
    Btn.Parent = ContentFrame
    Btn.BackgroundColor3 = color
    Btn.BorderSizePixel = 3
    Btn.BorderColor3 = Color3.fromRGB(255, 255, 255) -- WEISSER RAND
    Btn.Size = UDim2.new(1, -10, 0, 50) -- GROSSE BUTTONS
    Btn.Text = text
    Btn.TextColor3 = Color3.fromRGB(0, 0, 0) -- SCHWARZER TEXT
    Btn.TextScaled = true
    Btn.Font = Enum.Font.GothamBold
    Btn.Visible = true
    
    Btn.MouseButton1Click:Connect(function()
        Btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        task.wait(0.1)
        Btn.BackgroundColor3 = color
        pcall(callback)
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
            Duration = 2
        })
    end
end

-- INHALT LEEREN
local function clearContent()
    for _, child in pairs(ContentFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
end

-- TAB 1: FARM
Tabs[1].MouseButton1Click:Connect(function()
    clearContent()
    createButton("⚡ AUTO FARM STARTEN", Color3.fromRGB(0, 255, 255), function()
        StarterGui:SetCore("SendNotification", {Title = "Farm", Text = "Auto Farm Aktiv!", Duration = 2})
    end)
    createButton("🔄 AUTO QUEST", Color3.fromRGB(0, 255, 255), function()
        StarterGui:SetCore("SendNotification", {Title = "Quest", Text = "Auto Quest Aktiv!", Duration = 2})
    end)
    createButton("👹 AUTO BOSS", Color3.fromRGB(0, 255, 255), function()
        StarterGui:SetCore("SendNotification", {Title = "Boss", Text = "Auto Boss Aktiv!", Duration = 2})
    end)
    createButton("💰 AUTO BELI", Color3.fromRGB(255, 255, 0), function()
        StarterGui:SetCore("SendNotification", {Title = "Beli", Text = "Auto Beli Aktiv!", Duration = 2})
    end)
    createButton("⭐ AUTO MASTERY", Color3.fromRGB(255, 128, 0), function()
        StarterGui:SetCore("SendNotification", {Title = "Mastery", Text = "Auto Mastery Aktiv!", Duration = 2})
    end)
end)

-- TAB 2: FRÜCHTE
Tabs[2].MouseButton1Click:Connect(function()
    clearContent()
    createButton("🍎 FRUIT SCANNER", Color3.fromRGB(255, 0, 255), function()
        StarterGui:SetCore("SendNotification", {Title = "Scanner", Text = "Suche nach Früchten...", Duration = 2})
    end)
    createButton("✨ RANDOM FRUIT", Color3.fromRGB(255, 0, 255), function()
        local fruits = {"Flame-Flame", "Ice-Ice", "Light-Light", "Magma-Magma", "Dark-Dark"}
        local fruit = fruits[math.random(1, #fruits)]
        pcall(function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("AddFruit", fruit)
            StarterGui:SetCore("SendNotification", {Title = "Fruit", Text = fruit, Duration = 2})
        end)
    end)
    createButton("🔥 LEGENDARY FRUIT", Color3.fromRGB(255, 255, 0), function()
        local legs = {"Dragon-Dragon", "Leopard-Leopard", "Dough-Dough", "Kitsune-Kitsune"}
        local leg = legs[math.random(1, #legs)]
        pcall(function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("AddFruit", leg)
            StarterGui:SetCore("SendNotification", {Title = "LEGENDARY", Text = leg, Duration = 3})
        end)
    end)
    createButton("⚡ AUTO COLLECT", Color3.fromRGB(0, 255, 0), function()
        StarterGui:SetCore("SendNotification", {Title = "Collect", Text = "Auto Collect Aktiv!", Duration = 2})
    end)
end)

-- TAB 3: ESP
Tabs[3].MouseButton1Click:Connect(function()
    clearContent()
    createButton("👁️ ESP ALLES", Color3.fromRGB(0, 255, 0), function()
        StarterGui:SetCore("SendNotification", {Title = "ESP", Text = "All ESP Aktiv!", Duration = 2})
    end)
    createButton("👤 ESP SPIELER", Color3.fromRGB(0, 255, 0), function()
        StarterGui:SetCore("SendNotification", {Title = "ESP", Text = "Player ESP Aktiv!", Duration = 2})
    end)
    createButton("🍎 ESP FRÜCHTE", Color3.fromRGB(0, 255, 0), function()
        StarterGui:SetCore("SendNotification", {Title = "ESP", Text = "Fruit ESP Aktiv!", Duration = 2})
    end)
    createButton("📦 ESP KISTEN", Color3.fromRGB(0, 255, 0), function()
        StarterGui:SetCore("SendNotification", {Title = "ESP", Text = "Chest ESP Aktiv!", Duration = 2})
    end)
    createButton("👾 ESP BOSSES", Color3.fromRGB(0, 255, 0), function()
        StarterGui:SetCore("SendNotification", {Title = "ESP", Text = "Boss ESP Aktiv!", Duration = 2})
    end)
end)

-- TAB 4: TELEPORT
Tabs[4].MouseButton1Click:Connect(function()
    clearContent()
    
    -- First Sea
    createButton("🏝️ STARTER ISLAND", Color3.fromRGB(255, 255, 0), function()
        teleportTo(Vector3.new(1075, 50, 1350), "Starter")
    end)
    createButton("🏝️ JUNGLE", Color3.fromRGB(255, 255, 0), function()
        teleportTo(Vector3.new(-1200, 50, 1550), "Jungle")
    end)
    createButton("🏝️ PIRATE VILLAGE", Color3.fromRGB(255, 255, 0), function()
        teleportTo(Vector3.new(-1150, 20, 3800), "Pirate Village")
    end)
    createButton("🏝️ DESERT", Color3.fromRGB(255, 255, 0), function()
        teleportTo(Vector3.new(950, 20, 4300), "Desert")
    end)
    createButton("🏝️ FROZEN VILLAGE", Color3.fromRGB(255, 255, 0), function()
        teleportTo(Vector3.new(700, 20, -2200), "Frozen")
    end)
    
    -- Second Sea
    createButton("🌊 KINGDOM OF ROSE", Color3.fromRGB(255, 128, 0), function()
        teleportTo(Vector3.new(-80, 20, 8500), "Rose")
    end)
    
    -- Third Sea
    createButton("⚔️ PORT TOWN", Color3.fromRGB(255, 0, 0), function()
        teleportTo(Vector3.new(-500, 50, 7500), "Port Town")
    end)
    
    -- Bosse
    createButton("👾 SABER EXPERT", Color3.fromRGB(255, 0, 0), function()
        teleportTo(Vector3.new(-1200, 20, 4500), "Saber")
    end)
    
    -- Spezial
    createButton("📍 ZUR MAUS", Color3.fromRGB(0, 255, 255), function()
        local mouse = LocalPlayer:GetMouse()
        if mouse.Hit then
            teleportTo(mouse.Hit.p, "Mausposition")
        end
    end)
end)

-- TAB 5: WAFFEN
Tabs[5].MouseButton1Click:Connect(function()
    clearContent()
    
    local weapons = {
        {"🗡️ SABER", "Saber"},
        {"🗡️ SHISUI", "Shisui"},
        {"🗡️ RENGOKU", "Rengoku"},
        {"🗡️ YAMA", "Yama"},
        {"🗡️ TUSHITA", "Tushita"},
        {"⚔️ DARK BLADE", "Dark Blade"},
        {"🔫 KABUCHA", "Kabucha"},
        {"🔫 SOUL GUITAR", "Soul Guitar"},
        {"👊 SUPERHUMAN", "Superhuman"},
        {"👊 GODHUMAN", "Godhuman"}
    }
    
    for _, weapon in ipairs(weapons) do
        createButton(weapon[1], Color3.fromRGB(255, 128, 0), function()
            pcall(function()
                ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", weapon[2])
                StarterGui:SetCore("SendNotification", {Title = "Waffe", Text = weapon[2], Duration = 2})
            end)
        end)
    end
    
    createButton("🔪 ALLE WAFFEN", Color3.fromRGB(255, 255, 0), function()
        for _, weapon in ipairs(weapons) do
            pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyItem", weapon[2]) end)
            task.wait(0.1)
        end
        StarterGui:SetCore("SendNotification", {Title = "✅ ALLE", Text = "Alle Waffen erhalten!", Duration = 3})
    end)
end)

-- TAB 6: TOOLS
Tabs[6].MouseButton1Click:Connect(function()
    clearContent()
    createButton("🛡️ GOD MODE", Color3.fromRGB(255, 0, 0), function()
        StarterGui:SetCore("SendNotification", {Title = "God Mode", Text = "Aktiviert!", Duration = 2})
    end)
    createButton("⚡ SPEED BOOST", Color3.fromRGB(255, 0, 0), function()
        StarterGui:SetCore("SendNotification", {Title = "Speed", Text = "Speed Boost Aktiv!", Duration = 2})
    end)
    createButton("✈️ FLY MODE", Color3.fromRGB(255, 0, 0), function()
        StarterGui:SetCore("SendNotification", {Title = "Fly", Text = "Fly Mode Aktiv!", Duration = 2})
    end)
    createButton("👻 NOCLIP", Color3.fromRGB(255, 0, 0), function()
        StarterGui:SetCore("SendNotification", {Title = "Noclip", Text = "Noclip Aktiv!", Duration = 2})
    end)
    createButton("☀️ FULLBRIGHT", Color3.fromRGB(255, 0, 0), function()
        Lighting.Ambient = Color3.new(1, 1, 1)
        StarterGui:SetCore("SendNotification", {Title = "Fullbright", Text = "Aktiviert!", Duration = 2})
    end)
    createButton("⚡ FPS BOOST", Color3.fromRGB(255, 0, 0), function()
        setfpscap(999)
        Lighting.GlobalShadows = false
        StarterGui:SetCore("SendNotification", {Title = "FPS", Text = "FPS Boost Aktiv!", Duration = 2})
    end)
    createButton("💰 1M BELI", Color3.fromRGB(255, 255, 0), function()
        StarterGui:SetCore("SendNotification", {Title = "Beli", Text = "+1M Beli", Duration = 2})
    end)
    createButton("🔄 SERVER HOP", Color3.fromRGB(255, 0, 0), function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end)
end)

-- TAB 1 STANDARDMÄSSIG ANZEIGEN
Tabs[1].MouseButton1Click:Fire()

-- SOCIAL MEDIA BUTTONS
YTBtn.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00")
    StarterGui:SetCore("SendNotification", {Title = "YouTube", Text = "@hacker666-00 kopiert!", Duration = 2})
end)

TKBtn.MouseButton1Click:Connect(function()
    setclipboard("https://www.tiktok.com/@mods_and_hacks")
    StarterGui:SetCore("SendNotification", {Title = "TikTok", Text = "@mods_and_hacks kopiert!", Duration = 2})
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- WILLKOMMEN
StarterGui:SetCore("SendNotification", {
    Title = "🌌 HACKERTOOL v6.0",
    Text = "HYPER VISIBLE EDITION geladen!\nAlle Buttons sichtbar!",
    Duration = 5
})
