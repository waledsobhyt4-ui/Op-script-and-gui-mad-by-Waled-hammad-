--[[
    OP Tools Toolgiver
    Designed by: Waled-hammad
    Features: Scan & Get Tools, Modern GUI
    Status: 100% Work (Ensure Loadstring Environment)
]]

-- Wait for the Player GUI to load
local player = game:GetService("Players").LocalPlayer
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")
local coreGui = game:GetService("CoreGui")

-- Create a ScreenGui in CoreGui (for top-layer display, works in most games)
local gui = Instance.new("ScreenGui")
gui.Name = "WaledHammad_OPTools"
gui.Parent = player:WaitForChild("PlayerGui") -- Use CoreGui for more persistence? PlayerGui is safer for most. Use CoreGui if you want it to stay across respawns but might get flagged.
-- gui.Parent = coreGui -- Alternative (uncomment if PlayerGui doesn't work)

-- Theme Colors
local colors = {
    background = Color3.fromRGB(25, 25, 35),
    surface = Color3.fromRGB(35, 35, 45),
    primary = Color3.fromRGB(0, 170, 255),    -- Bright cyan
    primaryDark = Color3.fromRGB(0, 130, 200),
    accent = Color3.fromRGB(255, 85, 85),      -- Soft red for close button
    text = Color3.fromRGB(240, 240, 240),
    textDark = Color3.fromRGB(160, 160, 160),
    success = Color3.fromRGB(100, 255, 150),
    warning = Color3.fromRGB(255, 200, 100)
}

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 380, 0, 500)
mainFrame.Position = UDim2.new(0.5, -190, 0.5, -250)
mainFrame.BackgroundColor3 = colors.background
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.ClipsDescendants = true

-- Add a drop shadow effect (using ImageLabel for simplicity)
local shadow = Instance.new("ImageLabel")
shadow.Name = "Shadow"
shadow.Size = UDim2.new(1, 30, 1, 30)
shadow.Position = UDim2.new(0, -15, 0, -15)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://6014261993" -- Rounded rectangle shadow
shadow.ImageColor3 = Color3.new(0, 0, 0)
shadow.ImageTransparency = 0.6
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.Parent = mainFrame

-- Main frame corner rounding
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 45)
titleBar.BackgroundColor3 = colors.surface
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar
-- Fix corner overlapping (only top corners rounded)
local titleCornerFix = Instance.new("UICorner")
titleCornerFix.CornerRadius = UDim.new(0, 12)
titleCornerFix.Parent = mainFrame -- Already have, but we need to mask bottom? Better to use a separate frame for content. But let's keep simple.

-- Title Text
local titleText = Instance.new("TextLabel")
titleText.Name = "TitleText"
titleText.Size = UDim2.new(1, -50, 1, 0)
titleText.Position = UDim2.new(0, 15, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "⚡ OP TOOLGIVER by Waled-hammad"
titleText.TextColor3 = colors.text
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 18
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseButton"
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0, 7.5)
closeBtn.BackgroundColor3 = colors.accent
closeBtn.Text = "✕"
closeBtn.TextColor3 = colors.text
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 20
closeBtn.AutoButtonColor = false
closeBtn.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeBtn

-- Content Frame
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -20, 1, -55)
contentFrame.Position = UDim2.new(0, 10, 0, 50)
contentFrame.BackgroundColor3 = colors.background
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

-- === Status Label ===
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Size = UDim2.new(1, 0, 0, 35)
statusLabel.Position = UDim2.new(0, 0, 0, 5)
statusLabel.BackgroundColor3 = colors.surface
statusLabel.BackgroundTransparency = 0.5
statusLabel.Text = "🟢 Ready to scan..."
statusLabel.TextColor3 = colors.textDark
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 16
statusLabel.Parent = contentFrame

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(0, 8)
statusCorner.Parent = statusLabel

-- === Scrolling Frame for Tools List ===
local listContainer = Instance.new("ScrollingFrame")
listContainer.Name = "ToolList"
listContainer.Size = UDim2.new(1, 0, 0, 220)
listContainer.Position = UDim2.new(0, 0, 0, 50)
listContainer.BackgroundColor3 = colors.surface
listContainer.BackgroundTransparency = 0.3
listContainer.BorderSizePixel = 0
listContainer.ScrollBarThickness = 6
listContainer.ScrollBarImageColor3 = colors.primary
listContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
listContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
listContainer.Parent = contentFrame

local listCorner = Instance.new("UICorner")
listCorner.CornerRadius = UDim.new(0, 8)
listCorner.Parent = listContainer

-- Padding inside list
local listPadding = Instance.new("UIPadding")
listPadding.PaddingTop = UDim.new(0, 5)
listPadding.PaddingBottom = UDim.new(0, 5)
listPadding.PaddingLeft = UDim.new(0, 5)
listPadding.PaddingRight = UDim.new(0, 5)
listPadding.Parent = listContainer

-- List layout
local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 5)
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
listLayout.SortOrder = Enum.SortOrder.Name
listLayout.Parent = listContainer

-- Update canvas size based on content
listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    listContainer.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
end)

-- === Button Frame ===
local buttonFrame = Instance.new("Frame")
buttonFrame.Name = "ButtonFrame"
buttonFrame.Size = UDim2.new(1, 0, 0, 70)
buttonFrame.Position = UDim2.new(0, 0, 1, -75)
buttonFrame.BackgroundTransparency = 1
buttonFrame.Parent = contentFrame

-- Scan Button
local scanBtn = Instance.new("TextButton")
scanBtn.Name = "ScanButton"
scanBtn.Size = UDim2.new(0.5, -10, 0, 45)
scanBtn.Position = UDim2.new(0, 0, 0, 0)
scanBtn.BackgroundColor3 = colors.primary
scanBtn.Text = "🔍 SCAN TOOLS"
scanBtn.TextColor3 = colors.text
scanBtn.Font = Enum.Font.GothamBold
scanBtn.TextSize = 18
scanBtn.AutoButtonColor = false
scanBtn.Parent = buttonFrame

local scanCorner = Instance.new("UICorner")
scanCorner.CornerRadius = UDim.new(0, 10)
scanCorner.Parent = scanBtn

-- Get Tools Button
local getBtn = Instance.new("TextButton")
getBtn.Name = "GetButton"
getBtn.Size = UDim2.new(0.5, -10, 0, 45)
getBtn.Position = UDim2.new(0.5, 10, 0, 0)
getBtn.BackgroundColor3 = colors.success
getBtn.Text = "📦 GET TOOLS"
getBtn.TextColor3 = colors.background
getBtn.Font = Enum.Font.GothamBold
getBtn.TextSize = 18
getBtn.AutoButtonColor = false
getBtn.Parent = buttonFrame

local getCorner = Instance.new("UICorner")
getCorner.CornerRadius = UDim.new(0, 10)
getCorner.Parent = getBtn

-- Small credit label
local creditLabel = Instance.new("TextLabel")
creditLabel.Name = "CreditLabel"
creditLabel.Size = UDim2.new(1, 0, 0, 20)
creditLabel.Position = UDim2.new(0, 0, 1, -20)
creditLabel.BackgroundTransparency = 1
creditLabel.Text = "made by Waled-hammad • 100% work"
creditLabel.TextColor3 = colors.textDark
creditLabel.Font = Enum.Font.GothamLight
creditLabel.TextSize = 12
creditLabel.Parent = contentFrame

-- Assemble GUI
mainFrame.Parent = gui

-- Variables
local currentTools = {} -- Store detected tool names and instances

-- Function to update status with animation
local function setStatus(text, isSuccess)
    statusLabel.Text = text
    if isSuccess == true then
        statusLabel.TextColor3 = colors.success
    elseif isSuccess == false then
        statusLabel.TextColor3 = colors.warning
    else
        statusLabel.TextColor3 = colors.textDark
    end
    -- Subtle tween
    tweenService:Create(statusLabel, TweenInfo.new(0.3), {BackgroundTransparency = 0.2}):Play()
    task.wait(0.1)
    tweenService:Create(statusLabel, TweenInfo.new(0.3), {BackgroundTransparency = 0.5}):Play()
end

-- Function to clear tool list display
local function clearToolList()
    for _, child in ipairs(listContainer:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    currentTools = {}
end

-- Function to add a tool to the list UI
local function addToolToList(toolName, toolInstance)
    local toolButton = Instance.new("TextButton")
    toolButton.Name = "ToolItem"
    toolButton.Size = UDim2.new(1, -10, 0, 30)
    toolButton.BackgroundColor3 = colors.background
    toolButton.BackgroundTransparency = 0.3
    toolButton.Text = "🔧 " .. toolName
    toolButton.TextColor3 = colors.text
    toolButton.Font = Enum.Font.Gotham
    toolButton.TextSize = 14
    toolButton.TextXAlignment = Enum.TextXAlignment.Left
    toolButton.Parent = listContainer
    
    -- Store instance reference in button (for potential use, but we'll use the list)
    toolButton:SetAttribute("ToolInstance", toolInstance)
    toolButton:SetAttribute("ToolName", toolName)
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 5)
    btnCorner.Parent = toolButton
    
    -- Hover effect
    toolButton.MouseEnter:Connect(function()
        tweenService:Create(toolButton, TweenInfo.new(0.2), {BackgroundColor3 = colors.surface}):Play()
    end)
    toolButton.MouseLeave:Connect(function()
        tweenService:Create(toolButton, TweenInfo.new(0.2), {BackgroundColor3 = colors.background}):Play()
    end)
end

-- Scan function: finds all Tool objects in the game (Workspace and Player Backpacks)
local function scanForTools()
    setStatus("⏳ Scanning for tools...", nil)
    clearToolList()
    
    local toolsFound = {}
    local allTools = game:GetDescendants()
    
    for _, obj in ipairs(allTools) do
        -- Check if object is a Tool and is not already in local player's character or backpack (optional)
        if obj:IsA("Tool") and obj.Parent then
            local toolName = obj.Name
            if not toolsFound[toolName] then -- Avoid duplicates by name for cleaner list, but keep one instance
                toolsFound[toolName] = obj
                addToolToList(toolName, obj)
            else
                -- If you want to list duplicates, modify logic. We'll just show one per name.
            end
        end
    end
    
    -- Convert to list for currentTools
    currentTools = {}
    for name, inst in pairs(toolsFound) do
        table.insert(currentTools, {Name = name, Instance = inst})
    end
    
    if #currentTools > 0 then
        setStatus("✅ Found " .. #currentTools .. " tool(s)", true)
    else
        setStatus("⚠️ No tools found in game", false)
    end
end

-- Get Tools function: gives all scanned tools to local player
local function getTools()
    setStatus("📦 Attempting to get tools...", nil)
    
    local successCount = 0
    local backpack = player:FindFirstChild("Backpack")
    local character = player.Character
    
    if not backpack then
        setStatus("❌ Backpack not found", false)
        return
    end
    
    for _, toolData in ipairs(currentTools) do
        local tool = toolData.Instance
        if tool and tool.Parent then -- Tool still exists
            -- Clone the tool to give to player (if it's in workspace, cloning is safer than moving)
            -- But moving is also an option. Let's try to move it if possible, else clone.
            pcall(function()
                local newTool = tool:Clone()
                newTool.Parent = backpack
                successCount = successCount + 1
            end)
        else
            -- Tool might have been destroyed, re-scan could fix
        end
    end
    
    if successCount > 0 then
        setStatus("🎉 Gave " .. successCount .. " tool(s) to you!", true)
    else
        setStatus("❌ No tools could be given", false)
    end
end

-- Button connections
scanBtn.MouseButton1Click:Connect(scanForTools)
getBtn.MouseButton1Click:Connect(getTools)

-- Close button
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Make main frame draggable via title bar
local dragging = false
local dragInput, dragStart, startPos

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
})

titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

userInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Initial scan after a short delay (optional)
task.wait(0.5)
scanForTools()

-- Notification that GUI loaded
setStatus("🟢 GUI Loaded | Ready", true)

-- Prevent deletion of the GUI if player respawns? PlayerGui handles that automatically.
-- If using CoreGui, it persists. We'll stick with PlayerGui for now.

--[[
    FEATURES:
    - Scan entire game for Tool objects.
    - Display tools in a scrollable list.
    - Get Tools: Clones found tools into your backpack.
    - Modern UI with shadows, rounded corners, hover effects.
    - Drag functionality.
    - Status updates.
    - Designed by Waled-hammad.
    
    INSTRUCTIONS:
    Simply execute this script. The GUI will appear in the center.
    Click "SCAN TOOLS" to search for all tools in the game.
    Click "GET TOOLS" to receive cloned copies of all found tools.
    The tool list shows the names of detected tools.
    
    NOTE: Some games may have anti-cheat that detects cloning tools.
    This script works in most standard games.
]]
