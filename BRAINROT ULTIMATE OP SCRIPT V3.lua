-- ============================================
-- BRAINROT ULTIMATE OP SCRIPT V3
-- NOCLIP | DUPE PETS | GODMODE | INFINITE JUMP
-- ESP SCAN | INFINITE MONEY | ALL TOOLS
-- GALAXY FLOATING MENU
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
local TeleportService = game:GetService("TeleportService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local MarketplaceService = game:GetService("MarketplaceService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local mouse = player:GetMouse()

-- Device Check
local isMobile = UserInputService.TouchEnabled

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

local collectedPets = {}
local collectedTools = {}
local espObjects = {}
local noclipConnection = nil
local jumpConnection = nil

-- ============================================
-- GALAXY FLOATING MENU DESIGN
-- ============================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BrainrotOP"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

-- Hauptframe mit Galaxy Effekt
local MainFrame = Instance.new("Frame")
MainFrame.Size = isMobile and UDim2.new(0, 320, 0, 500) or UDim2.new(0, 400, 0, 550)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -275)
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
Title.BackgroundColor3 = Color3.fromRGB(20, 5, 30)
Title.Text = "🧠 BRAINROT OP"
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

-- YouTube Button
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
    notification("📺 YouTube Link kopiert!", "info")
end)

-- TikTok Button
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
    notification("🎵 TikTok Link kopiert!", "info")
end)

-- Tabs
local Tabs = {"🧠 MAIN", "🐾 PETS", "💰 MONEY", "🛡️ GOD", "👁️ ESP", "⚡ MOVEMENT", "🎮 TOOLS"}
local TabButtons = {}
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(1, -20, 0, 40)
TabFrame.Position = UDim2.new(0, 10, 0, 140)
TabFrame.BackgroundTransparency = 1
TabFrame.Parent = MainFrame

for i, tab in ipairs(Tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.14, 0, 1, 0)
    btn.Position = UDim2.new(0.14 * (i-1), 2, 0, 0)
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

-- Content
local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(1, -20, 1, -210)
Content.Position = UDim2.new(0, 10, 0, 190)
Content.BackgroundTransparency = 1
Content.ScrollBarThickness = 8
Content.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
Content.CanvasSize = UDim2.new(0, 0, 0, 600)
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
ToggleBtn.Text = "🧠"
ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 30
ToggleBtn.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 30)
ToggleCorner.Parent = ToggleBtn

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    ToggleBtn.Text = MainFrame.Visible and "✕" or "🧠"
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
    btn.TextSize = isMobile and 14 or 12
    btn.Parent = Content

    btn.MouseButton1Click:Connect(callback)

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
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
    frameCorner.CornerRadius = UDim.new(0, 8)
    frameCorner.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.SourceSansBold
    label.TextSize = isMobile and 14 or 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0.25, 0, 0.8, 0)
    toggleBtn.Position = UDim2.new(0.72, 0, 0.1, 0)
    toggleBtn.BackgroundColor3 = getState() and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    toggleBtn.Text = getState() and "AN" or "AUS"
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.Font = Enum.Font.SourceSansBold
    toggleBtn.TextSize = isMobile and 12 or 10
    toggleBtn.Parent = frame

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 6)
    toggleCorner.Parent = toggleBtn

    toggleBtn.MouseButton1Click:Connect(function()
        setState()
        toggleBtn.Text = getState() and "AN" or "AUS"
        toggleBtn.BackgroundColor3 = getState() and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    end)

    return yPos + (isMobile and 55 or 50)
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
-- NOCLIP (Tür auschalten / Durch Wände gehen)
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
        notification("🚪 Noclip aktiviert - Türen aus!", "success")
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
-- GOD MODE (Unverwundbar)
-- ============================================
function toggleGodMode()
    godMode = not godMode
    
    if godMode then
        humanoid.MaxHealth = math.huge
        humanoid.Health = math.huge
        humanoid.BreakJointsOnDeath = false
        notification("🛡️ God Mode aktiviert - Unverwundbar!", "success")
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
        if jumpConnection then jumpConnection:Disconnect() end
        jumpConnection = UserInputService.JumpRequest:Connect(function()
            if infiniteJump then
                humanoid:ChangeState("Jumping")
            end
        end)
        notification("🦘 Infinite Jump aktiviert!", "success")
    else
        if jumpConnection then
            jumpConnection:Disconnect()
            jumpConnection = nil
        end
        notification("🦘 Infinite Jump deaktiviert", "info")
    end
end

-- ============================================
-- ESP SCAN (Pets, Tools, Items sehen)
-- ============================================
function toggleESP()
    espEnabled = not espEnabled
    
    if espEnabled then
        -- Bestehende Highlights löschen
        for _, obj in pairs(espObjects) do
            if obj and obj.Parent then
                obj:Destroy()
            end
        end
        espObjects = {}
        
        -- Alle Objekte scannen
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("Part") or obj:IsA("MeshPart") or obj:IsA("Model") then
                local name = obj.Name:lower()
                local highlight = Instance.new("Highlight")
                highlight.Adornee = obj
                highlight.FillTransparency = 0.5
                
                if name:find("pet") or name:find("tier") or name:find("animal") then
                    highlight.FillColor = Color3.fromRGB(255, 0, 255) -- Lila für Pets
                    table.insert(espObjects, highlight)
                elseif name:find("coin") or name:find("money") or name:find("cash") then
                    highlight.FillColor = Color3.fromRGB(255, 215, 0) -- Gold für Coins
                    table.insert(espObjects, highlight)
                elseif name:find("gem") or name:find("diamond") or name:find("crystal") then
                    highlight.FillColor = Color3.fromRGB(0, 255, 255) -- Cyan für Gems
                    table.insert(espObjects, highlight)
                elseif name:find("tool") or name:find("item") or name:find("weapon") then
                    highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Rot für Tools
                    table.insert(espObjects, highlight)
                elseif name:find("egg") then
                    highlight.FillColor = Color3.fromRGB(255, 255, 255) -- Weiß für Eier
                    table.insert(espObjects, highlight)
                else
                    highlight:Destroy()
                end
                
                highlight.Parent = obj
            end
        end
        notification("👁️ ESP Scan aktiviert - Alle Items sichtbar!", "success")
    else
        for _, obj in pairs(espObjects) do
            if obj and obj.Parent then
                obj:Destroy()
            end
        end
        espObjects = {}
        notification("👁️ ESP deaktiviert", "info")
    end
end

-- ============================================
-- PETS SCANNEN UND EINSAMMELN
-- ============================================
function scanAndGetPets()
    local count = 0
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj.Name:lower():find("pet") or obj.Name:lower():find("tier") then
            if obj:IsA("Model") or obj:IsA("Tool") then
                local clone = obj:Clone()
                clone.Parent = player.Backpack
                count = count + 1
                table.insert(collectedPets, obj.Name)
                task.wait(0.05)
            elseif obj:IsA("Part") then
                rootPart.CFrame = obj.CFrame
                task.wait(0.1)
                firetouchinterest(rootPart, obj, 0)
                firetouchinterest(rootPart, obj, 1)
                count = count + 1
            end
        end
    end
    notification("🐾 " .. count .. " Pets eingesammelt!", "success")
end

-- ============================================
-- ALLE TOOLS SCANNEN UND EINSAMMELN
-- ============================================
function scanAndGetTools()
    local count = 0
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Tool") or obj.Name:lower():find("tool") or obj.Name:lower():find("item") then
            local clone = obj:Clone()
            clone.Parent = player.Backpack
            count = count + 1
            table.insert(collectedTools, obj.Name)
            task.wait(0.05)
        end
    end
    notification("🛠️ " .. count .. " Tools eingesammelt!", "success")
end

-- ============================================
-- DUPE PETS (Pets duplizieren)
-- ============================================
function startDupePets()
    dupePets = not dupePets
    if dupePets then
        spawn(function()
            while dupePets do
                for _, obj in pairs(player.Backpack:GetChildren()) do
                    if obj:IsA("Tool") and obj.Name:lower():find("pet") then
                        local clone = obj:Clone()
                        clone.Parent = player.Backpack
                        task.wait(0.1)
                    end
                end
                notification("🐾 Pets dupliziert!", "success")
                task.wait(2)
            end
        end)
        notification("🔄 Dupe Pets gestartet!", "success")
    else
        notification("🔄 Dupe Pets gestoppt", "info")
    end
end

-- ============================================
-- INFINITE MONEY (Alles kaufen können)
-- ============================================
function startInfiniteMoney()
    infiniteMoney = not infiniteMoney
    if infiniteMoney then
        spawn(function()
            while infiniteMoney do
                for _, obj in pairs(Workspace:GetDescendants()) do
                    if obj:IsA("Part") and obj.Name:lower():find("coin") then
                        obj:Destroy()
                        local newCoin = obj:Clone()
                        newCoin.Parent = Workspace
                        newCoin.Position = rootPart.Position
                        task.wait(0.1)
                    end
                    
                    -- Geld in PlayerStats suchen
                    if player:FindFirstChild("leaderstats") then
                        for _, stat in pairs(player.leaderstats:GetChildren()) do
                            if stat:IsA("IntValue") and (stat.Name:lower():find("cash") or stat.Name:lower():find("money") or stat.Name:lower():find("coins")) then
                                stat.Value = 999999999
                            end
                        end
                    end
                end
                task.wait(0.5)
            end
        end)
        notification("💰 Infinite Money aktiviert - Alles kaufbar!", "success")
    else
        notification("💰 Infinite Money deaktiviert", "info")
    end
end

-- ============================================
-- AUTO COLLECT (Automatisch einsammeln)
-- ============================================
function startAutoCollect()
    autoCollect = not autoCollect
    if autoCollect then
        spawn(function()
            while autoCollect do
                for _, obj in pairs(Workspace:GetDescendants()) do
                    if obj:IsA("Part") and (obj.Name:lower():find("coin") or obj.Name:lower():find("pet") or obj.Name:lower():find("gem") or obj.Name:lower():find("tool")) then
                        if (obj.Position - rootPart.Position).Magnitude < 30 then
                            rootPart.CFrame = obj.CFrame
                            task.wait(0.05)
                            firetouchinterest(rootPart, obj, 0)
                            firetouchinterest(rootPart, obj, 1)
                        end
                    end
                end
                task.wait(0.3)
            end
        end)
        notification("📦 Auto Collect gestartet!", "success")
    else
        notification("📦 Auto Collect gestoppt", "info")
    end
end

-- ============================================
-- SPEED BOOST
-- ============================================
function toggleSpeedBoost()
    speedBoost = not speedBoost
    if speedBoost then
        humanoid.WalkSpeed = 100
        notification("⚡ Speed Boost aktiviert!", "success")
    else
        humanoid.WalkSpeed = 16
        notification("⚡ Speed Boost deaktiviert", "info")
    end
end

-- ============================================
-- FLY MODE
-- ============================================
local flyBodyGyro, flyBodyVelocity

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
            
            flyBodyVelocity.Velocity = dir.Unit * 50
            flyBodyGyro.CFrame = camera.CFrame
        end)
        
        humanoid.PlatformStand = true
        notification("✈️ Fly Mode aktiviert!", "success")
    else
        if flyBodyGyro then flyBodyGyro:Destroy() end
        if flyBodyVelocity then flyBodyVelocity:Destroy() end
        humanoid.PlatformStand = false
        notification("✈️ Fly Mode deaktiviert", "info")
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
        notification("🌀 Anti-AFK aktiviert!", "success")
    else
        notification("🌀 Anti-AFK deaktiviert", "info")
    end
end

-- ============================================
-- MAGNET (Zieht Items an)
-- ============================================
function startMagnet()
    magnetActive = not magnetActive
    if magnetActive then
        spawn(function()
            while magnetActive do
                for _, obj in pairs(Workspace:GetDescendants()) do
                    if obj:IsA("Part") and (obj.Name:lower():find("coin") or obj.Name:lower():find("gem") or obj.Name:lower():find("pet") or obj.Name:lower():find("tool")) then
                        if (obj.Position - rootPart.Position).Magnitude < 40 then
                            obj.CFrame = rootPart.CFrame
                            task.wait(0.05)
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
        notification("🧲 Magnet aktiviert - Items werden angezogen!", "success")
    else
        notification("🧲 Magnet deaktiviert", "info")
    end
end

-- ============================================
-- WALLHACK (Durch Wände sehen)
-- ============================================
function toggleWallhack()
    wallhack = not wallhack
    if wallhack then
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("Part") or obj:IsA("MeshPart") then
                obj.LocalTransparencyModifier = 0.5
            end
        end
        notification("🔍 Wallhack aktiviert - Durch Wände sehen!", "success")
    else
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("Part") or obj:IsA("MeshPart") then
                obj.LocalTransparencyModifier = 0
            end
        end
        notification("🔍 Wallhack deaktiviert", "info")
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
    if dupePets then startDupePets() end
    if speedBoost then toggleSpeedBoost() end
    if flyMode then toggleFly() end
    if magnetActive then startMagnet() end
    if antiAFK then toggleAntiAFK() end
    if wallhack then toggleWallhack() end
    if infiniteMoney then startInfiniteMoney() end
    
    notification("🔄 Alle Funktionen zurückgesetzt!", "info")
end

-- ============================================
-- TELEPORT ZU PETS
-- ============================================
function teleportToPet()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj.Name:lower():find("pet") and obj:IsA("Part") then
            rootPart.CFrame = obj.CFrame
            notification("🐾 Zu Pet teleportiert!", "success")
            return
        end
    end
    notification("❌ Keine Pets gefunden!", "error")
end

-- ============================================
-- TELEPORT ZU COINS
-- ============================================
function teleportToCoins()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj.Name:lower():find("coin") and obj:IsA("Part") then
            rootPart.CFrame = obj.CFrame
            notification("💰 Zu Coins teleportiert!", "success")
            return
        end
    end
    notification("❌ Keine Coins gefunden!", "error")
end

-- ============================================
-- MAIN TAB
-- ============================================
function showMainTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = createToggle("🚪 NOCLIP (Tür aus)", y, Color3.fromRGB(100, 100, 255), 
        function() return noclip end,
        toggleNoclip)
    
    y = createToggle("🛡️ GOD MODE", y, Color3.fromRGB(255, 100, 100), 
        function() return godMode end,
        toggleGodMode)
    
    y = createToggle("🦘 INFINITE JUMP", y, Color3.fromRGB(100, 255, 100), 
        function() return infiniteJump end,
        toggleInfiniteJump)
    
    y = createToggle("⚡ SPEED BOOST", y, Color3.fromRGB(255, 255, 100), 
        function() return speedBoost end,
        toggleSpeedBoost)
    
    y = createToggle("✈️ FLY MODE", y, Color3.fromRGB(100, 255, 255), 
        function() return flyMode end,
        toggleFly)
    
    y = createToggle("🌀 ANTI-AFK", y, Color3.fromRGB(255, 100, 255), 
        function() return antiAFK end,
        toggleAntiAFK)
    
    y = createButton("🔄 ALLE ZURÜCKSETZEN", y, Color3.fromRGB(255, 0, 0), resetAll)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- ============================================
-- PETS TAB
-- ============================================
function showPetsTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("🐾 PETS SCANNEN & HOLEN", y, Color3.fromRGB(255, 0, 255), scanAndGetPets)
    
    y = createToggle("🔄 DUPE PETS", y, Color3.fromRGB(200, 0, 200), 
        function() return dupePets end,
        startDupePets)
    
    y = createButton("🎯 ZU PET TELEPORTIEREN", y, Color3.fromRGB(150, 0, 150), teleportToPet)
    
    y = createToggle("🧲 MAGNET FÜR PETS", y, Color3.fromRGB(100, 0, 100), 
        function() return magnetActive end,
        startMagnet)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- ============================================
-- MONEY TAB
-- ============================================
function showMoneyTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = createToggle("💰 INFINITE MONEY", y, Color3.fromRGB(255, 215, 0), 
        function() return infiniteMoney end,
        startInfiniteMoney)
    
    y = createButton("💰 ALLES KAUFEN (MAX)", y, Color3.fromRGB(255, 200, 0), function()
        notification("💰 Alles kann jetzt gekauft werden!", "success")
    end)
    
    y = createButton("🎯 ZU COINS TELEPORTIEREN", y, Color3.fromRGB(255, 165, 0), teleportToCoins)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- ============================================
-- GOD TAB
-- ============================================
function showGodTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = createToggle("🛡️ GOD MODE", y, Color3.fromRGB(255, 0, 0), 
        function() return godMode end,
        toggleGodMode)
    
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

-- ============================================
-- ESP TAB
-- ============================================
function showESPTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = createToggle("👁️ ESP SCAN", y, Color3.fromRGB(255, 0, 0), 
        function() return espEnabled end,
        toggleESP)
    
    y = createToggle("🔍 WALLHACK", y, Color3.fromRGB(100, 100, 255), 
        function() return wallhack end,
        toggleWallhack)
    
    y = createButton("🔍 PETS SCANNEN", y, Color3.fromRGB(255, 0, 255), scanAndGetPets)
    
    y = createButton("🛠️ TOOLS SCANNEN", y, Color3.fromRGB(255, 165, 0), scanAndGetTools)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- ============================================
-- MOVEMENT TAB
-- ============================================
function showMovementTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = createToggle("🚪 NOCLIP", y, Color3.fromRGB(100, 100, 255), 
        function() return noclip end,
        toggleNoclip)
    
    y = createToggle("🦘 INFINITE JUMP", y, Color3.fromRGB(100, 255, 100), 
        function() return infiniteJump end,
        toggleInfiniteJump)
    
    y = createToggle("⚡ SPEED BOOST", y, Color3.fromRGB(255, 255, 100), 
        function() return speedBoost end,
        toggleSpeedBoost)
    
    y = createToggle("✈️ FLY MODE", y, Color3.fromRGB(100, 255, 255), 
        function() return flyMode end,
        toggleFly)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- ============================================
-- TOOLS TAB
-- ============================================
function showToolsTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("🛠️ ALLE TOOLS SCANNEN", y, Color3.fromRGB(255, 165, 0), scanAndGetTools)
    
    y = createToggle("📦 AUTO COLLECT", y, Color3.fromRGB(0, 255, 255), 
        function() return autoCollect end,
        startAutoCollect)
    
    y = createToggle("🧲 MAGNET", y, Color3.fromRGB(255, 0, 255), 
        function() return magnetActive end,
        startMagnet)
    
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
    elseif tab == "⚡ MOVEMENT" then showMovementTab()
    elseif tab == "🎮 TOOLS" then showToolsTab() end
end

for tab, btn in pairs(TabButtons) do
    btn.MouseButton1Click:Connect(function() switchTab(tab) end)
end

-- Start
switchTab("🧠 MAIN")

-- ============================================
-- WILLKOMMENSMELDUNG
-- ============================================
print("🧠 BRAINROT ULTIMATE OP SCRIPT")
print("👑 Made by WALED-HAMMAD")
print("📺 YouTube: @hacker666-00")
print("🎵 TikTok: @mods_and_hacks")
print("🎮 RightControl / Toggle Button")

notification("🧠 BRAINROT OP SCRIPT GELADEN!", "success")
