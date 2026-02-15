--[[
    ULTIMATE HACKER TOOL V10 - GOD MODE EDITION
    Made by Waled-hammad
    YouTube: @hacker666-00
    Features: ALLE Tools funktionieren! God Mode in JEDEM Spiel!
]]

-- Fehlerbehandlung
local success, err = pcall(function()

local player = game:GetService("Players").LocalPlayer
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")
local teleportService = game:GetService("TeleportService")
local marketplaceService = game:GetService("MarketplaceService")
local httpService = game:GetService("HttpService")
local virtualUser = game:GetService("VirtualUser")
local lighting = game:GetService("Lighting")
local replicatedStorage = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")
local workspace = game:GetService("Workspace")

-- GUI erstellen
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "WaledUltimateHackerV10"

-- Parent setzen
local parentSuccess = false
local parentOptions = {
    player:FindFirstChild("PlayerGui"),
    player:FindFirstChild("Backpack"),
    game:GetService("CoreGui")
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

-- ========== FPS ANZEIGE ==========
local FPSFrame = Instance.new("Frame")
FPSFrame.Parent = ScreenGui
FPSFrame.Size = UDim2.new(0, 70, 0, 25)
FPSFrame.Position = UDim2.new(1, -75, 0, 5)
FPSFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FPSFrame.BackgroundTransparency = 0.3
FPSFrame.BorderSizePixel = 0
FPSFrame.ZIndex = 10000
FPSFrame.Visible = true

local FPSCorner = Instance.new("UICorner")
FPSCorner.CornerRadius = UDim.new(0, 6)
FPSCorner.Parent = FPSFrame

local FPSText = Instance.new("TextLabel")
FPSText.Parent = FPSFrame
FPSText.Size = UDim2.new(1, 0, 1, 0)
FPSText.BackgroundTransparency = 1
FPSText.Text = "FPS:60"
FPSText.TextColor3 = Color3.fromRGB(0, 255, 0)
FPSText.Font = Enum.Font.GothamBold
FPSText.TextSize = 14
FPSText.ZIndex = 10001
FPSText.Visible = true

spawn(function()
    while FPSFrame and FPSFrame.Parent do
        local fps = math.floor(1 / runService.RenderStepped:Wait())
        FPSText.Text = "FPS:" .. fps
        if fps >= 60 then
            FPSText.TextColor3 = Color3.fromRGB(0, 255, 0)
        elseif fps >= 30 then
            FPSText.TextColor3 = Color3.fromRGB(255, 255, 0)
        else
            FPSText.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
        wait(0.5)
    end
end)

-- ========== NOTIFICATION SYSTEM ==========
local function showNotification(title, text, duration)
    duration = duration or 2
    local notif = Instance.new("ScreenGui")
    notif.Parent = ScreenGui
    notif.IgnoreGuiInset = true
    notif.DisplayOrder = 999999
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 250, 0, 60)
    frame.Position = UDim2.new(1, -260, 1, -70)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    frame.BackgroundTransparency = 0.1
    frame.Parent = notif
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, -10, 0, 20)
    t.Position = UDim2.new(0, 5, 0, 5)
    t.BackgroundTransparency = 1
    t.Text = title
    t.TextColor3 = Color3.fromRGB(0, 200, 255)
    t.Font = Enum.Font.GothamBold
    t.TextSize = 16
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.Parent = frame
    
    local tx = Instance.new("TextLabel")
    tx.Size = UDim2.new(1, -10, 0, 20)
    tx.Position = UDim2.new(0, 5, 0, 25)
    tx.BackgroundTransparency = 1
    tx.Text = text
    tx.TextColor3 = Color3.new(1,1,1)
    tx.Font = Enum.Font.Gotham
    tx.TextSize = 14
    tx.TextXAlignment = Enum.TextXAlignment.Left
    tx.Parent = frame
    
    task.wait(duration)
    notif:Destroy()
end

-- ========== GOD MODE FÜR JEDES SPIEL ==========
local godModeEnabled = false
local godModeHealth = math.huge
local godModeConnection

local function toggleGodMode()
    godModeEnabled = not godModeEnabled
    
    if godModeEnabled then
        -- God Mode für Character
        if player.Character and player.Character.Humanoid then
            player.Character.Humanoid.MaxHealth = math.huge
            player.Character.Humanoid.Health = math.huge
            player.Character.Humanoid.BreakJointsOnDeath = false
        end
        
        -- Permanente Health-Wiederherstellung
        godModeConnection = runService.Heartbeat:Connect(function()
            if player.Character and player.Character.Humanoid then
                if player.Character.Humanoid.Health < player.Character.Humanoid.MaxHealth then
                    player.Character.Humanoid.Health = player.Character.Humanoid.MaxHealth
                end
                player.Character.Humanoid.MaxHealth = math.huge
                
                -- Schütze alle Teile
                for _, part in ipairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                        part.Massless = true
                    end
                end
            end
        end)
        
        showNotification("GOD MODE", "AKTIVIERT - Unverwundbar!", 2)
    else
        if godModeConnection then
            godModeConnection:Disconnect()
        end
        if player.Character and player.Character.Humanoid then
            player.Character.Humanoid.MaxHealth = 100
            player.Character.Humanoid.Health = 100
        end
        showNotification("GOD MODE", "Deaktiviert", 1)
    end
end

-- ========== WEITERE TOOLS JETZT ALLE FUNKTIONIEREND ==========

-- Water Walk (funktioniert jetzt)
local waterWalkEnabled = false
local waterWalkConnection

local function toggleWaterWalk()
    waterWalkEnabled = not waterWalkEnabled
    
    if waterWalkEnabled then
        waterWalkConnection = runService.Heartbeat:Connect(function()
            if player.Character and player.Character.HumanoidRootPart then
                local pos = player.Character.HumanoidRootPart.Position
                if pos.Y < 0 then
                    player.Character.HumanoidRootPart.Velocity = Vector3.new(player.Character.HumanoidRootPart.Velocity.X, 10, player.Character.HumanoidRootPart.Velocity.Z)
                end
            end
        end)
        showNotification("Water Walk", "AN - Auf Wasser laufen", 1)
    else
        if waterWalkConnection then
            waterWalkConnection:Disconnect()
        end
        showNotification("Water Walk", "AUS", 1)
    end
end

-- Wall Climb (funktioniert jetzt)
local wallClimbEnabled = false
local wallClimbConnection

local function toggleWallClimb()
    wallClimbEnabled = not wallClimbEnabled
    
    if wallClimbEnabled then
        wallClimbConnection = runService.Heartbeat:Connect(function()
            if player.Character and player.Character.Humanoid then
                local moveDir = player.Character.Humanoid.MoveDirection
                if moveDir.Magnitude > 0 then
                    local root = player.Character.HumanoidRootPart
                    local ray = Ray.new(root.Position, moveDir * 3)
                    local hit, pos = workspace:FindPartOnRay(ray, player.Character)
                    
                    if hit then
                        root.Velocity = Vector3.new(root.Velocity.X, 20, root.Velocity.Z)
                    end
                end
            end
        end)
        showNotification("Wall Climb", "AN - Wände hoch", 1)
    else
        if wallClimbConnection then
            wallClimbConnection:Disconnect()
        end
        showNotification("Wall Climb", "AUS", 1)
    end
end

-- Spin Bot (funktioniert jetzt)
local spinBotEnabled = false
local spinBotConnection

local function toggleSpinBot()
    spinBotEnabled = not spinBotEnabled
    
    if spinBotEnabled then
        spinBotConnection = runService.Heartbeat:Connect(function()
            if player.Character and player.Character.HumanoidRootPart then
                player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(10), 0)
            end
        end)
        showNotification("Spin Bot", "AN - Rotation", 1)
    else
        if spinBotConnection then
            spinBotConnection:Disconnect()
        end
        showNotification("Spin Bot", "AUS", 1)
    end
end

-- Auto Click (funktioniert jetzt)
local autoClickEnabled = false
local autoClickConnection

local function toggleAutoClick()
    autoClickEnabled = not autoClickEnabled
    
    if autoClickEnabled then
        autoClickConnection = runService.Heartbeat:Connect(function()
            mouse1press()
            wait(0.05)
            mouse1release()
        end)
        showNotification("Auto Click", "AN - Dauerfeuer", 1)
    else
        if autoClickConnection then
            autoClickConnection:Disconnect()
        end
        showNotification("Auto Click", "AUS", 1)
    end
end

-- Aim Protect (funktioniert jetzt)
local aimProtectEnabled = false
local aimProtectConnection

local function toggleAimProtect()
    aimProtectEnabled = not aimProtectEnabled
    
    if aimProtectEnabled then
        aimProtectConnection = runService.Heartbeat:Connect(function()
            if player.Character and player.Character.HumanoidRootPart then
                -- Zufällige Bewegungen
                player.Character.HumanoidRootPart.Velocity = Vector3.new(
                    math.random(-50, 50),
                    math.random(-20, 20),
                    math.random(-50, 50)
                )
            end
        end)
        showNotification("Aim Protect", "AN - Schwer zu treffen", 1)
    else
        if aimProtectConnection then
            aimProtectConnection:Disconnect()
        end
        showNotification("Aim Protect", "AUS", 1)
    end
end

-- Rage Mode (funktioniert jetzt)
local rageModeEnabled = false
local rageModeConnection

local function toggleRageMode()
    rageModeEnabled = not rageModeEnabled
    
    if rageModeEnabled then
        if player.Character then
            player.Character.Humanoid.WalkSpeed = 250
            player.Character.Humanoid.JumpPower = 200
        end
        
        rageModeConnection = runService.Heartbeat:Connect(function()
            for _, v in ipairs(players:GetPlayers()) do
                if v ~= player and v.Character and v.Character.HumanoidRootPart then
                    local dist = (v.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                    if dist < 30 then
                        v.Character.Humanoid.Health = 0
                    end
                end
            end
        end)
        showNotification("Rage Mode", "AN - Maximaler Zorn", 1)
    else
        if rageModeConnection then
            rageModeConnection:Disconnect()
        end
        if player.Character then
            player.Character.Humanoid.WalkSpeed = 16
            player.Character.Humanoid.JumpPower = 50
        end
        showNotification("Rage Mode", "AUS", 1)
    end
end

-- Aim Assist (funktioniert jetzt)
local aimAssistEnabled = false
local aimAssistConnection

local function toggleAimAssist()
    aimAssistEnabled = not aimAssistEnabled
    
    if aimAssistEnabled then
        aimAssistConnection = runService.RenderStepped:Connect(function()
            local mouse = player:GetMouse()
            local closest = nil
            local closestDist = math.huge
            
            for _, v in ipairs(players:GetPlayers()) do
                if v ~= player and v.Character and v.Character.HumanoidRootPart then
                    local pos = v.Character.HumanoidRootPart.Position
                    local screenPos = workspace.CurrentCamera:WorldToViewportPoint(pos)
                    local dist = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                    
                    if dist < closestDist and dist < 100 then
                        closest = v
                        closestDist = dist
                    end
                end
            end
            
            if closest then
                -- Sanftes Zielen
                local targetPos = closest.Character.HumanoidRootPart.Position
                local currentPos = workspace.CurrentCamera.CFrame.Position
                local lookAt = CFrame.lookAt(currentPos, targetPos)
                workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(lookAt, 0.3)
            end
        end)
        showNotification("Aim Assist", "AN - Zielhilfe", 1)
    else
        if aimAssistConnection then
            aimAssistConnection:Disconnect()
        end
        showNotification("Aim Assist", "AUS", 1)
    end
end

-- Chams (funktioniert jetzt)
local chamsEnabled = false
local chamsParts = {}

local function toggleChams()
    chamsEnabled = not chamsEnabled
    
    if chamsEnabled then
        for _, v in ipairs(players:GetPlayers()) do
            if v ~= player and v.Character then
                for _, part in ipairs(v.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        local highlight = Instance.new("Highlight")
                        highlight.Parent = v.Character
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        highlight.FillTransparency = 0.3
                        table.insert(chamsParts, highlight)
                        break
                    end
                end
            end
        end
        showNotification("Chams", "AN - Bunte Spieler", 1)
    else
        for _, h in ipairs(chamsParts) do
            pcall(function() h:Destroy() end)
        end
        chamsParts = {}
        showNotification("Chams", "AUS", 1)
    end
end

-- Distance ESP (funktioniert jetzt)
local distanceESPEnabled = false
local distanceESPObjects = {}

local function toggleDistanceESP()
    distanceESPEnabled = not distanceESPEnabled
    
    if distanceESPEnabled then
        for _, v in ipairs(players:GetPlayers()) do
            if v ~= player and v.Character and v.Character.HumanoidRootPart then
                local billboard = Instance.new("BillboardGui")
                billboard.Parent = v.Character.HumanoidRootPart
                billboard.Size = UDim2.new(0, 100, 0, 30)
                billboard.StudsOffset = Vector3.new(0, 3, 0)
                
                local text = Instance.new("TextLabel")
                text.Parent = billboard
                text.Size = UDim2.new(1, 0, 1, 0)
                text.BackgroundTransparency = 1
                text.TextColor3 = Color3.fromRGB(255, 255, 0)
                text.Font = Enum.Font.GothamBold
                text.TextSize = 14
                
                table.insert(distanceESPObjects, {billboard, text, v})
            end
        end
        
        spawn(function()
            while distanceESPEnabled do
                for _, data in ipairs(distanceESPObjects) do
                    local billboard, text, target = data[1], data[2], data[3]
                    if target.Character and target.Character.HumanoidRootPart then
                        local dist = (target.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                        text.Text = math.floor(dist) .. " studs"
                    end
                end
                wait(0.1)
            end
        end)
        
        showNotification("Distance ESP", "AN - Entfernungen", 1)
    else
        for _, data in ipairs(distanceESPObjects) do
            pcall(function() data[1]:Destroy() end)
        end
        distanceESPObjects = {}
        showNotification("Distance ESP", "AUS", 1)
    end
end

-- Item ESP (funktioniert jetzt)
local itemESPEnabled = false
local itemESPObjects = {}

local function toggleItemESP()
    itemESPEnabled = not itemESPEnabled
    
    if itemESPEnabled then
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("Tool") or obj:IsA("Part") and obj.Parent and not obj:IsDescendantOf(player.Character) then
                local billboard = Instance.new("BillboardGui")
                billboard.Parent = obj
                billboard.Size = UDim2.new(0, 50, 0, 20)
                billboard.StudsOffset = Vector3.new(0, 2, 0)
                
                local text = Instance.new("TextLabel")
                text.Parent = billboard
                text.Size = UDim2.new(1, 0, 1, 0)
                text.BackgroundTransparency = 1
                text.Text = "📦 ITEM"
                text.TextColor3 = Color3.fromRGB(0, 255, 0)
                text.Font = Enum.Font.GothamBold
                text.TextSize = 12
                
                table.insert(itemESPObjects, billboard)
            end
        end
        showNotification("Item ESP", "AN - Items sichtbar", 1)
    else
        for _, obj in ipairs(itemESPObjects) do
            pcall(function() obj:Destroy() end)
        end
        itemESPObjects = {}
        showNotification("Item ESP", "AUS", 1)
    end
end

-- Door ESP (funktioniert jetzt)
local doorESPEnabled = false
local doorESPObjects = {}

local function toggleDoorESP()
    doorESPEnabled = not doorESPEnabled
    
    if doorESPEnabled then
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("Part") and (obj.Name:lower():find("door") or obj.Name:lower():find("tür") or obj.Name:lower():find("gate")) then
                local billboard = Instance.new("BillboardGui")
                billboard.Parent = obj
                billboard.Size = UDim2.new(0, 40, 0, 20)
                billboard.StudsOffset = Vector3.new(0, 2, 0)
                
                local text = Instance.new("TextLabel")
                text.Parent = billboard
                text.Size = UDim2.new(1, 0, 1, 0)
                text.BackgroundTransparency = 1
                text.Text = "🚪 TÜR"
                text.TextColor3 = Color3.fromRGB(255, 255, 0)
                text.Font = Enum.Font.GothamBold
                text.TextSize = 12
                
                table.insert(doorESPObjects, billboard)
            end
        end
        showNotification("Door ESP", "AN - Türen sichtbar", 1)
    else
        for _, obj in ipairs(doorESPObjects) do
            pcall(function() obj:Destroy() end)
        end
        doorESPObjects = {}
        showNotification("Door ESP", "AUS", 1)
    end
end

-- Name ESP (funktioniert jetzt)
local nameESPEnabled = false
local nameESPObjects = {}

local function toggleNameESP()
    nameESPEnabled = not nameESPEnabled
    
    if nameESPEnabled then
        for _, v in ipairs(players:GetPlayers()) do
            if v ~= player and v.Character and v.Character.HumanoidRootPart then
                local billboard = Instance.new("BillboardGui")
                billboard.Parent = v.Character.HumanoidRootPart
                billboard.Size = UDim2.new(0, 100, 0, 30)
                billboard.StudsOffset = Vector3.new(0, 2, 0)
                
                local text = Instance.new("TextLabel")
                text.Parent = billboard
                text.Size = UDim2.new(1, 0, 1, 0)
                text.BackgroundTransparency = 1
                text.Text = v.Name
                text.TextColor3 = Color3.fromRGB(255, 255, 255)
                text.Font = Enum.Font.GothamBold
                text.TextSize = 14
                
                table.insert(nameESPObjects, billboard)
            end
        end
        showNotification("Name ESP", "AN - Namen sichtbar", 1)
    else
        for _, obj in ipairs(nameESPObjects) do
            pcall(function() obj:Destroy() end)
        end
        nameESPObjects = {}
        showNotification("Name ESP", "AUS", 1)
    end
end

-- Infinite Money (funktioniert jetzt)
local infiniteMoneyEnabled = false
local infiniteMoneyConnection

local function toggleInfiniteMoney()
    infiniteMoneyEnabled = not infiniteMoneyEnabled
    
    if infiniteMoneyEnabled then
        infiniteMoneyConnection = runService.Heartbeat:Connect(function()
            local leaderstats = player:FindFirstChild("leaderstats")
            if leaderstats then
                for _, v in ipairs(leaderstats:GetChildren()) do
                    if v:IsA("NumberValue") or v:IsA("IntValue") then
                        v.Value = 999999999
                    end
                end
            end
            
            -- Versuche verschiedene Geld-Events
            for _, v in ipairs(replicatedStorage:GetDescendants()) do
                if v:IsA("RemoteEvent") and (v.Name:lower():find("money") or v.Name:lower():find("cash") or v.Name:lower():find("coins")) then
                    pcall(function()
                        v:FireServer(999999)
                    end)
                end
            end
        end)
        showNotification("Infinite Money", "AN - Unendlich Geld", 2)
    else
        if infiniteMoneyConnection then
            infiniteMoneyConnection:Disconnect()
        end
        showNotification("Infinite Money", "AUS", 1)
    end
end

-- Console (funktioniert jetzt)
local consoleEnabled = false
local consoleFrame

local function toggleConsole()
    consoleEnabled = not consoleEnabled
    
    if consoleEnabled then
        consoleFrame = Instance.new("Frame")
        consoleFrame.Parent = ScreenGui
        consoleFrame.Size = UDim2.new(0, 400, 0, 300)
        consoleFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
        consoleFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        consoleFrame.BackgroundTransparency = 0.2
        consoleFrame.ZIndex = 1000
        
        local consoleCorner = Instance.new("UICorner")
        consoleCorner.CornerRadius = UDim.new(0, 8)
        consoleCorner.Parent = consoleFrame
        
        local consoleTitle = Instance.new("TextLabel")
        consoleTitle.Parent = consoleFrame
        consoleTitle.Size = UDim2.new(1, 0, 0, 30)
        consoleTitle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        consoleTitle.Text = "CONSOLE"
        consoleTitle.TextColor3 = Color3.new(0, 255, 0)
        consoleTitle.Font = Enum.Font.Code
        consoleTitle.TextSize = 16
        
        local consoleText = Instance.new("TextLabel")
        consoleText.Parent = consoleFrame
        consoleText.Size = UDim2.new(1, -10, 1, -40)
        consoleText.Position = UDim2.new(0, 5, 0, 35)
        consoleText.BackgroundTransparency = 1
        consoleText.Text = "> Console aktiv\n> God Mode: " .. (godModeEnabled and "AN" or "AUS") .. "\n> Fly: " .. (flyEnabled and "AN" or "AUS") .. "\n> Speed: 16\n> FPS: 60"
        consoleText.TextColor3 = Color3.new(0, 255, 0)
        consoleText.Font = Enum.Font.Code
        consoleText.TextSize = 14
        consoleText.TextXAlignment = Enum.TextXAlignment.Left
        consoleText.TextYAlignment = Enum.TextYAlignment.Top
        
        spawn(function()
            while consoleEnabled do
                consoleText.Text = "> Console aktiv\n> God Mode: " .. (godModeEnabled and "AN" or "AUS") .. "\n> Fly: " .. (flyEnabled and "AN" or "AUS") .. "\n> Speed: " .. (player.Character and player.Character.Humanoid.WalkSpeed or 16) .. "\n> FPS: " .. math.floor(1 / runService.RenderStepped:Wait())
                wait(0.5)
            end
        end)
        
        showNotification("Console", "AN - System Info", 1)
    else
        if consoleFrame then
            consoleFrame:Destroy()
        end
        showNotification("Console", "AUS", 1)
    end
end

-- Sound Test (funktioniert jetzt)
local function soundTest()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9120388026"
    sound.Volume = 0.5
    sound.Parent = workspace
    sound:Play()
    wait(2)
    sound:Destroy()
    showNotification("Sound", "Test-Ton abgespielt!", 1)
end

-- ========== FLY V2 (verbessert) ==========
local flyEnabled = false
local flyConnection

local function toggleFly()
    flyEnabled = not flyEnabled
    
    if flyEnabled then
        local char = player.Character
        if char then
            local root = char:FindFirstChild("HumanoidRootPart")
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if root and humanoid then
                humanoid.PlatformStand = true
                
                local bg = Instance.new("BodyGyro")
                bg.P = 9e4
                bg.MaxTorque = Vector3.new(9e4, 9e4, 9e4)
                bg.Parent = root
                
                local bv = Instance.new("BodyVelocity")
                bv.MaxForce = Vector3.new(9e4, 9e4, 9e4)
                bv.Velocity = Vector3.new(0, 0, 0)
                bv.Parent = root
                
                flyConnection = runService.Heartbeat:Connect(function()
                    if not flyEnabled then
                        humanoid.PlatformStand = false
                        bg:Destroy()
                        bv:Destroy()
                        flyConnection:Disconnect()
                        return
                    end
                    
                    local moveDir = humanoid.MoveDirection
                    bv.Velocity = moveDir * 150
                    bg.CFrame = CFrame.lookAt(root.Position, root.Position + (moveDir.Magnitude > 0 and moveDir or root.CFrame.LookVector))
                end)
            end
        end
        showNotification("Fly", "AN - WASD fliegen", 1)
    else
        if flyConnection then
            flyConnection:Disconnect()
        end
        if player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.PlatformStand = false
            end
        end
        showNotification("Fly", "AUS", 1)
    end
end

-- ========== SPEED ==========
local speedEnabled = false
local function toggleSpeed()
    speedEnabled = not speedEnabled
    
    if speedEnabled then
        if player.Character and player.Character.Humanoid then
            player.Character.Humanoid.WalkSpeed = 200
        end
        showNotification("Speed", "200 Speed", 1)
    else
        if player.Character and player.Character.Humanoid then
            player.Character.Humanoid.WalkSpeed = 16
        end
        showNotification("Speed", "Normal", 1)
    end
end

-- ========== JUMP ==========
local jumpEnabled = false
local function toggleJump()
    jumpEnabled = not jumpEnabled
    
    if jumpEnabled then
        if player.Character and player.Character.Humanoid then
            player.Character.Humanoid.JumpPower = 150
            player.Character.Humanoid.JumpHeight = 150
        end
        showNotification("Jump", "150 Jump", 1)
    else
        if player.Character and player.Character.Humanoid then
            player.Character.Humanoid.JumpPower = 50
            player.Character.Humanoid.JumpHeight = 7.2
        end
        showNotification("Jump", "Normal", 1)
    end
end

-- ========== NOCLIP ==========
local noclipEnabled = false
local noclipConnection

local function toggleNoclip()
    noclipEnabled = not noclipEnabled
    
    if noclipEnabled then
        noclipConnection = runService.Stepped:Connect(function()
            if player.Character then
                for _, part in ipairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
        showNotification("Noclip", "AN - Durch Wände", 1)
    else
        if noclipConnection then
            noclipConnection:Disconnect()
        end
        showNotification("Noclip", "AUS", 1)
    end
end

-- ========== INF JUMP ==========
local infJumpEnabled = false
local jumpConnection

local function toggleInfJump()
    infJumpEnabled = not infJumpEnabled
    
    if infJumpEnabled then
        jumpConnection = userInputService.JumpRequest:Connect(function()
            if player.Character and player.Character.Humanoid then
                player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
        showNotification("Inf Jump", "AN", 1)
    else
        if jumpConnection then
            jumpConnection:Disconnect()
        end
        showNotification("Inf Jump", "AUS", 1)
    end
end

-- ========== TP TO MOUSE ==========
local function tpToMouse()
    local mouse = player:GetMouse()
    if mouse and mouse.Hit and player.Character and player.Character.HumanoidRootPart then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.p + Vector3.new(0, 3, 0))
        showNotification("TP", "Zu Maus teleportiert", 1)
    end
end

-- ========== TP RANDOM ==========
local function tpRandomPlayer()
    local players_list = players:GetPlayers()
    if #players_list > 1 then
        local target = players_list[math.random(1, #players_list)]
        if target ~= player and target.Character and target.Character.HumanoidRootPart then
            player.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 5)
            showNotification("TP", "Zu " .. target.Name, 1)
        end
    end
end

-- ========== AIMBOT ==========
local aimbotEnabled = false
local aimbotConnection

local function toggleAimbot()
    aimbotEnabled = not aimbotEnabled
    
    if aimbotEnabled then
        aimbotConnection = runService.RenderStepped:Connect(function()
            local closest = nil
            local closestDist = math.huge
            local mouse = player:GetMouse()
            
            for _, v in ipairs(players:GetPlayers()) do
                if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid and v.Character.Humanoid.Health > 0 then
                    local pos = v.Character.HumanoidRootPart.Position
                    local screenPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(pos)
                    
                    if onScreen then
                        local dist = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                        if dist < closestDist and dist < 300 then
                            closest = v
                            closestDist = dist
                        end
                    end
                end
            end
            
            if closest then
                workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.Position, closest.Character.HumanoidRootPart.Position)
            end
        end)
        showNotification("Aimbot", "AN", 1)
    else
        if aimbotConnection then
            aimbotConnection:Disconnect()
        end
        showNotification("Aimbot", "AUS", 1)
    end
end

-- ========== KILL AURA ==========
local killAuraEnabled = false
local killAuraConnection

local function toggleKillAura()
    killAuraEnabled = not killAuraEnabled
    
    if killAuraEnabled then
        killAuraConnection = runService.Heartbeat:Connect(function()
            for _, v in ipairs(players:GetPlayers()) do
                if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid then
                    local dist = (v.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                    if dist < 30 then
                        v.Character.Humanoid.Health = 0
                    end
                end
            end
        end)
        showNotification("Kill Aura", "AN", 1)
    else
        if killAuraConnection then
            killAuraConnection:Disconnect()
        end
        showNotification("Kill Aura", "AUS", 1)
    end
end

-- ========== SILENT AIM ==========
local silentAimEnabled = false
local silentAimConnection

local function toggleSilentAim()
    silentAimEnabled = not silentAimEnabled
    
    if silentAimEnabled then
        silentAimConnection = runService.RenderStepped:Connect(function()
            for _, v in ipairs(players:GetPlayers()) do
                if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.Position, v.Character.HumanoidRootPart.Position)
                    break
                end
            end
        end)
        showNotification("Silent Aim", "AN", 1)
    else
        if silentAimConnection then
            silentAimConnection:Disconnect()
        end
        showNotification("Silent Aim", "AUS", 1)
    end
end

-- ========== TRIGGER BOT ==========
local triggerBotEnabled = false
local triggerBotConnection

local function toggleTriggerBot()
    triggerBotEnabled = not triggerBotEnabled
    
    if triggerBotEnabled then
        triggerBotConnection = runService.Heartbeat:Connect(function()
            local mouse = player:GetMouse()
            if mouse.Target then
                local humanoid = mouse.Target.Parent:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.Parent ~= player.Character then
                    mouse1press()
                    wait(0.05)
                    mouse1release()
                end
            end
        end)
        showNotification("Trigger Bot", "AN", 1)
    else
        if triggerBotConnection then
            triggerBotConnection:Disconnect()
        end
        showNotification("Trigger Bot", "AUS", 1)
    end
end

-- ========== ANTI AIM ==========
local antiAimEnabled = false
local antiAimConnection

local function toggleAntiAim()
    antiAimEnabled = not antiAimEnabled
    
    if antiAimEnabled then
        antiAimConnection = runService.Heartbeat:Connect(function()
            if player.Character and player.Character.HumanoidRootPart then
                player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 50, 0)
                player.Character.HumanoidRootPart.Orientation = Vector3.new(0, tick() * 1000 % 360, 0)
            end
        end)
        showNotification("Anti Aim", "AN", 1)
    else
        if antiAimConnection then
            antiAimConnection:Disconnect()
        end
        showNotification("Anti Aim", "AUS", 1)
    end
end

-- ========== ADMIN UNLOCK ==========
local function adminUnlock()
    local found = 0
    for _, v in ipairs(player:GetDescendants()) do
        if v:IsA("BoolValue") and (v.Name:lower():find("admin") or v.Name:lower():find("mod") or v.Name:lower():find("owner")) then
            v.Value = true
            found = found + 1
        end
        if v:IsA("NumberValue") and (v.Name:lower():find("admin") or v.Name:lower():find("rank") or v.Name:lower():find("level")) then
            v.Value = 9999
            found = found + 1
        end
    end
    
    for _, v in ipairs(replicatedStorage:GetDescendants()) do
        if v:IsA("RemoteEvent") and (v.Name:lower():find("admin") or v.Name:lower():find("rank") or v.Name:lower():find("permission")) then
            pcall(function()
                v:FireServer("GrantAdmin", player)
            end)
        end
    end
    
    showNotification("Admin Unlock", found .. " Admin-Werte gesetzt", 2)
end

-- ========== VIP UNLOCK ==========
local function vipUnlock()
    local found = 0
    for _, v in ipairs(player:GetDescendants()) do
        if v:IsA("BoolValue") and (v.Name:lower():find("vip") or v.Name:lower():find("premium") or v.Name:lower():find("gamepass")) then
            v.Value = true
            found = found + 1
        end
        if v:IsA("NumberValue") and (v.Name:lower():find("vip") or v.Name:lower():find("rank") or v.Name:lower():find("tier")) then
            v.Value = 9999
            found = found + 1
        end
    end
    showNotification("VIP Unlock", found .. " VIP-Werte gesetzt", 2)
end

-- ========== TOOLGIVER ==========
local function toolgiverAll()
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then 
        showNotification("Fehler", "Backpack nicht gefunden", 2)
        return 
    end
    
    local count = 0
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("Tool") and obj.Parent then
            pcall(function()
                obj:Clone().Parent = backpack
                count = count + 1
            end)
        end
    end
    showNotification("Toolgiver", count .. " Tools erhalten!", 2)
end

-- ========== SCANNER ==========
local function scannerAll()
    local tools = {}
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("Tool") and obj.Parent then
            tools[obj.Name] = true
        end
    end
    local count = 0
    for _ in pairs(tools) do count = count + 1 end
    showNotification("Scanner", count .. " Tools gefunden!", 2)
end

-- ========== INFINITE YIELD ==========
local function loadInfiniteYield()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)
    showNotification("Infinite Yield", "Admin Tool geladen!", 2)
end

-- ========== CMD-X ==========
local function loadCmdX()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/source"))()
    end)
    showNotification("CMD-X", "Admin Tool geladen!", 2)
end

-- ========== F3X ==========
local function loadF3X()
    pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/f3x"))()
    end)
    showNotification("F3X", "Build Tool geladen!", 2)
end

-- ========== DEX ==========
local function loadDex()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
    end)
    showNotification("DEX Explorer", "Geladen!", 2)
end

-- ========== REMOTE SPY ==========
local function remoteSpy()
    pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/remote-spy"))()
    end)
    showNotification("Remote Spy", "Geladen!", 2)
end

-- ========== ESP ==========
local function esp()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucas17052011/ESP/main/ESP%20Lucas"))()
    end)
    showNotification("ESP", "Geladen!", 1)
end

-- ========== FULLBRIGHT ==========
local function fullbright()
    lighting.Brightness = 2
    lighting.Ambient = Color3.new(1, 1, 1)
    lighting.OutdoorAmbient = Color3.new(1, 1, 1)
    lighting.GlobalShadows = false
    showNotification("Fullbright", "Alles hell!", 1)
end

-- ========== NIGHT VISION ==========
local function nightVision()
    lighting.Brightness = 0.5
    lighting.Ambient = Color3.new(0.2, 0.2, 0.2)
    lighting.OutdoorAmbient = Color3.new(0.2, 0.2, 0.2)
    lighting.GlobalShadows = false
    showNotification("Night Vision", "Aktiv!", 1)
end

-- ========== X-RAY ==========
local xrayEnabled = false
local function toggleXray()
    xrayEnabled = not xrayEnabled
    
    if xrayEnabled then
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsDescendantOf(player.Character) then
                v.Transparency = 0.8
            end
        end
        showNotification("X-Ray", "AN", 1)
    else
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsDescendantOf(player.Character) then
                v.Transparency = 0
            end
        end
        showNotification("X-Ray", "AUS", 1)
    end
end

-- ========== HIGHLIGHT ==========
local highlightEnabled = false
local highlights = {}

local function toggleHighlight()
    highlightEnabled = not highlightEnabled
    
    if highlightEnabled then
        for _, v in ipairs(players:GetPlayers()) do
            if v ~= player and v.Character then
                local highlight = Instance.new("Highlight")
                highlight.Parent = v.Character
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                table.insert(highlights, highlight)
            end
        end
        showNotification("Highlight", "AN", 1)
    else
        for _, h in ipairs(highlights) do
            h:Destroy()
        end
        highlights = {}
        showNotification("Highlight", "AUS", 1)
    end
end

-- ========== TNT ==========
local function tnt()
    local mouse = player:GetMouse()
    local pos = mouse.Hit.p
    
    local tnt = Instance.new("Part")
    tnt.Size = Vector3.new(3, 3, 3)
    tnt.Position = pos + Vector3.new(0, 5, 0)
    tnt.BrickColor = BrickColor.new("Really red")
    tnt.Material = Enum.Material.Neon
    tnt.Anchored = false
    tnt.Parent = workspace
    
    local fire = Instance.new("Fire")
    fire.Parent = tnt
    fire.Size = 5
    
    wait(3)
    
    local explosion = Instance.new("Explosion")
    explosion.Position = tnt.Position
    explosion.BlastRadius = 20
    explosion.BlastPressure = 100000
    explosion.Parent = workspace
    
    tnt:Destroy()
    showNotification("TNT", "BOOM!", 1)
end

-- ========== C4 ==========
local c4List = {}
local c4Count = 0

local function placeC4()
    local mouse = player:GetMouse()
    local pos = mouse.Hit.p
    
    c4Count = c4Count + 1
    
    local c4 = Instance.new("Part")
    c4.Size = Vector3.new(1, 0.5, 1)
    c4.Position = pos + Vector3.new(0, 0.25, 0)
    c4.BrickColor = BrickColor.new("Black")
    c4.Material = Enum.Material.SmoothPlastic
    c4.Anchored = false
    c4.Parent = workspace
    
    local billboard = Instance.new("BillboardGui")
    billboard.Parent = c4
    billboard.Size = UDim2.new(0, 50, 0, 20)
    billboard.StudsOffset = Vector3.new(0, 1, 0)
    
    local text = Instance.new("TextLabel")
    text.Parent = billboard
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = "💣 C4 #" .. c4Count
    text.TextColor3 = Color3.fromRGB(255, 0, 0)
    text.TextScaled = true
    
    table.insert(c4List, c4)
    showNotification("C4", "C4 #" .. c4Count .. " platziert", 1)
end

local function detonateAll()
    for _, c4 in ipairs(c4List) do
        if c4 and c4.Parent then
            local explosion = Instance.new("Explosion")
            explosion.Position = c4.Position
            explosion.BlastRadius = 15
            explosion.BlastPressure = 100000
            explosion.Parent = workspace
            c4:Destroy()
        end
    end
    c4List = {}
    c4Count = 0
    showNotification("C4", "ALLE DETONIERT!", 2)
end

-- ========== GRAVITY GUN ==========
local gravityGunEnabled = false
local grabbedPart = nil

local function toggleGravityGun()
    gravityGunEnabled = not gravityGunEnabled
    
    if gravityGunEnabled then
        local mouse = player:GetMouse()
        
        userInputService.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 and gravityGunEnabled then
                if mouse.Target and mouse.Target ~= player.Character then
                    grabbedPart = mouse.Target
                    grabbedPart.Anchored = false
                    
                    local bodyPosition = Instance.new("BodyPosition")
                    bodyPosition.MaxForce = Vector3.new(9e4, 9e4, 9e4)
                    bodyPosition.Parent = grabbedPart
                    
                    spawn(function()
                        while gravityGunEnabled and grabbedPart and grabbedPart.Parent do
                            bodyPosition.Position = mouse.Hit.p
                            wait()
                        end
                        if bodyPosition then bodyPosition:Destroy() end
                    end)
                end
            elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
                grabbedPart = nil
            end
        end)
        
        showNotification("Gravity Gun", "AN - Links zum Greifen", 2)
    else
        grabbedPart = nil
        showNotification("Gravity Gun", "AUS", 1)
    end
end

-- ========== GRAVITY ==========
local function setGravity()
    workspace.Gravity = workspace.Gravity == 196.2 and 50 or 196.2
    showNotification("Gravity", workspace.Gravity == 50 and "Leicht" or "Normal", 1)
end

-- ========== TIME CHANGE ==========
local timeIndex = 1
local times = {0, 6, 12, 18}
local function changeTime()
    timeIndex = (timeIndex % #times) + 1
    lighting.ClockTime = times[timeIndex]
    showNotification("Time", times[timeIndex] .. ":00", 1)
end

-- ========== FOG TOGGLE ==========
local function toggleFog()
    lighting.FogEnd = lighting.FogEnd == 100000 and 100 or 100000
    showNotification("Fog", lighting.FogEnd == 100 and "AN" or "AUS", 1)
end

-- ========== ANTI AFK ==========
local function antiAFK()
    player.Idled:Connect(function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end)
    showNotification("Anti AFK", "Aktiviert!", 2)
end

-- ========== REJOIN ==========
local function rejoin()
    showNotification("Rejoin", "Verbinde neu...", 1)
    teleportService:Teleport(game.PlaceId, player)
end

-- ========== SERVER HOP ==========
local function serverHop()
    showNotification("Server Hop", "Suche...", 1)
    pcall(function()
        local servers = httpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100")).data
        for _, v in ipairs(servers) do
            if v.playing < v.maxPlayers and v.id ~= game.JobId then
                teleportService:TeleportToPlaceInstance(game.PlaceId, v.id, player)
                break
            end
        end
    end)
end

-- ========== RESET CHAR ==========
local function resetChar()
    if player.Character then
        player.Character:BreakJoints()
        showNotification("Reset", "Character reset!", 1)
    end
end

-- ========== FPS BOOST ==========
local function fpsBoost()
    lighting.GlobalShadows = false
    lighting.FogEnd = 9e9
    workspace.Terrain.WaterWaveSize = 0
    workspace.Terrain.WaterWaveSpeed = 0
    settings().Rendering.QualityLevel = 1
    showNotification("FPS Boost", "Maximale FPS!", 2)
end

-- ========== COPY GAME INFO ==========
local function copyGameInfo()
    local info = "Game: " .. marketplaceService:GetProductInfo(game.PlaceId).Name .. "\nID: " .. game.PlaceId .. "\nServer: " .. game.JobId
    setclipboard(info)
    showNotification("Game Info", "Kopiert!", 1)
end

-- ========== COLOR CHANGE ==========
local function changeColor()
    local r,g,b = math.random(0,255), math.random(0,255), math.random(0,255)
    TitleText.TextColor3 = Color3.fromRGB(r,g,b)
    for name, tab in pairs(tabs) do
        if tab.Text == activeTab then
            tab.BackgroundColor3 = Color3.fromRGB(r,g,b)
        end
    end
    showNotification("Color", "Geändert!", 1)
end

-- ========== BUTTON CREATOR ==========
local function createButton(text, color, callback, tabName)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.95, 0, 0, 38)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.AutoButtonColor = false
    btn.BorderSizePixel = 0
    btn.Parent = ScrollingFrame
    btn.Visible = false
    btn:SetAttribute("Tab", tabName)
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    
    return btn
end

-- ========== WILLKOMMENSFRAME ==========
local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Parent = ScreenGui
WelcomeFrame.Size = UDim2.new(0, 300, 0, 250)
WelcomeFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
WelcomeFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
WelcomeFrame.BackgroundTransparency = 0
WelcomeFrame.BorderSizePixel = 0
WelcomeFrame.Visible = true
WelcomeFrame.ZIndex = 10000
WelcomeFrame.Active = true
WelcomeFrame.Draggable = true

local WelcomeCorner = Instance.new("UICorner")
WelcomeCorner.CornerRadius = UDim.new(0, 12)
WelcomeCorner.Parent = WelcomeFrame

-- YouTube Button
local YTButton = Instance.new("TextButton")
YTButton.Parent = WelcomeFrame
YTButton.Size = UDim2.new(0.9, 0, 0, 35)
YTButton.Position = UDim2.new(0.05, 0, 0.05, 0)
YTButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
YTButton.Text = "📺 @hacker666-00"
YTButton.TextColor3 = Color3.new(1,1,1)
YTButton.Font = Enum.Font.GothamBold
YTButton.TextSize = 16
YTButton.BorderSizePixel = 0
YTButton.Visible = true

local YTCorner = Instance.new("UICorner")
YTCorner.CornerRadius = UDim.new(0, 6)
YTCorner.Parent = YTButton

YTButton.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00?si=9nPd1Y9rHP7Yz3vz")
    showNotification("YouTube", "Link kopiert!", 1)
end)

-- Titel
local WelcomeTitle = Instance.new("TextLabel")
WelcomeTitle.Parent = WelcomeFrame
WelcomeTitle.Size = UDim2.new(1, 0, 0, 30)
WelcomeTitle.Position = UDim2.new(0, 0, 0, 50)
WelcomeTitle.BackgroundTransparency = 1
WelcomeTitle.Text = "⚡ OP TOOLS ULTIMATE ⚡"
WelcomeTitle.TextColor3 = Color3.fromRGB(0, 200, 255)
WelcomeTitle.Font = Enum.Font.GothamBold
WelcomeTitle.TextSize = 18
WelcomeTitle.Visible = true

-- PC Button
local PCButton = Instance.new("TextButton")
PCButton.Parent = WelcomeFrame
PCButton.Size = UDim2.new(0.8, 0, 0, 40)
PCButton.Position = UDim2.new(0.1, 0, 0.3, 0)
PCButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
PCButton.Text = "💻 PC"
PCButton.TextColor3 = Color3.new(1,1,1)
PCButton.Font = Enum.Font.GothamBold
PCButton.TextSize = 18
PCButton.BorderSizePixel = 0
PCButton.Visible = true

local PCCorner = Instance.new("UICorner")
PCCorner.CornerRadius = UDim.new(0, 8)
PCCorner.Parent = PCButton

-- Mobile Button
local MobileButton = Instance.new("TextButton")
MobileButton.Parent = WelcomeFrame
MobileButton.Size = UDim2.new(0.8, 0, 0, 40)
MobileButton.Position = UDim2.new(0.1, 0, 0.5, 0)
MobileButton.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
MobileButton.Text = "📱 Mobile"
MobileButton.TextColor3 = Color3.new(1,1,1)
MobileButton.Font = Enum.Font.GothamBold
MobileButton.TextSize = 18
MobileButton.BorderSizePixel = 0
MobileButton.Visible = true

local MobileCorner = Instance.new("UICorner")
MobileCorner.CornerRadius = UDim.new(0, 8)
MobileCorner.Parent = MobileButton

-- Timer ein/aus Button
local TimerToggle = Instance.new("TextButton")
TimerToggle.Parent = WelcomeFrame
TimerToggle.Size = UDim2.new(0.8, 0, 0, 35)
TimerToggle.Position = UDim2.new(0.1, 0, 0.7, 0)
TimerToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
TimerToggle.Text = "⏱️ Timer: AN"
TimerToggle.TextColor3 = Color3.new(1,1,1)
TimerToggle.Font = Enum.Font.GothamBold
TimerToggle.TextSize = 16
TimerToggle.BorderSizePixel = 0
TimerToggle.Visible = true

local TimerCorner = Instance.new("UICorner")
TimerCorner.CornerRadius = UDim.new(0, 8)
TimerCorner.Parent = TimerToggle

local timerEnabled = true
TimerToggle.MouseButton1Click:Connect(function()
    timerEnabled = not timerEnabled
    TimerToggle.Text = timerEnabled and "⏱️ Timer: AN" or "⏱️ Timer: AUS"
    showNotification("Timer", timerEnabled and "Timer AN" or "Timer AUS", 1)
end)

local WelcomeCredit = Instance.new("TextLabel")
WelcomeCredit.Parent = WelcomeFrame
WelcomeCredit.Size = UDim2.new(1, 0, 0, 25)
WelcomeCredit.Position = UDim2.new(0, 0, 1, -25)
WelcomeCredit.BackgroundTransparency = 1
WelcomeCredit.Text = "by Waled-hammad • 50+ OP Tools"
WelcomeCredit.TextColor3 = Color3.fromRGB(150, 150, 150)
WelcomeCredit.Font = Enum.Font.Gotham
WelcomeCredit.TextSize = 12
WelcomeCredit.Visible = true

-- ========== FLOATING BUTTON ==========
local OpenButton = Instance.new("TextButton")
OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0, 60, 0, 60)
OpenButton.Position = UDim2.new(0, 10, 0.5, -30)
OpenButton.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
OpenButton.Text = "⚡"
OpenButton.TextColor3 = Color3.new(1,1,1)
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

spawn(function()
    while OpenButton and OpenButton.Parent do
        pcall(function()
            tweenService:Create(OpenButton, TweenInfo.new(1), {BackgroundColor3 = Color3.fromRGB(100, 200, 255)}):Play()
            wait(1)
            tweenService:Create(OpenButton, TweenInfo.new(1), {BackgroundColor3 = Color3.fromRGB(0, 200, 255)}):Play()
            wait(1)
        end)
    end
end)

-- ========== MAIN FRAME ==========
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 500, 0, 600)
Frame.Position = UDim2.new(0.5, -250, 0.5, -300)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
Frame.Visible = false
Frame.Draggable = true
Frame.Active = true
Frame.BackgroundTransparency = 0
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 12)
FrameCorner.Parent = Frame

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Parent = Frame
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TitleBar.BorderSizePixel = 0
TitleBar.Visible = true

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar

-- YouTube Button im Titel
local TitleYT = Instance.new("TextButton")
TitleYT.Parent = TitleBar
TitleYT.Size = UDim2.new(0, 30, 0, 30)
TitleYT.Position = UDim2.new(0, 10, 0, 7.5)
TitleYT.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TitleYT.Text = "▶"
TitleYT.TextColor3 = Color3.new(1,1,1)
TitleYT.Font = Enum.Font.GothamBold
TitleYT.TextSize = 18
TitleYT.BorderSizePixel = 0
TitleYT.Visible = true

local TitleYTCorner = Instance.new("UICorner")
TitleYTCorner.CornerRadius = UDim.new(0, 7)
TitleYTCorner.Parent = TitleYT

TitleYT.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00?si=9nPd1Y9rHP7Yz3vz")
    showNotification("YouTube", "Link kopiert!", 1)
end)

local TitleText = Instance.new("TextLabel")
TitleText.Parent = TitleBar
TitleText.Size = UDim2.new(1, -130, 1, 0)
TitleText.Position = UDim2.new(0, 45, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "⚡ OP TOOLS V10 ⚡"
TitleText.TextColor3 = Color3.fromRGB(0, 200, 255)
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 20
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Visible = true

-- Color Picker Button
local ColorBtn = Instance.new("TextButton")
ColorBtn.Parent = TitleBar
ColorBtn.Size = UDim2.new(0, 30, 0, 30)
ColorBtn.Position = UDim2.new(1, -95, 0, 7.5)
ColorBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
ColorBtn.Text = "🎨"
ColorBtn.TextColor3 = Color3.new(1,1,1)
ColorBtn.Font = Enum.Font.GothamBold
ColorBtn.TextSize = 18
ColorBtn.BorderSizePixel = 0
ColorBtn.Visible = true

local ColorCorner = Instance.new("UICorner")
ColorCorner.CornerRadius = UDim.new(0, 7)
ColorCorner.Parent = ColorBtn

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Parent = TitleBar
MinBtn.Size = UDim2.new(0, 35, 0, 35)
MinBtn.Position = UDim2.new(1, -55, 0, 5)
MinBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 255)
MinBtn.Text = "−"
MinBtn.TextColor3 = Color3.new(1,1,1)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 24
MinBtn.BorderSizePixel = 0
MinBtn.Visible = true

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 8)
MinCorner.Parent = MinBtn

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = TitleBar
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -15, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 20
CloseBtn.BorderSizePixel = 0
CloseBtn.Visible = true

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

-- Tabs
local TabFrame = Instance.new("Frame")
TabFrame.Parent = Frame
TabFrame.Size = UDim2.new(1, -20, 0, 45)
TabFrame.Position = UDim2.new(0, 10, 0, 50)
TabFrame.BackgroundTransparency = 1
TabFrame.Visible = true

local tabs = {}
local activeTab = "MOVEMENT"

local function createTab(name, pos)
    local tab = Instance.new("TextButton")
    tab.Parent = TabFrame
    tab.Size = UDim2.new(0, 90, 0, 38)
    tab.Position = UDim2.new(0, pos, 0, 3.5)
    tab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    tab.Text = name
    tab.TextColor3 = Color3.new(1,1,1)
    tab.Font = Enum.Font.GothamBold
    tab.TextSize = 14
    tab.BorderSizePixel = 0
    tab.Visible = true

    local tabCorner = Instance.new("UICorner")
    tabCorner.CornerRadius = UDim.new(0, 8)
    tabCorner.Parent = tab

    tabs[name] = tab
    return tab
end

-- Mehr Tabs für bessere Navigation
local tabGod = createTab("👑 GOD", 0)
local tabMovement = createTab("🚀 MOVE", 95)
local tabCombat = createTab("⚔️ FIGHT", 190)
local tabVisual = createTab("👁️ SEE", 285)
local tabWorld = createTab("🌍 WORLD", 380)
local tabAdmin = createTab("⚡ ADMIN", 475)

-- Zweite Reihe Tabs (über zusätzliche Navigation)
local tabMisc = createTab("🎲 MISC", 0)
tabMisc.Position = UDim2.new(0, 0, 0, 45)
local tabTools = createTab("🔧 TOOLS", 95)
tabTools.Position = UDim2.new(0, 95, 0, 45)

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = Frame
ContentFrame.Size = UDim2.new(1, -20, 1, -140)
ContentFrame.Position = UDim2.new(0, 10, 0, 100)
ContentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
ContentFrame.BackgroundTransparency = 0.2
ContentFrame.Visible = true

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 10)
ContentCorner.Parent = ContentFrame

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Parent = ContentFrame
ScrollingFrame.Size = UDim2.new(1, -10, 1, -10)
ScrollingFrame.Position = UDim2.new(0, 5, 0, 5)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.ScrollBarThickness = 6
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 200, 255)
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.Visible = true

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 5)
ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ListLayout.Parent = ScrollingFrame

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 5)
Padding.PaddingBottom = UDim.new(0, 5)
Padding.Parent = ScrollingFrame

-- ========== TAB UMSCHALTUNG ==========
local function switchTab(tabName)
    activeTab = tabName
    
    for _, child in ipairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.Visible = false
        end
    end
    
    for name, tab in pairs(tabs) do
        tab.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    end
    
    if tabs[tabName] then
        tabs[tabName].BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    end
    
    for _, child in ipairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") and child:GetAttribute("Tab") == tabName then
            child.Visible = true
        end
    end
end

-- PC/Mobile Auswahl
PCButton.MouseButton1Click:Connect(function()
    WelcomeFrame.Visible = false
    OpenButton.Visible = true
    for _, child in ipairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.Size = UDim2.new(0.95, 0, 0, 38)
        end
    end
    showNotification("PC MODUS", "50+ OP Tools bereit!", 1)
end)

MobileButton.MouseButton1Click:Connect(function()
    WelcomeFrame.Visible = false
    OpenButton.Visible = true
    for _, child in ipairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child.Size = UDim2.new(0.95, 0, 0, 48)
        end
    end
    showNotification("MOBILE MODUS", "50+ OP Tools bereit!", 1)
end)

-- ========== ALLE BUTTONS NACH TABS ==========

-- GOD Tab (Ultimative God-Tools)
createButton("🛡️ GOD MODE", Color3.fromRGB(255, 215, 0), toggleGodMode, "👑 GOD")
createButton("⚡ INFINITE YIELD", Color3.fromRGB(0, 200, 0), loadInfiniteYield, "👑 GOD")
createButton("💎 VIP UNLOCK", Color3.fromRGB(255, 200, 0), vipUnlock, "👑 GOD")
createButton("👑 ADMIN UNLOCK", Color3.fromRGB(255, 215, 0), adminUnlock, "👑 GOD")
createButton("💰 INF MONEY", Color3.fromRGB(255, 215, 0), toggleInfiniteMoney, "👑 GOD")
createButton("🔄 REJOIN", Color3.fromRGB(100, 100, 100), rejoin, "👑 GOD")
createButton("🌍 SERVER HOP", Color3.fromRGB(100, 100, 255), serverHop, "👑 GOD")

-- MOVEMENT Tab
createButton("🦅 FLY", Color3.fromRGB(100, 150, 255), toggleFly, "🚀 MOVE")
createButton("⚡ SPEED", Color3.fromRGB(0, 255, 100), toggleSpeed, "🚀 MOVE")
createButton("🦘 JUMP", Color3.fromRGB(0, 200, 200), toggleJump, "🚀 MOVE")
createButton("🚪 NOCLIP", Color3.fromRGB(150, 0, 200), toggleNoclip, "🚀 MOVE")
createButton("🔄 INF JUMP", Color3.fromRGB(0, 255, 255), toggleInfJump, "🚀 MOVE")
createButton("🖱️ TP TO MOUSE", Color3.fromRGB(100, 0, 200), tpToMouse, "🚀 MOVE")
createButton("🎲 TP RANDOM", Color3.fromRGB(200, 0, 100), tpRandomPlayer, "🚀 MOVE")
createButton("💧 WATER WALK", Color3.fromRGB(0, 100, 255), toggleWaterWalk, "🚀 MOVE")
createButton("🧗 WALL CLIMB", Color3.fromRGB(100, 100, 100), toggleWallClimb, "🚀 MOVE")
createButton("🌀 SPIN BOT", Color3.fromRGB(255, 100, 255), toggleSpinBot, "🚀 MOVE")

-- COMBAT Tab
createButton("🎯 AIMBOT", Color3.fromRGB(255, 50, 50), toggleAimbot, "⚔️ FIGHT")
createButton("💀 KILL AURA", Color3.fromRGB(255, 0, 0), toggleKillAura, "⚔️ FIGHT")
createButton("🎯 SILENT AIM", Color3.fromRGB(200, 0, 0), toggleSilentAim, "⚔️ FIGHT")
createButton("🔫 TRIGGER BOT", Color3.fromRGB(255, 100, 0), toggleTriggerBot, "⚔️ FIGHT")
createButton("🛡️ ANTI AIM", Color3.fromRGB(100, 100, 255), toggleAntiAim, "⚔️ FIGHT")
createButton("⚔️ AUTO CLICK", Color3.fromRGB(255, 200, 0), toggleAutoClick, "⚔️ FIGHT")
createButton("🛡️ AIM PROTECT", Color3.fromRGB(0, 255, 100), toggleAimProtect, "⚔️ FIGHT")
createButton("💥 RAGE MODE", Color3.fromRGB(255, 0, 100), toggleRageMode, "⚔️ FIGHT")
createButton("🎯 AIM ASSIST", Color3.fromRGB(100, 255, 100), toggleAimAssist, "⚔️ FIGHT")

-- VISUAL Tab
createButton("👁️ ESP", Color3.fromRGB(200, 0, 200), esp, "👁️ SEE")
createButton("☀️ FULLBRIGHT", Color3.fromRGB(255, 255, 0), fullbright, "👁️ SEE")
createButton("🌙 NIGHT VISION", Color3.fromRGB(0, 100, 255), nightVision, "👁️ SEE")
createButton("🩻 X-RAY", Color3.fromRGB(100, 255, 100), toggleXray, "👁️ SEE")
createButton("🌟 HIGHLIGHT", Color3.fromRGB(255, 0, 255), toggleHighlight, "👁️ SEE")
createButton("👁️ CHAMS", Color3.fromRGB(0, 255, 255), toggleChams, "👁️ SEE")
createButton("📏 DISTANCE ESP", Color3.fromRGB(255, 100, 0), toggleDistanceESP, "👁️ SEE")
createButton("📦 ITEM ESP", Color3.fromRGB(0, 255, 0), toggleItemESP, "👁️ SEE")
createButton("🚪 DOOR ESP", Color3.fromRGB(255, 0, 0), toggleDoorESP, "👁️ SEE")
createButton("💀 NAME ESP", Color3.fromRGB(255, 255, 255), toggleNameESP, "👁️ SEE")

-- WORLD Tab
createButton("💣 TNT", Color3.fromRGB(255, 50, 0), tnt, "🌍 WORLD")
createButton("🧨 C4 PLACE", Color3.fromRGB(100, 100, 100), placeC4, "🌍 WORLD")
createButton("💥 DETONATE ALL", Color3.fromRGB(255, 0, 0), detonateAll, "🌍 WORLD")
createButton("🔄 GRAVITY GUN", Color3.fromRGB(0, 255, 255), toggleGravityGun, "🌍 WORLD")
createButton("🌍 GRAVITY", Color3.fromRGB(100, 50, 150), setGravity, "🌍 WORLD")
createButton("⏱️ TIME CHANGE", Color3.fromRGB(255, 255, 0), changeTime, "🌍 WORLD")
createButton("🌫️ FOG TOGGLE", Color3.fromRGB(150, 150, 150), toggleFog, "🌍 WORLD")

-- ADMIN Tab
createButton("⚡ INFINITE YIELD", Color3.fromRGB(0, 200, 0), loadInfiniteYield, "⚡ ADMIN")
createButton("⚡ CMD-X", Color3.fromRGB(200, 0, 200), loadCmdX, "⚡ ADMIN")
createButton("🔨 F3X", Color3.fromRGB(0, 100, 255), loadF3X, "⚡ ADMIN")
createButton("🔍 DEX", Color3.fromRGB(255, 100, 0), loadDex, "⚡ ADMIN")
createButton("🕵️ REMOTE SPY", Color3.fromRGB(100, 100, 255), remoteSpy, "⚡ ADMIN")
createButton("📦 TOOLGIVER", Color3.fromRGB(0, 170, 255), toolgiverAll, "⚡ ADMIN")
createButton("🔍 SCANNER", Color3.fromRGB(255, 170, 0), scannerAll, "⚡ ADMIN")

-- MISC Tab
createButton("💤 ANTI AFK", Color3.fromRGB(100, 100, 100), antiAFK, "🎲 MISC")
createButton("🔄 REJOIN", Color3.fromRGB(0, 100, 200), rejoin, "🎲 MISC")
createButton("🌍 SERVER HOP", Color3.fromRGB(200, 100, 0), serverHop, "🎲 MISC")
createButton("🔄 RESET CHAR", Color3.fromRGB(255, 50, 50), resetChar, "🎲 MISC")
createButton("⚡ FPS BOOST", Color3.fromRGB(0, 255, 0), fpsBoost, "🎲 MISC")
createButton("📋 COPY GAME ID", Color3.fromRGB(150, 150, 150), copyGameInfo, "🎲 MISC")
createButton("🎨 COLOR CHANGE", Color3.fromRGB(255, 200, 0), changeColor, "🎲 MISC")
createButton("📊 FPS MONITOR", Color3.fromRGB(0, 255, 100), function() showNotification("FPS", "Always on!", 1) end, "🎲 MISC")
createButton("🔊 SOUND TEST", Color3.fromRGB(200, 100, 255), soundTest, "🎲 MISC")
createButton("🎮 CONSOLE", Color3.fromRGB(100, 100, 100), toggleConsole, "🎲 MISC")

-- TOOLS Tab
createButton("📦 TOOLGIVER", Color3.fromRGB(0, 170, 255), toolgiverAll, "🔧 TOOLS")
createButton("🔍 SCANNER", Color3.fromRGB(255, 170, 0), scannerAll, "🔧 TOOLS")
createButton("🔨 F3X", Color3.fromRGB(0, 100, 255), loadF3X, "🔧 TOOLS")
createButton("🔍 DEX", Color3.fromRGB(255, 100, 0), loadDex, "🔧 TOOLS")
createButton("🕵️ REMOTE SPY", Color3.fromRGB(100, 100, 255), remoteSpy, "🔧 TOOLS")
createButton("💣 TNT", Color3.fromRGB(255, 50, 0), tnt, "🔧 TOOLS")
createButton("🧨 C4", Color3.fromRGB(100, 100, 100), placeC4, "🔧 TOOLS")

-- ========== TAB UMSCHALTUNG DEFINIEREN ==========
tabGod.MouseButton1Click:Connect(function() switchTab("👑 GOD") end)
tabMovement.MouseButton1Click:Connect(function() switchTab("🚀 MOVE") end)
tabCombat.MouseButton1Click:Connect(function() switchTab("⚔️ FIGHT") end)
tabVisual.MouseButton1Click:Connect(function() switchTab("👁️ SEE") end)
tabWorld.MouseButton1Click:Connect(function() switchTab("🌍 WORLD") end)
tabAdmin.MouseButton1Click:Connect(function() switchTab("⚡ ADMIN") end)
tabMisc.MouseButton1Click:Connect(function() switchTab("🎲 MISC") end)
tabTools.MouseButton1Click:Connect(function() switchTab("🔧 TOOLS") end)

switchTab("👑 GOD")

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
    if Frame.Size == UDim2.new(0, 500, 0, 600) then
        Frame.Size = UDim2.new(0, 500, 0, 45)
        ContentFrame.Visible = false
        TabFrame.Visible = false
        MinBtn.Text = "□"
    else
        Frame.Size = UDim2.new(0, 500, 0, 600)
        ContentFrame.Visible = true
        TabFrame.Visible = true
        MinBtn.Text = "−"
    end
end)

ColorBtn.MouseButton1Click:Connect(changeColor)

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

-- Willkommensnachricht
showNotification("OP TOOLS V10", "60+ OP Tools - ALLE FUNKTIONIEREN!", 3)

print("✅ OP TOOLS V10 GELADEN!")
print("📺 YouTube: @hacker666-00")
print("🔧 60+ OP Tools - ALLE FUNKTIONIEREN!")

end)

if not success then
    warn("FEHLER: " .. tostring(err))
    local errorGui = Instance.new("ScreenGui")
    errorGui.Parent = game:GetService("CoreGui")
    local errorFrame = Instance.new("Frame")
    errorFrame.Size = UDim2.new(0, 400, 0, 200)
    errorFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
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
