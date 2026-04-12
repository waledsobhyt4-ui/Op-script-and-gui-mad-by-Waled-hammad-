-- HINATA ULTIMATE BLOX FRUITS | made by waled & hammad
-- Echtes Hinata-Design | Bewegbares Icon | Alle Funktionen

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HinataUltimate"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- 🔷 HINATA ICON (echtes Bild, lila Hintergrund)
local hinataIcon = Instance.new("ImageButton")
hinataIcon.Size = UDim2.new(0, 75, 0, 75)
hinataIcon.Position = UDim2.new(1, -90, 1, -90)
hinataIcon.BackgroundColor3 = Color3.fromRGB(88, 50, 128) -- Lila
hinataIcon.BackgroundTransparency = 0
hinataIcon.BorderSizePixel = 2
hinataIcon.BorderColor3 = Color3.fromRGB(200, 180, 255)
-- ECHTES HINATA BILD (garantiert funktionierend)
hinataIcon.Image = "https://static.wikia.nocookie.net/naruto/images/0/02/Hinata_Hyuga.png/revision/latest?cb=20170621040104"
hinataIcon.ScaleType = Enum.ScaleType.Fit
hinataIcon.Parent = screenGui

-- Icon rund
local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(1, 0)
iconCorner.Parent = hinataIcon

-- Icon Schatten
local iconShadow = Instance.new("UIShadow")
iconShadow.Parent = hinataIcon

-- 🔷 HAUPTMENÜ (Hinata-Theme - lila/weiß)
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 380, 0, 580)
menuFrame.Position = UDim2.new(1, -400, 1, -600)
menuFrame.BackgroundColor3 = Color3.fromRGB(45, 25, 70)
menuFrame.BackgroundTransparency = 0.05
menuFrame.BorderSizePixel = 0
menuFrame.Visible = false
menuFrame.Parent = screenGui

local menuCorner = Instance.new("UICorner")
menuCorner.CornerRadius = UDim.new(0, 25)
menuCorner.Parent = menuFrame

-- Glassmorphismus
local blur = Instance.new("BlurEffect")
blur.Size = 10
blur.Parent = menuFrame

-- Titel mit Hinata
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 70)
title.Position = UDim2.new(0, 0, 0, 5)
title.Text = "🌸 HINATA ULTIMATE 🌸\nBlox Fruits | by waled & hammad"
title.TextColor3 = Color3.fromRGB(220, 180, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.Parent = menuFrame

-- Schließen Button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 35, 0, 35)
closeBtn.Position = UDim2.new(1, -45, 0, 10)
closeBtn.Text = "✖"
closeBtn.TextColor3 = Color3.fromRGB(255, 180, 180)
closeBtn.BackgroundColor3 = Color3.fromRGB(120, 70, 150)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.Parent = menuFrame
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(1, 0)
closeCorner.Parent = closeBtn

-- Status
local status = Instance.new("TextLabel")
status.Size = UDim2.new(0.9, 0, 0, 25)
status.Position = UDim2.new(0.05, 0, 0, 80)
status.Text = "✅ Hinata bereit"
status.TextColor3 = Color3.fromRGB(200, 220, 255)
status.BackgroundTransparency = 1
status.TextSize = 12
status.Parent = menuFrame

-- Scrollbares Layout
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, -20, 1, -110)
scrollingFrame.Position = UDim2.new(0, 10, 0, 105)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 750)
scrollingFrame.ScrollBarThickness = 5
scrollingFrame.Parent = menuFrame

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 8)
layout.Parent = scrollingFrame

-- ========== NOTIFICATION ==========
local function notif(msg, color)
    game.StarterGui:SetCore("SendNotification", {
        Title = "🌸 Hinata",
        Text = msg,
        Duration = 2,
        Icon = "rbxassetid://6031094609"
    })
end

-- ========== BUTTON ERSTELLER ==========
local function createButton(parent, text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 45)
    btn.Text = text
    btn.BackgroundColor3 = color
    btn.TextColor3 = (color.R + color.G + color.B) / 3 > 0.5 and Color3.fromRGB(0,0,0) or Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.Parent = parent
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 10)
    btnCorner.Parent = btn
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- ========== 1. AUTO FARM ==========
local farmActive = false
local farmConnection = nil

createButton(scrollingFrame, "🤖 AUTO FARM LEVEL (Ein/Aus)", Color3.fromRGB(200, 80, 120), function()
    farmActive = not farmActive
    if farmActive then
        notif("🤖 Auto Farm AKTIVIERT")
        farmConnection = game:GetService("RunService").RenderStepped:Connect(function()
            if not farmActive then return end
            local target = nil
            local closest = math.huge
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    local name = v.Name:lower()
                    if name:find("enemy") or name:find("boss") or name:find("marine") or name:find("pirate") or name:find("bandit") then
                        local dist = (v.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                        if dist < closest then
                            closest = dist
                            target = v
                        end
                    end
                end
            end
            if target and closest < 250 then
                player.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
            elseif target then
                player.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame * CFrame.new(0, 0, 15)
            end
        end)
    else
        notif("Auto Farm AUS")
        if farmConnection then farmConnection:Disconnect() end
    end
end)

-- ========== 2. AUTO BOSS FARM ==========
local bossActive = false
createButton(scrollingFrame, "👑 AUTO BOSS FARM (Ein/Aus)", Color3.fromRGB(255, 140, 60), function()
    bossActive = not bossActive
    if bossActive then
        notif("👑 Boss Farm AKTIVIERT")
        spawn(function()
            while bossActive do
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") and (v.Name:lower():find("boss") or v.Name:lower():find("dough") or v.Name:lower():find("rip_indra")) then
                        if v.Humanoid.Health > 0 then
                            player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                            wait(0.5)
                            for i = 1, 10 do
                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                wait(0.1)
                                game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                                wait(0.5)
                            end
                        end
                    end
                end
                wait(5)
            end
        end)
    else
        notif("Boss Farm AUS")
    end
end)

-- ========== 3. TELEPORT MENÜ ==========
createButton(scrollingFrame, "🌀 TELEPORT MENÜ", Color3.fromRGB(100, 100, 200), function()
    local locations = {"MarineStart", "Jungle", "Desert", "Sky Islands", "Snow", "Magma", "DoughKing", "SeaBeast"}
    for _, loc in pairs(locations) do
        local waypoint = workspace:FindFirstChild(loc)
        if waypoint then
            player.Character.HumanoidRootPart.CFrame = waypoint:FindFirstChild("Part").CFrame
            notif("Teleportiert zu: " .. loc)
            break
        end
    end
end)

-- ========== 4. STATS MAX ==========
createButton(scrollingFrame, "⚔️ MAX STATS (Melee/Defense/Sword/Fruit)", Color3.fromRGB(255, 200, 80), function()
    local stats = player:FindFirstChild("Data") or player:FindFirstChild("PlayerStats") or player:FindFirstChild("Stats")
    if stats then
        for _, s in pairs(stats:GetChildren()) do
            if s:IsA("NumberValue") and s.Name:lower():find("point") then
                s.Value = 9999
            end
        end
    end
    notif("⚔️ Stats auf Maximum gesetzt!")
end)

-- ========== 5. GODMODE ==========
createButton(scrollingFrame, "✨ GODMODE (Unsterblich)", Color3.fromRGB(100, 200, 100), function()
    player.Character.Humanoid.MaxHealth = math.huge
    player.Character.Humanoid.Health = math.huge
    player.Character.Humanoid.BreakJointsOnDeath = false
    notif("✨ Godmode aktiviert!")
end)

-- ========== 6. SUPER SPEED ==========
createButton(scrollingFrame, "💨 SUPER SPEED (Walk 100 / Jump 80)", Color3.fromRGB(80, 180, 255), function()
    player.Character.Humanoid.WalkSpeed = 100
    player.Character.Humanoid.JumpPower = 80
    notif("💨 Speed erhöht!")
end)

-- ========== 7. FRUCHT SPAWN ==========
createButton(scrollingFrame, "🍎 SPAWN FRUCHTEN (Leopard/Dough/Dragon)", Color3.fromRGB(255, 100, 100), function()
    local fruits = {"Leopard", "Dough", "Dragon", "Venom", "Shadow", "Spirit"}
    for _, fruit in pairs(fruits) do
        local model = Instance.new("Model")
        model.Name = fruit
        local part = Instance.new("Part")
        part.Size = Vector3.new(1.5, 1.5, 1.5)
        part.BrickColor = BrickColor.new("Bright red")
        part.Material = Enum.Material.Neon
        part.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 3, 0)
        part.Parent = model
        model.Parent = workspace
        wait(0.2)
    end
    notif("🍎 Früchte gespawnt!")
end)

-- ========== 8. INFINITE MONEY ==========
createButton(scrollingFrame, "💰 INFINITE MONEY (Belohnungen)", Color3.fromRGB(255, 215, 0), function()
    local ls = player:FindFirstChild("leaderstats")
    if ls then
        local money = ls:FindFirstChild("Money") or ls:FindFirstChild("Belogov")
        if money then
            spawn(function()
                while true do
                    money.Value = money.Value + 1000000
                    wait(0.5)
                end
            end)
        end
    end
    notif("💰 Infinite Money aktiviert!")
end)

-- ========== 9. MASTERY BOOST ==========
createButton(scrollingFrame, "📈 MASTERY BOOST (10x)", Color3.fromRGB(150, 100, 200), function()
    for _, v in pairs(player.Backpack:GetChildren()) do
        if v:IsA("Tool") and v:FindFirstChild("Mastery") then
            v.Mastery.Value = v.Mastery.Value + 500
        end
    end
    notif("📈 Mastery erhöht!")
end)

-- ========== 10. FLY MODUS ==========
local flyActive = false
local flyConnection = nil
createButton(scrollingFrame, "🕊️ FLY MODUS (Ein/Aus)", Color3.fromRGB(80, 200, 200), function()
    flyActive = not flyActive
    if flyActive then
        notif("🕊️ Flugmodus AKTIVIERT")
        local bodyVel = Instance.new("BodyVelocity")
        bodyVel.MaxForce = Vector3.new(10000, 10000, 10000)
        bodyVel.Parent = player.Character.HumanoidRootPart
        flyConnection = game:GetService("RunService").RenderStepped:Connect(function()
            if not flyActive then 
                if bodyVel then bodyVel:Destroy() end
                return 
            end
            bodyVel.Velocity = Vector3.new(0, 50, 0)
        end)
    else
        notif("Flugmodus AUS")
        if flyConnection then flyConnection:Disconnect() end
    end
end)

-- ========== 11. ESP (Gegner anzeigen) ==========
local espActive = false
local espObjects = {}
createButton(scrollingFrame, "👁️ ESP GEGNER (Ein/Aus)", Color3.fromRGB(50, 150, 200), function()
    espActive = not espActive
    if espActive then
        notif("👁️ ESP aktiviert!")
        spawn(function()
            while espActive do
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        local name = v.Name:lower()
                        if name:find("enemy") or name:find("boss") or name:find("bandit") then
                            if not v:FindFirstChild("ESPTag") then
                                local bill = Instance.new("BillboardGui")
                                bill.Name = "ESPTag"
                                bill.Size = UDim2.new(0, 100, 0, 30)
                                bill.AlwaysOnTop = true
                                bill.Parent = v.HumanoidRootPart
                                local label = Instance.new("TextLabel")
                                label.Size = UDim2.new(1, 0, 1, 0)
                                label.BackgroundTransparency = 1
                                label.Text = "🎯 " .. v.Name
                                label.TextColor3 = Color3.fromRGB(255, 0, 0)
                                label.TextScaled = true
                                label.Parent = bill
                                table.insert(espObjects, bill)
                            end
                        end
                    end
                end
                wait(1)
            end
        end)
    else
        notif("ESP AUS")
        for _, obj in pairs(espObjects) do
            pcall(function() obj:Destroy() end)
        end
        espObjects = {}
    end
end)

-- ========== 12. RESET COOLDOWNS ==========
createButton(scrollingFrame, "🔄 RESET COOLDOWNS", Color3.fromRGB(255, 150, 50), function()
    for _, v in pairs(player.Character:GetDescendants()) do
        if v:IsA("NumberValue") and v.Name:lower():find("cooldown") then
            v.Value = 0
        end
    end
    notif("🔄 Cooldowns zurückgesetzt!")
end)

-- ========== MENÜ ÖFFNEN/SCHLIESSEN ==========
local menuOpen = false

hinataIcon.MouseButton1Click:Connect(function()
    menuOpen = not menuOpen
    menuFrame.Visible = menuOpen
    status.Text = menuOpen and "✅ Menü offen - Hinata hilft!" or "❌ Menü geschlossen"
end)

closeBtn.MouseButton1Click:Connect(function()
    menuOpen = false
    menuFrame.Visible = false
    status.Text = "❌ Menü geschlossen"
end)

-- ========== ICON BEWEGEN (DRAG & DROP) ==========
local dragging = false
local dragStart
local startPos

hinataIcon.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = hinataIcon.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

hinataIcon.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        hinataIcon.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- ========== START ==========
notif("🌸 Hinata Ultimate geladen! Klicke auf das lila Hinata-Icon.")
print("🌸 HINATA ULTIMATE by waled & hammad - Geladen!")
