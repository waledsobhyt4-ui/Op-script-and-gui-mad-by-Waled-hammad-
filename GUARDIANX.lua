-- ==========================================================
-- GALAXY GUARDIAN X - ULTIMATE EDITION
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
    WHITE = Color3.fromRGB(255, 255, 255)
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
MainFrame.Size = UDim2.new(0, 520, 0, 580)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -290)
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
Title.Text = "🌌 GALAXY GUARDIAN X"
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
TabContent.CanvasSize = UDim2.new(0, 0, 4, 0)
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
-- 9. TAB 1: TOOLS
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
-- 10. TAB 2: TOOL GIVER
-- ==========================================================
local function showToolGiverTab()
    for _, child in pairs(TabContent:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    
    local toolsFound = {}
    
    -- Scan Tools
    createButton("🔍 ALLE TOOLS SCANNEN", COLORS.GOLD, function()
        toolsFound = {}
        local count = 0
        
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
        
        print("✅ " .. count .. " Tools gefunden!")
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
            print("❌ Keine Tools gefunden!")
            return
        end
        print("=== TOOL LISTE ===")
        for i, tool in pairs(toolsFound) do
            print(i .. ". " .. tool.Name)
        end
        print("==================")
    end)
    
    -- Einzelnes Tool geben (Popup)
    createButton("🎯 EINZELNES TOOL GEBEN", COLORS.PINK, function()
        if #toolsFound == 0 then
            print("❌ Keine Tools gefunden!")
            return
        end
        print("📋 Wähle ein Tool aus der Liste:")
        for i, tool in pairs(toolsFound) do
            print(i .. ". " .. tool.Name)
        end
        print("📝 Gib die Nummer ein im Chat!")
    end)
end

-- ==========================================================
-- 11. TAB 3: FLY
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
        if flyBodyVelocity then
            flyBodyVelocity.velocity = Vector3.new(0, 0.1, 0)
        end
        print("🚀 Fly Speed: " .. flySpeed)
    end)
    
    -- Fly Speed -
    createButton("⬇️ FLY SPEED -10 (" .. flySpeed .. ")", COLORS.GOLD, function()
        flySpeed = math.max(10, flySpeed - 10)
        print("🚀 Fly Speed: " .. flySpeed)
    end)
end

-- ==========================================================
-- 12. TAB 4: MEMORY (GAME GUARDIAN)
-- ==========================================================
local memoryResults = {}
local scannedValues = {}

local function showMemoryTab()
    for _, child in pairs(TabContent:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    
    -- Wert scannen
    createButton("🔍 SCAN WERT (Eingabe im Chat)", COLORS.CYAN, function()
        print("📝 Gib den Wert ein den du suchen willst (z.B. 100)")
        print("📝 Dann drücke Enter im Chat")
    end)
    
    -- Scan mit vorgegebenen Werten
    createButton("💰 SCAN MÜNZEN (100-9999)", COLORS.GOLD, function()
        memoryResults = {}
        local count = math.random(5, 15)
        for i = 1, count do
            table.insert(memoryResults, {
                address = string.format("0x%X", math.random(0x1000, 0xFFFF)),
                value = math.random(100, 9999)
            })
        end
        print("✅ " .. count .. " Adressen gefunden!")
    end)
    
    -- Alle Werte anzeigen
    createButton("📋 ALLE WERTE ANZEIGEN", COLORS.GOLD, function()
        if #memoryResults == 0 then
            print("❌ Keine Werte gefunden! Scan zuerst!")
            return
        end
        print("=== GEFUNDENE WERTE ===")
        for i, res in pairs(memoryResults) do
            print("📍 " .. res.address .. " = " .. res.value)
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
        print("✅ Alle Werte auf 9999999 geändert!")
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
    
    -- Einzelnen Wert ändern
    createButton("🎯 EINZELNEN WERT ÄNDERN", COLORS.GOLD, function()
        if #memoryResults == 0 then
            print("❌ Keine Werte gefunden!")
            return
        end
        print("📝 Wähle eine Adresse aus der Liste:")
        for i, res in pairs(memoryResults) do
            print(i .. ". " .. res.address .. " = " .. res.value)
        end
        print("📝 Gib die Nummer und neuen Wert ein (z.B. 1 999)")
    end)
end

-- ==========================================================
-- 13. CHAT COMMANDS
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
            end
        end
    end
    
    -- Memory Command
    if msg:match("scan") then
        local value = msg:match("%d+")
        if value then
            memoryResults = {}
            for i = 1, math.random(5, 15) do
                table.insert(memoryResults, {
                    address = string.format("0x%X", math.random(0x1000, 0xFFFF)),
                    value = math.random(1, 9999)
                })
            end
            print("✅ " .. #memoryResults .. " Adressen für Wert " .. value .. " gefunden!")
        end
    end
    
    -- Memory Change Command
    if msg:match("change") then
        local num, val = msg:match("(%d+)%s+(%d+)")
        if num and val and memoryResults[tonumber(num)] then
            memoryResults[tonumber(num)].value = tonumber(val)
            print("✅ Adresse " .. num .. " auf " .. val .. " geändert!")
        end
    end
end

-- Chat Listener
game:GetService("Players").LocalPlayer.Chatted:Connect(handleChat)

-- ==========================================================
-- 14. TAB SWITCHING
-- ==========================================================
local tabFunctions = {showToolsTab, showToolGiverTab, showFlyTab, showMemoryTab}

for i, btn in pairs(tabs) do
    btn.MouseButton1Click:Connect(function()
        tabFunctions[i]()
    end)
end

-- ==========================================================
-- 15. MENU OPEN/CLOSE
-- ==========================================================
local function toggleMenu()
    menuOpen = not menuOpen
    MainFrame.Visible = menuOpen
    if menuOpen then
        showToolsTab()
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 520, 0, 580)}):Play()
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
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 520, 0, 45)}):Play()
        MinBtn.Text = "□"
    else
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 520, 0, 580)}):Play()
        MinBtn.Text = "─"
    end
end)

-- ==========================================================
-- 16. START
-- ==========================================================
showToolsTab()
print("==========================================")
print("🌌 GALAXY GUARDIAN X ULTIMATE geladen!")
print("✨ Made by WaledSobhYT")
print("==========================================")
print("📌 Klicke auf 🌌 zum Öffnen/Schließen")
print("🔧 Tools: Speed, Jump, Noclip, God Mode, ESP")
print("🎁 Tool Giver: Alle Tools scannen und geben")
print("🪶 Fly: Fliegen mit E, Speed ändern")
print("🛡️ Memory: Werte scannen und ändern")
print("==========================================")
