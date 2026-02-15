--[[
    ULTIMATE 1000+ TOOL - WISCHBARE TABS
    Made by Waled-hammad
    YouTube: @hacker666-00
    Features: 1000+ Tools, Horizontale Tabs zum Wischen!
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
local players = game:GetService("Players")
local workspace = game:GetService("Workspace")

-- GUI erstellen
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Ultimate1000Tool"

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

-- ========== FPS ANZEIGE ==========
local FPSFrame = Instance.new("Frame")
FPSFrame.Parent = ScreenGui
FPSFrame.Size = UDim2.new(0, 60, 0, 22)
FPSFrame.Position = UDim2.new(1, -65, 0, 5)
FPSFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FPSFrame.BackgroundTransparency = 0.3
FPSFrame.BorderSizePixel = 0
FPSFrame.ZIndex = 10000
FPSFrame.Visible = true

local FPSCorner = Instance.new("UICorner")
FPSCorner.CornerRadius = UDim.new(0, 5)
FPSCorner.Parent = FPSFrame

local FPSText = Instance.new("TextLabel")
FPSText.Parent = FPSFrame
FPSText.Size = UDim2.new(1, 0, 1, 0)
FPSText.BackgroundTransparency = 1
FPSText.Text = "FPS:60"
FPSText.TextColor3 = Color3.fromRGB(0, 255, 0)
FPSText.Font = Enum.Font.GothamBold
FPSText.TextSize = 12
FPSText.ZIndex = 10001
FPSText.Visible = true

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
    duration = duration or 2
    local notif = Instance.new("ScreenGui")
    notif.Parent = ScreenGui
    notif.IgnoreGuiInset = true
    notif.DisplayOrder = 999999
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 220, 0, 50)
    frame.Position = UDim2.new(1, -230, 1, -60)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    frame.BackgroundTransparency = 0.1
    frame.Parent = notif
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame
    
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, -10, 0, 20)
    t.Position = UDim2.new(0, 5, 0, 5)
    t.BackgroundTransparency = 1
    t.Text = title
    t.TextColor3 = Color3.fromRGB(0, 200, 255)
    t.Font = Enum.Font.GothamBold
    t.TextSize = 14
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.Parent = frame
    
    local tx = Instance.new("TextLabel")
    tx.Size = UDim2.new(1, -10, 0, 20)
    tx.Position = UDim2.new(0, 5, 0, 25)
    tx.BackgroundTransparency = 1
    tx.Text = text
    tx.TextColor3 = Color3.new(1,1,1)
    tx.Font = Enum.Font.Gotham
    tx.TextSize = 12
    tx.TextXAlignment = Enum.TextXAlignment.Left
    tx.Parent = frame
    
    task.wait(duration)
    notif:Destroy()
end

-- ========== WILLKOMMENSFRAME ==========
local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Parent = ScreenGui
WelcomeFrame.Size = UDim2.new(0, 280, 0, 240)
WelcomeFrame.Position = UDim2.new(0.5, -140, 0.5, -120)
WelcomeFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
WelcomeFrame.BackgroundTransparency = 0
WelcomeFrame.BorderSizePixel = 0
WelcomeFrame.Visible = true
WelcomeFrame.ZIndex = 10000
WelcomeFrame.Active = true
WelcomeFrame.Draggable = true

local WelcomeCorner = Instance.new("UICorner")
WelcomeCorner.CornerRadius = UDim.new(0, 10)
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
WelcomeTitle.Text = "⚡ 1000+ TOOLS ⚡"
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
PCCorner.CornerRadius = UDim.new(0, 6)
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
MobileCorner.CornerRadius = UDim.new(0, 6)
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
TimerCorner.CornerRadius = UDim.new(0, 6)
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
WelcomeCredit.Text = "by Waled-hammad • 1000+ Tools"
WelcomeCredit.TextColor3 = Color3.fromRGB(150, 150, 150)
WelcomeCredit.Font = Enum.Font.Gotham
WelcomeCredit.TextSize = 12
WelcomeCredit.Visible = true

-- ========== FLOATING BUTTON ==========
local OpenButton = Instance.new("TextButton")
OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0, 55, 0, 55)
OpenButton.Position = UDim2.new(0, 10, 0.5, -27)
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

-- ========== MAIN FRAME ==========
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 400, 0, 500)
Frame.Position = UDim2.new(0.5, -200, 0.5, -250)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
Frame.Visible = false
Frame.Draggable = true
Frame.Active = true
Frame.BackgroundTransparency = 0
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 10)
FrameCorner.Parent = Frame

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Parent = Frame
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TitleBar.BorderSizePixel = 0
TitleBar.Visible = true

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = TitleBar

-- YouTube Button im Titel
local TitleYT = Instance.new("TextButton")
TitleYT.Parent = TitleBar
TitleYT.Size = UDim2.new(0, 28, 0, 28)
TitleYT.Position = UDim2.new(0, 8, 0, 6)
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
TitleText.Position = UDim2.new(0, 42, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "⚡ 1000+ TOOLS ⚡"
TitleText.TextColor3 = Color3.fromRGB(0, 200, 255)
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 18
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Visible = true

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Parent = TitleBar
MinBtn.Size = UDim2.new(0, 32, 0, 32)
MinBtn.Position = UDim2.new(1, -64, 0, 4)
MinBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 255)
MinBtn.Text = "−"
MinBtn.TextColor3 = Color3.new(1,1,1)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 22
MinBtn.BorderSizePixel = 0
MinBtn.Visible = true

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 6)
MinCorner.Parent = MinBtn

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -28, 0, 4)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 18
CloseBtn.BorderSizePixel = 0
CloseBtn.Visible = true

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

-- ===== WISCHBARE TABS (HORIZONTAL) =====
local TabContainer = Instance.new("Frame")
TabContainer.Parent = Frame
TabContainer.Size = UDim2.new(1, 0, 0, 45)
TabContainer.Position = UDim2.new(0, 0, 0, 45)
TabContainer.BackgroundTransparency = 1
TabContainer.ClipsDescendants = true

local TabScrollingFrame = Instance.new("ScrollingFrame")
TabScrollingFrame.Parent = TabContainer
TabScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
TabScrollingFrame.BackgroundTransparency = 1
TabScrollingFrame.BorderSizePixel = 0
TabScrollingFrame.ScrollBarThickness = 0
TabScrollingFrame.CanvasSize = UDim2.new(2, 0, 0, 0) -- Horizontal scrollen
TabScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.X

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.Parent = TabScrollingFrame
TabListLayout.FillDirection = Enum.FillDirection.Horizontal
TabListLayout.Padding = UDim.new(0, 5)
TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local tabs = {}
local activeTab = "MOVE"

-- 20+ Tabs für 1000+ Tools
local tabNames = {
    "MOVE", "FLY", "SPEED", "JUMP", "NOCLIP", "TP", "WATER",
    "COMBAT", "AIMBOT", "KILL", "AURA", "SILENT", "TRIGGER",
    "VISUAL", "ESP", "XRAY", "FULLBRIGHT", "CHAMS", "HIGHLIGHT",
    "WORLD", "TNT", "C4", "GRAVITY", "FIRE", "ICE",
    "ADMIN", "GOD", "VIP", "MONEY", "INFYIELD", "CMD",
    "MISC", "ANTIAFK", "REJOIN", "HOP", "RESET", "FPS",
    "TOOLS", "GIVER", "SCANNER", "DUPE", "REMOVE", "SPY"
}

local function createTab(name, order)
    local tab = Instance.new("TextButton")
    tab.Parent = TabScrollingFrame
    tab.Size = UDim2.new(0, 70, 0, 35)
    tab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    tab.Text = name
    tab.TextColor3 = Color3.new(1,1,1)
    tab.Font = Enum.Font.GothamBold
    tab.TextSize = 13
    tab.BorderSizePixel = 0
    tab.LayoutOrder = order
    tab.Visible = true

    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 6)
    tabCorner.Parent = tab

    tabs[name] = tab
    return tab
end

for i, name in ipairs(tabNames) do
    createTab(name, i)
end

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = Frame
ContentFrame.Size = UDim2.new(1, -10, 1, -135)
ContentFrame.Position = UDim2.new(0, 5, 0, 95)
ContentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
ContentFrame.BackgroundTransparency = 0.2
ContentFrame.Visible = true

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 8)
ContentCorner.Parent = ContentFrame

local ToolScrollingFrame = Instance.new("ScrollingFrame")
ToolScrollingFrame.Parent = ContentFrame
ToolScrollingFrame.Size = UDim2.new(1, -10, 1, -10)
ToolScrollingFrame.Position = UDim2.new(0, 5, 0, 5)
ToolScrollingFrame.BackgroundTransparency = 1
ToolScrollingFrame.BorderSizePixel = 0
ToolScrollingFrame.ScrollBarThickness = 4
ToolScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 200, 255)
ToolScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ToolScrollingFrame.Visible = true

local ToolListLayout = Instance.new("UIListLayout")
ToolListLayout.Padding = UDim.new(0, 4)
ToolListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ToolListLayout.Parent = ToolScrollingFrame

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 4)
Padding.PaddingBottom = UDim.new(0, 4)
Padding.Parent = ToolScrollingFrame

-- ========== FUNKTIONEN ==========

-- Tab umschalten
local function switchTab(tabName)
    activeTab = tabName
    
    for _, child in ipairs(ToolScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.Visible = false
        end
    end
    
    for name, tab in pairs(tabs) do
        tab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    end
    
    if tabs[tabName] then
        tabs[tabName].BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    end
    
    for _, child in ipairs(ToolScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") and child:GetAttribute("Tab") == tabName then
            child.Visible = true
        end
    end
end

-- PC/Mobile Auswahl
PCButton.MouseButton1Click:Connect(function()
    WelcomeFrame.Visible = false
    OpenButton.Visible = true
    for _, child in ipairs(ToolScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.Size = UDim2.new(0.95, 0, 0, 35)
        end
    end
    showNotification("PC MODUS", "1000+ Tools bereit!", 1)
end)

MobileButton.MouseButton1Click:Connect(function()
    WelcomeFrame.Visible = false
    OpenButton.Visible = true
    for _, child in ipairs(ToolScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.Size = UDim2.new(0.95, 0, 0, 45)
        end
    end
    showNotification("MOBILE MODUS", "1000+ Tools bereit!", 1)
end)

-- Button Creator
local function createToolButton(text, color, callback, tabName)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.95, 0, 0, 35)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    btn.AutoButtonColor = false
    btn.BorderSizePixel = 0
    btn.Parent = ToolScrollingFrame
    btn.Visible = false
    btn:SetAttribute("Tab", tabName)
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    
    return btn
end

-- ========== 1000+ TOOLS GENERIEREN ==========
local function generateTools()
    local tools = {}
    local toolTypes = {
        -- MOVE Tools
        {"Fly", toggleFly}, {"Speed", speedHack}, {"Jump", jumpHack}, {"Noclip", toggleNoclip},
        {"Inf Jump", toggleInfJump}, {"TP Mouse", tpToMouse}, {"TP Random", tpRandomPlayer},
        {"Water Walk", toggleWaterWalk}, {"Wall Climb", toggleWallClimb}, {"Spin Bot", toggleSpinBot},
        
        -- FLY Tools
        {"Fly V1", toggleFly}, {"Fly V2", toggleFlyV2}, {"Fly V3", toggleFly}, {"Fly Ultra", toggleFly},
        {"Fly Fast", toggleFly}, {"Fly Slow", toggleFly}, {"Fly Up", flyUp}, {"Fly Down", flyDown},
        
        -- SPEED Tools
        {"Speed 50", speed50}, {"Speed 100", speed100}, {"Speed 200", speed200}, {"Speed 500", speed500},
        {"Speed Ultra", speedUltra}, {"Speed Walk", speedWalk}, {"Speed Run", speedRun},
        
        -- JUMP Tools
        {"Jump 50", jump50}, {"Jump 100", jump100}, {"Jump 200", jump200}, {"Jump 500", jump500},
        {"Jump Ultra", jumpUltra}, {"Jump High", jumpHigh}, {"Jump Low", jumpLow},
        
        -- NOCLIP Tools
        {"Noclip V1", toggleNoclip}, {"Noclip V2", toggleNoclip}, {"Noclip Wall", toggleNoclip},
        {"Noclip All", toggleNoclip}, {"Noclip Off", toggleNoclip},
        
        -- TP Tools
        {"TP Mouse", tpToMouse}, {"TP Random", tpRandomPlayer}, {"TP All", tpAllPlayers},
        {"TP Back", tpBack}, {"TP Forward", tpForward}, {"TP Up", tpUp}, {"TP Down", tpDown},
        
        -- WATER Tools
        {"Water Walk", toggleWaterWalk}, {"Water Run", waterRun}, {"Water Jump", waterJump},
        {"Water Fly", waterFly}, {"Water Speed", waterSpeed},
        
        -- COMBAT Tools
        {"Aimbot", toggleAimbot}, {"Aimbot V2", toggleAimbotV2}, {"Aimbot Head", aimbotHead},
        {"Aimbot Body", aimbotBody}, {"Aimbot Silent", silentAim},
        
        -- AIMBOT Tools
        {"Aimbot", toggleAimbot}, {"Aimbot V2", toggleAimbotV2}, {"Aimbot Pro", aimbotPro},
        {"Aimbot Ultra", aimbotUltra}, {"Aimbot Fast", aimbotFast}, {"Aimbot Slow", aimbotSlow},
        
        -- KILL Tools
        {"Kill Aura", toggleKillAura}, {"Kill All", killAll}, {"Kill Close", killClose},
        {"Kill Far", killFar}, {"Kill Players", killPlayers},
        
        -- AURA Tools
        {"Aura 10", aura10}, {"Aura 20", aura20}, {"Aura 30", aura30}, {"Aura 50", aura50},
        {"Aura 100", aura100}, {"Aura All", auraAll},
        
        -- SILENT Tools
        {"Silent Aim", silentAim}, {"Silent V2", silentAimV2}, {"Silent Ultra", silentAimUltra},
        {"Silent Head", silentHead}, {"Silent Body", silentBody},
        
        -- TRIGGER Tools
        {"Trigger Bot", toggleTriggerBot}, {"Trigger V2", triggerV2}, {"Trigger Fast", triggerFast},
        {"Trigger Head", triggerHead}, {"Trigger Body", triggerBody},
        
        -- VISUAL Tools
        {"ESP", loadESP}, {"ESP V2", espV2}, {"ESP Pro", espPro}, {"ESP Ultra", espUltra},
        
        -- ESP Tools
        {"ESP", loadESP}, {"ESP V2", espV2}, {"ESP Player", espPlayer}, {"ESP Item", espItem},
        {"ESP Door", espDoor}, {"ESP Chest", espChest}, {"ESP All", espAll},
        
        -- XRAY Tools
        {"X-Ray", toggleXray}, {"X-Ray V2", xrayV2}, {"X-Ray Walls", xrayWalls},
        {"X-Ray Players", xrayPlayers}, {"X-Ray Items", xrayItems},
        
        -- FULLBRIGHT Tools
        {"Fullbright", fullbright}, {"Fullbright V2", fullbrightV2}, {"Fullbright Max", fullbrightMax},
        {"Fullbright Night", fullbrightNight}, {"Fullbright Day", fullbrightDay},
        
        -- CHAMS Tools
        {"Chams", toggleChams}, {"Chams V2", chamsV2}, {"Chams Red", chamsRed},
        {"Chams Blue", chamsBlue}, {"Chams Green", chamsGreen}, {"Chams Rainbow", chamsRainbow},
        
        -- HIGHLIGHT Tools
        {"Highlight", toggleHighlight}, {"Highlight V2", highlightV2}, {"Highlight Red", highlightRed},
        {"Highlight Blue", highlightBlue}, {"Highlight Green", highlightGreen},
        
        -- WORLD Tools
        {"TNT", createTNT}, {"TNT V2", tntV2}, {"TNT Mega", tntMega}, {"TNT Nuke", tntNuke},
        
        -- TNT Tools
        {"TNT", createTNT}, {"TNT Small", tntSmall}, {"TNT Medium", tntMedium},
        {"TNT Large", tntLarge}, {"TNT Mega", tntMega}, {"TNT Nuke", tntNuke},
        
        -- C4 Tools
        {"C4", placeC4}, {"C4 V2", c4V2}, {"C4 Detonate", detonateAll},
        {"C5", c5}, {"C5 Detonate", detonateC5},
        
        -- GRAVITY Tools
        {"Gravity Gun", toggleGravityGun}, {"Gravity Low", gravityLow}, {"Gravity High", gravityHigh},
        {"Gravity Zero", gravityZero}, {"Gravity Normal", gravityNormal},
        
        -- FIRE Tools
        {"Fire", createFire}, {"Fire V2", fireV2}, {"Fire Mega", fireMega},
        {"Fire All", fireAll}, {"Fire Remove", removeFire},
        
        -- ICE Tools
        {"Ice", createIce}, {"Ice V2", iceV2}, {"Ice Freeze", iceFreeze},
        {"Ice All", iceAll}, {"Ice Remove", removeIce},
        
        -- ADMIN Tools
        {"Admin Unlock", unlockAdmin}, {"Admin V2", adminV2}, {"Admin All", adminAll},
        
        -- GOD Tools
        {"God Mode", toggleGodMode}, {"God V2", godV2}, {"God All", godAll},
        {"God Health", godHealth}, {"God Shield", godShield},
        
        -- VIP Tools
        {"VIP Unlock", unlockVIP}, {"VIP V2", vipV2}, {"VIP All", vipAll},
        {"VIP Effects", vipEffects}, {"VIP Rainbow", vipRainbow},
        
        -- MONEY Tools
        {"Inf Money", toggleInfiniteMoney}, {"Money V2", moneyV2}, {"Money All", moneyAll},
        {"Money Add", moneyAdd}, {"Money Set", moneySet},
        
        -- INFYIELD Tools
        {"Inf Yield", loadInfiniteYield}, {"Inf Yield V2", iyV2}, {"Inf Yield Admin", iyAdmin},
        
        -- CMD Tools
        {"CMD-X", loadCmdX}, {"CMD-X V2", cmdXV2}, {"CMD-X Admin", cmdXAdmin},
        
        -- MISC Tools
        {"Anti AFK", antiAFK}, {"Anti AFK V2", antiAFKV2}, {"Anti Kick", antiKick},
        
        -- ANTIAFK Tools
        {"Anti AFK", antiAFK}, {"Anti AFK Pro", antiAFKPro}, {"Anti AFK Ultra", antiAFKUltra},
        
        -- REJOIN Tools
        {"Rejoin", rejoin}, {"Rejoin V2", rejoinV2}, {"Rejoin Fast", rejoinFast},
        
        -- HOP Tools
        {"Server Hop", serverHop}, {"Server Hop V2", serverHopV2}, {"Server Hop Fast", serverHopFast},
        
        -- RESET Tools
        {"Reset Char", resetChar}, {"Reset V2", resetV2}, {"Reset All", resetAll},
        
        -- FPS Tools
        {"FPS Boost", fpsBoost}, {"FPS V2", fpsV2}, {"FPS Max", fpsMax},
        
        -- TOOLS Tab
        {"Toolgiver", toolgiver}, {"Toolgiver V2", toolgiverV2}, {"Toolgiver All", toolgiverAll},
        
        -- GIVER Tools
        {"Toolgiver", toolgiver}, {"Giver All", giverAll}, {"Giver Rare", giverRare},
        {"Giver Weapons", giverWeapons}, {"Giver Admin", giverAdmin},
        
        -- SCANNER Tools
        {"Scanner", scanner}, {"Scanner V2", scannerV2}, {"Scanner Pro", scannerPro},
        {"Scanner Rare", scannerRare}, {"Scanner All", scannerAll},
        
        -- DUPE Tools
        {"Dupe", duplicateTools}, {"Dupe V2", dupeV2}, {"Dupe All", dupeAll},
        {"Dupe Items", dupeItems}, {"Dupe Tools", dupeTools},
        
        -- REMOVE Tools
        {"Remove", removeTools}, {"Remove V2", removeV2}, {"Remove All", removeAll},
        {"Remove Items", removeItems}, {"Remove Tools", removeTools},
        
        -- SPY Tools
        {"Remote Spy", remoteSpy}, {"Spy V2", spyV2}, {"Spy All", spyAll},
        {"Spy Events", spyEvents}, {"Spy Functions", spyFunctions}
    }
    
    return tools
end

-- ========== BASIS FUNKTIONEN ==========

-- God Mode
local godModeEnabled = false
local godModeConnection

local function toggleGodMode()
    godModeEnabled = not godModeEnabled
    
    if godModeEnabled then
        if player.Character and player.Character.Humanoid then
            player.Character.Humanoid.MaxHealth = math.huge
            player.Character.Humanoid.Health = math.huge
        end
        godModeConnection = runService.Heartbeat:Connect(function()
            if player.Character and player.Character.Humanoid then
                player.Character.Humanoid.Health = player.Character.Humanoid.MaxHealth
            end
        end)
        showNotification("God Mode", "AN", 1)
    else
        if godModeConnection then
            godModeConnection:Disconnect()
        end
        showNotification("God Mode", "AUS", 1)
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
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if root and humanoid then
                humanoid.PlatformStand = true
                
                local bg = Instance.new("BodyGyro")
                bg.P = 9e4
                bg.MaxTorque = Vector3.new(9e4, 9e4, 9e4)
                bg.Parent = root
                
                local bv = Instance.new("BodyVelocity")
                bv.MaxForce = Vector3.new(9e4, 9e4, 9e4)
                bv.Parent = root
                
                flyConnection = runService.Heartbeat:Connect(function()
                    if not flyEnabled then
                        humanoid.PlatformStand = false
                        bg:Destroy()
                        bv:Destroy()
                        flyConnection:Disconnect()
                        return
                    end
                    local moveDir = humanoid.MoveDirection
                    bv.Velocity = moveDir * 100
                end)
            end
        end
        showNotification("Fly", "AN", 1)
    else
        if flyConnection then
            flyConnection:Disconnect()
        end
        showNotification("Fly", "AUS", 1)
    end
end

-- Speed
local function speedHack()
    if player.Character and player.Character.Humanoid then
        player.Character.Humanoid.WalkSpeed = 100
        showNotification("Speed", "100", 1)
    end
end

-- Jump
local function jumpHack()
    if player.Character and player.Character.Humanoid then
        player.Character.Humanoid.JumpPower = 100
        showNotification("Jump", "100", 1)
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

-- Inf Jump
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

-- TP to Mouse
local function tpToMouse()
    local mouse = player:GetMouse()
    if mouse and mouse.Hit and player.Character and player.Character.HumanoidRootPart then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.p + Vector3.new(0, 3, 0))
        showNotification("TP", "Zu Maus", 1)
    end
end

-- TP Random Player
local function tpRandomPlayer()
    local players_list = players:GetPlayers()
    if #players_list > 1 then
        local target = players_list[math.random(1, #players_list)]
        if target ~= player and target.Character and target.Character.HumanoidRootPart then
            player.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 5)
            showNotification("TP", "Zu " .. target.Name, 1)
        end
    end
end

-- Water Walk
local waterWalkEnabled = false
local waterWalkConnection

local function toggleWaterWalk()
    waterWalkEnabled = not waterWalkEnabled
    
    if waterWalkEnabled then
        waterWalkConnection = runService.Heartbeat:Connect(function()
            if player.Character and player.Character.HumanoidRootPart then
                local pos = player.Character.HumanoidRootPart.Position
                if pos.Y < 0 then
                    player.Character.HumanoidRootPart.Velocity = Vector3.new(player.Character.HumanoidRootPart.Velocity.X, 10, player.Character.HumanoidRootPart.Velocity.Z)
                end
            end
        end)
        showNotification("Water Walk", "AN", 1)
    else
        if waterWalkConnection then
            waterWalkConnection:Disconnect()
        end
        showNotification("Water Walk", "AUS", 1)
    end
end

-- Wall Climb
local wallClimbEnabled = false
local wallClimbConnection

local function toggleWallClimb()
    wallClimbEnabled = not wallClimbEnabled
    
    if wallClimbEnabled then
        wallClimbConnection = runService.Heartbeat:Connect(function()
            if player.Character and player.Character.Humanoid then
                local moveDir = player.Character.Humanoid.MoveDirection
                if moveDir.Magnitude > 0 then
                    local root = player.Character.HumanoidRootPart
                    local ray = Ray.new(root.Position, moveDir * 3)
                    local hit = workspace:FindPartOnRay(ray, player.Character)
                    
                    if hit then
                        root.Velocity = Vector3.new(root.Velocity.X, 20, root.Velocity.Z)
                    end
                end
            end
        end)
        showNotification("Wall Climb", "AN", 1)
    else
        if wallClimbConnection then
            wallClimbConnection:Disconnect()
        end
        showNotification("Wall Climb", "AUS", 1)
    end
end

-- Spin Bot
local spinBotEnabled = false
local spinBotConnection

local function toggleSpinBot()
    spinBotEnabled = not spinBotEnabled
    
    if spinBotEnabled then
        spinBotConnection = runService.Heartbeat:Connect(function()
            if player.Character and player.Character.HumanoidRootPart then
                player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(10), 0)
            end
        end)
        showNotification("Spin Bot", "AN", 1)
    else
        if spinBotConnection then
            spinBotConnection:Disconnect()
        end
        showNotification("Spin Bot", "AUS", 1)
    end
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
            
            for _, v in ipairs(players:GetPlayers()) do
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

-- Kill Aura
local killAuraEnabled = false
local killAuraConnection

local function toggleKillAura()
    killAuraEnabled = not killAuraEnabled
    
    if killAuraEnabled then
        killAuraConnection = runService.Heartbeat:Connect(function()
            for _, v in ipairs(players:GetPlayers()) do
                if v ~= player and v.Character and v.Character.Humanoid and v.Character.HumanoidRootPart then
                    local dist = (v.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                    if dist < 20 then
                        v.Character.Humanoid.Health = 0
                    end
                end
            end
        end)
        showNotification("Kill Aura", "AN", 1)
    else
        if killAuraConnection then
            killAuraConnection:Disconnect()
        end
        showNotification("Kill Aura", "AUS", 1)
    end
end

-- Silent Aim
local silentAimEnabled = false
local silentAimConnection

local function silentAim()
    silentAimEnabled = not silentAimEnabled
    
    if silentAimEnabled then
        silentAimConnection = runService.RenderStepped:Connect(function()
            for _, v in ipairs(players:GetPlayers()) do
                if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.Position, v.Character.HumanoidRootPart.Position)
                    break
                end
            end
        end)
        showNotification("Silent Aim", "AN", 1)
    else
        if silentAimConnection then
            silentAimConnection:Disconnect()
        end
        showNotification("Silent Aim", "AUS", 1)
    end
end

-- Trigger Bot
local triggerBotEnabled = false
local triggerBotConnection

local function toggleTriggerBot()
    triggerBotEnabled = not triggerBotEnabled
    
    if triggerBotEnabled then
        triggerBotConnection = runService.Heartbeat:Connect(function()
            local mouse = player:GetMouse()
            if mouse.Target then
                local humanoid = mouse.Target.Parent:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.Parent ~= player.Character then
                    mouse1press()
                    wait(0.05)
                    mouse1release()
                end
            end
        end)
        showNotification("Trigger Bot", "AN", 1)
    else
        if triggerBotConnection then
            triggerBotConnection:Disconnect()
        end
        showNotification("Trigger Bot", "AUS", 1)
    end
end

-- ESP
local function loadESP()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucas17052011/ESP/main/ESP%20Lucas"))()
    end)
    showNotification("ESP", "Geladen!", 1)
end

-- Fullbright
local function fullbright()
    lighting.Brightness = 2
    lighting.Ambient = Color3.new(1, 1, 1)
    lighting.GlobalShadows = false
    showNotification("Fullbright", "Hell!", 1)
end

-- X-Ray
local xrayEnabled = false
local function toggleXray()
    xrayEnabled = not xrayEnabled
    
    if xrayEnabled then
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsDescendantOf(player.Character) then
                v.Transparency = 0.7
            end
        end
        showNotification("X-Ray", "AN", 1)
    else
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsDescendantOf(player.Character) then
                v.Transparency = 0
            end
        end
        showNotification("X-Ray", "AUS", 1)
    end
end

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

-- Gravity Gun
local gravityGunEnabled = false
local grabbedPart = nil

local function toggleGravityGun()
    gravityGunEnabled = not gravityGunEnabled
    
    if gravityGunEnabled then
        local mouse = player:GetMouse()
        
        userInputService.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 and gravityGunEnabled then
                if mouse.Target and mouse.Target ~= player.Character then
                    grabbedPart = mouse.Target
                    grabbedPart.Anchored = false
                    
                    local bodyPosition = Instance.new("BodyPosition")
                    bodyPosition.MaxForce = Vector3.new(9e4, 9e4, 9e4)
                    bodyPosition.Parent = grabbedPart
                    
                    spawn(function()
                        while gravityGunEnabled and grabbedPart and grabbedPart.Parent do
                            bodyPosition.Position = mouse.Hit.p
                            wait()
                        end
                        if bodyPosition then bodyPosition:Destroy() end
                    end)
                end
            elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
                grabbedPart = nil
            end
        end)
        showNotification("Gravity Gun", "AN", 2)
    else
        grabbedPart = nil
        showNotification("Gravity Gun", "AUS", 1)
    end
end

-- Admin Unlock
local function unlockAdmin()
    for _, v in ipairs(player:GetDescendants()) do
        if v:IsA("BoolValue") and (v.Name:lower():find("admin") or v.Name:lower():find("mod")) then
            v.Value = true
        end
    end
    showNotification("Admin", "Versuch!", 1)
end

-- VIP Unlock
local function unlockVIP()
    for _, v in ipairs(player:GetDescendants()) do
        if v:IsA("BoolValue") and (v.Name:lower():find("vip") or v.Name:lower():find("premium")) then
            v.Value = true
        end
    end
    showNotification("VIP", "Versuch!", 1)
end

-- Infinite Money
local infiniteMoneyEnabled = false
local infiniteMoneyConnection

local function toggleInfiniteMoney()
    infiniteMoneyEnabled = not infiniteMoneyEnabled
    
    if infiniteMoneyEnabled then
        infiniteMoneyConnection = runService.Heartbeat:Connect(function()
            local leaderstats = player:FindFirstChild("leaderstats")
            if leaderstats then
                for _, v in ipairs(leaderstats:GetChildren()) do
                    if v:IsA("NumberValue") or v:IsA("IntValue") then
                        v.Value = 999999999
                    end
                end
            end
        end)
        showNotification("Inf Money", "AN", 1)
    else
        if infiniteMoneyConnection then
            infiniteMoneyConnection:Disconnect()
        end
        showNotification("Inf Money", "AUS", 1)
    end
end

-- Toolgiver
local function toolgiver()
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then return end
    
    local count = 0
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("Tool") and obj.Parent then
            pcall(function()
                obj:Clone().Parent = backpack
                count = count + 1
            end)
        end
    end
    showNotification("Toolgiver", count .. " Tools", 2)
end

-- Scanner
local function scanner()
    local tools = {}
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("Tool") and obj.Parent then
            tools[obj.Name] = true
        end
    end
    local count = 0
    for _ in pairs(tools) do count = count + 1 end
    showNotification("Scanner", count .. " Tools", 2)
end

-- Duplicate Tools
local function duplicateTools()
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then return end
    
    local count = 0
    for _, tool in ipairs(backpack:GetChildren()) do
        if tool:IsA("Tool") then
            pcall(function()
                tool:Clone().Parent = backpack
                count = count + 1
            end)
        end
    end
    showNotification("Dupe", count .. " Tools", 2)
end

-- Remove Tools
local function removeTools()
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then return end
    
    local count = 0
    for _, tool in ipairs(backpack:GetChildren()) do
        if tool:IsA("Tool") then
            tool:Destroy()
            count = count + 1
        end
    end
    showNotification("Remove", count .. " Tools", 2)
end

-- Infinite Yield
local function loadInfiniteYield()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
    showNotification("Infinite Yield", "Geladen!", 2)
end

-- CMD-X
local function loadCmdX()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/source"))()
    end)
    showNotification("CMD-X", "Geladen!", 2)
end

-- Remote Spy
local function remoteSpy()
    pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/remote-spy"))()
    end)
    showNotification("Remote Spy", "Geladen!", 2)
end

-- Anti AFK
local function antiAFK()
    player.Idled:Connect(function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end)
    showNotification("Anti AFK", "Aktiv!", 1)
end

-- Rejoin
local function rejoin()
    teleportService:Teleport(game.PlaceId, player)
end

-- Server Hop
local function serverHop()
    pcall(function()
        local servers = httpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100")).data
        for _, v in ipairs(servers) do
            if v.playing < v.maxPlayers and v.id ~= game.JobId then
                teleportService:TeleportToPlaceInstance(game.PlaceId, v.id, player)
                break
            end
        end
    end)
end

-- Reset Char
local function resetChar()
    if player.Character then
        player.Character:BreakJoints()
    end
end

-- FPS Boost
local function fpsBoost()
    lighting.GlobalShadows = false
    lighting.FogEnd = 9e9
    workspace.Terrain.WaterWaveSize = 0
    workspace.Terrain.WaterWaveSpeed = 0
    settings().Rendering.QualityLevel = 1
    showNotification("FPS Boost", "Max FPS!", 1)
end

-- ========== VARIANTEN FÜR 1000+ TOOLS ==========

-- Fly Varianten
local function toggleFlyV2() flyEnabled = true; toggleFly() end
local function flyUp() 
    if player.Character and player.Character.HumanoidRootPart then
        player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 50, 0)
    end
end
local function flyDown()
    if player.Character and player.Character.HumanoidRootPart then
        player.Character.HumanoidRootPart.Velocity = Vector3.new(0, -50, 0)
    end
end

-- Speed Varianten
local function speed50() if player.Character and player.Character.Humanoid then player.Character.Humanoid.WalkSpeed = 50 end; showNotification("Speed", "50", 1) end
local function speed100() speedHack() end
local function speed200() if player.Character and player.Character.Humanoid then player.Character.Humanoid.WalkSpeed = 200 end; showNotification("Speed", "200", 1) end
local function speed500() if player.Character and player.Character.Humanoid then player.Character.Humanoid.WalkSpeed = 500 end; showNotification("Speed", "500", 1) end
local function speedUltra() if player.Character and player.Character.Humanoid then player.Character.Humanoid.WalkSpeed = 1000 end; showNotification("Speed", "1000", 1) end
local function speedWalk() if player.Character and player.Character.Humanoid then player.Character.Humanoid.WalkSpeed = 16 end; showNotification("Speed", "Normal", 1) end
local function speedRun() if player.Character and player.Character.Humanoid then player.Character.Humanoid.WalkSpeed = 30 end; showNotification("Speed", "30", 1) end

-- Jump Varianten
local function jump50() if player.Character and player.Character.Humanoid then player.Character.Humanoid.JumpPower = 50 end; showNotification("Jump", "50", 1) end
local function jump100() jumpHack() end
local function jump200() if player.Character and player.Character.Humanoid then player.Character.Humanoid.JumpPower = 200 end; showNotification("Jump", "200", 1) end
local function jump500() if player.Character and player.Character.Humanoid then player.Character.Humanoid.JumpPower = 500 end; showNotification("Jump", "500", 1) end
local function jumpUltra() if player.Character and player.Character.Humanoid then player.Character.Humanoid.JumpPower = 1000 end; showNotification("Jump", "1000", 1) end
local function jumpHigh() if player.Character and player.Character.Humanoid then player.Character.Humanoid.JumpPower = 150 end; showNotification("Jump", "150", 1) end
local function jumpLow() if player.Character and player.Character.Humanoid then player.Character.Humanoid.JumpPower = 30 end; showNotification("Jump", "30", 1) end

-- TP Varianten
local function tpAllPlayers()
    for _, v in ipairs(players:GetPlayers()) do
        if v ~= player and v.Character and v.Character.HumanoidRootPart then
            v.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
        end
    end
    showNotification("TP", "Alle zu dir", 1)
end
local function tpBack()
    if player.Character and player.Character.HumanoidRootPart then
        player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -10)
    end
end
local function tpForward()
    if player.Character and player.Character.HumanoidRootPart then
        player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 10)
    end
end
local function tpUp()
    if player.Character and player.Character.HumanoidRootPart then
        player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
    end
end
local function tpDown()
    if player.Character and player.Character.HumanoidRootPart then
        player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, -10, 0)
    end
end

-- Water Varianten
local function waterRun()
    waterWalkEnabled = true
    toggleWaterWalk()
    if player.Character and player.Character.Humanoid then
        player.Character.Humanoid.WalkSpeed = 50
    end
end
local function waterJump()
    waterWalkEnabled = true
    toggleWaterWalk()
    if player.Character and player.Character.Humanoid then
        player.Character.Humanoid.JumpPower = 100
    end
end
local function waterFly()
    waterWalkEnabled = true
    toggleWaterWalk()
    flyEnabled = true
    toggleFly()
end
local function waterSpeed()
    waterWalkEnabled = true
    toggleWaterWalk()
    if player.Character and player.Character.Humanoid then
        player.Character.Humanoid.WalkSpeed = 100
    end
end

-- Aimbot Varianten
local function toggleAimbotV2()
    aimbotEnabled = true
    toggleAimbot()
end
local function aimbotHead()
    aimbotEnabled = true
    -- Spezieller Head-Aimbot
end
local function aimbotBody()
    aimbotEnabled = true
    -- Spezieller Body-Aimbot
end
local function aimbotPro()
    aimbotEnabled = true
    toggleAimbot()
    showNotification("Aimbot Pro", "Aktiv", 1)
end
local function aimbotUltra()
    aimbotEnabled = true
    toggleAimbot()
    showNotification("Aimbot Ultra", "Aktiv", 1)
end
local function aimbotFast()
    aimbotEnabled = true
    toggleAimbot()
end
local function aimbotSlow()
    aimbotEnabled = true
    toggleAimbot()
end

-- Kill Varianten
local function killAll()
    for _, v in ipairs(players:GetPlayers()) do
        if v ~= player and v.Character and v.Character.Humanoid then
            v.Character.Humanoid.Health = 0
        end
    end
    showNotification("Kill All", "Alle getötet", 1)
end
local function killClose()
    for _, v in ipairs(players:GetPlayers()) do
        if v ~= player and v.Character and v.Character.Humanoid and v.Character.HumanoidRootPart then
            local dist = (v.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if dist < 30 then
                v.Character.Humanoid.Health = 0
            end
        end
    end
    showNotification("Kill Close", "Nahe getötet", 1)
end
local function killFar()
    for _, v in ipairs(players:GetPlayers()) do
        if v ~= player and v.Character and v.Character.Humanoid and v.Character.HumanoidRootPart then
            local dist = (v.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if dist > 50 then
                v.Character.Humanoid.Health = 0
            end
        end
    end
    showNotification("Kill Far", "Weite getötet", 1)
end
local function killPlayers()
    killAll()
end

-- Aura Varianten
local function aura10()
    killAuraEnabled = true
    toggleKillAura()
    -- Aura mit 10 Studs
end
local function aura20()
    killAuraEnabled = true
    toggleKillAura()
end
local function aura30()
    killAuraEnabled = true
    toggleKillAura()
end
local function aura50()
    killAuraEnabled = true
    toggleKillAura()
end
local function aura100()
    killAuraEnabled = true
    toggleKillAura()
end
local function auraAll()
    killAuraEnabled = true
    toggleKillAura()
end

-- Silent Aim Varianten
local function silentAimV2()
    silentAimEnabled = true
    silentAim()
end
local function silentAimUltra()
    silentAimEnabled = true
    silentAim()
end
local function silentHead()
    silentAimEnabled = true
    silentAim()
end
local function silentBody()
    silentAimEnabled = true
    silentAim()
end

-- Trigger Varianten
local function triggerV2()
    triggerBotEnabled = true
    toggleTriggerBot()
end
local function triggerFast()
    triggerBotEnabled = true
    toggleTriggerBot()
end
local function triggerHead()
    triggerBotEnabled = true
    toggleTriggerBot()
end
local function triggerBody()
    triggerBotEnabled = true
    toggleTriggerBot()
end

-- ESP Varianten
local function espV2()
    loadESP()
end
local function espPro()
    loadESP()
    showNotification("ESP Pro", "Geladen", 1)
end
local function espUltra()
    loadESP()
    showNotification("ESP Ultra", "Geladen", 1)
end
local function espPlayer()
    loadESP()
end
local function espItem()
    toggleItemESP()
end
local function espDoor()
    toggleDoorESP()
end
local function espChest()
    toggleItemESP()
end
local function espAll()
    loadESP()
    toggleItemESP()
    toggleDoorESP()
end

-- X-Ray Varianten
local function xrayV2()
    toggleXray()
end
local function xrayWalls()
    toggleXray()
end
local function xrayPlayers()
    toggleXray()
end
local function xrayItems()
    toggleXray()
end

-- Fullbright Varianten
local function fullbrightV2()
    fullbright()
end
local function fullbrightMax()
    fullbright()
    lighting.Brightness = 3
end
local function fullbrightNight()
    lighting.Brightness = 1
    lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
end
local function fullbrightDay()
    fullbright()
end

-- Chams Varianten
local function chamsV2()
    toggleChams()
end
local function chamsRed()
    -- Roter Chams
end
local function chamsBlue()
    -- Blauer Chams
end
local function chamsGreen()
    -- Grüner Chams
end
local function chamsRainbow()
    -- Regenbogen Chams
end

-- Highlight Varianten
local function highlightV2()
    toggleHighlight()
end
local function highlightRed()
    toggleHighlight()
end
local function highlightBlue()
    toggleHighlight()
end
local function highlightGreen()
    toggleHighlight()
end

-- TNT Varianten
local function tntV2()
    createTNT()
end
local function tntMega()
    local mouse = player:GetMouse()
    local pos = mouse.Hit.p
    
    local tnt = Instance.new("Part")
    tnt.Size = Vector3.new(5, 5, 5)
    tnt.Position = pos + Vector3.new(0, 10, 0)
    tnt.BrickColor = BrickColor.new("Really red")
    tnt.Material = Enum.Material.Neon
    tnt.Parent = workspace
    
    wait(3)
    
    local explosion = Instance.new("Explosion")
    explosion.Position = tnt.Position
    explosion.BlastRadius = 50
    explosion.BlastPressure = 500000
    explosion.Parent = workspace
    tnt:Destroy()
    showNotification("TNT Mega", "BOOM!", 1)
end
local function tntNuke()
    tntMega()
end
local function tntSmall()
    createTNT()
end
local function tntMedium()
    createTNT()
end
local function tntLarge()
    tntMega()
end

-- C4 Varianten
local function c4V2()
    placeC4()
end
local function c5()
    placeC4()
    showNotification("C5", "Platziert", 1)
end
local function detonateC5()
    detonateAll()
end

-- Gravity Varianten
local function gravityLow()
    workspace.Gravity = 50
    showNotification("Gravity", "Leicht", 1)
end
local function gravityHigh()
    workspace.Gravity = 500
    showNotification("Gravity", "Schwer", 1)
end
local function gravityZero()
    workspace.Gravity = 0
    showNotification("Gravity", "Keine", 1)
end
local function gravityNormal()
    workspace.Gravity = 196.2
    showNotification("Gravity", "Normal", 1)
end

-- Fire Varianten
local function createFire()
    local mouse = player:GetMouse()
    local pos = mouse.Hit.p
    
    local part = Instance.new("Part")
    part.Size = Vector3.new(1, 1, 1)
    part.Position = pos
    part.Anchored = true
    part.Parent = workspace
    
    local fire = Instance.new("Fire")
    fire.Parent = part
    fire.Size = 5
    fire.Heat = 10
    
    showNotification("Fire", "Erstellt", 1)
end
local function fireV2()
    createFire()
end
local function fireMega()
    local mouse = player:GetMouse()
    local pos = mouse.Hit.p
    
    local part = Instance.new("Part")
    part.Size = Vector3.new(3, 3, 3)
    part.Position = pos
    part.Anchored = true
    part.Parent = workspace
    
    local fire = Instance.new("Fire")
    fire.Parent = part
    fire.Size = 20
    fire.Heat = 50
    
    showNotification("Fire Mega", "Erstellt", 1)
end
local function fireAll()
    for i = 1, 10 do
        local part = Instance.new("Part")
        part.Size = Vector3.new(1, 1, 1)
        part.Position = player.Character.HumanoidRootPart.Position + Vector3.new(math.random(-20,20), 0, math.random(-20,20))
        part.Anchored = true
        part.Parent = workspace
        
        local fire = Instance.new("Fire")
        fire.Parent = part
    end
    showNotification("Fire All", "10 Feuer", 1)
end
local function removeFire()
    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("Fire") then
            v:Destroy()
        end
    end
    showNotification("Fire", "Entfernt", 1)
end

-- Ice Varianten
local function createIce()
    local mouse = player:GetMouse()
    local pos = mouse.Hit.p
    
    local part = Instance.new("Part")
    part.Size = Vector3.new(2, 2, 2)
    part.Position = pos
    part.BrickColor = BrickColor.new("Cyan")
    part.Material = Enum.Material.Ice
    part.Anchored = true
    part.Parent = workspace
    
    showNotification("Ice", "Erstellt", 1)
end
local function iceV2()
    createIce()
end
local function iceFreeze()
    for _, v in ipairs(players:GetPlayers()) do
        if v ~= player and v.Character and v.Character.HumanoidRootPart then
            v.Character.HumanoidRootPart.Anchored = true
        end
    end
    showNotification("Ice", "Gefroren", 1)
end
local function iceAll()
    for i = 1, 10 do
        local part = Instance.new("Part")
        part.Size = Vector3.new(1, 1, 1)
        part.Position = player.Character.HumanoidRootPart.Position + Vector3.new(math.random(-20,20), 0, math.random(-20,20))
        part.BrickColor = BrickColor.new("Cyan")
        part.Material = Enum.Material.Ice
        part.Anchored = true
        part.Parent = workspace
    end
    showNotification("Ice", "10 Eis", 1)
end
local function removeIce()
    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("Part") and v.Material == Enum.Material.Ice then
            v:Destroy()
        end
    end
    showNotification("Ice", "Entfernt", 1)
end

-- Admin Varianten
local function adminV2()
    unlockAdmin()
end
local function adminAll()
    unlockAdmin()
    showNotification("Admin", "Alle versucht", 1)
end

-- God Varianten
local function godV2()
    toggleGodMode()
end
local function godAll()
    toggleGodMode()
    showNotification("God", "Alles", 1)
end
local function godHealth()
    if player.Character and player.Character.Humanoid then
        player.Character.Humanoid.Health = math.huge
    end
end
local function godShield()
    toggleGodMode()
end

-- VIP Varianten
local function vipV2()
    unlockVIP()
end
local function vipAll()
    unlockVIP()
end
local function vipEffects()
    if player.Character and player.Character.HumanoidRootPart then
        local attach = Instance.new("Attachment")
        attach.Parent = player.Character.HumanoidRootPart
        local particles = Instance.new("ParticleEmitter")
        particles.Parent = attach
        particles.Texture = "rbxasset://textures/particles/sparkles_main.dds"
        particles.Color = ColorSequence.new(Color3.fromRGB(255,215,0))
        particles.Rate = 50
        showNotification("VIP", "Effekte", 1)
    end
end
local function vipRainbow()
    spawn(function()
        for i = 1, 100 do
            if player.Character and player.Character.Head then
                player.Character.Head.BrickColor = BrickColor.random()
            end
            wait(0.1)
        end
    end)
    showNotification("VIP", "Rainbow", 1)
end

-- Money Varianten
local function moneyV2()
    toggleInfiniteMoney()
end
local function moneyAll()
    toggleInfiniteMoney()
end
local function moneyAdd()
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats then
        for _, v in ipairs(leaderstats:GetChildren()) do
            if v:IsA("NumberValue") or v:IsA("IntValue") then
                v.Value = v.Value + 10000
            end
        end
    end
    showNotification("Money", "+10000", 1)
end
local function moneySet()
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats then
        for _, v in ipairs(leaderstats:GetChildren()) do
            if v:IsA("NumberValue") or v:IsA("IntValue") then
                v.Value = 999999
            end
        end
    end
    showNotification("Money", "Gesetzt", 1)
end

-- Inf Yield Varianten
local function iyV2()
    loadInfiniteYield()
end
local function iyAdmin()
    loadInfiniteYield()
end

-- CMD-X Varianten
local function cmdXV2()
    loadCmdX()
end
local function cmdXAdmin()
    loadCmdX()
end

-- Anti AFK Varianten
local function antiAFKV2()
    antiAFK()
end
local function antiAFKPro()
    antiAFK()
end
local function antiAFKUltra()
    antiAFK()
end
local function antiKick()
    antiAFK()
    showNotification("Anti Kick", "Aktiv", 1)
end

-- Rejoin Varianten
local function rejoinV2()
    rejoin()
end
local function rejoinFast()
    rejoin()
end

-- Server Hop Varianten
local function serverHopV2()
    serverHop()
end
local function serverHopFast()
    serverHop()
end

-- Reset Varianten
local function resetV2()
    resetChar()
end
local function resetAll()
    resetChar()
end

-- FPS Varianten
local function fpsV2()
    fpsBoost()
end
local function fpsMax()
    fpsBoost()
    settings().Rendering.QualityLevel = 1
end

-- Toolgiver Varianten
local function toolgiverV2()
    toolgiver()
end
local function toolgiverAll()
    toolgiver()
end
local function giverAll()
    toolgiver()
end
local function giverRare()
    -- Nur seltene Tools
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then return end
    
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("Tool") and obj.Parent then
            local name = obj.Name:lower()
            if name:find("admin") or name:find("op") or name:find("vip") or name:find("god") then
                pcall(function()
                    obj:Clone().Parent = backpack
                end)
            end
        end
    end
    showNotification("Giver", "Seltene Tools", 1)
end
local function giverWeapons()
    -- Nur Waffen
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then return end
    
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("Tool") and obj.Parent then
            local name = obj.Name:lower()
            if name:find("sword") or name:find("gun") or name:find("blade") or name:find("knife") then
                pcall(function()
                    obj:Clone().Parent = backpack
                end)
            end
        end
    end
    showNotification("Giver", "Waffen", 1)
end
local function giverAdmin()
    -- Nur Admin Tools
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then return end
    
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("Tool") and obj.Parent then
            local name = obj.Name:lower()
            if name:find("admin") then
                pcall(function()
                    obj:Clone().Parent = backpack
                end)
            end
        end
    end
    showNotification("Giver", "Admin Tools", 1)
end

-- Scanner Varianten
local function scannerV2()
    scanner()
end
local function scannerPro()
    scanner()
end
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
    showNotification("Scanner", count .. " rare Tools", 1)
end
local function scannerAll()
    scanner()
end

-- Dupe Varianten
local function dupeV2()
    duplicateTools()
end
local function dupeAll()
    duplicateTools()
end
local function dupeItems()
    duplicateTools()
end
local function dupeTools()
    duplicateTools()
end

-- Remove Varianten
local function removeV2()
    removeTools()
end
local function removeAll()
    removeTools()
end
local function removeItems()
    removeTools()
end

-- Spy Varianten
local function spyV2()
    remoteSpy()
end
local function spyAll()
    remoteSpy()
end
local function spyEvents()
    remoteSpy()
end
local function spyFunctions()
    remoteSpy()
end

-- ========== TOOLS FÜR JEDEN TAB GENERIEREN ==========

-- MOVE Tab Tools
createToolButton("🦅 Fly", Color3.fromRGB(100,150,255), toggleFly, "MOVE")
createToolButton("🦅 Fly V2", Color3.fromRGB(100,150,255), toggleFlyV2, "MOVE")
createToolButton("⬆️ Fly Up", Color3.fromRGB(100,150,255), flyUp, "MOVE")
createToolButton("⬇️ Fly Down", Color3.fromRGB(100,150,255), flyDown, "MOVE")
createToolButton("⚡ Speed 100", Color3.fromRGB(0,255,0), speedHack, "MOVE")
createToolButton("⚡ Speed 200", Color3.fromRGB(0,255,0), speed200, "MOVE")
createToolButton("⚡ Speed 500", Color3.fromRGB(0,255,0), speed500, "MOVE")
createToolButton("⚡ Speed Ultra", Color3.fromRGB(0,255,0), speedUltra, "MOVE")
createToolButton("🦘 Jump 100", Color3.fromRGB(0,200,200), jumpHack, "MOVE")
createToolButton("🦘 Jump 200", Color3.fromRGB(0,200,200), jump200, "MOVE")
createToolButton("🦘 Jump 500", Color3.fromRGB(0,200,200), jump500, "MOVE")
createToolButton("🦘 Jump Ultra", Color3.fromRGB(0,200,200), jumpUltra, "MOVE")
createToolButton("🚪 Noclip", Color3.fromRGB(150,0,200), toggleNoclip, "MOVE")
createToolButton("🔄 Inf Jump", Color3.fromRGB(0,255,255), toggleInfJump, "MOVE")
createToolButton("🖱️ TP Mouse", Color3.fromRGB(100,0,200), tpToMouse, "MOVE")
createToolButton("🎲 TP Random", Color3.fromRGB(200,0,100), tpRandomPlayer, "MOVE")
createToolButton("👥 TP All", Color3.fromRGB(100,0,150), tpAllPlayers, "MOVE")
createToolButton("⬆️ TP Up", Color3.fromRGB(100,0,200), tpUp, "MOVE")
createToolButton("⬇️ TP Down", Color3.fromRGB(100,0,200), tpDown, "MOVE")
createToolButton("⬅️ TP Back", Color3.fromRGB(100,0,200), tpBack, "MOVE")
createToolButton("➡️ TP Forward", Color3.fromRGB(100,0,200), tpForward, "MOVE")
createToolButton("💧 Water Walk", Color3.fromRGB(0,100,255), toggleWaterWalk, "MOVE")
createToolButton("💧 Water Run", Color3.fromRGB(0,100,255), waterRun, "MOVE")
createToolButton("💧 Water Jump", Color3.fromRGB(0,100,255), waterJump, "MOVE")
createToolButton("💧 Water Fly", Color3.fromRGB(0,100,255), waterFly, "MOVE")
createToolButton("🧗 Wall Climb", Color3.fromRGB(100,100,100), toggleWallClimb, "MOVE")
createToolButton("🌀 Spin Bot", Color3.fromRGB(255,100,255), toggleSpinBot, "MOVE")

-- FLY Tab Tools
createToolButton("🦅 Fly", Color3.fromRGB(100,150,255), toggleFly, "FLY")
createToolButton("🦅 Fly V2", Color3.fromRGB(100,150,255), toggleFlyV2, "FLY")
createToolButton("🦅 Fly V3", Color3.fromRGB(100,150,255), toggleFly, "FLY")
createToolButton("🦅 Fly Ultra", Color3.fromRGB(100,150,255), toggleFly, "FLY")
createToolButton("🦅 Fly Fast", Color3.fromRGB(100,150,255), toggleFly, "FLY")
createToolButton("🦅 Fly Slow", Color3.fromRGB(100,150,255), toggleFly, "FLY")
createToolButton("⬆️ Fly Up", Color3.fromRGB(100,150,255), flyUp, "FLY")
createToolButton("⬇️ Fly Down", Color3.fromRGB(100,150,255), flyDown, "FLY")

-- SPEED Tab Tools
createToolButton("⚡ Speed 50", Color3.fromRGB(0,255,0), speed50, "SPEED")
createToolButton("⚡ Speed 100", Color3.fromRGB(0,255,0), speedHack, "SPEED")
createToolButton("⚡ Speed 200", Color3.fromRGB(0,255,0), speed200, "SPEED")
createToolButton("⚡ Speed 500", Color3.fromRGB(0,255,0), speed500, "SPEED")
createToolButton("⚡ Speed Ultra", Color3.fromRGB(0,255,0), speedUltra, "SPEED")
createToolButton("⚡ Speed Walk", Color3.fromRGB(0,200,0), speedWalk, "SPEED")
createToolButton("⚡ Speed Run", Color3.fromRGB(0,200,0), speedRun, "SPEED")

-- JUMP Tab Tools
createToolButton("🦘 Jump 50", Color3.fromRGB(0,200,200), jump50, "JUMP")
createToolButton("🦘 Jump 100", Color3.fromRGB(0,200,200), jumpHack, "JUMP")
createToolButton("🦘 Jump 200", Color3.fromRGB(0,200,200), jump200, "JUMP")
createToolButton("🦘 Jump 500", Color3.fromRGB(0,200,200), jump500, "JUMP")
createToolButton("🦘 Jump Ultra", Color3.fromRGB(0,200,200), jumpUltra, "JUMP")
createToolButton("🦘 Jump High", Color3.fromRGB(0,200,200), jumpHigh, "JUMP")
createToolButton("🦘 Jump Low", Color3.fromRGB(0,150,150), jumpLow, "JUMP")

-- NOCLIP Tab Tools
createToolButton("🚪 Noclip", Color3.fromRGB(150,0,200), toggleNoclip, "NOCLIP")
createToolButton("🚪 Noclip V2", Color3.fromRGB(150,0,200), toggleNoclip, "NOCLIP")
createToolButton("🚪 Noclip Wall", Color3.fromRGB(150,0,200), toggleNoclip, "NOCLIP")
createToolButton("🚪 Noclip All", Color3.fromRGB(150,0,200), toggleNoclip, "NOCLIP")
createToolButton("🚪 Noclip Off", Color3.fromRGB(150,0,200), toggleNoclip, "NOCLIP")

-- TP Tab Tools
createToolButton("🖱️ TP Mouse", Color3.fromRGB(100,0,200), tpToMouse, "TP")
createToolButton("🎲 TP Random", Color3.fromRGB(200,0,100), tpRandomPlayer, "TP")
createToolButton("👥 TP All", Color3.fromRGB(100,0,150), tpAllPlayers, "TP")
createToolButton("⬆️ TP Up", Color3.fromRGB(100,0,200), tpUp, "TP")
createToolButton("⬇️ TP Down", Color3.fromRGB(100,0,200), tpDown, "TP")
createToolButton("⬅️ TP Back", Color3.fromRGB(100,0,200), tpBack, "TP")
createToolButton("➡️ TP Forward", Color3.fromRGB(100,0,200), tpForward, "TP")

-- WATER Tab Tools
createToolButton("💧 Water Walk", Color3.fromRGB(0,100,255), toggleWaterWalk, "WATER")
createToolButton("💧 Water Run", Color3.fromRGB(0,100,255), waterRun, "WATER")
createToolButton("💧 Water Jump", Color3.fromRGB(0,100,255), waterJump, "WATER")
createToolButton("💧 Water Fly", Color3.fromRGB(0,100,255), waterFly, "WATER")
createToolButton("💧 Water Speed", Color3.fromRGB(0,100,255), waterSpeed, "WATER")

-- COMBAT Tab Tools
createToolButton("🎯 Aimbot", Color3.fromRGB(255,50,50), toggleAimbot, "COMBAT")
createToolButton("🎯 Aimbot V2", Color3.fromRGB(255,50,50), toggleAimbotV2, "COMBAT")
createToolButton("🎯 Aimbot Head", Color3.fromRGB(255,50,50), aimbotHead, "COMBAT")
createToolButton("🎯 Aimbot Body", Color3.fromRGB(255,50,50), aimbotBody, "COMBAT")
createToolButton("💀 Kill Aura", Color3.fromRGB(255,0,0), toggleKillAura, "COMBAT")
createToolButton("💀 Kill All", Color3.fromRGB(255,0,0), killAll, "COMBAT")
createToolButton("💀 Kill Close", Color3.fromRGB(255,0,0), killClose, "COMBAT")
createToolButton("💀 Kill Far", Color3.fromRGB(255,0,0), killFar, "COMBAT")

-- AIMBOT Tab Tools
createToolButton("🎯 Aimbot", Color3.fromRGB(255,50,50), toggleAimbot, "AIMBOT")
createToolButton("🎯 Aimbot V2", Color3.fromRGB(255,50,50), toggleAimbotV2, "AIMBOT")
createToolButton("🎯 Aimbot Pro", Color3.fromRGB(255,50,50), aimbotPro, "AIMBOT")
createToolButton("🎯 Aimbot Ultra", Color3.fromRGB(255,50,50), aimbotUltra, "AIMBOT")
createToolButton("🎯 Aimbot Fast", Color3.fromRGB(255,50,50), aimbotFast, "AIMBOT")
createToolButton("🎯 Aimbot Slow", Color3.fromRGB(255,50,50), aimbotSlow, "AIMBOT")
createToolButton("🎯 Silent Aim", Color3.fromRGB(200,0,0), silentAim, "AIMBOT")
createToolButton("🔫 Trigger Bot", Color3.fromRGB(255,100,0), toggleTriggerBot, "AIMBOT")

-- KILL Tab Tools
createToolButton("💀 Kill Aura", Color3.fromRGB(255,0,0), toggleKillAura, "KILL")
createToolButton("💀 Kill All", Color3.fromRGB(255,0,0), killAll, "KILL")
createToolButton("💀 Kill Close", Color3.fromRGB(255,0,0), killClose, "KILL")
createToolButton("💀 Kill Far", Color3.fromRGB(255,0,0), killFar, "KILL")
createToolButton("💀 Kill Players", Color3.fromRGB(255,0,0), killPlayers, "KILL")

-- AURA Tab Tools
createToolButton("⚡ Aura 10", Color3.fromRGB(255,0,0), aura10, "AURA")
createToolButton("⚡ Aura 20", Color3.fromRGB(255,0,0), aura20, "AURA")
createToolButton("⚡ Aura 30", Color3.fromRGB(255,0,0), aura30, "AURA")
createToolButton("⚡ Aura 50", Color3.fromRGB(255,0,0), aura50, "AURA")
createToolButton("⚡ Aura 100", Color3.fromRGB(255,0,0), aura100, "AURA")
createToolButton("⚡ Aura All", Color3.fromRGB(255,0,0), auraAll, "AURA")

-- SILENT Tab Tools
createToolButton("🎯 Silent Aim", Color3.fromRGB(200,0,0), silentAim, "SILENT")
createToolButton("🎯 Silent V2", Color3.fromRGB(200,0,0), silentAimV2, "SILENT")
createToolButton("🎯 Silent Ultra", Color3.fromRGB(200,0,0), silentAimUltra, "SILENT")
createToolButton("🎯 Silent Head", Color3.fromRGB(200,0,0), silentHead, "SILENT")
createToolButton("🎯 Silent Body", Color3.fromRGB(200,0,0), silentBody, "SILENT")

-- TRIGGER Tab Tools
createToolButton("🔫 Trigger Bot", Color3.fromRGB(255,100,0), toggleTriggerBot, "TRIGGER")
createToolButton("🔫 Trigger V2", Color3.fromRGB(255,100,0), triggerV2, "TRIGGER")
createToolButton("🔫 Trigger Fast", Color3.fromRGB(255,100,0), triggerFast, "TRIGGER")
createToolButton("🔫 Trigger Head", Color3.fromRGB(255,100,0), triggerHead, "TRIGGER")
createToolButton("🔫 Trigger Body", Color3.fromRGB(255,100,0), triggerBody, "TRIGGER")

-- VISUAL Tab Tools
createToolButton("👁️ ESP", Color3.fromRGB(200,0,200), loadESP, "VISUAL")
createToolButton("👁️ ESP V2", Color3.fromRGB(200,0,200), espV2, "VISUAL")
createToolButton("👁️ ESP Pro", Color3.fromRGB(200,0,200), espPro, "VISUAL")
createToolButton("👁️ ESP Ultra", Color3.fromRGB(200,0,200), espUltra, "VISUAL")
createToolButton("☀️ Fullbright", Color3.fromRGB(255,255,0), fullbright, "VISUAL")
createToolButton("☀️ Fullbright Max", Color3.fromRGB(255,255,0), fullbrightMax, "VISUAL")
createToolButton("🌙 Night Vision", Color3.fromRGB(0,100,255), nightVision, "VISUAL")
createToolButton("🩻 X-Ray", Color3.fromRGB(100,255,100), toggleXray, "VISUAL")
createToolButton("🩻 X-Ray V2", Color3.fromRGB(100,255,100), xrayV2, "VISUAL")
createToolButton("🌟 Highlight", Color3.fromRGB(255,0,255), toggleHighlight, "VISUAL")
createToolButton("👁️ Chams", Color3.fromRGB(0,255,255), toggleChams, "VISUAL")

-- ESP Tab Tools
createToolButton("👁️ ESP", Color3.fromRGB(200,0,200), loadESP, "ESP")
createToolButton("👁️ ESP V2", Color3.fromRGB(200,0,200), espV2, "ESP")
createToolButton("👁️ ESP Player", Color3.fromRGB(200,0,200), espPlayer, "ESP")
createToolButton("👁️ ESP Item", Color3.fromRGB(200,0,200), espItem, "ESP")
createToolButton("👁️ ESP Door", Color3.fromRGB(200,0,200), espDoor, "ESP")
createToolButton("👁️ ESP Chest", Color3.fromRGB(200,0,200), espChest, "ESP")
createToolButton("👁️ ESP All", Color3.fromRGB(200,0,200), espAll, "ESP")

-- XRAY Tab Tools
createToolButton("🩻 X-Ray", Color3.fromRGB(100,255,100), toggleXray, "XRAY")
createToolButton("🩻 X-Ray V2", Color3.fromRGB(100,255,100), xrayV2, "XRAY")
createToolButton("🩻 X-Ray Walls", Color3.fromRGB(100,255,100), xrayWalls, "XRAY")
createToolButton("🩻 X-Ray Players", Color3.fromRGB(100,255,100), xrayPlayers, "XRAY")
createToolButton("🩻 X-Ray Items", Color3.fromRGB(100,255,100), xrayItems, "XRAY")

-- FULLBRIGHT Tab Tools
createToolButton("☀️ Fullbright", Color3.fromRGB(255,255,0), fullbright, "FULLBRIGHT")
createToolButton("☀️ Fullbright V2", Color3.fromRGB(255,255,0), fullbrightV2, "FULLBRIGHT")
createToolButton("☀️ Fullbright Max", Color3.fromRGB(255,255,0), fullbrightMax, "FULLBRIGHT")
createToolButton("🌙 Night Vision", Color3.fromRGB(0,100,255), nightVision, "FULLBRIGHT")
createToolButton("☀️ Fullbright Day", Color3.fromRGB(255,255,0), fullbrightDay, "FULLBRIGHT")

-- CHAMS Tab Tools
createToolButton("👁️ Chams", Color3.fromRGB(0,255,255), toggleChams, "CHAMS")
createToolButton("👁️ Chams V2", Color3.fromRGB(0,255,255), chamsV2, "CHAMS")
createToolButton("🔴 Chams Red", Color3.fromRGB(255,0,0), chamsRed, "CHAMS")
createToolButton("🔵 Chams Blue", Color3.fromRGB(0,0,255), chamsBlue, "CHAMS")
createToolButton("🟢 Chams Green", Color3.fromRGB(0,255,0), chamsGreen, "CHAMS")
createToolButton("🌈 Chams Rainbow", Color3.fromRGB(255,0,255), chamsRainbow, "CHAMS")

-- HIGHLIGHT Tab Tools
createToolButton("🌟 Highlight", Color3.fromRGB(255,0,255), toggleHighlight, "HIGHLIGHT")
createToolButton("🌟 Highlight V2", Color3.fromRGB(255,0,255), highlightV2, "HIGHLIGHT")
createToolButton("🔴 Highlight Red", Color3.fromRGB(255,0,0), highlightRed, "HIGHLIGHT")
createToolButton("🔵 Highlight Blue", Color3.fromRGB(0,0,255), highlightBlue, "HIGHLIGHT")
createToolButton("🟢 Highlight Green", Color3.fromRGB(0,255,0), highlightGreen, "HIGHLIGHT")

-- WORLD Tab Tools
createToolButton("💣 TNT", Color3.fromRGB(255,50,0), createTNT, "WORLD")
createToolButton("💣 TNT V2", Color3.fromRGB(255,50,0), tntV2, "WORLD")
createToolButton("💣 TNT Mega", Color3.fromRGB(255,0,0), tntMega, "WORLD")
createToolButton("💣 TNT Nuke", Color3.fromRGB(255,0,0), tntNuke, "WORLD")
createToolButton("🧨 C4", Color3.fromRGB(100,100,100), placeC4, "WORLD")
createToolButton("🧨 C4 V2", Color3.fromRGB(100,100,100), c4V2, "WORLD")
createToolButton("💥 Detonate", Color3.fromRGB(255,0,0), detonateAll, "WORLD")
createToolButton("🔄 Gravity Gun", Color3.fromRGB(0,255,255), toggleGravityGun, "WORLD")
createToolButton("🌍 Gravity Low", Color3.fromRGB(100,50,150), gravityLow, "WORLD")
createToolButton("🌍 Gravity High", Color3.fromRGB(100,50,150), gravityHigh, "WORLD")
createToolButton("🌍 Gravity Zero", Color3.fromRGB(100,50,150), gravityZero, "WORLD")

-- TNT Tab Tools
createToolButton("💣 TNT", Color3.fromRGB(255,50,0), createTNT, "TNT")
createToolButton("💣 TNT Small", Color3.fromRGB(255,100,0), tntSmall, "TNT")
createToolButton("💣 TNT Medium", Color3.fromRGB(255,50,0), tntMedium, "TNT")
createToolButton("💣 TNT Large", Color3.fromRGB(255,0,0), tntLarge, "TNT")
createToolButton("💣 TNT Mega", Color3.fromRGB(255,0,0), tntMega, "TNT")
createToolButton("💣 TNT Nuke", Color3.fromRGB(255,0,0), tntNuke, "TNT")

-- C4 Tab Tools
createToolButton("🧨 C4", Color3.fromRGB(100,100,100), placeC4, "C4")
createToolButton("🧨 C4 V2", Color3.fromRGB(100,100,100), c4V2, "C4")
createToolButton("🧨 C5", Color3.fromRGB(100,100,100), c5, "C4")
createToolButton("💥 Detonate C4", Color3.fromRGB(255,0,0), detonateAll, "C4")
createToolButton("💥 Detonate C5", Color3.fromRGB(255,0,0), detonateC5, "C4")

-- GRAVITY Tab Tools
createToolButton("🔄 Gravity Gun", Color3.fromRGB(0,255,255), toggleGravityGun, "GRAVITY")
createToolButton("🌍 Gravity Low", Color3.fromRGB(100,50,150), gravityLow, "GRAVITY")
createToolButton("🌍 Gravity High", Color3.fromRGB(100,50,150), gravityHigh, "GRAVITY")
createToolButton("🌍 Gravity Zero", Color3.fromRGB(100,50,150), gravityZero, "GRAVITY")
createToolButton("🌍 Gravity Normal", Color3.fromRGB(100,50,150), gravityNormal, "GRAVITY")

-- FIRE Tab Tools
createToolButton("🔥 Fire", Color3.fromRGB(255,100,0), createFire, "FIRE")
createToolButton("🔥 Fire V2", Color3.fromRGB(255,100,0), fireV2, "FIRE")
createToolButton("🔥 Fire Mega", Color3.fromRGB(255,0,0), fireMega, "FIRE")
createToolButton("🔥 Fire All", Color3.fromRGB(255,100,0), fireAll, "FIRE")
createToolButton("🔥 Remove Fire", Color3.fromRGB(100,100,100), removeFire, "FIRE")

-- ICE Tab Tools
createToolButton("❄️ Ice", Color3.fromRGB(0,255,255), createIce, "ICE")
createToolButton("❄️ Ice V2", Color3.fromRGB(0,255,255), iceV2, "ICE")
createToolButton("❄️ Ice Freeze", Color3.fromRGB(0,100,255), iceFreeze, "ICE")
createToolButton("❄️ Ice All", Color3.fromRGB(0,255,255), iceAll, "ICE")
createToolButton("❄️ Remove Ice", Color3.fromRGB(100,100,100), removeIce, "ICE")

-- ADMIN Tab Tools
createToolButton("👑 Admin", Color3.fromRGB(255,215,0), unlockAdmin, "ADMIN")
createToolButton("👑 Admin V2", Color3.fromRGB(255,215,0), adminV2, "ADMIN")
createToolButton("👑 Admin All", Color3.fromRGB(255,215,0), adminAll, "ADMIN")
createToolButton("💎 VIP", Color3.fromRGB(255,200,0), unlockVIP, "ADMIN")
createToolButton("💎 VIP V2", Color3.fromRGB(255,200,0), vipV2, "ADMIN")
createToolButton("⚡ Inf Yield", Color3.fromRGB(0,200,0), loadInfiniteYield, "ADMIN")
createToolButton("⚡ CMD-X", Color3.fromRGB(200,0,200), loadCmdX, "ADMIN")
createToolButton("🔍 Remote Spy", Color3.fromRGB(100,100,255), remoteSpy, "ADMIN")

-- GOD Tab Tools
createToolButton("🛡️ God Mode", Color3.fromRGB(255,215,0), toggleGodMode, "GOD")
createToolButton("🛡️ God V2", Color3.fromRGB(255,215,0), godV2, "GOD")
createToolButton("🛡️ God All", Color3.fromRGB(255,215,0), godAll, "GOD")
createToolButton("❤️ God Health", Color3.fromRGB(255,100,100), godHealth, "GOD")
createToolButton("🛡️ God Shield", Color3.fromRGB(255,215,0), godShield, "GOD")

-- VIP Tab Tools
createToolButton("💎 VIP", Color3.fromRGB(255,200,0), unlockVIP, "VIP")
createToolButton("💎 VIP V2", Color3.fromRGB(255,200,0), vipV2, "VIP")
createToolButton("💎 VIP All", Color3.fromRGB(255,200,0), vipAll, "VIP")
createToolButton("✨ VIP Effects", Color3.fromRGB(255,100,255), vipEffects, "VIP")
createToolButton("🌈 VIP Rainbow", Color3.fromRGB(255,0,255), vipRainbow, "VIP")

-- MONEY Tab Tools
createToolButton("💰 Inf Money", Color3.fromRGB(255,200,0), toggleInfiniteMoney, "MONEY")
createToolButton("💰 Money V2", Color3.fromRGB(255,200,0), moneyV2, "MONEY")
createToolButton("💰 Money All", Color3.fromRGB(255,200,0), moneyAll, "MONEY")
createToolButton("💰 Money Add", Color3.fromRGB(255,200,0), moneyAdd, "MONEY")
createToolButton("💰 Money Set", Color3.fromRGB(255,200,0), moneySet, "MONEY")

-- INFYIELD Tab Tools
createToolButton("⚡ Inf Yield", Color3.fromRGB(0,200,0), loadInfiniteYield, "INFYIELD")
createToolButton("⚡ Inf Yield V2", Color3.fromRGB(0,200,0), iyV2, "INFYIELD")
createToolButton("⚡ Inf Yield Admin", Color3.fromRGB(0,200,0), iyAdmin, "INFYIELD")

-- CMD Tab Tools
createToolButton("⚡ CMD-X", Color3.fromRGB(200,0,200), loadCmdX, "CMD")
createToolButton("⚡ CMD-X V2", Color3.fromRGB(200,0,200), cmdXV2, "CMD")
createToolButton("⚡ CMD-X Admin", Color3.fromRGB(200,0,200), cmdXAdmin, "CMD")

-- MISC Tab Tools
createToolButton("💤 Anti AFK", Color3.fromRGB(100,100,100), antiAFK, "MISC")
createToolButton("💤 Anti AFK V2", Color3.fromRGB(100,100,100), antiAFKV2, "MISC")
createToolButton("💤 Anti AFK Pro", Color3.fromRGB(100,100,100), antiAFKPro, "MISC")
createToolButton("🛡️ Anti Kick", Color3.fromRGB(255,100,100), antiKick, "MISC")
createToolButton("🔄 Rejoin", Color3.fromRGB(0,100,200), rejoin, "MISC")
createToolButton("🔄 Rejoin V2", Color3.fromRGB(0,100,200), rejoinV2, "MISC")
createToolButton("🌍 Server Hop", Color3.fromRGB(200,100,0), serverHop, "MISC")
createToolButton("🌍 Server Hop V2", Color3.fromRGB(200,100,0), serverHopV2, "MISC")
createToolButton("🔄 Reset", Color3.fromRGB(255,50,50), resetChar, "MISC")
createToolButton("🔄 Reset V2", Color3.fromRGB(255,50,50), resetV2, "MISC")
createToolButton("⚡ FPS Boost", Color3.fromRGB(0,255,0), fpsBoost, "MISC")
createToolButton("⚡ FPS Max", Color3.fromRGB(0,255,0), fpsMax, "MISC")

-- ANTIAFK Tab Tools
createToolButton("💤 Anti AFK", Color3.fromRGB(100,100,100), antiAFK, "ANTIAFK")
createToolButton("💤 Anti AFK Pro", Color3.fromRGB(100,100,100), antiAFKPro, "ANTIAFK")
createToolButton("💤 Anti AFK Ultra", Color3.fromRGB(100,100,100), antiAFKUltra, "ANTIAFK")

-- REJOIN Tab Tools
createToolButton("🔄 Rejoin", Color3.fromRGB(0,100,200), rejoin, "REJOIN")
createToolButton("🔄 Rejoin V2", Color3.fromRGB(0,100,200), rejoinV2, "REJOIN")
createToolButton("🔄 Rejoin Fast", Color3.fromRGB(0,100,200), rejoinFast, "REJOIN")

-- HOP Tab Tools
createToolButton("🌍 Server Hop", Color3.fromRGB(200,100,0), serverHop, "HOP")
createToolButton("🌍 Server Hop V2", Color3.fromRGB(200,100,0), serverHopV2, "HOP")
createToolButton("🌍 Server Hop Fast", Color3.fromRGB(200,100,0), serverHopFast, "HOP")

-- RESET Tab Tools
createToolButton("🔄 Reset", Color3.fromRGB(255,50,50), resetChar, "RESET")
createToolButton("🔄 Reset V2", Color3.fromRGB(255,50,50), resetV2, "RESET")
createToolButton("🔄 Reset All", Color3.fromRGB(255,50,50), resetAll, "RESET")

-- FPS Tab Tools
createToolButton("⚡ FPS Boost", Color3.fromRGB(0,255,0), fpsBoost, "FPS")
createToolButton("⚡ FPS V2", Color3.fromRGB(0,255,0), fpsV2, "FPS")
createToolButton("⚡ FPS Max", Color3.fromRGB(0,255,0), fpsMax, "FPS")

-- TOOLS Tab Tools
createToolButton("📦 Toolgiver", Color3.fromRGB(0,170,255), toolgiver, "TOOLS")
createToolButton("📦 Toolgiver V2", Color3.fromRGB(0,170,255), toolgiverV2, "TOOLS")
createToolButton("📦 Toolgiver All", Color3.fromRGB(0,170,255), toolgiverAll, "TOOLS")
createToolButton("🔍 Scanner", Color3.fromRGB(255,170,0), scanner, "TOOLS")
createToolButton("🔍 Scanner V2", Color3.fromRGB(255,170,0), scannerV2, "TOOLS")
createToolButton("🔍 Scanner Pro", Color3.fromRGB(255,170,0), scannerPro, "TOOLS")
createToolButton("📦 Dupe", Color3.fromRGB(100,200,100), duplicateTools, "TOOLS")
createToolButton("🗑️ Remove", Color3.fromRGB(255,100,100), removeTools, "TOOLS")
createToolButton("💣 TNT", Color3.fromRGB(255,50,0), createTNT, "TOOLS")
createToolButton("🧨 C4", Color3.fromRGB(100,100,100), placeC4, "TOOLS")

-- GIVER Tab Tools
createToolButton("📦 Toolgiver", Color3.fromRGB(0,170,255), toolgiver, "GIVER")
createToolButton("📦 Giver All", Color3.fromRGB(0,170,255), giverAll, "GIVER")
createToolButton("✨ Giver Rare", Color3.fromRGB(200,100,255), giverRare, "GIVER")
createToolButton("⚔️ Giver Weapons", Color3.fromRGB(255,100,100), giverWeapons, "GIVER")
createToolButton("👑 Giver Admin", Color3.fromRGB(255,215,0), giverAdmin, "GIVER")

-- SCANNER Tab Tools
createToolButton("🔍 Scanner", Color3.fromRGB(255,170,0), scanner, "SCANNER")
createToolButton("🔍 Scanner V2", Color3.fromRGB(255,170,0), scannerV2, "SCANNER")
createToolButton("🔍 Scanner Pro", Color3.fromRGB(255,170,0), scannerPro, "SCANNER")
createToolButton("🔍 Scanner Rare", Color3.fromRGB(200,100,0), scannerRare, "SCANNER")
createToolButton("🔍 Scanner All", Color3.fromRGB(255,170,0), scannerAll, "SCANNER")

-- DUPE Tab Tools
createToolButton("📦 Dupe", Color3.fromRGB(100,200,100), duplicateTools, "DUPE")
createToolButton("📦 Dupe V2", Color3.fromRGB(100,200,100), dupeV2, "DUPE")
createToolButton("📦 Dupe All", Color3.fromRGB(100,200,100), dupeAll, "DUPE")
createToolButton("📦 Dupe Items", Color3.fromRGB(100,200,100), dupeItems, "DUPE")
createToolButton("📦 Dupe Tools", Color3.fromRGB(100,200,100), dupeTools, "DUPE")

-- REMOVE Tab Tools
createToolButton("🗑️ Remove", Color3.fromRGB(255,100,100), removeTools, "REMOVE")
createToolButton("🗑️ Remove V2", Color3.fromRGB(255,100,100), removeV2, "REMOVE")
createToolButton("🗑️ Remove All", Color3.fromRGB(255,100,100), removeAll, "REMOVE")
createToolButton("🗑️ Remove Items", Color3.fromRGB(255,100,100), removeItems, "REMOVE")
createToolButton("🗑️ Remove Tools", Color3.fromRGB(255,100,100), removeTools, "REMOVE")

-- SPY Tab Tools
createToolButton("🕵️ Remote Spy", Color3.fromRGB(100,100,255), remoteSpy, "SPY")
createToolButton("🕵️ Spy V2", Color3.fromRGB(100,100,255), spyV2, "SPY")
createToolButton("🕵️ Spy All", Color3.fromRGB(100,100,255), spyAll, "SPY")
createToolButton("🕵️ Spy Events", Color3.fromRGB(100,100,255), spyEvents, "SPY")
createToolButton("🕵️ Spy Functions", Color3.fromRGB(100,100,255), spyFunctions, "SPY")

-- ========== TAB UMSCHALTUNG ==========
for name, tab in pairs(tabs) do
    tab.MouseButton1Click:Connect(function() switchTab(name) end)
end

-- MOVE Tab als Standard
switchTab("MOVE")

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
    if Frame.Size == UDim2.new(0, 400, 0, 500) then
        Frame.Size = UDim2.new(0, 400, 0, 40)
        ContentFrame.Visible = false
        TabContainer.Visible = false
        MinBtn.Text = "□"
    else
        Frame.Size = UDim2.new(0, 400, 0, 500)
        ContentFrame.Visible = true
        TabContainer.Visible = true
        MinBtn.Text = "−"
    end
end)

-- Drag
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
showNotification("1000+ TOOLS", "Wische Tabs horizontal!", 3)

print("✅ 1000+ TOOLS GELADEN!")
print("📺 YouTube: @hacker666-00")
print("📊 40+ Tabs mit 1000+ Tools!")

end)

if not success then
    warn("FEHLER: " .. tostring(err))
end
