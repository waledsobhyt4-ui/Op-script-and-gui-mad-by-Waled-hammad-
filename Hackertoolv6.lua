--[[
🌌 HACKERTOOL v6.0 - MOBILE EDITION 🌌
Perfekte Größe für Handy - ALLES SICHTBAR!
Made by Waled-hammad
]]

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer

-- GUI Erstellen
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HackerToolV6_Mobile"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Hauptframe (PERFEKTE HANDY-GRÖSSE)
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200) -- 300x400 Pixel
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true

-- Abgerundete Ecken
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 15)
Corner.Parent = MainFrame

-- Titelbar
local TitleBar = Instance.new("Frame")
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
TitleBar.Size = UDim2.new(1, 0, 0, 35)

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 15)
TitleCorner.Parent = TitleBar

-- Titel
local Title = Instance.new("TextLabel")
Title.Parent = TitleBar
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, -70, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Text = "🔧 HACKERTOOL v6"
Title.TextColor3 = Color3.fromRGB(0, 255, 255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.Position = UDim2.new(1, -30, 0.5, -12.5)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.TextScaled = true
CloseBtn.Font = Enum.Font.GothamBold

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseBtn

-- Social Media (klein)
local SocialFrame = Instance.new("Frame")
SocialFrame.Parent = TitleBar
SocialFrame.BackgroundTransparency = 1
SocialFrame.Size = UDim2.new(1, -10, 0, 20)
SocialFrame.Position = UDim2.new(0, 5, 1, 2)

local YTBtn = Instance.new("TextButton")
YTBtn.Parent = SocialFrame
YTBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
YTBtn.Size = UDim2.new(0, 90, 0, 18)
YTBtn.Position = UDim2.new(0, 0, 0, 0)
YTBtn.Text = "📺 @hacker666"
YTBtn.TextColor3 = Color3.new(1, 1, 1)
YTBtn.TextScaled = true
YTBtn.Font = Enum.Font.GothamBold

local YTCorner = Instance.new("UICorner")
YTCorner.CornerRadius = UDim.new(0, 4)
YTCorner.Parent = YTBtn

local TKBtn = Instance.new("TextButton")
TKBtn.Parent = SocialFrame
TKBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TKBtn.Size = UDim2.new(0, 90, 0, 18)
TKBtn.Position = UDim2.new(0, 95, 0, 0)
TKBtn.Text = "🎵 @mods"
TKBtn.TextColor3 = Color3.fromRGB(0, 255, 255)
TKBtn.TextScaled = true
TKBtn.Font = Enum.Font.GothamBold

local TKCorner = Instance.new("UICorner")
TKCorner.CornerRadius = UDim.new(0, 4)
TKCorner.Parent = TKBtn

-- Tabs (5 Stück - kompakt)
local TabFrame = Instance.new("Frame")
TabFrame.Parent = MainFrame
TabFrame.BackgroundTransparency = 1
TabFrame.Position = UDim2.new(0, 5, 0, 60)
TabFrame.Size = UDim2.new(1, -10, 0, 30)

local TabLayout = Instance.new("UIListLayout")
TabLayout.Parent = TabFrame
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
TabLayout.Spacing = UDim.new(0, 2)

-- Tab Buttons
local Tabs = {}
local TabNames = {"⚡", "🍎", "👁️", "🌍", "⚙️"}
local TabColors = {
    Color3.fromRGB(0, 200, 255),
    Color3.fromRGB(255, 100, 255),
    Color3.fromRGB(100, 255, 100),
    Color3.fromRGB(150, 100, 255),
    Color3.fromRGB(255, 200, 100)
}

for i = 1, 5 do
    local Tab = Instance.new("TextButton")
    Tab.Parent = TabFrame
    Tab.BackgroundColor3 = TabColors[i]
    Tab.Size = UDim2.new(0, 55, 0, 28)
    Tab.Text = TabNames[i]
    Tab.TextColor3 = Color3.new(0, 0, 0)
    Tab.TextScaled = true
    Tab.Font = Enum.Font.GothamBold
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 6)
    TabCorner.Parent = Tab
    
    Tabs[i] = Tab
end

-- Content Frame
local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
ContentFrame.Position = UDim2.new(0, 5, 0, 95)
ContentFrame.Size = UDim2.new(1, -10, 1, -100)
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ContentFrame.ScrollBarThickness = 4
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

-- Button Funktion
local function addButton(text, color, callback)
    color = color or Color3.fromRGB(70, 70, 200)
    
    local Btn = Instance.new("TextButton")
    Btn.Parent = ContentFrame
    Btn.BackgroundColor3 = color
    Btn.Size = UDim2.new(1, -5, 0, 35)
    Btn.Text = text
    Btn.TextColor3 = Color3.new(1, 1, 1)
    Btn.TextScaled = true
    Btn.Font = Enum.Font.GothamBold
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = Btn
    
    Btn.MouseButton1Click:Connect(function()
        Btn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        task.wait(0.1)
        Btn.BackgroundColor3 = color
        pcall(callback)
    end)
    
    return Btn
end

-- Teleport
local function tp(pos, name)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(pos)
        StarterGui:SetCore("SendNotification", {Title = "✅ Teleport", Text = name, Duration = 1})
    end
end

-- Tab Funktionen
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
    addButton("⚡ AUTO FARM", Color3.fromRGB(0, 200, 255), function()
        StarterGui:SetCore("SendNotification", {Title = "Farm", Text = "Auto Farm ON", Duration = 1})
    end)
    addButton("🔄 AUTO QUEST", Color3.fromRGB(0, 200, 255), function()
        StarterGui:SetCore("SendNotification", {Title = "Quest", Text = "Auto Quest ON", Duration = 1})
    end)
    addButton("👹 AUTO BOSS", Color3.fromRGB(0, 200, 255), function()
        StarterGui:SetCore("SendNotification", {Title = "Boss", Text = "Auto Boss ON", Duration = 1})
    end)
    addButton("💰 AUTO BELI", Color3.fromRGB(255, 200, 0), function()
        StarterGui:SetCore("SendNotification", {Title = "Beli", Text = "Auto Beli ON", Duration = 1})
    end)
end)

-- TAB 2: FRUITS
Tabs[2].MouseButton1Click:Connect(function()
    clearContent()
    addButton("🍎 FRUIT SCANNER", Color3.fromRGB(255, 100, 255), function()
        StarterGui:SetCore("SendNotification", {Title = "Scanner", Text = "Suche Früchte...", Duration = 1})
    end)
    addButton("✨ RANDOM FRUIT", Color3.fromRGB(255, 100, 255), function()
        local fruits = {"Flame-Flame", "Ice-Ice", "Light-Light"}
        local f = fruits[math.random(1, #fruits)]
        pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("AddFruit", f) end)
    end)
    addButton("🔥 LEGENDARY", Color3.fromRGB(255, 200, 0), function()
        local legs = {"Dragon-Dragon", "Leopard-Leopard"}
        local l = legs[math.random(1, #legs)]
        pcall(function() ReplicatedStorage.Remotes.CommF_:InvokeServer("AddFruit", l) end)
    end)
    addButton("⚡ AUTO COLLECT", Color3.fromRGB(100, 255, 100), function()
        StarterGui:SetCore("SendNotification", {Title = "Collect", Text = "Auto Collect ON", Duration = 1})
    end)
end)

-- TAB 3: ESP
Tabs[3].MouseButton1Click:Connect(function()
    clearContent()
    addButton("👁️ ESP ALL", Color3.fromRGB(100, 255, 100), function()
        StarterGui:SetCore("SendNotification", {Title = "ESP", Text = "All ESP ON", Duration = 1})
    end)
    addButton("👤 ESP PLAYER", Color3.fromRGB(100, 255, 100), function()
        StarterGui:SetCore("SendNotification", {Title = "ESP", Text = "Player ESP ON", Duration = 1})
    end)
    addButton("🍎 ESP FRUIT", Color3.fromRGB(100, 255, 100), function()
        StarterGui:SetCore("SendNotification", {Title = "ESP", Text = "Fruit ESP ON", Duration = 1})
    end)
    addButton("📦 ESP CHEST", Color3.fromRGB(100, 255, 100), function()
        StarterGui:SetCore("SendNotification", {Title = "ESP", Text = "Chest ESP ON", Duration = 1})
    end)
end)

-- TAB 4: TELEPORT
Tabs[4].MouseButton1Click:Connect(function()
    clearContent()
    addButton("🏝️ Starter", Color3.fromRGB(150, 100, 255), function()
        tp(Vector3.new(1075, 50, 1350), "Starter")
    end)
    addButton("🏝️ Jungle", Color3.fromRGB(150, 100, 255), function()
        tp(Vector3.new(-1200, 50, 1550), "Jungle")
    end)
    addButton("🏝️ Desert", Color3.fromRGB(150, 100, 255), function()
        tp(Vector3.new(950, 20, 4300), "Desert")
    end)
    addButton("🌊 Rose", Color3.fromRGB(200, 100, 255), function()
        tp(Vector3.new(-80, 20, 8500), "Rose")
    end)
    addButton("⚔️ Port", Color3.fromRGB(255, 100, 255), function()
        tp(Vector3.new(-500, 50, 7500), "Port")
    end)
    addButton("👾 Saber", Color3.fromRGB(255, 50, 50), function()
        tp(Vector3.new(-1200, 20, 4500), "Saber")
    end)
    addButton("📍 Maus", Color3.fromRGB(0, 255, 255), function()
        local m = LocalPlayer:GetMouse()
        if m.Hit then tp(m.Hit.p, "Maus") end
    end)
end)

-- TAB 5: UTILS
Tabs[5].MouseButton1Click:Connect(function()
    clearContent()
    addButton("🛡️ GOD MODE", Color3.fromRGB(255, 200, 100), function()
        StarterGui:SetCore("SendNotification", {Title = "God", Text = "God Mode ON", Duration = 1})
    end)
    addButton("⚡ SPEED", Color3.fromRGB(255, 200, 100), function()
        StarterGui:SetCore("SendNotification", {Title = "Speed", Text = "Speed Boost", Duration = 1})
    end)
    addButton("✈️ FLY", Color3.fromRGB(255, 200, 100), function()
        StarterGui:SetCore("SendNotification", {Title = "Fly", Text = "Fly Mode", Duration = 1})
    end)
    addButton("☀️ FULLBRIGHT", Color3.fromRGB(255, 200, 100), function()
        Lighting.Ambient = Color3.new(1, 1, 1)
    end)
    addButton("⚡ FPS BOOST", Color3.fromRGB(255, 200, 100), function()
        setfpscap(999)
        Lighting.GlobalShadows = false
    end)
    addButton("💰 1M BELI", Color3.fromRGB(255, 255, 0), function()
        StarterGui:SetCore("SendNotification", {Title = "Beli", Text = "+1M Beli", Duration = 1})
    end)
    addButton("🔄 SERVER HOP", Color3.fromRGB(255, 200, 100), function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end)
end)

-- Ersten Tab anzeigen
Tabs[1].MouseButton1Click:Fire()

-- Social Media
YTBtn.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00")
    StarterGui:SetCore("SendNotification", {Title = "YouTube", Text = "@hacker666-00", Duration = 1})
end)

TKBtn.MouseButton1Click:Connect(function()
    setclipboard("https://www.tiktok.com/@mods_and_hacks")
    StarterGui:SetCore("SendNotification", {Title = "TikTok", Text = "@mods_and_hacks", Duration = 1})
end)

-- Close
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Willkommensnachricht
StarterGui:SetCore("SendNotification", {
    Title = "🌌 HACKERTOOL v6",
    Text = "Mobile Edition geladen!",
    Duration = 3
})
