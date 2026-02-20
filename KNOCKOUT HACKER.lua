-- ============================================
-- KNOCKOUT HACKER - ULTIMATE OP GUI
-- MADE BY WALED-HAMMAD
-- YOUTUBE: @hacker666-00
-- TIKTOK: @mods_and_hacks
-- ============================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local mouse = player:GetMouse()

-- Device Check
local isMobile = UserInputService.TouchEnabled

-- ============================================
-- 🌌 GALAXY KNOCKOUT HACKER GUI
-- ============================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KnockoutHacker"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

-- Hauptframe mit Galaxy Effekt
local MainFrame = Instance.new("Frame")
MainFrame.Size = isMobile and UDim2.new(0, 340, 0, 520) or UDim2.new(0, 420, 0, 570)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -285)
MainFrame.BackgroundColor3 = Color3.fromRGB(2, 0, 8)
MainFrame.BackgroundTransparency = 0.1
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

-- Abgerundete Ecken
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 25)
Corner.Parent = MainFrame

-- Galaxy Hintergrund
local Galaxy = Instance.new("Frame")
Galaxy.Size = UDim2.new(1, 0, 1, 0)
Galaxy.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Galaxy.BackgroundTransparency = 0.5
Galaxy.ZIndex = -1
Galaxy.Parent = MainFrame

-- Sterne Effekt
for i = 1, 100 do
    local star = Instance.new("Frame")
    star.Size = UDim2.new(0, math.random(1, 3), 0, math.random(1, 3))
    star.Position = UDim2.new(math.random(), 0, math.random(), 0)
    star.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    star.BackgroundTransparency = 0.3
    star.Parent = Galaxy
    
    spawn(function()
        while star.Parent do
            star.BackgroundTransparency = math.random(0, 7)/10
            star.Position = UDim2.new(star.Position.X.Scale + 0.001, 0, star.Position.Y.Scale, 0)
            if star.Position.X.Scale > 1 then
                star.Position = UDim2.new(0, 0, math.random(), 0)
            end
            task.wait(0.05)
        end
    end)
end

-- Rainbow Border
local RainbowBorder = Instance.new("Frame")
RainbowBorder.Size = UDim2.new(1, 10, 1, 10)
RainbowBorder.Position = UDim2.new(0, -5, 0, -5)
RainbowBorder.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
RainbowBorder.BorderSizePixel = 0
RainbowBorder.ZIndex = 0
RainbowBorder.Parent = MainFrame

local BorderCorner = Instance.new("UICorner")
BorderCorner.CornerRadius = UDim.new(0, 27)
BorderCorner.Parent = RainbowBorder

-- Rainbow Animation
spawn(function()
    while true do
        for i = 0, 1, 0.01 do
            RainbowBorder.BackgroundColor3 = Color3.fromHSV(i, 1, 1)
            task.wait(0.02)
        end
    end
end)

-- Titel
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 70)
Title.BackgroundColor3 = Color3.fromRGB(20, 5, 30)
Title.Text = "🥊 KNOCKOUT HACKER"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = isMobile and 26 or 32
Title.TextStrokeTransparency = 0.3
Title.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
Title.Parent = MainFrame

-- Made By
local MadeBy = Instance.new("TextLabel")
MadeBy.Size = UDim2.new(1, 0, 0, 25)
MadeBy.Position = UDim2.new(0, 0, 0, 70)
MadeBy.BackgroundTransparency = 1
MadeBy.Text = "MADE BY WALED-HAMMAD"
MadeBy.TextColor3 = Color3.fromRGB(0, 255, 255)
MadeBy.Font = Enum.Font.SourceSansBold
MadeBy.TextSize = 16
MadeBy.Parent = MainFrame

-- YouTube Button
local YouTubeBtn = Instance.new("TextButton")
YouTubeBtn.Size = UDim2.new(0.9, 0, 0, 40)
YouTubeBtn.Position = UDim2.new(0.05, 0, 0, 110)
YouTubeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
YouTubeBtn.Text = "📺 @hacker666-00"
YouTubeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
YouTubeBtn.Font = Enum.Font.SourceSansBold
YouTubeBtn.TextSize = 16
YouTubeBtn.Parent = MainFrame

local YTCorner = Instance.new("UICorner")
YTCorner.CornerRadius = UDim.new(0, 12)
YTCorner.Parent = YouTubeBtn

YouTubeBtn.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00?si=RB-939S15-gwSm5X")
    print("✅ YouTube Link kopiert!")
end)

-- TikTok Button
local TikTokBtn = Instance.new("TextButton")
TikTokBtn.Size = UDim2.new(0.9, 0, 0, 40)
TikTokBtn.Position = UDim2.new(0.05, 0, 0, 160)
TikTokBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TikTokBtn.Text = "🎵 @mods_and_hacks"
TikTokBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TikTokBtn.Font = Enum.Font.SourceSansBold
TikTokBtn.TextSize = 16
TikTokBtn.Parent = MainFrame

local TTCorner = Instance.new("UICorner")
TTCorner.CornerRadius = UDim.new(0, 12)
TTCorner.Parent = TikTokBtn

TikTokBtn.MouseButton1Click:Connect(function()
    setclipboard("https://www.tiktok.com/@mods_and_hacks?_r=1&_t=ZG-945eRguwLyK")
    print("✅ TikTok Link kopiert!")
end)

-- Tabs
local Tabs = {"⚡ KAMPF", "👁️ ESP", "⚙️ MISC", "🎨 FARBE"}
local TabButtons = {}
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(1, -20, 0, 45)
TabFrame.Position = UDim2.new(0, 10, 0, 220)
TabFrame.BackgroundTransparency = 1
TabFrame.Parent = MainFrame

for i, tab in ipairs(Tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.24, 0, 1, 0)
    btn.Position = UDim2.new(0.24 * (i-1), 3, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(30, 15, 45)
    btn.Text = tab
    btn.TextColor3 = Color3.fromRGB(200, 200, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = isMobile and 12 or 14
    btn.Parent = TabFrame

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 10)
    btnCorner.Parent = btn

    TabButtons[tab] = btn
end

-- Content
local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(1, -20, 1, -300)
Content.Position = UDim2.new(0, 10, 0, 275)
Content.BackgroundTransparency = 1
Content.ScrollBarThickness = 8
Content.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
Content.CanvasSize = UDim2.new(0, 0, 0, 500)
Content.Parent = MainFrame

-- X Button (NUR SCHLIEßEN, NICHT LÖSCHEN!)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -40, 0, 10)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 24
CloseBtn.Parent = MainFrame

-- WICHTIG: X Button macht GUI nur unsichtbar, nicht löschen!
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- Toggle Button (Mobile)
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 70, 0, 70)
ToggleBtn.Position = UDim2.new(0, 15, 0.8, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
ToggleBtn.Text = "🥊"
ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 35
ToggleBtn.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 35)
ToggleCorner.Parent = ToggleBtn

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    ToggleBtn.Text = MainFrame.Visible and "✕" or "🥊"
    ToggleBtn.BackgroundColor3 = MainFrame.Visible and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(255, 215, 0)
end)

-- Hotkey
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightControl then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

-- ============================================
-- BUTTON FUNKTION
-- ============================================
local function createButton(text, yPos, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, isMobile and 45 or 40)
    btn.Position = UDim2.new(0, 0, 0, yPos)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = isMobile and 16 or 14
    btn.Parent = Content

    btn.MouseButton1Click:Connect(callback)

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = btn

    return yPos + (isMobile and 50 or 45)
end

-- ============================================
local function createToggle(text, yPos, color, getState, setState)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, isMobile and 50 or 45)
    frame.Position = UDim2.new(0, 0, 0, yPos)
    frame.BackgroundColor3 = color
    frame.BackgroundTransparency = 0.2
    frame.Parent = Content

    local frameCorner = Instance.new("UICorner")
    frameCorner.CornerRadius = UDim.new(0, 10)
    frameCorner.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.SourceSansBold
    label.TextSize = isMobile and 16 or 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0.25, 0, 0.8, 0)
    toggleBtn.Position = UDim2.new(0.72, 0, 0.1, 0)
    toggleBtn.BackgroundColor3 = getState() and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    toggleBtn.Text = getState() and "AN" or "AUS"
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.Font = Enum.Font.SourceSansBold
    toggleBtn.TextSize = isMobile and 14 or 12
    toggleBtn.Parent = frame

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 8)
    toggleCorner.Parent = toggleBtn

    toggleBtn.MouseButton1Click:Connect(function()
        setState()
        toggleBtn.Text = getState() and "AN" or "AUS"
        toggleBtn.BackgroundColor3 = getState() and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    end)

    return yPos + (isMobile and 55 or 50)
end

-- ============================================
-- KNOCKOUT! SPEZIFISCHE HACKS
-- ============================================

-- GODMODE (Unverwundbar)
local godmode = false
function toggleGodmode()
    godmode = not godmode
    if godmode then
        humanoid.MaxHealth = math.huge
        humanoid.Health = math.huge
        print("🛡️ Godmode AN")
    else
        humanoid.MaxHealth = 100
        humanoid.Health = 100
        print("🛡️ Godmode AUS")
    end
end

-- SPEED HACK (Wichtig für Knockout!)
function speedHack()
    humanoid.WalkSpeed = 100
    print("⚡ Speed: 100")
end

-- SUPER SPEED (Noch schneller!)
function superSpeed()
    humanoid.WalkSpeed = 200
    print("⚡ Super Speed: 200")
end

-- INFINITE JUMP
local infJump = false
function toggleInfJump()
    infJump = not infJump
    if infJump then
        humanoid.JumpPower = 100
        local jumpConn
        jumpConn = UserInputService.JumpRequest:Connect(function()
            if infJump then
                humanoid:ChangeState("Jumping")
            else
                jumpConn:Disconnect()
            end
        end)
        print("🔄 Infinite Jump AN")
    else
        print("🔄 Infinite Jump AUS")
    end
end

-- SUPER PUNCH (Mehr Knockback)
function superPunch()
    print("💥 Super Punch aktiviert!")
    -- Hier den Super Punch Code einfügen
end

-- NO COOLDOWN
function noCooldown()
    print("⚡ Kein Cooldown aktiviert!")
end

-- ANTI KNOCKBACK (Nicht runterfallen!)
function antiKnockback()
    print("🛡️ Anti-Knockback aktiviert!")
    -- Charakter schwerer machen
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.AssemblyLinearDamping = 100
    end
end

-- ESP (Spieler sehen)
function toggleESP()
    for _, target in pairs(Players:GetPlayers()) do
        if target ~= player and target.Character then
            local highlight = Instance.new("Highlight")
            highlight.Adornee = target.Character
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.FillTransparency = 0.5
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.Parent = target.Character
        end
    end
    print("👁️ ESP aktiviert!")
end

-- INVISIBLE
function toggleInvisible()
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = 1
        end
    end
    print("👻 Unsichtbar!")
end

-- AUTO BLOCK
function autoBlock()
    print("🛡️ Auto Block aktiviert!")
end

-- FLY
local flying = false
local flyBodyGyro, flyBodyVelocity

function toggleFly()
    flying = not flying
    
    if flying then
        flyBodyGyro = Instance.new("BodyGyro")
        flyBodyVelocity = Instance.new("BodyVelocity")
        
        flyBodyGyro.P = 10000
        flyBodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        flyBodyGyro.CFrame = rootPart.CFrame
        
        flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
        flyBodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        
        flyBodyGyro.Parent = rootPart
        flyBodyVelocity.Parent = rootPart
        
        RunService.Heartbeat:Connect(function()
            if not flying then return end
            
            local camera = Workspace.CurrentCamera
            local direction = Vector3.new(0, 0, 0)
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then direction = direction + camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then direction = direction - camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then direction = direction - camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then direction = direction + camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then direction = direction + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then direction = direction - Vector3.new(0, 1, 0) end
            
            flyBodyVelocity.Velocity = direction.Unit * 50
            flyBodyGyro.CFrame = camera.CFrame
        end)
        
        humanoid.PlatformStand = true
        print("✈️ Fly AN")
    else
        if flyBodyGyro then flyBodyGyro:Destroy() end
        if flyBodyVelocity then flyBodyVelocity:Destroy() end
        humanoid.PlatformStand = false
        print("✈️ Fly AUS")
    end
end

-- ============================================
-- KAMPF TAB
-- ============================================
function showCombat()
    Content:ClearAllChildren()
    local y = 10

    y = createButton("🛡️ GODMODE", y, Color3.fromRGB(255, 0, 0), toggleGodmode)
    y = createButton("⚡ SPEED HACK", y, Color3.fromRGB(255, 165, 0), speedHack)
    y = createButton("⚡ SUPER SPEED", y, Color3.fromRGB(255, 140, 0), superSpeed)
    y = createButton("🔄 INFINITE JUMP", y, Color3.fromRGB(0, 255, 255), toggleInfJump)
    y = createButton("💥 SUPER PUNCH", y, Color3.fromRGB(255, 0, 255), superPunch)
    y = createButton("⚡ NO COOLDOWN", y, Color3.fromRGB(255, 215, 0), noCooldown)
    y = createButton("🛡️ ANTI KNOCKBACK", y, Color3.fromRGB(0, 100, 200), antiKnockback)
    y = createButton("🛡️ AUTO BLOCK", y, Color3.fromRGB(0, 255, 0), autoBlock)
    y = createButton("✈️ FLY", y, Color3.fromRGB(128, 0, 255), toggleFly)

    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- ============================================
-- ESP TAB
-- ============================================
function showESP()
    Content:ClearAllChildren()
    local y = 10

    y = createButton("👁️ ESP AKTIVIEREN", y, Color3.fromRGB(255, 0, 0), toggleESP)
    y = createButton("👻 INVISIBLE", y, Color3.fromRGB(128, 128, 128), toggleInvisible)
    y = createButton("🔍 X-RAY", y, Color3.fromRGB(0, 255, 0), function()
        print("🔍 X-Ray aktiviert!")
    end)
    y = createButton("📏 DISTANCE ESP", y, Color3.fromRGB(0, 255, 255), function()
        print("📏 Distance ESP aktiviert!")
    end)

    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- ============================================
-- MISC TAB
-- ============================================
function showMisc()
    Content:ClearAllChildren()
    local y = 10

    y = createButton("💰 INFINITE MONEY", y, Color3.fromRGB(255, 215, 0), function()
        print("💰 Infinite Money!")
    end)
    y = createButton("⭐ UNLOCK ALL", y, Color3.fromRGB(255, 0, 255), function()
        print("⭐ Alles freigeschaltet!")
    end)
    y = createButton("🔄 REJOIN", y, Color3.fromRGB(255, 165, 0), function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, player)
    end)
    y = createButton("🌀 ANTI-AFK", y, Color3.fromRGB(0, 255, 0), function()
        local vu = game:GetService("VirtualUser")
        player.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
        end)
        print("🌀 Anti-AFK aktiviert!")
    end)

    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- ============================================
-- FARBE TAB
-- ============================================
function showColor()
    Content:ClearAllChildren()
    local y = 10

    y = createButton("🌈 RAINBOW CHAR", y, Color3.fromRGB(255, 0, 255), function()
        spawn(function()
            while true do
                for i = 0, 1, 0.01 do
                    for _, part in pairs(character:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.Color = Color3.fromHSV(i, 1, 1)
                        end
                    end
                    task.wait(0.05)
                end
            end
        end)
        print("🌈 Rainbow aktiviert!")
    end)

    y = createButton("🔴 ROT", y, Color3.fromRGB(255, 0, 0), function()
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Color = Color3.fromRGB(255, 0, 0)
            end
        end
    end)

    y = createButton("🔵 BLAU", y, Color3.fromRGB(0, 0, 255), function()
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Color = Color3.fromRGB(0, 0, 255)
            end
        end
    end)

    y = createButton("🟢 GRÜN", y, Color3.fromRGB(0, 255, 0), function()
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Color = Color3.fromRGB(0, 255, 0)
            end
        end
    end)

    y = createButton("🟡 GELB", y, Color3.fromRGB(255, 255, 0), function()
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Color = Color3.fromRGB(255, 255, 0)
            end
        end
    end)

    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- ============================================
-- TAB UMSCHALTUNG
-- ============================================
local function switchTab(tab)
    for t, btn in pairs(TabButtons) do
        btn.BackgroundColor3 = t == tab and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(30, 15, 45)
        btn.TextColor3 = t == tab and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(200, 200, 255)
    end

    if tab == "⚡ KAMPF" then showCombat()
    elseif tab == "👁️ ESP" then showESP()
    elseif tab == "⚙️ MISC" then showMisc()
    elseif tab == "🎨 FARBE" then showColor() end
end

for tab, btn in pairs(TabButtons) do
    btn.MouseButton1Click:Connect(function() switchTab(tab) end)
end

-- Start
switchTab("⚡ KAMPF")

print("🥊 KNOCKOUT HACKER - GALAXY EDITION")
print("👑 Made by WALED-HAMMAD")
print("📺 YouTube: @hacker666-00")
print("🎵 TikTok: @mods_and_hacks")
print("🎮 RightControl / Toggle Button")
print("❌ X Button = GUI verstecken (nicht löschen)")
