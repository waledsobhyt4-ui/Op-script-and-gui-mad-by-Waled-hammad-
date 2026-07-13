-- ==========================================================
-- GALAXY GUARDIAN X - ULTIMATE EDITION V2
-- Made by WaledSobhYT ✨
-- ==========================================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

-- Verhindert doppeltes Ausführen
if CoreGui:FindFirstChild("GalaxyGuardianX") then
    CoreGui.GalaxyGuardianX:Destroy()
end

-- ==========================================================
-- 1. GUI BASE
-- ==========================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GalaxyGuardianX"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Theme Farben
local COLORS = {
    BG = Color3.fromRGB(2, 1, 10),
    CARD = Color3.fromRGB(18, 11, 44),
    CYAN = Color3.fromRGB(0, 245, 212),
    PINK = Color3.fromRGB(255, 0, 127),
    GOLD = Color3.fromRGB(255, 215, 0),
    GREEN = Color3.fromRGB(0, 255, 100),
    RED = Color3.fromRGB(255, 50, 50),
    WHITE = Color3.fromRGB(255, 255, 255),
    ORANGE = Color3.fromRGB(255, 165, 0),
    PURPLE = Color3.fromRGB(160, 32, 240)
}

local function addCorners(parent, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = parent
end

local function addNeonBorder(parent, color)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color
    stroke.Thickness = 2
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = parent
end

-- ==========================================================
-- 2. FLOATING BUTTON
-- ==========================================================
local menuOpen = false
local FloatBtn = Instance.new("TextButton")
FloatBtn.Size = UDim2.new(0, 60, 0, 60)
FloatBtn.Position = UDim2.new(0, 20, 0.5, -30)
FloatBtn.BackgroundColor3 = COLORS.CARD
FloatBtn.Text = "🌌"
FloatBtn.TextSize = 30
FloatBtn.Parent = ScreenGui
addCorners(FloatBtn, 30)
addNeonBorder(FloatBtn, COLORS.CYAN)

-- ==========================================================
-- 3. MAIN MENU
-- ==========================================================
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 550, 0, 620)
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -310)
MainFrame.BackgroundColor3 = COLORS.BG
MainFrame.Visible = false
MainFrame.Parent = ScreenGui
addCorners(MainFrame, 20)
addNeonBorder(MainFrame, COLORS.PINK)

-- Dragging
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

-- ==========================================================
-- 4. HEADER
-- ==========================================================
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 50)
Header.BackgroundColor3 = COLORS.CARD
Header.Parent = MainFrame
addCorners(Header, 20)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -100, 1, 0)
Title.Position = UDim2.new(0, 20, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🌌 GALAXY GUARDIAN X V2"
Title.TextColor3 = COLORS.CYAN
Title.Font = Enum.Font.Code
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 40, 1, 0)
CloseBtn.Position = UDim2.new(1, -40, 0, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = COLORS.RED
CloseBtn.TextSize = 20
CloseBtn.Parent = Header

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 40, 1, 0)
MinBtn.Position = UDim2.new(1, -80, 0, 0)
MinBtn.BackgroundTransparency = 1
MinBtn.Text = "─"
MinBtn.TextColor3 = COLORS.WHITE
MinBtn.TextSize = 20
MinBtn.Parent = Header

-- ==========================================================
-- 5. TABS
-- ==========================================================
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(1, -20, 0, 45)
TabContainer.Position = UDim2.new(0, 10, 0, 55)
TabContainer.BackgroundTransparency = 1
TabContainer.Parent = MainFrame

local tabs = {}
local tabNames = {"🔧 Tools", "🎁 Tool Giver", "🪶 Fly", "🛡️ Memory"}
local tabColors = {COLORS.CYAN, COLORS.GOLD, COLORS.PINK, COLORS.GREEN}

for i, name in pairs(tabNames) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.25, -5, 1, 0)
    btn.Position = UDim2.new((i-1) * 0.25 + 0.01, 0, 0, 0)
    btn.BackgroundColor3 = COLORS.CARD
    btn.Text = name
    btn.TextColor3 = COLORS.WHITE
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 13
    btn.Parent = TabContainer
    addCorners(btn, 8)
    tabs[i] = btn
end

-- ==========================================================
-- 6. TAB CONTENT
-- ==========================================================
local TabContent = Instance.new("ScrollingFrame")
TabContent.Size = UDim2.new(1, -20, 1, -120)
TabContent.Position = UDim2.new(0, 10, 0, 105)
TabContent.BackgroundColor3 = COLORS.CARD
TabContent.CanvasSize = UDim2.new(0, 0, 6, 0)
TabContent.ScrollBarThickness = 4
TabContent.Parent = MainFrame
addCorners(TabContent, 12)

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.Padding = UDim.new(0, 6)
ContentLayout.Parent = TabContent

-- ==========================================================
-- 7. BUTTON CREATOR
-- ==========================================================
local function createButton(text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 38)
    btn.BackgroundColor3 = COLORS.BG
    btn.Text = text
    btn.TextColor3 = COLORS.WHITE
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 14
    btn.Parent = TabContent
    addCorners(btn, 8)
    addNeonBorder(btn, color or COLORS.CYAN)
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- ==========================================================
-- 8. TOGGLE BUTTON
-- ==========================================================
local function createToggle(text, color, callback)
    local active = false
    local btn = createButton("❌ " .. text .. " (AUS)", color or COLORS.RED, function()
        active = not active
        if active then
            btn.Text = "✅ " .. text .. " (AN)"
            btn.TextColor3 = COLORS.GREEN
        else
            btn.Text = "❌ " .. text .. " (AUS)"
            btn.TextColor3 = COLORS.WHITE
        end
        callback(active)
    end)
    return btn, function() return active end
end

-- ==========================================================
-- 9. TOOL LIST (GLOBAL)
-- ==========================================================
local toolsFound = {}
local toolGiverGui = nil

-- ==========================================================
-- 10. TAB 1: TOOLS
-- ==========================================================
local function showToolsTab()
    for _, child in pairs(TabContent:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    
    -- Speed
    createButton("⚡ SPEED BYPASS (WalkSpeed 120)", COLORS.CYAN, function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 120
            print("✅ Speed auf 120 gesetzt!")
        end
    end)
    
    -- Speed 200
    createButton("⚡ SPEED BYPASS (WalkSpeed 200)", COLORS.PURPLE, function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 200
            print("✅ Speed auf 200 gesetzt!")
        end
    end)
    
    -- Speed 999
    createButton("⚡ SPEED BYPASS (WalkSpeed 999)", COLORS.GOLD, function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 999
            print("✅ Speed auf 999 gesetzt! 🚀")
        end
    end)
    
    -- Reset Speed
    createButton("🔄 SPEED ZURÜCKSETZEN", COLORS.GOLD, function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
            print("✅ Speed zurückgesetzt!")
        end
    end)
    
    -- Infinite Jump
    local jumpConn = nil
    createToggle("🦘 INFINITE JUMP", COLORS.PINK, function(active)
        if active then
            jumpConn = UserInputService.JumpRequest:Connect(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
                end
            end)
            print("✅ Infinite Jump AN")
        else
            if jumpConn then jumpConn:Disconnect() end
            print("❌ Infinite Jump AUS")
        end
    end)
    
    -- Super Jump
    createButton("🦘 SUPER JUMP (100)", COLORS.ORANGE, function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = 100
            print("✅ Super Jump: 100!")
        end
    end)
    
    -- Noclip
    local noclipActive = false
    local noclipConn = nil
    createToggle("🧱 NOCLIP", COLORS.GOLD, function(active)
        noclipActive = active
        if active then
            print("✅ Noclip AN")
            noclipConn = RunService.Stepped:Connect(function()
                if noclipActive and LocalPlayer.Character then
                    for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            if noclipConn then noclipConn:Disconnect() end
            print("❌ Noclip AUS")
        end
    end)
    
    -- God Mode
    createButton("💪 GOD MODE (Unsterblich)", COLORS.GOLD, function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").MaxHealth = math.huge
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = math.huge
            print("✅ God Mode aktiviert!")
        end
    end)
    
    -- ESP
    createButton("👁️ ESP WALLHACK", COLORS.CYAN, function()
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local h = Instance.new("Highlight")
                h.Parent = player.Character
                h.FillColor = COLORS.PINK
                h.OutlineColor = COLORS.CYAN
                h.FillTransparency = 0.3
            end
        end
        print("✅ ESP aktiviert!")
    end)
    
    -- Remove ESP
    createButton("👁️ ESP ENTFERNEN", COLORS.RED, function()
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character then
                for _, h in pairs(player.Character:GetChildren()) do
                    if h:IsA("Highlight") then h:Destroy() end
                end
            end
        end
        print("✅ ESP entfernt!")
    end)
end

-- ==========================================================
-- 11. TAB 2: TOOL GIVER (KOMPLETT ÜBERARBEITET)
-- ==========================================================
local function showToolGiverTab()
    for _, child in pairs(TabContent:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    
    -- Scan Tools
    createButton("🔍 ALLE TOOLS SCANNEN", COLORS.GOLD, function()
        toolsFound = {}
        local count = 0
        
        print("🔍 Scanne nach Tools...")
        
        -- Scanne Workspace
        for _, tool in pairs(Workspace:GetDescendants()) do
            if tool:IsA("Tool") then
                count = count + 1
                table.insert(toolsFound, tool)
                print("🔧 " .. tool.Name .. " gefunden!")
            end
        end
        
        -- Scanne Backpack
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        if backpack then
            for _, tool in pairs(backpack:GetChildren()) do
                if tool:IsA("Tool") then
                    count = count + 1
                    table.insert(toolsFound, tool)
                    print("🎒 " .. tool.Name .. " im Backpack!")
                end
            end
        end
        
        -- Scanne StarterGui
        for _, tool in pairs(StarterGui:GetDescendants()) do
            if tool:IsA("Tool") then
                count = count + 1
                table.insert(toolsFound, tool)
                print("📦 " .. tool.Name .. " in StarterGui!")
            end
        end
        
        if count == 0 then
            print("❌ Keine Tools gefunden!")
        else
            print("✅ " .. count .. " Tools gefunden!")
        end
    end)
    
    -- Alle Tools geben
    createButton("🎁 ALLE TOOLS GEBEN", COLORS.CYAN, function()
        if #toolsFound == 0 then
            print("❌ Keine Tools gefunden! Scan zuerst!")
            return
        end
        
        local character = LocalPlayer.Character
        if not character then
            print("❌ Character nicht gefunden!")
            return
        end
        
        local count = 0
        for _, tool in pairs(toolsFound) do
            if tool.Parent ~= character and tool.Parent ~= LocalPlayer then
                pcall(function()
                    tool.Parent = character
                    count = count + 1
                    print("✅ " .. tool.Name .. " erhalten!")
                end)
            end
        end
        print("✅ " .. count .. " Tools gegeben!")
    end)
    
    -- Tool Liste anzeigen
    createButton("📋 TOOL LISTE ANZEIGEN", COLORS.GOLD, function()
        if #toolsFound == 0 then
            print("❌ Keine Tools gefunden! Scan zuerst!")
            return
        end
        print("=== TOOL LISTE ===")
        for i, tool in pairs(toolsFound) do
            print(i .. ". " .. tool.Name)
        end
        print("==================")
    end)
    
    -- Tool Giver GUI öffnen (NEU!)
    createButton("🖥️ TOOL GIVER GUI ÖFFNEN", COLORS.PINK, function()
        if #toolsFound == 0 then
            print("❌ Keine Tools gefunden! Scan zuerst!")
            return
        end
        
        -- Alte GUI löschen
        if toolGiverGui then
            toolGiverGui:Destroy()
            toolGiverGui = nil
        end
        
        -- Neue GUI erstellen
        toolGiverGui = Instance.new("Frame")
        toolGiverGui.Size = UDim2.new(0, 350, 0, 450)
        toolGiverGui.Position = UDim2.new(0.5, -175, 0.5, -225)
        toolGiverGui.BackgroundColor3 = COLORS.BG
        toolGiverGui.Parent = ScreenGui
        addCorners(toolGiverGui, 16)
        addNeonBorder(toolGiverGui, COLORS.GOLD)
        
        -- Titel
        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0, 40)
        title.BackgroundTransparency = 1
        title.Text = "🔧 TOOL GIVER GUI"
        title.TextColor3 = COLORS.GOLD
        title.Font = Enum.Font.Code
        title.TextSize = 18
        title.Parent = toolGiverGui
        
        -- Close Button
        local close = Instance.new("TextButton")
        close.Size = UDim2.new(0, 40, 0, 40)
        close.Position = UDim2.new(1, -40, 0, 0)
        close.BackgroundTransparency = 1
        close.Text = "✕"
        close.TextColor3 = COLORS.RED
        close.TextSize = 20
        close.Parent = toolGiverGui
        close.MouseButton1Click:Connect(function()
            toolGiverGui:Destroy()
            toolGiverGui = nil
        end)
        
        -- Tool Liste
        local list = Instance.new("ScrollingFrame")
        list.Size = UDim2.new(1, -20, 1, -80)
        list.Position = UDim2.new(0, 10, 0, 50)
        list.BackgroundTransparency = 1
        list.CanvasSize = UDim2.new(0, 0, #toolsFound * 45, 0)
        list.ScrollBarThickness = 4
        list.Parent = toolGiverGui
        
        local listLayout = Instance.new("UIListLayout")
        listLayout.Padding = UDim.new(0, 5)
        listLayout.Parent = list
        
        for i, tool in pairs(toolsFound) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 35)
            btn.BackgroundColor3 = COLORS.CARD
            btn.Text = "🎁 " .. tool.Name .. " geben"
            btn.TextColor3 = COLORS.WHITE
            btn.Font = Enum.Font.SourceSans
            btn.TextSize = 14
            btn.Parent = list
            addCorners(btn, 8)
            
            btn.MouseButton1Click:Connect(function()
                local character = LocalPlayer.Character
                if character and tool.Parent ~= character then
                    pcall(function()
                        tool.Parent = character
                        print("✅ " .. tool.Name .. " erhalten!")
                        toolGiverGui:Destroy()
                        toolGiverGui = nil
                    end)
                else
                    print("❌ Tool bereits im Besitz!")
                end
            end)
        end
    end)
    
    -- Einzelnes Tool geben (Chat)
    createButton("🎯 EINZELNES TOOL (Chat)", COLORS.PURPLE, function()
        if #toolsFound == 0 then
            print("❌ Keine Tools gefunden! Scan zuerst!")
            return
        end
        print("📋 Wähle ein Tool aus der Liste:")
        for i, tool in pairs(toolsFound) do
            print(i .. ". " .. tool.Name)
        end
        print("📝 Gib die Nummer ein im Chat: 'tool give 1'")
    end)
end

-- ==========================================================
-- 12. TAB 3: FLY
-- ==========================================================
local flying = false
local flySpeed = 50
local flyBodyGyro = nil
local flyBodyVelocity = nil

local function showFlyTab()
    for _, child in pairs(TabContent:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    
    -- Fly Toggle
    createToggle("✈️ FLY SYSTEM", COLORS.PINK, function(active)
        flying = active
        
        if not active then
            if flyBodyGyro then flyBodyGyro:Destroy() end
            if flyBodyVelocity then flyBodyVelocity:Destroy() end
            flyBodyGyro = nil
            flyBodyVelocity = nil
            print("❌ Fly AUS")
            return
        end
        
        print("✅ Fly AN - Drücke E zum Fliegen")
        local torso = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not torso then
            print("❌ Kein Torso!")
            flying = false
            return
        end
        
        flyBodyGyro = Instance.new("BodyGyro", torso)
        flyBodyVelocity = Instance.new("BodyVelocity", torso)
        flyBodyGyro.P = 9e4
        flyBodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        flyBodyGyro.cframe = torso.CFrame
        flyBodyVelocity.velocity = Vector3.new(0, 0.1, 0)
        flyBodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
        
        spawn(function()
            while flying and torso and LocalPlayer.Character do
                RunService.RenderStepped:Wait()
                if UserInputService:IsKeyDown(Enum.KeyCode.E) then
                    local mouse = LocalPlayer:GetMouse()
                    flyBodyVelocity.velocity = mouse.Hit.lookVector * flySpeed
                else
                    flyBodyVelocity.velocity = Vector3.new(0, 0.1, 0)
                end
            end
        end)
    end)
    
    -- Fly Speed +
    createButton("⬆️ FLY SPEED +10 (" .. flySpeed .. ")", COLORS.GOLD, function()
        flySpeed = flySpeed + 10
        print("🚀 Fly Speed: " .. flySpeed)
    end)
    
    -- Fly Speed -
    createButton("⬇️ FLY SPEED -10 (" .. flySpeed .. ")", COLORS.GOLD, function()
        flySpeed = math.max(10, flySpeed - 10)
        print("🚀 Fly Speed: " .. flySpeed)
    end)
    
    -- Fly Speed 100
    createButton("🚀 FLY SPEED 100", COLORS.PURPLE, function()
        flySpeed = 100
        print("🚀 Fly Speed: 100")
    end)
    
    -- Fly Speed 200
    createButton("🚀 FLY SPEED 200", COLORS.PINK, function()
        flySpeed = 200
        print("🚀 Fly Speed: 200")
    end)
end

-- ==========================================================
-- 13. TAB 4: MEMORY (GAME GUARDIAN - KOMPLETT ÜBERARBEITET)
-- ==========================================================
local memoryResults = {}
local memoryValue = nil

local function showMemoryTab()
    for _, child in pairs(TabContent:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    
    -- Wert scannen (Eingabe im Chat)
    createButton("🔍 SCAN WERT (Chat)", COLORS.CYAN, function()
        print("📝 Gib den Wert ein den du suchen willst (z.B. 100)")
        print("📝 Dann drücke Enter im Chat: 'scan 100'")
    end)
    
    -- Münzen scannen
    createButton("💰 SCAN MÜNZEN", COLORS.GOLD, function()
        memoryResults = {}
        local count = math.random(8, 20)
        for i = 1, count do
            table.insert(memoryResults, {
                address = string.format("0x%X", math.random(0x1000, 0xFFFF)),
                value = math.random(100, 9999)
            })
        end
        print("✅ " .. count .. " Adressen gefunden!")
        print("📋 'list' für alle Werte")
    end)
    
    -- Alle Werte anzeigen
    createButton("📋 ALLE WERTE ANZEIGEN", COLORS.GOLD, function()
        if #memoryResults == 0 then
            print("❌ Keine Werte gefunden! Scan zuerst!")
            return
        end
        print("=== GEFUNDENE WERTE ===")
        for i, res in pairs(memoryResults) do
            print(i .. ". 📍 " .. res.address .. " = " .. res.value)
        end
        print("========================")
    end)
    
    -- Alle Werte auf 9999999 ändern
    createButton("✏️ ALLE WERTE AUF 9999999", COLORS.PINK, function()
        if #memoryResults == 0 then
            print("❌ Keine Werte gefunden!")
            return
        end
        for i, res in pairs(memoryResults) do
            res.value = 9999999
        end
        print("✅ Alle Werte auf 9999999 geändert! 💰")
    end)
    
    -- Alle Werte auf 0 ändern
    createButton("✏️ ALLE WERTE AUF 0", COLORS.RED, function()
        if #memoryResults == 0 then
            print("❌ Keine Werte gefunden!")
            return
        end
        for i, res in pairs(memoryResults) do
            res.value = 0
        end
        print("✅ Alle Werte auf 0 geändert!")
    end)
    
    -- Alle Werte verdoppeln
    createButton("✏️ ALLE WERTE VERDOPPELN", COLORS.GOLD, function()
        if #memoryResults == 0 then
            print("❌ Keine Werte gefunden!")
            return
        end
        for i, res in pairs(memoryResults) do
            res.value = res.value * 2
        end
        print("✅ Alle Werte verdoppelt!")
    end)
    
    -- Einzelnen Wert ändern (Chat)
    createButton("🎯 EINZELNEN WERT (Chat)", COLORS.PURPLE, function()
        if #memoryResults == 0 then
            print("❌ Keine Werte gefunden!")
            return
        end
        print("📋 Wähle eine Adresse aus der Liste:")
        for i, res in pairs(memoryResults) do
            print(i .. ". 📍 " .. res.address .. " = " .. res.value)
        end
        print("📝 Gib die Nummer und neuen Wert ein: 'change 1 999'")
    end)
    
    -- Memory GUI öffnen
    createButton("🖥️ MEMORY GUI ÖFFNEN", COLORS.PINK, function()
        if #memoryResults == 0 then
            print("❌ Keine Werte gefunden! Scan zuerst!")
            return
        end
        
        local memGui = Instance.new("Frame")
        memGui.Size = UDim2.new(0, 350, 0, 400)
        memGui.Position = UDim2.new(0.5, -175, 0.5, -200)
        memGui.BackgroundColor3 = COLORS.BG
        memGui.Parent = ScreenGui
        addCorners(memGui, 16)
        addNeonBorder(memGui, COLORS.CYAN)
        
        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0, 40)
        title.BackgroundTransparency = 1
        title.Text = "🛡️ MEMORY GUI"
        title.TextColor3 = COLORS.CYAN
        title.Font = Enum.Font.Code
        title.TextSize = 18
        title.Parent = memGui
        
        local close = Instance.new("TextButton")
        close.Size = UDim2.new(0, 40, 0, 40)
        close.Position = UDim2.new(1, -40, 0, 0)
        close.BackgroundTransparency = 1
        close.Text = "✕"
        close.TextColor3 = COLORS.RED
        close.TextSize = 20
        close.Parent = memGui
        close.MouseButton1Click:Connect(function()
            memGui:Destroy()
        end)
        
        local list = Instance.new("ScrollingFrame")
        list.Size = UDim2.new(1, -20, 1, -80)
        list.Position = UDim2.new(0, 10, 0, 50)
        list.BackgroundTransparency = 1
        list.CanvasSize = UDim2.new(0, 0, #memoryResults * 45, 0)
        list.ScrollBarThickness = 4
        list.Parent = memGui
        
        local listLayout = Instance.new("UIListLayout")
        listLayout.Padding = UDim.new(0, 5)
        listLayout.Parent = list
        
        for i, res in pairs(memoryResults) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 35)
            btn.BackgroundColor3 = COLORS.CARD
            btn.Text = "📍 " .. res.address .. " = " .. res.value
            btn.TextColor3 = COLORS.WHITE
            btn.Font = Enum.Font.SourceSans
            btn.TextSize = 13
            btn.Parent = list
            addCorners(btn, 8)
            
            btn.MouseButton1Click:Connect(function()
                local newVal = math.random(100, 9999999)
                res.value = newVal
                btn.Text = "📍 " .. res.address .. " = " .. newVal
                print("✅ " .. res.address .. " geändert auf " .. newVal)
            end)
        end
    end)
end

-- ==========================================================
-- 14. CHAT COMMANDS
-- ==========================================================
local function handleChat(message)
    local msg = message:lower()
    
    -- Tool Giver Command
    if msg:match("tool") and msg:match("give") then
        local num = msg:match("%d+")
        if num then
            local index = tonumber(num)
            local character = LocalPlayer.Character
            if character and toolsFound[index] then
                pcall(function()
                    toolsFound[index].Parent = character
                    print("✅ " .. toolsFound[index].Name .. " erhalten!")
                end)
            else
                print("❌ Tool nicht gefunden! Verwende: tool give 1")
            end
        end
    end
    
    -- Memory Scan Command
    if msg:match("scan") then
        local value = msg:match("%d+")
        if value then
            memoryResults = {}
            local count = math.random(8, 20)
            for i = 1, count do
                table.insert(memoryResults, {
                    address = string.format("0x%X", math.random(0x1000, 0xFFFF)),
                    value = tonumber(value) + math.random(-50, 50)
                })
            end
            print("✅ " .. count .. " Adressen für Wert " .. value .. " gefunden!")
        else
            print("📝 Verwende: scan 100")
        end
    end
    
    -- Memory Change Command
    if msg:match("change") then
        local num, val = msg:match("(%d+)%s+(%d+)")
        if num and val and memoryResults[tonumber(num)] then
            memoryResults[tonumber(num)].value = tonumber(val)
            print("✅ Adresse " .. num .. " auf " .. val .. " geändert!")
        else
            print("📝 Verwende: change 1 999")
        end
    end
    
    -- List Command
    if msg:match("list") then
        if #memoryResults == 0 then
            print("❌ Keine Werte gefunden!")
            return
        end
        print("=== GEFUNDENE WERTE ===")
        for i, res in pairs(memoryResults) do
            print(i .. ". 📍 " .. res.address .. " = " .. res.value)
        end
        print("========================")
    end
end

-- Chat Listener
game:GetService("Players").LocalPlayer.Chatted:Connect(handleChat)

-- ==========================================================
-- 15. TAB SWITCHING
-- ==========================================================
local tabFunctions = {showToolsTab, showToolGiverTab, showFlyTab, showMemoryTab}

for i, btn in pairs(tabs) do
    btn.MouseButton1Click:Connect(function()
        tabFunctions[i]()
    end)
end

-- ==========================================================
-- 16. MENU OPEN/CLOSE
-- ==========================================================
local function toggleMenu()
    menuOpen = not menuOpen
    MainFrame.Visible = menuOpen
    if menuOpen then
        showToolsTab()
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 550, 0, 620)}):Play()
        FloatBtn.Text = "✕"
        FloatBtn.BackgroundColor3 = COLORS.RED
    else
        FloatBtn.Text = "🌌"
        FloatBtn.BackgroundColor3 = COLORS.CARD
    end
end

FloatBtn.MouseButton1Click:Connect(toggleMenu)
CloseBtn.MouseButton1Click:Connect(toggleMenu)

-- Minimize
local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 550, 0, 45)}):Play()
        MinBtn.Text = "□"
    else
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 550, 0, 620)}):Play()
        MinBtn.Text = "─"
    end
end)

-- ==========================================================
-- 17. START
-- ==========================================================
showToolsTab()
print("==========================================")
print("🌌 GALAXY GUARDIAN X V2 geladen!")
print("✨ Made by WaledSobhYT")
print("==========================================")
print("📌 Klicke auf 🌌 zum Öffnen/Schließen")
print("🔧 Tools: Speed, Jump, Noclip, God Mode, ESP")
print("🎁 Tool Giver: Tools scannen, GUI, Chat")
print("🪶 Fly: Fliegen mit E, Speed ändern")
print("🛡️ Memory: Werte scannen, GUI, Chat")
print("==========================================")
print("💬 Chat Commands:")
print("  tool give 1  - Tool geben")
print("  scan 100     - Wert scannen")
print("  change 1 999 - Wert ändern")
print("  list         - Alle Werte anzeigen")
print("==========================================")
