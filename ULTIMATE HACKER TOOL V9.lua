--[[
    ULTIMATE HACKER TOOL V9 - KOMPAKT & BELIEBT
    Made by Waled-hammad
    YouTube: @hacker666-00
    GUI KLEINER - MEHR TOOLS!
]]

-- Fehlerbehandlung
local success, err = pcall(function()

local player = game:GetService("Players").LocalPlayer
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")
local teleportService = game:GetService("TeleportService")
local marketplaceService = game:GetService("MarketplaceService")
local httpService = game:GetService("HttpService")
local virtualUser = game:GetService("VirtualUser")
local lighting = game:GetService("Lighting")
local replicatedStorage = game:GetService("ReplicatedStorage")

-- GUI erstellen
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "WaledUltimateHackerV9"

-- Parent setzen
local parentSuccess = false
local parentOptions = {
    player:FindFirstChild("PlayerGui"),
    player:FindFirstChild("Backpack"),
    game:GetService("CoreGui")
}

for _, parent in ipairs(parentOptions) do
    if parent then
        ScreenGui.Parent = parent
        parentSuccess = true
        break
    end
end

if not parentSuccess then
    local playerGui = Instance.new("PlayerGui")
    playerGui.Parent = player
    ScreenGui.Parent = playerGui
end

ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 999999
ScreenGui.Enabled = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ========== FPS ANZEIGE (NOCH KLEINER) ==========
local FPSFrame = Instance.new("Frame")
FPSFrame.Parent = ScreenGui
FPSFrame.Size = UDim2.new(0, 70, 0, 25) -- NOCH KLEINER!
FPSFrame.Position = UDim2.new(1, -75, 0, 5)
FPSFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FPSFrame.BackgroundTransparency = 0.3
FPSFrame.BorderSizePixel = 0
FPSFrame.ZIndex = 10000
FPSFrame.Visible = true

local FPSCorner = Instance.new("UICorner")
FPSCorner.CornerRadius = UDim.new(0, 6)
FPSCorner.Parent = FPSFrame

local FPSText = Instance.new("TextLabel")
FPSText.Parent = FPSFrame
FPSText.Size = UDim2.new(1, 0, 1, 0)
FPSText.BackgroundTransparency = 1
FPSText.Text = "FPS:60"
FPSText.TextColor3 = Color3.fromRGB(0, 255, 0)
FPSText.Font = Enum.Font.GothamBold
FPSText.TextSize = 14
FPSText.ZIndex = 10001
FPSText.Visible = true

-- FPS aktualisieren
spawn(function()
    while FPSFrame and FPSFrame.Parent do
        local fps = math.floor(1 / runService.RenderStepped:Wait())
        FPSText.Text = "FPS:" .. fps
        if fps >= 60 then
            FPSText.TextColor3 = Color3.fromRGB(0, 255, 0)
        elseif fps >= 30 then
            FPSText.TextColor3 = Color3.fromRGB(255, 255, 0)
        else
            FPSText.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
        wait(0.5)
    end
end)

-- ========== NOTIFICATION SYSTEM ==========
local function showNotification(title, text, duration)
    duration = duration or 3
    local notif = Instance.new("ScreenGui")
    notif.Parent = ScreenGui
    notif.IgnoreGuiInset = true
    notif.DisplayOrder = 999999
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 250, 0, 60)
    frame.Position = UDim2.new(1, -260, 1, -70)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    frame.BackgroundTransparency = 0.1
    frame.Parent = notif
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, -10, 0, 20)
    t.Position = UDim2.new(0, 5, 0, 5)
    t.BackgroundTransparency = 1
    t.Text = title
    t.TextColor3 = Color3.fromRGB(0, 200, 255)
    t.Font = Enum.Font.GothamBold
    t.TextSize = 16
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.Parent = frame
    
    local tx = Instance.new("TextLabel")
    tx.Size = UDim2.new(1, -10, 0, 20)
    tx.Position = UDim2.new(0, 5, 0, 25)
    tx.BackgroundTransparency = 1
    tx.Text = text
    tx.TextColor3 = Color3.new(1,1,1)
    tx.Font = Enum.Font.Gotham
    tx.TextSize = 14
    tx.TextXAlignment = Enum.TextXAlignment.Left
    tx.Parent = frame
    
    if title == "FEHLER" then
        frame.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        t.TextColor3 = Color3.new(1,1,1)
    end
    
    task.wait(duration)
    notif:Destroy()
end

-- ========== WILLKOMMENSFRAME (KLEINER) ==========
local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Parent = ScreenGui
WelcomeFrame.Size = UDim2.new(0, 300, 0, 250) -- KLEINER!
WelcomeFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
WelcomeFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
WelcomeFrame.BackgroundTransparency = 0
WelcomeFrame.BorderSizePixel = 0
WelcomeFrame.Visible = true
WelcomeFrame.ZIndex = 10000
WelcomeFrame.Active = true
WelcomeFrame.Draggable = true

local WelcomeCorner = Instance.new("UICorner")
WelcomeCorner.CornerRadius = UDim.new(0, 12)
WelcomeCorner.Parent = WelcomeFrame

-- YouTube Button
local YTButton = Instance.new("TextButton")
YTButton.Parent = WelcomeFrame
YTButton.Size = UDim2.new(0.9, 0, 0, 35)
YTButton.Position = UDim2.new(0.05, 0, 0.05, 0)
YTButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
YTButton.Text = "📺 @hacker666-00"
YTButton.TextColor3 = Color3.new(1,1,1)
YTButton.Font = Enum.Font.GothamBold
YTButton.TextSize = 16
YTButton.BorderSizePixel = 0
YTButton.Visible = true

local YTCorner = Instance.new("UICorner")
YTCorner.CornerRadius = UDim.new(0, 6)
YTCorner.Parent = YTButton

YTButton.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00?si=9nPd1Y9rHP7Yz3vz")
    showNotification("YouTube", "Link kopiert!", 1)
end)

-- Titel
local WelcomeTitle = Instance.new("TextLabel")
WelcomeTitle.Parent = WelcomeFrame
WelcomeTitle.Size = UDim2.new(1, 0, 0, 30)
WelcomeTitle.Position = UDim2.new(0, 0, 0, 50)
WelcomeTitle.BackgroundTransparency = 1
WelcomeTitle.Text = "⚡ GERÄT AUSWÄHLEN ⚡"
WelcomeTitle.TextColor3 = Color3.fromRGB(0, 200, 255)
WelcomeTitle.Font = Enum.Font.GothamBold
WelcomeTitle.TextSize = 18
WelcomeTitle.Visible = true

-- PC Button
local PCButton = Instance.new("TextButton")
PCButton.Parent = WelcomeFrame
PCButton.Size = UDim2.new(0.8, 0, 0, 40)
PCButton.Position = UDim2.new(0.1, 0, 0.3, 0)
PCButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
PCButton.Text = "💻 PC"
PCButton.TextColor3 = Color3.new(1,1,1)
PCButton.Font = Enum.Font.GothamBold
PCButton.TextSize = 18
PCButton.BorderSizePixel = 0
PCButton.Visible = true

local PCCorner = Instance.new("UICorner")
PCCorner.CornerRadius = UDim.new(0, 8)
PCCorner.Parent = PCButton

-- Mobile Button
local MobileButton = Instance.new("TextButton")
MobileButton.Parent = WelcomeFrame
MobileButton.Size = UDim2.new(0.8, 0, 0, 40)
MobileButton.Position = UDim2.new(0.1, 0, 0.5, 0)
MobileButton.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
MobileButton.Text = "📱 Mobile"
MobileButton.TextColor3 = Color3.new(1,1,1)
MobileButton.Font = Enum.Font.GothamBold
MobileButton.TextSize = 18
MobileButton.BorderSizePixel = 0
MobileButton.Visible = true

local MobileCorner = Instance.new("UICorner")
MobileCorner.CornerRadius = UDim.new(0, 8)
MobileCorner.Parent = MobileButton

-- Timer ein/aus Button
local TimerToggle = Instance.new("TextButton")
TimerToggle.Parent = WelcomeFrame
TimerToggle.Size = UDim2.new(0.8, 0, 0, 35)
TimerToggle.Position = UDim2.new(0.1, 0, 0.7, 0)
TimerToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
TimerToggle.Text = "⏱️ Timer: AN"
TimerToggle.TextColor3 = Color3.new(1,1,1)
TimerToggle.Font = Enum.Font.GothamBold
TimerToggle.TextSize = 16
TimerToggle.BorderSizePixel = 0
TimerToggle.Visible = true

local TimerCorner = Instance.new("UICorner")
TimerCorner.CornerRadius = UDim.new(0, 8)
TimerCorner.Parent = TimerToggle

local timerEnabled = true
TimerToggle.MouseButton1Click:Connect(function()
    timerEnabled = not timerEnabled
    TimerToggle.Text = timerEnabled and "⏱️ Timer: AN" or "⏱️ Timer: AUS"
    showNotification("Timer", timerEnabled and "Timer AN" or "Timer AUS", 1)
end)

local WelcomeCredit = Instance.new("TextLabel")
WelcomeCredit.Parent = WelcomeFrame
WelcomeCredit.Size = UDim2.new(1, 0, 0, 25)
WelcomeCredit.Position = UDim2.new(0, 0, 1, -25)
WelcomeCredit.BackgroundTransparency = 1
WelcomeCredit.Text = "by Waled-hammad"
WelcomeCredit.TextColor3 = Color3.fromRGB(150, 150, 150)
WelcomeCredit.Font = Enum.Font.Gotham
WelcomeCredit.TextSize = 12
WelcomeCredit.Visible = true

-- ========== FLOATING BUTTON ==========
local OpenButton = Instance.new("TextButton")
OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0, 60, 0, 60)
OpenButton.Position = UDim2.new(0, 10, 0.5, -30)
OpenButton.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
OpenButton.Text = "⚡"
OpenButton.TextColor3 = Color3.new(1,1,1)
OpenButton.TextScaled = true
OpenButton.Font = Enum.Font.GothamBold
OpenButton.Name = "OpenButton"
OpenButton.Draggable = true
OpenButton.ZIndex = 9999
OpenButton.Visible = false
OpenButton.BorderSizePixel = 0

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(1, 0)
OpenCorner.Parent = OpenButton

-- Pulse Animation
spawn(function()
    while OpenButton and OpenButton.Parent do
        pcall(function()
            tweenService:Create(OpenButton, TweenInfo.new(1), {BackgroundColor3 = Color3.fromRGB(100, 200, 255)}):Play()
            wait(1)
            tweenService:Create(OpenButton, TweenInfo.new(1), {BackgroundColor3 = Color3.fromRGB(0, 200, 255)}):Play()
            wait(1)
        end)
    end
end)

-- ========== MAIN FRAME (VIEL KLEINER!) ==========
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 450, 0, 550) -- DEUTLICH KLEINER!
Frame.Position = UDim2.new(0.5, -225, 0.5, -275)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
Frame.Visible = false
Frame.Draggable = true
Frame.Active = true
Frame.BackgroundTransparency = 0
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 12)
FrameCorner.Parent = Frame

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Parent = Frame
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TitleBar.BorderSizePixel = 0
TitleBar.Visible = true

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar

-- YouTube Button im Titel
local TitleYT = Instance.new("TextButton")
TitleYT.Parent = TitleBar
TitleYT.Size = UDim2.new(0, 25, 0, 25)
TitleYT.Position = UDim2.new(0, 10, 0, 7.5)
TitleYT.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TitleYT.Text = "▶"
TitleYT.TextColor3 = Color3.new(1,1,1)
TitleYT.Font = Enum.Font.GothamBold
TitleYT.TextSize = 16
TitleYT.BorderSizePixel = 0
TitleYT.Visible = true

local TitleYTCorner = Instance.new("UICorner")
TitleYTCorner.CornerRadius = UDim.new(0, 6)
TitleYTCorner.Parent = TitleYT

TitleYT.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00?si=9nPd1Y9rHP7Yz3vz")
    showNotification("YouTube", "Link kopiert!", 1)
end)

local TitleText = Instance.new("TextLabel")
TitleText.Parent = TitleBar
TitleText.Size = UDim2.new(1, -110, 1, 0)
TitleText.Position = UDim2.new(0, 40, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "⚡ HACKER V9 ⚡"
TitleText.TextColor3 = Color3.fromRGB(0, 200, 255)
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 18
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Visible = true

-- Color Picker Button
local ColorBtn = Instance.new("TextButton")
ColorBtn.Parent = TitleBar
ColorBtn.Size = UDim2.new(0, 25, 0, 25)
ColorBtn.Position = UDim2.new(1, -85, 0, 7.5)
ColorBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
ColorBtn.Text = "🎨"
ColorBtn.TextColor3 = Color3.new(1,1,1)
ColorBtn.Font = Enum.Font.GothamBold
ColorBtn.TextSize = 16
ColorBtn.BorderSizePixel = 0
ColorBtn.Visible = true

local ColorCorner = Instance.new("UICorner")
ColorCorner.CornerRadius = UDim.new(0, 6)
ColorCorner.Parent = ColorBtn

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Parent = TitleBar
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -50, 0, 5)
MinBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 255)
MinBtn.Text = "−"
MinBtn.TextColor3 = Color3.new(1,1,1)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 22
MinBtn.BorderSizePixel = 0
MinBtn.Visible = true

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 8)
MinCorner.Parent = MinBtn

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -15, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 18
CloseBtn.BorderSizePixel = 0
CloseBtn.Visible = true

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

-- Tabs
local TabFrame = Instance.new("Frame")
TabFrame.Parent = Frame
TabFrame.Size = UDim2.new(1, -20, 0, 40)
TabFrame.Position = UDim2.new(0, 10, 0, 45)
TabFrame.BackgroundTransparency = 1
TabFrame.Visible = true

local tabs = {}
local activeTab = "CHEATS"

local function createTab(name, pos)
    local tab = Instance.new("TextButton")
    tab.Parent = TabFrame
    tab.Size = UDim2.new(0, 80, 0, 35)
    tab.Position = UDim2.new(0, pos, 0, 2.5)
    tab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    tab.Text = name
    tab.TextColor3 = Color3.new(1,1,1)
    tab.Font = Enum.Font.GothamBold
    tab.TextSize = 14
    tab.BorderSizePixel = 0
    tab.Visible = true

    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 8)
    tabCorner.Parent = tab

    tabs[name] = tab
    return tab
end

local tabCheats = createTab("CHEATS", 0)
local tabAdmin = createTab("ADMIN", 85)
local tabVIP = createTab("VIP", 170)
local tabTools = createTab("TOOLS", 255)
local tabAI = createTab("AI", 340)

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = Frame
ContentFrame.Size = UDim2.new(1, -20, 1, -130)
ContentFrame.Position = UDim2.new(0, 10, 0, 90)
ContentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
ContentFrame.BackgroundTransparency = 0.2
ContentFrame.Visible = true

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 10)
ContentCorner.Parent = ContentFrame

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Parent = ContentFrame
ScrollingFrame.Size = UDim2.new(1, -20, 1, -20)
ScrollingFrame.Position = UDim2.new(0, 10, 0, 10)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.ScrollBarThickness = 5
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 200, 255)
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.Visible = true

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 4)
ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ListLayout.Parent = ScrollingFrame

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 4)
Padding.PaddingBottom = UDim.new(0, 4)
Padding.Parent = ScrollingFrame

-- ========== FUNKTIONEN ==========

-- Tab umschalten
local function switchTab(tabName)
    activeTab = tabName
    
    for _, child in ipairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.Visible = false
        end
        if child:IsA("Frame") then
            child.Visible = false
        end
    end
    
    for name, tab in pairs(tabs) do
        tab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    end
    
    if tabs[tabName] then
        tabs[tabName].BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    end
    
    for _, child in ipairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") and child:GetAttribute("Tab") == tabName then
            child.Visible = true
        end
        if child:IsA("Frame") and child.Name == "AIFrame" then
            child.Visible = (tabName == "AI")
        end
    end
end

-- PC/Mobile Auswahl
PCButton.MouseButton1Click:Connect(function()
    WelcomeFrame.Visible = false
    OpenButton.Visible = true
    for _, child in ipairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.Size = UDim2.new(0.95, 0, 0, 40)
        end
    end
    showNotification("PC MODUS", "Bereit! Klicke auf ⚡", 1)
end)

MobileButton.MouseButton1Click:Connect(function()
    WelcomeFrame.Visible = false
    OpenButton.Visible = true
    for _, child in ipairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.Size = UDim2.new(0.95, 0, 0, 50)
        end
    end
    showNotification("MOBILE MODUS", "Bereit! Tippe auf ⚡", 1)
end)

-- Button Creator
local function createButton(text, color, callback, tabName)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.95, 0, 0, 40)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.AutoButtonColor = false
    btn.BorderSizePixel = 0
    btn.Parent = ScrollingFrame
    btn.Visible = false
    btn:SetAttribute("Tab", tabName)
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    
    return btn
end

-- ========== BELIEBTE TOOLGIVER & SCAN TOOLS ==========

-- TOOLGIVER 1: Gibt ALLE Tools aus dem Spiel
local function toolgiverAll()
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then 
        showNotification("Fehler", "Backpack nicht gefunden", 2)
        return 
    end
    
    local count = 0
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("Tool") and obj.Parent then
            pcall(function()
                obj:Clone().Parent = backpack
                count = count + 1
            end)
        end
    end
    showNotification("Toolgiver", count .. " Tools erhalten!", 2)
end

-- TOOLGIVER 2: Gibt NUR seltene Tools (Admin, OP, VIP)
local function toolgiverRare()
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then 
        showNotification("Fehler", "Backpack nicht gefunden", 2)
        return 
    end
    
    local count = 0
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("Tool") and obj.Parent then
            local name = obj.Name:lower()
            if name:find("admin") or name:find("op") or name:find("vip") or name:find("god") or name:find("super") then
                pcall(function()
                    obj:Clone().Parent = backpack
                    count = count + 1
                end)
            end
        end
    end
    showNotification("Rare Tools", count .. " seltene Tools!", 2)
end

-- TOOLGIVER 3: Gibt NUR Waffen (Sword, Gun, etc.)
local function toolgiverWeapons()
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then 
        showNotification("Fehler", "Backpack nicht gefunden", 2)
        return 
    end
    
    local count = 0
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("Tool") and obj.Parent then
            local name = obj.Name:lower()
            if name:find("sword") or name:find("gun") or name:find("blade") or name:find("knife") or name:find("weapon") then
                pcall(function()
                    obj:Clone().Parent = backpack
                    count = count + 1
                end)
            end
        end
    end
    showNotification("Waffen", count .. " Waffen erhalten!", 2)
end

-- SCANNER 1: Scannt ALLE Tools
local function scannerAll()
    local tools = {}
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("Tool") and obj.Parent then
            tools[obj.Name] = true
        end
    end
    local count = 0
    for _ in pairs(tools) do count = count + 1 end
    showNotification("Scanner", count .. " Tools gefunden!", 2)
end

-- SCANNER 2: Scannt NUR seltene Tools
local function scannerRare()
    local tools = {}
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("Tool") and obj.Parent then
            local name = obj.Name:lower()
            if name:find("admin") or name:find("op") or name:find("vip") or name:find("god") then
                tools[obj.Name] = true
            end
        end
    end
    local count = 0
    for _ in pairs(tools) do count = count + 1 end
    showNotification("Rare Scanner", count .. " rare Tools!", 2)
end

-- SCANNER 3: Scannt NUR Waffen
local function scannerWeapons()
    local tools = {}
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("Tool") and obj.Parent then
            local name = obj.Name:lower()
            if name:find("sword") or name:find("gun") or name:find("blade") or name:find("knife") then
                tools[obj.Name] = true
            end
        end
    end
    local count = 0
    for _ in pairs(tools) do count = count + 1 end
    showNotification("Waffen Scanner", count .. " Waffen!", 2)
end

-- DUPLICATOR: Verdoppelt Tools im Backpack
local function duplicateTools()
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then 
        showNotification("Fehler", "Backpack nicht gefunden", 2)
        return 
    end
    
    local count = 0
    for _, tool in ipairs(backpack:GetChildren()) do
        if tool:IsA("Tool") then
            pcall(function()
                tool:Clone().Parent = backpack
                count = count + 1
            end)
        end
    end
    showNotification("Duplicator", count .. " Tools dupliziert!", 2)
end

-- REMOVER: Entfernt alle Tools aus Backpack
local function removeTools()
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then 
        showNotification("Fehler", "Backpack nicht gefunden", 2)
        return 
    end
    
    local count = 0
    for _, tool in ipairs(backpack:GetChildren()) do
        if tool:IsA("Tool") then
            tool:Destroy()
            count = count + 1
        end
    end
    showNotification("Remover", count .. " Tools entfernt!", 2)
end

-- GIVE ALL PLAYERS: Gibt allen Spielern Tools
local function giveAllPlayers()
    local count = 0
    for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
        if p ~= player then
            local backpack = p:FindFirstChild("Backpack")
            if backpack then
                for _, obj in ipairs(game:GetDescendants()) do
                    if obj:IsA("Tool") and obj.Parent then
                        pcall(function()
                            obj:Clone().Parent = backpack
                            count = count + 1
                        end)
                    end
                end
            end
        end
    end
    showNotification("Give All", count .. " Tools verteilt!", 2)
end

-- TOOL INFINITY: Macht Tools unendlich haltbar
local function toolInfinity()
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then return end
    
    for _, tool in ipairs(backpack:GetChildren()) do
        if tool:IsA("Tool") then
            pcall(function()
                tool.RequiresHandle = false
                local handle = tool:FindFirstChild("Handle")
                if handle then
                    handle.Anchored = true
                    handle.CanCollide = false
                end
            end)
        end
    end
    showNotification("Tool Infinity", "Tools unendlich!", 2)
end

-- ========== WEITERE BELIEBTE TOOLS ==========

-- TNT
local function createTNT()
    local mouse = player:GetMouse()
    local pos = mouse.Hit.p
    
    local tnt = Instance.new("Part")
    tnt.Size = Vector3.new(2, 2, 2)
    tnt.Position = pos + Vector3.new(0, 5, 0)
    tnt.BrickColor = BrickColor.new("Really red")
    tnt.Material = Enum.Material.Neon
    tnt.Parent = workspace
    
    if timerEnabled then
        for i = 5, 0, -1 do
            tnt.BrickColor = i % 2 == 0 and BrickColor.new("Really red") or BrickColor.new("Bright yellow")
            wait(1)
        end
    else
        wait(2)
    end
    
    local explosion = Instance.new("Explosion")
    explosion.Position = tnt.Position
    explosion.BlastRadius = 20
    explosion.BlastPressure = 100000
    explosion.Parent = workspace
    tnt:Destroy()
    showNotification("TNT", "BOOM!", 1)
end

-- Aimbot
local aimbotEnabled = false
local aimbotConnection

local function toggleAimbot()
    aimbotEnabled = not aimbotEnabled
    
    if aimbotEnabled then
        aimbotConnection = runService.RenderStepped:Connect(function()
            local closest = nil
            local closestDist = math.huge
            local mouse = player:GetMouse()
            
            for _, v in ipairs(game:GetService("Players"):GetPlayers()) do
                if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    local pos = v.Character.HumanoidRootPart.Position
                    local screenPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(pos)
                    
                    if onScreen then
                        local dist = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                        if dist < closestDist then
                            closest = v
                            closestDist = dist
                        end
                    end
                end
            end
            
            if closest and closestDist < 200 then
                workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.Position, closest.Character.HumanoidRootPart.Position)
            end
        end)
        showNotification("Aimbot", "AN", 1)
    else
        if aimbotConnection then
            aimbotConnection:Disconnect()
        end
        showNotification("Aimbot", "AUS", 1)
    end
end

-- VIP Unlock
local function unlockVIP()
    local found = false
    for _, v in ipairs(player:GetDescendants()) do
        if v:IsA("BoolValue") and (v.Name:lower():find("vip") or v.Name:lower():find("premium")) then
            v.Value = true
            found = true
        end
        if v:IsA("NumberValue") and (v.Name:lower():find("vip") or v.Name:lower():find("rank")) then
            v.Value = 999
            found = true
        end
    end
    showNotification("VIP", found and "Freigeschaltet!" or "Nichts gefunden", 1)
end

-- Admin Unlock
local function unlockAdmin()
    local found = false
    for _, v in ipairs(player:GetDescendants()) do
        if v:IsA("BoolValue") and (v.Name:lower():find("admin") or v.Name:lower():find("mod")) then
            v.Value = true
            found = true
        end
        if v:IsA("NumberValue") and (v.Name:lower():find("admin") or v.Name:lower():find("rank")) then
            v.Value = 999
            found = true
        end
    end
    showNotification("Admin", found and "Freigeschaltet!" or "Nichts gefunden", 1)
end

-- Geld Modus
local infMoney = false
local function toggleMoney()
    infMoney = not infMoney
    
    if infMoney then
        local leaderstats = player:FindFirstChild("leaderstats")
        if leaderstats then
            for _, v in ipairs(leaderstats:GetChildren()) do
                if v:IsA("NumberValue") or v:IsA("IntValue") then
                    v.Value = 999999999
                end
            end
        end
        showNotification("Money", "∞ GELD AN", 1)
    else
        showNotification("Money", "AUS", 1)
    end
end

-- Fly
local flyEnabled = false
local flyConnection

local function toggleFly()
    flyEnabled = not flyEnabled
    
    if flyEnabled then
        local char = player.Character
        if char then
            local root = char:FindFirstChild("HumanoidRootPart")
            if root then
                local bv = Instance.new("BodyVelocity")
                bv.MaxForce = Vector3.new(9e4, 9e4, 9e4)
                bv.Parent = root
                
                flyConnection = runService.Heartbeat:Connect(function()
                    if char and char.Humanoid then
                        local moveDir = char.Humanoid.MoveDirection
                        bv.Velocity = moveDir * 100
                    end
                end)
            end
        end
        showNotification("Fly", "AN", 1)
    else
        if flyConnection then
            flyConnection:Disconnect()
        end
        if player.Character then
            local root = player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local bv = root:FindFirstChildOfClass("BodyVelocity")
                if bv then bv:Destroy() end
            end
        end
        showNotification("Fly", "AUS", 1)
    end
end

-- Noclip
local noclipEnabled = false
local noclipConnection

local function toggleNoclip()
    noclipEnabled = not noclipEnabled
    
    if noclipEnabled then
        noclipConnection = runService.Stepped:Connect(function()
            if player.Character then
                for _, part in ipairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
        showNotification("Noclip", "AN", 1)
    else
        if noclipConnection then
            noclipConnection:Disconnect()
        end
        showNotification("Noclip", "AUS", 1)
    end
end

-- Speed
local function speedHack()
    if player.Character and player.Character.Humanoid then
        player.Character.Humanoid.WalkSpeed = 100
        showNotification("Speed", "100", 1)
    end
end

-- Infinite Jump
local infJumpEnabled = false
local jumpConnection

local function toggleInfJump()
    infJumpEnabled = not infJumpEnabled
    
    if infJumpEnabled then
        jumpConnection = userInputService.JumpRequest:Connect(function()
            if player.Character and player.Character.Humanoid then
                player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
        showNotification("Inf Jump", "AN", 1)
    else
        if jumpConnection then
            jumpConnection:Disconnect()
        end
        showNotification("Inf Jump", "AUS", 1)
    end
end

-- ESP
local function toggleESP()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucas17052011/ESP/main/ESP%20Lucas"))()
    end)
    showNotification("ESP", "Geladen!", 1)
end

-- God Mode
local function godMode()
    if player.Character and player.Character.Humanoid then
        player.Character.Humanoid.MaxHealth = math.huge
        player.Character.Humanoid.Health = math.huge
        showNotification("God Mode", "AN", 1)
    end
end

-- Rejoin
local function rejoin()
    showNotification("Rejoin", "Verbinde neu...", 1)
    teleportService:Teleport(game.PlaceId, player)
end

-- Server Hop
local function serverHop()
    showNotification("Server Hop", "Suche...", 1)
    local success, servers = pcall(function()
        return httpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100")).data
    end)
    
    if success and servers then
        for _, v in ipairs(servers) do
            if v.playing < v.maxPlayers then
                teleportService:TeleportToPlaceInstance(game.PlaceId, v.id, player)
                break
            end
        end
    end
end

-- Reset Character
local function resetChar()
    if player.Character then
        player.Character:BreakJoints()
        showNotification("Reset", "Character zurückgesetzt", 1)
    end
end

-- Farbwechsel
local function changeColor()
    local r = math.random(0, 255)
    local g = math.random(0, 255)
    local b = math.random(0, 255)
    TitleText.TextColor3 = Color3.fromRGB(r, g, b)
    for _, tab in pairs(tabs) do
        if tab.Text == activeTab then
            tab.BackgroundColor3 = Color3.fromRGB(r, g, b)
        end
    end
    showNotification("Farbe", "Geändert!", 1)
end

-- Infinite Yield
local function loadInfiniteYield()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
    showNotification("Infinite Yield", "Geladen!", 1)
end

-- Anti AFK
local function antiAFK()
    player.Idled:Connect(function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end)
    showNotification("Anti AFK", "Aktiv!", 1)
end

-- Brightness
local brightnessEnabled = false
local function toggleBrightness()
    brightnessEnabled = not brightnessEnabled
    
    if brightnessEnabled then
        lighting.Brightness = 2
        lighting.Ambient = Color3.new(1,1,1)
        showNotification("Brightness", "HELL", 1)
    else
        lighting.Brightness = 1
        lighting.Ambient = Color3.new(0,0,0)
        showNotification("Brightness", "Normal", 1)
    end
end

-- Gravity
local gravityEnabled = false
local function toggleGravity()
    gravityEnabled = not gravityEnabled
    
    if gravityEnabled then
        workspace.Gravity = 50
        showNotification("Gravity", "Leicht", 1)
    else
        workspace.Gravity = 196.2
        showNotification("Gravity", "Normal", 1)
    end
end

-- Click TP
local clickTPEnabled = false
local function toggleClickTP()
    clickTPEnabled = not clickTPEnabled
    
    if clickTPEnabled then
        local mouse = player:GetMouse()
        mouse.Button1Down:Connect(function()
            if clickTPEnabled and mouse.Target then
                player.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.p + Vector3.new(0,3,0))
            end
        end)
        showNotification("Click TP", "AN - Klicke", 1)
    else
        showNotification("Click TP", "AUS", 1)
    end
end

-- AI Assistant
local function AIAssistant(query)
    local q = query:lower()
    if q:find("tnt") then
        createTNT()
        return "✅ TNT"
    elseif q:find("aimbot") then
        toggleAimbot()
        return "✅ Aimbot"
    elseif q:find("vip") then
        unlockVIP()
        return "✅ VIP"
    elseif q:find("admin") then
        unlockAdmin()
        return "✅ Admin"
    elseif q:find("money") or q:find("geld") then
        toggleMoney()
        return "✅ Money"
    elseif q:find("fly") then
        toggleFly()
        return "✅ Fly"
    elseif q:find("speed") then
        speedHack()
        return "✅ Speed"
    elseif q:find("noclip") then
        toggleNoclip()
        return "✅ Noclip"
    elseif q:find("jump") then
        toggleInfJump()
        return "✅ Jump"
    elseif q:find("tool") or q:find("giver") then
        toolgiverAll()
        return "✅ Tools"
    elseif q:find("scan") then
        scannerAll()
        return "✅ Scan"
    else
        return "❓ TNT/Aimbot/VIP/Admin/Money/Fly/Speed/Tool/Scan"
    end
end

-- ========== ALLE BUTTONS ==========

-- CHEATS Tab (12 Tools)
createButton("🎯 AIMBOT", Color3.fromRGB(255,50,50), toggleAimbot, "CHEATS")
createButton("💰 MONEY", Color3.fromRGB(255,200,0), toggleMoney, "CHEATS")
createButton("💣 TNT", Color3.fromRGB(255,100,0), createTNT, "CHEATS")
createButton("🦅 FLY", Color3.fromRGB(100,100,255), toggleFly, "CHEATS")
createButton("🚪 NOCLIP", Color3.fromRGB(150,0,150), toggleNoclip, "CHEATS")
createButton("⚡ SPEED", Color3.fromRGB(0,255,0), speedHack, "CHEATS")
createButton("🦘 INF JUMP", Color3.fromRGB(0,200,200), toggleInfJump, "CHEATS")
createButton("👁️ ESP", Color3.fromRGB(200,0,200), toggleESP, "CHEATS")
createButton("🛡️ GOD MODE", Color3.fromRGB(255,0,0), godMode, "CHEATS")
createButton("👆 CLICK TP", Color3.fromRGB(100,0,100), toggleClickTP, "CHEATS")
createButton("☀️ BRIGHT", Color3.fromRGB(255,255,0), toggleBrightness, "CHEATS")
createButton("🌍 GRAVITY", Color3.fromRGB(100,50,150), toggleGravity, "CHEATS")

-- ADMIN Tab (12 Tools)
createButton("👑 ADMIN", Color3.fromRGB(255,215,0), unlockAdmin, "ADMIN")
createButton("💎 VIP", Color3.fromRGB(255,200,0), unlockVIP, "ADMIN")
createButton("📋 TOOLGIVER ALL", Color3.fromRGB(0,170,255), toolgiverAll, "ADMIN")
createButton("🔍 SCANNER ALL", Color3.fromRGB(255,170,0), scannerAll, "ADMIN")
createButton("✨ RARE TOOLS", Color3.fromRGB(200,100,255), toolgiverRare, "ADMIN")
createButton("🔎 RARE SCAN", Color3.fromRGB(200,100,0), scannerRare, "ADMIN")
createButton("⚔️ WAFFEN", Color3.fromRGB(255,100,100), toolgiverWeapons, "ADMIN")
createButton("🔪 WAFFEN SCAN", Color3.fromRGB(200,50,50), scannerWeapons, "ADMIN")
createButton("📦 DUPLICATE", Color3.fromRGB(100,200,100), duplicateTools, "ADMIN")
createButton("🗑️ REMOVE", Color3.fromRGB(255,100,100), removeTools, "ADMIN")
createButton("👥 GIVE ALL", Color3.fromRGB(100,100,255), giveAllPlayers, "ADMIN")
createButton("♾️ INF YIELD", Color3.fromRGB(0,200,0), loadInfiniteYield, "ADMIN")

-- VIP Tab (8 Tools)
createButton("💎 VIP", Color3.fromRGB(255,215,0), unlockVIP, "VIP")
createButton("✨ EFFECTS", Color3.fromRGB(255,100,255), function()
    local char = player.Character
    if char and char.HumanoidRootPart then
        local attach = Instance.new("Attachment")
        attach.Parent = char.HumanoidRootPart
        local particles = Instance.new("ParticleEmitter")
        particles.Parent = attach
        particles.Texture = "rbxasset://textures/particles/sparkles_main.dds"
        particles.Color = ColorSequence.new(Color3.fromRGB(255,215,0))
        particles.Rate = 50
        showNotification("VIP Effects", "Aktiv!", 1)
    end
end, "VIP")
createButton("🌈 RAINBOW", Color3.fromRGB(255,0,255), function()
    spawn(function()
        while wait(0.1) do
            pcall(function() 
                if player.Character and player.Character.Head then
                    player.Character.Head.BrickColor = BrickColor.random()
                end
            end)
        end
    end)
    showNotification("Rainbow", "Aktiv!", 1)
end, "VIP")
createButton("☀️ BRIGHT", Color3.fromRGB(255,255,0), toggleBrightness, "VIP")
createButton("🌍 GRAVITY", Color3.fromRGB(100,50,150), toggleGravity, "VIP")
createButton("💤 ANTI AFK", Color3.fromRGB(100,100,100), antiAFK, "VIP")
createButton("♾️ INF TOOL", Color3.fromRGB(200,100,0), toolInfinity, "VIP")
createButton("🔄 REJOIN", Color3.fromRGB(100,100,100), rejoin, "VIP")

-- TOOLS Tab (12 Tools)
createButton("🎯 AIMBOT", Color3.fromRGB(255,50,50), toggleAimbot, "TOOLS")
createButton("💣 TNT", Color3.fromRGB(255,100,0), createTNT, "TOOLS")
createButton("💰 MONEY", Color3.fromRGB(255,200,0), toggleMoney, "TOOLS")
createButton("🦅 FLY", Color3.fromRGB(100,100,255), toggleFly, "TOOLS")
createButton("🚪 NOCLIP", Color3.fromRGB(150,0,150), toggleNoclip, "TOOLS")
createButton("⚡ SPEED", Color3.fromRGB(0,255,0), speedHack, "TOOLS")
createButton("🦘 INF JUMP", Color3.fromRGB(0,200,200), toggleInfJump, "TOOLS")
createButton("👁️ ESP", Color3.fromRGB(200,0,200), toggleESP, "TOOLS")
createButton("🛡️ GOD MODE", Color3.fromRGB(255,0,0), godMode, "TOOLS")
createButton("🔄 REJOIN", Color3.fromRGB(100,100,100), rejoin, "TOOLS")
createButton("🌍 SERVER HOP", Color3.fromRGB(50,50,150), serverHop, "TOOLS")
createButton("🎨 FARBE", Color3.fromRGB(200,100,200), changeColor, "TOOLS")

-- AI Tab
local AIFrame = Instance.new("Frame")
AIFrame.Name = "AIFrame"
AIFrame.Parent = ScrollingFrame
AIFrame.Size = UDim2.new(0.95, 0, 0, 200)
AIFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
AIFrame.BackgroundTransparency = 0
AIFrame.Visible = false
AIFrame:SetAttribute("Tab", "AI")

local AICorner = Instance.new("UICorner")
AICorner.CornerRadius = UDim.new(0, 10)
AICorner.Parent = AIFrame

local AITitle = Instance.new("TextLabel")
AITitle.Parent = AIFrame
AITitle.Size = UDim2.new(1, 0, 0, 30)
AITitle.Position = UDim2.new(0, 0, 0, 5)
AITitle.BackgroundTransparency = 1
AITitle.Text = "🤖 AI ASSISTANT"
AITitle.TextColor3 = Color3.fromRGB(0, 200, 255)
AITitle.Font = Enum.Font.GothamBold
AITitle.TextSize = 18

local AIInput = Instance.new("TextBox")
AIInput.Parent = AIFrame
AIInput.Size = UDim2.new(1, -20, 0, 45)
AIInput.Position = UDim2.new(0, 10, 0, 40)
AIInput.PlaceholderText = "Befehl..."
AIInput.Text = ""
AIInput.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
AIInput.TextColor3 = Color3.new(1,1,1)
AIInput.Font = Enum.Font.Gotham
AIInput.TextSize = 16

local AIInputCorner = Instance.new("UICorner")
AIInputCorner.CornerRadius = UDim.new(0, 8)
AIInputCorner.Parent = AIInput

local AISubmit = Instance.new("TextButton")
AISubmit.Parent = AIFrame
AISubmit.Size = UDim2.new(1, -20, 0, 45)
AISubmit.Position = UDim2.new(0, 10, 0, 95)
AISubmit.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
AISubmit.Text = "AUSFÜHREN"
AISubmit.TextColor3 = Color3.new(1,1,1)
AISubmit.Font = Enum.Font.GothamBold
AISubmit.TextSize = 18

local AISubmitCorner = Instance.new("UICorner")
AISubmitCorner.CornerRadius = UDim.new(0, 8)
AISubmitCorner.Parent = AISubmit

local AIResult = Instance.new("TextLabel")
AIResult.Parent = AIFrame
AIResult.Size = UDim2.new(1, -20, 0, 35)
AIResult.Position = UDim2.new(0, 10, 0, 150)
AIResult.BackgroundTransparency = 1
AIResult.Text = "👆 Befehl eingeben"
AIResult.TextColor3 = Color3.fromRGB(200, 200, 200)
AIResult.Font = Enum.Font.Gotham
AIResult.TextSize = 14
AIResult.TextWrapped = true

AISubmit.MouseButton1Click:Connect(function()
    local result = AIAssistant(AIInput.Text)
    AIResult.Text = "🤖 " .. result
    AIInput.Text = ""
end)

-- ========== TAB UMSCHALTUNG ==========

tabCheats.MouseButton1Click:Connect(function() switchTab("CHEATS") end)
tabAdmin.MouseButton1Click:Connect(function() switchTab("ADMIN") end)
tabVIP.MouseButton1Click:Connect(function() switchTab("VIP") end)
tabTools.MouseButton1Click:Connect(function() switchTab("TOOLS") end)
tabAI.MouseButton1Click:Connect(function() switchTab("AI") end)

switchTab("CHEATS")

-- ========== OPEN/CLOSE ==========

OpenButton.MouseButton1Click:Connect(function()
    Frame.Visible = true
    OpenButton.Visible = false
end)

CloseBtn.MouseButton1Click:Connect(function()
    Frame.Visible = false
    OpenButton.Visible = true
end)

MinBtn.MouseButton1Click:Connect(function()
    if Frame.Size == UDim2.new(0, 450, 0, 550) then
        Frame.Size = UDim2.new(0, 450, 0, 40)
        ContentFrame.Visible = false
        TabFrame.Visible = false
        MinBtn.Text = "□"
    else
        Frame.Size = UDim2.new(0, 450, 0, 550)
        ContentFrame.Visible = true
        TabFrame.Visible = true
        MinBtn.Text = "−"
    end
end)

ColorBtn.MouseButton1Click:Connect(changeColor)

-- Drag Funktion
local dragging = false
local dragInput, dragStart, startPos

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

userInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Willkommensnachricht
showNotification("HACKER V9", "Wähle PC oder Mobile!", 2)

print("✅ ULTIMATE HACKER TOOL V9 GELADEN!")
print("📺 YouTube: @hacker666-00")

end)

if not success then
    warn("FEHLER: " .. tostring(err))
end
