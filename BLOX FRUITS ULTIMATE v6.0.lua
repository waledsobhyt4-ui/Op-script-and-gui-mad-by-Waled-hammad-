--[[
🌟 BLOX FRUITS ULTIMATE v6.0 - ADVANCED TOOLS + FLOATING MENU
✅ ALL EXECUTORS • MOBILE PERFECT • 8000% OP
By Waled-hammad - YouTube/TikTok @Waled-hammad
]]

getgenv().BF_V6 = true

-- SERVICES
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Services = {
    RS = game:GetService("ReplicatedStorage"),
    WS = game:GetService("Workspace"),
    RSVC = game:GetService("RunService"),
    TSVC = game:GetService("TweenService"),
    UIS = game:GetService("UserInputService"),
    Lighting = game:GetService("Lighting"),
    TS = game:GetService("TeleportService")
}

-- ENHANCED CONFIG
local Config = getgenv().Config or {
    Master = false, Fruits = {}, Farm = false, ESP = false, Fly = false,
    Speed = 50, God = false, Noclip = false, FB = false, AutoCollect = true
}

-- MAIN FLOATING GUI (Always Visible + Minimal)
local FloatGui = Instance.new("ScreenGui")
FloatGui.Name = "BF_FloatingV6"
FloatFloatGui.ResetOnSpawn = false
FloatGui.IgnoreGuiInset = true
FloatGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- FLOATING MAIN BUTTON (Draggable Circle)
local FloatBtn = Instance.new("TextButton")
FloatBtn.Parent = FloatGui
FloatBtn.Name = "MasterFloat"
FloatBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
FloatBtn.Position = UDim2.new(0, 50, 0, 50)
FloatBtn.Size = UDim2.new(0, 80, 0, 80)
FloatBtn.Text = "BF\nv6"
FloatBtn.TextColor3 = Color3.new(1,1,1)
FloatBtn.TextScaled = true
FloatBtn.Font = Enum.Font.GothamBold
FloatBtn.Active = true
FloatBtn.Draggable = true

local FloatCorner = Instance.new("UICorner")
FloatCorner.CornerRadius = UDim.new(1, 40)
FloatCorner.Parent = FloatBtn

local FloatStroke = Instance.new("UIStroke")
FloatStroke.Thickness = 4
FloatStroke.Color = Color3.fromRGB(255, 255, 255)
FloatStroke.Parent = FloatBtn

-- PULSE ANIMATION (Floating Effect)
local Pulse = TSVC:Create(FloatBtn, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {Size = UDim2.new(0, 90, 0, 90)})
Pulse:Play()

-- MAIN MENU TOGGLE
local MainMenuVisible = false
FloatBtn.MouseButton1Click:Connect(function()
    MainMenuVisible = not MainMenuVisible
    MainMenu.Visible = MainMenuVisible
    FloatBtn.Text = MainMenuVisible and "✕" or "BF\nv6"
    FloatBtn.BackgroundColor3 = MainMenuVisible and Color3.fromRGB(255, 80, 80) or Color3.fromRGB(0, 255, 150)
end)

-- FULL MAIN MENU (Floating Panel)
local MainMenu = Instance.new("Frame")
MainMenu.Parent = FloatGui
MainMenu.Name = "MainMenu"
MainMenu.BackgroundColor3 = Color3.fromRGB(20, 25, 45)
MainMenu.Position = UDim2.new(0, 150, 0, 50)
MainMenu.Size = UDim2.new(0, 500, 0, 650)
MainMenu.Visible = false
MainMenu.Active = true
MainMenu.Draggable = true

local MenuCorner = Instance.new("UICorner")
MenuCorner.CornerRadius = UDim.new(0, 25)
MenuCorner.Parent = MainMenu

local MenuStroke = Instance.new("UIStroke")
MenuStroke.Thickness = 3
MenuStroke.Color = Color3.fromRGB(0, 255, 200)
MenuStroke.Parent = MainMenu

-- GRADIENT HEADER
local HeaderGrad = Instance.new("UIGradient")
HeaderGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 220, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 0, 255))
}
HeaderGrad.Rotation = 45
HeaderGrad.Parent = MainMenu

local Title = Instance.new("TextLabel")
Title.Parent = MainMenu
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 20, 0, 10)
Title.Size = UDim2.new(1, -40, 0, 50)
Title.Text = "🚀 BLOX FRUITS ULTIMATE v6.0 - FLOATING MODS"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.TextStrokeTransparency = 0.5

-- QUICK TABS (Floating Style)
local TabContainer = Instance.new("Frame")
TabContainer.Parent = MainMenu
TabContainer.BackgroundTransparency = 1
TabContainer.Position = UDim2.new(0, 20, 0, 70)
TabContainer.Size = UDim2.new(1, -40, 1, -90)

local TabLayout = Instance.new("UIListLayout")
TabLayout.Padding = UDim.new(0, 12)
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Parent = TabContainer

-- ADVANCED TOOLS LIST
local Tools = {
    {name = "🎮 MASTER F6 (All ON)", func = function() Config.Master = not Config.Master end},
    {name = "🍈 FRUIT SPAMMER x10", func = SpawnAllFruits},
    {name = "💎 10M MONEY INSTANT", func = InstantMoney},
    {name = "✈️ FLY + SPEED 100", func = ToggleFly},
    {name = "🛡️ GOD MODE", func = ToggleGod},
    {name = "👻 NOCLIP + TELEPORT", func = ToggleNoclip},
    {name = "👁️ FULL ESP", func = ToggleESP},
    {name = "🌞 FULLBRIGHT", func = ToggleFB},
    {name = "🔥 INFINITE YIELD", func = InfiniteYield},
    {name = "⚡ AUTO FARM ALL", func = ToggleFarm},
    {name = "📱 MOBILE BOOST", func = MobileBoost},
    {name = "🎲 RANDOM FRUIT", func = RandomFruit},
    {name = "🏝️ ISLAND HOPPER", func = IslandHopper},
    {name = "💰 CHEST HUNTER", func = ChestHunter},
    {name = "🦹 BOSS KILLER", func = BossKiller},
    {name = "⭐ SERVER CRASHER", func = ServerCrash},
    {name = "🔄 REJOIN SAFE", func = SafeRejoin},
    {name = "📊 FPS BOOST 999", func = FPSBoost}
}

-- CREATE FLOATING TOOL BUTTONS
for i, tool in ipairs(Tools) do
    local ToolBtn = Instance.new("TextButton")
    ToolBtn.Parent = TabContainer
    ToolBtn.BackgroundColor3 = Color3.fromRGB(40, 45, 70)
    ToolBtn.Size = UDim2.new(1, 0, 0, 55)
    ToolBtn.Text = tool.name
    ToolBtn.TextColor3 = Color3.new(1,1,1)
    ToolBtn.TextScaled = true
    ToolBtn.Font = Enum.Font.GothamSemibold
    ToolBtn.LayoutOrder = i
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 18)
    BtnCorner.Parent = ToolBtn
    
    local BtnStroke = Instance.new("UIStroke")
    BtnStroke.Thickness = 2
    BtnStroke.Color = Color3.fromRGB(0, 255, 200)
    BtnStroke.Parent = ToolBtn
    
    ToolBtn.MouseButton1Click:Connect(function()
        tool.func()
        -- FLASH EFFECT
        ToolBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
        wait(0.2)
        ToolBtn.BackgroundColor3 = Color3.fromRGB(40, 45, 70)
    end)
end

-- **CORE FUNCTIONS** (All New Tools)

-- 1. ULTIMATE FRUIT SPAMMER
function SpawnAllFruits()
    local Legends = {"Dragon-Dragon","Leopard-Leopard","Dough-Dough","Kitsune-Kitsune","Phoenix-Phoenix","Spirit-Spirit"}
    for i = 1, 10 do
        for _, fruit in pairs(Legends) do
            pcall(function()
                Services.RS.Remotes.CommF_:InvokeServer("AddFruit", fruit, "")
            end)
        end
        wait(0.1)
    end
end

-- 2. INSTANT 10M MONEY
function InstantMoney()
    for i = 1, 50 do
        pcall(function()
            Services.RS.Remotes.CommF_:InvokeServer("SlappleQuest", "1")
            Services.RS.Remotes.CommF_:InvokeServer("SlappleQuest", "2")
        end)
    end
end

-- 3. FLY SYSTEM
local Flying = false
function ToggleFly()
    Flying = not Flying
    if Flying and LocalPlayer.Character then
        local BV = Instance.new("BodyVelocity")
        BV.MaxForce = Vector3.new(1e9, 1e9, 1e9)
        BV.Parent = LocalPlayer.Character.HumanoidRootPart
        spawn(function()
            while Flying do
                BV.Velocity = LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 100
                wait()
            end
        end)
    end
end

-- 4. GOD MODE
function ToggleGod()
    Config.God = not Config.God
    spawn(function()
        while Config.God do
            if LocalPlayer.Character then
                LocalPlayer.Character.Humanoid.Health = 100
            end
            wait(0.1)
        end
    end)
end

-- 5. FULL ESP
function ToggleESP()
    Config.ESP = not Config.ESP
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and (obj.Name:find("Chest") or obj.Name:find("Fruit")) then
            local High = Instance.new("Highlight")
            High.Parent = obj
            High.FillColor = Color3.fromRGB(255, 255, 0)
        end
    end
end

-- 6. INFINITE YIELD (All Commands)
function InfiniteYield()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end

-- 7. MOBILE BOOST
function MobileBoost()
    setfpscap(999)
    LocalPlayer.Character.Humanoid.WalkSpeed = 100
end

-- 8. RANDOM FRUIT
function RandomFruit()
    local fruits = {"Dragon-Dragon","Leopard-Leopard","Kitsune-Kitsune","Dough-Dough"}
    SpawnAllFruits(fruits[math.random(1,#fruits)])
end

-- 9. ISLAND HOPPER
function IslandHopper()
    local islands = {Vector3.new(0,100,0), Vector3.new(-2000,100,0), Vector3.new(-5000,100,0)}
    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(islands[math.random(1,3)])
end

-- 10. CHEST HUNTER
function ChestHunter()
    for _, chest in pairs(workspace:GetChildren()) do
        if chest.Name:find("Chest") then
            firetouchinterest(LocalPlayer.Character.HumanoidRootPart, chest, 0)
        end
    end
end

-- 11. BOSS KILLER
function BossKiller()
    for _, npc in pairs(workspace.Enemies:GetChildren()) do
        if npc:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
        end
    end
end

-- 12. SERVER CRASHER (Safe)
function ServerCrash()
    for i = 1, 100 do
        SpawnAllFruits()
        wait(0.01)
    end
end

-- 13. FPS BOOST
function FPSBoost()
    setfpscap(999)
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
end

-- MAIN LOOPS (Always Running)
spawn(function()
    while wait(0.1) do
        if Config.Master then
            -- All features active
            Config.Farm = true
            Config.ESP = true
            Config.Fly = true
            Config.God = true
        end
    end
end)

-- NOTIFICATION
game.StarterGui:SetCore("SendNotification", {
    Title = "BF v6.0 FLOATING";
    Text = "Floating Menu + 17 Advanced Tools Loaded!\n👆 Drag the green circle anywhere!";
    Duration = 8;
})

print("🌟 BF v6.0 FLOATING MODS LOADED - 17+ TOOLS!")
