-- ============================================
-- ULTIMATE VIP TOOLGIVER - GITHUB EDITION
-- SCANNT ALLE VERFÜGBAREN TOOLS IM SPIEL
-- AUTO VIP FÜR JEDEN USER | ROBUX TOOLS FREE
-- MADE BY WALED-HAMMAD
-- VERSION: 2.0
-- YOUTUBE: @hacker666-00
-- TIKTOK: @mods_and_hacks
-- ============================================

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local mouse = player:GetMouse()

-- Device Check
local isMobile = UserInputService.TouchEnabled

-- ============================================
-- AUTO VIP SYSTEM - JEDER IST VIP!
-- ============================================
local isVIP = true -- JEDER ist VIP!
local userID = player.UserId

-- ============================================
-- DATEN SPEICHER
-- ============================================
local scannedTools = {}
local robuxTools = {}
local rareTools = {}
local selectedTool = nil

-- ============================================
-- 🌌 GALAXY TOOLGIVER GUI
-- ============================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VIP_ToolGiver"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

-- Hauptframe
local MainFrame = Instance.new("Frame")
MainFrame.Size = isMobile and UDim2.new(0, 380, 0, 600) or UDim2.new(0, 550, 0, 650)
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -325)
MainFrame.BackgroundColor3 = Color3.fromRGB(2, 0, 10)
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

-- Galaxy Hintergrund
local Galaxy = Instance.new("Frame")
Galaxy.Size = UDim2.new(1, 0, 1, 0)
Galaxy.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Galaxy.BackgroundTransparency = 0.5
Galaxy.ZIndex = -1
Galaxy.Parent = MainFrame

-- Sterne Effekt
for i = 1, 150 do
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

-- VIP Status Anzeige
local VIPStatus = Instance.new("TextLabel")
VIPStatus.Size = UDim2.new(0.6, 0, 0, 35)
VIPStatus.Position = UDim2.new(0.2, 0, 0, 8)
VIPStatus.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
VIPStatus.Text = "👑 VIP AKTIV (User: " .. userID .. ")"
VIPStatus.TextColor3 = Color3.fromRGB(0, 0, 0)
VIPStatus.Font = Enum.Font.GothamBold
VIPStatus.TextSize = 12
VIPStatus.TextWrapped = true
VIPStatus.Parent = MainFrame

local VIPCorner = Instance.new("UICorner")
VIPCorner.CornerRadius = UDim.new(0, 10)
VIPCorner.Parent = VIPStatus

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
Title.BackgroundColor3 = Color3.fromRGB(20, 5, 30)
Title.Text = "💰 VIP TOOLGIVER"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = isMobile and 24 or 28
Title.TextStrokeTransparency = 0.3
Title.TextStrokeColor3 = Color3.fromRGB(255, 0, 255)
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

-- Social Media Buttons
local YouTubeBtn = Instance.new("TextButton")
YouTubeBtn.Size = UDim2.new(0.45, 0, 0, 35)
YouTubeBtn.Position = UDim2.new(0.05, 0, 0, 95)
YouTubeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
YouTubeBtn.Text = "📺 @hacker666-00"
YouTubeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
YouTubeBtn.Font = Enum.Font.SourceSansBold
YouTubeBtn.TextSize = 12
YouTubeBtn.Parent = MainFrame

local YTCorner = Instance.new("UICorner")
YTCorner.CornerRadius = UDim.new(0, 10)
YTCorner.Parent = YouTubeBtn

YouTubeBtn.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00?si=RB-939S15-gwSm5X")
    notification("📺 YouTube Link kopiert!")
end)

local TikTokBtn = Instance.new("TextButton")
TikTokBtn.Size = UDim2.new(0.45, 0, 0, 35)
TikTokBtn.Position = UDim2.new(0.52, 0, 0, 95)
TikTokBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TikTokBtn.Text = "🎵 @mods_and_hacks"
TikTokBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TikTokBtn.Font = Enum.Font.SourceSansBold
TikTokBtn.TextSize = 12
TikTokBtn.Parent = MainFrame

local TTCorner = Instance.new("UICorner")
TTCorner.CornerRadius = UDim.new(0, 10)
TTCorner.Parent = TikTokBtn

TikTokBtn.MouseButton1Click:Connect(function()
    setclipboard("https://www.tiktok.com/@mods_and_hacks?_r=1&_t=ZG-945eRguwLyK")
    notification("🎵 TikTok Link kopiert!")
end)

-- Tabs
local Tabs = {"🔍 SCANNER", "💰 ROBUX", "🎁 ALLE", "⭐ SELTENE", "👑 VIP"}
local TabButtons = {}
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(1, -20, 0, 45)
TabFrame.Position = UDim2.new(0, 10, 0, 140)
TabFrame.BackgroundTransparency = 1
TabFrame.Parent = MainFrame

for i, tab in ipairs(Tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.19, 0, 1, 0)
    btn.Position = UDim2.new(0.19 * (i-1), 2, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(30, 15, 45)
    btn.Text = tab
    btn.TextColor3 = Color3.fromRGB(200, 200, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = isMobile and 10 or 12
    btn.Parent = TabFrame

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn

    TabButtons[tab] = btn
end

-- Content Frame
local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(1, -20, 1, -220)
Content.Position = UDim2.new(0, 10, 0, 195)
Content.BackgroundTransparency = 1
Content.ScrollBarThickness = 8
Content.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
Content.CanvasSize = UDim2.new(0, 0, 0, 800)
Content.Parent = MainFrame

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 10)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 20
CloseBtn.Parent = MainFrame

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- Toggle Button (Mobile)
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 70, 0, 70)
ToggleBtn.Position = UDim2.new(0, 15, 0.8, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
ToggleBtn.Text = "💰"
ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 35
ToggleBtn.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 35)
ToggleCorner.Parent = ToggleBtn

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Hotkey (PC)
if not isMobile then
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.RightControl then
            MainFrame.Visible = not MainFrame.Visible
        end
    end)
end

-- ============================================
-- NOTIFICATION SYSTEM
-- ============================================
function notification(msg)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "💰 VIP TOOLGIVER",
            Text = msg,
            Duration = 2
        })
    end)
end

-- ============================================
-- BUTTON CREATOR
-- ============================================
local function createButton(text, yPos, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, isMobile and 50 or 45)
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

    return yPos + (isMobile and 55 or 50)
end

-- ============================================
-- TOOL SCANNER
-- ============================================
function scanAllTools()
    scannedTools = {}
    rareTools = {}
    robuxTools = {}
    Content:ClearAllChildren()
    
    local y = 10
    local totalCount = 0
    local rareCount = 0
    local robuxCount = 0
    
    notification("🔍 Scanne alle Tools...")
    
    -- Workspace durchsuchen
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Tool") then
            table.insert(scannedTools, obj)
            totalCount = totalCount + 1
            
                       -- Seltene Tools erkennen (FORTSETZUNG)
            if name:find("legend") or name:find("mythic") or name:find("rare") or 
               name:find("epic") or name:find("god") or name:find("admin") or
               name:find("unique") or name:find("special") then
                table.insert(rareTools, obj)
                rareCount = rareCount + 1
            end
        end
    end
    
    -- ReplicatedStorage durchsuchen
    for _, obj in pairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("Tool") then
            table.insert(scannedTools, obj)
            totalCount = totalCount + 1
        end
    end
    
    -- Info anzeigen
    local infoBtn = createButton("📊 GEFUNDEN: " .. totalCount .. " TOOLS", y, Color3.fromRGB(0, 255, 255), function() end)
    infoBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 100)
    y = y + 55
    
    if robuxCount > 0 then
        local robuxInfo = createButton("💰 ROBUX TOOLS: " .. robuxCount, y, Color3.fromRGB(255, 215, 0), function() end)
        robuxInfo.BackgroundColor3 = Color3.fromRGB(100, 50, 0)
        y = y + 55
    end
    
    if rareCount > 0 then
        local rareInfo = createButton("⭐ SELTENE: " .. rareCount, y, Color3.fromRGB(255, 0, 255), function() end)
        rareInfo.BackgroundColor3 = Color3.fromRGB(100, 0, 100)
        y = y + 55
    end
    
    -- Buttons
    if totalCount > 0 then
        local getAllBtn = createButton("🎁 ALLE TOOLS EINSAMMELN", y, Color3.fromRGB(0, 255, 0), giveAllTools)
        y = y + 55
        
        if robuxCount > 0 then
            local getRobuxBtn = createButton("💰 ROBUX TOOLS EINSAMMELN", y, Color3.fromRGB(255, 215, 0), giveRobuxTools)
            y = y + 55
        end
        
        if rareCount > 0 then
            local getRareBtn = createButton("⭐ SELTENE TOOLS EINSAMMELN", y, Color3.fromRGB(255, 0, 255), giveRareTools)
            y = y + 55
        end
    else
        local noTools = createButton("❌ KEINE TOOLS GEFUNDEN", y, Color3.fromRGB(255, 0, 0), function() end)
        noTools.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
        y = y + 55
    end
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- ============================================
-- TOOL GEBER FUNKTIONEN
-- ============================================
function giveAllTools()
    local count = 0
    for _, tool in ipairs(scannedTools) do
        pcall(function()
            local clone = tool:Clone()
            clone.Parent = player.Backpack
            count = count + 1
        end)
        task.wait(0.01)
    end
    notification("✅ " .. count .. " Tools erhalten!")
end

function giveRobuxTools()
    local count = 0
    for _, tool in ipairs(robuxTools) do
        pcall(function()
            local clone = tool:Clone()
            clone.Parent = player.Backpack
            count = count + 1
        end)
        task.wait(0.01)
    end
    notification("💰 " .. count .. " ROBUX Tools erhalten!")
end

function giveRareTools()
    local count = 0
    for _, tool in ipairs(rareTools) do
        pcall(function()
            local clone = tool:Clone()
            clone.Parent = player.Backpack
            count = count + 1
        end)
        task.wait(0.01)
    end
    notification("⭐ " .. count .. " seltene Tools erhalten!")
end

function giveRandomTool()
    if #scannedTools > 0 then
        local randomTool = scannedTools[math.random(1, #scannedTools)]
        local clone = randomTool:Clone()
        clone.Parent = player.Backpack
        notification("🎁 " .. randomTool.Name .. " erhalten!")
    else
        notification("❌ Keine Tools gefunden!")
    end
end

function giveRandomRobux()
    if #robuxTools > 0 then
        local randomTool = robuxTools[math.random(1, #robuxTools)]
        local clone = randomTool:Clone()
        clone.Parent = player.Backpack
        notification("💰 " .. randomTool.Name .. " erhalten!")
    else
        notification("❌ Keine ROBUX Tools gefunden!")
    end
end

function giveRandomRare()
    if #rareTools > 0 then
        local randomTool = rareTools[math.random(1, #rareTools)]
        local clone = randomTool:Clone()
        clone.Parent = player.Backpack
        notification("⭐ " .. randomTool.Name .. " erhalten!")
    else
        notification("❌ Keine seltenen Tools gefunden!")
    end
end

function dupeTools()
    local count = 0
    for _, tool in pairs(player.Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            pcall(function()
                local clone = tool:Clone()
                clone.Parent = player.Backpack
                count = count + 1
            end)
        end
    end
    notification("🔄 " .. count .. " Tools dupliziert!")
end

function freezeTools()
    local count = 0
    for _, tool in pairs(player.Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            pcall(function()
                tool.Parent = character
                count = count + 1
            end)
        end
    end
    notification("📦 " .. count .. " Tools eingefroren!")
end

function unfreezeTools()
    local count = 0
    for _, tool in pairs(character:GetChildren()) do
        if tool:IsA("Tool") then
            pcall(function()
                tool.Parent = player.Backpack
                count = count + 1
            end)
        end
    end
    notification("📦 " .. count .. " Tools aufgetaut!")
end

-- ============================================
-- TAB FUNKTIONEN
-- ============================================
function showScanner()
    scanAllTools()
end

function showRobux()
    Content:ClearAllChildren()
    local y = 10
    
    if #robuxTools > 0 then
        y = createButton("💰 ALLE ROBUX TOOLS", y, Color3.fromRGB(255, 215, 0), giveRobuxTools)
        y = createButton("🎲 RANDOM ROBUX TOOL", y, Color3.fromRGB(255, 165, 0), giveRandomRobux)
        
        for i, tool in ipairs(robuxTools) do
            y = createButton("💰 " .. tool.Name, y, Color3.fromRGB(255, 215, 0), function()
                local clone = tool:Clone()
                clone.Parent = player.Backpack
                notification("✅ " .. tool.Name .. " erhalten!")
            end)
        end
    else
        local noRobux = createButton("❌ Keine ROBUX Tools", y, Color3.fromRGB(255, 0, 0), scanAllTools)
        noRobux.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
        y = y + 55
    end
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

function showAll()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("🎁 ALLE TOOLS", y, Color3.fromRGB(0, 255, 0), giveAllTools)
    y = createButton("🎲 RANDOM TOOL", y, Color3.fromRGB(255, 165, 0), giveRandomTool)
    
    if #scannedTools > 0 then
        for i, tool in ipairs(scannedTools) do
            local isRobux = false
            local isRare = false
            
            for _, rt in ipairs(robuxTools) do if rt == tool then isRobux = true end end
            for _, ra in ipairs(rareTools) do if ra == tool then isRare = true end end
            
            local prefix = "🔧 "
            local color = Color3.fromRGB(100, 100, 255)
            
            if isRobux then
                prefix = "💰 "
                color = Color3.fromRGB(255, 215, 0)
            elseif isRare then
                prefix = "⭐ "
                color = Color3.fromRGB(255, 0, 255)
            end
            
            y = createButton(prefix .. tool.Name, y, color, function()
                local clone = tool:Clone()
                clone.Parent = player.Backpack
                notification("✅ " .. tool.Name .. " erhalten!")
            end)
        end
    else
        local noTools = createButton("🔍 ZUERST SCANNEN", y, Color3.fromRGB(255, 165, 0), scanAllTools)
        noTools.BackgroundColor3 = Color3.fromRGB(100, 50, 0)
        y = y + 55
    end
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

function showRare()
    Content:ClearAllChildren()
    local y = 10
    
    if #rareTools > 0 then
        y = createButton("⭐ ALLE SELTENEN", y, Color3.fromRGB(255, 0, 255), giveRareTools)
        y = createButton("🎲 RANDOM SELTENES", y, Color3.fromRGB(255, 165, 0), giveRandomRare)
        
        for i, tool in ipairs(rareTools) do
            y = createButton("⭐ " .. tool.Name, y, Color3.fromRGB(255, 0, 255), function()
                local clone = tool:Clone()
                clone.Parent = player.Backpack
                notification("✅ " .. tool.Name .. " erhalten!")
            end)
        end
    else
        local noRare = createButton("❌ Keine seltenen Tools", y, Color3.fromRGB(255, 0, 0), scanAllTools)
        noRare.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
        y = y + 55
    end
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

function showVIP()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("💰 ROBUX TOOLS", y, Color3.fromRGB(255, 215, 0), giveRobuxTools)
    y = createButton("⭐ SELTENE TOOLS", y, Color3.fromRGB(255, 0, 255), giveRareTools)
    y = createButton("🎁 ALLE TOOLS", y, Color3.fromRGB(0, 255, 0), giveAllTools)
    y = createButton("🔄 TOOLS DUPLIZIEREN", y, Color3.fromRGB(0, 255, 255), dupeTools)
    y = createButton("📦 TOOLS EINFRIEREN", y, Color3.fromRGB(100, 100, 255), freezeTools)
    y = createButton("📦 TOOLS AUFTAUEN", y, Color3.fromRGB(255, 100, 100), unfreezeTools)
    y = createButton("🎲 RANDOM ROBUX", y, Color3.fromRGB(255, 215, 0), giveRandomRobux)
    y = createButton("🎲 RANDOM SELTEN", y, Color3.fromRGB(255, 0, 255), giveRandomRare)
    y = createButton("🎲 RANDOM TOOL", y, Color3.fromRGB(255, 165, 0), giveRandomTool)
    
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

    if tab == "🔍 SCANNER" then showScanner()
    elseif tab == "💰 ROBUX" then showRobux()
    elseif tab == "🎁 ALLE" then showAll()
    elseif tab == "⭐ SELTENE" then showRare()
    elseif tab == "👑 VIP" then showVIP() end
end

for tab, btn in pairs(TabButtons) do
    btn.MouseButton1Click:Connect(function() switchTab(tab) end)
end

-- Start
showScanner()

-- Willkommensmeldung
print([[

   ██╗   ██╗██╗██████╗     ████████╗ ██████╗  ██████╗ ██╗
   ██║   ██║██║██╔══██╗    ╚══██╔══╝██╔═══██╗██╔═══██╗██║
   ██║   ██║██║██████╔╝       ██║   ██║   ██║██║   ██║██║
   ╚██╗ ██╔╝██║██╔═══╝        ██║   ██║   ██║██║   ██║██║
    ╚████╔╝ ██║██║            ██║   ╚██████╔╝╚██████╔╝███████╗
     ╚═══╝  ╚═╝╚═╝            ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝
                                                                 
]])

print("💰 ULTIMATE VIP TOOLGIVER GELADEN!")
print("👑 Made by WALED-HAMMAD")
print("📺 YouTube: @hacker666-00")
print("🎵 TikTok: @mods_and_hacks")
print("✅ VIP Status: AKTIV für User " .. userID)
print("💰 ROBUX Tools: KOSTENLOS verfügbar!")
print("🎮 RightControl / Toggle Button")
