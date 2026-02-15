--[[
    ULTIMATE HACKER TOOL V7 - KOMPLETT REPARIERT
    Made by Waled-hammad
    YouTube: @hacker666-00
    ALLES IST SICHTBAR - GARANTIERT!
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

-- GUI erstellen - MEHRERE PARENT OPTIONEN
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "WaledUltimateHackerV7"

-- Versuche verschiedene Parents
local parentOptions = {
    player:FindFirstChild("PlayerGui"),
    player:FindFirstChild("Backpack"),
    game:GetService("CoreGui")
}

for _, parent in ipairs(parentOptions) do
    if parent then
        ScreenGui.Parent = parent
        break
    end
end

-- Falls nichts gefunden, erstelle PlayerGui
if not ScreenGui.Parent then
    local playerGui = Instance.new("PlayerGui")
    playerGui.Parent = player
    ScreenGui.Parent = playerGui
end

ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 999999
ScreenGui.Enabled = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ========== FPS ANZEIGE (IMMER SICHTBAR) ==========
local FPSFrame = Instance.new("Frame")
FPSFrame.Parent = ScreenGui
FPSFrame.Size = UDim2.new(0, 120, 0, 40)
FPSFrame.Position = UDim2.new(1, -130, 0, 10)
FPSFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FPSFrame.BackgroundTransparency = 0
FPSFrame.BorderSizePixel = 0
FPSFrame.ZIndex = 10000
FPSFrame.Visible = true

local FPSCorner = Instance.new("UICorner")
FPSCorner.CornerRadius = UDim.new(0, 10)
FPSCorner.Parent = FPSFrame

local FPSText = Instance.new("TextLabel")
FPSText.Parent = FPSFrame
FPSText.Size = UDim2.new(1, 0, 1, 0)
FPSText.BackgroundTransparency = 1
FPSText.Text = "FPS: 60"
FPSText.TextColor3 = Color3.fromRGB(0, 255, 0)
FPSText.Font = Enum.Font.GothamBold
FPSText.TextSize = 20
FPSText.ZIndex = 10001
FPSText.Visible = true

-- FPS aktualisieren
spawn(function()
    while FPSFrame and FPSFrame.Parent do
        local fps = math.floor(1 / runService.RenderStepped:Wait())
        FPSText.Text = "FPS: " .. fps
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

-- ========== WILLKOMMENSFRAME (PC/MOBILE AUSWAHL) ==========
local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Parent = ScreenGui
WelcomeFrame.Size = UDim2.new(0, 450, 0, 350)
WelcomeFrame.Position = UDim2.new(0.5, -225, 0.5, -175)
WelcomeFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
WelcomeFrame.BackgroundTransparency = 0
WelcomeFrame.BorderSizePixel = 0
WelcomeFrame.Visible = true
WelcomeFrame.ZIndex = 10000
WelcomeFrame.Active = true
WelcomeFrame.Draggable = true

local WelcomeCorner = Instance.new("UICorner")
WelcomeCorner.CornerRadius = UDim.new(0, 20)
WelcomeCorner.Parent = WelcomeFrame

-- YouTube Button
local YTButton = Instance.new("TextButton")
YTButton.Parent = WelcomeFrame
YTButton.Size = UDim2.new(0.9, 0, 0, 50)
YTButton.Position = UDim2.new(0.05, 0, 0.05, 0)
YTButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
YTButton.Text = "📺 YOUTUBE: @hacker666-00"
YTButton.TextColor3 = Color3.new(1,1,1)
YTButton.Font = Enum.Font.GothamBold
YTButton.TextSize = 20
YTButton.BorderSizePixel = 0
YTButton.Visible = true

local YTCorner = Instance.new("UICorner")
YTCorner.CornerRadius = UDim.new(0, 10)
YTCorner.Parent = YTButton

YTButton.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00?si=9nPd1Y9rHP7Yz3vz")
    player:Notify("YouTube", "Link kopiert! Besuche meinen Kanal!")
end)

-- Titel
local WelcomeTitle = Instance.new("TextLabel")
WelcomeTitle.Parent = WelcomeFrame
WelcomeTitle.Size = UDim2.new(1, 0, 0, 50)
WelcomeTitle.Position = UDim2.new(0, 0, 0, 70)
WelcomeTitle.BackgroundTransparency = 1
WelcomeTitle.Text = "⚡ GERÄT AUSWÄHLEN ⚡"
WelcomeTitle.TextColor3 = Color3.fromRGB(0, 200, 255)
WelcomeTitle.Font = Enum.Font.GothamBold
WelcomeTitle.TextSize = 26
WelcomeTitle.Visible = true

-- PC Button
local PCButton = Instance.new("TextButton")
PCButton.Parent = WelcomeFrame
PCButton.Size = UDim2.new(0.8, 0, 0, 70)
PCButton.Position = UDim2.new(0.1, 0, 0.3, 0)
PCButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
PCButton.Text = "💻 PC MODUS"
PCButton.TextColor3 = Color3.new(1,1,1)
PCButton.Font = Enum.Font.GothamBold
PCButton.TextSize = 24
PCButton.BorderSizePixel = 0
PCButton.Visible = true

local PCCorner = Instance.new("UICorner")
PCCorner.CornerRadius = UDim.new(0, 15)
PCCorner.Parent = PCButton

-- Mobile Button
local MobileButton = Instance.new("TextButton")
MobileButton.Parent = WelcomeFrame
MobileButton.Size = UDim2.new(0.8, 0, 0, 70)
MobileButton.Position = UDim2.new(0.1, 0, 0.5, 0)
MobileButton.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
MobileButton.Text = "📱 MOBILE MODUS"
MobileButton.TextColor3 = Color3.new(1,1,1)
MobileButton.Font = Enum.Font.GothamBold
MobileButton.TextSize = 24
MobileButton.BorderSizePixel = 0
MobileButton.Visible = true

local MobileCorner = Instance.new("UICorner")
MobileCorner.CornerRadius = UDim.new(0, 15)
MobileCorner.Parent = MobileButton

-- Timer ein/aus Button
local TimerToggle = Instance.new("TextButton")
TimerToggle.Parent = WelcomeFrame
TimerToggle.Size = UDim2.new(0.8, 0, 0, 50)
TimerToggle.Position = UDim2.new(0.1, 0, 0.7, 0)
TimerToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
TimerToggle.Text = "⏱️ TIMER: AN"
TimerToggle.TextColor3 = Color3.new(1,1,1)
TimerToggle.Font = Enum.Font.GothamBold
TimerToggle.TextSize = 22
TimerToggle.BorderSizePixel = 0
TimerToggle.Visible = true

local TimerCorner = Instance.new("UICorner")
TimerCorner.CornerRadius = UDim.new(0, 12)
TimerCorner.Parent = TimerToggle

local timerEnabled = true
TimerToggle.MouseButton1Click:Connect(function()
    timerEnabled = not timerEnabled
    TimerToggle.Text = timerEnabled and "⏱️ TIMER: AN" or "⏱️ TIMER: AUS"
end)

local WelcomeCredit = Instance.new("TextLabel")
WelcomeCredit.Parent = WelcomeFrame
WelcomeCredit.Size = UDim2.new(1, 0, 0, 30)
WelcomeCredit.Position = UDim2.new(0, 0, 1, -30)
WelcomeCredit.BackgroundTransparency = 1
WelcomeCredit.Text = "Made by Waled-hammad • YouTube: @hacker666-00"
WelcomeCredit.TextColor3 = Color3.fromRGB(150, 150, 150)
WelcomeCredit.Font = Enum.Font.Gotham
WelcomeCredit.TextSize = 16
WelcomeCredit.Visible = true

-- ========== FLOATING BUTTON ==========
local OpenButton = Instance.new("TextButton")
OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0, 80, 0, 80)
OpenButton.Position = UDim2.new(0, 20, 0.5, -40)
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
Frame.Size = UDim2.new(0, 650, 0, 800)
Frame.Position = UDim2.new(0.5, -325, 0.5, -400)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
Frame.Visible = false
Frame.Draggable = true
Frame.Active = true
Frame.BackgroundTransparency = 0
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 20)
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
TitleBar.Size = UDim2.new(1, 0, 0, 70)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TitleBar.BorderSizePixel = 0
TitleBar.Visible = true

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 20)
TitleCorner.Parent = TitleBar

-- YouTube Button im Titel
local TitleYT = Instance.new("TextButton")
TitleYT.Parent = TitleBar
TitleYT.Size = UDim2.new(0, 40, 0, 40)
TitleYT.Position = UDim2.new(0, 15, 0, 15)
TitleYT.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TitleYT.Text = "▶"
TitleYT.TextColor3 = Color3.new(1,1,1)
TitleYT.Font = Enum.Font.GothamBold
TitleYT.TextSize = 24
TitleYT.BorderSizePixel = 0
TitleYT.Visible = true

local TitleYTCorner = Instance.new("UICorner")
TitleYTCorner.CornerRadius = UDim.new(0, 10)
TitleYTCorner.Parent = TitleYT

TitleYT.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00?si=9nPd1Y9rHP7Yz3vz")
    player:Notify("YouTube", "Kanal-Link kopiert!")
end)

local TitleText = Instance.new("TextLabel")
TitleText.Parent = TitleBar
TitleText.Size = UDim2.new(1, -200, 1, 0)
TitleText.Position = UDim2.new(0, 65, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "⚡ HACKER TOOL V7 ⚡"
TitleText.TextColor3 = Color3.fromRGB(0, 200, 255)
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 28
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Visible = true

-- Color Picker Button
local ColorBtn = Instance.new("TextButton")
ColorBtn.Parent = TitleBar
ColorBtn.Size = UDim2.new(0, 40, 0, 40)
ColorBtn.Position = UDim2.new(1, -130, 0, 15)
ColorBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
ColorBtn.Text = "🎨"
ColorBtn.TextColor3 = Color3.new(1,1,1)
ColorBtn.Font = Enum.Font.GothamBold
ColorBtn.TextSize = 24
ColorBtn.BorderSizePixel = 0
ColorBtn.Visible = true

local ColorCorner = Instance.new("UICorner")
ColorCorner.CornerRadius = UDim.new(0, 10)
ColorCorner.Parent = ColorBtn

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Parent = TitleBar
MinBtn.Size = UDim2.new(0, 45, 0, 45)
MinBtn.Position = UDim2.new(1, -80, 0, 12.5)
MinBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 255)
MinBtn.Text = "−"
MinBtn.TextColor3 = Color3.new(1,1,1)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 35
MinBtn.BorderSizePixel = 0
MinBtn.Visible = true

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 12)
MinCorner.Parent = MinBtn

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.Size = UDim2.new(0, 45, 0, 45)
CloseBtn.Position = UDim2.new(1, -30, 0, 12.5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 30
CloseBtn.BorderSizePixel = 0
CloseBtn.Visible = true

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 12)
CloseCorner.Parent = CloseBtn

-- Tabs
local TabFrame = Instance.new("Frame")
TabFrame.Parent = Frame
TabFrame.Size = UDim2.new(1, -20, 0, 70)
TabFrame.Position = UDim2.new(0, 10, 0, 80)
TabFrame.BackgroundTransparency = 1
TabFrame.Visible = true

local tabs = {}
local activeTab = "CHEATS"

local function createTab(name, pos)
    local tab = Instance.new("TextButton")
    tab.Parent = TabFrame
    tab.Size = UDim2.new(0, 120, 0, 50)
    tab.Position = UDim2.new(0, pos, 0, 10)
    tab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    tab.Text = name
    tab.TextColor3 = Color3.new(1,1,1)
    tab.Font = Enum.Font.GothamBold
    tab.TextSize = 20
    tab.BorderSizePixel = 0
    tab.Visible = true

    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 12)
    tabCorner.Parent = tab

    tabs[name] = tab
    return tab
end

local tabCheats = createTab("⚡ CHEATS", 0)
local tabAdmin = createTab("👑 ADMIN", 130)
local tabVIP = createTab("💎 VIP", 260)
local tabTools = createTab("🔧 TOOLS", 390)
local tabAI = createTab("🤖 AI", 520)

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = Frame
ContentFrame.Size = UDim2.new(1, -20, 1, -200)
ContentFrame.Position = UDim2.new(0, 10, 0, 160)
ContentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
ContentFrame.BackgroundTransparency = 0.2
ContentFrame.Visible = true

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 15)
ContentCorner.Parent = ContentFrame

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Parent = ContentFrame
ScrollingFrame.Size = UDim2.new(1, -20, 1, -20)
ScrollingFrame.Position = UDim2.new(0, 10, 0, 10)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.ScrollBarThickness = 8
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 200, 255)
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.Visible = true

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 8)
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
            child.Size = UDim2.new(0.95, 0, 0, 60)
        end
    end
    player:Notify("PC MODUS", "GUI ist bereit! Klicke auf ⚡")
end)

MobileButton.MouseButton1Click:Connect(function()
    WelcomeFrame.Visible = false
    OpenButton.Visible = true
    for _, child in ipairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.Size = UDim2.new(0.95, 0, 0, 80)
        end
    end
    player:Notify("MOBILE MODUS", "GUI ist bereit! Tippe auf ⚡")
end)

-- Button Creator
local function createButton(text, color, callback, tabName)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.95, 0, 0, 60)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 20
    btn.AutoButtonColor = false
    btn.BorderSizePixel = 0
    btn.Parent = ScrollingFrame
    btn.Visible = false
    btn:SetAttribute("Tab", tabName)
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 12)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    
    return btn
end

-- ========== ALLE FUNKTIONEN ==========

-- TNT
local function createTNT()
    local mouse = player:GetMouse()
    local pos = mouse.Hit.p
    
    local tnt = Instance.new("Part")
    tnt.Size = Vector3.new(3, 3, 3)
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
    explosion.BlastRadius = 25
    explosion.BlastPressure = 100000
    explosion.Parent = workspace
    tnt:Destroy()
    player:Notify("TNT", "BOOM!")
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
        player:Notify("Aimbot", "AN")
    else
        if aimbotConnection then
            aimbotConnection:Disconnect()
        end
        player:Notify("Aimbot", "AUS")
    end
end

-- VIP Unlock
local function unlockVIP()
    for _, v in ipairs(player:GetDescendants()) do
        if v:IsA("BoolValue") and (v.Name:lower():find("vip") or v.Name:lower():find("premium")) then
            v.Value = true
        end
        if v:IsA("NumberValue") and (v.Name:lower():find("vip") or v.Name:lower():find("rank")) then
            v.Value = 999
        end
    end
    player:Notify("VIP", "VIP freigeschaltet!")
end

-- Admin Unlock
local function unlockAdmin()
    for _, v in ipairs(player:GetDescendants()) do
        if v:IsA("BoolValue") and (v.Name:lower():find("admin") or v.Name:lower():find("mod")) then
            v.Value = true
        end
        if v:IsA("NumberValue") and (v.Name:lower():find("admin") or v.Name:lower():find("rank")) then
            v.Value = 999
        end
    end
    player:Notify("Admin", "Admin freigeschaltet!")
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
        player:Notify("Money", "∞ GELD AN")
    else
        player:Notify("Money", "Geld Modus AUS")
    end
end

-- Toolgiver
local function giveTools()
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
    player:Notify("Toolgiver", count .. " Tools erhalten!")
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
    player:Notify("Scanner", count .. " Tools gefunden!")
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
                    local moveDir = char.Humanoid.MoveDirection
                    bv.Velocity = moveDir * 100
                end)
            end
        end
        player:Notify("Fly", "AN")
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
        player:Notify("Fly", "AUS")
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
        player:Notify("Noclip", "AN")
    else
        if noclipConnection then
            noclipConnection:Disconnect()
        end
        player:Notify("Noclip", "AUS")
    end
end

-- Speed
local function speedHack()
    if player.Character then
        player.Character.Humanoid.WalkSpeed = 100
        player:Notify("Speed", "Speed = 100")
    end
end

-- Infinite Jump
local infJumpEnabled = false
local jumpConnection

local function toggleInfJump()
    infJumpEnabled = not infJumpEnabled
    
    if infJumpEnabled then
        jumpConnection = userInputService.JumpRequest:Connect(function()
            if player.Character then
                player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
        player:Notify("Inf Jump", "AN")
    else
        if jumpConnection then
            jumpConnection:Disconnect()
        end
        player:Notify("Inf Jump", "AUS")
    end
end

-- ESP
local function toggleESP()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucas17052011/ESP/main/ESP%20Lucas"))()
    player:Notify("ESP", "Geladen!")
end

-- God Mode
local function godMode()
    if player.Character then
        player.Character.Humanoid.MaxHealth = math.huge
        player.Character.Humanoid.Health = math.huge
        player:Notify("God Mode", "AKTIVIERT!")
    end
end

-- Rejoin
local function rejoin()
    teleportService:Teleport(game.PlaceId, player)
end

-- Server Hop
local function serverHop()
    local servers = httpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100")).data
    for _, v in ipairs(servers) do
        if v.playing < v.maxPlayers then
            teleportService:TeleportToPlaceInstance(game.PlaceId, v.id, player)
            break
        end
    end
end

-- Reset Character
local function resetChar()
    player.Character:BreakJoints()
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
    player:Notify("Farbe", "Geändert!")
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
    else
        return "❓ Unbekannt. Versuche: TNT, Aimbot, VIP, Admin, Money, Fly, Speed, Noclip, Jump"
    end
end

-- ========== BUTTONS ERSTELLEN ==========

-- CHEATS Tab
createButton("🎯 AIMBOT", Color3.fromRGB(255, 50, 50), toggleAimbot, "⚡ CHEATS")
createButton("💰 UNENDLICH GELD", Color3.fromRGB(255, 200, 0), toggleMoney, "⚡ CHEATS")
createButton("💣 TNT", Color3.fromRGB(255, 100, 0), createTNT, "⚡ CHEATS")
createButton("🦅 FLY", Color3.fromRGB(100, 100, 255), toggleFly, "⚡ CHEATS")
createButton("🚪 NOCLIP", Color3.fromRGB(150, 0, 150), toggleNoclip, "⚡ CHEATS")
createButton("⚡ SPEED", Color3.fromRGB(0, 255, 0), speedHack, "⚡ CHEATS")
createButton("🦘 INF JUMP", Color3.fromRGB(0, 200, 200), toggleInfJump, "⚡ CHEATS")
createButton("👁️ ESP", Color3.fromRGB(200, 0, 200), toggleESP, "⚡ CHEATS")
createButton("🛡️ GOD MODE", Color3.fromRGB(255, 0, 0), godMode, "⚡ CHEATS")

-- ADMIN Tab
createButton("👑 ADMIN UNLOCK", Color3.fromRGB(255, 215, 0), unlockAdmin, "👑 ADMIN")
createButton("📋 TOOLGIVER", Color3.fromRGB(0, 170, 255), giveTools, "👑 ADMIN")
createButton("🔍 SCANNER", Color3.fromRGB(255, 170, 0), scanTools, "👑 ADMIN")
createButton("🔧 INF YIELD", Color3.fromRGB(0, 200, 0), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end, "👑 ADMIN")

-- VIP Tab
createButton("💎 VIP UNLOCK", Color3.fromRGB(255, 215, 0), unlockVIP, "💎 VIP")
createButton("✨ VIP EFFECTS", Color3.fromRGB(255, 100, 255), function()
    local char = player.Character
    if char then
        local attach = Instance.new("Attachment")
        attach.Parent = char.HumanoidRootPart
        local particles = Instance.new("ParticleEmitter")
        particles.Parent = attach
        particles.Texture = "rbxasset://textures/particles/sparkles_main.dds"
        particles.Color = ColorSequence.new(Color3.fromRGB(255, 215, 0))
        particles.Rate = 50
    end
end, "💎 VIP")
createButton("🌈 RAINBOW", Color3.fromRGB(255, 0, 255), function()
    spawn(function()
        while wait(0.1) do
            pcall(function() player.Character.Head.BrickColor = BrickColor.random() end)
        end
    end)
end, "💎 VIP")

-- TOOLS Tab
createButton("🎯 AIMBOT", Color3.fromRGB(255, 50, 50), toggleAimbot, "🔧 TOOLS")
createButton("💣 TNT", Color3.fromRGB(255, 100, 0), createTNT, "🔧 TOOLS")
createButton("💰 MONEY", Color3.fromRGB(255, 200, 0), toggleMoney, "🔧 TOOLS")
createButton("🔄 REJOIN", Color3.fromRGB(100, 100, 100), rejoin, "🔧 TOOLS")
createButton("🌍 SERVER HOP", Color3.fromRGB(50, 50, 150), serverHop, "🔧 TOOLS")
createButton("🔄 RESET", Color3.fromRGB(150, 50, 50), resetChar, "🔧 TOOLS")
createButton("🎨 FARBE", Color3.fromRGB(200, 100, 200), changeColor, "🔧 TOOLS")

-- AI Tab
local AIFrame = Instance.new("Frame")
AIFrame.Name = "AIFrame"
AIFrame.Parent = ScrollingFrame
AIFrame.Size = UDim2.new(0.95, 0, 0, 300)
AIFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
AIFrame.BackgroundTransparency = 0
AIFrame.Visible = false
AIFrame:SetAttribute("Tab", "🤖 AI")

local AICorner = Instance.new("UICorner")
AICorner.CornerRadius = UDim.new(0, 15)
AICorner.Parent = AIFrame

local AITitle = Instance.new("TextLabel")
AITitle.Parent = AIFrame
AITitle.Size = UDim2.new(1, 0, 0, 50)
AITitle.Position = UDim2.new(0, 0, 0, 10)
AITitle.BackgroundTransparency = 1
AITitle.Text = "🤖 AI ASSISTANT"
AITitle.TextColor3 = Color3.fromRGB(0, 200, 255)
AITitle.Font = Enum.Font.GothamBold
AITitle.TextSize = 26

local AIInput = Instance.new("TextBox")
AIInput.Parent = AIFrame
AIInput.Size = UDim2.new(1, -20, 0, 70)
AIInput.Position = UDim2.new(0, 10, 0, 70)
AIInput.PlaceholderText = "Befehl eingeben (z.B. TNT, Aimbot, VIP)..."
AIInput.Text = ""
AIInput.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
AIInput.TextColor3 = Color3.new(1,1,1)
AIInput.Font = Enum.Font.Gotham
AIInput.TextSize = 20

local AIInputCorner = Instance.new("UICorner")
AIInputCorner.CornerRadius = UDim.new(0, 10)
AIInputCorner.Parent = AIInput

local AISubmit = Instance.new("TextButton")
AISubmit.Parent = AIFrame
AISubmit.Size = UDim2.new(1, -20, 0, 70)
AISubmit.Position = UDim2.new(0, 10, 0, 150)
AISubmit.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
AISubmit.Text = "AUSFÜHREN"
AISubmit.TextColor3 = Color3.new(1,1,1)
AISubmit.Font = Enum.Font.GothamBold
AISubmit.TextSize = 24

local AISubmitCorner = Instance.new("UICorner")
AISubmitCorner.CornerRadius = UDim.new(0, 12)
AISubmitCorner.Parent = AISubmit

local AIResult = Instance.new("TextLabel")
AIResult.Parent = AIFrame
AIResult.Size = UDim2.new(1, -20, 0, 50)
AIResult.Position = UDim2.new(0, 10, 0, 230)
AIResult.BackgroundTransparency = 1
AIResult.Text = "👆 Gib einen Befehl ein!"
AIResult.TextColor3 = Color3.fromRGB(200, 200, 200)
AIResult.Font = Enum.Font.Gotham
AIResult.TextSize = 18
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
    if Frame.Size == UDim2.new(0, 650, 0, 800) then
        Frame.Size = UDim2.new(0, 650, 0, 70)
        ContentFrame.Visible = false
        TabFrame.Visible = false
        MinBtn.Text = "□"
    else
        Frame.Size = UDim2.new(0, 650, 0, 800)
        ContentFrame.Visible = true
        TabFrame.Visible = true
        MinBtn.Text = "−"
    end
end)

ColorBtn.MouseButton1Click:Connect(changeColor)

-- Drag Funktion
local dragging = false
local dragStart, startPos

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

-- Notification System
function player:Notify(title, text)
    local notif = Instance.new("ScreenGui")
    notif.Parent = player.PlayerGui
    notif.IgnoreGuiInset = true
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 350, 0, 80)
    frame.Position = UDim2.new(1, -360, 1, -90)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    frame.BackgroundTransparency = 0.1
    frame.Parent = notif
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = frame
    
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, -10, 0, 30)
    t.Position = UDim2.new(0, 5, 0, 5)
    t.BackgroundTransparency = 1
    t.Text = title
    t.TextColor3 = Color3.fromRGB(0, 200, 255)
    t.Font = Enum.Font.GothamBold
    t.TextSize = 22
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.Parent = frame
    
    local tx = Instance.new("TextLabel")
    tx.Size = UDim2.new(1, -10, 0, 30)
    tx.Position = UDim2.new(0, 5, 0, 35)
    tx.BackgroundTransparency = 1
    tx.Text = text
    tx.TextColor3 = Color3.new(1,1,1)
    tx.Font = Enum.Font.Gotham
    tx.TextSize = 20
    tx.TextXAlignment = Enum.TextXAlignment.Left
    tx.Parent = frame
    
    task.wait(3)
    notif:Destroy()
end

-- Alles sichtbar machen
WelcomeFrame.Visible = true
FPSFrame.Visible = true

print("✅ ULTIMATE HACKER TOOL V7 GELADEN!")
print("📺 YouTube: @hacker666-00")
player:Notify("ULTIMATE TOOL V7", "Willkommen! Wähle PC oder Mobile!")

end)

if not success then
    warn("FEHLER: " .. tostring(err))
    -- Zeige Fehler an
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
