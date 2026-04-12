-- Hinata Floating Menu (Lua für Roblox)
-- made by waled & hammad
-- NUTZUNG AUF EIGENE GEFAHR

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- GUI erstellen
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HinataMenu"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Toggle Button (Hinata Icon)
local toggleBtn = Instance.new("ImageButton")
toggleBtn.Size = UDim2.new(0, 55, 0, 55)
toggleBtn.Position = UDim2.new(1, -70, 1, -70)
toggleBtn.BackgroundColor3 = Color3.fromRGB(255, 154, 162)
toggleBtn.BorderSizePixel = 0
toggleBtn.Image = "rbxassetid://6031094609" -- Hinata ähnliches Icon
toggleBtn.Parent = screenGui

-- Hauptmenü (anfangs ausgeblendet)
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 280, 0, 320)
menuFrame.Position = UDim2.new(1, -300, 1, -400)
menuFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
menuFrame.BackgroundTransparency = 0.1
menuFrame.BorderSizePixel = 0
menuFrame.Visible = false
menuFrame.Parent = screenGui

-- Abrundung
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 20)
corner.Parent = menuFrame

-- Titel
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "🌸 HINATA MENU 🌸"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = menuFrame

-- Buttons
local buttons = {
    {Text = "💎 Dupe Pet", Y = 50, Color = Color3.fromRGB(255, 200, 100)},
    {Text = "💰 Free Goldmaschine", Y = 95, Color = Color3.fromRGB(255, 180, 60)},
    {Text = "🌈 Rainbow Pets", Y = 140, Color = Color3.fromRGB(200, 100, 255)},
    {Text = "🎭 Troll / Fake Trade", Y = 185, Color = Color3.fromRGB(100, 200, 255)},
    {Text = "🔄 Infinity Coins", Y = 230, Color = Color3.fromRGB(255, 215, 0)},
    {Text = "🏆 Beste Haustiere", Y = 275, Color = Color3.fromRGB(0, 255, 200)}
}

local function notif(msg)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Hinata Menu",
        Text = msg,
        Duration = 2
    })
end

-- Funktionen (Simulation – für echte Dupes müsstest du Exploits nutzen)
for _, btnData in ipairs(buttons) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.8, 0, 0, 35)
    btn.Position = UDim2.new(0.1, 0, 0, btnData.Y)
    btn.Text = btnData.Text
    btn.TextColor3 = Color3.fromRGB(0,0,0)
    btn.BackgroundColor3 = btnData.Color
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.Parent = menuFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 12)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        if btnData.Text == "💎 Dupe Pet" then
            notif("⚠️ Dupe erfordert spezifischen Exploit. Versuche: lokales Pet klonen (nicht immer möglich)")
            -- Beispiel: letztes inventar item duplizieren (nur visuell)
            local args = {[1] = "Dupe attempted"}
            game.ReplicatedStorage:FindFirstChild("TradeRequest"):FireServer(unpack(args))
        elseif btnData.Text == "💰 Free Goldmaschine" then
            notif("✨ Goldmaschine simuliert! +1.000.000 Coins (lokal)")
            -- Lokale Wertänderung
            local leaderstats = player:FindFirstChild("leaderstats")
            if leaderstats and leaderstats:FindFirstChild("Coins") then
                leaderstats.Coins.Value = leaderstats.Coins.Value + 1000000
            end
        elseif btnData.Text == "🌈 Rainbow Pets" then
            notif("🌈 Deine Haustiere leuchten jetzt in Regenbogenfarben!")
            for _, v in pairs(player.Backpack:GetChildren()) do
                if v:IsA("Tool") and v:FindFirstChild("Handle") then
                    local rainbow = Instance.new("ColorCorrectionEffect")
                    rainbow.Parent = v.Handle
                    -- Farbwechsel loop
                    spawn(function()
                        for i = 1,30 do
                            v.Handle.Color = Color3.fromHSV(tick()%1,1,1)
                            wait(0.1)
                        end
                    end)
                end
            end
        elseif btnData.Text == "🎭 Troll / Fake Trade" then
            notif("🤡 Fake Trade gestartet! Andere sehen riesige Angebote (nur visuell)")
            local fakeTrade = Instance.new("ScreenGui")
            fakeTrade.Name = "FakeTrade"
            fakeTrade.Parent = player.PlayerGui
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(0.5,0,0.4,0)
            frame.Position = UDim2.new(0.25,0,0.3,0)
            frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
            frame.BackgroundTransparency = 0.2
            frame.Parent = fakeTrade
            local text = Instance.new("TextLabel")
            text.Size = UDim2.new(1,0,1,0)
            text.Text = "🚨 SCAM WARNING 🚨\nDu erhältst: 999 Rainbow Pets\nGib: Nichts"
            text.TextColor3 = Color3.fromRGB(255,0,0)
            text.BackgroundTransparency = 1
            text.Parent = frame
            wait(3)
            fakeTrade:Destroy()
        elseif btnData.Text == "🔄 Infinity Coins" then
            notif("♾️ Unendlich Coins
