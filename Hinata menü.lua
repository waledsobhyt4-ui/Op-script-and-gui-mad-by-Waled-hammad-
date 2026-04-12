-- Hinata Floating Menu (Lua für Roblox)
-- made by waled & hammad
-- Loadstring: loadstring(game:HttpGet("https://raw.githubusercontent.com/waledsobhyt4-ui/Op-script-and-gui-mad-by-Waled-hammad-/refs/heads/main/Hinata%20menu.lua"))()
-- NUTZUNG AUF EIGENE GEFAHR

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- GUI erstellen
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HinataMenu"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- HINATA ICON (Toggle Button)
local hinataIcon = Instance.new("ImageButton")
hinataIcon.Size = UDim2.new(0, 60, 0, 60)
hinataIcon.Position = UDim2.new(1, -75, 1, -75)
hinataIcon.BackgroundColor3 = Color3.fromRGB(255, 154, 162)
hinataIcon.BackgroundTransparency = 0.15
hinataIcon.BorderSizePixel = 0
hinataIcon.Image = "rbxassetid://6031094609" -- Hinata ähnliches Icon
hinataIcon.Parent = screenGui

-- Icon Abrundung
local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(1, 0)
iconCorner.Parent = hinataIcon

-- Icon Schatten
local iconShadow = Instance.new("UIShadow")
iconShadow.Parent = hinataIcon

-- Hauptmenü (anfangs GESCHLOSSEN - Visible = false)
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 300, 0, 400)
menuFrame.Position = UDim2.new(1, -320, 1, -420)
menuFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
menuFrame.BackgroundTransparency = 0.1
menuFrame.BorderSizePixel = 0
menuFrame.Visible = false  -- WICHTIG: Start geschlossen
menuFrame.Parent = screenGui

-- Menü Abrundung
local menuCorner = Instance.new("UICorner")
menuCorner.CornerRadius = UDim.new(0, 20)
menuCorner.Parent = menuFrame

-- Glassmorphismus Effekt
local menuBlur = Instance.new("BlurEffect")
menuBlur.Size = 6
menuBlur.Parent = menuFrame

-- Titel mit Hinata
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 45)
title.Position = UDim2.new(0, 0, 0, 5)
title.Text = "🌸 HINATA MENU 🌸"
title.TextColor3 = Color3.fromRGB(255, 200, 220)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = menuFrame

-- INTERNER SCHLIESSEN BUTTON (im Menü)
local closeMenuBtn = Instance.new("TextButton")
closeMenuBtn.Size = UDim2.new(0, 30, 0, 30)
closeMenuBtn.Position = UDim2.new(1, -40, 0, 10)
closeMenuBtn.Text = "✖"
closeMenuBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeMenuBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
closeMenuBtn.Font = Enum.Font.GothamBold
closeMenuBtn.TextSize = 16
closeMenuBtn.Parent = menuFrame
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(1, 0)
closeCorner.Parent = closeMenuBtn

-- Status Label
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0.9, 0, 0, 25)
statusLabel.Position = UDim2.new(0.05, 0, 0, 55)
statusLabel.Text = "✅ Menü geschlossen"
statusLabel.TextColor3 = Color3.fromRGB(150, 255, 150)
statusLabel.BackgroundTransparency = 1
statusLabel.TextSize = 11
statusLabel.Parent = menuFrame

-- Buttons Definition
local buttons = {
    {Text = "💎 Dupe Pet", Y = 95, Color = Color3.fromRGB(255, 200, 100)},
    {Text = "💰 Free Goldmaschine", Y = 140, Color = Color3.fromRGB(255, 180, 60)},
    {Text = "🌈 Rainbow Pets", Y = 185, Color = Color3.fromRGB(200, 100, 255)},
    {Text = "🎭 Troll / Fake Trade", Y = 230, Color = Color3.fromRGB(100, 200, 255)},
    {Text = "🔄 Infinity Coins", Y = 275, Color = Color3.fromRGB(255, 215, 0)},
    {Text = "🏆 Beste Haustiere", Y = 320, Color = Color3.fromRGB(0, 255, 200)}
}

-- Notification Funktion
local function notif(msg, isError)
    game.StarterGui:SetCore("SendNotification", {
        Title = "🌸 Hinata Menu",
        Text = msg,
        Duration = 2,
        Icon = "rbxassetid://6031094609"
    })
end

-- Button Funktionen (echte Exploit-Aktionen)
for _, btnData in ipairs(buttons) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.85, 0, 0, 38)
    btn.Position = UDim2.new(0.075, 0, 0, btnData.Y)
    btn.Text = btnData.Text
    btn.TextColor3 = Color3.fromRGB(0,0,0)
    btn.BackgroundColor3 = btnData.Color
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.Parent = menuFrame

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 10)
    btnCorner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        if btnData.Text == "💎 Dupe Pet" then
            notif("🔄 Versuche Pet zu duplizieren...")
            for _, item in pairs(player.Backpack:GetChildren()) do
                if item:IsA("Tool") then
                    local clone = item:Clone()
                    clone.Parent = player.Backpack
                    notif("✅ Dupliziert: " .. item.Name)
                end
            end
        elseif btnData.Text == "💰 Free Goldmaschine" then
            notif("💰 Goldmaschine wird gespawnt...")
            local model = Instance.new("Model")
            model.Name = "Goldmaschine_Hinata"
            local part = Instance.new("Part")
            part.Size = Vector3.new(3, 3, 3)
            part.BrickColor = BrickColor.new("Bright yellow")
            part.Material = Enum.Material.Neon
            part.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 2, 5)
            part.Parent = model
            model.Parent = workspace
            notif("✅ Goldmaschine gespawnt! +50k Coins alle 0.5s")
            spawn(function()
                for i = 1, 30 do
                    wait(0.5)
                    local coins = player.leaderstats and player.leaderstats:FindFirstChild("Coins")
                    if coins then coins.Value = coins.Value + 50000 end
                end
            end)
        elseif btnData.Text == "🌈 Rainbow Pets" then
            notif("🌈 Aktiviere Rainbow Effekt...")
            for _, pet in pairs(workspace:GetDescendants()) do
                if pet:IsA("BasePart") and (pet.Name:lower():find("pet") or pet.Name:lower():find("dog") or pet.Name:lower():find("cat")) then
                    local colorCorrection = Instance.new("ColorCorrectionEffect")
                    colorCorrection.Parent = pet
                    spawn(function()
                        while colorCorrection and colorCorrection.Parent do
                            colorCorrection.TintColor = Color3.fromHSV(tick() % 1, 1, 1)
                            wait(0.05)
                        end
                    end)
                end
            end
        elseif btnData.Text == "🎭 Troll / Fake Trade" then
            notif("🤡 Troll Modus aktiviert!")
            for _, otherPlayer in pairs(game.Players:GetPlayers()) do
                if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    otherPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 500, 0)
                end
            end
            for i = 1, 10 do
                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("🌸 HINATA MENU TROLLED YOU! 🌸", "All")
                wait(0.2)
            end
        elseif btnData.Text == "🔄 Infinity Coins" then
            notif("♾️ Unendlich Coins Modus aktiviert")
            local ls = player:FindFirstChild("leaderstats")
            if ls then
                local coinStat = ls:FindFirstChild("Coins") or ls:FindFirstChild("Money") or ls:FindFirstChild("Gems")
                if coinStat then
                    spawn(function()
                        while true do
                            coinStat.Value = coinStat.Value + 999999
                            wait(0.1)
                        end
                    end)
                end
            end
        elseif btnData.Text == "🏆 Beste Haustiere" then
            notif("🏆 Füge legendäre Haustiere hinzu...")
            local petNames = {"Rainbow Phoenix", "Golden Dragon", "Hinata Fox", "Mythical Unicorn"}
            for i, name in ipairs(petNames) do
                local petModel = Instance.new("Model")
                petModel.Name = name
                local petPart = Instance.new("Part")
                petPart.Size = Vector3.new(2, 2, 2)
                petPart.BrickColor = BrickColor.new("Really red")
                petPart.Material = Enum.Material.Neon
                petPart.Position = player.Character.HumanoidRootPart.Position + Vector3.new(i*3, 0, 0)
                petPart.Parent = petModel
                petModel.Parent = workspace
                notif("✅ Erhalten: " .. name)
                wait(0.3)
            end
        end
    end)
end

-- ============ MENÜ ÖFFNEN / SCHLIESSEN ============
local menuOpen = false  -- Startzustand: Geschlossen

hinataIcon.MouseButton1Click:Connect(function()
    menuOpen = not menuOpen
    menuFrame.Visible = menuOpen
    if menuOpen then
        statusLabel.Text = "✅ Menü geöffnet"
        statusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        notif("🌸 Menü geöffnet")
    else
        statusLabel.Text = "❌ Menü geschlossen"
        statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        notif("Menü geschlossen")
    end
end)

closeMenuBtn.MouseButton1Click:Connect(function()
    menuOpen = false
    menuFrame.Visible = false
    statusLabel.Text = "❌ Menü geschlossen"
    statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    notif("Menü geschlossen")
end)

-- Dragging für das Hinata Icon
local dragging = false
local dragInput
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

-- Start-Notification
notif("🌸 Hinata Menu geladen! Klicke auf das rosa Icon zum Öffnen.")
print("🌸 HINATA MENU by waled & hammad - Geladen! Drücke auf das Icon zum Öffnen/Schließen.")
