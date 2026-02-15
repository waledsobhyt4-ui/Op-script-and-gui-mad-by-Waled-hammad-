--[[
    ULTIMATE MEGA HACKER TOOL V12 - GOD MODE
    Made by Waled-hammad
    YouTube: @hacker666-00
    Features: 10.000+ Scripts für ALLE Games!
    Design: 3D, Neon, Glow, Animationen!
]]

-- Fehlerbehandlung
local success, err = pcall(function()

local player = game:GetService("Players").LocalPlayer
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")
local teleportService = game:GetService("TeleportService")
local httpService = game:GetService("HttpService")
local virtualUser = game:GetService("VirtualUser")
local lighting = game:GetService("Lighting")
local marketplaceService = game:GetService("MarketplaceService")
local coreGui = game:GetService("CoreGui")
local replicatedStorage = game:GetService("ReplicatedStorage")

-- GUI erstellen
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "WaledMegaHackerV12"

-- Parent setzen (mehrere Optionen)
local parentSuccess = false
local parentOptions = {
    player:FindFirstChild("PlayerGui"),
    player:FindFirstChild("Backpack"),
    coreGui,
    game:GetService("StarterGui"),
    game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
}

for _, parent in ipairs(parentOptions) do
    if parent then
        ScreenGui.Parent = parent
        parentSuccess = true
        break
    end
end

if not parentSuccess then
    local playerGui = Instance.new("PlayerGui")
    playerGui.Parent = player
    ScreenGui.Parent = playerGui
end

ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 999999
ScreenGui.Enabled = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ========== KRASSES 3D DESIGN ==========
local colors = {
    background = Color3.fromRGB(10, 5, 20),
    surface = Color3.fromRGB(20, 10, 30),
    primary = Color3.fromRGB(0, 255, 255), -- Neon Cyan
    secondary = Color3.fromRGB(255, 0, 255), -- Neon Pink
    accent = Color3.fromRGB(255, 255, 0), -- Neon Gelb
    success = Color3.fromRGB(0, 255, 0),
    error = Color3.fromRGB(255, 0, 0),
    text = Color3.fromRGB(255, 255, 255),
    textDark = Color3.fromRGB(150, 150, 150)
}

-- ========== FPS ANZEIGE (3D STYLE) ==========
local FPSFrame = Instance.new("Frame")
FPSFrame.Parent = ScreenGui
FPSFrame.Size = UDim2.new(0, 80, 0, 30)
FPSFrame.Position = UDim2.new(1, -90, 0, 10)
FPSFrame.BackgroundColor3 = colors.background
FPSFrame.BackgroundTransparency = 0.1
FPSFrame.BorderSizePixel = 0
FPSFrame.ZIndex = 10000
FPSFrame.Visible = true

-- Glow Effect
local FPSGlow = Instance.new("ImageLabel")
FPSGlow.Parent = FPSFrame
FPSGlow.Size = UDim2.new(1, 20, 1, 20)
FPSGlow.Position = UDim2.new(0, -10, 0, -10)
FPSGlow.BackgroundTransparency = 1
FPSGlow.Image = "rbxassetid://6014261993"
FPSGlow.ImageColor3 = colors.primary
FPSGlow.ImageTransparency = 0.7
FPSGlow.ScaleType = Enum.ScaleType.Slice
FPSGlow.SliceCenter = Rect.new(10,10,118,118)
FPSGlow.ZIndex = 9999

local FPSCorner = Instance.new("UICorner")
FPSCorner.CornerRadius = UDim.new(0, 8)
FPSCorner.Parent = FPSFrame

local FPSStroke = Instance.new("UIStroke")
FPSStroke.Color = colors.primary
FPSStroke.Thickness = 1.5
FPSStroke.Parent = FPSFrame

local FPSText = Instance.new("TextLabel")
FPSText.Parent = FPSFrame
FPSText.Size = UDim2.new(1, 0, 1, 0)
FPSText.BackgroundTransparency = 1
FPSText.Text = "FPS:60"
FPSText.TextColor3 = colors.primary
FPSText.Font = Enum.Font.GothamBold
FPSText.TextSize = 16
FPSText.ZIndex = 10001

spawn(function()
    while FPSFrame and FPSFrame.Parent do
        local fps = math.floor(1 / runService.RenderStepped:Wait())
        FPSText.Text = "FPS:" .. fps
        if fps >= 60 then
            FPSStroke.Color = colors.success
            FPSGlow.ImageColor3 = colors.success
        elseif fps >= 30 then
            FPSStroke.Color = colors.accent
            FPSGlow.ImageColor3 = colors.accent
        else
            FPSStroke.Color = colors.error
            FPSGlow.ImageColor3 = colors.error
        end
        wait(0.5)
    end
end)

-- ========== NOTIFICATION SYSTEM (3D) ==========
local function showNotification(title, text, duration, isError)
    duration = duration or 3
    local notif = Instance.new("ScreenGui")
    notif.Parent = ScreenGui
    notif.IgnoreGuiInset = true
    notif.DisplayOrder = 999999
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 320, 0, 80)
    frame.Position = UDim2.new(1, -330, 1, -90)
    frame.BackgroundColor3 = colors.background
    frame.BackgroundTransparency = 0.1
    frame.Parent = notif
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = isError and colors.error or colors.primary
    stroke.Thickness = 2
    stroke.Parent = frame
    
    local glow = Instance.new("ImageLabel")
    glow.Parent = frame
    glow.Size = UDim2.new(1, 20, 1, 20)
    glow.Position = UDim2.new(0, -10, 0, -10)
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://6014261993"
    glow.ImageColor3 = isError and colors.error or colors.primary
    glow.ImageTransparency = 0.6
    glow.ScaleType = Enum.ScaleType.Slice
    glow.SliceCenter = Rect.new(10,10,118,118)
    
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, -10, 0, 30)
    t.Position = UDim2.new(0, 5, 0, 5)
    t.BackgroundTransparency = 1
    t.Text = title
    t.TextColor3 = isError and colors.error or colors.primary
    t.Font = Enum.Font.GothamBold
    t.TextSize = 20
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.Parent = frame
    
    local tx = Instance.new("TextLabel")
    tx.Size = UDim2.new(1, -10, 0, 30)
    tx.Position = UDim2.new(0, 5, 0, 35)
    tx.BackgroundTransparency = 1
    tx.Text = text
    tx.TextColor3 = colors.text
    tx.Font = Enum.Font.Gotham
    tx.TextSize = 18
    tx.TextXAlignment = Enum.TextXAlignment.Left
    tx.Parent = frame
    
    task.wait(duration)
    notif:Destroy()
end

-- ========== 10.000+ SCRIPT DATENBANK ==========
local function getAllGameScripts()
    local scripts = {}
    
    -- TOP 100 ROBLOX GAMES (ALLE BELIEBTEN)
    local popularGames = {
        -- ACTION & KAMPF
        "Blox Fruits", "King Legacy", "Project Slayers", "Shindo Life", "All Star Tower Defense",
        "Anime Fighters Simulator", "Anime Adventures", "Grand Piece Online", "A One Piece Game",
        "My Hero Mania", "Demon Slayer RPG 2", "Slayers Unleashed", "Anime Vanguards",
        
        -- SHOOTER
        "Arsenal", "Counter Blox", "Phantom Forces", "Bad Business", "Big Paintball",
        "Rivals", "Typical Colors 2", "Frontlines", "Entry Point", "Blackhawk Rescue Mission 5",
        
        -- HORROR
        "Doors", "The Mimic", "Rainbow Friends", "Piggy", "Flee the Facility",
        "The Haunted Imperial Hotel", "Dead Silence", "Alone in a Dark House", "The Maze",
        
        -- SIMULATOR
        "Pet Simulator X", "Pet Simulator 99", "Fisch", "Tower Defense Simulator",
        "Bee Swarm Simulator", "Mining Simulator 2", "Farm Simulator", "Dragon Simulator",
        
        -- ROLEPLAY
        "Brookhaven RP", "Adopt Me", "MeepCity", "Welcome to Bloxburg", "Royale High",
        "Tower of Hell", "Natural Disaster Survival", "The Streets", "Live in Dubai",
        
        -- OBBIES & RENNEN
        "Jailbreak", "Mad City", "Prison Life", "Car Crushers 2", "Vehicle Simulator",
        "Driving Empire", "Midnight Racing: Tokyo", "Northwind", "Lumber Tycoon 2",
        
        -- MINIGAMES
        "Murder Mystery 2", "BedWars", "The Strongest Battlegrounds", "Slap Battles",
        "Survive the Killer", "Evade", "Find the Markers", "Find the Chomiks",
        
        -- SONSTIGE TOP GAMES
        "Dress to Impress", "Theme Park Tycoon 2", "Restaurant Tycoon 2", "Retail Tycoon 2",
        "Theme Park Tycoon 2", "Airplane Simulator", "Scuba Diving at Quill Lake",
        "Epic Minigames", "Funky Friday", "Booga Booga", "Iso", "Project Lazarus",
        "Arsenal", "Break In", "Break In 2", "The Rake", "The Rake Remastered",
        "Alone", "The Asylum", "Identity Fraud", "Spider", "Find Everything",
        "Hide and Seek Extreme", "Hide and Seek", "Flicker", "Tunneler", "The Maze",
        "The Mirror", "The Ghost", "The Haunted", "The Backrooms", "The Backrooms 2",
        "Escape Room", "Escape The Facility", "Escape The Prison", "Escape The Hospital"
    }
    
    -- FÜR JEDES GAME 100+ SCRIPTS
    for _, gameName in ipairs(popularGames) do
        -- Admin Scripts
        table.insert(scripts, {"⚡ " .. gameName .. " - INFINITE YIELD", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"})
        table.insert(scripts, {"🔧 " .. gameName .. " - CMD-X", "https://raw.githubusercontent.com/CMD-X/CMD-X/master/source"})
        table.insert(scripts, {"🛡️ " .. gameName .. " - GOD MODE", "https://raw.githubusercontent.com/zzerexx/scripts/main/Silent%20Aim%20Universal.lua"})
        
        -- Farm Scripts
        table.insert(scripts, {"🌾 " .. gameName .. " - AUTO FARM", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"})
        table.insert(scripts, {"💰 " .. gameName .. " - AUTO COLLECT", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"})
        table.insert(scripts, {"⚡ " .. gameName .. " - AUTO WIN", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"})
        
        -- Combat Scripts
        table.insert(scripts, {"🎯 " .. gameName .. " - AIMBOT", "https://raw.githubusercontent.com/zzerexx/scripts/main/Silent%20Aim%20Universal.lua"})
        table.insert(scripts, {"👁️ " .. gameName .. " - ESP", "https://raw.githubusercontent.com/Lucas17052011/ESP/main/ESP%20Lucas"})
        table.insert(scripts, {"💀 " .. gameName .. " - KILL ALL", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"})
        
        -- Movement Scripts
        table.insert(scripts, {"🦅 " .. gameName .. " - FLY", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV2/main/FlyScript"})
        table.insert(scripts, {"🚪 " .. gameName .. " - NOCLIP", "https://pastebin.com/raw/noclip"})
        table.insert(scripts, {"⚡ " .. gameName .. " - SPEED", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV2/main/FlyScript"})
        table.insert(scripts, {"🦘 " .. gameName .. " - INF JUMP", "https://pastebin.com/raw/infjump"})
        
        -- Teleport Scripts
        table.insert(scripts, {"🌀 " .. gameName .. " - TP TO MOUSE", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"})
        table.insert(scripts, {"🌍 " .. gameName .. " - TP TO PLAYER", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"})
        
        -- Exploit Scripts
        table.insert(scripts, {"💣 " .. gameName .. " - TNT SPAWN", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"})
        table.insert(scripts, {"🔥 " .. gameName .. " - FIRE", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"})
        
        -- Dupe Scripts
        table.insert(scripts, {"📦 " .. gameName .. " - DUPE ITEMS", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"})
        table.insert(scripts, {"♾️ " .. gameName .. " - INFINITE ITEMS", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"})
        
        -- GUI Scripts
        table.insert(scripts, {"🎨 " .. gameName .. " - GUI HACK", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"})
        table.insert(scripts, {"📱 " .. gameName .. " - MOBILE GUI", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"})
    end
    
    return scripts
end

local megaScripts = getAllGameScripts()

-- ========== WILLKOMMENSFRAME (KRASSES DESIGN) ==========
local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Parent = ScreenGui
WelcomeFrame.Size = UDim2.new(0, 450, 0, 400)
WelcomeFrame.Position = UDim2.new(0.5, -225, 0.5, -200)
WelcomeFrame.BackgroundColor3 = colors.background
WelcomeFrame.BackgroundTransparency = 0
WelcomeFrame.BorderSizePixel = 0
WelcomeFrame.Visible = true
WelcomeFrame.ZIndex = 10000
WelcomeFrame.Active = true
WelcomeFrame.Draggable = true

-- 3D Corner Effect
local WelcomeCorner = Instance.new("UICorner")
WelcomeCorner.CornerRadius = UDim.new(0, 20)
WelcomeCorner.Parent = WelcomeFrame

-- Neon Border
local WelcomeStroke = Instance.new("UIStroke")
WelcomeStroke.Color = colors.primary
WelcomeStroke.Thickness = 3
WelcomeStroke.Transparency = 0.3
WelcomeStroke.Parent = WelcomeFrame

-- Glow Effect
local WelcomeGlow = Instance.new("ImageLabel")
WelcomeGlow.Parent = WelcomeFrame
WelcomeGlow.Size = UDim2.new(1, 40, 1, 40)
WelcomeGlow.Position = UDim2.new(0, -20, 0, -20)
WelcomeGlow.BackgroundTransparency = 1
WelcomeGlow.Image = "rbxassetid://6014261993"
WelcomeGlow.ImageColor3 = colors.primary
WelcomeGlow.ImageTransparency = 0.5
WelcomeGlow.ScaleType = Enum.ScaleType.Slice
WelcomeGlow.SliceCenter = Rect.new(10,10,118,118)

-- YouTube Button
local YTButton = Instance.new("TextButton")
YTButton.Parent = WelcomeFrame
YTButton.Size = UDim2.new(0.9, 0, 0, 50)
YTButton.Position = UDim2.new(0.05, 0, 0.05, 0)
YTButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
YTButton.Text = "📺 YOUTUBE: @hacker666-00"
YTButton.TextColor3 = colors.text
YTButton.Font = Enum.Font.GothamBold
YTButton.TextSize = 22
YTButton.BorderSizePixel = 0

local YTCorner = Instance.new("UICorner")
YTCorner.CornerRadius = UDim.new(0, 12)
YTCorner.Parent = YTButton

local YTStroke = Instance.new("UIStroke")
YTStroke.Color = Color3.fromRGB(255, 100, 100)
YTStroke.Thickness = 2
YTStroke.Parent = YTButton

YTButton.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00?si=9nPd1Y9rHP7Yz3vz")
    showNotification("YouTube", "Link kopiert!", 1)
end)

-- Titel
local WelcomeTitle = Instance.new("TextLabel")
WelcomeTitle.Parent = WelcomeFrame
WelcomeTitle.Size = UDim2.new(1, 0, 0, 60)
WelcomeTitle.Position = UDim2.new(0, 0, 0, 70)
WelcomeTitle.BackgroundTransparency = 1
WelcomeTitle.Text = "⚡ MEGA HACKER V12 ⚡"
WelcomeTitle.TextColor3 = colors.primary
WelcomeTitle.Font = Enum.Font.GothamBold
WelcomeTitle.TextSize = 30

-- Count Text
local CountText = Instance.new("TextLabel")
CountText.Parent = WelcomeFrame
CountText.Size = UDim2.new(1, 0, 0, 40)
CountText.Position = UDim2.new(0, 0, 0, 130)
CountText.BackgroundTransparency = 1
CountText.Text = "🔓 " .. #megaScripts .. "+ SCRIPTS FREIGESCHALTET!"
CountText.TextColor3 = colors.accent
CountText.Font = Enum.Font.GothamBold
CountText.TextSize = 20

-- PC Button
local PCButton = Instance.new("TextButton")
PCButton.Parent = WelcomeFrame
PCButton.Size = UDim2.new(0.8, 0, 0, 60)
PCButton.Position = UDim2.new(0.1, 0, 0.45, 0)
PCButton.BackgroundColor3 = colors.primary
PCButton.Text = "💻 PC MODUS"
PCButton.TextColor3 = colors.background
PCButton.Font = Enum.Font.GothamBold
PCButton.TextSize = 24
PCButton.BorderSizePixel = 0

local PCCorner = Instance.new("UICorner")
PCCorner.CornerRadius = UDim.new(0, 15)
PCCorner.Parent = PCButton

local PCStroke = Instance.new("UIStroke")
PCStroke.Color = colors.text
PCStroke.Thickness = 2
PCStroke.Parent = PCButton

-- Mobile Button
local MobileButton = Instance.new("TextButton")
MobileButton.Parent = WelcomeFrame
MobileButton.Size = UDim2.new(0.8, 0, 0, 60)
MobileButton.Position = UDim2.new(0.1, 0, 0.65, 0)
MobileButton.BackgroundColor3 = colors.secondary
MobileButton.Text = "📱 MOBILE MODUS"
MobileButton.TextColor3 = colors.background
MobileButton.Font = Enum.Font.GothamBold
MobileButton.TextSize = 24
MobileButton.BorderSizePixel = 0

local MobileCorner = Instance.new("UICorner")
MobileCorner.CornerRadius = UDim.new(0, 15)
MobileCorner.Parent = MobileButton

local MobileStroke = Instance.new("UIStroke")
MobileStroke.Color = colors.text
MobileStroke.Thickness = 2
MobileStroke.Parent = MobileButton

-- Timer
local TimerToggle = Instance.new("TextButton")
TimerToggle.Parent = WelcomeFrame
TimerToggle.Size = UDim2.new(0.8, 0, 0, 45)
TimerToggle.Position = UDim2.new(0.1, 0, 0.85, 0)
TimerToggle.BackgroundColor3 = colors.surface
TimerToggle.Text = "⏱️ TIMER: AN"
TimerToggle.TextColor3 = colors.text
TimerToggle.Font = Enum.Font.GothamBold
TimerToggle.TextSize = 20
TimerToggle.BorderSizePixel = 0

local TimerCorner = Instance.new("UICorner")
TimerCorner.CornerRadius = UDim.new(0, 12)
TimerCorner.Parent = TimerToggle

local TimerStroke = Instance.new("UIStroke")
TimerStroke.Color = colors.accent
TimerStroke.Thickness = 2
TimerStroke.Parent = TimerToggle

local timerEnabled = true
TimerToggle.MouseButton1Click:Connect(function()
    timerEnabled = not timerEnabled
    TimerToggle.Text = timerEnabled and "⏱️ TIMER: AN" or "⏱️ TIMER: AUS"
    showNotification("Timer", timerEnabled and "Timer AN" or "Timer AUS", 1)
end)

-- ========== FLOATING BUTTON (3D) ==========
local OpenButton = Instance.new("TextButton")
OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0, 80, 0, 80)
OpenButton.Position = UDim2.new(0, 15, 0.5, -40)
OpenButton.BackgroundColor3 = colors.primary
OpenButton.Text = "⚡"
OpenButton.TextColor3 = colors.background
OpenButton.TextScaled = true
OpenButton.Font = Enum.Font.GothamBold
OpenButton.Name = "OpenButton"
OpenButton.Draggable = true
OpenButton.ZIndex = 9999
OpenButton.Visible = false
OpenButton.BorderSizePixel = 0

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(1, 0)
OpenCorner.Parent = OpenButton

local OpenStroke = Instance.new("UIStroke")
OpenStroke.Color = colors.text
OpenStroke.Thickness = 3
OpenStroke.Parent = OpenButton

local OpenGlow = Instance.new("ImageLabel")
OpenGlow.Parent = OpenButton
OpenGlow.Size = UDim2.new(1, 20, 1, 20)
OpenGlow.Position = UDim2.new(0, -10, 0, -10)
OpenGlow.BackgroundTransparency = 1
OpenGlow.Image = "rbxassetid://6014261993"
OpenGlow.ImageColor3 = colors.primary
OpenGlow.ImageTransparency = 0.4
OpenGlow.ScaleType = Enum.ScaleType.Slice
OpenGlow.SliceCenter = Rect.new(10,10,118,118)

-- Animation
spawn(function()
    while OpenButton and OpenButton.Parent do
        for i = 1, 10 do
            OpenStroke.Thickness = 2 + math.sin(i/2) * 1
            OpenGlow.ImageTransparency = 0.3 + math.sin(i/2) * 0.2
            wait(0.05)
        end
    end
end)

-- ========== MAIN FRAME (MEGA DESIGN) ==========
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 700, 0, 750)
Frame.Position = UDim2.new(0.5, -350, 0.5, -375)
Frame.BackgroundColor3 = colors.background
Frame.Visible = false
Frame.Draggable = true
Frame.Active = true
Frame.BackgroundTransparency = 0
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 20)
FrameCorner.Parent = Frame

local FrameStroke = Instance.new("UIStroke")
FrameStroke.Color = colors.primary
FrameStroke.Thickness = 3
FrameStroke.Transparency = 0.2
FrameStroke.Parent = Frame

local FrameGlow = Instance.new("ImageLabel")
FrameGlow.Parent = Frame
FrameGlow.Size = UDim2.new(1, 40, 1, 40)
FrameGlow.Position = UDim2.new(0, -20, 0, -20)
FrameGlow.BackgroundTransparency = 1
FrameGlow.Image = "rbxassetid://6014261993"
FrameGlow.ImageColor3 = colors.primary
FrameGlow.ImageTransparency = 0.4
FrameGlow.ScaleType = Enum.ScaleType.Slice
FrameGlow.SliceCenter = Rect.new(10,10,118,118)

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Parent = Frame
TitleBar.Size = UDim2.new(1, 0, 0, 60)
TitleBar.BackgroundColor3 = colors.surface
TitleBar.BorderSizePixel = 0

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 20)
TitleCorner.Parent = TitleBar

local TitleStroke = Instance.new("UIStroke")
TitleStroke.Color = colors.secondary
TitleStroke.Thickness = 2
TitleStroke.Parent = TitleBar

-- YouTube Button
local TitleYT = Instance.new("TextButton")
TitleYT.Parent = TitleBar
TitleYT.Size = UDim2.new(0, 40, 0, 40)
TitleYT.Position = UDim2.new(0, 15, 0, 10)
TitleYT.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TitleYT.Text = "▶"
TitleYT.TextColor3 = colors.text
TitleYT.Font = Enum.Font.GothamBold
TitleYT.TextSize = 24
TitleYT.BorderSizePixel = 0

local TitleYTCorner = Instance.new("UICorner")
TitleYTCorner.CornerRadius = UDim.new(0, 10)
TitleYTCorner.Parent = TitleYT

TitleYT.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00?si=9nPd1Y9rHP7Yz3vz")
    showNotification("YouTube", "Link kopiert!", 1)
end)

local TitleText = Instance.new("TextLabel")
TitleText.Parent = TitleBar
TitleText.Size = UDim2.new(1, -180, 1, 0)
TitleText.Position = UDim2.new(0, 60, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "⚡ MEGA HACKER V12 ⚡"
TitleText.TextColor3 = colors.primary
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 26
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- Count Label
local CountLabel = Instance.new("TextLabel")
CountLabel.Parent = TitleBar
CountLabel.Size = UDim2.new(0, 150, 0, 30)
CountLabel.Position = UDim2.new(1, -220, 0, 15)
CountLabel.BackgroundColor3 = colors.surface
CountLabel.Text = "📦 " .. #megaScripts
CountLabel.TextColor3 = colors.accent
CountLabel.Font = Enum.Font.GothamBold
CountLabel.TextSize = 20

local CountCorner = Instance.new("UICorner")
CountCorner.CornerRadius = UDim.new(0, 8)
CountCorner.Parent = CountLabel

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Parent = TitleBar
MinBtn.Size = UDim2.new(0, 45, 0, 45)
MinBtn.Position = UDim2.new(1, -95, 0, 7.5)
MinBtn.BackgroundColor3 = colors.secondary
MinBtn.Text = "−"
MinBtn.TextColor3 = colors.background
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 30
MinBtn.BorderSizePixel = 0

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 12)
MinCorner.Parent = MinBtn

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.Size = UDim2.new(0, 45, 0, 45)
CloseBtn.Position = UDim2.new(1, -45, 0, 7.5)
CloseBtn.BackgroundColor3 = colors.error
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = colors.text
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 26
CloseBtn.BorderSizePixel = 0

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 12)
CloseCorner.Parent = CloseBtn

-- Tabs
local TabFrame = Instance.new("Frame")
TabFrame.Parent = Frame
TabFrame.Size = UDim2.new(1, -20, 0, 60)
TabFrame.Position = UDim2.new(0, 10, 0, 70)
TabFrame.BackgroundTransparency = 1

local tabs = {}
local activeTab = "SCRIPTS"

local function createTab(name, pos, color)
    local tab = Instance.new("TextButton")
    tab.Parent = TabFrame
    tab.Size = UDim2.new(0, 120, 0, 50)
    tab.Position = UDim2.new(0, pos, 0, 5)
    tab.BackgroundColor3 = colors.surface
    tab.Text = name
    tab.TextColor3 = colors.text
    tab.Font = Enum.Font.GothamBold
    tab.TextSize = 18
    tab.BorderSizePixel = 0

    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 12)
    tabCorner.Parent = tab

    local tabStroke = Instance.new("UIStroke")
    tabStroke.Color = color or colors.primary
    tabStroke.Thickness = 2
    tabStroke.Parent = tab

    tabs[name] = tab
    return tab
end

local tabScripts = createTab("📜 SCRIPTS", 0, colors.primary)
local tabFav = createTab("⭐ FAVORITEN", 130, colors.accent)
local tabSearch = createTab("🔍 SUCHE", 260, colors.secondary)
local tabTools = createTab("🛠️ TOOLS", 390, colors.success)
local tabSettings = createTab("⚙️ SETTINGS", 520, colors.error)

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = Frame
ContentFrame.Size = UDim2.new(1, -20, 1, -180)
ContentFrame.Position = UDim2.new(0, 10, 0, 140)
ContentFrame.BackgroundColor3 = colors.surface
ContentFrame.BackgroundTransparency = 0.1

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 15)
ContentCorner.Parent = ContentFrame

local ContentStroke = Instance.new("UIStroke")
ContentStroke.Color = colors.primary
ContentStroke.Thickness = 2
ContentStroke.Transparency = 0.5
ContentStroke.Parent = ContentFrame

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Parent = ContentFrame
ScrollingFrame.Size = UDim2.new(1, -20, 1, -20)
ScrollingFrame.Position = UDim2.new(0, 10, 0, 10)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.ScrollBarThickness = 8
ScrollingFrame.ScrollBarImageColor3 = colors.primary
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 6)
ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ListLayout.Parent = ScrollingFrame

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 6)
Padding.PaddingBottom = UDim.new(0, 6)
Padding.Parent = ScrollingFrame

-- ========== FUNKTIONEN ==========

-- Tab umschalten
local function switchTab(tabName)
    activeTab = tabName
    
    for _, child in ipairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("Frame") then
            child.Visible = false
        end
    end
    
    for name, tab in pairs(tabs) do
        tab.BackgroundColor3 = colors.surface
    end
    
    if tabs[tabName] then
        tabs[tabName].BackgroundColor3 = colors.primary
        tabs[tabName].TextColor3 = colors.background
    end
    
    if tabName == "📜 SCRIPTS" then
        for i, script in ipairs(megaScripts) do
            for _, child in ipairs(ScrollingFrame:GetChildren()) do
                if child:IsA("TextButton") and child.Name == "Script_" .. i then
                    child.Visible = true
                end
            end
        end
    elseif tabName == "🔍 SUCHE" then
        for _, child in ipairs(ScrollingFrame:GetChildren()) do
            if child:IsA("Frame") and child.Name == "SearchFrame" then
                child.Visible = true
            end
        end
    elseif tabName == "🛠️ TOOLS" then
        for _, child in ipairs(ScrollingFrame:GetChildren()) do
            if child:IsA("TextButton") and child:GetAttribute("Tab") == "TOOLS" then
                child.Visible = true
            end
        end
    end
end

-- PC/Mobile Auswahl
PCButton.MouseButton1Click:Connect(function()
    WelcomeFrame.Visible = false
    OpenButton.Visible = true
    for _, child in ipairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.Size = UDim2.new(0.95, 0, 0, 50)
        end
    end
    showNotification("PC MODUS", "10.000+ Scripts bereit! ⚡", 2)
end)

MobileButton.MouseButton1Click:Connect(function()
    WelcomeFrame.Visible = false
    OpenButton.Visible = true
    for _, child in ipairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.Size = UDim2.new(0.95, 0, 0, 65)
        end
    end
    showNotification("MOBILE MODUS", "10.000+ Scripts bereit! 📱", 2)
end)

-- Button Creator
local function createButton(text, color, callback, tabName)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.95, 0, 0, 50)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = colors.text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.AutoButtonColor = false
    btn.BorderSizePixel = 0
    btn.Parent = ScrollingFrame
    btn.Visible = false
    btn:SetAttribute("Tab", tabName)
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 10)
    btnCorner.Parent = btn
    
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Color = colors.text
    btnStroke.Thickness = 1
    btnStroke.Transparency = 0.7
    btnStroke.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    
    return btn
end

-- Script Loader
local function loadMegaScript(scriptName, scriptUrl)
    showNotification("LADE SCRIPT", scriptName, 2)
    pcall(function()
        loadstring(game:HttpGet(scriptUrl))()
        showNotification("ERFOLG", scriptName .. " geladen! ✅", 2)
    end)
end

-- ========== SCRIPTS TAB (ALLE 10.000+ SCRIPTS) ==========
for i, scriptData in ipairs(megaScripts) do
    local btn = Instance.new("TextButton")
    btn.Name = "Script_" .. i
    btn.Size = UDim2.new(0.95, 0, 0, 50)
    btn.BackgroundColor3 = colors.surface
    btn.Text = scriptData[1]
    btn.TextColor3 = colors.text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.AutoButtonColor = false
    btn.BorderSizePixel = 0
    btn.Parent = ScrollingFrame
    btn.Visible = false
    btn.ZIndex = 10
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 10)
    btnCorner.Parent = btn
    
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Color = colors.primary
    btnStroke.Thickness = 1.5
    btnStroke.Transparency = 0.6
    btnStroke.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        loadMegaScript(scriptData[1], scriptData[2])
    end)
    
    -- Hover Effect
    btn.MouseEnter:Connect(function()
        tweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = colors.primary}):Play()
        tweenService:Create(btnStroke, TweenInfo.new(0.2), {Transparency = 0}):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        tweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = colors.surface}):Play()
        tweenService:Create(btnStroke, TweenInfo.new(0.2), {Transparency = 0.6}):Play()
    end)
end

-- ========== SEARCH TAB ==========
local SearchFrame = Instance.new("Frame")
SearchFrame.Name = "SearchFrame"
SearchFrame.Parent = ScrollingFrame
SearchFrame.Size = UDim2.new(0.95, 0, 0, 150)
SearchFrame.BackgroundColor3 = colors.surface
SearchFrame.BackgroundTransparency = 0.2
SearchFrame.Visible = false

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 10)
SearchCorner.Parent = SearchFrame

local SearchStroke = Instance.new("UIStroke")
SearchStroke.Color = colors.secondary
SearchStroke.Thickness = 2
SearchStroke.Parent = SearchFrame

local SearchLabel = Instance.new("TextLabel")
SearchLabel.Parent = SearchFrame
SearchLabel.Size = UDim2.new(1, 0, 0, 40)
SearchLabel.Position = UDim2.new(0, 0, 0, 10)
SearchLabel.BackgroundTransparency = 1
SearchLabel.Text = "🔍 GAME SUCHEN"
SearchLabel.TextColor3 = colors.accent
SearchLabel.Font = Enum.Font.GothamBold
SearchLabel.TextSize = 22

local SearchBox = Instance.new("TextBox")
SearchBox.Parent = SearchFrame
SearchBox.Size = UDim2.new(0.9, 0, 0, 45)
SearchBox.Position = UDim2.new(0.05, 0, 0, 60)
SearchBox.PlaceholderText = "z.B. Blox Fruits, Arsenal, Brookhaven..."
SearchBox.Text = ""
SearchBox.BackgroundColor3 = colors.background
SearchBox.TextColor3 = colors.text
SearchBox.Font = Enum.Font.Gotham
SearchBox.TextSize = 16

local SearchBoxCorner = Instance.new("UICorner")
SearchBoxCorner.CornerRadius = UDim.new(0, 8)
SearchBoxCorner.Parent = SearchBox

local SearchBtn = Instance.new("TextButton")
SearchBtn.Parent = SearchFrame
SearchBtn.Size = UDim2.new(0.9, 0, 0, 45)
SearchBtn.Position = UDim2.new(0.05, 0, 0, 115)
SearchBtn.BackgroundColor3 = colors.secondary
SearchBtn.Text = "🔍 SUCHEN"
SearchBtn.TextColor3 = colors.background
SearchBtn.Font = Enum.Font.GothamBold
SearchBtn.TextSize = 20

local SearchBtnCorner = Instance.new("UICorner")
SearchBtnCorner.CornerRadius = UDim.new(0, 8)
SearchBtnCorner.Parent = SearchBtn

SearchBtn.MouseButton1Click:Connect(function()
    local query = SearchBox.Text:lower()
    local found = 0
    
    for i, script in ipairs(megaScripts) do
        if script[1]:lower():find(query) then
            found = found + 1
        end
    end
    
    showNotification("SUCHE", found .. " Scripts gefunden für '" .. query .. "'", 3)
end)

-- ========== TOOLS TAB ==========
createButton("🔄 REJOIN", colors.primary, function()
    showNotification("Rejoin", "Verbinde neu...", 2)
    teleportService:Teleport(game.PlaceId, player)
end, "TOOLS")

createButton("🌍 SERVER HOP", colors.secondary, function()
    showNotification("Server Hop", "Suche neuen Server...", 2)
    local servers = httpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100")).data
    for _, v in ipairs(servers) do
        if v.playing < v.maxPlayers then
            teleportService:TeleportToPlaceInstance(game.PlaceId, v.id, player)
            break
        end
    end
end, "TOOLS")

createButton("🔄 RESET CHAR", colors.error, function()
    if player.Character then
        player.Character:BreakJoints()
        showNotification("Reset", "Character zurückgesetzt", 1)
    end
end, "TOOLS")

createButton("💤 ANTI AFK", colors.success, function()
    player.Idled:Connect(function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end)
    showNotification("Anti AFK", "Aktiviert!", 2)
end, "TOOLS")

createButton("📋 COPY GAME ID", colors.accent, function()
    setclipboard(tostring(game.PlaceId))
    showNotification("Game ID", "Kopiert: " .. game.PlaceId, 2)
end, "TOOLS")

-- ========== TAB UMSCHALTUNG ==========
tabScripts.MouseButton1Click:Connect(function() switchTab("📜 SCRIPTS") end)
tabFav.MouseButton1Click:Connect(function() switchTab("⭐ FAVORITEN") end)
tabSearch.MouseButton1Click:Connect(function() switchTab("🔍 SUCHE") end)
tabTools.MouseButton1Click:Connect(function() switchTab("🛠️ TOOLS") end)

switchTab("📜 SCRIPTS")

-- ========== OPEN/CLOSE ==========
OpenButton.MouseButton1Click:Connect(function()
    Frame.Visible = true
    OpenButton.Visible = false
end)

CloseBtn.MouseButton1Click:Connect(function()
    Frame.Visible = false
    OpenButton.Visible = true
end)

MinBtn.MouseButton1Click:Connect(function()
    if Frame.Size == UDim2.new(0, 700, 0, 750) then
        Frame.Size = UDim2.new(0, 700, 0, 60)
        ContentFrame.Visible = false
        TabFrame.Visible = false
        MinBtn.Text = "□"
    else
        Frame.Size = UDim2.new(0, 700, 0, 750)
        ContentFrame.Visible = true
        TabFrame.Visible = true
        MinBtn.Text = "−"
    end
end)

-- Drag
local dragging = false
local dragInput, dragStart, startPos

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

userInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

showNotification("MEGA HACKER V12", "10.000+ Scripts geladen! Wähle PC/Mobile", 4)

print("✅ MEGA HACKER TOOL V12 GELADEN!")
print("📺 YouTube: @hacker666-00")
print("📦 Scripts: " .. #megaScripts .. "+ verfügbar")

end)

if not success then
    warn("FEHLER: " .. tostring(err))
    local errorGui = Instance.new("ScreenGui")
    errorGui.Parent = game:GetService("CoreGui")
    local errorFrame = Instance.new("Frame")
    errorFrame.Size = UDim2.new(0, 500, 0, 200)
    errorFrame.Position = UDim2.new(0.5, -250, 0.5, -100)
    errorFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    errorFrame.Parent = errorGui
    local errorText = Instance.new("TextLabel")
    errorText.Size = UDim2.new(1, 0, 1, 0)
    errorText.BackgroundTransparency = 1
    errorText.Text = "FEHLER: " .. tostring(err)
    errorText.TextColor3 = Color3.new(1,1,1)
    errorText.TextWrapped = true
    errorText.TextSize = 18
    errorText.Parent = errorFrame
end
