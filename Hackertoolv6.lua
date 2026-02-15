--[[
    ULTIMATE ADMIN PANEL V3 - FIXED
    Made by Waled-hammad
    JEDER TAB FUNKTIONIERT MEHRMALS!
]]

local player = game:GetService("Players").LocalPlayer
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")
local teleportService = game:GetService("TeleportService")
local marketplaceService = game:GetService("MarketplaceService")
local httpService = game:GetService("HttpService")

-- GUI erstellen
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "WaledUltimateAdmin"
ScreenGui.Parent = player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 999999

-- ========== FLOATING BUTTON (PC/MOBILE AUSWAHL) ==========
local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Parent = ScreenGui
WelcomeFrame.Size = UDim2.new(0, 300, 0, 200)
WelcomeFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
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

local WelcomeTitle = Instance.new("TextLabel")
WelcomeTitle.Parent = WelcomeFrame
WelcomeTitle.Size = UDim2.new(1, 0, 0, 50)
WelcomeTitle.Position = UDim2.new(0, 0, 0, 10)
WelcomeTitle.BackgroundTransparency = 1
WelcomeTitle.Text = "⚡ WAHL DES GERÄTS ⚡"
WelcomeTitle.TextColor3 = Color3.fromRGB(0, 200, 255)
WelcomeTitle.Font = Enum.Font.GothamBold
WelcomeTitle.TextSize = 22

local PCButton = Instance.new("TextButton")
PCButton.Parent = WelcomeFrame
PCButton.Size = UDim2.new(0.8, 0, 0, 50)
PCButton.Position = UDim2.new(0.1, 0, 0.3, 0)
PCButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
PCButton.Text = "💻 PC MODUS"
PCButton.TextColor3 = Color3.new(1,1,1)
PCButton.Font = Enum.Font.GothamBold
PCButton.TextSize = 18

local PCCorner = Instance.new("UICorner")
PCCorner.CornerRadius = UDim.new(0, 10)
PCCorner.Parent = PCButton

local MobileButton = Instance.new("TextButton")
MobileButton.Parent = WelcomeFrame
MobileButton.Size = UDim2.new(0.8, 0, 0, 50)
MobileButton.Position = UDim2.new(0.1, 0, 0.55, 0)
MobileButton.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
MobileButton.Text = "📱 MOBILE MODUS"
MobileButton.TextColor3 = Color3.new(1,1,1)
MobileButton.Font = Enum.Font.GothamBold
MobileButton.TextSize = 18

local MobileCorner = Instance.new("UICorner")
MobileCorner.CornerRadius = UDim.new(0, 10)
MobileCorner.Parent = MobileButton

local WelcomeCredit = Instance.new("TextLabel")
WelcomeCredit.Parent = WelcomeFrame
WelcomeCredit.Size = UDim2.new(1, 0, 0, 30)
WelcomeCredit.Position = UDim2.new(0, 0, 1, -30)
WelcomeCredit.BackgroundTransparency = 1
WelcomeCredit.Text = "Made by Waled-hammad"
WelcomeCredit.TextColor3 = Color3.fromRGB(150, 150, 150)
WelcomeCredit.Font = Enum.Font.Gotham
WelcomeCredit.TextSize = 14

-- Floating Button (wird nach Auswahl aktiviert)
local OpenButton = Instance.new("TextButton")
OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0, 70, 0, 70)
OpenButton.Position = UDim2.new(0, 15, 0.5, -35)
OpenButton.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
OpenButton.Text = "⚡"
OpenButton.TextColor3 = Color3.new(1,1,1)
OpenButton.TextScaled = true
OpenButton.Font = Enum.Font.GothamBold
OpenButton.Name = "OpenButton"
OpenButton.Draggable = true
OpenButton.ZIndex = 9999
OpenButton.Visible = false

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(1, 0)
OpenCorner.Parent = OpenButton

-- Pulse Animation
spawn(function()
    while OpenButton do
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
Frame.Size = UDim2.new(0, 550, 0, 700)
Frame.Position = UDim2.new(0.5, -275, 0.5, -350)
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

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Parent = Frame
TitleBar.Size = UDim2.new(1, 0, 0, 60)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TitleBar.BorderSizePixel = 0

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 20)
TitleCorner.Parent = TitleBar

local TitleText = Instance.new("TextLabel")
TitleText.Parent = TitleBar
TitleText.Size = UDim2.new(1, -100, 1, 0)
TitleText.Position = UDim2.new(0, 20, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "⚡ ULTIMATE ADMIN V3 ⚡"
TitleText.TextColor3 = Color3.fromRGB(0, 200, 255)
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 24
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.Size = UDim2.new(0, 45, 0, 45)
CloseBtn.Position = UDim2.new(1, -55, 0, 7.5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 25

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 12)
CloseCorner.Parent = CloseBtn

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Parent = TitleBar
MinBtn.Size = UDim2.new(0, 45, 0, 45)
MinBtn.Position = UDim2.new(1, -110, 0, 7.5)
MinBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 255)
MinBtn.Text = "−"
MinBtn.TextColor3 = Color3.new(1,1,1)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 30

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 12)
MinCorner.Parent = MinBtn

-- Tabs
local TabFrame = Instance.new("Frame")
TabFrame.Parent = Frame
TabFrame.Size = UDim2.new(1, -20, 0, 50)
TabFrame.Position = UDim2.new(0, 10, 0, 70)
TabFrame.BackgroundTransparency = 1

-- Tab Buttons mit aktiver Hervorhebung
local tabs = {}
local activeTab = "CHEATS"

local function createTab(name, pos, color)
    local tab = Instance.new("TextButton")
    tab.Parent = TabFrame
    tab.Size = UDim2.new(0, 100, 0, 40)
    tab.Position = UDim2.new(0, pos, 0, 5)
    tab.BackgroundColor3 = color or Color3.fromRGB(30, 30, 40)
    tab.Text = name
    tab.TextColor3 = Color3.new(1,1,1)
    tab.Font = Enum.Font.GothamBold
    tab.TextSize = 16
    tab.Name = "Tab_" .. name
    
    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 10)
    tabCorner.Parent = tab
    
    tabs[name] = tab
    return tab
end

local tabCheats = createTab("CHEATS", 0, Color3.fromRGB(0, 100, 200))
local tabAdmin = createTab("ADMIN", 110)
local tabVIP = createTab("VIP", 220)
local tabTools = createTab("TOOLS", 330)
local tabAI = createTab("AI", 440)

-- Content Frame mit ScrollingFrame
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = Frame
ContentFrame.Size = UDim2.new(1, -20, 1, -160)
ContentFrame.Position = UDim2.new(0, 10, 0, 130)
ContentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
ContentFrame.BackgroundTransparency = 0.3

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

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 8)
ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ListLayout.Parent = ScrollingFrame

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 5)
Padding.PaddingBottom = UDim.new(0, 5)
Padding.Parent = ScrollingFrame

-- ========== FUNKTIONEN ==========

-- Tabs umschalten (funktioniert jetzt MEHRMALS!)
local function switchTab(tabName)
    activeTab = tabName
    
    -- Alle Buttons im ScrollingFrame ausblenden
    for _, child in ipairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.Visible = false
        end
        if child:IsA("Frame") then
            child.Visible = false
        end
    end
    
    -- Tab-Farben zurücksetzen
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
        if child:IsA("Frame") and child.Name == "AIFrame" then
            child.Visible = (tabName == "AI")
        end
    end
end

-- PC/Mobile Auswahl
PCButton.MouseButton1Click:Connect(function()
    WelcomeFrame.Visible = false
    OpenButton.Visible = true
    -- Größere Buttons für PC
    for _, child in ipairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.Size = UDim2.new(0.95, 0, 0, 55)
        end
    end
    player:Notify("PC MODUS", "GUI ist bereit! Klicke auf ⚡")
end)

MobileButton.MouseButton1Click:Connect(function()
    WelcomeFrame.Visible = false
    OpenButton.Visible = true
    -- Noch größere Buttons für Mobile
    for _, child in ipairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.Size = UDim2.new(0.95, 0, 0, 70)
        end
    end
    player:Notify("MOBILE MODUS", "GUI ist bereit! Tippe auf ⚡")
end)

-- Button Creator mit Attribut
local function createButton(text, color, callback, tabName)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.95, 0, 0, 55)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.AutoButtonColor = false
    btn.Parent = ScrollingFrame
    btn.Visible = false -- Startet unsichtbar
    btn:SetAttribute("Tab", tabName)
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 12)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    
    return btn
end

-- ========== ALLE FUNKTIONEN ==========

-- TNT Erstellen
local function createTNT()
    local mouse = player:GetMouse()
    local pos = mouse.Hit.p
    
    local tnt = Instance.new("Part")
    tnt.Size = Vector3.new(2, 2, 2)
    tnt.Position = pos + Vector3.new(0, 5, 0)
    tnt.BrickColor = BrickColor.new("Really red")
    tnt.Material = Enum.Material.Neon
    tnt.Parent = workspace
    
    local mesh = Instance.new("SpecialMesh")
    mesh.MeshType = Enum.MeshType.Brick
    mesh.Parent = tnt
    
    local attachment = Instance.new("Attachment")
    attachment.Parent = tnt
    
    local particle = Instance.new("ParticleEmitter")
    particle.Parent = attachment
    particle.Texture = "rbxasset://textures/particles/sparkles_main.dds"
    particle.Color = ColorSequence.new(Color3.fromRGB(255, 100, 0))
    particle.Lifetime = NumberRange.new(1)
    particle.Rate = 100
    
    local billboard = Instance.new("BillboardGui")
    billboard.Parent = tnt
    billboard.Size = UDim2.new(0, 50, 0, 20)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    
    local text = Instance.new("TextLabel")
    text.Parent = billboard
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = "💣 TNT"
    text.TextColor3 = Color3.fromRGB(255, 0, 0)
    text.TextScaled = true
    
    for i = 5, 0, -1 do
        text.Text = "💣 " .. i
        wait(1)
    end
    
    local explosion = Instance.new("Explosion")
    explosion.Position = tnt.Position
    explosion.BlastRadius = 20
    explosion.BlastPressure = 100000
    explosion.DestroyJointRadiusPercent = 1
    explosion.Parent = workspace
    
    tnt:Destroy()
    player:Notify("TNT", "BOOM! Explosion erstellt!")
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
        player:Notify("Aimbot", "AKTIVIERT!")
    else
        if aimbotConnection then
            aimbotConnection:Disconnect()
        end
        player:Notify("Aimbot", "DEAKTIVIERT")
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
    
    pcall(function()
        local args = { [1] = "CheckVIP", [2] = player }
        game:GetService("ReplicatedStorage"):FindFirstChild("VIPEvent"):FireServer(unpack(args))
    end)
    
    player:Notify("VIP", "VIP Status versucht freizuschalten!")
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
    
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
    
    player:Notify("Admin", "Admin Status versucht freizuschalten!")
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
        
        spawn(function()
            while infMoney do
                pcall(function()
                    local args = { [1] = "CollectMoney", [2] = 1000 }
                    game:GetService("ReplicatedStorage"):FindFirstChild("MoneyEvent"):FireServer(unpack(args))
                end)
                wait(1)
            end
        end)
        
        player:Notify("Money", "∞ UNENDLICH GELD AKTIV!")
    else
        player:Notify("Money", "Geld Modus deaktiviert")
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
    player:Notify("Scanner", count .. " verschiedene Tools gefunden!")
end

-- Fly
local function flyMode()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV2/main/FlyScript"))()
end

-- Noclip
local function noclipMode()
    loadstring(game:HttpGet("https://pastebin.com/raw/noclip"))()
end

-- Speed
local function speedHack()
    player.Character.Humanoid.WalkSpeed = 100
    player:Notify("Speed", "Speed auf 100 gesetzt!")
end

-- Infinite Jump
local function infiniteJump()
    loadstring(game:HttpGet("https://pastebin.com/raw/infjump"))()
end

-- ESP
local function espMode()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucas17052011/ESP/main/ESP%20Lucas"))()
end

-- God Mode
local function godMode()
    player.Character.Humanoid.MaxHealth = math.huge
    player.Character.Humanoid.Health = math.huge
    player:Notify("God Mode", "AKTIVIERT!")
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

-- AI Assistant
local function AIAssistant(query)
    if query:lower():find("tnt") then
        createTNT()
        return "✅ TNT wurde erstellt!"
    elseif query:lower():find("aimbot") then
        toggleAimbot()
        return "✅ Aimbot wurde umgeschaltet!"
    elseif query:lower():find("vip") then
        unlockVIP()
        return "✅ VIP freigeschaltet!"
    elseif query:lower():find("admin") then
        unlockAdmin()
        return "✅ Admin freigeschaltet!"
    elseif query:lower():find("money") then
        toggleMoney()
        return "✅ Geld Modus umgeschaltet!"
    elseif query:lower():find("fly") then
        flyMode()
        return "✅ Fly Modus aktiviert!"
    elseif query:lower():find("speed") then
        speedHack()
        return "✅ Speed erhöht!"
    else
        return "❌ Befehl nicht erkannt. Versuche: TNT, Aimbot, VIP, Admin, Money, Fly, Speed"
    end
end

-- ========== BUTTONS ERSTELLEN ==========

-- CHEATS Tab
createButton("🎯 AIMBOT", Color3.fromRGB(255, 50, 50), toggleAimbot, "CHEATS")
createButton("💰 UNENDLICH GELD", Color3.fromRGB(255, 200, 0), toggleMoney, "CHEATS")
createButton("💣 TNT ERSTELLEN", Color3.fromRGB(255, 100, 0), createTNT, "CHEATS")
createButton("🦅 FLY MODE", Color3.fromRGB(100, 100, 255), flyMode, "CHEATS")
createButton("🚪 NOCLIP", Color3.fromRGB(150, 0, 150), noclipMode, "CHEATS")
createButton("⚡ SPEED HACK", Color3.fromRGB(0, 255, 0), speedHack, "CHEATS")
createButton("🦘 INFINITE JUMP", Color3.fromRGB(0, 200, 200), infiniteJump, "CHEATS")
createButton("👁️ ESP", Color3.fromRGB(200, 0, 200), espMode, "CHEATS")
createButton("🛡️ GOD MODE", Color3.fromRGB(255, 0, 0), godMode, "CHEATS")

-- ADMIN Tab
createButton("👑 ADMIN UNLOCK", Color3.fromRGB(255, 215, 0), unlockAdmin, "ADMIN")
createButton("🔧 INFINITE YIELD", Color3.fromRGB(0, 170, 255), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end, "ADMIN")
createButton("🔨 F3X ADMIN", Color3.fromRGB(0, 200, 0), function()
    loadstring(game:HttpGet("https://pastebin.com/raw/f3x"))()
end, "ADMIN")
createButton("📋 TOOLGIVER", Color3.fromRGB(0, 170, 255), giveTools, "ADMIN")
createButton("🔍 SCANNER", Color3.fromRGB(255, 170, 0), scanTools, "ADMIN")

-- VIP Tab
createButton("💎 VIP UNLOCK", Color3.fromRGB(255, 215, 0), unlockVIP, "VIP")
createButton("✨ VIP EFFECTS", Color3.fromRGB(255, 100, 255), function()
    local char = player.Character
    if char then
        local attachment = Instance.new("Attachment")
        attachment.Parent = char.HumanoidRootPart
        
        local particles = Instance.new("ParticleEmitter")
        particles.Parent = attachment
        particles.Texture = "rbxasset://textures/particles/sparkles_main.dds"
        particles.Color = ColorSequence.new(Color3.fromRGB(255, 215, 0))
        particles.Lifetime = NumberRange.new(2)
        particles.Rate = 50
    end
end, "VIP")
createButton("🌈 RAINBOW NAME", Color3.fromRGB(255, 0, 255), function()
    spawn(function()
        while wait(0.1) do
            pcall(function()
                player.Character.Head.BrickColor = BrickColor.random()
            end)
        end
    end)
end, "VIP")
createButton("👑 TRAIL", Color3.fromRGB(0, 255, 255), function()
    loadstring(game:HttpGet("https://pastebin.com/raw/trail"))()
end, "VIP")

-- TOOLS Tab
createButton("🎯 AIMBOT TOGGLE", Color3.fromRGB(255, 50, 50), toggleAimbot, "TOOLS")
createButton("💣 TNT MAKER", Color3.fromRGB(255, 100, 0), createTNT, "TOOLS")
createButton("💰 MONEY TOGGLE", Color3.fromRGB(255, 200, 0), toggleMoney, "TOOLS")
createButton("🔄 REJOIN", Color3.fromRGB(100, 100, 100), rejoin, "TOOLS")
createButton("🌍 SERVER HOP", Color3.fromRGB(50, 50, 150), serverHop, "TOOLS")
createButton("🔄 RESET CHAR", Color3.fromRGB(150, 50, 50), resetChar, "TOOLS")
createButton("🎨 DESIGN CHANGE", Color3.fromRGB(200, 100, 200), function()
    TitleText.TextColor3 = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
end, "TOOLS")

-- AI Tab (spezielles Frame)
local AIFrame = Instance.new("Frame")
AIFrame.Name = "AIFrame"
AIFrame.Parent = ScrollingFrame
AIFrame.Size = UDim2.new(0.95, 0, 0, 200)
AIFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
AIFrame.BackgroundTransparency = 0.5
AIFrame.Visible = false
AIFrame:SetAttribute("Tab", "AI")

local AICorner = Instance.new("UICorner")
AICorner.CornerRadius = UDim.new(0, 12)
AICorner.Parent = AIFrame

local AITitle = Instance.new("TextLabel")
AITitle.Parent = AIFrame
AITitle.Size = UDim2.new(1, 0, 0, 30)
AITitle.Position = UDim2.new(0, 0, 0, 5)
AITitle.BackgroundTransparency = 1
AITitle.Text = "🤖 AI ASSISTANT"
AITitle.TextColor3 = Color3.fromRGB(0, 200, 255)
AITitle.Font = Enum.Font.GothamBold
AITitle.TextSize = 20

local AIInput = Instance.new("TextBox")
AIInput.Parent = AIFrame
AIInput.Size = UDim2.new(1, -20, 0, 50)
AIInput.Position = UDim2.new(0, 10, 0, 40)
AIInput.PlaceholderText = "Was willst du tun? (TNT, Aimbot, VIP, Admin, Money, Fly, Speed)"
AIInput.Text = ""
AIInput.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
AIInput.TextColor3 = Color3.new(1,1,1)
AIInput.Font = Enum.Font.Gotham
AIInput.TextSize = 16
AIInput.ClearTextOnFocus = false

local AIInputCorner = Instance.new("UICorner")
AIInputCorner.CornerRadius = UDim.new(0, 8)
AIInputCorner.Parent = AIInput

local AISubmit = Instance.new("TextButton")
AISubmit.Parent = AIFrame
AISubmit.Size = UDim2.new(1, -20, 0, 50)
AISubmit.Position = UDim2.new(0, 10, 0, 100)
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
AIResult.Size = UDim2.new(1, -20, 0, 30)
AIResult.Position = UDim2.new(0, 10, 0, 160)
AIResult.BackgroundTransparency = 1
AIResult.Text = "👆 Frag mich etwas!"
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

-- Standardmäßig CHEATS Tab anzeigen
switchTab("CHEATS")

-- ========== OPEN/CLOSE FUNKTIONEN ==========

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
        Frame.Size = UDim2.new(0, 550, 0, 70)
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
    frame.Size = UDim2.new(0, 300, 0, 70)
    frame.Position = UDim2.new(1, -310, 1, -80)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    frame.BackgroundTransparency = 0.2
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
    
    task.wait(3)
    notif:Destroy()
end

print("✅ ULTIMATE ADMIN V3 geladen! Wähle PC oder Mobile aus!")
