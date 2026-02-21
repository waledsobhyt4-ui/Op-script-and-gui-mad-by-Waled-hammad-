-- ============================================
-- BRAINROT ULTIMATE OP SCRIPT V6
-- PC/MOBILE OPTIMIZED | PETS BRINGEN | 50+ TOOLS
-- NOCLIP | DUPE PETS | GODMODE | INFINITE JUMP
-- ESP SCAN | INFINITE MONEY | ALL TOOLS
-- ANTI-BAN | NO KICK | GRÖSSERE GUI
-- GALAXY FLOATING MENU
-- MADE BY WALED-HAMMAD
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
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local MarketplaceService = game:GetService("MarketplaceService")
local Stats = game:GetService("Stats")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local mouse = player:GetMouse()

-- Device Check
local isMobile = UserInputService.TouchEnabled

-- ============================================
-- ANTI-BAN SYSTEM (NO KICK)
-- ============================================
local function antiBanSystem()
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        
        if method == "Kick" or method == "kick" then
            return nil
        end
        
        if self.Name == "BanEvent" or self.Name == "KickEvent" or self.Name == "AntiCheat" then
            return nil
        end
        
        return old(self, ...)
    end)
    
    setreadonly(mt, true)
    
    if game:GetService("LogService") then
        game:GetService("LogService"):SetLogsVisible(false)
    end
    
    print("🛡️ Anti-Ban System aktiviert!")
end

antiBanSystem()

-- ============================================
-- BRAINROT VARIABLEN
-- ============================================
local noclip = false
local godMode = false
local infiniteJump = false
local espEnabled = false
local autoCollect = false
local autoFarm = false
local dupePets = false
local dupeItems = false
local speedBoost = false
local flyMode = false
local magnetActive = false
local antiAFK = false
local wallhack = false
local infiniteMoney = false
local autoMerge = false
local autoSteal = false
local clickerActive = false
local killAura = false
local bringPets = false
local bringPlayers = false
local bringItems = false
local teleportToMouse = false
local noclipPlayers = false
local freezePlayers = false
local spinPlayers = false
local explodePlayers = false
local flyPlayers = false
local speedPlayers = false
local jumpPlayers = false
local invisPlayers = false
local godPlayers = false

local flySpeed = 50
local walkSpeed = 100
local jumpPower = 200
local bringRange = 50
local magnetRange = 40

local collectedPets = {}
local collectedTools = {}
local espObjects = {}
local noclipConnection = nil
local jumpConnection = nil
local flyBodyGyro, flyBodyVelocity
local broughtObjects = {}
local playerEffects = {}

-- ============================================
-- GALAXY FLOATING MENU DESIGN (PC/MOBILE OPTIMIZED)
-- ============================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BrainrotOP"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

-- Hauptframe mit Galaxy Effekt (GRÖSSER)
local MainFrame = Instance.new("Frame")
MainFrame.Size = isMobile and UDim2.new(0, 380, 0, 600) or UDim2.new(0, 550, 0, 700)
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -350)
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

-- Floating Effect
MainFrame.Draggable = true

-- Galaxy Hintergrund
local Galaxy = Instance.new("Frame")
Galaxy.Size = UDim2.new(1, 0, 1, 0)
Galaxy.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Galaxy.BackgroundTransparency = 0.5
Galaxy.ZIndex = -1
Galaxy.Parent = MainFrame

-- Sterne Effekt (mehr Sterne für größere GUI)
for i = 1, 200 do
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

-- Titel (größer)
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 70)
Title.BackgroundColor3 = Color3.fromRGB(20, 5, 30)
Title.Text = "🧠 BRAINROT ULTIMATE OP V6"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = isMobile and 24 or 30
Title.TextStrokeTransparency = 0.3
Title.TextStrokeColor3 = Color3.fromRGB(100, 0, 255)
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
YouTubeBtn.Size = UDim2.new(0.45, 0, 0, 35)
YouTubeBtn.Position = UDim2.new(0.05, 0, 0, 105)
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
    notification("📺 YouTube Link kopiert!", "info")
end)

-- TikTok Button
local TikTokBtn = Instance.new("TextButton")
TikTokBtn.Size = UDim2.new(0.45, 0, 0, 35)
TikTokBtn.Position = UDim2.new(0.52, 0, 0, 105)
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
    notification("🎵 TikTok Link kopiert!", "info")
end)

-- PC/Mobile Indicator
local DeviceLabel = Instance.new("TextLabel")
DeviceLabel.Size = UDim2.new(1, 0, 0, 20)
DeviceLabel.Position = UDim2.new(0, 0, 0, 140)
DeviceLabel.BackgroundTransparency = 1
DeviceLabel.Text = isMobile and "📱 MOBILE MODUS" or "💻 PC MODUS"
DeviceLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
DeviceLabel.Font = Enum.Font.SourceSansBold
DeviceLabel.TextSize = 14
DeviceLabel.Parent = MainFrame

-- Tabs (MEHR TABS FÜR MEHR TOOLS)
local Tabs = {"🧠 MAIN", "🐾 PETS", "💰 MONEY", "🛡️ GOD", "👁️ ESP", "⚡ MOVE", "🎮 TOOLS", "🔥 BRING", "👥 PLAYER", "⚙️ EXTRA"}
local TabButtons = {}
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(1, -20, 0, 50)
TabFrame.Position = UDim2.new(0, 10, 0, 165)
TabFrame.BackgroundTransparency = 1
TabFrame.Parent = MainFrame

for i, tab in ipairs(Tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.1, 0, 1, 0)
    btn.Position = UDim2.new(0.1 * (i-1), 2, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(30, 15, 45)
    btn.Text = tab
    btn.TextColor3 = Color3.fromRGB(200, 200, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = isMobile and 9 or 11
    btn.Parent = TabFrame

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn

    TabButtons[tab] = btn
end

-- Content (größer)
local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(1, -20, 1, -250)
Content.Position = UDim2.new(0, 10, 0, 225)
Content.BackgroundTransparency = 1
Content.ScrollBarThickness = 8
Content.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
Content.CanvasSize = UDim2.new(0, 0, 0, 1200)
Content.Parent = MainFrame

-- X Button (GUI nur unsichtbar machen)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -40, 0, 10)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 24
CloseBtn.Parent = MainFrame

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ToggleBtn.Text = "🧠"
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
end)

-- Toggle Button (Mobile & PC)
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = isMobile and UDim2.new(0, 70, 0, 70) or UDim2.new(0, 60, 0, 60)
ToggleBtn.Position = isMobile and UDim2.new(0, 15, 0.8, 0) or UDim2.new(0, 10, 0.5, -30)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
ToggleBtn.Text = "🧠"
ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = isMobile and 35 or 30
ToggleBtn.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, isMobile and 35 or 30)
ToggleCorner.Parent = ToggleBtn

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    ToggleBtn.Text = MainFrame.Visible and "✕" or "🧠"
    ToggleBtn.BackgroundColor3 = MainFrame.Visible and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(255, 215, 0)
end)

-- Hotkey (nur für PC)
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
function notification(msg, type)
    local color = Color3.fromRGB(0, 255, 0)
    if type == "error" then color = Color3.fromRGB(255, 0, 0)
    elseif type == "warn" then color = Color3.fromRGB(255, 255, 0)
    elseif type == "info" then color = Color3.fromRGB(0, 255, 255)
    elseif type == "success" then color = Color3.fromRGB(0, 255, 0) end
    
    StarterGui:SetCore("SendNotification", {
        Title = "🧠 BRAINROT",
        Text = msg,
        Duration = 3
    })
    print("[BRAINROT] " .. msg)
end

-- ============================================
-- BUTTON FUNKTIONEN
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
local function createToggle(text, yPos, color, getState, setState)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, isMobile and 55 or 50)
    frame.Position = UDim2.new(0, 0, 0, yPos)
    frame.BackgroundColor3 = color
    frame.BackgroundTransparency = 0.2
    frame.Parent = Content

    local frameCorner = Instance.new("UICorner")
    frameCorner.CornerRadius = UDim.new(0, 8)
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
    toggleCorner.CornerRadius = UDim.new(0, 6)
    toggleCorner.Parent = toggleBtn

    toggleBtn.MouseButton1Click:Connect(function()
        setState()
        toggleBtn.Text = getState() and "AN" or "AUS"
        toggleBtn.BackgroundColor3 = getState() and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    end)

    return yPos + (isMobile and 60 or 55)
end

-- ============================================
-- BRING FUNKTIONEN (PETS ZU MIR HOLEN)
-- ============================================

-- PETS ZU MIR BRINGEN
function bringAllPets()
    local count = 0
    for _, obj in pairs(Workspace:GetDescendants()) do
        local name = obj.Name:lower()
        if name:find("pet") or name:find("tier") or name:find("animal") or name:find("skibidi") or name:find("toilet") then
            if obj:IsA("Model") or obj:IsA("Tool") then
                pcall(function()
                    if obj:IsA("Model") and obj:FindFirstChild("HumanoidRootPart") then
                        obj.HumanoidRootPart.CFrame = rootPart.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
                        count = count + 1
                    elseif obj:IsA("Tool") and obj:FindFirstChild("Handle") then
                        obj.Handle.CFrame = rootPart.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
                        count = count + 1
                    end
                end)
                task.wait(0.05)
            end
        end
    end
    notification("🐾 " .. count .. " Pets zu dir gebracht!", "success")
end

-- ALLE ITEMS ZU MIR BRINGEN
function bringAllItems()
    local count = 0
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Tool") or obj:IsA("Part") then
            if obj:IsA("Tool") and obj:FindFirstChild("Handle") then
                pcall(function()
                    obj.Handle.CFrame = rootPart.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
                    count = count + 1
                end)
            elseif obj:IsA("Part") and obj.CanCollide then
                pcall(function()
                    obj.CFrame = rootPart.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
                    count = count + 1
                end)
            end
            task.wait(0.02)
        end
    end
    notification("📦 " .. count .. " Items zu dir gebracht!", "success")
end

-- ALLE SPIELER ZU MIR BRINGEN
function bringAllPlayers()
    local count = 0
    for _, target in pairs(Players:GetPlayers()) do
        if target ~= player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            pcall(function()
                target.Character.HumanoidRootPart.CFrame = rootPart.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
                count = count + 1
            end)
            task.wait(0.1)
        end
    end
    notification("👥 " .. count .. " Spieler zu dir gebracht!", "success")
end

-- ALLES ZU MIR BRINGEN (MASSENBRING)
function bringEverything()
    notification("🚀 Bringe alles zu dir...", "info")
    bringAllPets()
    task.wait(0.5)
    bringAllItems()
    task.wait(0.5)
    bringAllPlayers()
    notification("✅ Alles wurde zu dir gebracht!", "success")
end

-- AUTO BRING (Automatisch Items in der Nähe bringen)
function startAutoBring()
    bringPets = not bringPets
    if bringPets then
        spawn(function()
            while bringPets do
                for _, obj in pairs(Workspace:GetDescendants()) do
                    local name = obj.Name:lower()
                    if (name:find("pet") or name:find("tier") or name:find("coin") or name:find("gem")) and obj:IsA("Part") then
                        if (obj.Position - rootPart.Position).Magnitude < bringRange then
                            pcall(function()
                                obj.CFrame = rootPart.CFrame
                                task.wait(0.1)
                            end)
                        end
                    end
                end
                task.wait(0.5)
            end
        end)
        notification("🔄 Auto Bring gestartet (Reichweite: " .. bringRange .. ")", "success")
    else
        notification("🔄 Auto Bring gestoppt", "info")
    end
end

-- MAGNET (Alles anziehen)
function startMagnet()
    magnetActive = not magnetActive
    if magnetActive then
        spawn(function()
            while magnetActive do
                for _, obj in pairs(Workspace:GetDescendants()) do
                    if obj:IsA("Part") and obj.CanCollide and (obj.Name:lower():find("pet") or obj.Name:lower():find("coin") or obj.Name:lower():find("gem") or obj.Name:lower():find("tool")) then
                        if (obj.Position - rootPart.Position).Magnitude < magnetRange then
                            pcall(function()
                                obj.CFrame = rootPart.CFrame
                            end)
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
        notification("🧲 Magnet aktiviert (Reichweite: " .. magnetRange .. ")", "success")
    else
        notification("🧲 Magnet deaktiviert", "info")
    end
end

-- ============================================
-- NOCLIP
-- ============================================
function toggleNoclip()
    noclip = not noclip
    
    if noclip then
        if noclipConnection then noclipConnection:Disconnect() end
        noclipConnection = RunService.Stepped:Connect(function()
            if character and noclip then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
        notification("🚪 Noclip aktiviert", "success")
    else
        if noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
        end
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
        notification("🚪 Noclip deaktiviert", "info")
    end
end

-- ============================================
-- GOD MODE
-- ============================================
function toggleGodMode()
    godMode = not godMode
    
    if godMode then
        humanoid.MaxHealth = math.huge
        humanoid.Health = math.huge
        humanoid.BreakJointsOnDeath = false
        notification("🛡️ God Mode aktiviert", "success")
    else
        humanoid.MaxHealth = 100
        humanoid.Health = 100
        humanoid.BreakJointsOnDeath = true
        notification("🛡️ God Mode deaktiviert", "info")
    end
end

-- ============================================
-- INFINITE JUMP
-- ============================================
function toggleInfiniteJump()
    infiniteJump = not infiniteJump
    
    if infiniteJump then
        humanoid.JumpPower = jumpPower
        if jumpConnection then jumpConnection:Disconnect() end
        jumpConnection = UserInputService.JumpRequest:Connect(function()
            if infiniteJump then
                humanoid:ChangeState("Jumping")
            end
        end)
        notification("🦘 Infinite Jump aktiviert", "success")
    else
        humanoid.JumpPower = 50
        if jumpConnection then
            jumpConnection:Disconnect()
            jumpConnection = nil
        end
        notification("🦘 Infinite Jump deaktiviert", "info")
    end
end

-- ============================================
-- ESP
-- ============================================
function toggleESP()
    espEnabled = not espEnabled
    
    if espEnabled then
        for _, obj in pairs(espObjects) do
            if obj and obj.Parent then obj:Destroy() end
        end
        espObjects = {}
        
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("Part") or obj:IsA("MeshPart") or obj:IsA("Model") then
                local name = obj.Name:lower()
                local highlight = Instance.new("Highlight")
                highlight.Adornee = obj
                highlight.FillTransparency = 0.5
                
                if name:find("pet") or name:find("tier") or name:find("skibidi") or name:find("toilet") then
                    highlight.FillColor = Color3.fromRGB(255, 0, 255)
                    table.insert(espObjects, highlight)
                    highlight.Parent = obj
                elseif name:find("coin") or name:find("money") then
                    highlight.FillColor = Color3.fromRGB(255, 215, 0)
                    table.insert(espObjects, highlight)
                    highlight.Parent = obj
                elseif name:find("gem") or name:find("diamond") then
                    highlight.FillColor = Color3.fromRGB(0, 255, 255)
                    table.insert(espObjects, highlight)
                    highlight.Parent = obj
                elseif name:find("tool") or name:find("item") then
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    table.insert(espObjects, highlight)
                    highlight.Parent = obj
                elseif name:find("egg") then
                    highlight.FillColor = Color3.fromRGB(255, 255, 255)
                    table.insert(espObjects, highlight)
                    highlight.Parent = obj
                end
            end
        end
        notification("👁️ ESP aktiviert", "success")
    else
        for _, obj in pairs(espObjects) do
            if obj and obj.Parent then obj:Destroy() end
        end
        espObjects = {}
        notification("👁️ ESP deaktiviert", "info")
    end
end

-- ============================================
-- FLY MODE
-- ============================================
function toggleFly()
    flyMode = not flyMode
    
    if flyMode then
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
            if not flyMode then return end
            
            local camera = Workspace.CurrentCamera
            local dir = Vector3.new(0, 0, 0)
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.new(0, 1, 0) end
            
            flyBodyVelocity.Velocity = dir.Unit * flySpeed
            flyBodyGyro.CFrame = camera.CFrame
        end)
        
        humanoid.PlatformStand = true
        notification("✈️ Fly Mode aktiviert", "success")
    else
        if flyBodyGyro then flyBodyGyro:Destroy() end
        if flyBodyVelocity then flyBodyVelocity:Destroy() end
        humanoid.PlatformStand = false
        notification("✈️ Fly Mode deaktiviert", "info")
    end
end

-- ============================================
-- SPEED BOOST
-- ============================================
function toggleSpeedBoost()
    speedBoost = not speedBoost
    if speedBoost then
        humanoid.WalkSpeed = walkSpeed
        notification("⚡ Speed Boost aktiviert", "success")
    else
        humanoid.WalkSpeed = 16
        notification("⚡ Speed Boost deaktiviert", "info")
    end
end

-- ============================================
-- INFINITE MONEY
-- ============================================
function startInfiniteMoney()
    infiniteMoney = not infiniteMoney
    if infiniteMoney then
        spawn(function()
            while infiniteMoney do
                pcall(function()
                    if player:FindFirstChild("leaderstats") then
                        for _, stat in pairs(player.leaderstats:GetChildren()) do
                            if stat:IsA("IntValue") and (stat.Name:lower():find("cash") or stat.Name:lower():find("money") or stat.Name:lower():find("coins")) then
                                stat.Value = 999999999
                            end
                        end
                    end
                    
                    for _, child in pairs(player:GetChildren()) do
                        if child:IsA("IntValue") and (child.Name:lower():find("cash") or child.Name:lower():find("money") or child.Name:lower():find("coins")) then
                            child.Value = 999999999
                        end
                    end
                end)
                task.wait(0.5)
            end
        end)
        notification("💰 Infinite Money aktiviert", "success")
    else
        notification("💰 Infinite Money deaktiviert", "info")
    end
end

-- ============================================
-- AUTO COLLECT
-- ============================================
function startAutoCollect()
    autoCollect = not autoCollect
    if autoCollect then
        spawn(function()
            while autoCollect do
                for _, obj in pairs(Workspace:GetDescendants()) do
                    if obj:IsA("Part") and (obj.Name:lower():find("coin") or obj.Name:lower():find("pet") or obj.Name:lower():find("gem") or obj.Name:lower():find("tool")) then
                        if (obj.Position - rootPart.Position).Magnitude < 30 then
                            pcall(function()
                                rootPart.CFrame = obj.CFrame
                                task.wait(0.05)
                                firetouchinterest(rootPart, obj, 0)
                                firetouchinterest(rootPart, obj, 1)
                            end)
                        end
                    end
                end
                task.wait(0.3)
            end
        end)
        notification("📦 Auto Collect gestartet", "success")
    else
        notification("📦 Auto Collect gestoppt", "info")
    end
end

-- ============================================
-- AUTO FARM
-- ============================================
function startAutoFarm()
    autoFarm = not autoFarm
    if autoFarm then
        spawn(function()
            while autoFarm do
                for _, obj in pairs(Workspace:GetDescendants()) do
                    if obj.Name:lower():find("farm") or obj.Name:lower():find("field") or obj.Name:lower():find("crop") then
                        if obj:IsA("Part") then
                            rootPart.CFrame = obj.CFrame
                            task.wait(0.3)
                            firetouchinterest(rootPart, obj, 0)
                            firetouchinterest(rootPart, obj, 1)
                        end
                    end
                end
                task.wait(1)
            end
        end)
        notification("🌾 Auto Farm gestartet", "success")
    else
        notification("🌾 Auto Farm gestoppt", "info")
    end
end

-- ============================================
-- AUTO MERGE
-- ============================================
function startAutoMerge()
    autoMerge = not autoMerge
    if autoMerge then
        spawn(function()
            while autoMerge do
                for _, obj in pairs(player.Backpack:GetChildren()) do
                    if obj:IsA("Tool") then
                        pcall(function()
                            local args = { [1] = obj }
                            local mergeEvent = ReplicatedStorage:FindFirstChild("MergeEvent") or ReplicatedStorage:FindFirstChild("CombineEvent") or ReplicatedStorage:FindFirstChild("CraftEvent")
                            if mergeEvent then
                                mergeEvent:FireServer(unpack(args))
                            end
                        end)
                        task.wait(0.2)
                    end
                end
                task.wait(1)
            end
        end)
        notification("🔄 Auto Merge gestartet", "success")
    else
        notification("🔄 Auto Merge gestoppt", "info")
    end
end

-- ============================================
-- AUTO STEAL
-- ============================================
function startAutoSteal()
    autoSteal = not autoSteal
    if autoSteal then
        spawn(function()
            while autoSteal do
                for _, target in pairs(Players:GetPlayers()) do
                    if target ~= player and target.Character then
                        for _, obj in pairs(target.Backpack:GetChildren()) do
                            if obj:IsA("Tool") then
                                pcall(function()
                                    local clone = obj:Clone()
                                    clone.Parent = player.Backpack
                                end)
                                task.wait(0.1)
                            end
                        end
                    end
                end
                task.wait(2)
            end
        end)
        notification("👤 Auto Steal gestartet", "success")
    else
        notification("👤 Auto Steal gestoppt", "info")
    end
end

-- ============================================
-- AUTO CLICKER
-- ============================================
function startAutoClicker()
    clickerActive = not clickerActive
    if clickerActive then
        spawn(function()
            while clickerActive do
                pcall(function()
                    VirtualInputManager:SendMouseButtonEvent(mouse.X, mouse.Y, 0, true, game, 1)
                    task.wait(0.05)
                    VirtualInputManager:SendMouseButtonEvent(mouse.X, mouse.Y, 0, false, game, 1)
                end)
                task.wait(0.1)
            end
        end)
        notification("🖱️ Auto Clicker gestartet", "success")
    else
        notification("🖱️ Auto Clicker gestoppt", "info")
    end
end

-- ============================================
-- DUPE PETS
-- ============================================
function startDupePets()
    dupePets = not dupePets
    if dupePets then
        spawn(function()
            while dupePets do
                for _, obj in pairs(player.Backpack:GetChildren()) do
                    if obj:IsA("Tool") and (obj.Name:lower():find("pet") or obj.Name:lower():find("tier")) then
                        pcall(function()
                            local clone = obj:Clone()
                            clone.Parent = player.Backpack
                        end)
                        task.wait(0.1)
                    end
                end
                notification("🐾 Pets dupliziert", "success")
                task.wait(2)
            end
        end)
        notification("🔄 Dupe Pets gestartet", "success")
    else
        notification("🔄 Dupe Pets gestoppt", "info")
    end
end

-- ============================================
-- PETS SCANNEN UND HOLEN
-- ============================================
function scanAndGetPets()
    local count = 0
    for _, obj in pairs(Workspace:GetDescendants()) do
        local name = obj.Name:lower()
        if name:find("pet") or name:find("tier") or name:find("skibidi") or name:find("toilet") then
            if obj:IsA("Model") or obj:IsA("Tool") then
                pcall(function()
                    local clone = obj:Clone()
                    clone.Parent = player.Backpack
                    count = count + 1
                end)
                task.wait(0.05)
            end
        end
    end
    notification("🐾 " .. count .. " Pets eingesammelt", "success")
end

-- ============================================
-- ALLE TOOLS SCANNEN UND HOLEN
-- ============================================
function scanAndGetTools()
    local count = 0
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Tool") then
            pcall(function()
                local clone = obj:Clone()
                clone.Parent = player.Backpack
                count = count + 1
            end)
            task.wait(0.05)
        end
    end
    notification("🛠️ " .. count .. " Tools eingesammelt", "success")
end

-- ============================================
-- KILL AURA
-- ============================================
function toggleKillAura()
    killAura = not killAura
    if killAura then
        spawn(function()
            while killAura do
                for _, target in pairs(Players:GetPlayers()) do
                    if target ~= player and target.Character and target.Character:FindFirstChild("Humanoid") then
                        if (target.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude < 30 then
                            target.Character.Humanoid.Health = 0
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
        notification("💀 Kill Aura aktiviert", "success")
    else
        notification("💀 Kill Aura deaktiviert", "info")
    end
end

-- ============================================
-- ANTI-AFK
-- ============================================
function toggleAntiAFK()
    antiAFK = not antiAFK
    if antiAFK then
        local vu = game:GetService("VirtualUser")
        player.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
        end)
        notification("🌀 Anti-AFK aktiviert", "success")
    else
        notification("🌀 Anti-AFK deaktiviert", "info")
    end
end

-- ============================================
-- RESET ALLE FUNKTIONEN
-- ============================================
function resetAll()
    if noclip then toggleNoclip() end
    if godMode then toggleGodMode() end
    if infiniteJump then toggleInfiniteJump() end
    if espEnabled then toggleESP() end
    if autoCollect then startAutoCollect() end
    if autoFarm then startAutoFarm() end
    if dupePets then startDupePets() end
    if speedBoost then toggleSpeedBoost() end
    if flyMode then toggleFly() end
    if magnetActive then startMagnet() end
    if antiAFK then toggleAntiAFK() end
    if wallhack then end
    if infiniteMoney then startInfiniteMoney() end
    if autoMerge then startAutoMerge() end
    if autoSteal then startAutoSteal() end
    if clickerActive then startAutoClicker() end
    if killAura then toggleKillAura() end
    if bringPets then startAutoBring() end
    
    notification("🔄 Alle Funktionen zurückgesetzt", "info")
end

-- ============================================
-- TABS INHALTE
-- ============================================

-- MAIN TAB
function showMainTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = createToggle("🚪 NOCLIP", y, Color3.fromRGB(100, 100, 255), function() return noclip end, toggleNoclip)
    y = createToggle("🛡️ GOD MODE", y, Color3.fromRGB(255, 100, 100), function() return godMode end, toggleGodMode)
    y = createToggle("🦘 INFINITE JUMP", y, Color3.fromRGB(100, 255, 100), function() return infiniteJump end, toggleInfiniteJump)
    y = createToggle("⚡ SPEED BOOST", y, Color3.fromRGB(255, 255, 100), function() return speedBoost end, toggleSpeedBoost)
    y = createToggle("✈️ FLY MODE", y, Color3.fromRGB(100, 255, 255), function() return flyMode end, toggleFly)
    y = createToggle("💰 INFINITE MONEY", y, Color3.fromRGB(255, 215, 0), function() return infiniteMoney end, startInfiniteMoney)
    y = createButton("🔄 ALLE ZURÜCKSETZEN", y, Color3.fromRGB(255, 0, 0), resetAll)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- PETS TAB
function showPetsTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("🐾 PETS SCANNEN & HOLEN", y, Color3.fromRGB(255, 0, 255), scanAndGetPets)
    y = createToggle("🔄 DUPE PETS", y, Color3.fromRGB(200, 0, 200), function() return dupePets end, startDupePets)
    y = createButton("🐾 ALLE PETS BRINGEN", y, Color3.fromRGB(150, 0, 150), bringAllPets)
    y = createToggle("🔄 AUTO BRING", y, Color3.fromRGB(100, 0, 100), function() return bringPets end, startAutoBring)
    y = createToggle("🧲 MAGNET", y, Color3.fromRGB(255, 0, 255), function() return magnetActive end, startMagnet)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- MONEY TAB
function showMoneyTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = createToggle("💰 INFINITE MONEY", y, Color3.fromRGB(255, 215, 0), function() return infiniteMoney end, startInfiniteMoney)
    y = createButton("💰 ALLE COINS BRINGEN", y, Color3.fromRGB(255, 200, 0), bringAllItems)
    y = createToggle("📦 AUTO COLLECT", y, Color3.fromRGB(0, 255, 255), function() return autoCollect end, startAutoCollect)
    y = createToggle("🌾 AUTO FARM", y, Color3.fromRGB(0, 255, 0), function() return autoFarm end, startAutoFarm)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- GOD TAB
function showGodTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = createToggle("🛡️ GOD MODE", y, Color3.fromRGB(255, 0, 0), function() return godMode end, toggleGodMode)
    y = createToggle("💀 KILL AURA", y, Color3.fromRGB(139, 0, 0), function() return killAura end, toggleKillAura)
    y = createButton("💀 ALLE TÖTEN", y, Color3.fromRGB(139, 0, 0), function()
        for _, target in pairs(Players:GetPlayers()) do
            if target ~= player and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.Health = 0
            end
        end
        notification("💀 Alle getötet!", "success")
    end)
    y = createButton("❤️ ALLE HEILEN", y, Color3.fromRGB(0, 255, 0), function()
        for _, target in pairs(Players:GetPlayers()) do
            if target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.Health = target.Character.Humanoid.MaxHealth
            end
        end
        notification("❤️ Alle geheilt!", "success")
    end)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- ESP TAB
function showESPTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = createToggle("👁️ ESP", y, Color3.fromRGB(255, 0, 0), function() return espEnabled end, toggleESP)
    y = createButton("🐾 PETS SCANNEN", y, Color3.fromRGB(255, 0, 255), scanAndGetPets)
    y = createButton("🛠️ TOOLS SCANNEN", y, Color3.fromRGB(255, 165, 0), scanAndGetTools)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- MOVE TAB
function showMoveTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = createToggle("🚪 NOCLIP", y, Color3.fromRGB(100, 100, 255), function() return noclip end, toggleNoclip)
    y = createToggle("🦘 INFINITE JUMP", y, Color3.fromRGB(100, 255, 100), function() return infiniteJump end, toggleInfiniteJump)
    y = createToggle("⚡ SPEED BOOST", y, Color3.fromRGB(255, 255, 100), function() return speedBoost end, toggleSpeedBoost)
    y = createToggle("✈️ FLY MODE", y, Color3.fromRGB(100, 255, 255), function() return flyMode end, toggleFly)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- TOOLS TAB
function showToolsTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("🛠️ ALLE TOOLS SCANNEN", y, Color3.fromRGB(255, 165, 0), scanAndGetTools)
    y = createButton("📦 ALLE ITEMS BRINGEN", y, Color3.fromRGB(255, 140, 0), bringAllItems)
    y = createToggle("📦 AUTO COLLECT", y, Color3.fromRGB(0, 255, 255), function() return autoCollect end, startAutoCollect)
    y = createToggle("🔄 AUTO MERGE", y, Color3.fromRGB(255, 0, 255), function() return autoMerge end, startAutoMerge)
    y = createToggle("👤 AUTO STEAL", y, Color3.fromRGB(255, 0, 0), function() return autoSteal end, startAutoSteal)
    y = createToggle("🖱️ AUTO CLICKER", y, Color3.fromRGB(0, 255, 0), function() return clickerActive end, startAutoClicker)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- BRING TAB
function showBringTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("🐾 ALLE PETS BRINGEN", y, Color3.fromRGB(255, 0, 255), bringAllPets)
    y = createButton("📦 ALLE ITEMS BRINGEN", y, Color3.fromRGB(255, 165, 0), bringAllItems)
    y = createButton("👥 ALLE SPIELER BRINGEN", y, Color3.fromRGB(0, 255, 255), bringAllPlayers)
    y = createButton("🚀 ALLES BRINGEN", y, Color3.fromRGB(255, 215, 0), bringEverything)
    y = createToggle("🔄 AUTO BRING", y, Color3.fromRGB(100, 0, 100), function() return bringPets end, startAutoBring)
    y = createToggle("🧲 MAGNET", y, Color3.fromRGB(255, 0, 255), function() return magnetActive end, startMagnet)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- PLAYER TAB
function showPlayerTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("👥 ALLE SPIELER BRINGEN", y, Color3.fromRGB(0, 255, 255), bringAllPlayers)
    y = createButton("💀 ALLE TÖTEN", y, Color3.fromRGB(255, 0, 0), function()
        for _, target in pairs(Players:GetPlayers()) do
            if target ~= player and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.Health = 0
            end
        end
        notification("💀 Alle getötet!", "success")
    end)
    y = createButton("❤️ ALLE HEILEN", y, Color3.fromRGB(0, 255, 0), function()
        for _, target in pairs(Players:GetPlayers()) do
            if target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.Health = target.Character.Humanoid.MaxHealth
            end
        end
        notification("❤️ Alle geheilt!", "success")
    end)
    y = createToggle("💀 KILL AURA", y, Color3.fromRGB(139, 0, 0), function() return killAura end, toggleKillAura)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- EXTRA TAB
function showExtraTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = createToggle("🔄 AUTO MERGE", y, Color3.fromRGB(255, 0, 255), function() return autoMerge end, startAutoMerge)
    y = createToggle("👤 AUTO STEAL", y, Color3.fromRGB(255, 0, 0), function() return autoSteal end, startAutoSteal)
    y = createToggle("🖱️ AUTO CLICKER", y, Color3.fromRGB(0, 255, 0), function() return clickerActive end, startAutoClicker)
    y = createToggle("🌀 ANTI-AFK", y, Color3.fromRGB(0, 255, 255), function() return antiAFK end, toggleAntiAFK)
    
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

    if tab == "🧠 MAIN" then showMainTab()
    elseif tab == "🐾 PETS" then showPetsTab()
    elseif tab == "💰 MONEY" then showMoneyTab()
    elseif tab == "🛡️ GOD" then showGodTab()
    elseif tab == "👁️ ESP" then showESPTab()
    elseif tab == "⚡ MOVE" then showMoveTab()
    elseif tab == "🎮 TOOLS" then showToolsTab()
    elseif tab == "🔥 BRING" then showBringTab()
    elseif tab == "👥 PLAYER" then showPlayerTab()
    elseif tab == "⚙️ EXTRA" then showExtraTab() end
end

for tab, btn in pairs(TabButtons) do
    btn.MouseButton1Click:Connect(function() switchTab(tab) end)
end

-- Start
switchTab("🧠 MAIN")

-- Willkommensmeldung
print("🧠 BRAINROT ULTIMATE OP SCRIPT V6")
print("👑 Made by WALED-HAMMAD")
print("📺 YouTube: @hacker666-00")
print("🎵 TikTok: @mods_and_hacks")
print(isMobile and "📱 MOBILE MODUS" or "💻 PC MODUS")
print("🎮 Toggle Button / RightControl")

notification("🧠 BRAINROT OP V6 GELADEN!", "success")
