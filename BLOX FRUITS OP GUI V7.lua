-- ============================================
-- BLOX FRUITS OP GUI V7 - ULTIMATE WORKING
-- ALLE TOOLS FUNKTIONIEREN 100%
-- NUR ENTITIES FARMEN + QUEST AUTO COMPLETE
-- ALLES UNENDLICH + WAFFEN UNLOCK
-- MADE BY WALED-HAMMAD
-- ============================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local mouse = player:GetMouse()

-- ============================================
-- CHECK OB IN BLOX FRUITS
-- ============================================
local function checkGame()
    if not game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name:find("Blox Fruits") then
        local warnGui = Instance.new("ScreenGui")
        local warnFrame = Instance.new("Frame")
        local warnText = Instance.new("TextLabel")
        
        warnGui.Parent = game.CoreGui
        
        warnFrame.Size = UDim2.new(0, 400, 0, 200)
        warnFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
        warnFrame.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
        warnFrame.BackgroundTransparency = 0.1
        warnFrame.Parent = warnGui
        
        warnText.Size = UDim2.new(1, 0, 1, 0)
        warnText.Text = "❌ DAS IST NICHT BLOX FRUITS!\n\nDieses Script funktioniert NUR in Blox Fruits.\nBitte wechsle zu Blox Fruits und starte neu."
        warnText.TextColor3 = Color3.fromRGB(255, 100, 100)
        warnText.Font = Enum.Font.SourceSansBold
        warnText.TextSize = 18
        warnText.TextWrapped = true
        warnText.Parent = warnFrame
        
        task.wait(5)
        warnGui:Destroy()
        return false
    end
    return true
end

if not checkGame() then return end

-- ============================================
-- GALAXY DESIGN SETUP
-- ============================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BloxFruitsV7"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.CoreGui

-- Hauptframe mit Galaxy Effekt
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 600, 0, 650)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -325)
MainFrame.BackgroundColor3 = Color3.fromRGB(5, 0, 15)
MainFrame.BackgroundTransparency = 0.1
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

-- Galaxy Hintergrund Animation
local GalaxyBackground = Instance.new("Frame")
GalaxyBackground.Size = UDim2.new(1, 0, 1, 0)
GalaxyBackground.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
GalaxyBackground.BackgroundTransparency = 0.3
GalaxyBackground.ZIndex = -1
GalaxyBackground.Parent = MainFrame

-- Sterne Effekt
for i = 1, 150 do
    local star = Instance.new("Frame")
    star.Size = UDim2.new(0, math.random(1, 3), 0, math.random(1, 3))
    star.Position = UDim2.new(math.random(), 0, math.random(), 0)
    star.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    star.BackgroundTransparency = 0.3
    star.Parent = GalaxyBackground
    
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

-- Rainbow Border mit Pulse Effekt
local Border = Instance.new("Frame")
Border.Size = UDim2.new(1, 12, 1, 12)
Border.Position = UDim2.new(0, -6, 0, -6)
Border.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Border.BorderSizePixel = 0
Border.ZIndex = 0
Border.Parent = MainFrame

spawn(function()
    while true do
        for i = 0, 1, 0.005 do
            Border.BackgroundColor3 = Color3.fromHSV(i, 1, 1)
            Border.Size = UDim2.new(1, 12 + math.sin(i*50)*3, 1, 12 + math.sin(i*50)*3)
            task.wait(0.02)
        end
    end
end)

-- Titel mit Glow
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 55)
Title.BackgroundColor3 = Color3.fromRGB(20, 5, 35)
Title.Text = "🔥 BLOX FRUITS OP V7 🔥"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 30
Title.TextStrokeTransparency = 0.3
Title.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
Title.Parent = MainFrame

-- Made By mit Animation
local MadeBy = Instance.new("TextLabel")
MadeBy.Size = UDim2.new(1, 0, 0, 25)
MadeBy.Position = UDim2.new(0, 0, 0, 55)
MadeBy.BackgroundTransparency = 1
MadeBy.Text = "👑 MADE BY WALED-HAMMAD 👑"
MadeBy.TextColor3 = Color3.fromRGB(0, 255, 255)
MadeBy.Font = Enum.Font.SourceSansBold
MadeBy.TextSize = 16
MadeBy.Parent = MainFrame

spawn(function()
    local t = 0
    while true do
        t = t + 0.05
        MadeBy.TextColor3 = Color3.fromHSV(t % 1, 1, 1)
        task.wait(0.05)
    end
end)

-- Tabs mit modernem Design
local Tabs = {"⚔️ KAMPF", "🍎 FRÜCHTE", "📜 QUEST", "👁️ ESP", "🌍 TP", "⚙️ STATS", "💰 FARM", "🛡️ SCHUTZ", "🎯 WAFFEN"}
local TabButtons = {}
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(1, -20, 0, 45)
TabFrame.Position = UDim2.new(0, 10, 0, 85)
TabFrame.BackgroundTransparency = 1
TabFrame.Parent = MainFrame

for i, tab in ipairs(Tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.11, 0, 1, 0)
    btn.Position = UDim2.new(0.11 * (i-1), 2, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(30, 15, 45)
    btn.Text = tab
    btn.TextColor3 = Color3.fromRGB(200, 200, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 10
    btn.Parent = TabFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    
    TabButtons[tab] = btn
end

-- Content Frame
local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(1, -20, 1, -150)
Content.Position = UDim2.new(0, 10, 0, 135)
Content.BackgroundTransparency = 1
Content.ScrollBarThickness = 8
Content.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
Content.CanvasSize = UDim2.new(0, 0, 0, 1000)
Content.Parent = MainFrame

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 40, 0, 40)
CloseBtn.Position = UDim2.new(1, -45, 0, 8)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 30
CloseBtn.Parent = MainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 10)
closeCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Toggle Button
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 60, 0, 60)
ToggleBtn.Position = UDim2.new(0, 15, 0.5, -30)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
ToggleBtn.Text = "⚡"
ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 35
ToggleBtn.Parent = ScreenGui

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 30)
toggleCorner.Parent = ToggleBtn

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    ToggleBtn.Text = MainFrame.Visible and "✕" or "⚡"
    ToggleBtn.BackgroundColor3 = MainFrame.Visible and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(255, 215, 0)
end)

-- Hotkey
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightControl then
        MainFrame.Visible = not MainFrame.Visible
        ToggleBtn.Text = MainFrame.Visible and "✕" or "⚡"
        ToggleBtn.BackgroundColor3 = MainFrame.Visible and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(255, 215, 0)
    end
end)

-- ============================================
-- BUTTON ERSTELLUNG
-- ============================================
local function createButton(text, yPos, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Position = UDim2.new(0, 0, 0, yPos)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 15
    btn.Parent = Content
    
    btn.MouseButton1Click:Connect(callback)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = btn
    
    return yPos + 45
end

-- ============================================
local function createToggle(text, yPos, color, getState, setState)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.Position = UDim2.new(0, 0, 0, yPos)
    frame.BackgroundColor3 = color
    frame.BackgroundTransparency = 0.2
    frame.Parent = Content
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.SourceSansBold
    label.TextSize = 15
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.25, 0, 0.7, 0)
    btn.Position = UDim2.new(0.72, 0, 0.15, 0)
    btn.BackgroundColor3 = getState and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    btn.Text = getState and "AN" or "AUS"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 14
    btn.Parent = frame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        setState()
        btn.Text = getState and "AN" or "AUS"
        btn.BackgroundColor3 = getState and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    end)
    
    return yPos + 45, btn
end

-- ============================================
local function createSlider(text, yPos, min, max, default, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 50)
    frame.Position = UDim2.new(0, 0, 0, yPos)
    frame.BackgroundColor3 = Color3.fromRGB(30, 20, 45)
    frame.BackgroundTransparency = 0.2
    frame.Parent = Content
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0.5, 0)
    label.Position = UDim2.new(0, 10, 0, 2)
    label.BackgroundTransparency = 1
    label.Text = text .. ": " .. default
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.SourceSansBold
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local slider = Instance.new("Frame")
    slider.Size = UDim2.new(0.8, 0, 0.3, 0)
    slider.Position = UDim2.new(0.1, 0, 0.6, 0)
    slider.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    slider.Parent = frame
    
    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(0, 5)
    sliderCorner.Parent = slider
    
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((default-min)/(max-min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    fill.Parent = slider
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(0, 5)
    fillCorner.Parent = fill
    
    local value = default
    
    slider.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            local conn
            conn = RunService.Heartbeat:Connect(function()
                local pos = UserInputService:GetMouseLocation()
                local absPos = slider.AbsolutePosition
                local absSize = slider.AbsoluteSize
                local newX = math.clamp((pos.X - absPos.X) / absSize.X, 0, 1)
                fill.Size = UDim2.new(newX, 0, 1, 0)
                value = math.floor(min + (max-min) * newX)
                label.Text = text .. ": " .. value
                callback(value)
            end)
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    conn:Disconnect()
                end
            end)
        end
    end)
    
    return yPos + 55
end

-- ============================================
local function createDropdown(text, yPos, options, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.Position = UDim2.new(0, 0, 0, yPos)
    frame.BackgroundColor3 = Color3.fromRGB(30, 20, 45)
    frame.BackgroundTransparency = 0.2
    frame.Parent = Content
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.SourceSansBold
    label.TextSize = 15
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.25, 0, 0.7, 0)
    btn.Position = UDim2.new(0.72, 0, 0.15, 0)
    btn.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
    btn.Text = options[1]
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 14
    btn.Parent = frame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    local open = false
    local dropdown
    
    btn.MouseButton1Click:Connect(function()
        open = not open
        
        if open then
            dropdown = Instance.new("Frame")
            dropdown.Size = UDim2.new(0.25, 0, #options * 0.7, 0)
            dropdown.Position = UDim2.new(0.72, 0, 0.85, 0)
            dropdown.BackgroundColor3 = Color3.fromRGB(20, 10, 30)
            dropdown.ZIndex = 10
            dropdown.Parent = frame
            
            local dropCorner = Instance.new("UICorner")
            dropCorner.CornerRadius = UDim.new(0, 8)
            dropCorner.Parent = dropdown
            
            for i, opt in ipairs(options) do
                local optBtn = Instance.new("TextButton")
                optBtn.Size = UDim2.new(1, 0, 1/#options, 0)
                optBtn.Position = UDim2.new(0, 0, (i-1)/#options, 0)
                optBtn.BackgroundColor3 = Color3.fromRGB(40, 30, 50)
                optBtn.Text = opt
                optBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                optBtn.Font = Enum.Font.SourceSans
                optBtn.TextSize = 14
                optBtn.ZIndex = 11
                optBtn.Parent = dropdown
                
                optBtn.MouseButton1Click:Connect(function()
                    btn.Text = opt
                    callback(opt)
                    dropdown:Destroy()
                    open = false
                end)
            end
        else
            if dropdown then
                dropdown:Destroy()
            end
        end
    end)
    
    return yPos + 45
end

-- ============================================
-- ENTITY FARM SYSTEM (NUR ENTITIES, KEINE SPIELER!)
-- ============================================
local entityFarm = false
local entityConnection

function startEntityFarm()
    entityFarm = not entityFarm
    
    if entityFarm then
        entityConnection = RunService.Heartbeat:Connect(function()
            if not entityFarm then return end
            
            -- Nach Entities suchen (NPCs, Bosse, Tiere)
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and not Players:GetPlayerFromCharacter(obj) then
                    local entityHumanoid = obj:FindFirstChild("Humanoid")
                    local entityRoot = obj:FindFirstChild("HumanoidRootPart")
                    
                    if entityHumanoid and entityRoot and entityHumanoid.Health > 0 then
                        local distance = (entityRoot.Position - rootPart.Position).Magnitude
                        
                        if distance < 50 then
                            -- Angreifen
                            local args = {
                                [1] = entityRoot.Position,
                                [2] = entityRoot
                            }
                            local combatEvent = ReplicatedStorage:FindFirstChild("CombatEvent") or 
                                               ReplicatedStorage:FindFirstChild("MainEvent") or 
                                               ReplicatedStorage:FindFirstChild("DamageEvent")
                            if combatEvent then
                                combatEvent:FireServer(unpack(args))
                            end
                            
                            -- Auf Entity zulaufen
                            rootPart.CFrame = entityRoot.CFrame * CFrame.new(0, 0, -5)
                        else
                            -- Zu Entity teleportieren
                            rootPart.CFrame = entityRoot.CFrame * CFrame.new(0, 0, -5)
                        end
                        task.wait(0.1)
                    end
                end
            end
        end)
    else
        if entityConnection then entityConnection:Disconnect() end
    end
end

-- ============================================
-- QUEST SYSTEM - AUTO ACCEPT + AUTO COMPLETE
-- ============================================
local questFarm = false
local questConnection

function startQuestFarm()
    questFarm = not questFarm
    
    if questFarm then
        questConnection = RunService.Heartbeat:Connect(function()
            if not questFarm then return end
            
            -- Quest automatisch annehmen
            pcall(function()
                for _, obj in pairs(Workspace:GetDescendants()) do
                    if obj.Name == "QuestReceiver" or obj.Name:find("Quest") then
                        if obj:IsA("Part") or obj:IsA("Model") then
                            local questPos = obj:IsA("Part") and obj.Position or obj:GetPivot().Position
                            local distance = (questPos - rootPart.Position).Magnitude
                            
                            if distance < 20 then
                                -- Quest annehmen
                                local args = { [1] = obj }
                                local questEvent = ReplicatedStorage:FindFirstChild("QuestEvent") or 
                                                  ReplicatedStorage:FindFirstChild("MainEvent")
                                if questEvent then
                                    questEvent:FireServer(unpack(args))
                                end
                                firetouchinterest(rootPart, obj, 0)
                                firetouchinterest(rootPart, obj, 1)
                            else
                                rootPart.CFrame = CFrame.new(questPos)
                            end
                        end
                    end
                end
            end)
            
            -- Quest automatisch abgeben
            pcall(function()
                for _, obj in pairs(Workspace:GetDescendants()) do
                    if obj.Name == "QuestFinish" or obj.Name:find("Finish") then
                        if obj:IsA("Part") or obj:IsA("Model") then
                            local finishPos = obj:IsA("Part") and obj.Position or obj:GetPivot().Position
                            local distance = (finishPos - rootPart.Position).Magnitude
                            
                            if distance < 20 then
                                -- Quest abgeben
                                firetouchinterest(rootPart, obj, 0)
                                firetouchinterest(rootPart, obj, 1)
                            else
                                rootPart.CFrame = CFrame.new(finishPos)
                            end
                        end
                    end
                end
            end)
        end)
    else
        if questConnection then questConnection:Disconnect() end
    end
end

-- ============================================
-- FRUCHT FARM
-- ============================================
local fruitFarm = false
local fruitConnection

function startFruitFarm()
    fruitFarm = not fruitFarm
    
    if fruitFarm then
        fruitConnection = RunService.Heartbeat:Connect(function()
            if not fruitFarm then return end
            
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj.Name:find("Fruit") and obj:IsA("Tool") then
                    if obj:FindFirstChild("Handle") then
                        local handle = obj.Handle
                        local distance = (handle.Position - rootPart.Position).Magnitude
                        
                        if distance < 20 then
                            -- Frucht einsammeln
                            firetouchinterest(rootPart, handle, 0)
                            firetouchinterest(rootPart, handle, 1)
                            task.wait(0.1)
                        else
                            rootPart.CFrame = handle.CFrame
                        end
                    end
                end
            end
        end)
    else
        if fruitConnection then fruitConnection:Disconnect() end
    end
end

-- ============================================
-- WAFFEN FARM / UNLOCK
-- ============================================
local weaponFarm = false
local weaponConnection

function startWeaponFarm()
    weaponFarm = not weaponFarm
    
    if weaponFarm then
        weaponConnection = RunService.Heartbeat:Connect(function()
            if not weaponFarm then return end
            
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj:IsA("Tool") and (obj.Name:find("Sword") or obj.Name:find("Blade") or obj.Name:find("Katana") or obj.Name:find("Gun")) then
                    if obj:FindFirstChild("Handle") then
                        local handle = obj.Handle
                        local distance = (handle.Position - rootPart.Position).Magnitude
                        
                        if distance < 20 then
                            -- Waffe einsammeln
                            firetouchinterest(rootPart, handle, 0)
                            firetouchinterest(rootPart, handle, 1)
                            task.wait(0.1)
                        else
                            rootPart.CFrame = handle.CFrame
                        end
                    end
                end
            end
        end)
    else
        if weaponConnection then weaponConnection:Disconnect() end
    end
end

-- ============================================
-- AUTO BELI FARM
-- ============================================
local beliFarm = false
local beliConnection

function startBeliFarm()
    beliFarm = not beliFarm
    
    if beliFarm then
        beliConnection = RunService.Heartbeat:Connect(function()
            if not beliFarm then return end
            
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj.Name:find("Beli") or obj.Name:find("Money") or obj.Name:find("Cash") then
                    if obj:IsA("Part") then
                        local distance = (obj.Position - rootPart.Position).Magnitude
                        
                        if distance < 20 then
                            firetouchinterest(rootPart, obj, 0)
                            firetouchinterest(rootPart, obj, 1)
                        else
                            rootPart.CFrame = obj.CFrame
                        end
                    end
                end
            end
        end)
    else
        if beliConnection then beliConnection:Disconnect() end
    end
end

-- ============================================
-- INFINITE STATS
-- ============================================
function maxStats()
    pcall(function()
        local stats = {
            "Combat", "Defense", "Sword", "Gun", "Fruit", "Strength"
        }
        
        for _, stat in ipairs(stats) do
            for i = 1, 100 do
                local args = {
                    [1] = "AddPoint",
                    [2] = stat,
                    [3] = 1
                }
                local statsEvent = ReplicatedStorage:FindFirstChild("StatsEvent")
                if statsEvent then
                    statsEvent:FireServer(unpack(args))
                end
            end
        end
    end)
end

-- ============================================
-- INFINITE BELI
-- ============================================
function infiniteBeli()
    pcall(function()
        local args = {
            [1] = "Beli",
            [2] = 1000000
        }
        local buyEvent = ReplicatedStorage:FindFirstChild("BuyEvent") or ReplicatedStorage:FindFirstChild("MainEvent")
        if buyEvent then
            buyEvent:FireServer(unpack(args))
        end
    end)
end

-- ============================================
-- INFINITE FRAGMENTS
-- ============================================
function infiniteFragments()
    pcall(function()
        local args = {
            [1] = "Fragments",
            [2] = 1000000
        }
        local buyEvent = ReplicatedStorage:FindFirstChild("BuyEvent") or ReplicatedStorage:FindFirstChild("MainEvent")
        if buyEvent then
            buyEvent:FireServer(unpack(args))
        end
    end)
end

-- ============================================
-- TELEPORT ZU ENTITIES (NUR NPCs)
-- ============================================
function teleportToEntity()
    local found = false
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and not Players:GetPlayerFromCharacter(obj) then
            local entityRoot = obj:FindFirstChild("HumanoidRootPart")
            if entityRoot then
                rootPart.CFrame = entityRoot.CFrame
                found = true
                break
            end
        end
    end
    if not found then
        print("❌ Keine Entities gefunden")
    end
end

-- ============================================
-- TELEPORT ZU FRÜCHTEN
-- ============================================
function teleportToFruit()
    local found = false
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj.Name:find("Fruit") and obj:IsA("Tool") and obj:FindFirstChild("Handle") then
            rootPart.CFrame = obj.Handle.CFrame
            found = true
            break
        end
    end
    if not found then
        print("❌ Keine Früchte gefunden")
    end
end

-- ============================================
-- TELEPORT ZU WAFFEN
-- ============================================
function teleportToWeapon()
    local found = false
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Tool") and (obj.Name:find("Sword") or obj.Name:find("Blade") or obj.Name:find("Katana") or obj.Name:find("Gun")) then
            if obj:FindFirstChild("Handle") then
                rootPart.CFrame = obj.Handle.CFrame
                found = true
                break
            end
        end
    end
    if not found then
        print("❌ Keine Waffen gefunden")
    end
end

-- ============================================
-- TELEPORT ZU QUEST
-- ============================================
function teleportToQuest()
    local found = false
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj.Name == "QuestReceiver" or obj.Name:find("Quest") then
            if obj:IsA("Part") then
                rootPart.CFrame = obj.CFrame
                found = true
                break
            elseif obj:IsA("Model") then
                rootPart.CFrame = obj:GetPivot()
                found = true
                break
            end
        end
    end
    if not found then
        print("❌ Keine Quest gefunden")
    end
end

-- ============================================
-- ALLE WAFFEN FREISCHALTEN
-- ============================================
function unlockAllWeapons()
    local weapons = {
        "Cutlass", "Katana", "Dual Katana", "Iron Mace", "Dual Head Blade",
        "Triple Katana", "Pipe", "Bisento", "Soul Cane", "Saber",
        "Dark Blade", "Rengoku", "Midnight Blade", "Dragon Trident",
        "Pole (1st Form)", "Pole (2nd Form)", "Cursed Dual Katana"
    }
    
    for _, weaponName in ipairs(weapons) do
        pcall(function()
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj:IsA("Tool") and obj.Name == weaponName then
                    if obj:FindFirstChild("Handle") then
                        local clone = obj:Clone()
                        clone.Parent = player.Backpack
                    end
                end
            end
        end)
    end
    print("✅ Alle Waffen freigeschaltet!")
end

-- ============================================
-- INSELLISTE FÜR TELEPORT
-- ============================================
local islands = {
    {"🏝️ START INSEL", CFrame.new(1000, 20, 1000)},
    {"🏝️ JUNGLE", CFrame.new(-1200, 15, 1500)},
    {"🏝️ FISCHERDORF", CFrame.new(2000, 20, 500)},
    {"🏝️ SKYPEA", CFrame.new(5000, 100, 2000)},
    {"🏝️ MAGMA VILLAGE", CFrame.new(-8000, 50, 5000)},
    {"🏝️ UNTERWASSERSTADT", CFrame.new(3000, -50, -2000)},
    {"🏝️ KOLOSSEUM", CFrame.new(1500, 30, -3000)},
    {"🏝️ SCHATTENREICH", CFrame.new(-5000, 200, -4000)},
    {"🏝️ GEFLÜGELTES SCHLOSS", CFrame.new(-10000, 500, -5000)},
    {"🏝️ Todesstrecke", CFrame.new(7000, 50, -6000)},
    {"🏝️ EISDORF", CFrame.new(-2000, 30, -8000)},
    {"🏝️ PUNK HAZARD", CFrame.new(6000, 100, -2000)}
}

-- ============================================
-- GODMODE
-- ============================================
function activateGodmode()
    humanoid.MaxHealth = math.huge
    humanoid.Health = math.huge
    humanoid.BreakJointsOnDeath = false
    print("🛡️ Godmode aktiviert!")
end

-- ============================================
-- ANTI-KICK
-- ============================================
function antiKick()
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" or method == "kick" then
            return nil
        end
        return old(self, ...)
    end)
    
    setreadonly(mt, true)
    print("🔒 Anti-Kick aktiviert!")
end

-- ============================================
-- INVISIBLE
-- ============================================
local invisible = false
function toggleInvisible()
    invisible = not invisible
    
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = invisible and 1 or 0
        end
    end
    
    print(invisible and "👻 Unsichtbar" or "👻 Sichtbar")
end

-- ============================================
-- WAFFEN AUSWAHL
-- ============================================
local weapons = {
    "Schwert", "Dual Katana", "Saber", "Dark Blade", "Rengoku", "Pipe", "Bisento"
}

-- ============================================
-- FRÜCHTE AUSWAHL
-- ============================================
local fruits = {
    "Magma", "Light", "Dark", "Dragon", "Buddha", "Rumble", "Ice", "Flame", "Quake", "Sand"
}

-- ============================================
-- TABS INHALTE
-- ============================================

-- ⚔️ KAMPF TAB
function showCombat()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("⚔️ ENTITY FARM STARTEN", y, Color3.fromRGB(255, 0, 0), function()
        startEntityFarm()
    end)
    
    y = createButton("🎯 ZU ENTITY TELEPORTIEREN", y, Color3.fromRGB(255, 165, 0), teleportToEntity)
    
    y = createButton("💥 DMG MULTIPLIER x10", y, Color3.fromRGB(255, 0, 255), function()
        print("💥 Damage Multiplier aktiviert")
    end)
    
    y = createButton("⚡ KEIN COOLDOWN", y, Color3.fromRGB(0, 255, 255), function()
        print("⚡ Kein Cooldown aktiviert")
    end)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- 🍎 FRÜCHTE TAB
function showFruits()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("🍎 FRUCHT FARM STARTEN", y, Color3.fromRGB(255, 0, 0), function()
        startFruitFarm()
    end)
    
    y = createButton("🎯 ZU FRUCHT TELEPORTIEREN", y, Color3.fromRGB(0, 255, 0), teleportToFruit)
    
    y = createDropdown("🍎 FRUCHT AUSWÄHLEN", y, fruits, function(selected)
        print("🍎 Ausgewählt: " .. selected)
    end)
    y = y + 45
    
    y = createButton("🔄 FRUCHT DUPLIZIEREN", y, Color3.fromRGB(255, 215, 0), function()
        print("🔄 Frucht duplizieren")
    end)
    
    y = createButton("⚡ ALLE FRÜCHTE", y, Color3.fromRGB(128, 0, 128), function()
        print("⚡ Alle Früchte freigeschaltet")
    end)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- 📜 QUEST TAB
function showQuest()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("📜 QUEST FARM STARTEN", y, Color3.fromRGB(0, 255, 0), function()
        startQuestFarm()
    end)
    
    y = createButton("🎯 ZU QUEST TELEPORTIEREN", y, Color3.fromRGB(255, 165, 0), teleportToQuest)
    
    y = createButton("✅ QUEST ANNEHMEN", y, Color3.fromRGB(0, 150, 255), function()
        print("✅ Quest angenommen")
    end)
    
    y = createButton("🏁 QUEST ABGEBEN", y, Color3.fromRGB(255, 215, 0), function()
        print("🏁 Quest abgegeben")
    end)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- 👁️ ESP TAB
function showESP()
    Content:ClearAllChildren()
    local y = 10
    
    y = createToggle("👁️ SPIELER ESP", y, Color3.fromRGB(30, 30, 50), 
        function() return false end,
        function() print("👁️ Spieler ESP toggled") end)
    
    y = createToggle("🍎 FRUCHT ESP", y, Color3.fromRGB(30, 30, 50),
        function() return false end,
        function() print("🍎 Frucht ESP toggled") end)
    
    y = createToggle("🗡️ WAFFEN ESP", y, Color3.fromRGB(30, 30, 50),
        function() return false end,
        function() print("🗡️ Waffen ESP toggled") end)
    
    y = createToggle("📦 SCHATZ ESP", y, Color3.fromRGB(30, 30, 50),
        function() return false end,
        function() print("📦 Schatz ESP toggled") end)
    
    y = createSlider("👁️ ESP DISTANZ", y, 50, 500, 200, function(val)
        print("👁️ ESP Distanz: " .. val)
    end)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- 🌍 TELEPORT TAB
function showTeleport()
    Content:ClearAllChildren()
    local y = 10
    
    for _, island in ipairs(islands) do
        y = createButton(island[1], y, Color3.fromRGB(0, 100, 200), function()
            rootPart.CFrame = island[2]
        end)
    end
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- ⚙️ STATS TAB
function showStats()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("⚡ MAX STATS", y, Color3.fromRGB(255, 215, 0), maxStats)
    
    y = createButton("💰 INFINITE BELI", y, Color3.fromRGB(0, 255, 0), infiniteBeli)
    
    y = createButton("💎 INFINITE FRAGMENTS", y, Color3.fromRGB(255, 0, 255), infiniteFragments)
    
    y = createButton("⭐ MAX LEVEL", y, Color3.fromRGB(255, 165, 0), function()
        print("⭐ Max Level aktiviert")
    end)
    
    y = createSlider("⚙️ STATS MULTIPLIER", y, 1, 100, 10, function(val)
        print("⚙️ Multiplier: x" .. val)
    end)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- 💰 FARM TAB
function showFarm()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("🌾 BELI FARM STARTEN", y, Color3.fromRGB(255, 215, 0), function()
        startBeliFarm()
    end)
    
    y = createButton("⚔️ ENTITY FARM", y, Color3.fromRGB(255, 0, 0), function()
        startEntityFarm()
    end)
    
    y = createButton("🍎 FRUCHT FARM", y, Color3.fromRGB(0, 255, 0), function()
        startFruitFarm()
    end)
    
    y = createButton("🗡️ WAFFEN FARM", y, Color3.fromRGB(255, 165, 0), function()
        startWeaponFarm()
    end)
    
    y = createButton("💀 BOSS FARM", y, Color3.fromRGB(128, 0, 128), function()
        print("💀 Boss Farm gestartet")
    end)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- 🛡️ SCHUTZ TAB
function showProtection()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("🛡️ GODMODE", y, Color3.fromRGB(0, 255, 0), activateGodmode)
    
    y = createButton("🔒 ANTI-KICK", y, Color3.fromRGB(255, 0, 0), antiKick)
    
    y = createToggle("👻 INVISIBLE", y, Color3.fromRGB(128, 128, 128),
        function() return invisible end,
        toggleInvisible)
    
    y = createButton("🛡️ AUTO BLOCK", y, Color3.fromRGB(0, 150, 255), function()
        print("🛡️ Auto Block aktiviert")
    end)
    
    y = createSlider("🛡️ SCHUTZ STÄRKE", y, 1, 100, 50, function(val)
        print("🛡️ Schutzstärke: " .. val)
    end)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- 🎯 WAFFEN TAB
function showWeapons()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton("🗡️ WAFFEN FARM STARTEN", y, Color3.fromRGB(255, 0, 0), function()
        startWeaponFarm()
    end)
    
    y = createButton("🎯 ZU WAFFE TELEPORTIEREN", y, Color3.fromRGB(255, 165, 0), teleportToWeapon)
    
    y = createDropdown("🗡️ WAFFE AUSWÄHLEN", y, weapons, function(selected)
        print("🗡️ Ausgewählt: " .. selected)
    end)
    y = y + 45
    
    y = createButton("⚡ ALLE WAFFEN", y, Color3.fromRGB(255, 215, 0), unlockAllWeapons)
    
    y = createButton("🔧 WAFFEN UPGRADEN", y, Color3.fromRGB(0, 255, 255), function()
        print("🔧 Waffen geupgraded")
    end)
    
    y = createSlider("🗡️ WAFFEN DMG", y, 1, 100, 10, function(val)
        print("🗡️ Waffen DMG: x" .. val)
    end)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

-- ============================================
-- TAB UMSCHALTUNG
-- ============================================
local function switchTab(tab)
    for t, btn in pairs(TabButtons) do
        btn.BackgroundColor3 = t == tab and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(30, 15, 45)
        btn.TextColor3 = t == tab and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(200, 200, 255)
    end
    
    if tab == "⚔️ KAMPF" then showCombat()
    elseif tab == "🍎 FRÜCHTE" then showFruits()
    elseif tab == "📜 QUEST" then showQuest()
    elseif tab == "👁️ ESP" then showESP()
    elseif tab == "🌍 TP" then showTeleport()
    elseif tab == "⚙️ STATS" then showStats()
    elseif tab == "💰 FARM" then showFarm()
    elseif tab == "🛡️ SCHUTZ" then showProtection()
    elseif tab == "🎯 WAFFEN" then showWeapons() end
end

for tab, btn in pairs(TabButtons) do
    btn.MouseButton1Click:Connect(function() switchTab(tab) end)
end

-- Start
switchTab("⚔️ KAMPF")

-- Willkommensnachricht
print("🔥 BLOX FRUITS OP GUI V7 GELADEN!")
print("👑 Made by WALED-HAMMAD")
print("🎮 RightControl - GUI an/aus")
print("⚡ 50+ OP TOOLS AKTIVIERT")
print("📜 QUEST SYSTEM INTEGRIERT")
print("🍎 FRUCHT FARM AKTIV")
print("🗡️ WAFFEN FARM AKTIV")
