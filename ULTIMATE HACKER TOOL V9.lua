--[[
    ULTIMATE HACKER TOOL V9 - ULTIMATE EDITION
    Made by Waled-hammad
    YouTube: @hacker666-00
    GUI KLEINER - 50+ OP TOOLS!
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

-- ========== FPS ANZEIGE ==========
local FPSFrame = Instance.new("Frame")
FPSFrame.Parent = ScreenGui
FPSFrame.Size = UDim2.new(0, 70, 0, 25)
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

-- ========== WILLKOMMENSFRAME ==========
local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Parent = ScreenGui
WelcomeFrame.Size = UDim2.new(0, 300, 0, 250)
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
WelcomeTitle.Text = "⚡ OP TOOLS ULTIMATE ⚡"
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
WelcomeCredit.Text = "by Waled-hammad • 50+ OP Tools"
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
Frame.Size = UDim2.new(0, 500, 0, 600)
Frame.Position = UDim2.new(0.5, -250, 0.5, -300)
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
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TitleBar.BorderSizePixel = 0
TitleBar.Visible = true

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar

-- YouTube Button im Titel
local TitleYT = Instance.new("TextButton")
TitleYT.Parent = TitleBar
TitleYT.Size = UDim2.new(0, 30, 0, 30)
TitleYT.Position = UDim2.new(0, 10, 0, 7.5)
TitleYT.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TitleYT.Text = "▶"
TitleYT.TextColor3 = Color3.new(1,1,1)
TitleYT.Font = Enum.Font.GothamBold
TitleYT.TextSize = 18
TitleYT.BorderSizePixel = 0
TitleYT.Visible = true

local TitleYTCorner = Instance.new("UICorner")
TitleYTCorner.CornerRadius = UDim.new(0, 7)
TitleYTCorner.Parent = TitleYT

TitleYT.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00?si=9nPd1Y9rHP7Yz3vz")
    showNotification("YouTube", "Link kopiert!", 1)
end)

local TitleText = Instance.new("TextLabel")
TitleText.Parent = TitleBar
TitleText.Size = UDim2.new(1, -130, 1, 0)
TitleText.Position = UDim2.new(0, 45, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "⚡ OP TOOLS ULTIMATE ⚡"
TitleText.TextColor3 = Color3.fromRGB(0, 200, 255)
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 20
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Visible = true

-- Color Picker Button
local ColorBtn = Instance.new("TextButton")
ColorBtn.Parent = TitleBar
ColorBtn.Size = UDim2.new(0, 30, 0, 30)
ColorBtn.Position = UDim2.new(1, -95, 0, 7.5)
ColorBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
ColorBtn.Text = "🎨"
ColorBtn.TextColor3 = Color3.new(1,1,1)
ColorBtn.Font = Enum.Font.GothamBold
ColorBtn.TextSize = 18
ColorBtn.BorderSizePixel = 0
ColorBtn.Visible = true

local ColorCorner = Instance.new("UICorner")
ColorCorner.CornerRadius = UDim.new(0, 7)
ColorCorner.Parent = ColorBtn

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Parent = TitleBar
MinBtn.Size = UDim2.new(0, 35, 0, 35)
MinBtn.Position = UDim2.new(1, -55, 0, 5)
MinBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 255)
MinBtn.Text = "−"
MinBtn.TextColor3 = Color3.new(1,1,1)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 24
MinBtn.BorderSizePixel = 0
MinBtn.Visible = true

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 8)
MinCorner.Parent = MinBtn

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -15, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 20
CloseBtn.BorderSizePixel = 0
CloseBtn.Visible = true

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

-- Tabs
local TabFrame = Instance.new("Frame")
TabFrame.Parent = Frame
TabFrame.Size = UDim2.new(1, -20, 0, 45)
TabFrame.Position = UDim2.new(0, 10, 0, 50)
TabFrame.BackgroundTransparency = 1
TabFrame.Visible = true

local tabs = {}
local activeTab = "MOVEMENT"

local function createTab(name, pos)
    local tab = Instance.new("TextButton")
    tab.Parent = TabFrame
    tab.Size = UDim2.new(0, 90, 0, 38)
    tab.Position = UDim2.new(0, pos, 0, 3.5)
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

local tabMovement = createTab("🚀 MOVEMENT", 0)
local tabCombat = createTab("⚔️ COMBAT", 95)
local tabAdmin = createTab("👑 ADMIN", 190)
local tabVisual = createTab("👁️ VISUAL", 285)
local tabWorld = createTab("🌍 WORLD", 380)
local tabMisc = createTab("🎲 MISC", 475)

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = Frame
ContentFrame.Size = UDim2.new(1, -20, 1, -140)
ContentFrame.Position = UDim2.new(0, 10, 0, 100)
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
ScrollingFrame.ScrollBarThickness = 6
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 200, 255)
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.Visible = true

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 5)
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
    showNotification("PC MODUS", "50+ OP Tools bereit!", 1)
end)

MobileButton.MouseButton1Click:Connect(function()
    WelcomeFrame.Visible = false
    OpenButton.Visible = true
    for _, child in ipairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.Size = UDim2.new(0.95, 0, 0, 50)
        end
    end
    showNotification("MOBILE MODUS", "50+ OP Tools bereit!", 1)
end)

-- Button Creator
local function createButton(text, color, callback, tabName)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.95, 0, 0, 40)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 15
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

-- ========== OP TOOLGIVER & SCANNER ==========

-- TOOLGIVER ULTIMATE
local function toolgiverUltimate()
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then 
        showNotification("Fehler", "Backpack nicht gefunden", 2)
        return 
    end
    
    local count = 0
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("Tool") and obj.Parent then
            pcall(function()
                local newTool = obj:Clone()
                newTool.Parent = backpack
                count = count + 1
            end)
        end
    end
    showNotification("Toolgiver Ultimate", count .. " OP Tools erhalten!", 2)
end

-- TOOLGIVER GODLY
local function toolgiverGodly()
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then return end
    
    local count = 0
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("Tool") and obj.Parent then
            local name = obj.Name:lower()
            if name:find("god") or name:find("admin") or name:find("op") or name:find("vip") or name:find("legend") or name:find("mythic") then
                pcall(function()
                    obj:Clone().Parent = backpack
                    count = count + 1
                end)
            end
        end
    end
    showNotification("Godly Tools", count .. " God-Tools erhalten!", 2)
end

-- SCANNER PRO
local function scannerPro()
    local tools = {}
    local rareTools = {}
    
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("Tool") and obj.Parent then
            tools[obj.Name] = true
            local name = obj.Name:lower()
            if name:find("admin") or name:find("op") or name:find("vip") or name:find("god") then
                rareTools[obj.Name] = true
            end
        end
    end
    
    local total = 0
    for _ in pairs(tools) do total = total + 1 end
    local rare = 0
    for _ in pairs(rareTools) do rare = rare + 1 end
    
    showNotification("Scanner Pro", total .. " Tools (" .. rare .. " rare)", 3)
end

-- ========== BEWEGUNGS TOOLS ==========

-- Fly V2 (besser)
local flyEnabled = false
local flyConnection

local function flyV2()
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
                bv.Velocity = Vector3.new(0, 0, 0)
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
                    bv.Velocity = moveDir * 150
                    bg.CFrame = CFrame.lookAt(root.Position, root.Position + moveDir)
                end)
            end
        end
        showNotification("Fly V2", "AN - WASD fliegen", 1)
    else
        if flyConnection then
            flyConnection:Disconnect()
        end
        if player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.PlatformStand = false
            end
        end
        showNotification("Fly V2", "AUS", 1)
    end
end

-- Speed V2
local speedEnabled = false
local function speedV2()
    speedEnabled = not speedEnabled
    
    if speedEnabled then
        if player.Character then
            player.Character.Humanoid.WalkSpeed = 200
        end
        showNotification("Speed V2", "200 Speed", 1)
    else
        if player.Character then
            player.Character.Humanoid.WalkSpeed = 16
        end
        showNotification("Speed V2", "AUS", 1)
    end
end

-- Jump Power
local jumpEnabled = false
local function jumpV2()
    jumpEnabled = not jumpEnabled
    
    if jumpEnabled then
        if player.Character then
            player.Character.Humanoid.JumpPower = 150
            player.Character.Humanoid.JumpHeight = 150
        end
        showNotification("Jump V2", "150 Jump", 1)
    else
        if player.Character then
            player.Character.Humanoid.JumpPower = 50
            player.Character.Humanoid.JumpHeight = 7.2
        end
        showNotification("Jump V2", "AUS", 1)
    end
end

-- Noclip V2
local noclipEnabled = false
local noclipConnection

local function noclipV2()
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
        showNotification("Noclip V2", "AN - Durch Wände", 1)
    else
        if noclipConnection then
            noclipConnection:Disconnect()
        end
        showNotification("Noclip V2", "AUS", 1)
    end
end

-- Inf Jump V2
local infJumpEnabled = false
local jumpConnection

local function infJumpV2()
    infJumpEnabled = not infJumpEnabled
    
    if infJumpEnabled then
        jumpConnection = userInputService.JumpRequest:Connect(function()
            if player.Character and player.Character.Humanoid then
                player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
        showNotification("Inf Jump V2", "AN", 1)
    else
        if jumpConnection then
            jumpConnection:Disconnect()
        end
        showNotification("Inf Jump V2", "AUS", 1)
    end
end

-- Teleport to Mouse
local function tpToMouse()
    local mouse = player:GetMouse()
    if mouse and mouse.Hit and player.Character and player.Character.HumanoidRootPart then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.p + Vector3.new(0, 3, 0))
        showNotification("TP", "Zu Maus teleportiert", 1)
    end
end

-- Teleport to Random Player
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

-- ========== KAMPF TOOLS ==========

-- Aimbot V2
local aimbotEnabled = false
local aimbotConnection

local function aimbotV2()
    aimbotEnabled = not aimbotEnabled
    
    if aimbotEnabled then
        aimbotConnection = runService.RenderStepped:Connect(function()
            local closest = nil
            local closestDist = math.huge
            local mouse = player:GetMouse()
            
            for _, v in ipairs(players:GetPlayers()) do
                if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid.Health > 0 then
                    local pos = v.Character.HumanoidRootPart.Position
                    local screenPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(pos)
                    
                    if onScreen then
                        local dist = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                        if dist < closestDist and dist < 300 then
                            closest = v
                            closestDist = dist
                        end
                    end
                end
            end
            
            if closest then
                workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.Position, closest.Character.HumanoidRootPart.Position)
            end
        end)
        showNotification("Aimbot V2", "AN - Silent Aim", 1)
    else
        if aimbotConnection then
            aimbotConnection:Disconnect()
        end
        showNotification("Aimbot V2", "AUS", 1)
    end
end

-- Kill Aura
local killAuraEnabled = false
local killAuraConnection

local function killAura()
    killAuraEnabled = not killAuraEnabled
    
    if killAuraEnabled then
        killAuraConnection = runService.Heartbeat:Connect(function()
            for _, v in ipairs(players:GetPlayers()) do
                if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid then
                    local dist = (v.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                    if dist < 20 then
                        v.Character.Humanoid.Health = 0
                    end
                end
            end
        end)
        showNotification("Kill Aura", "AN - 20 Studs", 1)
    else
        if killAuraConnection then
            killAuraConnection:Disconnect()
        end
        showNotification("Kill Aura", "AUS", 1)
    end
end

-- Silent Aim (Wallbang)
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
        showNotification("Silent Aim", "AN - Wallbang", 1)
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

local function triggerBot()
    triggerBotEnabled = not triggerBotEnabled
    
    if triggerBotEnabled then
        triggerBotConnection = runService.Heartbeat:Connect(function()
            local mouse = player:GetMouse()
            if mouse.Target then
                local humanoid = mouse.Target.Parent:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.Parent ~= player.Character then
                    mouse1press()
                    wait(0.1)
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

-- Anti Aim
local antiAimEnabled = false
local antiAimConnection

local function antiAim()
    antiAimEnabled = not antiAimEnabled
    
    if antiAimEnabled then
        antiAimConnection = runService.Heartbeat:Connect(function()
            if player.Character and player.Character.HumanoidRootPart then
                player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 50, 0)
                player.Character.HumanoidRootPart.Orientation = Vector3.new(0, tick() * 1000 % 360, 0)
            end
        end)
        showNotification("Anti Aim", "AN", 1)
    else
        if antiAimConnection then
            antiAimConnection:Disconnect()
        end
        showNotification("Anti Aim", "AUS", 1)
    end
end

-- ========== ADMIN TOOLS ==========

-- Admin Unlock V2
local function adminUnlockV2()
    local found = 0
    for _, v in ipairs(player:GetDescendants()) do
        if v:IsA("BoolValue") and (v.Name:lower():find("admin") or v.Name:lower():find("mod") or v.Name:lower():find("owner")) then
            v.Value = true
            found = found + 1
        end
        if v:IsA("NumberValue") and (v.Name:lower():find("admin") or v.Name:lower():find("rank") or v.Name:lower():find("level")) then
            v.Value = 9999
            found = found + 1
        end
    end
    
    -- Versuche Remote Events
    for _, v in ipairs(replicatedStorage:GetDescendants()) do
        if v:IsA("RemoteEvent") and (v.Name:lower():find("admin") or v.Name:lower():find("rank") or v.Name:lower():find("permission")) then
            pcall(function()
                v:FireServer("GrantAdmin", player)
            end)
        end
    end
    
    showNotification("Admin Unlock", found .. " Admin-Werte gesetzt", 2)
end

-- VIP Unlock V2
local function vipUnlockV2()
    local found = 0
    for _, v in ipairs(player:GetDescendants()) do
        if v:IsA("BoolValue") and (v.Name:lower():find("vip") or v.Name:lower():find("premium") or v.Name:lower():find("gamepass")) then
            v.Value = true
            found = found + 1
        end
        if v:IsA("NumberValue") and (v.Name:lower():find("vip") or v.Name:lower():find("rank") or v.Name:lower():find("tier")) then
            v.Value = 9999
            found = found + 1
        end
    end
    showNotification("VIP Unlock", found .. " VIP-Werte gesetzt", 2)
end

-- Infinite Yield Loader
local function loadInfiniteYield()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
    showNotification("Infinite Yield", "Admin Tool geladen!", 2)
end

-- CMD-X Loader
local function loadCmdX()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/source"))()
    end)
    showNotification("CMD-X", "Admin Tool geladen!", 2)
end

-- F3X Loader
local function loadF3X()
    pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/f3x"))()
    end)
    showNotification("F3X", "Build Tool geladen!", 2)
end

-- Dex Explorer
local function loadDex()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
    end)
    showNotification("DEX Explorer", "Geladen!", 2)
end

-- Remote Spy
local function remoteSpy()
    pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/remote-spy"))()
    end)
    showNotification("Remote Spy", "Geladen!", 2)
end

-- ========== VISUAL TOOLS ==========

-- ESP V2
local function espV2()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucas17052011/ESP/main/ESP%20Lucas"))()
    end)
    showNotification("ESP V2", "Geladen!", 1)
end

-- Fullbright
local function fullbright()
    lighting.Brightness = 2
    lighting.Ambient = Color3.new(1, 1, 1)
    lighting.OutdoorAmbient = Color3.new(1, 1, 1)
    lighting.GlobalShadows = false
    showNotification("Fullbright", "Alles hell!", 1)
end

-- Night Vision
local function nightVision()
    lighting.Brightness = 0.5
    lighting.Ambient = Color3.new(0.2, 0.2, 0.2)
    lighting.OutdoorAmbient = Color3.new(0.2, 0.2, 0.2)
    lighting.GlobalShadows = false
    showNotification("Night Vision", "Aktiv!", 1)
end

-- X-Ray (Durchsichtig)
local xrayEnabled = false
local function xray()
    xrayEnabled = not xrayEnabled
    
    if xrayEnabled then
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsDescendantOf(player.Character) then
                v.Transparency = 0.8
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

-- Highlight Players
local highlightEnabled = false
local highlights = {}

local function highlightPlayers()
    highlightEnabled = not highlightEnabled
    
    if highlightEnabled then
        for _, v in ipairs(players:GetPlayers()) do
            if v ~= player and v.Character then
                local highlight = Instance.new("Highlight")
                highlight.Parent = v.Character
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                table.insert(highlights, highlight)
            end
        end
        showNotification("Highlight", "AN", 1)
    else
        for _, h in ipairs(highlights) do
            h:Destroy()
        end
        highlights = {}
        showNotification("Highlight", "AUS", 1)
    end
end

-- ========== WORLD TOOLS ==========

-- TNT V2
local function tntV2()
    local mouse = player:GetMouse()
    local pos = mouse.Hit.p
    
    local tnt = Instance.new("Part")
    tnt.Size = Vector3.new(3, 3, 3)
    tnt.Position = pos + Vector3.new(0, 5, 0)
    tnt.BrickColor = BrickColor.new("Really red")
    tnt.Material = Enum.Material.Neon
    tnt.Anchored = false
    tnt.Parent = workspace
    
    local mesh = Instance.new("SpecialMesh")
    mesh.MeshType = Enum.MeshType.Sphere
    mesh.Parent = tnt
    
    local fire = Instance.new("Fire")
    fire.Parent = tnt
    fire.Size = 5
    fire.Heat = 10
    
    if timerEnabled then
        for i = 5, 0, -1 do
            fire.Size = fire.Size + 1
            wait(1)
        end
    else
        wait(2)
    end
    
    local explosion = Instance.new("Explosion")
    explosion.Position = tnt.Position
    explosion.BlastRadius = 25
    explosion.BlastPressure = 200000
    explosion.DestroyJointRadiusPercent = 1
    explosion.Parent = workspace
    
    tnt:Destroy()
    showNotification("TNT V2", "MEGA BOOM!", 1)
end

-- C4 (Platzierbar)
local c4Count = 0
local c4List = {}

local function placeC4()
    local mouse = player:GetMouse()
    local pos = mouse.Hit.p
    
    c4Count = c4Count + 1
    
    local c4 = Instance.new("Part")
    c4.Size = Vector3.new(1, 0.5, 1)
    c4.Position = pos + Vector3.new(0, 0.25, 0)
    c4.BrickColor = BrickColor.new("Black")
    c4.Material = Enum.Material.SmoothPlastic
    c4.Anchored = false
    c4.Parent = workspace
    
    local decal = Instance.new("Decal")
    decal.Face = Enum.NormalId.Top
    decal.Texture = "rbxasset://textures/C4.png"
    decal.Parent = c4
    
    local billboard = Instance.new("BillboardGui")
    billboard.Parent = c4
    billboard.Size = UDim2.new(0, 50, 0, 20)
    billboard.StudsOffset = Vector3.new(0, 1, 0)
    
    local text = Instance.new("TextLabel")
    text.Parent = billboard
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = "💣 C4 #" .. c4Count
    text.TextColor3 = Color3.fromRGB(255, 0, 0)
    text.TextScaled = true
    
    table.insert(c4List, c4)
    showNotification("C4", "C4 #" .. c4Count .. " platziert", 1)
end

local function detonateAll()
    for _, c4 in ipairs(c4List) do
        if c4 and c4.Parent then
            local explosion = Instance.new("Explosion")
            explosion.Position = c4.Position
            explosion.BlastRadius = 15
            explosion.BlastPressure = 100000
            explosion.Parent = workspace
            c4:Destroy()
        end
    end
    c4List = {}
    c4Count = 0
    showNotification("C4", "ALLE DETONIERT!", 2)
end

-- Gravity Gun
local gravityGunEnabled = false
local grabbedPart = nil
local grabConnection

local function gravityGun()
    gravityGunEnabled = not gravityGunEnabled
    
    if gravityGunEnabled then
        local mouse = player:GetMouse()
        
        grabConnection = userInputService.InputBegan:Connect(function(input)
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
        
        showNotification("Gravity Gun", "AN - Links zum Greifen", 2)
    else
        if grabConnection then
            grabConnection:Disconnect()
        end
        grabbedPart = nil
        showNotification("Gravity Gun", "AUS", 1)
    end
end

-- ========== MISC TOOLS ==========

-- Anti AFK V2
local function antiAFKV2()
    player.Idled:Connect(function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end)
    
    local connection = runService.Heartbeat:Connect(function()
        if player.Character and player.Character.Humanoid then
            player.Character.Humanoid:Move(Vector3.new(0, 0, 0), true)
        end
    end)
    
    showNotification("Anti AFK V2", "Immer aktiv!", 2)
end

-- Rejoin V2
local function rejoinV2()
    showNotification("Rejoin", "Verbinde neu...", 1)
    teleportService:Teleport(game.PlaceId, player)
end

-- Server Hop V2
local function serverHopV2()
    showNotification("Server Hop", "Suche...", 1)
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

-- Copy Game Info
local function copyGameInfo()
    local info = "Game: " .. marketplaceService:GetProductInfo(game.PlaceId).Name .. "\nID: " .. game.PlaceId .. "\nServer: " .. game.JobId
    setclipboard(info)
    showNotification("Game Info", "Kopiert!", 1)
end

-- FPS Boost
local function fpsBoost()
    lighting.GlobalShadows = false
    lighting.FogEnd = 9e9
    workspace.Terrain.WaterWaveSize = 0
    workspace.Terrain.WaterWaveSpeed = 0
    settings().Rendering.QualityLevel = 1
    showNotification("FPS Boost", "Maximale FPS!", 2)
end

-- Infinite Yield (Admin)
createButton("⚡ INFINITE YIELD", Color3.fromRGB(0, 200, 0), loadInfiniteYield, "ADMIN")

-- CMD-X
createButton("⚡ CMD-X ADMIN", Color3.fromRGB(200, 0, 200), loadCmdX, "ADMIN")

-- F3X Build
createButton("🔨 F3X BUILD", Color3.fromRGB(0, 100, 255), loadF3X, "ADMIN")

-- Dex Explorer
createButton("🔍 DEX EXPLORER", Color3.fromRGB(255, 100, 0), loadDex, "ADMIN")

-- Remote Spy
createButton("🕵️ REMOTE SPY", Color3.fromRGB(100, 100, 255), remoteSpy, "ADMIN")

-- ========== ALLE BUTTONS NACH TABS ==========

-- MOVEMENT Tab (10 Tools)
createButton("🦅 FLY V2", Color3.fromRGB(100, 150, 255), flyV2, "MOVEMENT")
createButton("⚡ SPEED V2", Color3.fromRGB(0, 255, 100), speedV2, "MOVEMENT")
createButton("🦘 JUMP V2", Color3.fromRGB(0, 200, 200), jumpV2, "MOVEMENT")
createButton("🚪 NOCLIP V2", Color3.fromRGB(150, 0, 200), noclipV2, "MOVEMENT")
createButton("🔄 INF JUMP V2", Color3.fromRGB(0, 255, 255), infJumpV2, "MOVEMENT")
createButton("🖱️ TP TO MOUSE", Color3.fromRGB(100, 0, 200), tpToMouse, "MOVEMENT")
createButton("🎲 TP RANDOM", Color3.fromRGB(200, 0, 100), tpRandomPlayer, "MOVEMENT")
createButton("🌊 WATER WALK", Color3.fromRGB(0, 100, 255), function() showNotification("Water Walk", "Coming soon!", 1) end, "MOVEMENT")
createButton("🧗 WALL CLIMB", Color3.fromRGB(100, 100, 100), function() showNotification("Wall Climb", "Coming soon!", 1) end, "MOVEMENT")
createButton("🌀 SPIN BOT", Color3.fromRGB(255, 100, 255), function() showNotification("Spin Bot", "Coming soon!", 1) end, "MOVEMENT")

-- COMBAT Tab (10 Tools)
createButton("🎯 AIMBOT V2", Color3.fromRGB(255, 50, 50), aimbotV2, "COMBAT")
createButton("💀 KILL AURA", Color3.fromRGB(255, 0, 0), killAura, "COMBAT")
createButton("🎯 SILENT AIM", Color3.fromRGB(200, 0, 0), silentAim, "COMBAT")
createButton("🔫 TRIGGER BOT", Color3.fromRGB(255, 100, 0), triggerBot, "COMBAT")
createButton("🛡️ ANTI AIM", Color3.fromRGB(100, 100, 255), antiAim, "COMBAT")
createButton("⚔️ AUTO CLICK", Color3.fromRGB(255, 200, 0), function() showNotification("Auto Click", "Coming soon!", 1) end, "COMBAT")
createButton("🛡️ AIM PROTECT", Color3.fromRGB(0, 255, 100), function() showNotification("Aim Protect", "Coming soon!", 1) end, "COMBAT")
createButton("💥 RAGE MODE", Color3.fromRGB(255, 0, 100), function() showNotification("Rage Mode", "Coming soon!", 1) end, "COMBAT")
createButton("🎯 SILENT AIM", Color3.fromRGB(255, 50, 0), function() showNotification("Silent Aim", "Coming soon!", 1) end, "COMBAT")
createButton("👁️ AIM ASSIST", Color3.fromRGB(100, 255, 100), function() showNotification("Aim Assist", "Coming soon!", 1) end, "COMBAT")

-- ADMIN Tab (12 Tools)
createButton("👑 ADMIN UNLOCK", Color3.fromRGB(255, 215, 0), adminUnlockV2, "ADMIN")
createButton("💎 VIP UNLOCK", Color3.fromRGB(255, 200, 0), vipUnlockV2, "ADMIN")
createButton("📦 TOOLGIVER ULT", Color3.fromRGB(0, 170, 255), toolgiverUltimate, "ADMIN")
createButton("🔍 SCANNER PRO", Color3.fromRGB(255, 170, 0), scannerPro, "ADMIN")
createButton("✨ GODLY TOOLS", Color3.fromRGB(200, 100, 255), toolgiverGodly, "ADMIN")
createButton("💰 INFINITE MONEY", Color3.fromRGB(255, 200, 0), function() showNotification("Money", "Coming soon!", 1) end, "ADMIN")
createButton("⚡ INF YIELD", Color3.fromRGB(0, 200, 0), loadInfiniteYield, "ADMIN")
createButton("⚡ CMD-X", Color3.fromRGB(200, 0, 200), loadCmdX, "ADMIN")
createButton("🔨 F3X", Color3.fromRGB(0, 100, 255), loadF3X, "ADMIN")
createButton("🔍 DEX", Color3.fromRGB(255, 100, 0), loadDex, "ADMIN")
createButton("🕵️ REMOTE SPY", Color3.fromRGB(100, 100, 255), remoteSpy, "ADMIN")
createButton("📋 GAME INFO", Color3.fromRGB(150, 150, 150), copyGameInfo, "ADMIN")

-- VISUAL Tab (10 Tools)
createButton("👁️ ESP V2", Color3.fromRGB(200, 0, 200), espV2, "VISUAL")
createButton("☀️ FULLBRIGHT", Color3.fromRGB(255, 255, 0), fullbright, "VISUAL")
createButton("🌙 NIGHT VISION", Color3.fromRGB(0, 100, 255), nightVision, "VISUAL")
createButton("🩻 X-RAY", Color3.fromRGB(100, 255, 100), xray, "VISUAL")
createButton("🌟 HIGHLIGHT", Color3.fromRGB(255, 0, 255), highlightPlayers, "VISUAL")
createButton("👁️ CHAMS", Color3.fromRGB(0, 255, 255), function() showNotification("Chams", "Coming soon!", 1) end, "VISUAL")
createButton("📏 DISTANCE ESP", Color3.fromRGB(255, 100, 0), function() showNotification("Distance ESP", "Coming soon!", 1) end, "VISUAL")
createButton("📦 ITEM ESP", Color3.fromRGB(0, 255, 0), function() showNotification("Item ESP", "Coming soon!", 1) end, "VISUAL")
createButton("🚪 DOOR ESP", Color3.fromRGB(255, 0, 0), function() showNotification("Door ESP", "Coming soon!", 1) end, "VISUAL")
createButton("💀 NAME ESP", Color3.fromRGB(255, 255, 255), function() showNotification("Name ESP", "Coming soon!", 1) end, "VISUAL")

-- WORLD Tab (8 Tools)
createButton("💣 TNT V2", Color3.fromRGB(255, 50, 0), tntV2, "WORLD")
createButton("🧨 C4 PLACE", Color3.fromRGB(100, 100, 100), placeC4, "WORLD")
createButton("💥 DETONATE ALL", Color3.fromRGB(255, 0, 0), detonateAll, "WORLD")
createButton("🔄 GRAVITY GUN", Color3.fromRGB(0, 255, 255), gravityGun, "WORLD")
createButton("🌍 GRAVITY", Color3.fromRGB(100, 50, 150), function() workspace.Gravity = 50 showNotification("Gravity", "Leicht!", 1) end, "WORLD")
createButton("⏱️ TIME CHANGE", Color3.fromRGB(255, 255, 0), function() lighting.ClockTime = 12 showNotification("Time", "12:00", 1) end, "WORLD")
createButton("🌫️ FOG TOGGLE", Color3.fromRGB(150, 150, 150), function() lighting.FogEnd = lighting.FogEnd == 100000 and 100 or 100000 showNotification("Fog", "Toggled!", 1) end, "WORLD")
createButton("💧 WATER WALK", Color3.fromRGB(0, 100, 255), function() showNotification("Water Walk", "Coming soon!", 1) end, "WORLD")

-- MISC Tab (10 Tools)
createButton("💤 ANTI AFK", Color3.fromRGB(100, 100, 100), antiAFKV2, "MISC")
createButton("🔄 REJOIN", Color3.fromRGB(0, 100, 200), rejoinV2, "MISC")
createButton("🌍 SERVER HOP", Color3.fromRGB(200, 100, 0), serverHopV2, "MISC")
createButton("🔄 RESET CHAR", Color3.fromRGB(255, 50, 50), function() player.Character:BreakJoints() showNotification("Reset", "Character reset!", 1) end, "MISC")
createButton("⚡ FPS BOOST", Color3.fromRGB(0, 255, 0), fpsBoost, "MISC")
createButton("📋 COPY GAME ID", Color3.fromRGB(150, 150, 150), copyGameInfo, "MISC")
createButton("🎨 COLOR CHANGE", Color3.fromRGB(255, 200, 0), function() 
    local r,g,b = math.random(0,255), math.random(0,255), math.random(0,255)
    TitleText.TextColor3 = Color3.fromRGB(r,g,b)
    showNotification("Color", "Changed!", 1)
end, "MISC")
createButton("📊 FPS MONITOR", Color3.fromRGB(0, 255, 100), function() showNotification("FPS", "Always on!", 1) end, "MISC")
createButton("🔊 SOUND TEST", Color3.fromRGB(200, 100, 255), function() showNotification("Sound", "Beep!", 1) end, "MISC")
createButton("🎮 CONSOLE", Color3.fromRGB(100, 100, 100), function() showNotification("Console", "Coming soon!", 1) end, "MISC")

-- ========== TAB UMSCHALTUNG ==========

tabMovement.MouseButton1Click:Connect(function() switchTab("MOVEMENT") end)
tabCombat.MouseButton1Click:Connect(function() switchTab("COMBAT") end)
tabAdmin.MouseButton1Click:Connect(function() switchTab("ADMIN") end)
tabVisual.MouseButton1Click:Connect(function() switchTab("VISUAL") end)
tabWorld.MouseButton1Click:Connect(function() switchTab("WORLD") end)
tabMisc.MouseButton1Click:Connect(function() switchTab("MISC") end)

switchTab("MOVEMENT")

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
    if Frame.Size == UDim2.new(0, 500, 0, 600) then
        Frame.Size = UDim2.new(0, 500, 0, 45)
        ContentFrame.Visible = false
        TabFrame.Visible = false
        MinBtn.Text = "□"
    else
        Frame.Size = UDim2.new(0, 500, 0, 600)
        ContentFrame.Visible = true
        TabFrame.Visible = true
        MinBtn.Text = "−"
    end
end)

ColorBtn.MouseButton1Click:Connect(function()
    local r,g,b = math.random(0,255), math.random(0,255), math.random(0,255)
    TitleText.TextColor3 = Color3.fromRGB(r,g,b)
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
showNotification("OP TOOLS ULTIMATE", "50+ berühmte Tools geladen!", 3)

print("✅ OP TOOLS ULTIMATE V9 GELADEN!")
print("📺 YouTube: @hacker666-00")
print("🔧 50+ OP Tools verfügbar!")

end)

if not success then
    warn("FEHLER: " .. tostring(err))
end
