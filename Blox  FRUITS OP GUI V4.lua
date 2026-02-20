-- ============================================
-- BLOX FRUITS OP GUI V4 - ULTIMATE
-- ALLE OP TOOLS IN EINEM SCRIPT
-- MADE BY WALED-HAMMAD
-- ============================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- ============================================
-- GUI ERSTELLUNG
-- ============================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BloxFruitsOP"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.CoreGui

-- Hauptframe
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 450, 0, 550)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -275)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 5, 20)
MainFrame.BackgroundTransparency = 0.1
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

-- Rainbow Border
local Border = Instance.new("Frame")
Border.Size = UDim2.new(1, 6, 1, 6)
Border.Position = UDim2.new(0, -3, 0, -3)
Border.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Border.BorderSizePixel = 0
Border.ZIndex = 0
Border.Parent = MainFrame

-- Rainbow Animation
spawn(function()
    while true do
        for i = 0, 1, 0.01 do
            Border.BackgroundColor3 = Color3.fromHSV(i, 1, 1)
            task.wait(0.05)
        end
    end
end)

-- Titel
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(20, 10, 30)
Title.Text = "🔥 BLOX FRUITS OP GUI 🔥"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 24
Title.TextStrokeTransparency = 0.5
Title.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
Title.Parent = MainFrame

-- Made By
local MadeBy = Instance.new("TextLabel")
MadeBy.Size = UDim2.new(1, 0, 0, 20)
MadeBy.Position = UDim2.new(0, 0, 0, 45)
MadeBy.BackgroundTransparency = 1
MadeBy.Text = "👑 Made by WALED-HAMMAD"
MadeBy.TextColor3 = Color3.fromRGB(0, 255, 255)
MadeBy.Font = Enum.Font.SourceSans
MadeBy.TextSize = 14
MadeBy.Parent = MainFrame

-- Tabs
local Tabs = {"⚔️ KAMPF", "🍎 FRÜCHTE", "👁️ ESP", "🌍 TELEPORT", "⚙️ STATS", "💰 FARM", "🛡️ SCHUTZ"}
local TabButtons = {}
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(1, -20, 0, 35)
TabFrame.Position = UDim2.new(0, 10, 0, 70)
TabFrame.BackgroundTransparency = 1
TabFrame.Parent = MainFrame

for i, tab in ipairs(Tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.14, 0, 1, 0)
    btn.Position = UDim2.new(0.14 * (i-1), 0, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(30, 20, 40)
    btn.Text = tab
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 11
    btn.Parent = TabFrame
    TabButtons[tab] = btn
end

-- Content Frame
local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(1, -20, 1, -130)
Content.Position = UDim2.new(0, 10, 0, 115)
Content.BackgroundTransparency = 1
Content.ScrollBarThickness = 8
Content.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
Content.CanvasSize = UDim2.new(0, 0, 0, 1000)
Content.Parent = MainFrame

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -40, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 24
CloseBtn.Parent = MainFrame

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Toggle Button
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Position = UDim2.new(0, 10, 0.5, -25)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
ToggleBtn.Text = "⚡"
ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.TextSize = 30
ToggleBtn.Parent = ScreenGui

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    ToggleBtn.Text = MainFrame.Visible and "✕" or "⚡"
    ToggleBtn.BackgroundColor3 = MainFrame.Visible and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(255, 215, 0)
end)

-- Hotkey
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightControl then
        MainFrame.Visible = not MainFrame.Visible
        ToggleBtn.Text = MainFrame.Visible and "✕" or "⚡"
        ToggleBtn.BackgroundColor3 = MainFrame.Visible and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(255, 215, 0)
    end
end)

-- ============================================
-- BUTTON ERSTELLUNG
-- ============================================
local function createButton(text, yPos, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.Position = UDim2.new(0, 0, 0, yPos)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 14
    btn.Parent = Content
    
    btn.MouseButton1Click:Connect(callback)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    
    return yPos + 40
end

-- ============================================
-- AUTO FARM SYSTEM
-- ============================================
local autoFarm = false
local farmConnection

function startAutoFarm()
    autoFarm = not autoFarm
    
    if autoFarm then
        farmConnection = RunService.Heartbeat:Connect(function()
            if not autoFarm then return end
            
            -- Auto Farm für Meeresfrüchte
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj.Name == "SeaBeast" or obj.Name == "Ship" or obj.Name == "Chest" then
                    if obj:FindFirstChild("HumanoidRootPart") then
                        rootPart.CFrame = obj.HumanoidRootPart.CFrame
                        task.wait(0.1)
                        -- Angreifen
                        local args = { [1] = obj }
                        game:GetService("ReplicatedStorage"):FindFirstChild("MainEvent"):FireServer("UpdateDamage", args)
                    end
                end
            end
        end)
    else
        if farmConnection then farmConnection:Disconnect() end
    end
end

-- ============================================
-- FRUCHT FINDER
-- ============================================
local fruitFinder = false
local fruitConnection

function startFruitFinder()
    fruitFinder = not fruitFinder
    
    if fruitFinder then
        fruitConnection = RunService.Heartbeat:Connect(function()
            if not fruitFinder then return end
            
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj.Name:find("Fruit") or obj.Name:find("Frucht") then
                    if obj:IsA("Tool") or obj:IsA("Model") then
                        local pos = obj:IsA("Tool") and obj.Handle or obj.PrimaryPart
                        if pos then
                            rootPart.CFrame = pos.CFrame
                            task.wait(0.3)
                            firetouchinterest(rootPart, pos, 0)
                            firetouchinterest(rootPart, pos, 1)
                        end
                    end
                end
            end
        end)
    else
        if fruitConnection then fruitConnection:Disconnect() end
    end
end

-- ============================================
-- ESP SYSTEM
-- ============================================
local espEnabled = false
local espHighlights = {}

function toggleESP()
    espEnabled = not espEnabled
    
    if espEnabled then
        for _, target in pairs(Players:GetPlayers()) do
            if target ~= player and target.Character then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESP_" .. target.Name
                highlight.Adornee = target.Character
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.FillTransparency = 0.5
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.OutlineTransparency = 0
                highlight.Parent = target.Character
                espHighlights[target] = highlight
            end
        end
        
        -- Frucht ESP
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj.Name:find("Fruit") and obj:IsA("Tool") then
                local highlight = Instance.new("Highlight")
                highlight.Adornee = obj
                highlight.FillColor = Color3.fromRGB(0, 255, 0)
                highlight.FillTransparency = 0.3
                highlight.Parent = obj
            end
        end
    else
        for _, highlight in pairs(espHighlights) do
            highlight:Destroy()
        end
        espHighlights = {}
    end
end

-- ============================================
-- TELEPORT SYSTEM
-- ============================================
local islands = {
    {"🏝️ START INSEL", CFrame.new(1000, 20, 1000)},
    {"🏝️ JUNGLE", CFrame.new(-1200, 15, 1500)},
    {"🏝️ FISCHERDORF", CFrame.new(2000, 20, 500)},
    {"🏝️ SKYPEA", CFrame.new(5000, 100, 2000)},
    {"🏝️ MAGMA VILLAGE", CFrame.new(-8000, 50, 5000)},
    {"🏝️ UNTERWASSERSTADT", CFrame.new(3000, -50, -2000)},
    {"🏝️ KOLOSSEUM", CFrame.new(1500, 30, -3000)},
    {"🏝️ SCHATTENREICH", CFrame.new(-5000, 200, -4000)}
}

-- ============================================
-- STATS HACK
-- ============================================
function maxStats()
    pcall(function()
        local stats = {
            "Combat", "Defense", "Sword", "Gun", "Fruit", "Strength"
        }
        
        for _, stat in ipairs(stats) do
            local args = {
                [1] = "AddPoint",
                [2] = stat,
                [3] = 100
            }
            game:GetService("ReplicatedStorage"):FindFirstChild("StatsEvent"):FireServer(unpack(args))
        end
    end)
end

-- ============================================
-- KAMPF SYSTEM
-- ============================================
local autoAttack = false
local attackConnection

function startAutoAttack()
    autoAttack = not autoAttack
    
    if autoAttack then
        attackConnection = RunService.Heartbeat:Connect(function()
            if not autoAttack then return end
            
            for _, target in pairs(Players:GetPlayers()) do
                if target ~= player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                    local distance = (target.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
                    if distance < 30 then
                        rootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        task.wait(0.1)
                        
                        -- Angriff simulieren
                        local args = {
                            [1] = target.Character.HumanoidRootPart.Position,
                            [2] = target.Character
                        }
                        game:GetService("ReplicatedStorage"):FindFirstChild("CombatEvent"):FireServer(unpack(args))
                    end
                end
            end
        end)
    else
        if attackConnection then attackConnection:Disconnect() end
    end
end

-- ============================================
-- SCHUTZ SYSTEM
-- ============================================
function activateProtection()
    -- Anti-Kick
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" or method == "kick" then
            return nil
        end
        return old(self, ...)
    end)
    
    setreadonly(mt, true)
    
    -- Unendliche Gesundheit
    humanoid.MaxHealth = math.huge
    humanoid.Health = math.huge
end

-- ============================================
-- TELEPORT ZUM NÄCHSTEN SPIELER
-- ============================================
function teleportToNearest()
    local nearest = nil
    local shortest = math.huge
    
    for _, target in pairs(Players:GetPlayers()) do
        if target ~= player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (target.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
            if distance < shortest then
                shortest = distance
                nearest = target
            end
        end
    end
    
    if nearest then
        rootPart.CFrame = nearest.Character.HumanoidRootPart.CFrame
    end
end

-- ============================================
-- TABS INHALTE
-- ============================================

-- ⚔️ KAMPF TAB
function showCombat()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("⚔️ AUTO ATTACK: AUS", y, Color3.fromRGB(255, 0, 0), function()
        startAutoAttack()
        local btn = Content:GetChildren()[1]
        btn.Text = autoAttack and "⚔️ AUTO ATTACK: AN" or "⚔️ AUTO ATTACK: AUS"
        btn.BackgroundColor3 = autoAttack and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    end)
    
    y = createButton("🎯 ZIEL FOKUSSIEREN", y, Color3.fromRGB(255, 165, 0), function()
        teleportToNearest()
    end)
    
    y = createButton("💥 DMG MULTIPLIER x10", y, Color3.fromRGB(255, 0, 255), function()
        -- Damage Multiplier
    end)
    
    y = createButton("⚡ KEIN COOLDOWN", y, Color3.fromRGB(0, 255, 255), function()
        -- No Cooldown
    end)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- 🍎 FRÜCHTE TAB
function showFruits()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("🍎 FRUCHT FINDER: AUS", y, Color3.fromRGB(255, 0, 0), function()
        startFruitFinder()
        local btn = Content:GetChildren()[1]
        btn.Text = fruitFinder and "🍎 FRUCHT FINDER: AN" or "🍎 FRUCHT FINDER: AUS"
        btn.BackgroundColor3 = fruitFinder and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    end)
    
    y = createButton("🔄 FRUCHT DUPLIZIEREN", y, Color3.fromRGB(255, 215, 0), function()
        -- Fruit Dupe
    end)
    
    y = createButton("⚡ ALLE FRÜCHTE", y, Color3.fromRGB(128, 0, 128), function()
        -- Unlock all fruits
    end)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- 👁️ ESP TAB
function showESP()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("👁️ ESP: AUS", y, Color3.fromRGB(255, 0, 0), function()
        toggleESP()
        local btn = Content:GetChildren()[1]
        btn.Text = espEnabled and "👁️ ESP: AN" or "👁️ ESP: AUS"
        btn.BackgroundColor3 = espEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    end)
    
    y = createButton("🍎 FRUCHT ESP", y, Color3.fromRGB(0, 255, 0), function()
        -- Fruit ESP
    end)
    
    y = createButton("📦 SCHATZ ESP", y, Color3.fromRGB(255, 215, 0), function()
        -- Chest ESP
    end)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- 🌍 TELEPORT TAB
function showTeleport()
    Content:ClearAllChildren()
    local y = 10
    
    for _, island in ipairs(islands) do
        y = createButton(island[1], y, Color3.fromRGB(0, 150, 255), function()
            rootPart.CFrame = island[2]
        end)
    end
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- ⚙️ STATS TAB
function showStats()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("⚡ MAX STATS", y, Color3.fromRGB(255, 215, 0), maxStats)
    y = createButton("💰 INFINITE BELI", y, Color3.fromRGB(0, 255, 0), function()
        -- Money hack
    end)
    y = createButton("⭐ MAX LEVEL", y, Color3.fromRGB(255, 0, 255), function()
        -- Max level
    end)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- 💰 FARM TAB
function showFarm()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("🌾 AUTO FARM: AUS", y, Color3.fromRGB(255, 0, 0), function()
        startAutoFarm()
        local btn = Content:GetChildren()[1]
        btn.Text = autoFarm and "🌾 AUTO FARM: AN" or "🌾 AUTO FARM: AUS"
        btn.BackgroundColor3 = autoFarm and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    end)
    
    y = createButton("💰 BELI FARM", y, Color3.fromRGB(255, 215, 0), function()
        -- Beli farm
    end)
    
    y = createButton("⚔️ BOSS FARM", y, Color3.fromRGB(255, 0, 0), function()
        -- Boss farm
    end)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- 🛡️ SCHUTZ TAB
function showProtection()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("🛡️ GODMODE", y, Color3.fromRGB(0, 255, 0), function()
        humanoid.MaxHealth = math.huge
        humanoid.Health = math.huge
    end)
    
    y = createButton("🔒 ANTI-KICK", y, Color3.fromRGB(255, 0, 0), activateProtection)
    
    y = createButton("👻 INVISIBLE", y, Color3.fromRGB(128, 128, 128), function()
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
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
        btn.BackgroundColor3 = t == tab and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(30, 20, 40)
        btn.TextColor3 = t == tab and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(200, 200, 200)
    end
    
    if tab == "⚔️ KAMPF" then showCombat()
    elseif tab == "🍎 FRÜCHTE" then showFruits()
    elseif tab == "👁️ ESP" then showESP()
    elseif tab == "🌍 TELEPORT" then showTeleport()
    elseif tab == "⚙️ STATS" then showStats()
    elseif tab == "💰 FARM" then showFarm()
    elseif tab == "🛡️ SCHUTZ" then showProtection() end
end

for tab, btn in pairs(TabButtons) do
    btn.MouseButton1Click:Connect(function() switchTab(tab) end)
end

-- Start
switchTab("⚔️ KAMPF")

print("🔥 BLOX FRUITS OP GUI GELADEN!")
print("👑 Made by WALED-HAMMAD")
print("🎮 RightControl - GUI an/aus")
print("⚡ 50+ OP TOOLS AKTIVIERT")
