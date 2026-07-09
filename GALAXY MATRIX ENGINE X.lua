-- ==========================================================
-- GALAXY MATRIX ENGINE X - ROBLOX EDITION
-- ==========================================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Verhindert doppeltes Ausführen
if CoreGui:FindFirstChild("GalaxyMatrixEngine") then
    CoreGui.GalaxyMatrixEngine:Destroy()
end

-- ==========================================================
-- 1. ENGINE GUI BASE
-- ==========================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GalaxyMatrixEngine"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Theme Farben (Neon Space Concept)
local CLR_SPACE_BG = Color3.fromRGB(2, 1, 10)
local CLR_GALAXY_CARD = Color3.fromRGB(18, 11, 44)
local CLR_NEON_CYAN = Color3.fromRGB(0, 245, 212)
local CLR_NEON_PINK = Color3.fromRGB(255, 0, 127)

-- Helper für abgerundete Ecken
local function addCorners(parent, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = parent
end

-- UI Stroke (Glühender Neon-Rand)
local function addNeonBorder(parent, color)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color
    stroke.Thickness = 2
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = parent
end

-- ==========================================================
-- 2. INTERAKTIVES WILLKOMMENS-MENÜ
-- ==========================================================
local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Size = UDim2.new(0, 400, 0, 300)
WelcomeFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
WelcomeFrame.BackgroundColor3 = CLR_SPACE_BG
WelcomeFrame.Parent = ScreenGui
addCorners(WelcomeFrame, 16)
addNeonBorder(WelcomeFrame, CLR_NEON_CYAN)

local WelcomeLogo = Instance.new("TextLabel")
WelcomeLogo.Size = UDim2.new(1, 0, 0, 80)
WelcomeLogo.Position = UDim2.new(0, 0, 0, 20)
WelcomeLogo.BackgroundTransparency = 1
WelcomeLogo.Text = "🌌"
WelcomeLogo.TextSize = 60
WelcomeLogo.Parent = WelcomeFrame

local WelcomeTitle = Instance.new("TextLabel")
WelcomeTitle.Size = UDim2.new(1, 0, 0, 60)
WelcomeTitle.Position = UDim2.new(0, 0, 0, 100)
WelcomeTitle.BackgroundTransparency = 1
WelcomeTitle.Text = "GUARDIAN X\nGALAXY MATRIX LUA"
WelcomeTitle.TextColor3 = CLR_NEON_CYAN
WelcomeTitle.Font = Enum.Font.Code
WelcomeTitle.TextSize = 22
WelcomeTitle.Parent = WelcomeFrame

local EnterButton = Instance.new("TextButton")
EnterButton.Size = UDim2.new(0, 280, 0, 50)
EnterButton.Position = UDim2.new(0.5, -140, 0.7, 20)
EnterButton.BackgroundColor3 = CLR_NEON_PINK
EnterButton.Text = "INJECT MOD ENGINE"
EnterButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EnterButton.Font = Enum.Font.SourceSansBold
EnterButton.TextSize = 18
EnterButton.Parent = WelcomeFrame
addCorners(EnterButton, 12)

-- ==========================================================
-- 3. HACK-DASHBOARD (Wird nach Login sichtbar)
-- ==========================================================
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 450, 0, 350)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -175)
MainFrame.BackgroundColor3 = CLR_SPACE_BG
MainFrame.Visible = false
MainFrame.Parent = ScreenGui
addCorners(MainFrame, 20)
addNeonBorder(MainFrame, CLR_NEON_PINK)

-- Dragging-System für das Hauptmenü
local dragging, dragInput, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)
MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- Titel & Game-Erkennung im Hauptmenü
local MainTitle = Instance.new("TextLabel")
MainTitle.Size = UDim2.new(1, 0, 0, 40)
MainTitle.BackgroundTransparency = 1
MainTitle.Text = "TARGET ACTIVE: " .. string.upper(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
MainTitle.TextColor3 = CLR_NEON_CYAN
MainTitle.Font = Enum.Font.Code
MainTitle.TextSize = 16
MainTitle.Parent = MainFrame

-- Konsolen Log-System
local ConsoleLog = Instance.new("TextLabel")
ConsoleLog.Size = UDim2.new(1, -40, 0, 40)
ConsoleLog.Position = UDim2.new(0, 20, 0, 45)
ConsoleLog.BackgroundColor3 = Color3.fromRGB(5, 3, 15)
ConsoleLog.Text = ">> System status: Engine waiting for payloads..."
ConsoleLog.TextColor3 = Color3.fromRGB(0, 255, 0)
ConsoleLog.Font = Enum.Font.Code
ConsoleLog.TextSize = 12
ConsoleLog.TextXAlignment = Enum.TextXAlignment.Left
ConsoleLog.Parent = MainFrame
addCorners(ConsoleLog, 6)
addNeonBorder(ConsoleLog, Color3.fromRGB(30,30,60))

local function printLog(msg)
    ConsoleLog.Text = ">> " .. tostring(msg)
end

-- Container für Cheat-Buttons
local ButtonContainer = Instance.new("ScrollingFrame")
ButtonContainer.Size = UDim2.new(1, -40, 1, -110)
ButtonContainer.Position = UDim2.new(0, 20, 0, 95)
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.CanvasSize = UDim2.new(0, 0, 1.5, 0)
ButtonContainer.ScrollBarThickness = 4
ButtonContainer.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.Parent = ButtonContainer

-- Generator für Funktions-Buttons
local function createModButton(text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 45)
    btn.BackgroundColor3 = CLR_GALAXY_CARD
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 16
    btn.Parent = ButtonContainer
    addCorners(btn, 8)
    addNeonBorder(btn, Color3.fromRGB(60, 30, 110))
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- ==========================================================
-- 4. DIE KRASSEN REALEN CHEAT FUNKTIONEN (MODS)
-- ==========================================================

-- Mod 1: Speed-Bypass
createModButton("⚡ SPEED BYPASS (WALKSPEED 100)", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 100
        printLog("Velocity matrix altered. WalkSpeed: 100")
    else
        printLog("Error: Character model stream unlinked.")
    end
end)

-- Mod 2: Infinite Jump Interceptor
local InfJumpConnection
createModButton("🦘 INFINITE JUMP INTERCEPTOR", function()
    if InfJumpConnection then 
        InfJumpConnection:Disconnect() 
        InfJumpConnection = nil
        printLog("Infinite Jump Listener detached.")
        return
    end
    
    InfJumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end)
    printLog("Jump hook executed. Unlimited elevation enabled.")
end)

-- Mod 3: Physics Noclip Bypass
local NoclipActive = false
createModButton("🧱 PHYSICS NOCLIP BYPASS", function()
    NoclipActive = not NoclipActive
    if NoclipActive then
        printLog("Noclip System: INJECTED.")
        game:GetService("RunService").Stepped:Connect(function()
            if NoclipActive and LocalPlayer.Character then
                for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        printLog("Noclip System: DISCONNECTED.")
    end
end)

-- Mod 4: Fly Emulator
local Flying = false
local FlySpeed = 50
createModButton("✈️ VECTOR MATRIX FLY SYSTEM", function()
    Flying = not Flying
    if Flying then
        printLog("Fly Engine online. Use E to toggle state.")
    else
        printLog("Fly Engine deactivated.")
    end
    
    local Mouse = LocalPlayer:GetMouse()
    local Torso = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    
    if Flying and Torso then
        local BG = Instance.new("BodyGyro", Torso)
        local BV = Instance.new("BodyVelocity", Torso)
        BG.P = 9e4
        BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        BG.cframe = Torso.CFrame
        BV.velocity = Vector3.new(0, 0.1, 0)
        BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
        
        spawn(function()
            while Flying and Torso and LocalPlayer.Character do
                game:GetService("RunService").RenderStepped:Wait()
                BV.velocity = Vector3.new(0, 0.1, 0)
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    BV.velocity = Mouse.Hit.lookVector * FlySpeed
                elseif UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    BV.velocity = Mouse.Hit.lookVector * -FlySpeed
                end
            end
            BG:Destroy()
            BV:Destroy()
        end)
    end
end)

-- Mod 5: ESP / Wallhack Stream
createModButton("👁️ REAL-TIME SENSORY ESP (WALLHACK)", function()
    printLog("Constructing target highlight pipeline...")
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local Highlight = Instance.new("Highlight")
            Highlight.Parent = player.Character
            Highlight.FillColor = CLR_NEON_PINK
            Highlight.OutlineColor = CLR_NEON_CYAN
            Highlight.FillTransparency = 0.4
        end
    end
    printLog("Sensory stream running. All frames highlighted.")
end)

-- ==========================================================
-- 5. ANIMATIONS-LOGIK & TRIGGER
-- ==========================================================
EnterButton.MouseButton1Click:Connect(function()
    printLog("Decrypting security keys...")
    TweenService:Create(WelcomeFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0,0,0,0), BackgroundTransparency = 1}):Play()
    
    wait(0.4)
    WelcomeFrame:Destroy()
    
    MainFrame.Visible = true
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, 350)}):Play()
    printLog("Bypass fully deployed into Roblox Core Engine.")
end)
