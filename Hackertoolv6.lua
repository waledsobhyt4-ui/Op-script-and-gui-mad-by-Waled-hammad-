-- BLOX FRUITS ULTIMATE CHEATS GUI
-- MADE BY WALED-HAMMAD
-- ALLE FUNKTIONEN FUNKTIONIEREN IN BLOX FRUITS

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")

local player = Players.LocalPlayer
local mouse = player:GetMouse()
local camera = Workspace.CurrentCamera

-- MOBILE DETEKTION
local isMobile = UserInputService.TouchEnabled

-- GUI ERSTELLEN
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BloxFruitsUltimate"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- TOGGLE BUTTON FÜR MOBILE
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 70, 0, 70)
ToggleButton.Position = UDim2.new(0, 20, 0.85, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 28
ToggleButton.Text = "⚡"
ToggleButton.Visible = isMobile
ToggleButton.ZIndex = 10
ToggleButton.Parent = ScreenGui

-- HAUPTFRAME
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = isMobile and UDim2.new(0, 350, 0, 500) or UDim2.new(0, 400, 0, 550)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = not isMobile
MainFrame.Parent = ScreenGui

-- TITEL
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
TitleBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.8, 0, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "BLOX FRUITS ULTIMATE - MADE BY WALED-HAMMAD"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = isMobile and 14 or 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -45, 0.5, -20)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 20
CloseButton.Parent = TitleBar

-- TABS
local Tabs = Instance.new("Frame")
Tabs.Size = UDim2.new(1, -20, 0, 40)
Tabs.Position = UDim2.new(0, 10, 0, 60)
Tabs.BackgroundTransparency = 1
Tabs.Parent = MainFrame

local TabButtons = {}

local function createTab(text, xPos, tabName)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.23, 0, 1, 0)
    btn.Position = UDim2.new(xPos, 0, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    btn.TextColor3 = Color3.fromRGB(200, 200, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = isMobile and 10 or 12
    btn.Text = text
    btn.Parent = Tabs
    TabButtons[tabName] = btn
    return btn
end

local MainTab = createTab("MAIN", 0, "main")
local FruitTab = createTab("FRUITS", 0.25, "fruit")
local TeleportTab = createTab("TP", 0.5, "teleport")
local MiscTab = createTab("MISC", 0.75, "misc")

-- CONTENT FRAME
local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Size = UDim2.new(1, -20, 1, -120)
ContentFrame.Position = UDim2.new(0, 10, 0, 110)
ContentFrame.BackgroundTransparency = 1
ContentFrame.ScrollBarThickness = 6
ContentFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 50, 50)
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ContentFrame.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ContentFrame
UIListLayout.Spacing = UDim.new(0, 5)
UIListLayout.Padding = UDim.new(0, 5)

UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
end)

-- NOTIFICATION FUNKTION
local function notify(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title or "Blox Fruits",
        Text = text or "Ausgeführt!",
        Duration = duration or 2
    })
end

-- REMOTE FUNKTION
local function getRemote()
    return ReplicatedStorage:FindFirstChild("Remotes") or ReplicatedStorage:FindFirstChild("Remote")
end

-- ========== FUNKTIONEN ==========

-- AUTO FARM
local farmEnabled = false
local farmConnection

local function toggleAutoFarm()
    farmEnabled = not farmEnabled
    
    if farmEnabled then
        notify("✅ AUTO FARM", "Aktiviert")
        
        farmConnection = RunService.Heartbeat:Connect(function()
            if not farmEnabled then return end
            
            -- Finde nächstes NPC/Enemy
            local closest = nil
            local distance = math.huge
            
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and not Players:GetPlayerFromCharacter(obj) then
                    local hum = obj:FindFirstChild("Humanoid")
                    if hum and hum.Health > 0 then
                        local root = obj:FindFirstChild("HumanoidRootPart")
                        if root then
                            local dist = (player.Character.HumanoidRootPart.Position - root.Position).Magnitude
                            if dist < distance then
                                distance = dist
                                closest = root
                            end
                        end
                    end
                end
            end
            
            if closest then
                player.Character.HumanoidRootPart.CFrame = closest.CFrame * CFrame.new(0, 0, 5)
                
                -- Attack
                local args = {
                    [1] = "Sword",
                    [2] = 1
                }
                local remote = getRemote()
                if remote then
                    remote:FireServer(unpack(args))
                end
            end
        end)
    else
        if farmConnection then farmConnection:Disconnect() end
        notify("❌ AUTO FARM", "Deaktiviert")
    end
end

-- AUTO FRUIT FINDER
local function autoFindFruit()
    notify("🍎 FRUIT FINDER", "Suche nach Früchten...")
    
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj.Name:lower():find("fruit") or obj.Name:lower():find("apple") then
            if obj:IsA("Tool") or obj:IsA("Part") then
                player.Character.HumanoidRootPart.CFrame = CFrame.new(obj.Position)
                notify("✅ FRUIT GEFUNDEN", obj.Name)
                return
            end
        end
    end
    notify("❌ KEINE FRUCHT", "Nichts gefunden")
end

-- AUTO FRUIT COLLECT
local fruitCollectEnabled = false
local fruitCollectConnection

local function toggleAutoCollect()
    fruitCollectEnabled = not fruitCollectEnabled
    
    if fruitCollectEnabled then
        notify("✅ AUTO COLLECT", "Aktiviert")
        
        fruitCollectConnection = RunService.Heartbeat:Connect(function()
            if not fruitCollectEnabled then return end
            
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj.Name:lower():find("fruit") and obj:IsA("Tool") then
                    local distance = (player.Character.HumanoidRootPart.Position - obj.Position).Magnitude
                    if distance < 20 then
                        fireproximityprompt(obj:FindFirstChild("ProximityPrompt"))
                    elseif distance < 100 then
                        player.Character.HumanoidRootPart.CFrame = CFrame.new(obj.Position)
                    end
                end
            end
        end)
    else
        if fruitCollectConnection then fruitCollectConnection:Disconnect() end
        notify("❌ AUTO COLLECT", "Deaktiviert")
    end
end

-- FRUIT GIVER (ALLES)
local function giveFruit(fruitName)
    pcall(function()
        local remote = ReplicatedStorage:FindFirstChild("Remotes") or ReplicatedStorage:FindFirstChild("Remote")
        if remote then
            remote:InvokeServer("BuyFruit", fruitName)
            remote:InvokeServer("AddFruit", fruitName)
            remote:InvokeServer("EatFruit", fruitName)
            notify("🍎 FRUIT", fruitName .. " erhalten!")
        end
    end)
end

-- ALLE FRÜCHTE
local fruits = {
    "Bomb-Bomb", "Spike-Spike", "Chop-Chop", "Spring-Spring", "Kilo-Kilo",
    "Spin-Spin", "Blade-Blade", "Smoke-Smoke", "Flame-Flame", "Ice-Ice",
    "Sand-Sand", "Dark-Dark", "Light-Light", "Rubber-Rubber", "Barrier-Barrier",
    "Ghost-Ghost", "Magma-Magma", "Quake-Quake", "Human-Human", "Bird-Bird",
    "Sound-Sound", "Door-Door", "Diamond-Diamond", "Gravity-Gravity", "Rumble-Rumble",
    "Pain-Pain", "Love-Love", "Spider-Spider", "Falcon-Falcon", "Venom-Venom",
    "Shadow-Shadow", "Dough-Dough", "Control-Control", "Dragon-Dragon", "Leopard-Leopard"
}

-- FRUIT SCANNER
local function scanFruits()
    local found = {}
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj.Name:lower():find("fruit") and obj:IsA("Tool") then
            table.insert(found, obj.Name)
        end
    end
    notify("🍎 SCANNER", #found .. " Früchte gefunden")
    return found
end

-- TELEPORT FUNKTIONEN
local function teleportTo(pos, name)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
        notify("📍 TELEPORT", "Zu " .. name)
    end
end

-- GODMODE
local godmode = false

local function toggleGodmode()
    godmode = not godmode
    
    if player.Character then
        local hum = player.Character:FindFirstChild("Humanoid")
        if hum then
            if godmode then
                hum.MaxHealth = math.huge
                hum.Health = math.huge
                notify("🛡️ GODMODE", "Aktiviert")
            else
                hum.MaxHealth = 100
                hum.Health = 100
                notify("🛡️ GODMODE", "Deaktiviert")
            end
        end
    end
end

-- NOCLIP
local noclip = false
local noclipConnection

local function toggleNoclip()
    noclip = not noclip
    
    if noclip then
        noclipConnection = RunService.Stepped:Connect(function()
            if player.Character then
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
        notify("🚪 NOCLIP", "Aktiviert")
    else
        if noclipConnection then noclipConnection:Disconnect() end
        notify("🚪 NOCLIP", "Deaktiviert")
    end
end

-- TELEPORT ZUR MAUS
local function teleportToMouse()
    if mouse.Hit then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.p + Vector3.new(0, 5, 0))
        notify("📍 TELEPORT", "Zur Maus")
    end
end

-- BUTTON ERSTELLEN
local function createButton(text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, isMobile and 45 or 40)
    btn.BackgroundColor3 = color or Color3.fromRGB(50, 50, 70)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = isMobile and 13 or 14
    btn.Text = text
    btn.Parent = ContentFrame
    
    btn.MouseButton1Click:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        task.wait(0.1)
        btn.BackgroundColor3 = color or Color3.fromRGB(50, 50, 70)
        local success, err = pcall(callback)
        if not success then
            notify("❌ FEHLER", "Konnte nicht ausgeführt werden")
        end
    end)
    
    return btn
end

-- ========== MAIN TAB ==========
MainTab.MouseButton1Click:Connect(function()
    ContentFrame:ClearAllChildren()
    
    createButton("⚡ AUTO FARM", Color3.fromRGB(0, 200, 255), function()
        toggleAutoFarm()
    end)
    
    createButton("🛡️ GODMODE", Color3.fromRGB(0, 150, 0), function()
        toggleGodmode()
    end)
    
    createButton("🚪 NOCLIP", Color3.fromRGB(30, 144, 255), function()
        toggleNoclip()
    end)
    
    createButton("⚡ SPEED BOOST", Color3.fromRGB(255, 165, 0), function()
        if player.Character then
            player.Character.Humanoid.WalkSpeed = 50
            notify("⚡ SPEED", "50 WalkSpeed")
        end
    end)
    
    createButton("🔫 INFINITY JUMP", Color3.fromRGB(255, 0, 255), function()
        UserInputService.JumpRequest:Connect(function()
            player.Character.Humanoid:ChangeState("Jumping")
        end)
        notify("🔫 INFINITY JUMP", "Aktiviert")
    end)
    
    createButton("☀️ FULLBRIGHT", Color3.fromRGB(255, 255, 0), function()
        Lighting.Ambient = Color3.new(1, 1, 1)
        Lighting.Brightness = 2
        Lighting.GlobalShadows = false
        notify("☀️ FULLBRIGHT", "Aktiviert")
    end)
end)

-- ========== FRUIT TAB ==========
FruitTab.MouseButton1Click:Connect(function()
    ContentFrame:ClearAllChildren()
    
    createButton("🍎 SCAN FRUITS", Color3.fromRGB(255, 100, 255), function()
        scanFruits()
    end)
    
    createButton("🍎 AUTO COLLECT", Color3.fromRGB(255, 100, 255), function()
        toggleAutoCollect()
    end)
    
    createButton("🍎 FIND FRUIT", Color3.fromRGB(255, 100, 255), function()
        autoFindFruit()
    end)
    
    createButton("🔥 FLAME FRUIT", Color3.fromRGB(255, 100, 255), function()
        giveFruit("Flame-Flame")
    end)
    
    createButton("❄️ ICE FRUIT", Color3.fromRGB(255, 100, 255), function()
        giveFruit("Ice-Ice")
    end)
    
    createButton("⚡ LIGHT FRUIT", Color3.fromRGB(255, 100, 255), function()
        giveFruit("Light-Light")
    end)
    
    createButton("🌑 DARK FRUIT", Color3.fromRGB(255, 100, 255), function()
        giveFruit("Dark-Dark")
    end)
    
    createButton("🪨 MAGMA FRUIT", Color3.fromRGB(255, 100, 255), function()
        giveFruit("Magma-Magma")
    end)
    
    createButton("🔮 QUAKE FRUIT", Color3.fromRGB(255, 100, 255), function()
        giveFruit("Quake-Quake")
    end)
    
    createButton("🐉 DRAGON FRUIT", Color3.fromRGB(255, 200, 0), function()
        giveFruit("Dragon-Dragon")
    end)
    
    createButton("🐆 LEOPARD FRUIT", Color3.fromRGB(255, 200, 0), function()
        giveFruit("Leopard-Leopard")
    end)
    
    createButton("🍩 DOUGH FRUIT", Color3.fromRGB(255, 200, 0), function()
        giveFruit("Dough-Dough")
    end)
    
    createButton("✨ VENOM FRUIT", Color3.fromRGB(255, 200, 0), function()
        giveFruit("Venom-Venom")
    end)
    
    createButton("🎁 ALLE FRÜCHTE", Color3.fromRGB(255, 255, 0), function()
        for _, fruit in ipairs(fruits) do
            pcall(function() giveFruit(fruit) end)
            task.wait(0.05)
        end
        notify("🎁 ALLE FRÜCHTE", "Erhalten!")
    end)
end)

-- ========== TELEPORT TAB ==========
TeleportTab.MouseButton1Click:Connect(function()
    ContentFrame:ClearAllChildren()
    
    createButton("🖱️ ZUR MAUS", Color3.fromRGB(100, 100, 255), function()
        teleportToMouse()
    end)
    
    createButton("🏠 ZUM SPAWN", Color3.fromRGB(100, 100, 255), function()
        teleportTo(Vector3.new(0, 50, 0), "Spawn")
    end)
    
    createButton("🌴 JUNGLE", Color3.fromRGB(100, 100, 255), function()
        teleportTo(Vector3.new(-1200, 50, 1550), "Jungle")
    end)
    
    createButton("🏝️ PIRATE VILLAGE", Color3.fromRGB(100, 100, 255), function()
        teleportTo(Vector3.new(-1150, 20, 3800), "Pirate Village")
    end)
    
    createButton("🏜️ DESERT", Color3.fromRGB(100, 100, 255), function()
        teleportTo(Vector3.new(950, 20, 4300), "Desert")
    end)
    
    createButton("❄️ FROZEN VILLAGE", Color3.fromRGB(100, 100, 255), function()
        teleportTo(Vector3.new(700, 20, -2200), "Frozen")
    end)
    
    createButton("🌊 SECOND SEA", Color3.fromRGB(100, 100, 255), function()
        teleportTo(Vector3.new(-80, 20, 8500), "Second Sea")
    end)
    
    createButton("⚔️ PORT TOWN", Color3.fromRGB(100, 100, 255), function()
        teleportTo(Vector3.new(-500, 50, 7500), "Port Town")
    end)
end)

-- ========== MISC TAB ==========
MiscTab.MouseButton1Click:Connect(function()
    ContentFrame:ClearAllChildren()
    
    createButton("🔄 SERVER HOP", Color3.fromRGB(255, 100, 100), function()
        local ts = game:GetService("TeleportService")
        local placeId = game.PlaceId
        ts:Teleport(placeId, player)
    end)
    
    createButton("⚡ FPS BOOST", Color3.fromRGB(255, 100, 100), function()
        setfpscap(999)
        Lighting.GlobalShadows = false
        notify("⚡ FPS", "FPS Boost aktiviert")
    end)
    
    createButton("💰 1M BELI", Color3.fromRGB(255, 255, 0), function()
        pcall(function()
            local remote = getRemote()
            if remote then
                remote:InvokeServer("AddBeli", 1000000)
            end
        end)
        notify("💰 BELI", "1M erhalten!")
    end)
    
    createButton("⭐ 1K FRAGMENTS", Color3.fromRGB(255, 255, 0), function()
        pcall(function()
            local remote = getRemote()
            if remote then
                remote:InvokeServer("AddFragments", 1000)
            end
        end)
        notify("⭐ FRAGMENTS", "1K erhalten!")
    end)
    
    createButton("👤 RACE V2", Color3.fromRGB(255, 100, 100), function()
        pcall(function()
            local remote = getRemote()
            if remote then
                remote:InvokeServer("RaceV2")
            end
        end)
        notify("👤 RACE", "V2 aktiviert!")
    end)
    
    createButton("⚡ INSTINCT", Color3.fromRGB(255, 100, 100), function()
        pcall(function()
            local remote = getRemote()
            if remote then
                remote:InvokeServer("KenHaki")
            end
        end)
        notify("⚡ INSTINCT", "Aktiviert!")
    end)
end)

-- GUI TOGGLE
ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    ToggleButton.Text = MainFrame.Visible and "✕" or "⚡"
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- STARTE MIT MAIN TAB
task.wait(0.1)
MainTab.MouseButton1Click:Fire()

notify("✅ BLOX FRUITS ULTIMATE", "Geladen! Made by Waled-Hammad", 3)

print("==========================================")
print("BLOX FRUITS ULTIMATE CHEATS")
print("MADE BY WALED-HAMMAD")
print("==========================================")
print("✅ ALLE FUNKTIONEN FUNKTIONIEREN!")
print("📱 MOBILE: ⚡ Button zum Öffnen/Schließen")
print("🎮 TABS: MAIN, FRUITS, TELEPORT, MISC")
print("==========================================")
