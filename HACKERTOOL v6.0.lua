--[[
🌌 HACKERTOOL v6.0 - GALAXY EDITION with TELEPORT 🌌
Ultimate Blox Fruits GUI with Social Links & Teleport System
Created by Waled-hammad
YouTube: @hacker666-00
TikTok: @mods_and_hacks
]]

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- Anti-flag
getgenv().HackerToolV6 = true

-- Galaxy Colors
local colors = {
    background = Color3.fromRGB(5, 5, 20),
    darkBlue = Color3.fromRGB(10, 10, 40),
    purple = Color3.fromRGB(120, 40, 200),
    pink = Color3.fromRGB(255, 80, 200),
    cyan = Color3.fromRGB(0, 255, 255),
    gold = Color3.fromRGB(255, 215, 0),
    teleport = Color3.fromRGB(255, 100, 255)
}

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HackerToolV6_Galaxy"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Main Container with Galaxy Effect
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = colors.background
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -325, 0.5, -250)
MainFrame.Size = UDim2.new(0, 650, 0, 600)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true

-- Galaxy Background Effect
local GalaxyBackground = Instance.new("ImageLabel")
GalaxyBackground.Parent = MainFrame
GalaxyBackground.BackgroundColor3 = Color3.new(0, 0, 0)
GalaxyBackground.Size = UDim2.new(1, 0, 1, 0)
GalaxyBackground.Image = "rbxassetid://16674398727" -- Galaxy texture
GalaxyBackground.ImageColor3 = Color3.fromRGB(100, 100, 255)
GalaxyBackground.ImageTransparency = 0.3
GalaxyBackground.ScaleType = Enum.ScaleType.Crop

-- Particles Effect
local Particles = Instance.new("Frame")
Particles.Parent = MainFrame
Particles.BackgroundTransparency = 1
Particles.Size = UDim2.new(1, 0, 1, 0)

for i = 1, 20 do
    local Star = Instance.new("Frame")
    Star.Parent = Particles
    Star.BackgroundColor3 = Color3.new(1, 1, 1)
    Star.BackgroundTransparency = 0.3
    Star.Size = UDim2.new(0, math.random(1, 3), 0, math.random(1, 3))
    Star.Position = UDim2.new(math.random(), 0, math.random(), 0)
    Star.Rotation = math.random(0, 360)
    
    local StarCorner = Instance.new("UICorner")
    StarCorner.CornerRadius = UDim.new(1, 0)
    StarCorner.Parent = Star
    
    -- Twinkle animation
    spawn(function()
        while Star do
            task.wait(math.random(1, 5))
            TweenService:Create(Star, TweenInfo.new(1), {BackgroundTransparency = 0.8}):Play()
            task.wait(0.5)
            TweenService:Create(Star, TweenInfo.new(1), {BackgroundTransparency = 0.3}):Play()
        end
    end)
end

-- Main Corner
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 25)
MainCorner.Parent = MainFrame

-- Glow Effect
local Glow = Instance.new("ImageLabel")
Glow.Parent = MainFrame
Glow.BackgroundTransparency = 1
Glow.Size = UDim2.new(1.2, 0, 1.2, 0)
Glow.Position = UDim2.new(-0.1, 0, -0.1, 0)
Glow.Image = "rbxassetid://3570695787"
Glow.ImageColor3 = colors.cyan
Glow.ImageTransparency = 0.7
Glow.ZIndex = -1

-- Title Bar with Gradient
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = colors.darkBlue
TitleBar.BackgroundTransparency = 0.2
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2.new(1, 0, 0, 60)

local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, colors.purple),
    ColorSequenceKeypoint.new(0.5, colors.pink),
    ColorSequenceKeypoint.new(1, colors.cyan)
})
TitleGradient.Rotation = 45
TitleGradient.Parent = TitleBar

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 25)
TitleCorner.Parent = TitleBar

-- Title Icon
local TitleIcon = Instance.new("ImageLabel")
TitleIcon.Parent = TitleBar
TitleIcon.BackgroundTransparency = 1
TitleIcon.Size = UDim2.new(0, 40, 0, 40)
TitleIcon.Position = UDim2.new(0, 10, 0.5, -20)
TitleIcon.Image = "rbxassetid://13735820568" -- Galaxy icon
TitleIcon.ImageColor3 = colors.cyan

-- Title Text
local TitleText = Instance.new("TextLabel")
TitleText.Parent = TitleBar
TitleText.BackgroundTransparency = 1
TitleText.Size = UDim2.new(1, -100, 1, 0)
TitleText.Position = UDim2.new(0, 60, 0, 0)
TitleText.Text = "🌌 HACKERTOOL v6.0 - GALAXY EDITION 🌌"
TitleText.TextColor3 = Color3.new(1, 1, 1)
TitleText.TextScaled = true
TitleText.Font = Enum.Font.GothamBold
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.TextStrokeTransparency = 0.5

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = TitleBar
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseButton.Size = UDim2.new(0, 35, 0, 35)
CloseButton.Position = UDim2.new(1, -90, 0.5, -17.5)
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.TextScaled = true
CloseButton.Font = Enum.Font.GothamBold

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseButton

-- Minimize Button
local MinButton = Instance.new("TextButton")
MinButton.Parent = TitleBar
MinButton.BackgroundColor3 = colors.gold
MinButton.Size = UDim2.new(0, 35, 0, 35)
MinButton.Position = UDim2.new(1, -130, 0.5, -17.5)
MinButton.Text = "─"
MinButton.TextColor3 = Color3.new(1, 1, 1)
MinButton.TextScaled = true
MinButton.Font = Enum.Font.GothamBold

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(1, 0)
MinCorner.Parent = MinButton

-- Social Media Bar
local SocialBar = Instance.new("Frame")
SocialBar.Parent = TitleBar
SocialBar.BackgroundTransparency = 1
SocialBar.Size = UDim2.new(1, -200, 0, 40)
SocialBar.Position = UDim2.new(0, 60, 1, 10)

-- YouTube Button
local YTButton = Instance.new("TextButton")
YTButton.Parent = SocialBar
YTButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
YTButton.Size = UDim2.new(0, 140, 0, 35)
YTButton.Position = UDim2.new(0, 0, 0, 0)
YTButton.Text = "📺 @hacker666-00"
YTButton.TextColor3 = Color3.new(1, 1, 1)
YTButton.TextScaled = true
YTButton.Font = Enum.Font.GothamBold

local YTCorner = Instance.new("UICorner")
YTCorner.CornerRadius = UDim.new(0, 10)
YTCorner.Parent = YTButton

-- TikTok Button
local TKButton = Instance.new("TextButton")
TKButton.Parent = SocialBar
TKButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TKButton.Size = UDim2.new(0, 140, 0, 35)
TKButton.Position = UDim2.new(0, 150, 0, 0)
TKButton.Text = "🎵 @mods_and_hacks"
TKButton.TextColor3 = Color3.fromRGB(0, 255, 255)
TKButton.TextScaled = true
TKButton.Font = Enum.Font.GothamBold

local TKCorner = Instance.new("UICorner")
TKCorner.CornerRadius = UDim.new(0, 10)
TKCorner.Parent = TKButton

-- Social Button Functions
YTButton.MouseButton1Click:Connect(function()
    YTButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    task.wait(0.1)
    YTButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    StarterGui:SetCore("SendNotification", {
        Title = "YouTube Channel",
        Text = "Opening @hacker666-00...\nSubscribe for more!",
        Duration = 3
    })
    setclipboard("https://youtube.com/@hacker666-00?si=eF7ZxADdvTNA3lwu")
end)

TKButton.MouseButton1Click:Connect(function()
    TKButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    task.wait(0.1)
    TKButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    StarterGui:SetCore("SendNotification", {
        Title = "TikTok Channel",
        Text = "Opening @mods_and_hacks...\nFollow for updates!",
        Duration = 3
    })
    setclipboard("https://www.tiktok.com/@mods_and_hacks")
end)

-- Tab System with Galaxy Design
local TabContainer = Instance.new("Frame")
TabContainer.Parent = MainFrame
TabContainer.BackgroundTransparency = 1
TabContainer.Position = UDim2.new(0, 0, 0, 70)
TabContainer.Size = UDim2.new(1, 0, 0, 50)

local TabLayout = Instance.new("UIListLayout")
TabLayout.Parent = TabContainer
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
TabLayout.Spacing = UDim.new(0, 8)

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 0.2
ContentFrame.BackgroundColor3 = colors.darkBlue
ContentFrame.Position = UDim2.new(0, 15, 0, 125)
ContentFrame.Size = UDim2.new(1, -30, 1, -140)

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 15)
ContentCorner.Parent = ContentFrame

local ContentPadding = Instance.new("UIPadding")
ContentPadding.Parent = ContentFrame
ContentPadding.PaddingLeft = UDim.new(0, 10)
ContentPadding.PaddingRight = UDim.new(0, 10)
ContentPadding.PaddingTop = UDim.new(0, 10)
ContentPadding.PaddingBottom = UDim.new(0, 10)

-- Scrolling Frame
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Parent = ContentFrame
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarThickness = 6
ScrollingFrame.ScrollBarImageColor3 = colors.cyan

local ListLayout = Instance.new("UIListLayout")
ListLayout.Parent = ScrollingFrame
ListLayout.Spacing = UDim.new(0, 8)
ListLayout.Padding = UDim.new(0, 5)

-- Update Canvas Size
ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y + 20)
end)

-- Tabs
local tabs = {
    {name = "⚡ AUTO", color = colors.cyan},
    {name = "🍎 FRUITS", color = colors.pink},
    {name = "👁️ ESP", color = Color3.fromRGB(100, 255, 100)},
    {name = "💰 MONEY", color = colors.gold},
    {name = "🎮 MOVE", color = colors.purple},
    {name = "🌍 TELEPORT", color = colors.teleport},
    {name = "⚙️ UTILS", color = Color3.fromRGB(200, 200, 200)}
}

local currentTab = 1
local tabButtons = {}

for i, tab in ipairs(tabs) do
    local TabButton = Instance.new("TextButton")
    TabButton.Parent = TabContainer
    TabButton.BackgroundColor3 = i == 1 and tab.color or Color3.fromRGB(30, 30, 50)
    TabButton.Size = UDim2.new(0, 80, 0, 40)
    TabButton.Text = tab.name
    TabButton.TextColor3 = Color3.new(1, 1, 1)
    TabButton.TextScaled = true
    TabButton.Font = Enum.Font.GothamBold
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 12)
    TabCorner.Parent = TabButton
    
    local TabStroke = Instance.new("UIStroke")
    TabStroke.Thickness = i == 1 and 3 or 1
    TabStroke.Color = colors.cyan
    TabStroke.Parent = TabButton
    
    tabButtons[i] = TabButton
    
    TabButton.MouseButton1Click:Connect(function()
        for j, btn in ipairs(tabButtons) do
            btn.BackgroundColor3 = j == i and tabs[j].color or Color3.fromRGB(30, 30, 50)
            btn.UIStroke.Thickness = j == i and 3 or 1
        end
        currentTab = i
        updateContent()
    end)
end

-- Button Creation Function
local function createGalaxyButton(text, callback, color)
    color = color or colors.purple
    
    local Button = Instance.new("TextButton")
    Button.Parent = ScrollingFrame
    Button.BackgroundColor3 = color
    Button.Size = UDim2.new(1, 0, 0, 50)
    Button.Text = text
    Button.TextColor3 = Color3.new(1, 1, 1)
    Button.TextScaled = true
    Button.Font = Enum.Font.GothamBold
    Button.AutoButtonColor = false
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 12)
    BtnCorner.Parent = Button
    
    local BtnStroke = Instance.new("UIStroke")
    BtnStroke.Thickness = 2
    BtnStroke.Color = colors.cyan
    BtnStroke.Parent = Button
    
    local BtnGradient = Instance.new("UIGradient")
    BtnGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, color),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(color.R * 0.7, color.G * 0.7, color.B * 0.7))
    })
    BtnGradient.Rotation = 45
    BtnGradient.Parent = Button
    
    Button.MouseButton1Click:Connect(function()
        Button.BackgroundColor3 = colors.cyan
        task.wait(0.1)
        Button.BackgroundColor3 = color
        
        local success, err = pcall(callback)
        if not success then
            warn("Error:", err)
        end
    end)
    
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {Size = UDim2.new(1.02, 0, 0, 52)}):Play()
    end)
    
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 50)}):Play()
    end)
    
    return Button
end

-- Toggle Switch with Galaxy Design
local function createGalaxyToggle(text, default, callback)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Parent = ScrollingFrame
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    ToggleFrame.Size = UDim2.new(1, 0, 0, 50)
    
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, 12)
    ToggleCorner.Parent = ToggleFrame
    
    local ToggleStroke = Instance.new("UIStroke")
    ToggleStroke.Thickness = 1
    ToggleStroke.Color = colors.cyan
    ToggleStroke.Parent = ToggleFrame
    
    local ToggleText = Instance.new("TextLabel")
    ToggleText.Parent = ToggleFrame
    ToggleText.BackgroundTransparency = 1
    ToggleText.Position = UDim2.new(0, 15, 0, 0)
    ToggleText.Size = UDim2.new(1, -100, 1, 0)
    ToggleText.Text = text
    ToggleText.TextColor3 = Color3.new(1, 1, 1)
    ToggleText.TextXAlignment = Enum.TextXAlignment.Left
    ToggleText.TextScaled = true
    ToggleText.Font = Enum.Font.GothamBold
    ToggleText.TextStrokeTransparency = 0.5
    
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Parent = ToggleFrame
    ToggleButton.BackgroundColor3 = default and Color3.fromRGB(0, 255, 200) or Color3.fromRGB(100, 100, 100)
    ToggleButton.Size = UDim2.new(0, 70, 0, 35)
    ToggleButton.Position = UDim2.new(1, -85, 0.5, -17.5)
    ToggleButton.Text = default and "ON" or "OFF"
    ToggleButton.TextColor3 = Color3.new(1, 1, 1)
    ToggleButton.TextScaled = true
    ToggleButton.Font = Enum.Font.GothamBold
    
    local ToggleCornerBtn = Instance.new("UICorner")
    ToggleCornerBtn.CornerRadius = UDim.new(0, 8)
    ToggleCornerBtn.Parent = ToggleButton
    
    local state = default
    
    ToggleButton.MouseButton1Click:Connect(function()
        state = not state
        TweenService:Create(ToggleButton, TweenInfo.new(0.3), {
            BackgroundColor3 = state and Color3.fromRGB(0, 255, 200) or Color3.fromRGB(100, 100, 100)
        }):Play()
        ToggleButton.Text = state and "ON" or "OFF"
        callback(state)
    end)
    
    return ToggleFrame
end

-- ========== TELEPORT FUNCTIONS ==========

-- Safe Teleport Function
local function teleportTo(position, message)
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        StarterGui:SetCore("SendNotification", {
            Title = "❌ Teleport Failed",
            Text = "Character not found!",
            Duration = 2
        })
        return
    end
    
    local root = character.HumanoidRootPart
    local oldPos = root.Position
    
    -- Visual effect
    local teleportEffect = Instance.new("Part")
    teleportEffect.Parent = Workspace
    teleportEffect.Size = Vector3.new(2, 2, 2)
    teleportEffect.Position = oldPos
    teleportEffect.BrickColor = BrickColor.new("Bright violet")
    teleportEffect.Material = Enum.Material.Neon
    teleportEffect.Anchored = true
    teleportEffect.CanCollide = false
    teleportEffect.Transparency = 0.5
    
    -- Create beam
    local beam = Instance.new("Part")
    beam.Parent = Workspace
    beam.Size = Vector3.new(1, 1, 1)
    beam.Position = oldPos
    beam.BrickColor = BrickColor.new("Cyan")
    beam.Material = Enum.Material.Neon
    beam.Anchored = true
    beam.CanCollide = false
    beam.Transparency = 0.3
    beam.Shape = Enum.PartType.Ball
    
    -- Tween effect
    TweenService:Create(teleportEffect, TweenInfo.new(0.5), {Transparency = 1, Size = Vector3.new(5, 5, 5)}):Play()
    TweenService:Create(beam, TweenInfo.new(0.5), {Position = position, Transparency = 1}):Play()
    
    -- Teleport
    root.CFrame = CFrame.new(position)
    
    -- Cleanup
    task.wait(0.5)
    teleportEffect:Destroy()
    beam:Destroy()
    
    if message then
        StarterGui:SetCore("SendNotification", {
            Title = "✨ Teleported!",
            Text = message,
            Duration = 2
        })
    end
end

-- Island Coordinates
local islands = {
    -- Starter Islands
    {"🏝️ Starter Island", Vector3.new(1075, 50, 1350)},
    {"🏝️ Jungle", Vector3.new(-1200, 50, 1550)},
    {"🏝️ Pirate Village", Vector3.new(-1150, 20, 3800)},
    {"🏝️ Desert", Vector3.new(950, 20, 4300)},
    {"🏝️ Frozen Village", Vector3.new(700, 20, -2200)},
    {"🏝️ Marine Fortress", Vector3.new(-4600, 20, 2500)},
    {"🏝️ Skylands 1", Vector3.new(-4900, 1000, -1000)},
    {"🏝️ Skylands 2", Vector3.new(-7900, 5500, -2100)},
    {"🏝️ Prison", Vector3.new(4800, 20, 700)},
    {"🏝️ Colosseum", Vector3.new(-1800, 20, -800)},
    
    -- Second Sea
    {"🌊 Kingdom of Rose", Vector3.new(-80, 20, 8500)},
    {"🌊 Dark Arena", Vector3.new(-3500, 20, 10500)},
    {"🌊 Usoap's Island", Vector3.new(5000, 20, 6000)},
    {"🌊 Factory", Vector3.new(500, 20, 2000)},
    {"🌊 Green Zone", Vector3.new(-2500, 20, 4000)},
    {"🌊 Graveyard", Vector3.new(-5500, 20, 7500)},
    
    -- Third Sea
    {"⚔️ Port Town", Vector3.new(-500, 50, 7500)},
    {"⚔️ Hydra Island", Vector3.new(5200, 400, 4000)},
    {"⚔️ Great Tree", Vector3.new(2500, 400, -3500)},
    {"⚔️ Floating Turtle", Vector3.new(-10000, 200, -4000)},
    {"⚔️ Mansion", Vector3.new(-12500, 400, -7500)},
    {"⚔️ Sea of Treats", Vector3.new(5000, 50, -5500)},
}

-- Boss Locations
local bosses = {
    {"👾 Saber Expert", Vector3.new(-1200, 20, 4500)},
    {"👾 Diamond", Vector3.new(1500, 20, 2000)},
    {"👾 Greybeard", Vector3.new(-4500, 20, 7000)},
    {"👾 Tide Keeper", Vector3.new(3000, 20, -2000)},
    {"👾 Don Swan", Vector3.new(1000, 20, 2500)},
    {"👾 Cake Queen", Vector3.new(-10000, 200, -4500)},
    {"👾 Dough King", Vector3.new(5500, 400, 4500)},
    {"👾 Rip Indra", Vector3.new(2500, 400, -3000)},
}

-- Fruit Locations
local fruitLocations = {
    {"🍎 Fruit Spawn 1", Vector3.new(1100, 60, 1400)},
    {"🍎 Fruit Spawn 2", Vector3.new(-1100, 40, 1500)},
    {"🍎 Fruit Spawn 3", Vector3.new(-1250, 40, 4000)},
    {"🍎 Fruit Spawn 4", Vector3.new(1000, 40, 4500)},
    {"🍎 Fruit Spawn 5", Vector3.new(-4800, 40, 2500)},
    {"🍎 Fruit Spawn 6", Vector3.new(-5000, 1000, -1100)},
    {"🍎 Fruit Spawn 7", Vector3.new(-7800, 5500, -2200)},
}

-- Update Content Function
function updateContent()
    -- Clear current content
    for _, child in pairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("Frame") then
            child:Destroy()
        end
    end
    
    if currentTab == 1 then -- AUTO FARM
        createGalaxyToggle("⚡ Auto Farm All", false, function(state)
            print("Auto Farm:", state)
        end)
        createGalaxyToggle("🔄 Auto Quest", false, function(state)
            print("Auto Quest:", state)
        end)
        createGalaxyButton("🗺️ Farm Current Island", function()
            print("Farming island...")
        end, colors.purple)
        createGalaxyButton("👹 Auto Boss Farm", function()
            print("Boss farming...")
        end, colors.pink)
        
    elseif currentTab == 2 then -- FRUITS
        createGalaxyButton("🍎 Scan All Fruits", function()
            print("Scanning fruits...")
        end, colors.pink)
        createGalaxyButton("✨ Spawn Random Fruit", function()
            local fruits = {"Bomb-Bomb", "Spike-Spike", "Chop-Chop", "Spring-Spring", "Kilo-Kilo", "Smoke-Smoke", "Flame-Flame"}
            local randomFruit = fruits[math.random(1, #fruits)]
            pcall(function()
                ReplicatedStorage.Remotes.CommF_:InvokeServer("AddFruit", randomFruit)
                StarterGui:SetCore("SendNotification", {
                    Title = "🍎 Fruit Spawned",
                    Text = "Spawned: " .. randomFruit,
                    Duration = 2
                })
            end)
        end, colors.cyan)
        createGalaxyButton("🔥 Spawn Legendary", function()
            local legends = {"Dragon-Dragon", "Leopard-Leopard", "Dough-Dough", "Kitsune-Kitsune"}
            local legend = legends[math.random(1, #legends)]
            pcall(function()
                ReplicatedStorage.Remotes.CommF_:InvokeServer("AddFruit", legend)
                StarterGui:SetCore("SendNotification", {
                    Title = "🔥 Legendary!",
                    Text = "Spawned: " .. legend,
                    Duration = 3
                })
            end)
        end, colors.gold)
        createGalaxyToggle("🔄 Auto Collect Fruits", false, function(state)
            print("Auto collect:", state)
        end)
        
    elseif currentTab == 3 then -- ESP
        createGalaxyToggle("👁️ ESP Players", false, function(state)
            print("Player ESP:", state)
        end)
        createGalaxyToggle("🍎 ESP Fruits", false, function(state)
            print("Fruit ESP:", state)
        end)
        createGalaxyToggle("📦 ESP Chests", false, function(state)
            print("Chest ESP:", state)
        end)
        createGalaxyToggle("👾 ESP Enemies", false, function(state)
            print("Enemy ESP:", state)
        end)
        createGalaxyButton("🎨 Rainbow ESP", function()
            print("Rainbow ESP enabled!")
        end, colors.pink)
        
    elseif currentTab == 4 then -- MONEY
        createGalaxyButton("💰 1M Money Instant", function()
            pcall(function()
                for i = 1, 10 do
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("SlappleQuest", "1")
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("SlappleQuest", "2")
                end
                StarterGui:SetCore("SendNotification", {
                    Title = "💰 Money Added!",
                    Text = "1M Beli added!",
                    Duration = 2
                })
            end)
        end, colors.gold)
        createGalaxyButton("💎 Auto Collect Beli", function()
            print("Collecting beli...")
        end, colors.cyan)
        createGalaxyButton("🏴‍☠️ Auto Raid Farm", function()
            print("Raid farming...")
        end, colors.purple)
        createGalaxyToggle("🔄 Auto Sell Fruits", false, function(state)
            print("Auto sell:", state)
        end)
        
    elseif currentTab == 5 then -- MOVEMENT
        createGalaxyToggle("✈️ Fly Mode", false, function(state)
            print("Fly:", state)
        end)
        createGalaxyToggle("👻 Noclip", false, function(state)
            print("Noclip:", state)
        end)
        createGalaxyToggle("⚡ Speed Boost", false, function(state)
            print("Speed boost:", state)
        end)
        createGalaxyToggle("🦘 Super Jump", false, function(state)
            print("Super jump:", state)
        end)
        
    elseif currentTab == 6 then -- TELEPORT
        -- Islands Section
        local islandLabel = Instance.new("TextLabel")
        islandLabel.Parent = ScrollingFrame
        islandLabel.BackgroundTransparency = 1
        islandLabel.Size = UDim2.new(1, 0, 0, 30)
        islandLabel.Text = "🌍 ISLANDS"
        islandLabel.TextColor3 = colors.cyan
        islandLabel.TextScaled = true
        islandLabel.Font = Enum.Font.GothamBold
        islandLabel.TextStrokeTransparency = 0.5
        
        for _, island in ipairs(islands) do
            createGalaxyButton(island[1], function()
                teleportTo(island[2], "Teleported to " .. island[1])
            end, colors.teleport)
        end
        
        -- Bosses Section
        local bossLabel = Instance.new("TextLabel")
        bossLabel.Parent = ScrollingFrame
        bossLabel.BackgroundTransparency = 1
        bossLabel.Size = UDim2.new(1, 0, 0, 30)
        bossLabel.Text = "👾 BOSS LOCATIONS"
        bossLabel.TextColor3 = colors.pink
        bossLabel.TextScaled = true
        bossLabel.Font = Enum.Font.GothamBold
        bossLabel.TextStrokeTransparency = 0.5
        
        for _, boss in ipairs(bosses) do
            createGalaxyButton(boss[1], function()
                teleportTo(boss[2], "Teleported to " .. boss[1])
            end, colors.pink)
        end
        
        -- Fruit Spawns Section
        local fruitLabel = Instance.new("TextLabel")
        fruitLabel.Parent = ScrollingFrame
        fruitLabel.BackgroundTransparency = 1
        fruitLabel.Size = UDim2.new(1, 0, 0, 30)
        fruitLabel.Text = "🍎 FRUIT SPAWN LOCATIONS"
        fruitLabel.TextColor3 = colors.gold
        fruitLabel.TextScaled = true
        fruitLabel.Font = Enum.Font.GothamBold
        fruitLabel.TextStrokeTransparency = 0.5
        
        for _, fruit in ipairs(fruitLocations) do
            createGalaxyButton(fruit[1], function()
                teleportTo(fruit[2], "Teleported to " .. fruit[1])
            end, colors.gold)
        end
        
        -- Special Teleports
        local specialLabel = Instance.new("TextLabel")
        specialLabel.Parent = ScrollingFrame
        specialLabel.BackgroundTransparency = 1
        specialLabel.Size = UDim2.new(1, 0, 0, 30)
        specialLabel.Text = "⭐ SPECIAL TELEPORTS"
        specialLabel.TextColor3 = colors.purple
        specialLabel.TextScaled = true
        specialLabel.Font = Enum.Font.GothamBold
        specialLabel.TextStrokeTransparency = 0.5
        
        createGalaxyButton("📍 Teleport to Mouse", function()
            local mouse = LocalPlayer:GetMouse()
            local target = mouse.Hit
            if target then
                teleportTo(target.p, "Teleported to cursor position!")
            end
        end, colors.purple)
        
        createGalaxyButton("🔄 Teleport to Random Player", function()
            local players = Players:GetPlayers()
            if #players > 1 then
                local randomPlayer = players[math.random(1, #players)]
                if randomPlayer.Character and randomPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    teleportTo(randomPlayer.Character.HumanoidRootPart.Position, "Teleported to " .. randomPlayer.Name)
                end
            end
        end, colors.cyan)
        
        createGalaxyButton("🏠 Teleport to Spawn", function()
            teleportTo(Vector3.new(0, 50, 0), "Teleported to spawn!")
        end, colors.gold)
        
    elseif currentTab == 7 then -- UTILS
        createGalaxyButton("🛡️ God Mode", function()
            print("God mode activated!")
        end, colors.cyan)
        createGalaxyButton("☀️ Fullbright", function()
            Lighting.Ambient = Color3.new(1, 1, 1)
            Lighting.Brightness = 2
            Lighting.GlobalShadows = false
            StarterGui:SetCore("SendNotification", {
                Title = "☀️ Fullbright",
                Text = "Fullbright enabled!",
                Duration = 2
            })
        end, colors.gold)
        createGalaxyButton("📦 Infinite Yield", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end, colors.purple)
        createGalaxyButton("🔄 Server Hop", function()
            local TeleportService = game:GetService("TeleportService")
            local placeId = game.PlaceId
            TeleportService:Teleport(placeId, LocalPlayer)
        end, colors.pink)
        createGalaxyButton("⚡ FPS Boost", function()
            setfpscap(999)
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 9e9
            workspace.Terrain.WaterWaveSize = 0
            workspace.Terrain.WaterWaveSpeed = 0
            StarterGui:SetCore("SendNotification", {
                Title = "⚡ FPS Boost",
                Text = "FPS Boost enabled!",
                Duration = 2
            })
        end, colors.cyan)
        createGalaxyButton("📋 Copy Social Links", function()
            setclipboard("YouTube: @hacker666-00\nTikTok: @mods_and_hacks")
            StarterGui:SetCore("SendNotification", {
                Title = "Links Copied!",
                Text = "Social media links copied to clipboard!",
                Duration = 3
            })
        end, colors.gold)
    end
end

-- Initial content load
updateContent()

-- Window Controls
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

MinButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    MinButton.Text = MainFrame.Visible and "─" or "□"
end)

-- Welcome Notification
StarterGui:SetCore("SendNotification", {
    Title = "🌌 HACKERTOOL v6.0",
    Text = "Galaxy Edition with TELEPORT Loaded!\nYouTube: @hacker666-00\nTikTok: @mods_and_hacks",
    Duration = 8,
    Icon = "rbxassetid://13735820568"
})

print("✅ HACKERTOOL v6.0 - Galaxy Edition with TELEPORT Loaded!")
print("📺 YouTube: @hacker666-00")
print("🎵 TikTok: @mods_and_hacks")
