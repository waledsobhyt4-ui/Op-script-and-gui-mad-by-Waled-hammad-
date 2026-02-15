--[[
    Roblox OP ToolGiver
    100% SICHTBAR - FIXED VERSION
    Made by Waled-hammad
]]

-- Fehlerbehandlung
local success, result = pcall(function()

-- GUI erstellen
local player = game:GetService("Players").LocalPlayer
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")
local gui = Instance.new("ScreenGui")

-- WICHTIG: Verschiedene Parent-Optionen für maximale Kompatibilität
local parentOptions = {
    player:FindFirstChild("PlayerGui"),
    player:FindFirstChild("Backpack"),
    game:GetService("CoreGui")
}

for _, parent in ipairs(parentOptions) do
    if parent then
        gui.Parent = parent
        break
    end
end

-- Falls nichts gefunden wurde, versuche PlayerGui zu erstellen
if not gui.Parent then
    local playerGui = Instance.new("PlayerGui")
    playerGui.Parent = player
    gui.Parent = playerGui
end

gui.Name = "WaledHammad_OPTools"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 999999 -- Ganz oben anzeigen
gui.Enabled = true

-- Theme Farben
local colors = {
    background = Color3.fromRGB(20, 20, 30),
    surface = Color3.fromRGB(30, 30, 40),
    primary = Color3.fromRGB(0, 200, 255),
    primaryDark = Color3.fromRGB(0, 150, 200),
    accent = Color3.fromRGB(255, 80, 80),
    rubox = Color3.fromRGB(255, 200, 0),
    text = Color3.fromRGB(255, 255, 255),
    textDark = Color3.fromRGB(180, 180, 180)
}

-- TEST-FRAME (damit man SOFORT etwas sieht)
local testFrame = Instance.new("Frame")
testFrame.Name = "TestFrame"
testFrame.Size = UDim2.new(0, 200, 0, 100)
testFrame.Position = UDim2.new(0.5, -100, 0.5, -50)
testFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
testFrame.BackgroundTransparency = 0
testFrame.BorderSizePixel = 0
testFrame.Active = true
testFrame.Draggable = true
testFrame.Visible = true
testFrame.Parent = gui
testFrame.ZIndex = 9999

local testCorner = Instance.new("UICorner")
testCorner.CornerRadius = UDim.new(0, 10)
testCorner.Parent = testFrame

local testText = Instance.new("TextLabel")
testText.Name = "TestText"
testText.Size = UDim2.new(1, 0, 1, 0)
testText.BackgroundTransparency = 1
testText.Text = "⚡ GUI WIRD GELADEN..."
testText.TextColor3 = Color3.fromRGB(255, 255, 255)
testText.Font = Enum.Font.GothamBold
testText.TextSize = 20
testText.Parent = testFrame

-- Haupt Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 450, 0, 650)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -325)
mainFrame.BackgroundColor3 = colors.background
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.ClipsDescendants = true
mainFrame.Parent = gui
mainFrame.Visible = true
mainFrame.ZIndex = 10
mainFrame.BackgroundTransparency = 0

-- Abgerundete Ecken
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 15)
mainCorner.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 50)
titleBar.BackgroundColor3 = colors.surface
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 15)
titleCorner.Parent = titleBar

-- Title Text
local titleText = Instance.new("TextLabel")
titleText.Name = "TitleText"
titleText.Size = UDim2.new(1, -120, 1, 0)
titleText.Position = UDim2.new(0, 15, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "⚡ OP TOOLGIVER + RUBOX"
titleText.TextColor3 = colors.text
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 18
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

-- Minimize Button
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Name = "MinimizeButton"
minimizeBtn.Size = UDim2.new(0, 40, 0, 40)
minimizeBtn.Position = UDim2.new(1, -90, 0, 5)
minimizeBtn.BackgroundColor3 = colors.primaryDark
minimizeBtn.Text = "−"
minimizeBtn.TextColor3 = colors.text
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 30
minimizeBtn.AutoButtonColor = false
minimizeBtn.Parent = titleBar

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 10)
minimizeCorner.Parent = minimizeBtn

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseButton"
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -45, 0, 5)
closeBtn.BackgroundColor3 = colors.accent
closeBtn.Text = "✕"
closeBtn.TextColor3 = colors.text
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 20
closeBtn.AutoButtonColor = false
closeBtn.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 10)
closeCorner.Parent = closeBtn

-- Content Frame
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -20, 1, -60)
contentFrame.Position = UDim2.new(0, 10, 0, 55)
contentFrame.BackgroundColor3 = colors.background
contentFrame.BackgroundTransparency = 0
contentFrame.Parent = mainFrame

-- Status Label
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Size = UDim2.new(1, 0, 0, 40)
statusLabel.Position = UDim2.new(0, 0, 0, 0)
statusLabel.BackgroundColor3 = colors.surface
statusLabel.BackgroundTransparency = 0
statusLabel.Text = "🟢 Bereit zum Scannen..."
statusLabel.TextColor3 = colors.text
statusLabel.Font = Enum.Font.GothamBold
statusLabel.TextSize = 16
statusLabel.Parent = contentFrame

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(0, 10)
statusCorner.Parent = statusLabel

-- Tool List
local toolList = Instance.new("ScrollingFrame")
toolList.Name = "ToolList"
toolList.Size = UDim2.new(1, 0, 0, 300)
toolList.Position = UDim2.new(0, 0, 0, 50)
toolList.BackgroundColor3 = colors.surface
toolList.BackgroundTransparency = 0.2
toolList.BorderSizePixel = 0
toolList.ScrollBarThickness = 8
toolList.ScrollBarImageColor3 = colors.primary
toolList.CanvasSize = UDim2.new(0, 0, 0, 0)
toolList.AutomaticCanvasSize = Enum.AutomaticSize.Y
toolList.Visible = true
toolList.Parent = contentFrame

local listCorner = Instance.new("UICorner")
listCorner.CornerRadius = UDim.new(0, 10)
listCorner.Parent = toolList

-- Padding
local listPadding = Instance.new("UIPadding")
listPadding.PaddingTop = UDim.new(0, 8)
listPadding.PaddingBottom = UDim.new(0, 8)
listPadding.PaddingLeft = UDim.new(0, 8)
listPadding.PaddingRight = UDim.new(0, 8)
listPadding.Parent = toolList

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 6)
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
listLayout.SortOrder = Enum.SortOrder.Name
listLayout.Parent = toolList

listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    toolList.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 16)
end)

-- Button Frame
local buttonFrame = Instance.new("Frame")
buttonFrame.Name = "ButtonFrame"
buttonFrame.Size = UDim2.new(1, 0, 0, 200)
buttonFrame.Position = UDim2.new(0, 0, 1, -205)
buttonFrame.BackgroundTransparency = 1
buttonFrame.Parent = contentFrame

-- Scan Button
local scanBtn = Instance.new("TextButton")
scanBtn.Name = "ScanButton"
scanBtn.Size = UDim2.new(0.5, -6, 0, 50)
scanBtn.Position = UDim2.new(0, 0, 0, 0)
scanBtn.BackgroundColor3 = colors.primary
scanBtn.Text = "🔍 NORMAL SCAN"
scanBtn.TextColor3 = colors.text
scanBtn.Font = Enum.Font.GothamBold
scanBtn.TextSize = 18
scanBtn.AutoButtonColor = false
scanBtn.Parent = buttonFrame

local scanCorner = Instance.new("UICorner")
scanCorner.CornerRadius = UDim.new(0, 12)
scanCorner.Parent = scanBtn

-- Get Tools Button
local getBtn = Instance.new("TextButton")
getBtn.Name = "GetButton"
getBtn.Size = UDim2.new(0.5, -6, 0, 50)
getBtn.Position = UDim2.new(0.5, 6, 0, 0)
getBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
getBtn.Text = "📦 TOOLS HOLEN"
getBtn.TextColor3 = colors.text
getBtn.Font = Enum.Font.GothamBold
getBtn.TextSize = 18
getBtn.AutoButtonColor = false
getBtn.Parent = buttonFrame

local getCorner = Instance.new("UICorner")
getCorner.CornerRadius = UDim.new(0, 12)
getCorner.Parent = getBtn

-- RUBOX Label
local ruboxLabel = Instance.new("TextLabel")
ruboxLabel.Name = "RuboxLabel"
ruboxLabel.Size = UDim2.new(1, 0, 0, 30)
ruboxLabel.Position = UDim2.new(0, 0, 0, 60)
ruboxLabel.BackgroundTransparency = 1
ruboxLabel.Text = "✨ RUBOX TOOLS ✨"
ruboxLabel.TextColor3 = colors.rubox
ruboxLabel.Font = Enum.Font.GothamBold
ruboxLabel.TextSize = 18
ruboxLabel.Parent = buttonFrame

-- Scan Rubox Button
local scanRuboxBtn = Instance.new("TextButton")
scanRuboxBtn.Name = "ScanRuboxButton"
scanRuboxBtn.Size = UDim2.new(0.5, -6, 0, 50)
scanRuboxBtn.Position = UDim2.new(0, 0, 0, 95)
scanRuboxBtn.BackgroundColor3 = colors.rubox
scanRuboxBtn.Text = "🔍 RUBOX SCAN"
scanRuboxBtn.TextColor3 = colors.background
scanRuboxBtn.Font = Enum.Font.GothamBold
scanRuboxBtn.TextSize = 18
scanRuboxBtn.AutoButtonColor = false
scanRuboxBtn.Parent = buttonFrame

local scanRuboxCorner = Instance.new("UICorner")
scanRuboxCorner.CornerRadius = UDim.new(0, 12)
scanRuboxCorner.Parent = scanRuboxBtn

-- Get Rubox Button
local getRuboxBtn = Instance.new("TextButton")
getRuboxBtn.Name = "GetRuboxButton"
getRuboxBtn.Size = UDim2.new(0.5, -6, 0, 50)
getRuboxBtn.Position = UDim2.new(0.5, 6, 0, 95)
getRuboxBtn.BackgroundColor3 = colors.rubox
getRuboxBtn.Text = "📦 RUBOX HOLEN"
getRuboxBtn.TextColor3 = colors.background
getRuboxBtn.Font = Enum.Font.GothamBold
getRuboxBtn.TextSize = 18
getRuboxBtn.AutoButtonColor = false
getRuboxBtn.Parent = buttonFrame

local getRuboxCorner = Instance.new("UICorner")
getRuboxCorner.CornerRadius = UDim.new(0, 12)
getRuboxCorner.Parent = getRuboxBtn

-- Reset Button
local resetBtn = Instance.new("TextButton")
resetBtn.Name = "ResetButton"
resetBtn.Size = UDim2.new(1, 0, 0, 45)
resetBtn.Position = UDim2.new(0, 0, 1, -50)
resetBtn.BackgroundColor3 = colors.primaryDark
resetBtn.Text = "🔄 LISTE LEEREN"
resetBtn.TextColor3 = colors.text
resetBtn.Font = Enum.Font.GothamBold
resetBtn.TextSize = 18
resetBtn.AutoButtonColor = false
resetBtn.Parent = buttonFrame

local resetCorner = Instance.new("UICorner")
resetCorner.CornerRadius = UDim.new(0, 12)
resetCorner.Parent = resetBtn

-- Credit Label
local creditLabel = Instance.new("TextLabel")
creditLabel.Name = "CreditLabel"
creditLabel.Size = UDim2.new(1, 0, 0, 20)
creditLabel.Position = UDim2.new(0, 0, 1, -20)
creditLabel.BackgroundTransparency = 1
creditLabel.Text = "made by Waled-hammad • 100% work • RUBOX Support"
creditLabel.TextColor3 = colors.textDark
creditLabel.Font = Enum.Font.GothamLight
creditLabel.TextSize = 12
creditLabel.Parent = contentFrame

-- Variablen
local currentTools = {}
local currentRuboxTools = {}

-- Status Funktion
local function setStatus(text, isSuccess)
    statusLabel.Text = text
    if isSuccess == true then
        statusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    elseif isSuccess == false then
        statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    else
        statusLabel.TextColor3 = colors.text
    end
end

-- Liste leeren
local function clearToolList()
    for _, child in ipairs(toolList:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    currentTools = {}
    currentRuboxTools = {}
end

-- Tool hinzufügen
local function addToolToList(toolName, toolInstance, isRubox)
    local toolButton = Instance.new("TextButton")
    toolButton.Name = "ToolItem"
    toolButton.Size = UDim2.new(1, -10, 0, 40)
    toolButton.BackgroundColor3 = isRubox and colors.rubox or colors.surface
    toolButton.BackgroundTransparency = isRubox and 0.2 or 0.5
    toolButton.Text = (isRubox and "✨ " or "🔧 ") .. toolName
    toolButton.TextColor3 = isRubox and colors.background or colors.text
    toolButton.Font = Enum.Font.Gotham
    toolButton.TextSize = 16
    toolButton.TextXAlignment = Enum.TextXAlignment.Left
    toolButton.Parent = toolList
    
    toolButton:SetAttribute("ToolInstance", toolInstance)
    toolButton:SetAttribute("ToolName", toolName)
    toolButton:SetAttribute("IsRubox", isRubox)
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = toolButton
end

-- Normal Scan
local function scanForTools()
    setStatus("⏳ Scanne nach normalen Tools...", nil)
    clearToolList()
    
    local toolsFound = {}
    local allTools = game:GetDescendants()
    
    for _, obj in ipairs(allTools) do
        if obj:IsA("Tool") and obj.Parent then
            local toolName = obj.Name
            if not toolsFound[toolName] then
                toolsFound[toolName] = obj
                addToolToList(toolName, obj, false)
                table.insert(currentTools, {Name = toolName, Instance = obj})
            end
        end
    end
    
    if #currentTools > 0 then
        setStatus("✅ " .. #currentTools .. " normale Tools gefunden", true)
    else
        setStatus("⚠️ Keine normalen Tools gefunden", false)
    end
end

-- Rubox Scan
local function scanForRuboxTools()
    setStatus("⏳ Scanne nach RUBOX Tools...", nil)
    
    local ruboxFound = 0
    local allTools = game:GetDescendants()
    
    for _, obj in ipairs(allTools) do
        if obj:IsA("Tool") and obj.Parent then
            local toolName = obj.Name
            if string.find(toolName:upper(), "RUBOX") or 
               string.find(toolName:upper(), "RUBY") or 
               string.find(toolName:upper(), "GOLD") or
               string.find(toolName:upper(), "ADMIN") or
               string.find(toolName:upper(), "OP") then
                
                local alreadyExists = false
                for _, tool in ipairs(currentRuboxTools) do
                    if tool.Name == toolName then
                        alreadyExists = true
                        break
                    end
                end
                
                if not alreadyExists then
                    addToolToList(toolName, obj, true)
                    table.insert(currentRuboxTools, {Name = toolName, Instance = obj})
                    ruboxFound = ruboxFound + 1
                end
            end
        end
    end
    
    if ruboxFound > 0 then
        setStatus("✅ " .. ruboxFound .. " RUBOX Tools gefunden!", true)
    else
        setStatus("⚠️ Keine RUBOX Tools gefunden", false)
    end
end

-- Normale Tools holen
local function getTools()
    setStatus("📦 Hole normale Tools...", nil)
    
    local successCount = 0
    local backpack = player:FindFirstChild("Backpack")
    
    if not backpack then
        setStatus("❌ Backpack nicht gefunden", false)
        return
    end
    
    for _, toolData in ipairs(currentTools) do
        local tool = toolData.Instance
        if tool and tool.Parent then
            pcall(function()
                local newTool = tool:Clone()
                newTool.Parent = backpack
                successCount = successCount + 1
            end)
        end
    end
    
    if successCount > 0 then
        setStatus("🎉 " .. successCount .. " normale Tools erhalten!", true)
    else
        setStatus("❌ Keine Tools erhalten", false)
    end
end

-- Rubox Tools holen
local function getRuboxTools()
    setStatus("📦 Hole RUBOX Tools...", nil)
    
    local successCount = 0
    local backpack = player:FindFirstChild("Backpack")
    
    if not backpack then
        setStatus("❌ Backpack nicht gefunden", false)
        return
    end
    
    for _, toolData in ipairs(currentRuboxTools) do
        local tool = toolData.Instance
        if tool and tool.Parent then
            pcall(function()
                local newTool = tool:Clone()
                newTool.Parent = backpack
                successCount = successCount + 1
            end)
        end
    end
    
    if successCount > 0 then
        setStatus("🎉 " .. successCount .. " RUBOX Tools erhalten!", true)
    else
        setStatus("❌ Keine RUBOX Tools erhalten", false)
    end
end

-- BUTTON CONNECTIONS
scanBtn.MouseButton1Click:Connect(scanForTools)
getBtn.MouseButton1Click:Connect(getTools)
scanRuboxBtn.MouseButton1Click:Connect(scanForRuboxTools)
getRuboxBtn.MouseButton1Click:Connect(getRuboxTools)

resetBtn.MouseButton1Click:Connect(function()
    clearToolList()
    setStatus("🔄 Liste geleert", nil)
end)

-- Close Button
closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    -- Erstelle Floating Button wenn geschlossen
    local fb = Instance.new("TextButton")
    fb.Name = "FloatingButton"
    fb.Size = UDim2.new(0, 70, 0, 70)
    fb.Position = UDim2.new(0, 15, 1, -85)
    fb.BackgroundColor3 = colors.primary
    fb.Text = "⚡"
    fb.TextColor3 = colors.text
    fb.Font = Enum.Font.GothamBold
    fb.TextSize = 40
    fb.Parent = gui
    fb.Visible = true
    fb.ZIndex = 9999
    fb.Draggable = true
    
    local fbCorner = Instance.new("UICorner")
    fbCorner.CornerRadius = UDim.new(1, 0)
    fbCorner.Parent = fb
    
    fb.MouseButton1Click:Connect(function()
        fb:Destroy()
        mainFrame.Visible = true
    end)
end)

-- Minimize Funktion
minimizeBtn.MouseButton1Click:Connect(function()
    if contentFrame.Visible then
        contentFrame.Visible = false
        mainFrame.Size = UDim2.new(0, 450, 0, 50)
        minimizeBtn.Text = "□"
    else
        contentFrame.Visible = true
        mainFrame.Size = UDim2.new(0, 450, 0, 650)
        minimizeBtn.Text = "−"
    end
end)

-- Draggable Funktion
local dragging = false
local dragInput, dragStart, startPos

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

userInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Auto-scan
task.wait(0.5)
scanForTools()

-- Test-Frame ausblenden
testFrame.Visible = false

print("✅ OP ToolGiver GELADEN! GUI sollte sichtbar sein.")
setStatus("🟢 Bereit - GUI ist sichtbar!", true)

end)

if not success then
    warn("Fehler beim Laden: " .. tostring(result))
    -- Zeige Fehler im Spiel an
    local errorGui = Instance.new("ScreenGui")
    errorGui.Parent = game:GetService("CoreGui")
    local errorFrame = Instance.new("Frame")
    errorFrame.Size = UDim2.new(0, 400, 0, 200)
    errorFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
    errorFrame.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    errorFrame.Parent = errorGui
    local errorText = Instance.new("TextLabel")
    errorText.Size = UDim2.new(1, 0, 1, 0)
    errorText.BackgroundTransparency = 1
    errorText.Text = "Fehler: " .. tostring(result)
    errorText.TextColor3 = Color3.new(1, 1, 1)
    errorText.TextWrapped = true
    errorText.Parent = errorFrame
end
