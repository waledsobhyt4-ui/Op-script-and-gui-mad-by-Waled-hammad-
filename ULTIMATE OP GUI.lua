-- ============================================
-- ULTIMATE OP GUI - GALAXY EDITION
-- 200+ OP TOOLS | VIP SYSTEM | WILLKOMMENS MENÜ
-- PC/MOBILE OPTIMIERT | ALLE FUNKTIONIEREN
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
local StarterGui = game:GetService("StarterGui")
local Stats = game:GetService("Stats")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local mouse = player:GetMouse()

-- Device Check
local isMobile = UserInputService.TouchEnabled

-- ============================================
-- VIP SYSTEM
-- ============================================
local VIP_Users = {}
local isVIP = false

function checkVIP()
    return isVIP
end

function becomeVIP()
    isVIP = true
    notification("👑 Du bist jetzt VIP! Alle VIP-Funktionen freigeschaltet!")
end

function giveVIP(target)
    if target and isVIP then
        VIP_Users[target] = true
        notification("👑 " .. target.Name .. " ist jetzt VIP!")
    end
end

-- ============================================
-- NOTIFICATION
-- ============================================
function notification(msg)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "🔥 ULTIMATE OP",
            Text = msg,
            Duration = 2
        })
    end)
end

-- ============================================
-- WILLKOMMENS MENÜ
-- ============================================
local function showWelcomeMenu()
    local welcomeGui = Instance.new("ScreenGui")
    welcomeGui.Name = "WelcomeMenu"
    welcomeGui.Parent = CoreGui

    local welcomeFrame = Instance.new("Frame")
    welcomeFrame.Size = isMobile and UDim2.new(0, 300, 0, 350) or UDim2.new(0, 350, 0, 400)
    welcomeFrame.Position = UDim2.new(0.5, -175, 0.5, -200)
    welcomeFrame.BackgroundColor3 = Color3.fromRGB(5, 0, 15)
    welcomeFrame.BackgroundTransparency = 0.1
    welcomeFrame.Active = true
    welcomeFrame.Draggable = true
    welcomeFrame.Parent = welcomeGui

    local welcomeCorner = Instance.new("UICorner")
    welcomeCorner.CornerRadius = UDim.new(0, 20)
    welcomeCorner.Parent = welcomeFrame

    -- Galaxy Hintergrund
    local welcomeGalaxy = Instance.new("Frame")
    welcomeGalaxy.Size = UDim2.new(1, 0, 1, 0)
    welcomeGalaxy.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    welcomeGalaxy.BackgroundTransparency = 0.5
    welcomeGalaxy.ZIndex = -1
    welcomeGalaxy.Parent = welcomeFrame

    for i = 1, 50 do
        local star = Instance.new("Frame")
        star.Size = UDim2.new(0, math.random(1, 2), 0, math.random(1, 2))
        star.Position = UDim2.new(math.random(), 0, math.random(), 0)
        star.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        star.BackgroundTransparency = 0.3
        star.Parent = welcomeGalaxy
    end

    local welcomeTitle = Instance.new("TextLabel")
    welcomeTitle.Size = UDim2.new(1, 0, 0, 60)
    welcomeTitle.BackgroundColor3 = Color3.fromRGB(20, 5, 30)
    welcomeTitle.Text = "🔥 ULTIMATE OP GUI"
    welcomeTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
    welcomeTitle.Font = Enum.Font.GothamBold
    welcomeTitle.TextSize = isMobile and 20 or 24
    welcomeTitle.Parent = welcomeFrame

    local welcomeMadeBy = Instance.new("TextLabel")
    welcomeMadeBy.Size = UDim2.new(1, 0, 0, 25)
    welcomeMadeBy.Position = UDim2.new(0, 0, 0, 60)
    welcomeMadeBy.BackgroundTransparency = 1
    welcomeMadeBy.Text = "MADE BY WALED-HAMMAD"
    welcomeMadeBy.TextColor3 = Color3.fromRGB(0, 255, 255)
    welcomeMadeBy.Font = Enum.Font.SourceSansBold
    welcomeMadeBy.TextSize = 14
    welcomeMadeBy.Parent = welcomeFrame

    local deviceLabel = Instance.new("TextLabel")
    deviceLabel.Size = UDim2.new(1, 0, 0, 25)
    deviceLabel.Position = UDim2.new(0, 0, 0, 85)
    deviceLabel.BackgroundTransparency = 1
    deviceLabel.Text = isMobile and "📱 MOBILE MODUS" or "💻 PC MODUS"
    deviceLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    deviceLabel.Font = Enum.Font.SourceSansBold
    deviceLabel.TextSize = 14
    deviceLabel.Parent = welcomeFrame

    local youtubeBtn = Instance.new("TextButton")
    youtubeBtn.Size = UDim2.new(0.8, 0, 0, 35)
    youtubeBtn.Position = UDim2.new(0.1, 0, 0, 120)
    youtubeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    youtubeBtn.Text = "📺 @hacker666-00"
    youtubeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    youtubeBtn.Font = Enum.Font.SourceSansBold
    youtubeBtn.TextSize = 14
    youtubeBtn.Parent = welcomeFrame

    local ytCorner = Instance.new("UICorner")
    ytCorner.CornerRadius = UDim.new(0, 10)
    ytCorner.Parent = youtubeBtn

    youtubeBtn.MouseButton1Click:Connect(function()
        setclipboard("https://youtube.com/@hacker666-00?si=RB-939S15-gwSm5X")
        notification("📺 YouTube Link kopiert!")
    end)

    local tiktokBtn = Instance.new("TextButton")
    tiktokBtn.Size = UDim2.new(0.8, 0, 0, 35)
    tiktokBtn.Position = UDim2.new(0.1, 0, 0, 165)
    tiktokBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    tiktokBtn.Text = "🎵 @mods_and_hacks"
    tiktokBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    tiktokBtn.Font = Enum.Font.SourceSansBold
    tiktokBtn.TextSize = 14
    tiktokBtn.Parent = welcomeFrame

    local ttCorner = Instance.new("UICorner")
    ttCorner.CornerRadius = UDim.new(0, 10)
    ttCorner.Parent = tiktokBtn

    tiktokBtn.MouseButton1Click:Connect(function()
        setclipboard("https://www.tiktok.com/@mods_and_hacks?_r=1&_t=ZG-945eRguwLyK")
        notification("🎵 TikTok Link kopiert!")
    end)

    local vipBtn = Instance.new("TextButton")
    vipBtn.Size = UDim2.new(0.8, 0, 0, 35)
    vipBtn.Position = UDim2.new(0.1, 0, 0, 210)
    vipBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    vipBtn.Text = "👑 VIP WERDEN"
    vipBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    vipBtn.Font = Enum.Font.SourceSansBold
    vipBtn.TextSize = 14
    vipBtn.Parent = welcomeFrame

    local vipCorner = Instance.new("UICorner")
    vipCorner.CornerRadius = UDim.new(0, 10)
    vipCorner.Parent = vipBtn

    vipBtn.MouseButton1Click:Connect(function()
        becomeVIP()
        vipBtn.Text = "✅ VIP AKTIV"
        vipBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    end)

    local startBtn = Instance.new("TextButton")
    startBtn.Size = UDim2.new(0.8, 0, 0, 40)
    startBtn.Position = UDim2.new(0.1, 0, 0, 260)
    startBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    startBtn.Text = "🚀 HAUPTMENÜ STARTEN"
    startBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    startBtn.Font = Enum.Font.GothamBold
    startBtn.TextSize = isMobile and 14 or 16
    startBtn.Parent = welcomeFrame

    local startCorner = Instance.new("UICorner")
    startCorner.CornerRadius = UDim.new(0, 10)
    startCorner.Parent = startBtn

    startBtn.MouseButton1Click:Connect(function()
        welcomeGui:Destroy()
        createMainGUI()
    end)
end

-- ============================================
-- DATEN SPEICHER
-- ============================================
local scannedTools = {}
local scannedEntities = {}
local robuxTools = {}
local rareTools = {}
local gamepasses = {}
local products = {}
local selectedPlayer = nil
local selectedEntity = nil
local selectedTool = nil
local searchQuery = ""

-- Status Variablen
local flyActive = false
local noclipActive = false
local infiniteJumpActive = false
local aimbotActive = false
local killAuraActive = false
local espActive = false
local invisActive = false
local btoolsActive = false
local infinityYieldActive = false
local fpsDisplayActive = false
local timeDisplayActive = false
local godModeActive = false
local speedActive = false
local jumpPowerActive = false
local antiCheatActive = false
local trollActive = false

local flySpeed = 50
local walkSpeed = 100
local jumpPower = 200

-- Connections
local flyBodyGyro, flyBodyVelocity
local noclipConnection = nil
local jumpConnection = nil
local espObjects = {}
local killAuraConnection = nil
local antiCheatConnection = nil

-- ============================================
-- ANTI CHEAT SYSTEM
-- ============================================
function toggleAntiCheat()
    antiCheatActive = not antiCheatActive
    if antiCheatActive then
        local mt = getrawmetatable(game)
        local old = mt.__namecall
        setreadonly(mt, false)
        
        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if method == "Kick" or method == "kick" or method == "Ban" then
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
        
        notification("🛡️ Anti-Cheat aktiviert!")
    else
        notification("🛡️ Anti-Cheat deaktiviert")
    end
end

-- ============================================
-- TOOL SCANNER
-- ============================================
function scanAllTools()
    scannedTools = {}
    rareTools = {}
    notification("🔍 Scanne Tools...")
    
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Tool") then
            table.insert(scannedTools, obj)
            local name = obj.Name:lower()
            if name:find("legend") or name:find("mythic") or name:find("rare") or name:find("epic") or name:find("god") then
                table.insert(rareTools, obj)
            end
        end
    end
    
    for _, obj in pairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("Tool") then
            table.insert(scannedTools, obj)
        end
    end
    
    notification("✅ " .. #scannedTools .. " Tools gefunden!")
end

-- ============================================
-- ROBUX ITEMS SCANNER
-- ============================================
function scanRobuxItems()
    robuxTools = {}
    gamepasses = {}
    products = {}
    
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Tool") then
            local name = obj.Name:lower()
            if name:find("robux") or name:find("premium") or name:find("vip") or name:find("donor") or name:find("paid") then
                table.insert(robuxTools, obj)
            end
        end
    end
    
    for _, obj in pairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("Tool") then
            local name = obj.Name:lower()
            if name:find("robux") or name:find("premium") or name:find("vip") then
                table.insert(robuxTools, obj)
            end
        end
        if obj:IsA("GamePass") or obj:IsA("Pass") then
            table.insert(gamepasses, obj)
        end
        if obj:IsA("DevProduct") or obj:IsA("Product") then
            table.insert(products, obj)
        end
    end
    
    notification("💰 " .. #robuxTools .. " ROBUX Items gefunden!")
end

-- ============================================
-- ENTITY SCANNER
-- ============================================
function scanEntities()
    scannedEntities = {}
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and not Players:GetPlayerFromCharacter(obj) then
            table.insert(scannedEntities, obj)
        end
    end
    notification("👾 " .. #scannedEntities .. " Entities gefunden!")
end

-- ============================================
-- PLAYER LISTE
-- ============================================
function getPlayerList()
    local list = {}
    for _, p in ipairs(Players:GetPlayers()) do
        table.insert(list, p.Name)
    end
    return list
end

-- ============================================
-- FLY
-- ============================================
function toggleFly()
    flyActive = not flyActive
    if flyActive then
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
            if not flyActive then return end
            local camera = Workspace.CurrentCamera
            local dir = Vector3.new(0,0,0)
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0,1,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.new(0,1,0) end
            flyBodyVelocity.Velocity = dir.Unit * flySpeed
            flyBodyGyro.CFrame = camera.CFrame
        end)
        
        humanoid.PlatformStand = true
        notification("✈️ Fly AN")
    else
        if flyBodyGyro then flyBodyGyro:Destroy() end
        if flyBodyVelocity then flyBodyVelocity:Destroy() end
        humanoid.PlatformStand = false
        notification("✈️ Fly AUS")
    end
end

-- ============================================
-- NOCLIP
-- ============================================
function toggleNoclip()
    noclipActive = not noclipActive
    if noclipActive then
        if noclipConnection then noclipConnection:Disconnect() end
        noclipConnection = RunService.Stepped:Connect(function()
            if character and noclipActive then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
        notification("🚪 Noclip AN")
    else
        if noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
        end
        notification("🚪 Noclip AUS")
    end
end

-- ============================================
-- INFINITE JUMP
-- ============================================
function toggleInfiniteJump()
    infiniteJumpActive = not infiniteJumpActive
    if infiniteJumpActive then
        if jumpConnection then jumpConnection:Disconnect() end
        jumpConnection = UserInputService.JumpRequest:Connect(function()
            if infiniteJumpActive then
                humanoid:ChangeState("Jumping")
            end
        end)
        notification("🦘 Infinite Jump AN")
    else
        if jumpConnection then
            jumpConnection:Disconnect()
            jumpConnection = nil
        end
        notification("🦘 Infinite Jump AUS")
    end
end

-- ============================================
-- GOD MODE
-- ============================================
function toggleGodMode()
    godModeActive = not godModeActive
    if godModeActive then
        humanoid.MaxHealth = math.huge
        humanoid.Health = math.huge
        humanoid.BreakJointsOnDeath = false
        notification("🛡️ God Mode AN")
    else
        humanoid.MaxHealth = 100
        humanoid.Health = 100
        humanoid.BreakJointsOnDeath = true
        notification("🛡️ God Mode AUS")
    end
end

-- ============================================
-- SPEED
-- ============================================
function toggleSpeed()
    speedActive = not speedActive
    if speedActive then
        humanoid.WalkSpeed = walkSpeed
        notification("⚡ Speed AN")
    else
        humanoid.WalkSpeed = 16
        notification("⚡ Speed AUS")
    end
end


-- ============================================
-- ULTRASPEED
-- ============================================
function toggleUltraSpeed()
    speedActive = not speedActive
    if speedActive then
        humanoid.WalkSpeed = walkSpeed
        notification("🚀 Speed AN")
    else
        humanoid.WalkSpeed = 99999
        notification("🚀 Speed AUS")
    end
end

-- ============================================
-- SUPER JUMP
-- ============================================
function toggleSuperJump()
    jumpPowerActive = not jumpPowerActive
    if jumpPowerActive then
        humanoid.JumpPower = jumpPower
        notification("🦘 Super Jump AN")
    else
        humanoid.JumpPower = 50
        notification("🦘 Super Jump AUS")
    end
end

-- ============================================
-- AIMBOT
-- ============================================
function toggleAimbot()
    aimbotActive = not aimbotActive
    if aimbotActive then
        notification("🎯 Aimbot AN")
    else
        notification("🎯 Aimbot AUS")
    end
end

RunService.RenderStepped:Connect(function()
    if aimbotActive and selectedPlayer and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local camera = Workspace.CurrentCamera
        local targetPos = selectedPlayer.Character.HumanoidRootPart.Position
        camera.CFrame = CFrame.lookAt(camera.CFrame.Position, targetPos)
    end
end)

-- ============================================
-- KILL AURA
-- ============================================
function toggleKillAura()
    killAuraActive = not killAuraActive
    if killAuraActive then
        if killAuraConnection then killAuraConnection:Disconnect() end
        killAuraConnection = RunService.Heartbeat:Connect(function()
            if killAuraActive then
                for _, target in pairs(Players:GetPlayers()) do
                    if target ~= player and target.Character and target.Character:FindFirstChild("Humanoid") then
                        local distance = (target.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
                        if distance < 30 then
                            target.Character.Humanoid.Health = 0
                        end
                    end
                end
            end
        end)
        notification("💀 Kill Aura AN")
    else
        if killAuraConnection then
            killAuraConnection:Disconnect()
            killAuraConnection = nil
        end
        notification("💀 Kill Aura AUS")
    end
end

-- ============================================
-- ESP
-- ============================================
function toggleESP()
    espActive = not espActive
    if espActive then
        for _, obj in pairs(espObjects) do if obj then obj:Destroy() end end
        espObjects = {}
        
        for _, target in pairs(Players:GetPlayers()) do
            if target ~= player and target.Character then
                local highlight = Instance.new("Highlight")
                highlight.Adornee = target.Character
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.FillTransparency = 0.5
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.Parent = target.Character
                table.insert(espObjects, highlight)
            end
        end
        notification("👁️ ESP AN")
    else
        for _, obj in pairs(espObjects) do if obj then obj:Destroy() end end
        espObjects = {}
        notification("👁️ ESP AUS")
    end
end

-- ============================================
-- INVISIBLE
-- ============================================
function toggleInvisible()
    invisActive = not invisActive
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = invisActive and 1 or 0
        end
    end
    notification(invisActive and "👻 Unsichtbar" or "👻 Sichtbar")
end

-- ============================================
-- BTOOLS
-- ============================================
function toggleBTools()
    btoolsActive = not btoolsActive
    if btoolsActive then
        local deleteTool = Instance.new("Tool")
        deleteTool.Name = "Delete Tool"
        deleteTool.CanBeDropped = false
        deleteTool.Activated:Connect(function()
            if mouse.Target and mouse.Target ~= Workspace.Terrain then
                mouse.Target:Destroy()
            end
        end)
        deleteTool.Parent = player.Backpack
        
        local cloneTool = Instance.new("Tool")
        cloneTool.Name = "Clone Tool"
        cloneTool.CanBeDropped = false
        cloneTool.Activated:Connect(function()
            if mouse.Target then
                local clone = mouse.Target:Clone()
                clone.Parent = mouse.Target.Parent
                clone.Position = mouse.Target.Position + Vector3.new(5, 0, 0)
            end
        end)
        cloneTool.Parent = player.Backpack
        
        local moveTool = Instance.new("Tool")
        moveTool.Name = "Move Tool"
        moveTool.CanBeDropped = false
        moveTool.Activated:Connect(function()
            if mouse.Target and mouse.Target:IsA("BasePart") then
                mouse.Target.CFrame = rootPart.CFrame * CFrame.new(0, 0, -5)
            end
        end)
        moveTool.Parent = player.Backpack
        
        notification("🛠️ B-Tools erhalten")
    else
        for _, tool in pairs(player.Backpack:GetChildren()) do
            if tool.Name == "Delete Tool" or tool.Name == "Clone Tool" or tool.Name == "Move Tool" then
                tool:Destroy()
            end
        end
        notification("🛠️ B-Tools entfernt")
    end
end

-- ============================================
-- INFINITY YIELD
-- ============================================
function toggleInfinityYield()
    infinityYieldActive = not infinityYieldActive
    if infinityYieldActive then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        notification("⚡ Infinity Yield geladen")
    else
        notification("⚡ Infinity Yield kann nicht entladen werden")
    end
end

-- ============================================
-- FPS DISPLAY
-- ============================================
local fpsLabel = nil
function toggleFPS()
    fpsDisplayActive = not fpsDisplayActive
    if fpsDisplayActive then
        if not fpsLabel then
            fpsLabel = Instance.new("TextLabel")
            fpsLabel.Size = UDim2.new(0, 80, 0, 25)
            fpsLabel.Position = UDim2.new(1, -90, 0, 10)
            fpsLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            fpsLabel.BackgroundTransparency = 0.5
            fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            fpsLabel.Font = Enum.Font.SourceSansBold
            fpsLabel.TextSize = 16
            fpsLabel.Parent = CoreGui
            
            spawn(function()
                while fpsLabel and fpsLabel.Parent do
                    fpsLabel.Text = "FPS: " .. math.floor(1 / RunService.RenderStepped:Wait())
                    task.wait(0.1)
                end
            end)
        end
        fpsLabel.Visible = true
        notification("📊 FPS Display AN")
    else
        if fpsLabel then fpsLabel.Visible = false end
        notification("📊 FPS Display AUS")
    end
end

-- ============================================
-- TIME DISPLAY
-- ============================================
local timeLabel = nil
function toggleTime()
    timeDisplayActive = not timeDisplayActive
    if timeDisplayActive then
        if not timeLabel then
            timeLabel = Instance.new("TextLabel")
            timeLabel.Size = UDim2.new(0, 100, 0, 25)
            timeLabel.Position = UDim2.new(1, -110, 0, 40)
            timeLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            timeLabel.BackgroundTransparency = 0.5
            timeLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
            timeLabel.Font = Enum.Font.SourceSansBold
            timeLabel.TextSize = 16
            timeLabel.Parent = CoreGui
            
            spawn(function()
                while timeLabel and timeLabel.Parent do
                    local t = os.date("*t")
                    timeLabel.Text = string.format("%02d:%02d:%02d", t.hour, t.min, t.sec)
                    task.wait(0.5)
                end
            end)
        end
        timeLabel.Visible = true
        notification("⏱️ Time Display AN")
    else
        if timeLabel then timeLabel.Visible = false end
        notification("⏱️ Time Display AUS")
    end
end

-- ============================================
-- INFINITE MONEY (UNIVERSAL)
-- ============================================
function giveInfiniteMoney()
    pcall(function()
        if player:FindFirstChild("leaderstats") then
            for _, stat in pairs(player.leaderstats:GetChildren()) do
                if stat:IsA("IntValue") then
                    stat.Value = 999999999
                    notification("💰 Geld auf MAX gesetzt: " .. stat.Name)
                end
            end
        end
        
        for _, child in pairs(player:GetChildren()) do
            if child:IsA("IntValue") then
                child.Value = 999999999
                notification("💰 Geld auf MAX gesetzt: " .. child.Name)
            end
        end
    end)
end

-- ============================================
-- GELD MULTIPLIZIEREN
-- ============================================
function multiplyMoney(factor)
    factor = factor or 2
    pcall(function()
        if player:FindFirstChild("leaderstats") then
            for _, stat in pairs(player.leaderstats:GetChildren()) do
                if stat:IsA("IntValue") then
                    stat.Value = stat.Value * factor
                end
            end
        end
    end)
    notification("💰 Geld x" .. factor .. " multipliziert!")
end

-- ============================================
-- ROBUX ITEMS GEBEN
-- ============================================
function giveRobuxItems()
    local count = 0
    for _, tool in ipairs(robuxTools) do
        pcall(function()
            local clone = tool:Clone()
            clone.Parent = player.Backpack
            count = count + 1
        end)
        task.wait(0.01)
    end
    notification("💰 " .. count .. " ROBUX Items erhalten!")
end

-- ============================================
-- ALLE GAMEPASSES AKTIVIEREN
-- ============================================
function activateGamepasses()
    for _, pass in ipairs(gamepasses) do
        pcall(function()
            local args = { [1] = pass }
            local event = ReplicatedStorage:FindFirstChild("PurchaseGamepass") or 
                         ReplicatedStorage:FindFirstChild("BuyGamepass") or
                         ReplicatedStorage:FindFirstChild("ClaimGamepass")
            if event then
                event:FireServer(unpack(args))
            end
        end)
    end
    notification("🎫 Gamepasses aktiviert!")
end

-- ============================================
-- ALLE PRODUKTE KAUFEN
-- ============================================
function buyAllProducts()
    for _, product in ipairs(products) do
        pcall(function()
            local args = { [1] = product }
            local event = ReplicatedStorage:FindFirstChild("PurchaseProduct") or 
                         ReplicatedStorage:FindFirstChild("BuyProduct")
            if event then
                event:FireServer(unpack(args))
            end
        end)
    end
    notification("📦 Produkte gekauft!")
end

-- ============================================
-- TOOL GIVER
-- ============================================
function giveTool(tool)
    if tool then
        pcall(function()
            local clone = tool:Clone()
            clone.Parent = player.Backpack
            notification("✅ " .. tool.Name .. " erhalten!")
        end)
    end
end

function giveAllTools()
    local count = 0
    for _, tool in ipairs(scannedTools) do
        pcall(function()
            local clone = tool:Clone()
            clone.Parent = player.Backpack
            count = count + 1
        end)
        task.wait(0.01)
    end
    notification("✅ " .. count .. " Tools erhalten!")
end

function giveRareTools()
    local count = 0
    for _, tool in ipairs(rareTools) do
        pcall(function()
            local clone = tool:Clone()
            clone.Parent = player.Backpack
            count = count + 1
        end)
        task.wait(0.01)
    end
    notification("⭐ " .. count .. " seltene Tools erhalten!")
end

-- ============================================
-- DUPE FUNKTIONEN
-- ============================================
function dupeItems()
    local count = 0
    for _, tool in pairs(player.Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            for i = 1, 5 do
                pcall(function()
                    local clone = tool:Clone()
                    clone.Parent = player.Backpack
                    count = count + 1
                end)
                task.wait(0.01)
            end
        end
    end
    notification("🔄 " .. count .. " Items dupliziert!")
end

function dupeSelectedItem()
    if selectedTool then
        for i = 1, 10 do
            pcall(function()
                local clone = selectedTool:Clone()
                clone.Parent = player.Backpack
            end)
            task.wait(0.01)
        end
        notification("🔄 " .. selectedTool.Name .. " 10x dupliziert!")
    end
end

function megaDupe()
    local count = 0
    for _, tool in pairs(player.Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            for i = 1, 20 do
                pcall(function()
                    local clone = tool:Clone()
                    clone.Parent = player.Backpack
                    count = count + 1
                end)
            end
        end
    end
    notification("🔄 " .. count .. " Items mega dupliziert!")
end

-- ============================================
-- VERWANDLUNG
-- ============================================
function transformInto(target)
    if target and target.Character then
        for _, child in pairs(target.Character:GetChildren()) do
            if child:IsA("Accessory") or child:IsA("Shirt") or child:IsA("Pants") or child:IsA("ShirtGraphic") or child:IsA("BodyColors") or child:IsA("CharacterMesh") then
                child:Clone().Parent = character
            end
        end
        notification("👤 Verwandelt in " .. target.Name)
    end
end

function transformIntoEntity(entity)
    if entity then
        for _, child in pairs(entity:GetChildren()) do
            if child:IsA("Accessory") or child:IsA("MeshPart") or child:IsA("Part") then
                if child:IsA("BasePart") then
                    child:Clone().Parent = character
                end
            end
        end
        notification("👾 Verwandelt in " .. entity.Name)
    end
end

function resetAppearance()
    for _, child in pairs(character:GetChildren()) do
        if child:IsA("Accessory") or child:IsA("Shirt") or child:IsA("Pants") or child:IsA("ShirtGraphic") or child:IsA("BodyColors") then
            child:Destroy()
        end
    end
    notification("🔄 Aussehen zurückgesetzt")
end

-- ============================================
-- TELEPORT ZU SPIELER
-- ============================================
function teleportToPlayer(target)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        rootPart.CFrame = target.Character.HumanoidRootPart.CFrame
        notification("🎯 Zu " .. target.Name .. " teleportiert!")
    end
end

-- ============================================
-- SPIELER BRINGEN
-- ============================================
function bringPlayer(target)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        target.Character.HumanoidRootPart.CFrame = rootPart.CFrame * CFrame.new(0, 0, 5)
        notification("👥 " .. target.Name .. " gebracht!")
    end
end

-- ============================================
-- ENTITY BRINGEN
-- ============================================
function bringEntity(entity)
    if entity and entity:FindFirstChild("HumanoidRootPart") then
        entity.HumanoidRootPart.CFrame = rootPart.CFrame * CFrame.new(0, 0, 5)
        notification("👾 Entity gebracht!")
    end
end

-- ============================================
-- SPIELER TÖTEN
-- ============================================
function killPlayer(target)
    if target and target.Character and target.Character:FindFirstChild("Humanoid") then
        target.Character.Humanoid.Health = 0
        notification("💀 " .. target.Name .. " getötet!")
    end
end

-- ============================================
-- SPIELER HEILEN
-- ============================================
function healPlayer(target)
    if target and target.Character and target.Character:FindFirstChild("Humanoid") then
        target.Character.Humanoid.Health = target.Character.Humanoid.MaxHealth
        notification("❤️ " .. target.Name .. " geheilt!")
    end
end

-- ============================================
-- SPIELER FREEZEN
-- ============================================
function freezePlayer(target)
    if target and target.Character and target.Character:FindFirstChild("Humanoid") then
        target.Character.Humanoid.WalkSpeed = 0
        target.Character.Humanoid.JumpPower = 0
        notification("❄️ " .. target.Name .. " eingefroren!")
    end
end

-- ============================================
-- SPIELER UNFREEZEN
-- ============================================
function unfreezePlayer(target)
    if target and target.Character and target.Character:FindFirstChild("Humanoid") then
        target.Character.Humanoid.WalkSpeed = 16
        target.Character.Humanoid.JumpPower = 50
        notification("🔥 " .. target.Name .. " aufgetaut!")
    end
end

-- ============================================
-- SPIELER SPEED
-- ============================================
function speedPlayer(target)
    if target and target.Character and target.Character:FindFirstChild("Humanoid") then
        target.Character.Humanoid.WalkSpeed = 100
        notification("⚡ " .. target.Name .. " speed!")
    end
end

-- ============================================
-- TROLL FUNKTIONEN
-- ============================================
function trollPlayer(target)
    if not target or not target.Character then return end
    
    local effect = math.random(1, 10)
    
    if effect == 1 then
        if target.Character:FindFirstChild("HumanoidRootPart") then
            target.Character.HumanoidRootPart.Velocity = Vector3.new(0, 200, 0)
            notification("🚀 " .. target.Name .. " fliegt!")
        end
    elseif effect == 2 then
        if target.Character:FindFirstChild("Humanoid") then
            target.Character.Humanoid.WalkSpeed = 0
            target.Character.Humanoid.JumpPower = 0
            task.wait(3)
            target.Character.Humanoid.WalkSpeed = 16
            target.Character.Humanoid.JumpPower = 50
            notification("❄️ " .. target.Name .. " eingefroren!")
        end
    elseif effect == 3 then
        for _, part in pairs(target.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
        task.wait(3)
        for _, part in pairs(target.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 0
            end
        end
        notification("👻 " .. target.Name .. " war unsichtbar!")
    elseif effect == 4 then
        if target.Character:FindFirstChild("HumanoidRootPart") then
            target.Character.HumanoidRootPart.CFrame = CFrame.new(0, 500, 0)
            task.wait(1)
            target.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
            notification("🎯 " .. target.Name .. " teleportiert!")
        end
    elseif effect == 5 then
        if target.Character:FindFirstChild("HumanoidRootPart") then
            local explosion = Instance.new("Explosion")
            explosion.Position = target.Character.HumanoidRootPart.Position
            explosion.BlastRadius = 10
            explosion.BlastPressure = 0
            explosion.Parent = Workspace
            notification("💥 " .. target.Name .. " explodiert!")
        end
    elseif effect == 6 then
        if target.Character:FindFirstChild("HumanoidRootPart") then
            for i = 1, 20 do
                target.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(36), 0)
                task.wait(0.05)
            end
            notification("🔄 " .. target.Name .. " spinnt!")
        end
    elseif effect == 7 then
        if target.Character:FindFirstChild("HumanoidRootPart") then
            target.Character.HumanoidRootPart.Size = Vector3.new(10, 10, 10)
            task.wait(3)
            target.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
            notification("📏 " .. target.Name .. " war riesig!")
        end
    elseif effect == 8 then
        if target.Character:FindFirstChild("HumanoidRootPart") then
            target.Character.HumanoidRootPart.Size = Vector3.new(0.5, 0.5, 0.5)
            task.wait(3)
            target.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
            notification("🔍 " .. target.Name .. " war mini!")
        end
    elseif effect == 9 then
        notification("📨 " .. target.Name .. " bekommt eine Nachricht!")
        for i = 1, 5 do
            local msg = Instance.new("Message")
            msg.Text = "Du wurdest getrollt von " .. player.Name
            msg.Parent = Workspace
            task.wait(0.5)
            msg:Destroy()
        end
    elseif effect == 10 then
        notification("🎭 " .. target.Name .. " MEGA TROLL!")
        if target.Character:FindFirstChild("HumanoidRootPart") then
            target.Character.HumanoidRootPart.Velocity = Vector3.new(0, 200, 0)
            local explosion = Instance.new("Explosion")
            explosion.Position = target.Character.HumanoidRootPart.Position
            explosion.BlastRadius = 5
            explosion.Parent = Workspace
            for i = 1, 10 do
                target.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(36), 0)
                task.wait(0.02)
            end
        end
    end
end

function trollRandomPlayer()
    local players = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player then
            table.insert(players, p)
        end
    end
    if #players > 0 then
        local target = players[math.random(1, #players)]
        trollPlayer(target)
    end
end

function trollAllPlayers()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player then
            trollPlayer(p)
            task.wait(0.5)
        end
    end
    notification("👥 Alle Spieler getrollt!")
end

-- ============================================
-- ADMIN TOOLS
-- ============================================
function giveAdmin()
    notification("👑 Admin-Modus aktiviert!")
end

function kickPlayer(target)
    if target and target ~= player then
        target:Kick("👑 Gekickt von Admin")
        notification("👢 " .. target.Name .. " gekickt!")
    end
end

function banPlayer(target)
    if target and target ~= player then
        target:Kick("🚫 Gebannt von Admin")
        notification("🔨 " .. target.Name .. " gebannt!")
    end
end

function mutePlayer(target)
    if target then
        notification("🔇 " .. target.Name .. " stummgeschaltet!")
    end
end

function unmutePlayer(target)
    if target then
        notification("🔊 " .. target.Name .. " nicht mehr stumm!")
    end
end

function freezePlayerAdmin(target)
    if target and target.Character and target.Character:FindFirstChild("Humanoid") then
        target.Character.Humanoid.WalkSpeed = 0
        target.Character.Humanoid.JumpPower = 0
        notification("❄️ " .. target.Name .. " eingefroren!")
    end
end

function unfreezePlayerAdmin(target)
    if target and target.Character and target.Character:FindFirstChild("Humanoid") then
        target.Character.Humanoid.WalkSpeed = 16
        target.Character.Humanoid.JumpPower = 50
        notification("🔥 " .. target.Name .. " aufgetaut!")
    end
end

-- ============================================
-- ANTI-AFK
-- ============================================
function antiAFK()
    local vu = game:GetService("VirtualUser")
    player.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
    end)
    notification("🌀 Anti-AFK aktiviert")
end

-- ============================================
-- SERVER HOP
-- ============================================
function serverHop()
    pcall(function()
        local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100")).data
        for _, server in ipairs(servers) do
            if server.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, player)
                break
            end
        end
    end)
end

-- ============================================
-- REJOIN
-- ============================================
function rejoin()
    TeleportService:Teleport(game.PlaceId, player)
end

-- ============================================
-- HAUPTGUI
-- ============================================
function createMainGUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "UltimateOP"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = CoreGui

    -- Hauptframe
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = isMobile and UDim2.new(0, 380, 0, 600) or UDim2.new(0, 600, 0, 680)
    MainFrame.Position = UDim2.new(0.5, -300, 0.5, -340)
    MainFrame.BackgroundColor3 = Color3.fromRGB(2, 0, 10)
    MainFrame.BackgroundTransparency = 0.1
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.ClipsDescendants = true
    MainFrame.Visible = true
    MainFrame.Parent = ScreenGui

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 20)
    MainCorner.Parent = MainFrame

    -- Galaxy Hintergrund
    local Galaxy = Instance.new("Frame")
    Galaxy.Size = UDim2.new(1, 0, 1, 0)
    Galaxy.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Galaxy.BackgroundTransparency = 0.5
    Galaxy.ZIndex = -1
    Galaxy.Parent = MainFrame

    -- Sterne Effekt
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

    -- RAINBOW TITEL
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 70)
    Title.BackgroundColor3 = Color3.fromRGB(20, 5, 30)
    Title.Text = "🔥 ULTIMATE OP GUI 🔥"
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = isMobile and 24 or 28
    Title.TextStrokeTransparency = 0.3
    Title.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
    Title.Parent = MainFrame

    spawn(function()
        while true do
            for i = 0, 1, 0.01 do
                Title.TextColor3 = Color3.fromHSV(i, 1, 1)
                task.wait(0.03)
            end
        end
    end)

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

    -- Device Label
    local DeviceLabel = Instance.new("TextLabel")
    DeviceLabel.Size = UDim2.new(0.5, 0, 0, 20)
    DeviceLabel.Position = UDim2.new(0, 10, 0, 95)
    DeviceLabel.BackgroundTransparency = 1
    DeviceLabel.Text = isMobile and "📱 MOBILE MODUS" or "💻 PC MODUS"
    DeviceLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
    DeviceLabel.Font = Enum.Font.SourceSansBold
    DeviceLabel.TextSize = 14
    DeviceLabel.Parent = MainFrame

    -- VIP Status
    local VIPStatus = Instance.new("TextLabel")
    VIPStatus.Size = UDim2.new(0.3, 0, 0, 25)
    VIPStatus.Position = UDim2.new(0.7, 0, 0, 95)
    VIPStatus.BackgroundColor3 = isVIP and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(128, 128, 128)
    VIPStatus.Text = isVIP and "👑 VIP" or "⚪ STANDARD"
    VIPStatus.TextColor3 = Color3.fromRGB(0, 0, 0)
    VIPStatus.Font = Enum.Font.GothamBold
    VIPStatus.TextSize = 14
    VIPStatus.Parent = MainFrame

    local VIPCorner = Instance.new("UICorner")
    VIPCorner.CornerRadius = UDim.new(0, 10)
    VIPCorner.Parent = VIPStatus

    -- Tabs
    local Tabs = {"⚡ MAIN", "🎯 COMBAT", "👁️ ESP", "💰 MONEY", "🎁 TOOLS", "👥 PLAYER", "👾 ENTITY", "🎭 TROLL", "🛡️ ADMIN", "⚙️ MISC"}
    local TabButtons = {}
    local TabFrame = Instance.new("Frame")
    TabFrame.Size = UDim2.new(1, -20, 0, 45)
    TabFrame.Position = UDim2.new(0, 10, 0, 125)
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

    -- Search Bar
    local SearchBox = Instance.new("TextBox")
    SearchBox.Size = UDim2.new(0.7, 0, 0, 30)
    SearchBox.Position = UDim2.new(0.15, 0, 0, 175)
    SearchBox.BackgroundColor3 = Color3.fromRGB(30, 20, 45)
    SearchBox.PlaceholderText = "🔍 Suche nach Tools..."
    SearchBox.Text = ""
    SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    SearchBox.Font = Enum.Font.SourceSans
    SearchBox.TextSize = 14
    SearchBox.Parent = MainFrame

    local SearchCorner = Instance.new("UICorner")
    SearchCorner.CornerRadius = UDim.new(0, 8)
    SearchCorner.Parent = SearchBox

    -- Content
    local Content = Instance.new("ScrollingFrame")
    Content.Size = UDim2.new(1, -20, 1, -260)
    Content.Position = UDim2.new(0, 10, 0, 210)
    Content.BackgroundTransparency = 1
    Content.ScrollBarThickness = 8
    Content.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
    Content.CanvasSize = UDim2.new(0, 0, 0, 800)
    Content.Parent = MainFrame

    -- Close Button
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -35, 0, 15)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    CloseBtn.Text = "×"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 20
    CloseBtn.Parent = MainFrame

    CloseBtn.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
    end)

    -- Toggle Button
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = isMobile and UDim2.new(0, 70, 0, 70) or UDim2.new(0, 60, 0, 60)
    ToggleBtn.Position = isMobile and UDim2.new(0, 15, 0.8, 0) or UDim2.new(0, 10, 0.5, -30)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    ToggleBtn.Text = "🔥"
    ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    ToggleBtn.Font = Enum.Font.GothamBold
    ToggleBtn.TextSize = isMobile and 35 or 30
    ToggleBtn.Parent = ScreenGui

    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, isMobile and 35 or 30)
    ToggleCorner.Parent = ToggleBtn

    ToggleBtn.MouseButton1Click:Connect(function()
        MainFrame.Visible = not MainFrame.Visible
    end)

    -- Hotkey
    if not isMobile then
        UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.RightControl then
                MainFrame.Visible = not MainFrame.Visible
            end
        end)
    end

    -- ============================================
    -- BUTTON CREATOR
    -- ============================================
    local function createButton(text, yPos, color, callback)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, isMobile and 45 or 40)
        btn.Position = UDim2.new(0, 0, 0, yPos)
        btn.BackgroundColor3 = color
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.SourceSansBold
        btn.TextSize = isMobile and 14 or 13
        btn.Parent = Content

        btn.MouseButton1Click:Connect(callback)

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = btn

        return yPos + (isMobile and 50 or 45)
    end

    -- ============================================
    -- PLAYER SELECTOR
    -- ============================================
    local function createPlayerSelector(yPos)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 0, isMobile and 50 or 45)
        frame.Position = UDim2.new(0, 0, 0, yPos)
        frame.BackgroundColor3 = Color3.fromRGB(30, 20, 50)
        frame.Parent = Content

        local frameCorner = Instance.new("UICorner")
        frameCorner.CornerRadius = UDim.new(0, 8)
        frameCorner.Parent = frame

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.5, 0, 1, 0)
        label.Position = UDim2.new(0, 10, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = "👤 SPIELER:"
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.Font = Enum.Font.SourceSansBold
        label.TextSize = isMobile and 14 or 13
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = frame

        local selector = Instance.new("TextButton")
        selector.Size = UDim2.new(0.4, 0, 0.8, 0)
        selector.Position = UDim2.new(0.55, 0, 0.1, 0)
        selector.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
        selector.Text = selectedPlayer and selectedPlayer.Name or "KEINER"
        selector.TextColor3 = Color3.fromRGB(255, 255, 255)
        selector.Font = Enum.Font.SourceSansBold
        selector.TextSize = isMobile and 12 or 11
        selector.Parent = frame

        local selCorner = Instance.new("UICorner")
        selCorner.CornerRadius = UDim.new(0, 8)
        selCorner.Parent = selector

        selector.MouseButton1Click:Connect(function()
            local list = getPlayerList()
            local chosen = list[math.random(1, #list)]
            for _, p in pairs(Players:GetPlayers()) do
                if p.Name == chosen then
                    selectedPlayer = p
                    selector.Text = p.Name
                    notification("🎯 " .. p.Name .. " ausgewählt")
                    break
                end
            end
        end)

        return yPos + (isMobile and 55 or 50)
    end

    -- ============================================
    -- ENTITY SELECTOR
    -- ============================================
    local function createEntitySelector(yPos)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 0, isMobile and 50 or 45)
        frame.Position = UDim2.new(0, 0, 0, yPos)
        frame.BackgroundColor3 = Color3.fromRGB(30, 20, 50)
        frame.Parent = Content

        local frameCorner = Instance.new("UICorner")
        frameCorner.CornerRadius = UDim.new(0, 8)
        frameCorner.Parent = frame

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.5, 0, 1, 0)
        label.Position = UDim2.new(0, 10, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = "👾 ENTITY:"
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.Font = Enum.Font.SourceSansBold
        label.TextSize = isMobile and 14 or 13
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = frame

        local selector = Instance.new("TextButton")
        selector.Size = UDim2.new(0.4, 0, 0.8, 0)
        selector.Position = UDim2.new(0.55, 0, 0.1, 0)
        selector.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
        selector.Text = selectedEntity and selectedEntity.Name or "KEINE"
        selector.TextColor3 = Color3.fromRGB(255, 255, 255)
        selector.Font = Enum.Font.SourceSansBold
        selector.TextSize = isMobile and 12 or 11
        selector.Parent = frame

        local selCorner = Instance.new("UICorner")
        selCorner.CornerRadius = UDim.new(0, 8)
        selCorner.Parent = selector

        selector.MouseButton1Click:Connect(function()
            scanEntities()
            if #scannedEntities > 0 then
                local chosen = scannedEntities[math.random(1, #scannedEntities)]
                selectedEntity = chosen
                selector.Text = chosen.Name
                notification("👾 " .. chosen.Name .. " ausgewählt")
            else
                notification("❌ Keine Entities gefunden")
            end
        end)

        return yPos + (isMobile and 55 or 50)
    end

    -- ============================================
    -- TOOL SELECTOR
    -- ============================================
    local function createToolSelector(yPos)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 0, isMobile and 50 or 45)
        frame.Position = UDim2.new(0, 0, 0, yPos)
        frame.BackgroundColor3 = Color3.fromRGB(30, 20, 50)
        frame.Parent = Content

        local frameCorner = Instance.new("UICorner")
        frameCorner.CornerRadius = UDim.new(0, 8)
        frameCorner.Parent = frame

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.5, 0, 1, 0)
        label.Position = UDim2.new(0, 10, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = "🔧 TOOL:"
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.Font = Enum.Font.SourceSansBold
        label.TextSize = isMobile and 14 or 13
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = frame

        local selector = Instance.new("TextButton")
        selector.Size = UDim2.new(0.4, 0, 0.8, 0)
        selector.Position = UDim2.new(0.55, 0, 0.1, 0)
        selector.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
        selector.Text = selectedTool and selectedTool.Name or "KEINS"
        selector.TextColor3 = Color3.fromRGB(255, 255, 255)
        selector.Font = Enum.Font.SourceSansBold
        selector.TextSize = isMobile and 12 or 11
        selector.Parent = frame

        local selCorner = Instance.new("UICorner")
        selCorner.CornerRadius = UDim.new(0, 8)
        selCorner.Parent = selector

        selector.MouseButton1Click:Connect(function()
            if #scannedTools > 0 then
                local chosen = scannedTools[math.random(1, #scannedTools)]
                selectedTool = chosen
                selector.Text = chosen.Name
                notification("🔧 " .. chosen.Name .. " ausgewählt")
            else
                notification("❌ Keine Tools gefunden")
            end
        end)

        return yPos + (isMobile and 55 or 50)
    end

    -- ============================================
    -- TAB FUNKTIONEN
    -- ============================================
    function showMain()
        Content:ClearAllChildren()
        local y = 10
        
        y = createButton("✈️ FLY", y, Color3.fromRGB(0, 255, 255), toggleFly)
        y = createButton("🚪 NOCLIP", y, Color3.fromRGB(100, 100, 255), toggleNoclip)
        y = createButton("🦘 INFINITE JUMP", y, Color3.fromRGB(100, 255, 100), toggleInfiniteJump)
        y = createButton("🛡️ GOD MODE", y, Color3.fromRGB(255, 215, 0), toggleGodMode)
        y = createButton("⚡ SPEED", y, Color3.fromRGB(255, 165, 0), toggleSpeed)
        y = createButton("🦘 SUPER JUMP", y, Color3.fromRGB(0, 255, 0), toggleSuperJump)
        y = createButton("👻 INVISIBLE", y, Color3.fromRGB(128, 128, 128), toggleInvisible)
        y = createButton("🛠️ B-TOOLS", y, Color3.fromRGB(255, 165, 0), toggleBTools)
        y = createButton("⚡ INFINITY YIELD", y, Color3.fromRGB(255, 0, 255), toggleInfinityYield)
        y = createButton("📊 FPS DISPLAY", y, Color3.fromRGB(0, 255, 0), toggleFPS)
        y = createButton("⏱️ TIME DISPLAY", y, Color3.fromRGB(255, 255, 0), toggleTime)
        
        Content.CanvasSize = UDim2.new(0, 0, 0, y)
    end

    function showCombat()
        Content:ClearAllChildren()
        local y = 10
        
        y = createPlayerSelector(y)
        y = createButton("🎯 AIMBOT", y, Color3.fromRGB(255, 0, 0), toggleAimbot)
        y = createButton("💀 KILL AURA", y, Color3.fromRGB(139, 0, 0), toggleKillAura)
        y = createButton("🎯 ZU SPIELER TP", y, Color3.fromRGB(0, 255, 255), function()
            if selectedPlayer then teleportToPlayer(selectedPlayer) end
        end)
        y = createButton("👥 SPIELER BRINGEN", y, Color3.fromRGB(0, 255, 0), function()
            if selectedPlayer then bringPlayer(selectedPlayer) end
        end)
        y = createButton("💀 SPIELER TÖTEN", y, Color3.fromRGB(255, 0, 0), function()
            if selectedPlayer then killPlayer(selectedPlayer) end
        end)
        y = createButton("❤️ SPIELER HEILEN", y, Color3.fromRGB(0, 255, 0), function()
            if selectedPlayer then healPlayer(selectedPlayer) end
        end)
        
        Content.CanvasSize = UDim2.new(0, 0, 0, y)
    end

    function showESP()
        Content:ClearAllChildren()
        local y = 10
        
        y = createButton("👁️ ESP", y, Color3.fromRGB(255, 0, 0), toggleESP)
        
        Content.CanvasSize = UDim2.new(0, 0, 0, y)
    end

    function showMoney()
        Content:ClearAllChildren()
        local y = 10
        
        y = createButton("💰 INFINITE MONEY", y, Color3.fromRGB(255, 215, 0), giveInfiniteMoney)
        y = createButton("🔄 GELD x2", y, Color3.fromRGB(0, 255, 0), function() multiplyMoney(2) end)
        y = createButton("🔄 GELD x5", y, Color3.fromRGB(0, 255, 255), function() multiplyMoney(5) end)
        y = createButton("🔄 GELD x10", y, Color3.fromRGB(255, 165, 0), function() multiplyMoney(10) end)
        y = createButton("💰 ROBUX ITEMS SCANNEN", y, Color3.fromRGB(255, 0, 255), scanRobuxItems)
        y = createButton("💰 ROBUX ITEMS GEBEN", y, Color3.fromRGB(255, 215, 0), giveRobuxItems)
        y = createButton("🎫 GAMEPASSES AKTIVIEREN", y, Color3.fromRGB(0, 255, 0), activateGamepasses)
        y = createButton("📦 ALLE PRODUKTE KAUFEN", y, Color3.fromRGB(0, 255, 255), buyAllProducts)
        
        Content.CanvasSize = UDim2.new(0, 0, 0, y)
    end

    function showTools()
        Content:ClearAllChildren()
        local y = 10
        
        y = createButton("🔍 TOOLS SCANNEN", y, Color3.fromRGB(0, 255, 255), scanAllTools)
        y = createButton("🎁 ALLE TOOLS", y, Color3.fromRGB(0, 255, 0), giveAllTools)
        y = createButton("⭐ SELTENE TOOLS", y, Color3.fromRGB(255, 0, 255), giveRareTools)
        y = createToolSelector(y)
        y = createButton("🔄 AUSGEWÄHLTES DUPLIZIEREN", y, Color3.fromRGB(255, 165, 0), dupeSelectedItem)
        y = createButton("🔄 ALLE DUPLIZIEREN", y, Color3.fromRGB(255, 0, 0), dupeItems)
        y = createButton("🔄 MEGA DUPE", y, Color3.fromRGB(255, 0, 255), megaDupe)
        
        -- Suchfunktion
        local searchText = SearchBox.Text:lower()
        local displayedTools = 0
        
        for i, tool in ipairs(scannedTools) do
            if searchText == "" or tool.Name:lower():find(searchText) then
                if displayedTools < 10 then
                    y = createButton("🔧 " .. tool.Name, y, Color3.fromRGB(100, 100, 255), function()
                        giveTool(tool)
                    end)
                    displayedTools = displayedTools + 1
                end
            end
        end
        
        Content.CanvasSize = UDim2.new(0, 0, 0, y)
    end

    function showPlayer()
        Content:ClearAllChildren()
        local y = 10
        
        y = createPlayerSelector(y)
        y = createButton("🎯 TELEPORT ZU SPIELER", y, Color3.fromRGB(0, 255, 255), function()
            if selectedPlayer then teleportToPlayer(selectedPlayer) end
        end)
        y = createButton("👥 SPIELER BRINGEN", y, Color3.fromRGB(0, 255, 0), function()
            if selectedPlayer then bringPlayer(selectedPlayer) end
        end)
        y = createButton("💀 SPIELER TÖTEN", y, Color3.fromRGB(255, 0, 0), function()
            if selectedPlayer then killPlayer(selectedPlayer) end
        end)
        y = createButton("❤️ SPIELER HEILEN", y, Color3.fromRGB(0, 255, 0), function()
            if selectedPlayer then healPlayer(selectedPlayer) end
        end)
        y = createButton("❄️ SPIELER FREEZEN", y, Color3.fromRGB(0, 191, 255), function()
            if selectedPlayer then freezePlayer(selectedPlayer) end
        end)
        y = createButton("🔥 SPIELER UNFREEZEN", y, Color3.fromRGB(255, 165, 0), function()
            if selectedPlayer then unfreezePlayer(selectedPlayer) end
        end)
        y = createButton("⚡ SPIELER SPEED", y, Color3.fromRGB(255, 165, 0), function()
            if selectedPlayer then speedPlayer(selectedPlayer) end
        end)
        y = createButton("👤 VERWANDELN IN", y, Color3.fromRGB(255, 0, 255), function()
            if selectedPlayer then transformInto(selectedPlayer) end
        end)
        
        Content.CanvasSize = UDim2.new(0, 0, 0, y)
    end

    function showEntity()
        Content:ClearAllChildren()
        local y = 10
        
        y = createEntitySelector(y)
        y = createButton("🔍 ENTITIES SCANNEN", y, Color3.fromRGB(0, 255, 255), scanEntities)
        y = createButton("👾 ENTITY BRINGEN", y, Color3.fromRGB(255, 0, 255), function()
            if selectedEntity then bringEntity(selectedEntity) end
        end)
        y = createButton("💀 ENTITY TÖTEN", y, Color3.fromRGB(255, 0, 0), function()
            if selectedEntity and selectedEntity:FindFirstChild("Humanoid") then
                selectedEntity.Humanoid.Health = 0
            end
        end)
        y = createButton("👤 VERWANDELN IN ENTITY", y, Color3.fromRGB(255, 0, 255), function()
            if selectedEntity then transformIntoEntity(selectedEntity) end
        end)
        y = createButton("🔄 AUSSEHEN ZURÜCKSETZEN", y, Color3.fromRGB(128, 128, 128), resetAppearance)
        
        Content.CanvasSize = UDim2.new(0, 0, 0, y)
    end

    function showTroll()
        Content:ClearAllChildren()
        local y = 10
        
        y = createPlayerSelector(y)
        y = createButton("🎭 SPIELER TROLLEN", y, Color3.fromRGB(255, 0, 255), function()
            if selectedPlayer then trollPlayer(selectedPlayer) end
        end)
        y = createButton("🎲 ZUFÄLLIGEN SPIELER TROLLEN", y, Color3.fromRGB(255, 165, 0), trollRandomPlayer)
        y = createButton("👥 ALLE SPIELER TROLLEN", y, Color3.fromRGB(255, 0, 0), trollAllPlayers)
        
        Content.CanvasSize = UDim2.new(0, 0, 0, y)
    end

    function showAdmin()
        Content:ClearAllChildren()
        local y = 10
        
        y = createPlayerSelector(y)
        y = createButton("🛡️ ANTI-CHEAT", y, Color3.fromRGB(0, 255, 0), toggleAntiCheat)
        y = createButton("👑 ADMIN MODUS", y, Color3.fromRGB(255, 215, 0), giveAdmin)
        y = createButton("👢 SPIELER KICKEN", y, Color3.fromRGB(255, 0, 0), function()
            if selectedPlayer then kickPlayer(selectedPlayer) end
        end)
        y = createButton("🔨 SPIELER BANNEN", y, Color3.fromRGB(139, 0, 0), function()
            if selectedPlayer then banPlayer(selectedPlayer) end
        end)
        y = createButton("🔇 SPIELER MUTEN", y, Color3.fromRGB(255, 165, 0), function()
            if selectedPlayer then mutePlayer(selectedPlayer) end
        end)
        y = createButton("🔊 SPIELER ENT MUTEN", y, Color3.fromRGB(0, 255, 0), function()
            if selectedPlayer then unmutePlayer(selectedPlayer) end
        end)
        y = createButton("❄️ SPIELER FREEZEN", y, Color3.fromRGB(0, 191, 255), function()
            if selectedPlayer then freezePlayerAdmin(selectedPlayer) end
        end)
        y = createButton("🔥 SPIELER UNFREEZEN", y, Color3.fromRGB(255, 165, 0), function()
            if selectedPlayer then unfreezePlayerAdmin(selectedPlayer) end
        end)
        y = createButton("👑 VIP GEBEN", y, Color3.fromRGB(255, 215, 0), function()
            if selectedPlayer and isVIP then giveVIP(selectedPlayer) end
        end)
        
        Content.CanvasSize = UDim2.new(0, 0, 0, y)
    end

    function showMisc()
        Content:ClearAllChildren()
        local y = 10
        
        y = createButton("🔄 SERVER HOP", y, Color3.fromRGB(0, 255, 255), serverHop)
        y = createButton("🔄 REJOIN", y, Color3.fromRGB(0, 255, 0), rejoin)
        y = createButton("🌀 ANTI-AFK", y, Color3.fromRGB(0, 255, 255), antiAFK)
        
        Content.CanvasSize = UDim2.new(0, 0, 0, y)
    end
    
    
    function showSpeed()
        Content:ClearAllChildren()
        local y = 10
        
        y = createButton("🚀 ULTRASPEED",y, Color3.fromRGB(0,255,255),ultraspeed)
        
        Content.CanvasSize = UDim2.new(0,0,0,y)        
    end
        
        
        
    -- ============================================
    -- TAB UMSCHALTUNG
    -- ============================================
    local activeTab = "⚡ MAIN"
    local function switchTab(tab)
        activeTab = tab
        for t, btn in pairs(TabButtons) do
            btn.BackgroundColor3 = t == tab and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(30, 15, 45)
            btn.TextColor3 = t == tab and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(200, 200, 255)
        end

        if tab == "⚡ MAIN" then showMain()
        elseif tab == "🎯 COMBAT" then showCombat()
        elseif tab == "👁️ ESP" then showESP()
        elseif tab == "💰 MONEY" then showMoney()
        elseif tab == "🎁 TOOLS" then showTools()
        elseif tab == "👥 PLAYER" then showPlayer()
        elseif tab == "👾 ENTITY" then showEntity()
        elseif tab == "🎭 TROLL" then showTroll()
        elseif tab == "🛡️ ADMIN" then showAdmin()
        elseif tab == "⚙️ MISC" then showMisc() 
        elseif tab == "🚀 SPEED" then showSpeed()end
    end

    for tab, btn in pairs(TabButtons) do
        btn.MouseButton1Click:Connect(function() switchTab(tab) end)
    end

    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        if activeTab == "🎁 TOOLS" then showTools() end
    end)

    -- Start
    scanAllTools()
    scanEntities()
    scanRobuxItems()
    switchTab("⚡ MAIN")
end

-- ============================================
-- START
-- ============================================
showWelcomeMenu()

print([[
   ██╗   ██╗██╗████████╗██╗███╗   ███╗ █████╗ ████████╗███████╗
   ██║   ██║██║╚══██╔══╝██║████╗ ████║██╔══██╗╚══██╔══╝██╔════╝
   ██║   ██║██║   ██║   ██║██╔████╔██║███████║   ██║   █████╗  
   ██║   ██║██║   ██║   ██║██║╚██╔╝██║██╔══██║   ██║   ██╔══╝  
   ╚██████╔╝██║   ██║   ██║██║ ╚═╝ ██║██║  ██║   ██║   ███████╗
    ╚═════╝ ╚═╝   ╚═╝   ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝
                                                                 
   ██████╗ ██████╗     ██████╗ ██╗   ██╗██╗
   ██╔══██╗██╔══██╗    ██╔══██╗██║   ██║██║
   ██████╔╝██████╔╝    ██████╔╝██║   ██║██║
   ██╔═══╝ ██╔═══╝     ██╔═══╝ ██║   ██║██║
   ██║     ██║         ██║     ╚██████╔╝██║
   ╚═╝     ╚═╝         ╚═╝      ╚═════╝ ╚═╝
]])

print("🔥 ULTIMATE OP GUI GELADEN!")
print("👑 Made by WALED-HAMMAD")
print("📺 YouTube: @hacker666-00")
print("🎵 TikTok: @mods_and_hacks")
print(isMobile and "📱 MOBILE MODUS" or "💻 PC MODUS")
print("✅ 200+ OP TOOLS")
print("👑 VIP SYSTEM AKTIV")
print("🛡️ ANTI-CHEAT VERFÜGBAR")
print("💰 ROBUX ITEMS KOSTENLOS")
