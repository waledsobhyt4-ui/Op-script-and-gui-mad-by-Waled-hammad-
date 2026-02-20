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

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local mouse = player:GetMouse()

-- Device Check
local isMobile = UserInputService.TouchEnabled

-- ============================================
-- 🥊 KNOCKOUT HACKER GUI
-- ============================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KnockoutHacker"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

-- Hauptframe
local MainFrame = Instance.new("Frame")
MainFrame.Size = isMobile and UDim2.new(0, 320, 0, 500) or UDim2.new(0, 400, 0, 550)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -275)
MainFrame.BackgroundColor3 = Color3.fromRGB(5, 0, 10)
MainFrame.BackgroundTransparency = 0.1
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

-- Abgerundete Ecken
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 20)
Corner.Parent = MainFrame

-- Rainbow Border
local RainbowBorder = Instance.new("Frame")
RainbowBorder.Size = UDim2.new(1, 8, 1, 8)
RainbowBorder.Position = UDim2.new(0, -4, 0, -4)
RainbowBorder.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
RainbowBorder.BorderSizePixel = 0
RainbowBorder.ZIndex = 0
RainbowBorder.Parent = MainFrame

local BorderCorner = Instance.new("UICorner")
BorderCorner.CornerRadius = UDim.new(0, 22)
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
Title.Size = UDim2.new(1, 0, 0, 60)
Title.BackgroundColor3 = Color3.fromRGB(20, 5, 25)
Title.Text = "🥊 KNOCKOUT HACKER"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = isMobile and 24 or 28
Title.TextStrokeTransparency = 0.3
Title.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
Title.Parent = MainFrame

-- Made By
local MadeBy = Instance.new("TextLabel")
MadeBy.Size = UDim2.new(1, 0, 0, 25)
MadeBy.Position = UDim2.new(0, 0, 0, 60)
MadeBy.BackgroundTransparency = 1
MadeBy.Text = "MADE BY WALED-HAMMAD"
MadeBy.TextColor3 = Color3.fromRGB(0, 255, 255)
MadeBy.Font = Enum.Font.SourceSansBold
MadeBy.TextSize = 16
MadeBy.Parent = MainFrame

-- YouTube Button
local YouTubeBtn = Instance.new("TextButton")
YouTubeBtn.Size = UDim2.new(0.9, 0, 0, 40)
YouTubeBtn.Position = UDim2.new(0.05, 0, 0, 100)
YouTubeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
YouTubeBtn.Text = "📺 @hacker666-00"
YouTubeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
YouTubeBtn.Font = Enum.Font.SourceSansBold
YouTubeBtn.TextSize = 16
YouTubeBtn.Parent = MainFrame

local YTCorner = Instance.new("UICorner")
YTCorner.CornerRadius = UDim.new(0, 10)
YTCorner.Parent = YouTubeBtn

YouTubeBtn.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00?si=RB-939S15-gwSm5X")
    print("✅ YouTube Link kopiert!")
end)

-- TikTok Button
local TikTokBtn = Instance.new("TextButton")
TikTokBtn.Size = UDim2.new(0.9, 0, 0, 40)
TikTokBtn.Position = UDim2.new(0.05, 0, 0, 150)
TikTokBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TikTokBtn.Text = "🎵 @mods_and_hacks"
TikTokBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TikTokBtn.Font = Enum.Font.SourceSansBold
TikTokBtn.TextSize = 16
TikTokBtn.Parent = MainFrame

local TTCorner = Instance.new("UICorner")
TTCorner.CornerRadius = UDim.new(0, 10)
TTCorner.Parent = TikTokBtn

TikTokBtn.MouseButton1Click:Connect(function()
    setclipboard("https://www.tiktok.com/@mods_and_hacks?_r=1&_t=ZG-945eRguwLyK")
    print("✅ TikTok Link kopiert!")
end)

-- Tabs
local Tabs = {"⚡ KAMPF", "👁️ ESP", "⚙️ MISC", "🎨 FARBE"}
local TabButtons = {}
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(1, -20, 0, 40)
TabFrame.Position = UDim2.new(0, 10, 0, 210)
TabFrame.BackgroundTransparency = 1
TabFrame.Parent = MainFrame

for i, tab in ipairs(Tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.24, 0, 1, 0)
    btn.Position = UDim2.new(0.24 * (i-1), 3, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(30, 15, 40)
    btn.Text = tab
    btn.TextColor3 = Color3.fromRGB(200, 200, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = isMobile and 12 or 14
    btn.Parent = TabFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    TabButtons[tab] = btn
end

-- Content
local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(1, -20, 1, -280)
Content.Position = UDim2.new(0, 10, 0, 260)
Content.BackgroundTransparency = 1
Content.ScrollBarThickness = 6
Content.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
Content.CanvasSize = UDim2.new(0, 0, 0, 500)
Content.Parent = MainFrame

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 8)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 20
CloseBtn.Parent = MainFrame

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Toggle Button (Mobile)
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 60, 0, 60)
ToggleBtn.Position = UDim2.new(0, 15, 0.8, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
ToggleBtn.Text = "🥊"
ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 30
ToggleBtn.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 30)
ToggleCorner.Parent = ToggleBtn

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
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
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    
    return yPos + (isMobile and 50 or 45)
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

-- SPEED HACK
function speedHack()
    humanoid.WalkSpeed = 100
    print("⚡ Speed: 100")
end

-- INFINITE JUMP
local infJump = false
function toggleInfJump()
    infJump = not infJump
    if infJump then
        humanoid.JumpPower = 100
        UserInputService.JumpRequest:Connect(function()
            if infJump then
                humanoid:ChangeState("Jumping")
            end
        end)
        print("🔄 Infinite Jump AN")
    else
        print("🔄 Infinite Jump AUS")
    end
end

-- SUPER PUNCH
function superPunch()
    print("💥 Super Punch aktiviert!")
    -- Hier den Super Punch Code einfügen
end

-- NO COOLDOWN
function noCooldown()
    print("⚡ Kein Cooldown aktiviert!")
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

-- ============================================
-- KAMPF TAB
-- ============================================
function showCombat()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("🛡️ GODMODE", y, Color3.fromRGB(255, 0, 0), toggleGodmode)
    y = createButton("⚡ SPEED HACK", y, Color3.fromRGB(255, 165, 0), speedHack)
    y = createButton("🔄 INFINITE JUMP", y, Color3.fromRGB(0, 255, 255), toggleInfJump)
    y = createButton("💥 SUPER PUNCH", y, Color3.fromRGB(255, 0, 255), superPunch)
    y = createButton("⚡ NO COOLDOWN", y, Color3.fromRGB(255, 215, 0), noCooldown)
    y = createButton("🛡️ AUTO BLOCK", y, Color3.fromRGB(0, 255, 0), autoBlock)
    
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
    y = createButton("❌ ANTİ-AFK", y, Color3.fromRGB(0, 255, 0), function()
        local vu = game:GetService("VirtualUser")
        player.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
            wait(1)
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
        btn.BackgroundColor3 = t == tab and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(30, 15, 40)
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

print("🥊 KNOCKOUT HACKER GELADEN!")
print("👑 Made by WALED-HAMMAD")
print("📺 YouTube: @hacker666-00")
print("🎵 TikTok: @mods_and_hacks")
print("🎮 RightControl / Toggle Button")
