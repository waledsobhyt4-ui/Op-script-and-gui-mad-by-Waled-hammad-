--[[
    HACKERTOOL V6 - KOMPAKT & FIXED
    Made by Waled-hammad
    YouTube: @hacker666-00
    GUI kleiner - Alle Buttons sichtbar!
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
ScreenGui.Name = "HackertoolV6"

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

-- ========== FPS ANZEIGE (KLEIN) ==========
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

-- ========== WILLKOMMENSFRAME (KLEIN) ==========
local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Parent = ScreenGui
WelcomeFrame.Size = UDim2.new(0, 260, 0, 220)
WelcomeFrame.Position = UDim2.new(0.5, -130, 0.5, -110)
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
YTButton.Size = UDim2.new(0.9, 0, 0, 30)
YTButton.Position = UDim2.new(0.05, 0, 0.05, 0)
YTButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
YTButton.Text = "📺 @hacker666-00"
YTButton.TextColor3 = Color3.new(1,1,1)
YTButton.Font = Enum.Font.GothamBold
YTButton.TextSize = 14
YTButton.BorderSizePixel = 0
YTButton.Visible = true

local YTCorner = Instance.new("UICorner")
YTCorner.CornerRadius = UDim.new(0, 5)
YTCorner.Parent = YTButton

YTButton.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00?si=9nPd1Y9rHP7Yz3vz")
    showNotification("YouTube", "Link kopiert!", 1)
end)

-- Titel
local WelcomeTitle = Instance.new("TextLabel")
WelcomeTitle.Parent = WelcomeFrame
WelcomeTitle.Size = UDim2.new(1, 0, 0, 25)
WelcomeTitle.Position = UDim2.new(0, 0, 0, 45)
WelcomeTitle.BackgroundTransparency = 1
WelcomeTitle.Text = "⚡ HACKERTOOL V6 ⚡"
WelcomeTitle.TextColor3 = Color3.fromRGB(0, 200, 255)
WelcomeTitle.Font = Enum.Font.GothamBold
WelcomeTitle.TextSize = 16
WelcomeTitle.Visible = true

-- PC Button
local PCButton = Instance.new("TextButton")
PCButton.Parent = WelcomeFrame
PCButton.Size = UDim2.new(0.8, 0, 0, 35)
PCButton.Position = UDim2.new(0.1, 0, 0.3, 0)
PCButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
PCButton.Text = "💻 PC"
PCButton.TextColor3 = Color3.new(1,1,1)
PCButton.Font = Enum.Font.GothamBold
PCButton.TextSize = 16
PCButton.BorderSizePixel = 0
PCButton.Visible = true

local PCCorner = Instance.new("UICorner")
PCCorner.CornerRadius = UDim.new(0, 6)
PCCorner.Parent = PCButton

-- Mobile Button
local MobileButton = Instance.new("TextButton")
MobileButton.Parent = WelcomeFrame
MobileButton.Size = UDim2.new(0.8, 0, 0, 35)
MobileButton.Position = UDim2.new(0.1, 0, 0.5, 0)
MobileButton.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
MobileButton.Text = "📱 Mobile"
MobileButton.TextColor3 = Color3.new(1,1,1)
MobileButton.Font = Enum.Font.GothamBold
MobileButton.TextSize = 16
MobileButton.BorderSizePixel = 0
MobileButton.Visible = true

local MobileCorner = Instance.new("UICorner")
MobileCorner.CornerRadius = UDim.new(0, 6)
MobileCorner.Parent = MobileButton

-- Timer ein/aus Button
local TimerToggle = Instance.new("TextButton")
TimerToggle.Parent = WelcomeFrame
TimerToggle.Size = UDim2.new(0.8, 0, 0, 30)
TimerToggle.Position = UDim2.new(0.1, 0, 0.7, 0)
TimerToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
TimerToggle.Text = "⏱️ Timer: AN"
TimerToggle.TextColor3 = Color3.new(1,1,1)
TimerToggle.Font = Enum.Font.GothamBold
TimerToggle.TextSize = 14
TimerToggle.BorderSizePixel = 0
TimerToggle.Visible = true

local TimerCorner = Instance.new("UICorner")
TimerCorner.CornerRadius = UDim.new(0, 5)
TimerCorner.Parent = TimerToggle

local timerEnabled = true
TimerToggle.MouseButton1Click:Connect(function()
    timerEnabled = not timerEnabled
    TimerToggle.Text = timerEnabled and "⏱️ Timer: AN" or "⏱️ Timer: AUS"
    showNotification("Timer", timerEnabled and "Timer AN" or "Timer AUS", 1)
end)

local WelcomeCredit = Instance.new("TextLabel")
WelcomeCredit.Parent = WelcomeFrame
WelcomeCredit.Size = UDim2.new(1, 0, 0, 20)
WelcomeCredit.Position = UDim2.new(0, 0, 1, -20)
WelcomeCredit.BackgroundTransparency = 1
WelcomeCredit.Text = "by Waled-hammad"
WelcomeCredit.TextColor3 = Color3.fromRGB(150, 150, 150)
WelcomeCredit.Font = Enum.Font.Gotham
WelcomeCredit.TextSize = 10
WelcomeCredit.Visible = true

-- ========== FLOATING BUTTON ==========
local OpenButton = Instance.new("TextButton")
OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0, 50, 0, 50)
OpenButton.Position = UDim2.new(0, 10, 0.5, -25)
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

-- ========== MAIN FRAME (KLEINER) ==========
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 380, 0, 480)
Frame.Position = UDim2.new(0.5, -190, 0.5, -240)
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
TitleBar.Size = UDim2.new(1, 0, 0, 35)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TitleBar.BorderSizePixel = 0
TitleBar.Visible = true

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = TitleBar

-- YouTube Button im Titel
local TitleYT = Instance.new("TextButton")
TitleYT.Parent = TitleBar
TitleYT.Size = UDim2.new(0, 25, 0, 25)
TitleYT.Position = UDim2.new(0, 8, 0, 5)
TitleYT.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TitleYT.Text = "▶"
TitleYT.TextColor3 = Color3.new(1,1,1)
TitleYT.Font = Enum.Font.GothamBold
TitleYT.TextSize = 14
TitleYT.BorderSizePixel = 0
TitleYT.Visible = true

local TitleYTCorner = Instance.new("UICorner")
TitleYTCorner.CornerRadius = UDim.new(0, 5)
TitleYTCorner.Parent = TitleYT

TitleYT.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00?si=9nPd1Y9rHP7Yz3vz")
    showNotification("YouTube", "Link kopiert!", 1)
end)

local TitleText = Instance.new("TextLabel")
TitleText.Parent = TitleBar
TitleText.Size = UDim2.new(1, -100, 1, 0)
TitleText.Position = UDim2.new(0, 40, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "⚡ HACKERTOOL V6 ⚡"
TitleText.TextColor3 = Color3.fromRGB(0, 200, 255)
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 16
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Visible = true

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Parent = TitleBar
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -60, 0, 2.5)
MinBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 255)
MinBtn.Text = "−"
MinBtn.TextColor3 = Color3.new(1,1,1)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 20
MinBtn.BorderSizePixel = 0
MinBtn.Visible = true

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 6)
MinCorner.Parent = MinBtn

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -25, 0, 2.5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.BorderSizePixel = 0
CloseBtn.Visible = true

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

-- Tabs
local TabFrame = Instance.new("Frame")
TabFrame.Parent = Frame
TabFrame.Size = UDim2.new(1, -10, 0, 35)
TabFrame.Position = UDim2.new(0, 5, 0, 40)
TabFrame.BackgroundTransparency = 1
TabFrame.Visible = true

local tabs = {}
local activeTab = "MAIN"

local function createTab(name, pos)
    local tab = Instance.new("TextButton")
    tab.Parent = TabFrame
    tab.Size = UDim2.new(0, 70, 0, 30)
    tab.Position = UDim2.new(0, pos, 0, 2.5)
    tab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    tab.Text = name
    tab.TextColor3 = Color3.new(1,1,1)
    tab.Font = Enum.Font.GothamBold
    tab.TextSize = 12
    tab.BorderSizePixel = 0
    tab.Visible = true

    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 5)
    tabCorner.Parent = tab

    tabs[name] = tab
    return tab
end

-- Tabs in einer Reihe
local tabMain = createTab("MAIN", 0)
local tabMove = createTab("MOVE", 75)
local tabCombat = createTab("COMBAT", 150)
local tabVisual = createTab("VISUAL", 225)
local tabWorld = createTab("WORLD", 300)

-- Zweite Reihe
local tabAdmin = createTab("ADMIN", 0)
tabAdmin.Position = UDim2.new(0, 0, 0, 35)
local tabMisc = createTab("MISC", 75)
tabMisc.Position = UDim2.new(0, 75, 0, 35)
local tabTools = createTab("TOOLS", 150)
tabTools.Position = UDim2.new(0, 150, 0, 35)

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = Frame
ContentFrame.Size = UDim2.new(1, -10, 1, -120)
ContentFrame.Position = UDim2.new(0, 5, 0, 80)
ContentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
ContentFrame.BackgroundTransparency = 0.2
ContentFrame.Visible = true

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 8)
ContentCorner.Parent = ContentFrame

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Parent = ContentFrame
ScrollingFrame.Size = UDim2.new(1, -10, 1, -10)
ScrollingFrame.Position = UDim2.new(0, 5, 0, 5)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.ScrollBarThickness = 4
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
    
    -- Alle Buttons ausblenden
    for _, child in ipairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.Visible = false
        end
    end
    
    -- Alle Tabs zurücksetzen
    for name, tab in pairs(tabs) do
        tab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    end
    
    -- Aktiven Tab hervorheben
    if tabs[tabName] then
        tabs[tabName].BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    end
    
    -- Buttons für aktiven Tab anzeigen
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
            child.Size = UDim2.new(0.95, 0, 0, 32)
        end
    end
    showNotification("PC MODUS", "Tools bereit!", 1)
end)

MobileButton.MouseButton1Click:Connect(function()
    WelcomeFrame.Visible = false
    OpenButton.Visible = true
    for _, child in ipairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.Size = UDim2.new(0.95, 0, 0, 42)
        end
    end
    showNotification("MOBILE MODUS", "Tools bereit!", 1)
end)

-- Button Creator
local function createButton(text, color, callback, tabName)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.95, 0, 0, 32)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    btn.AutoButtonColor = false
    btn.BorderSizePixel = 0
    btn.Parent = ScrollingFrame
    btn.Visible = false
    btn:SetAttribute("Tab", tabName)
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 5)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    
    return btn
end

-- ========== ALLE TOOLS ==========

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

-- Infinite Yield
local function loadInfiniteYield()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
    showNotification("Infinite Yield", "Geladen!", 2)
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

-- Copy Game ID
local function copyGameID()
    setclipboard(tostring(game.PlaceId))
    showNotification("Game ID", "Kopiert!", 1)
end

-- ========== BUTTONS NACH TABS ==========

-- MAIN Tab
createButton("🛡️ GOD MODE", Color3.fromRGB(255, 215, 0), toggleGodMode, "MAIN")
createButton("🦅 FLY", Color3.fromRGB(100, 150, 255), toggleFly, "MAIN")
createButton("⚡ SPEED", Color3.fromRGB(0, 255, 0), speedHack, "MAIN")
createButton("🦘 JUMP", Color3.fromRGB(0, 200, 200), jumpHack, "MAIN")
createButton("🚪 NOCLIP", Color3.fromRGB(150, 0, 200), toggleNoclip, "MAIN")
createButton("🔄 INF JUMP", Color3.fromRGB(0, 255, 255), toggleInfJump, "MAIN")
createButton("🖱️ TP MOUSE", Color3.fromRGB(100, 0, 200), tpToMouse, "MAIN")
createButton("💧 WATER WALK", Color3.fromRGB(0, 100, 255), toggleWaterWalk, "MAIN")

-- MOVE Tab
createButton("🦅 FLY", Color3.fromRGB(100, 150, 255), toggleFly, "MOVE")
createButton("⚡ SPEED", Color3.fromRGB(0, 255, 0), speedHack, "MOVE")
createButton("🦘 JUMP", Color3.fromRGB(0, 200, 200), jumpHack, "MOVE")
createButton("🚪 NOCLIP", Color3.fromRGB(150, 0, 200), toggleNoclip, "MOVE")
createButton("🔄 INF JUMP", Color3.fromRGB(0, 255, 255), toggleInfJump, "MOVE")
createButton("🖱️ TP MOUSE", Color3.fromRGB(100, 0, 200), tpToMouse, "MOVE")
createButton("💧 WATER WALK", Color3.fromRGB(0, 100, 255), toggleWaterWalk, "MOVE")

-- COMBAT Tab
createButton("🎯 AIMBOT", Color3.fromRGB(255, 50, 50), toggleAimbot, "COMBAT")
createButton("💀 KILL AURA", Color3.fromRGB(255, 0, 0), toggleKillAura, "COMBAT")

-- VISUAL Tab
createButton("👁️ ESP", Color3.fromRGB(200, 0, 200), loadESP, "VISUAL")
createButton("☀️ FULLBRIGHT", Color3.fromRGB(255, 255, 0), fullbright, "VISUAL")
createButton("🩻 X-RAY", Color3.fromRGB(100, 255, 100), toggleXray, "VISUAL")

-- WORLD Tab
createButton("💣 TNT", Color3.fromRGB(255, 50, 0), createTNT, "WORLD")
createButton("🔄 GRAVITY GUN", Color3.fromRGB(0, 255, 255), toggleGravityGun, "WORLD")

-- ADMIN Tab
createButton("👑 ADMIN", Color3.fromRGB(255, 215, 0), unlockAdmin, "ADMIN")
createButton("💎 VIP", Color3.fromRGB(255, 200, 0), unlockVIP, "ADMIN")
createButton("⚡ INF YIELD", Color3.fromRGB(0, 200, 0), loadInfiniteYield, "ADMIN")

-- MISC Tab
createButton("💤 ANTI AFK", Color3.fromRGB(100, 100, 100), antiAFK, "MISC")
createButton("🔄 REJOIN", Color3.fromRGB(0, 100, 200), rejoin, "MISC")
createButton("🌍 SERVER HOP", Color3.fromRGB(200, 100, 0), serverHop, "MISC")
createButton("🔄 RESET", Color3.fromRGB(255, 50, 50), resetChar, "MISC")
createButton("📋 COPY ID", Color3.fromRGB(150, 150, 150), copyGameID, "MISC")

-- TOOLS Tab
createButton("📦 TOOLGIVER", Color3.fromRGB(0, 170, 255), toolgiver, "TOOLS")
createButton("🔍 SCANNER", Color3.fromRGB(255, 170, 0), scanner, "TOOLS")
createButton("💣 TNT", Color3.fromRGB(255, 50, 0), createTNT, "TOOLS")
createButton("🔄 GRAVITY GUN", Color3.fromRGB(0, 255, 255), toggleGravityGun, "TOOLS")

-- ========== TAB UMSCHALTUNG ==========
tabMain.MouseButton1Click:Connect(function() switchTab("MAIN") end)
tabMove.MouseButton1Click:Connect(function() switchTab("MOVE") end)
tabCombat.MouseButton1Click:Connect(function() switchTab("COMBAT") end)
tabVisual.MouseButton1Click:Connect(function() switchTab("VISUAL") end)
tabWorld.MouseButton1Click:Connect(function() switchTab("WORLD") end)
tabAdmin.MouseButton1Click:Connect(function() switchTab("ADMIN") end)
tabMisc.MouseButton1Click:Connect(function() switchTab("MISC") end)
tabTools.MouseButton1Click:Connect(function() switchTab("TOOLS") end)

-- MAIN Tab als Standard
switchTab("MAIN")

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
    if Frame.Size == UDim2.new(0, 380, 0, 480) then
        Frame.Size = UDim2.new(0, 380, 0, 35)
        ContentFrame.Visible = false
        TabFrame.Visible = false
        MinBtn.Text = "□"
    else
        Frame.Size = UDim2.new(0, 380, 0, 480)
        ContentFrame.Visible = true
        TabFrame.Visible = true
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
showNotification("HACKERTOOL V6", "Wähle PC/Mobile", 2)

print("✅ HACKERTOOL V6 GELADEN!")
print("📺 YouTube: @hacker666-00")

end)

if not success then
    warn("FEHLER: " .. tostring(err))
end
