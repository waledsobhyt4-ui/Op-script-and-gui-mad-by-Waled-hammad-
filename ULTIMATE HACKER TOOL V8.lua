--[[
    ULTIMATE HACKER TOOL V8 - KOMPLETT REPARIERT
    Made by Waled-hammad
    YouTube: @hacker666-00
    ALLES FUNKTIONIERT - FEHLERFREI!
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

-- GUI erstellen
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "WaledUltimateHackerV8"

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

-- ========== FPS ANZEIGE (KLEINER GEMACHT) ==========
local FPSFrame = Instance.new("Frame")
FPSFrame.Parent = ScreenGui
FPSFrame.Size = UDim2.new(0, 90, 0, 30) -- KLEINER!
FPSFrame.Position = UDim2.new(1, -100, 0, 5)
FPSFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FPSFrame.BackgroundTransparency = 0.3
FPSFrame.BorderSizePixel = 0
FPSFrame.ZIndex = 10000
FPSFrame.Visible = true

local FPSCorner = Instance.new("UICorner")
FPSCorner.CornerRadius = UDim.new(0, 8)
FPSCorner.Parent = FPSFrame

local FPSText = Instance.new("TextLabel")
FPSText.Parent = FPSFrame
FPSText.Size = UDim2.new(1, 0, 1, 0)
FPSText.BackgroundTransparency = 1
FPSText.Text = "FPS: 60"
FPSText.TextColor3 = Color3.fromRGB(0, 255, 0)
FPSText.Font = Enum.Font.GothamBold
FPSText.TextSize = 16
FPSText.ZIndex = 10001
FPSText.Visible = true

-- FPS aktualisieren
spawn(function()
    while FPSFrame and FPSFrame.Parent do
        local fps = math.floor(1 / runService.RenderStepped:Wait())
        FPSText.Text = "FPS: " .. fps
        if fps >= 60 then
            FPSText.TextColor3 = Color3.fromRGB(0, 255, 0) -- Grün
        elseif fps >= 30 then
            FPSText.TextColor3 = Color3.fromRGB(255, 255, 0) -- Gelb
        else
            FPSText.TextColor3 = Color3.fromRGB(255, 0, 0) -- Rot
        end
        wait(0.5)
    end
end)

-- ========== NOTIFICATION SYSTEM (FIXED) ==========
local function showNotification(title, text, duration)
    duration = duration or 3
    local notif = Instance.new("ScreenGui")
    notif.Parent = ScreenGui
    notif.IgnoreGuiInset = true
    notif.DisplayOrder = 999999
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 70)
    frame.Position = UDim2.new(1, -310, 1, -80)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    frame.BackgroundTransparency = 0.1
    frame.Parent = notif
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame
    
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, -10, 0, 25)
    t.Position = UDim2.new(0, 5, 0, 5)
    t.BackgroundTransparency = 1
    t.Text = title
    t.TextColor3 = Color3.fromRGB(0, 200, 255)
    t.Font = Enum.Font.GothamBold
    t.TextSize = 18
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.Parent = frame
    
    local tx = Instance.new("TextLabel")
    tx.Size = UDim2.new(1, -10, 0, 25)
    tx.Position = UDim2.new(0, 5, 0, 30)
    tx.BackgroundTransparency = 1
    tx.Text = text
    tx.TextColor3 = Color3.new(1,1,1)
    tx.Font = Enum.Font.Gotham
    tx.TextSize = 16
    tx.TextXAlignment = Enum.TextXAlignment.Left
    tx.Parent = frame
    
    -- Rote Warnung für Fehler
    if title == "FEHLER" then
        frame.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        t.TextColor3 = Color3.new(1,1,1)
    end
    
    task.wait(duration)
    notif:Destroy()
end

-- ========== WILLKOMMENSFRAME (KLEINER GEMACHT) ==========
local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Parent = ScreenGui
WelcomeFrame.Size = UDim2.new(0, 380, 0, 300) -- KLEINER!
WelcomeFrame.Position = UDim2.new(0.5, -190, 0.5, -150)
WelcomeFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
WelcomeFrame.BackgroundTransparency = 0
WelcomeFrame.BorderSizePixel = 0
WelcomeFrame.Visible = true
WelcomeFrame.ZIndex = 10000
WelcomeFrame.Active = true
WelcomeFrame.Draggable = true

local WelcomeCorner = Instance.new("UICorner")
WelcomeCorner.CornerRadius = UDim.new(0, 15)
WelcomeCorner.Parent = WelcomeFrame

-- YouTube Button
local YTButton = Instance.new("TextButton")
YTButton.Parent = WelcomeFrame
YTButton.Size = UDim2.new(0.9, 0, 0, 45)
YTButton.Position = UDim2.new(0.05, 0, 0.05, 0)
YTButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
YTButton.Text = "📺 YOUTUBE: @hacker666-00"
YTButton.TextColor3 = Color3.new(1,1,1)
YTButton.Font = Enum.Font.GothamBold
YTButton.TextSize = 18
YTButton.BorderSizePixel = 0
YTButton.Visible = true

local YTCorner = Instance.new("UICorner")
YTCorner.CornerRadius = UDim.new(0, 8)
YTCorner.Parent = YTButton

YTButton.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00?si=9nPd1Y9rHP7Yz3vz")
    showNotification("YouTube", "Link kopiert! Besuche meinen Kanal!", 2)
end)

-- Titel
local WelcomeTitle = Instance.new("TextLabel")
WelcomeTitle.Parent = WelcomeFrame
WelcomeTitle.Size = UDim2.new(1, 0, 0, 40)
WelcomeTitle.Position = UDim2.new(0, 0, 0, 60)
WelcomeTitle.BackgroundTransparency = 1
WelcomeTitle.Text = "⚡ GERÄT AUSWÄHLEN ⚡"
WelcomeTitle.TextColor3 = Color3.fromRGB(0, 200, 255)
WelcomeTitle.Font = Enum.Font.GothamBold
WelcomeTitle.TextSize = 22
WelcomeTitle.Visible = true

-- PC Button
local PCButton = Instance.new("TextButton")
PCButton.Parent = WelcomeFrame
PCButton.Size = UDim2.new(0.8, 0, 0, 50)
PCButton.Position = UDim2.new(0.1, 0, 0.3, 0)
PCButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
PCButton.Text = "💻 PC MODUS"
PCButton.TextColor3 = Color3.new(1,1,1)
PCButton.Font = Enum.Font.GothamBold
PCButton.TextSize = 20
PCButton.BorderSizePixel = 0
PCButton.Visible = true

local PCCorner = Instance.new("UICorner")
PCCorner.CornerRadius = UDim.new(0, 12)
PCCorner.Parent = PCButton

-- Mobile Button
local MobileButton = Instance.new("TextButton")
MobileButton.Parent = WelcomeFrame
MobileButton.Size = UDim2.new(0.8, 0, 0, 50)
MobileButton.Position = UDim2.new(0.1, 0, 0.5, 0)
MobileButton.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
MobileButton.Text = "📱 MOBILE MODUS"
MobileButton.TextColor3 = Color3.new(1,1,1)
MobileButton.Font = Enum.Font.GothamBold
MobileButton.TextSize = 20
MobileButton.BorderSizePixel = 0
MobileButton.Visible = true

local MobileCorner = Instance.new("UICorner")
MobileCorner.CornerRadius = UDim.new(0, 12)
MobileCorner.Parent = MobileButton

-- Timer ein/aus Button
local TimerToggle = Instance.new("TextButton")
TimerToggle.Parent = WelcomeFrame
TimerToggle.Size = UDim2.new(0.8, 0, 0, 40)
TimerToggle.Position = UDim2.new(0.1, 0, 0.7, 0)
TimerToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
TimerToggle.Text = "⏱️ TIMER: AN"
TimerToggle.TextColor3 = Color3.new(1,1,1)
TimerToggle.Font = Enum.Font.GothamBold
TimerToggle.TextSize = 18
TimerToggle.BorderSizePixel = 0
TimerToggle.Visible = true

local TimerCorner = Instance.new("UICorner")
TimerCorner.CornerRadius = UDim.new(0, 10)
TimerCorner.Parent = TimerToggle

local timerEnabled = true
TimerToggle.MouseButton1Click:Connect(function()
    timerEnabled = not timerEnabled
    TimerToggle.Text = timerEnabled and "⏱️ TIMER: AN" or "⏱️ TIMER: AUS"
    showNotification("Timer", timerEnabled and "Timer AN" or "Timer AUS", 1)
end)

local WelcomeCredit = Instance.new("TextLabel")
WelcomeCredit.Parent = WelcomeFrame
WelcomeCredit.Size = UDim2.new(1, 0, 0, 30)
WelcomeCredit.Position = UDim2.new(0, 0, 1, -30)
WelcomeCredit.BackgroundTransparency = 1
WelcomeCredit.Text = "Made by Waled-hammad • YouTube: @hacker666-00"
WelcomeCredit.TextColor3 = Color3.fromRGB(150, 150, 150)
WelcomeCredit.Font = Enum.Font.Gotham
WelcomeCredit.TextSize = 12
WelcomeCredit.Visible = true

-- ========== FLOATING BUTTON ==========
local OpenButton = Instance.new("TextButton")
OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0, 70, 0, 70)
OpenButton.Position = UDim2.new(0, 10, 0.5, -35)
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

-- ========== MAIN FRAME (KLEINER GEMACHT) ==========
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 550, 0, 700) -- KLEINER!
Frame.Position = UDim2.new(0.5, -275, 0.5, -350)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
Frame.Visible = false
Frame.Draggable = true
Frame.Active = true
Frame.BackgroundTransparency = 0
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 15)
FrameCorner.Parent = Frame

-- Shadow
local Shadow = Instance.new("ImageLabel")
Shadow.Size = UDim2.new(1, 40, 1, 40)
Shadow.Position = UDim2.new(0, -20, 0, -20)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://6014261993"
Shadow.ImageColor3 = Color3.new(0,0,0)
Shadow.ImageTransparency = 0.6
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10,10,118,118)
Shadow.Parent = Frame
Shadow.ZIndex = -1
Shadow.Visible = true

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Parent = Frame
TitleBar.Size = UDim2.new(1, 0, 0, 60)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TitleBar.BorderSizePixel = 0
TitleBar.Visible = true

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 15)
TitleCorner.Parent = TitleBar

-- YouTube Button im Titel
local TitleYT = Instance.new("TextButton")
TitleYT.Parent = TitleBar
TitleYT.Size = UDim2.new(0, 35, 0, 35)
TitleYT.Position = UDim2.new(0, 15, 0, 12.5)
TitleYT.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TitleYT.Text = "▶"
TitleYT.TextColor3 = Color3.new(1,1,1)
TitleYT.Font = Enum.Font.GothamBold
TitleYT.TextSize = 22
TitleYT.BorderSizePixel = 0
TitleYT.Visible = true

local TitleYTCorner = Instance.new("UICorner")
TitleYTCorner.CornerRadius = UDim.new(0, 8)
TitleYTCorner.Parent = TitleYT

TitleYT.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00?si=9nPd1Y9rHP7Yz3vz")
    showNotification("YouTube", "Kanal-Link kopiert!", 2)
end)

local TitleText = Instance.new("TextLabel")
TitleText.Parent = TitleBar
TitleText.Size = UDim2.new(1, -150, 1, 0)
TitleText.Position = UDim2.new(0, 60, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "⚡ HACKER TOOL V8 ⚡"
TitleText.TextColor3 = Color3.fromRGB(0, 200, 255)
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 22
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Visible = true

-- Color Picker Button
local ColorBtn = Instance.new("TextButton")
ColorBtn.Parent = TitleBar
ColorBtn.Size = UDim2.new(0, 35, 0, 35)
ColorBtn.Position = UDim2.new(1, -115, 0, 12.5)
ColorBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
ColorBtn.Text = "🎨"
ColorBtn.TextColor3 = Color3.new(1,1,1)
ColorBtn.Font = Enum.Font.GothamBold
ColorBtn.TextSize = 22
ColorBtn.BorderSizePixel = 0
ColorBtn.Visible = true

local ColorCorner = Instance.new("UICorner")
ColorCorner.CornerRadius = UDim.new(0, 8)
ColorCorner.Parent = ColorBtn

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Parent = TitleBar
MinBtn.Size = UDim2.new(0, 40, 0, 40)
MinBtn.Position = UDim2.new(1, -70, 0, 10)
MinBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 255)
MinBtn.Text = "−"
MinBtn.TextColor3 = Color3.new(1,1,1)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 30
MinBtn.BorderSizePixel = 0
MinBtn.Visible = true

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 10)
MinCorner.Parent = MinBtn

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.Size = UDim2.new(0, 40, 0, 40)
CloseBtn.Position = UDim2.new(1, -25, 0, 10)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 25
CloseBtn.BorderSizePixel = 0
CloseBtn.Visible = true

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 10)
CloseCorner.Parent = CloseBtn

-- Tabs
local TabFrame = Instance.new("Frame")
TabFrame.Parent = Frame
TabFrame.Size = UDim2.new(1, -20, 0, 60)
TabFrame.Position = UDim2.new(0, 10, 0, 70)
TabFrame.BackgroundTransparency = 1
TabFrame.Visible = true

local tabs = {}
local activeTab = "CHEATS"

local function createTab(name, pos)
    local tab = Instance.new("TextButton")
    tab.Parent = TabFrame
    tab.Size = UDim2.new(0, 100, 0, 45)
    tab.Position = UDim2.new(0, pos, 0, 7.5)
    tab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    tab.Text = name
    tab.TextColor3 = Color3.new(1,1,1)
    tab.Font = Enum.Font.GothamBold
    tab.TextSize = 18
    tab.BorderSizePixel = 0
    tab.Visible = true

    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 10)
    tabCorner.Parent = tab

    tabs[name] = tab
    return tab
end

local tabCheats = createTab("⚡ CHEATS", 0)
local tabAdmin = createTab("👑 ADMIN", 110)
local tabVIP = createTab("💎 VIP", 220)
local tabTools = createTab("🔧 TOOLS", 330)
local tabAI = createTab("🤖 AI", 440)

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = Frame
ContentFrame.Size = UDim2.new(1, -20, 1, -180)
ContentFrame.Position = UDim2.new(0, 10, 0, 140)
ContentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
ContentFrame.BackgroundTransparency = 0.2
ContentFrame.Visible = true

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 12)
ContentCorner.Parent = ContentFrame

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Parent = ContentFrame
ScrollingFrame.Size = UDim2.new(1, -20, 1, -20)
ScrollingFrame.Position = UDim2.new(0, 10, 0, 10)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.ScrollBarThickness = 6
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 200, 255)
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.Visible = true

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 6)
ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ListLayout.Parent = ScrollingFrame

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 5)
Padding.PaddingBottom = UDim.new(0, 5)
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
            child.Visible = (tabName == "🤖 AI")
        end
    end
end

-- PC/Mobile Auswahl
PCButton.MouseButton1Click:Connect(function()
    WelcomeFrame.Visible = false
    OpenButton.Visible = true
    for _, child in ipairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.Size = UDim2.new(0.95, 0, 0, 50)
        end
    end
    showNotification("PC MODUS", "GUI ist bereit! Klicke auf ⚡", 2)
end)

MobileButton.MouseButton1Click:Connect(function()
    WelcomeFrame.Visible = false
    OpenButton.Visible = true
    for _, child in ipairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.Size = UDim2.new(0.95, 0, 0, 65)
        end
    end
    showNotification("MOBILE MODUS", "GUI ist bereit! Tippe auf ⚡", 2)
end)

-- Button Creator
local function createButton(text, color, callback, tabName)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.95, 0, 0, 50)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.AutoButtonColor = false
    btn.BorderSizePixel = 0
    btn.Parent = ScrollingFrame
    btn.Visible = false
    btn:SetAttribute("Tab", tabName)
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 10)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    
    return btn
end

-- ========== BELIEBTE TOOLS ==========

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
    showNotification("TNT", "BOOM! Explosion erstellt!", 2)
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
    if found then
        showNotification("VIP", "VIP freigeschaltet!", 2)
    else
        showNotification("VIP", "Keine VIP gefunden", 2)
    end
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
    if found then
        showNotification("Admin", "Admin freigeschaltet!", 2)
    else
        showNotification("Admin", "Keine Admin gefunden", 2)
    end
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
        showNotification("Money", "∞ GELD AN", 2)
    else
        showNotification("Money", "Geld Modus AUS", 2)
    end
end

-- Toolgiver
local function giveTools()
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

-- Scanner
local function scanTools()
    local tools = {}
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("Tool") and obj.Parent then
            tools[obj.Name] = true
        end
    end
    local count = 0
    for _ in pairs(tools) do count = count + 1 end
    showNotification("Scanner", count .. " verschiedene Tools gefunden!", 2)
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
        showNotification("Speed", "Speed = 100", 1)
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
    showNotification("ESP", "Geladen!", 2)
end

-- God Mode
local function godMode()
    if player.Character and player.Character.Humanoid then
        player.Character.Humanoid.MaxHealth = math.huge
        player.Character.Humanoid.Health = math.huge
        showNotification("God Mode", "AKTIVIERT!", 2)
    end
end

-- Rejoin
local function rejoin()
    showNotification("Rejoin", "Verbindung wird neu aufgebaut...", 2)
    teleportService:Teleport(game.PlaceId, player)
end

-- Server Hop
local function serverHop()
    showNotification("Server Hop", "Suche neuen Server...", 2)
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

-- ========== NEUE BELIEBTE TOOLS ==========

-- Infinite Yield (beliebtestes Admin Tool)
local function loadInfiniteYield()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
    showNotification("Infinite Yield", "Admin Tool geladen!", 2)
end

-- CMD-X (beliebtes Admin Tool)
local function loadCmdX()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/source"))()
    end)
    showNotification("CMD-X", "Admin Tool geladen!", 2)
end

-- F3X (beliebtes Build Tool)
local function loadF3X()
    pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/f3x"))()
    end)
    showNotification("F3X", "Build Tool geladen!", 2)
end

-- Chat Bypass (beliebt)
local function chatBypass()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/ChatBypass/main/Bypass"))()
    end)
    showNotification("Chat Bypass", "Geladen!", 2)
end

-- Silent Aim (beliebt)
local silentAimEnabled = false
local function toggleSilentAim()
    silentAimEnabled = not silentAimEnabled
    
    if silentAimEnabled then
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/Silent%20Aim%20Universal.lua"))()
        end)
        showNotification("Silent Aim", "AN", 1)
    else
        showNotification("Silent Aim", "AUS", 1)
    end
end

-- Walkspeed Modifier
local function setWalkspeed()
    if player.Character and player.Character.Humanoid then
        local speed = player.Character.Humanoid.WalkSpeed
        player.Character.Humanoid.WalkSpeed = speed + 50
        showNotification("Speed", "+50 Speed", 1)
    end
end

-- Jumppower Modifier
local function setJumppower()
    if player.Character and player.Character.Humanoid then
        local jump = player.Character.Humanoid.JumpPower
        player.Character.Humanoid.JumpPower = jump + 50
        showNotification("Jump", "+50 Jump", 1)
    end
end

-- Anti AFK
local function antiAFK()
    player.Idled:Connect(function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end)
    showNotification("Anti AFK", "Aktiviert!", 2)
end

-- Brightness Modifier
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

-- Time Changer
local timeIndex = 0
local times = {12, 14, 18, 0, 6}
local function changeTime()
    timeIndex = timeIndex % #times + 1
    lighting.ClockTime = times[timeIndex]
    showNotification("Time", "Zeit: " .. times[timeIndex] .. ":00", 1)
end

-- Fog Modifier
local fogEnabled = false
local function toggleFog()
    fogEnabled = not fogEnabled
    
    if fogEnabled then
        lighting.FogEnd = 100
        showNotification("Fog", "AN", 1)
    else
        lighting.FogEnd = 100000
        showNotification("Fog", "AUS", 1)
    end
end

-- Gravity Modifier
local gravityEnabled = false
local function toggleGravity()
    gravityEnabled = not gravityEnabled
    
    if gravityEnabled then
        workspace.Gravity = 50
        showNotification("Gravity", "Leichter", 1)
    else
        workspace.Gravity = 196.2
        showNotification("Gravity", "Normal", 1)
    end
end

-- No Fall Damage
local function noFallDamage()
    if player.Character and player.Character.Humanoid then
        player.Character.Humanoid.UseJumpPower = false
        player.Character.Humanoid.MaxHealth = math.huge
        showNotification("No Fall", "Fall Damage OFF", 2)
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
        showNotification("Click TP", "AN - Klicke zum Teleportieren", 2)
    else
        showNotification("Click TP", "AUS", 1)
    end
end

-- AI Assistant
local function AIAssistant(query)
    local q = query:lower()
    if q:find("tnt") then
        createTNT()
        return "✅ TNT erstellt!"
    elseif q:find("aimbot") then
        toggleAimbot()
        return "✅ Aimbot umgeschaltet!"
    elseif q:find("vip") then
        unlockVIP()
        return "✅ VIP freigeschaltet!"
    elseif q:find("admin") then
        unlockAdmin()
        return "✅ Admin freigeschaltet!"
    elseif q:find("money") or q:find("geld") then
        toggleMoney()
        return "✅ Geld Modus umgeschaltet!"
    elseif q:find("fly") then
        toggleFly()
        return "✅ Fly umgeschaltet!"
    elseif q:find("speed") then
        speedHack()
        return "✅ Speed erhöht!"
    elseif q:find("noclip") then
        toggleNoclip()
        return "✅ Noclip umgeschaltet!"
    elseif q:find("jump") then
        toggleInfJump()
        return "✅ Inf Jump umgeschaltet!"
    elseif q:find("infinite") or q:find("yield") then
        loadInfiniteYield()
        return "✅ Infinite Yield geladen!"
    elseif q:find("esp") then
        toggleESP()
        return "✅ ESP geladen!"
    elseif q:find("god") then
        godMode()
        return "✅ God Mode aktiviert!"
    else
        return "❓ Unbekannt. Versuche: TNT, Aimbot, VIP, Admin, Money, Fly, Speed, Noclip, Jump, Infinite, ESP, God"
    end
end

-- ========== BUTTONS ERSTELLEN ==========

-- CHEATS Tab
createButton("🎯 AIMBOT", Color3.fromRGB(255, 50, 50), toggleAimbot, "⚡ CHEATS")
createButton("🎯 SILENT AIM", Color3.fromRGB(200, 50, 50), toggleSilentAim, "⚡ CHEATS")
createButton("💰 UNENDLICH GELD", Color3.fromRGB(255, 200, 0), toggleMoney, "⚡ CHEATS")
createButton("💣 TNT", Color3.fromRGB(255, 100, 0), createTNT, "⚡ CHEATS")
createButton("🦅 FLY", Color3.fromRGB(100, 100, 255), toggleFly, "⚡ CHEATS")
createButton("🚪 NOCLIP", Color3.fromRGB(150, 0, 150), toggleNoclip, "⚡ CHEATS")
createButton("⚡ SPEED HACK", Color3.fromRGB(0, 255, 0), speedHack, "⚡ CHEATS")
createButton("⚡ +50 SPEED", Color3.fromRGB(0, 200, 0), setWalkspeed, "⚡ CHEATS")
createButton("🦘 INF JUMP", Color3.fromRGB(0, 200, 200), toggleInfJump, "⚡ CHEATS")
createButton("🦘 +50 JUMP", Color3.fromRGB(0, 150, 150), setJumppower, "⚡ CHEATS")
createButton("👁️ ESP", Color3.fromRGB(200, 0, 200), toggleESP, "⚡ CHEATS")
createButton("🛡️ GOD MODE", Color3.fromRGB(255, 0, 0), godMode, "⚡ CHEATS")
createButton("🛡️ NO FALL DAMAGE", Color3.fromRGB(255, 100, 100), noFallDamage, "⚡ CHEATS")
createButton("👆 CLICK TP", Color3.fromRGB(100, 0, 100), toggleClickTP, "⚡ CHEATS")

-- ADMIN Tab
createButton("👑 ADMIN UNLOCK", Color3.fromRGB(255, 215, 0), unlockAdmin, "👑 ADMIN")
createButton("💎 VIP UNLOCK", Color3.fromRGB(255, 200, 0), unlockVIP, "👑 ADMIN")
createButton("📋 TOOLGIVER", Color3.fromRGB(0, 170, 255), giveTools, "👑 ADMIN")
createButton("🔍 SCANNER", Color3.fromRGB(255, 170, 0), scanTools, "👑 ADMIN")
createButton("⚡ INFINITE YIELD", Color3.fromRGB(0, 200, 0), loadInfiniteYield, "👑 ADMIN")
createButton("⚡ CMD-X", Color3.fromRGB(200, 0, 200), loadCmdX, "👑 ADMIN")
createButton("🔨 F3X", Color3.fromRGB(0, 100, 200), loadF3X, "👑 ADMIN")
createButton("💬 CHAT BYPASS", Color3.fromRGB(100, 100, 100), chatBypass, "👑 ADMIN")
createButton("💤 ANTI AFK", Color3.fromRGB(100, 100, 100), antiAFK, "👑 ADMIN")

-- VIP Tab
createButton("💎 VIP UNLOCK", Color3.fromRGB(255, 215, 0), unlockVIP, "💎 VIP")
createButton("✨ VIP EFFECTS", Color3.fromRGB(255, 100, 255), function()
    local char = player.Character
    if char and char.HumanoidRootPart then
        local attach = Instance.new("Attachment")
        attach.Parent = char.HumanoidRootPart
        local particles = Instance.new("ParticleEmitter")
        particles.Parent = attach
        particles.Texture = "rbxasset://textures/particles/sparkles_main.dds"
        particles.Color = ColorSequence.new(Color3.fromRGB(255, 215, 0))
        particles.Rate = 50
        particles.Lifetime = NumberRange.new(2)
        showNotification("VIP Effects", "Aktiviert!", 2)
    end
end, "💎 VIP")
createButton("🌈 RAINBOW NAME", Color3.fromRGB(255, 0, 255), function()
    spawn(function()
        while wait(0.1) do
            pcall(function() 
                if player.Character and player.Character.Head then
                    player.Character.Head.BrickColor = BrickColor.random()
                end
            end)
        end
    end)
    showNotification("Rainbow", "Aktiviert!", 2)
end, "💎 VIP")
createButton("☀️ BRIGHTNESS", Color3.fromRGB(255, 255, 0), toggleBrightness, "💎 VIP")
createButton("⏰ TIME CHANGER", Color3.fromRGB(100, 100, 255), changeTime, "💎 VIP")
createButton("🌫️ FOG TOGGLE", Color3.fromRGB(150, 150, 150), toggleFog, "💎 VIP")
createButton("🌍 GRAVITY", Color3.fromRGB(100, 50, 150), toggleGravity, "💎 VIP")

-- TOOLS Tab
createButton("🎯 AIMBOT", Color3.fromRGB(255, 50, 50), toggleAimbot, "🔧 TOOLS")
createButton("🎯 SILENT AIM", Color3.fromRGB(200, 50, 50), toggleSilentAim, "🔧 TOOLS")
createButton("💣 TNT", Color3.fromRGB(255, 100, 0), createTNT, "🔧 TOOLS")
createButton("💰 MONEY", Color3.fromRGB(255, 200, 0), toggleMoney, "🔧 TOOLS")
createButton("🦅 FLY", Color3.fromRGB(100, 100, 255), toggleFly, "🔧 TOOLS")
createButton("🚪 NOCLIP", Color3.fromRGB(150, 0, 150), toggleNoclip, "🔧 TOOLS")
createButton("⚡ SPEED", Color3.fromRGB(0, 255, 0), speedHack, "🔧 TOOLS")
createButton("🦘 INF JUMP", Color3.fromRGB(0, 200, 200), toggleInfJump, "🔧 TOOLS")
createButton("👁️ ESP", Color3.fromRGB(200, 0, 200), toggleESP, "🔧 TOOLS")
createButton("🛡️ GOD MODE", Color3.fromRGB(255, 0, 0), godMode, "🔧 TOOLS")
createButton("🔄 REJOIN", Color3.fromRGB(100, 100, 100), rejoin, "🔧 TOOLS")
createButton("🌍 SERVER HOP", Color3.fromRGB(50, 50, 150), serverHop, "🔧 TOOLS")
createButton("🔄 RESET", Color3.fromRGB(150, 50, 50), resetChar, "🔧 TOOLS")
createButton("🎨 FARBE", Color3.fromRGB(200, 100, 200), changeColor, "🔧 TOOLS")

-- AI Tab
local AIFrame = Instance.new("Frame")
AIFrame.Name = "AIFrame"
AIFrame.Parent = ScrollingFrame
AIFrame.Size = UDim2.new(0.95, 0, 0, 280)
AIFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
AIFrame.BackgroundTransparency = 0
AIFrame.Visible = false
AIFrame:SetAttribute("Tab", "🤖 AI")

local AICorner = Instance.new("UICorner")
AICorner.CornerRadius = UDim.new(0, 12)
AICorner.Parent = AIFrame

local AITitle = Instance.new("TextLabel")
AITitle.Parent = AIFrame
AITitle.Size = UDim2.new(1, 0, 0, 40)
AITitle.Position = UDim2.new(0, 0, 0, 10)
AITitle.BackgroundTransparency = 1
AITitle.Text = "🤖 AI ASSISTANT"
AITitle.TextColor3 = Color3.fromRGB(0, 200, 255)
AITitle.Font = Enum.Font.GothamBold
AITitle.TextSize = 22

local AIInput = Instance.new("TextBox")
AIInput.Parent = AIFrame
AIInput.Size = UDim2.new(1, -20, 0, 60)
AIInput.Position = UDim2.new(0, 10, 0, 60)
AIInput.PlaceholderText = "Befehl (TNT, Aimbot, VIP, Admin...)"
AIInput.Text = ""
AIInput.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
AIInput.TextColor3 = Color3.new(1,1,1)
AIInput.Font = Enum.Font.Gotham
AIInput.TextSize = 18
AIInput.ClearTextOnFocus = false

local AIInputCorner = Instance.new("UICorner")
AIInputCorner.CornerRadius = UDim.new(0, 8)
AIInputCorner.Parent = AIInput

local AISubmit = Instance.new("TextButton")
AISubmit.Parent = AIFrame
AISubmit.Size = UDim2.new(1, -20, 0, 60)
AISubmit.Position = UDim2.new(0, 10, 0, 130)
AISubmit.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
AISubmit.Text = "AUSFÜHREN"
AISubmit.TextColor3 = Color3.new(1,1,1)
AISubmit.Font = Enum.Font.GothamBold
AISubmit.TextSize = 20

local AISubmitCorner = Instance.new("UICorner")
AISubmitCorner.CornerRadius = UDim.new(0, 10)
AISubmitCorner.Parent = AISubmit

local AIResult = Instance.new("TextLabel")
AIResult.Parent = AIFrame
AIResult.Size = UDim2.new(1, -20, 0, 40)
AIResult.Position = UDim2.new(0, 10, 0, 200)
AIResult.BackgroundTransparency = 1
AIResult.Text = "👆 Gib einen Befehl ein!"
AIResult.TextColor3 = Color3.fromRGB(200, 200, 200)
AIResult.Font = Enum.Font.Gotham
AIResult.TextSize = 16
AIResult.TextWrapped = true

AISubmit.MouseButton1Click:Connect(function()
    local result = AIAssistant(AIInput.Text)
    AIResult.Text = "🤖 " .. result
    AIInput.Text = ""
end)

-- ========== TAB UMSCHALTUNG ==========

tabCheats.MouseButton1Click:Connect(function() switchTab("⚡ CHEATS") end)
tabAdmin.MouseButton1Click:Connect(function() switchTab("👑 ADMIN") end)
tabVIP.MouseButton1Click:Connect(function() switchTab("💎 VIP") end)
tabTools.MouseButton1Click:Connect(function() switchTab("🔧 TOOLS") end)
tabAI.MouseButton1Click:Connect(function() switchTab("🤖 AI") end)

switchTab("⚡ CHEATS")

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
    if Frame.Size == UDim2.new(0, 550, 0, 700) then
        Frame.Size = UDim2.new(0, 550, 0, 60)
        ContentFrame.Visible = false
        TabFrame.Visible = false
        MinBtn.Text = "□"
    else
        Frame.Size = UDim2.new(0, 550, 0, 700)
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
showNotification("HACKER TOOL V8", "Willkommen! Wähle PC oder Mobile!", 3)

print("✅ ULTIMATE HACKER TOOL V8 GELADEN!")
print("📺 YouTube: @hacker666-00")

end)

if not success then
    warn("FEHLER: " .. tostring(err))
    -- Zeige Fehler im Spiel an
    local errorGui = Instance.new("ScreenGui")
    errorGui.Parent = game:GetService("CoreGui")
    local errorFrame = Instance.new("Frame")
    errorFrame.Size = UDim2.new(0, 400, 0, 200)
    errorFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
    errorFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    errorFrame.Parent = errorGui
    local errorText = Instance.new("TextLabel")
    errorText.Size = UDim2.new(1, 0, 1, 0)
    errorText.BackgroundTransparency = 1
    errorText.Text = "Fehler: " .. tostring(err)
    errorText.TextColor3 = Color3.new(1,1,1)
    errorText.TextWrapped = true
    errorText.TextSize = 18
    errorText.Parent = errorFrame
end
