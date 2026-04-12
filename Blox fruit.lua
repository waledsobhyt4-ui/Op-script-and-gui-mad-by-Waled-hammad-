-- HINATA BLOX FRUITS ULTIMATE | made by waled & hammad
-- Mit offiziellem Hinata-Bild von Fandom

-- Loadstring:
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/waledsobhyt4-ui/Op-script-and-gui-mad-by-Waled-hammad-/refs/heads/main/Hinata_Blox_Fruits.lua"))()

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- GUI erstellen
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HinataBloxFruits"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- 🔷 HINATA ICON (mit ECHTEM Bild von Fandom)
local hinataIcon = Instance.new("ImageButton")
hinataIcon.Size = UDim2.new(0, 70, 0, 70)
hinataIcon.Position = UDim2.new(1, -85, 1, -85)
hinataIcon.BackgroundColor3 = Color3.fromRGB(255, 200, 230)
hinataIcon.BackgroundTransparency = 0.1
hinataIcon.BorderSizePixel = 0
hinataIcon.Image = "https://static.wikia.nocookie.net/denaruto3/images/e/e1/Hinata2.png/revision/latest?cb=20110713060912&path-prefix=de"
hinataIcon.ScaleType = Enum.ScaleType.Fit
hinataIcon.Parent = screenGui

-- Icon rund machen
local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(1, 0)
iconCorner.Parent = hinataIcon

-- Icon Schatten (schick)
local iconShadow = Instance.new("UIShadow")
iconShadow.Parent = hinataIcon

-- 🔷 HAUPTMENÜ (Hinata-Design)
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 350, 0, 520)
menuFrame.Position = UDim2.new(1, -370, 1, -540)
menuFrame.BackgroundColor3 = Color3.fromRGB(66, 30, 82) -- Hinata-lila
menuFrame.BackgroundTransparency = 0.08
menuFrame.BorderSizePixel = 0
menuFrame.Visible = false
menuFrame.Parent = screenGui

local menuCorner = Instance.new("UICorner")
menuCorner.CornerRadius = UDim.new(0, 20)
menuCorner.Parent = menuFrame

-- Titel
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.Position = UDim2.new(0, 0, 0, 5)
title.Text = "🌸 HINATA BLOX FRUITS 🌸\nby waled & hammad"
title.TextColor3 = Color3.fromRGB(255, 210, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 15
title.Parent = menuFrame

-- Schließen-Button (im Menü)
local closeMenuBtn = Instance.new("TextButton")
closeMenuBtn.Size = UDim2.new(0, 35, 0, 35)
closeMenuBtn.Position = UDim2.new(1, -45, 0, 10)
closeMenuBtn.Text = "✖"
closeMenuBtn.TextColor3 = Color3.fromRGB(255, 150, 150)
closeMenuBtn.BackgroundColor3 = Color3.fromRGB(100, 50, 120)
closeMenuBtn.Font = Enum.Font.GothamBold
closeMenuBtn.TextSize = 18
closeMenuBtn.Parent = menuFrame
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(1, 0)
closeCorner.Parent = closeMenuBtn

-- Status-Text
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0.9, 0, 0, 25)
statusLabel.Position = UDim2.new(0.05, 0, 0, 70)
statusLabel.Text = "✅ Bereit"
statusLabel.TextColor3 = Color3.fromRGB(200, 255, 200)
statusLabel.BackgroundTransparency = 1
statusLabel.TextSize = 12
statusLabel.Parent = menuFrame

-- ========== 🔷 BUTTONS ==========

-- Auto Farm (Level)
local autoFarmBtn = Instance.new("TextButton")
autoFarmBtn.Size = UDim2.new(0.9, 0, 0, 45)
autoFarmBtn.Position = UDim2.new(0.05, 0, 0, 110)
autoFarmBtn.Text = "🤖 AUTO FARM LEVEL"
autoFarmBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 150)
autoFarmBtn.TextColor3 = Color3.fromRGB(255,255,255)
autoFarmBtn.Font = Enum.Font.GothamBold
autoFarmBtn.TextSize = 14
autoFarmBtn.Parent = menuFrame
local afCorner = Instance.new("UICorner")
afCorner.CornerRadius = UDim.new(0, 10)
afCorner.Parent = autoFarmBtn

local autoActive = false
autoFarmBtn.MouseButton1Click:Connect(function()
    autoActive = not autoActive
    if autoActive then
        autoFarmBtn.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
        autoFarmBtn.Text = "🤖 AUTO FARM (AN)"
        spawn(function()
            while autoActive do
                local target = nil
                local closest = math.huge
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        local name = v.Name:lower()
                        if name:find("enemy") or name:find("boss") or name:find("marine") or name:find("pirate") then
                            local dist = (v.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                            if dist < closest then
                                closest = dist
                                target = v
                            end
                        end
                    end
                end
                if target and closest < 200 then
                    player.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                    wait(0.2)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                    wait(0.1)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                elseif target then
                    player.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame * CFrame.new(0, 0, 10)
                end
                wait(1)
            end
        end)
    else
        autoFarmBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 150)
        autoFarmBtn.Text = "🤖 AUTO FARM LEVEL"
    end
end)

-- Teleport zu Boss
local teleportBtn = Instance.new("TextButton")
teleportBtn.Size = UDim2.new(0.9, 0, 0, 45)
teleportBtn.Position = UDim2.new(0.05, 0, 0, 165)
teleportBtn.Text = "🌀 TELEPORT ZU BOSS"
teleportBtn.BackgroundColor3 = Color3.fromRGB(150, 100, 200)
teleportBtn.TextColor3 = Color3.fromRGB(255,255,255)
teleportBtn.Font = Enum.Font.GothamBold
teleportBtn.TextSize = 14
teleportBtn.Parent = menuFrame
local tpCorner = Instance.new("UICorner")
tpCorner.CornerRadius = UDim.new(0, 10)
tpCorner.Parent = teleportBtn

teleportBtn.MouseButton1Click:Connect(function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and (v.Name:lower():find("boss") or v.Name:lower():find("dough")) then
            player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
            break
        end
    end
end)

-- Godmode
local godmodeBtn = Instance.new("TextButton")
godmodeBtn.Size = UDim2.new(0.9, 0, 0, 45)
godmodeBtn.Position = UDim2.new(0.05, 0, 0, 220)
godmodeBtn.Text = "✨ GODMODE (Unsterblich)"
godmodeBtn.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
godmodeBtn.TextColor3 = Color3.fromRGB(0,0,0)
godmodeBtn.Font = Enum.Font.GothamBold
godmodeBtn.TextSize = 14
godmodeBtn.Parent = menuFrame
local gmCorner = Instance.new("UICorner")
gmCorner.CornerRadius = UDim.new(0, 10)
gmCorner.Parent = godmodeBtn

godmodeBtn.MouseButton1Click:Connect(function()
    player.Character.Humanoid.MaxHealth = math.huge
    player.Character.Humanoid.Health = math.huge
    player.Character.Humanoid.BreakJointsOnDeath = false
end)

-- Max Stats
local statsBtn = Instance.new("TextButton")
statsBtn.Size = UDim2.new(0.9, 0, 0, 45)
statsBtn.Position = UDim2.new(0.05, 0, 0, 275)
statsBtn.Text = "⚔️ MAX STATS (Melee/Defense)"
statsBtn.BackgroundColor3 = Color3.fromRGB(255, 180, 80)
statsBtn.TextColor3 = Color3.fromRGB(0,0,0)
statsBtn.Font = Enum.Font.GothamBold
statsBtn.TextSize = 14
statsBtn.Parent = menuFrame
local stCorner = Instance.new("UICorner")
stCorner.CornerRadius = UDim.new(0, 10)
stCorner.Parent = statsBtn

statsBtn.MouseButton1Click:Connect(function()
    local stats = player:FindFirstChild("Data") or player:FindFirstChild("PlayerStats")
    if stats then
        for _, s in pairs(stats:GetChildren()) do
            if s:IsA("NumberValue") then
                s.Value = 9999
            end
        end
    end
end)

-- Super Speed
local speedBtn = Instance.new("TextButton")
speedBtn.Size = UDim2.new(0.9, 0, 0, 45)
speedBtn.Position = UDim2.new(0.05, 0, 0, 330)
speedBtn.Text = "💨 SUPER SPEED (Walk/Jump)"
speedBtn.BackgroundColor3 = Color3.fromRGB(80, 180, 255)
speedBtn.TextColor3 = Color3.fromRGB(0,0,0)
speedBtn.Font = Enum.Font.GothamBold
speedBtn.TextSize = 14
speedBtn.Parent = menuFrame
local spCorner = Instance.new("UICorner")
spCorner.CornerRadius = UDim.new(0, 10)
spCorner.Parent = speedBtn

speedBtn.MouseButton1Click:Connect(function()
    player.Character.Humanoid.WalkSpeed = 100
    player.Character.Humanoid.JumpPower = 80
end)

-- Fruit Spawn
local fruitBtn = Instance.new("TextButton")
fruitBtn.Size = UDim2.new(0.9, 0, 0, 45)
fruitBtn.Position = UDim2.new(0.05, 0, 0, 385)
fruitBtn.Text = "🍎 SPAWN FRUCHT (Leopard/Dough)"
fruitBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 120)
fruitBtn.TextColor3 = Color3.fromRGB(255,255,255)
fruitBtn.Font = Enum.Font.GothamBold
fruitBtn.TextSize = 14
fruitBtn.Parent = menuFrame
local frCorner = Instance.new("UICorner")
frCorner.CornerRadius = UDim.new(0, 10)
frCorner.Parent = fruitBtn

fruitBtn.MouseButton1Click:Connect(function()
    local fruits = {"Leopard", "Dough", "Dragon", "Venom"}
    for _, fruit in pairs(fruits) do
        local model = Instance.new("Model")
        model.Name = fruit
        local part = Instance.new("Part")
        part.Size = Vector3.new(1,1,1)
        part.BrickColor = BrickColor.new("Bright red")
        part.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 3, 0)
        part.Parent = model
        model.Parent = workspace
        wait(0.3)
    end
end)

-- ========== 🔷 MENÜ ÖFFNEN/SCHLIESSEN ==========
local menuOpen = false

hinataIcon.MouseButton1Click:Connect(function()
    menuOpen = not menuOpen
    menuFrame.Visible = menuOpen
    if menuOpen then
        statusLabel.Text = "✅ Menü geöffnet - Hinata hilft!"
    else
        statusLabel.Text = "❌ Menü geschlossen"
    end
end)

closeMenuBtn.MouseButton1Click:Connect(function()
    menuOpen = false
    menuFrame.Visible = false
    statusLabel.Text = "❌ Menü geschlossen"
end)

-- ========== 🔷 ICON VERSCHIEBEN (Drag & Drop) ==========
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

-- ========== 🔷 START ==========
game.StarterGui:SetCore("SendNotification", {
    Title = "🌸 Hinata Blox Fruits",
    Text = "Geladen! Klicke auf das Hinata-Icon.",
    Duration = 3
})
print("🌸 HINATA BLOX FRUITS by waled & hammad - Geladen!")
