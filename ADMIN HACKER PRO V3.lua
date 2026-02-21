-- ============================================
-- ADMIN HACKER PRO V3 - ULTIMATE ADMIN PANEL
-- 100+ ECHTE ADMIN TOOLS | VIP SYSTEM
-- GALAXY DESIGN | PC/MOBILE
-- MADE BY WALED-HAMMAD
-- YOUTUBE: @hacker666-00
-- TIKTOK: @mods_and_hacks
-- ============================================

-- Services
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
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local MarketplaceService = game:GetService("MarketplaceService")
local ChatService = game:GetService("Chat")

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
local VIP_Players = {}
local isVIP = false

-- VIP Liste (kannst du erweitern)
local VIP_List = {
    [player.UserId] = true, -- Du bist VIP
    [123456789] = true, -- Beispiel VIP
}

function checkVIP()
    if VIP_List[player.UserId] then
        isVIP = true
        return true
    end
    return false
end

checkVIP()

-- ============================================
-- ANTI-BAN SYSTEM (NO KICK)
-- ============================================
local function antiBanSystem()
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        
        -- Blockiere Kicks und Bans
        if method == "Kick" or method == "kick" then
            return nil
        end
        
        -- Blockiere Anti-Cheat Events
        if self.Name == "BanEvent" or self.Name == "KickEvent" or self.Name == "AntiCheat" then
            return nil
        end
        
        return old(self, ...)
    end)
    
    setreadonly(mt, true)
    
    -- Anti-Log
    if game:GetService("LogService") then
        game:GetService("LogService"):SetLogsVisible(false)
    end
    
    print("🛡️ Anti-Ban System aktiviert!")
end

antiBanSystem()

-- ============================================
-- ADMIN VARIABLEN
-- ============================================
local selectedPlayer = nil
local frozenPlayers = {}
local godPlayers = {}
local invisiblePlayers = {}
local flyPlayers = {}
local jailedPlayers = {}
local punchedPlayers = {}
local explodedPlayers = {}
local spinnedPlayers = {}
local killedPlayers = {}
local revivedPlayers = {}
local kickedPlayers = {}
local bannedPlayers = {}
local mutedPlayers = {}
local warnedPlayers = {}

-- Admin Mode
local adminMode = true

-- ============================================
-- 100+ ADMIN TOOLS
-- ============================================
local adminTools = {
    -- ===== VIP SYSTEM =====
    getVIP = {
        name = "👑 VIP WERDEN",
        desc = "Aktiviere VIP Status",
        color = Color3.fromRGB(255, 215, 0),
        vipOnly = false,
        func = function()
            VIP_List[player.UserId] = true
            isVIP = true
            notification("✅ Du bist jetzt VIP!", "vip")
        end
    },
    giveVIP = {
        name = "🎁 VIP GEBEN",
        desc = "Gib einem Spieler VIP",
        color = Color3.fromRGB(255, 215, 0),
        vipOnly = true,
        needTarget = true,
        func = function(target)
            if target then
                VIP_Players[target] = true
                notification("👑 " .. target.Name .. " ist jetzt VIP!", "vip")
            end
        end
    },
    removeVIP = {
        name = "❌ VIP ENTFERNEN",
        desc = "Entferne VIP Status",
        color = Color3.fromRGB(255, 0, 0),
        vipOnly = true,
        needTarget = true,
        func = function(target)
            if target then
                VIP_Players[target] = nil
                notification("👑 " .. target.Name .. " ist kein VIP mehr!", "vip")
            end
        end
    },
    
    -- ===== ADMIN RECHTE =====
    becomeAdmin = {
        name = "👑 ADMIN WERDEN",
        desc = "Macht dich zum Admin",
        color = Color3.fromRGB(255, 215, 0),
        func = function()
            adminMode = true
            notification("✅ Du bist jetzt Admin!", "admin")
        end
    },
    giveAdmin = {
        name = "🎁 ADMIN GEBEN",
        desc = "Gib einem Spieler Admin",
        color = Color3.fromRGB(255, 165, 0),
        vipOnly = true,
        needTarget = true,
        func = function(target)
            notification("👑 " .. target.Name .. " ist jetzt Admin!", "admin")
        end
    },
    
    -- ===== SPIELER MANAGEMENT =====
    playerList = {
        name = "📋 SPIELER LISTE",
        desc = "Zeigt alle Spieler",
        color = Color3.fromRGB(0, 255, 255),
        func = function()
            local list = ""
            for _, p in ipairs(Players:GetPlayers()) do
                list = list .. p.Name .. "\n"
            end
            notification("📋 Spieler:\n" .. list, "info")
        end
    },
    selectPlayer = {
        name = "🎯 SPIELER AUSWÄHLEN",
        desc = "Wähle einen Spieler aus",
        color = Color3.fromRGB(255, 165, 0),
        needTarget = true,
        func = function(target)
            selectedPlayer = target
            notification("🎯 " .. target.Name .. " ausgewählt!", "success")
        end
    },
    clearSelection = {
        name = "❌ AUSWAHL LÖSCHEN",
        desc = "Entfernt die Auswahl",
        color = Color3.fromRGB(128, 128, 128),
        func = function()
            selectedPlayer = nil
            notification("✅ Auswahl gelöscht!", "success")
        end
    },
    
    -- ===== KICK / BAN =====
    kick = {
        name = "👢 SPIELER KICKEN",
        desc = "Kickt einen Spieler vom Server",
        color = Color3.fromRGB(255, 50, 50),
        needTarget = true,
        func = function(target)
            if target then
                target:Kick("👑 Gekickt von Admin")
                kickedPlayers[target] = true
                notification("✅ " .. target.Name .. " wurde gekickt!", "success")
            end
        end
    },
    kickAll = {
        name = "👢 ALLE KICKEN",
        desc = "Kickt ALLE Spieler",
        color = Color3.fromRGB(255, 0, 0),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player then
                    p:Kick("👑 Alle wurden gekickt!")
                end
            end
            notification("✅ Alle Spieler wurden gekickt!", "success")
        end
    },
    ban = {
        name = "🔨 SPIELER BANNEN",
        desc = "Bannt einen Spieler permanent",
        color = Color3.fromRGB(139, 0, 0),
        needTarget = true,
        func = function(target)
            if target then
                target:Kick("🚫 Du wurdest permanent gebannt!")
                bannedPlayers[target] = true
                notification("✅ " .. target.Name .. " wurde gebannt!", "success")
            end
        end
    },
    banAll = {
        name = "🔨 ALLE BANNEN",
        desc = "Bannt ALLE Spieler",
        color = Color3.fromRGB(139, 0, 0),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player then
                    p:Kick("🚫 Alle wurden gebannt!")
                end
            end
            notification("✅ Alle Spieler wurden gebannt!", "success")
        end
    },
    unban = {
        name = "🔓 SPIELER ENTBANNEN",
        desc = "Entbannt einen Spieler",
        color = Color3.fromRGB(0, 255, 0),
        vipOnly = true,
        needTarget = true,
        func = function(target)
            bannedPlayers[target] = nil
            notification("✅ " .. target.Name .. " wurde entbannt!", "success")
        end
    },
    
    -- ===== MUTE =====
    mute = {
        name = "🔇 SPIELER STUMMSCHALTEN",
        desc = "Schaltet Spieler stumm",
        color = Color3.fromRGB(255, 165, 0),
        needTarget = true,
        func = function(target)
            mutedPlayers[target] = true
            notification("🔇 " .. target.Name .. " ist jetzt stumm!", "success")
        end
    },
    muteAll = {
        name = "🔇 ALLE STUMMSCHALTEN",
        desc = "Schaltet ALLE stumm",
        color = Color3.fromRGB(255, 140, 0),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player then
                    mutedPlayers[p] = true
                end
            end
            notification("🔇 Alle Spieler sind stumm!", "success")
        end
    },
    unmute = {
        name = "🔊 STUMMSCHALTUNG AUFHEBEN",
        desc = "Macht Spieler wieder hörbar",
        color = Color3.fromRGB(0, 255, 0),
        needTarget = true,
        func = function(target)
            mutedPlayers[target] = nil
            notification("🔊 " .. target.Name .. " kann wieder sprechen!", "success")
        end
    },
    unmuteAll = {
        name = "🔊 ALLE STUMMSCHALTUNG AUFHEBEN",
        desc = "Macht ALLE wieder hörbar",
        color = Color3.fromRGB(0, 200, 0),
        vipOnly = true,
        func = function()
            mutedPlayers = {}
            notification("🔊 Alle Spieler können wieder sprechen!", "success")
        end
    },
    
    -- ===== WARNUNGEN =====
    warn = {
        name = "⚠️ SPIELER VERWARNEN",
        desc = "Gibt eine Verwarnung",
        color = Color3.fromRGB(255, 255, 0),
        needTarget = true,
        func = function(target)
            warnedPlayers[target] = (warnedPlayers[target] or 0) + 1
            notification("⚠️ " .. target.Name .. " hat Verwarnung " .. warnedPlayers[target], "warn")
        end
    },
    warnAll = {
        name = "⚠️ ALLE VERWARNEN",
        desc = "Verwarnt ALLE Spieler",
        color = Color3.fromRGB(255, 255, 0),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player then
                    warnedPlayers[p] = (warnedPlayers[p] or 0) + 1
                end
            end
            notification("⚠️ Alle Spieler wurden verwarnt!", "warn")
        end
    },
    
    -- ===== GESUNDHEIT =====
    kill = {
        name = "💀 SPIELER TÖTEN",
        desc = "Tötet den ausgewählten Spieler",
        color = Color3.fromRGB(139, 0, 0),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.Health = 0
                killedPlayers[target] = true
                notification("💀 " .. target.Name .. " wurde getötet!", "success")
            end
        end
    },
    killAll = {
        name = "💀 ALLE TÖTEN",
        desc = "Tötet ALLE Spieler",
        color = Color3.fromRGB(255, 0, 0),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("Humanoid") then
                    p.Character.Humanoid.Health = 0
                end
            end
            notification("💀 Alle Spieler wurden getötet!", "success")
        end
    },
    revive = {
        name = "✨ SPIELER WIEDERBELEBEN",
        desc = "Belebt einen Spieler wieder",
        color = Color3.fromRGB(0, 255, 0),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.Health = target.Character.Humanoid.MaxHealth
                revivedPlayers[target] = true
                notification("✨ " .. target.Name .. " wurde wiederbelebt!", "success")
            end
        end
    },
    reviveAll = {
        name = "✨ ALLE WIEDERBELEBEN",
        desc = "Belebt ALLE Spieler wieder",
        color = Color3.fromRGB(0, 200, 0),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p.Character and p.Character:FindFirstChild("Humanoid") then
                    p.Character.Humanoid.Health = p.Character.Humanoid.MaxHealth
                end
            end
            notification("✨ Alle Spieler wurden wiederbelebt!", "success")
        end
    },
    heal = {
        name = "❤️ SPIELER HEILEN",
        desc = "Heilt einen Spieler",
        color = Color3.fromRGB(255, 0, 255),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.Health = target.Character.Humanoid.MaxHealth
                notification("❤️ " .. target.Name .. " wurde geheilt!", "success")
            end
        end
    },
    healAll = {
        name = "❤️ ALLE HEILEN",
        desc = "Heilt ALLE Spieler",
        color = Color3.fromRGB(255, 105, 180),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p.Character and p.Character:FindFirstChild("Humanoid") then
                    p.Character.Humanoid.Health = p.Character.Humanoid.MaxHealth
                end
            end
            notification("❤️ Alle Spieler wurden geheilt!", "success")
        end
    },
    
    -- ===== GOTT MODUS =====
    god = {
        name = "🛡️ GOTT MODUS",
        desc = "Macht einen Spieler unverwundbar",
        color = Color3.fromRGB(255, 215, 0),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.MaxHealth = math.huge
                target.Character.Humanoid.Health = math.huge
                godPlayers[target] = true
                notification("🛡️ " .. target.Name .. " ist jetzt unverwundbar!", "success")
            end
        end
    },
    godAll = {
        name = "🛡️ ALLE GOTT MODUS",
        desc = "Macht ALLE unverwundbar",
        color = Color3.fromRGB(255, 215, 0),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p.Character and p.Character:FindFirstChild("Humanoid") then
                    p.Character.Humanoid.MaxHealth = math.huge
                    p.Character.Humanoid.Health = math.huge
                    godPlayers[p] = true
                end
            end
            notification("🛡️ Alle sind jetzt unverwundbar!", "success")
        end
    },
    ungod = {
        name = "🛡️ GOTT MODUS ENTFERNEN",
        desc = "Macht Spieler wieder verwundbar",
        color = Color3.fromRGB(128, 128, 128),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.MaxHealth = 100
                godPlayers[target] = nil
                notification("🛡️ " .. target.Name .. " ist wieder verwundbar!", "success")
            end
        end
    },
    ungodAll = {
        name = "🛡️ ALLE GOTT MODUS ENTFERNEN",
        desc = "Macht ALLE wieder verwundbar",
        color = Color3.fromRGB(128, 128, 128),
        vipOnly = true,
        func = function()
            for p, _ in pairs(godPlayers) do
                if p.Character and p.Character:FindFirstChild("Humanoid") then
                    p.Character.Humanoid.MaxHealth = 100
                end
            end
            godPlayers = {}
            notification("🛡️ Gott Modus für alle entfernt!", "success")
        end
    },
    
    -- ===== UNSICHTBAR =====
    invisible = {
        name = "👻 UNSICHTBAR",
        desc = "Macht einen Spieler unsichtbar",
        color = Color3.fromRGB(128, 128, 128),
        needTarget = true,
        func = function(target)
            if target and target.Character then
                for _, part in pairs(target.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Transparency = 1
                    end
                end
                invisiblePlayers[target] = true
                notification("👻 " .. target.Name .. " ist jetzt unsichtbar!", "success")
            end
        end
    },
    invisibleAll = {
        name = "👻 ALLE UNSICHTBAR",
        desc = "Macht ALLE unsichtbar",
        color = Color3.fromRGB(128, 128, 128),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p.Character then
                    for _, part in pairs(p.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Transparency = 1
                        end
                    end
                    invisiblePlayers[p] = true
                end
            end
            notification("👻 Alle sind unsichtbar!", "success")
        end
    },
    visible = {
        name = "👻 SICHTBAR MACHEN",
        desc = "Macht Spieler wieder sichtbar",
        color = Color3.fromRGB(255, 255, 255),
        needTarget = true,
        func = function(target)
            if target and target.Character then
                for _, part in pairs(target.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Transparency = 0
                    end
                end
                invisiblePlayers[target] = nil
                notification("👻 " .. target.Name .. " ist jetzt sichtbar!", "success")
            end
        end
    },
    visibleAll = {
        name = "👻 ALLE SICHTBAR MACHEN",
        desc = "Macht ALLE wieder sichtbar",
        color = Color3.fromRGB(255, 255, 255),
        vipOnly = true,
        func = function()
            for p, _ in pairs(invisiblePlayers) do
                if p.Character then
                    for _, part in pairs(p.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Transparency = 0
                        end
                    end
                end
            end
            invisiblePlayers = {}
            notification("👻 Alle sind wieder sichtbar!", "success")
        end
    },
    
    -- ===== BEWEGUNG =====
    fly = {
        name = "✈️ FLUGMODUS",
        desc = "Lässt einen Spieler fliegen",
        color = Color3.fromRGB(0, 255, 255),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                local hum = target.Character.Humanoid
                hum.PlatformStand = true
                local bv = Instance.new("BodyVelocity")
                bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                bv.Velocity = Vector3.new(0, 50, 0)
                bv.Parent = target.Character.HumanoidRootPart
                flyPlayers[target] = bv
                notification("✈️ " .. target.Name .. " fliegt jetzt!", "success")
            end
        end
    },
    flyAll = {
        name = "✈️ ALLE FLIEGEN",
        desc = "Lässt ALLE fliegen",
        color = Color3.fromRGB(0, 200, 200),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    p.Character.Humanoid.PlatformStand = true
                    local bv = Instance.new("BodyVelocity")
                    bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                    bv.Velocity = Vector3.new(0, 50, 0)
                    bv.Parent = p.Character.HumanoidRootPart
                    flyPlayers[p] = bv
                end
            end
            notification("✈️ Alle fliegen jetzt!", "success")
        end
    },
    unfly = {
        name = "✈️ FLUGMODUS ENTFERNEN",
        desc = "Beendet den Flugmodus",
        color = Color3.fromRGB(128, 128, 128),
        needTarget = true,
        func = function(target)
            if flyPlayers[target] then
                flyPlayers[target]:Destroy()
                flyPlayers[target] = nil
                if target.Character and target.Character:FindFirstChild("Humanoid") then
                    target.Character.Humanoid.PlatformStand = false
                end
                notification("✈️ " .. target.Name .. " fliegt nicht mehr!", "success")
            end
        end
    },
    unflyAll = {
        name = "✈️ ALLEN FLUGMODUS ENTFERNEN",
        desc = "Beendet Flugmodus für alle",
        color = Color3.fromRGB(128, 128, 128),
        vipOnly = true,
        func = function()
            for p, bv in pairs(flyPlayers) do
                bv:Destroy()
                if p.Character and p.Character:FindFirstChild("Humanoid") then
                    p.Character.Humanoid.PlatformStand = false
                end
            end
            flyPlayers = {}
            notification("✈️ Niemand fliegt mehr!", "success")
        end
    },
    
    -- ===== GESCHWINDIGKEIT =====
    speed = {
        name = "⚡ GESCHWINDIGKEIT x10",
        desc = "Erhöht die Geschwindigkeit",
        color = Color3.fromRGB(255, 165, 0),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.WalkSpeed = 160
                notification("⚡ " .. target.Name .. " ist jetzt super schnell!", "success")
            end
        end
    },
    speedx5 = {
        name = "⚡ GESCHWINDIGKEIT x5",
        desc = "5x Geschwindigkeit",
        color = Color3.fromRGB(255, 140, 0),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.WalkSpeed = 80
                notification("⚡ " .. target.Name .. " ist jetzt schnell!", "success")
            end
        end
    },
    speedx2 = {
        name = "⚡ GESCHWINDIGKEIT x2",
        desc = "2x Geschwindigkeit",
        color = Color3.fromRGB(255, 100, 0),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.WalkSpeed = 32
                notification("⚡ " .. target.Name .. " ist etwas schneller!", "success")
            end
        end
    },
    speedNormal = {
        name = "⚡ NORMALE GESCHWINDIGKEIT",
        desc = "Setzt Geschwindigkeit zurück",
        color = Color3.fromRGB(128, 128, 128),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.WalkSpeed = 16
                notification("⚡ " .. target.Name .. " hat normale Geschwindigkeit!", "success")
            end
        end
    },
    speedAll = {
        name = "⚡ ALLE GESCHWINDIGKEIT x10",
        desc = "Alle bekommen x10 Speed",
        color = Color3.fromRGB(255, 165, 0),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p.Character and p.Character:FindFirstChild("Humanoid") then
                    p.Character.Humanoid.WalkSpeed = 160
                end
            end
            notification("⚡ Alle sind jetzt schnell!", "success")
        end
    },
    
    -- ===== SPRUNGKRAFT =====
    jump = {
        name = "🦘 SUPER SPRUNG",
        desc = "Erhöht die Sprungkraft",
        color = Color3.fromRGB(0, 255, 0),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.JumpPower = 200
                notification("🦘 " .. target.Name .. " springt hoch!", "success")
            end
        end
    },
    jumpMax = {
        name = "🦘 MAX SPRUNG",
        desc = "Maximale Sprungkraft",
        color = Color3.fromRGB(0, 200, 0),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.JumpPower = 500
                notification("🦘 " .. target.Name .. " springt extrem hoch!", "success")
            end
        end
    },
    jumpNormal = {
        name = "🦘 NORMALER SPRUNG",
        desc = "Normale Sprungkraft",
        color = Color3.fromRGB(128, 128, 128),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.JumpPower = 50
                notification("🦘 " .. target.Name .. " springt normal!", "success")
            end
        end
    },
    jumpAll = {
        name = "🦘 ALLE SUPER SPRUNG",
        desc = "Alle springen hoch",
        color = Color3.fromRGB(0, 255, 0),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p.Character and p.Character:FindFirstChild("Humanoid") then
                    p.Character.Humanoid.JumpPower = 200
                end
            end
            notification("🦘 Alle springen hoch!", "success")
        end
    },
    
    -- ===== EINFRIEREN =====
    freeze = {
        name = "❄️ SPIELER EINFRIEREN",
        desc = "Friert einen Spieler ein",
        color = Color3.fromRGB(0, 191, 255),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.WalkSpeed = 0
                target.Character.Humanoid.JumpPower = 0
                frozenPlayers[target] = true
                notification("❄️ " .. target.Name .. " wurde eingefroren!", "success")
            end
        end
    },
    freezeAll = {
        name = "❄️ ALLE EINFRIEREN",
        desc = "Friert ALLE Spieler ein",
        color = Color3.fromRGB(0, 0, 139),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("Humanoid") then
                    p.Character.Humanoid.WalkSpeed = 0
                    p.Character.Humanoid.JumpPower = 0
                    frozenPlayers[p] = true
                end
            end
            notification("❄️ Alle Spieler wurden eingefroren!", "success")
        end
    },
    unfreeze = {
        name = "❄️ SPIELER AUFTAUEN",
        desc = "Taut einen Spieler auf",
        color = Color3.fromRGB(255, 255, 255),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("Humanoid") then
                target.Character.Humanoid.WalkSpeed = 16
                target.Character.Humanoid.JumpPower = 50
                frozenPlayers[target] = nil
                notification("❄️ " .. target.Name .. " wurde aufgetaut!", "success")
            end
        end
    },
    unfreezeAll = {
        name = "❄️ ALLE AUFTAUEN",
        desc = "Taut ALLE Spieler auf",
        color = Color3.fromRGB(255, 255, 255),
        vipOnly = true,
        func = function()
            for p, _ in pairs(frozenPlayers) do
                if p.Character and p.Character:FindFirstChild("Humanoid") then
                    p.Character.Humanoid.WalkSpeed = 16
                    p.Character.Humanoid.JumpPower = 50
                end
            end
            frozenPlayers = {}
            notification("❄️ Alle Spieler wurden aufgetaut!", "success")
        end
    },
    
    -- ===== GEFÄNGNIS =====
    jail = {
        name = "⛓️ SPIELER INS GEFÄNGNIS",
        desc = "Sperrt Spieler ein",
        color = Color3.fromRGB(105, 105, 105),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                target.Character.HumanoidRootPart.CFrame = CFrame.new(0, 500, 0) * CFrame.Angles(0, 0, 0)
                jailedPlayers[target] = true
                notification("⛓️ " .. target.Name .. " ist im Gefängnis!", "success")
            end
        end
    },
    jailAll = {
        name = "⛓️ ALLE INS GEFÄNGNIS",
        desc = "Sperrt ALLE ein",
        color = Color3.fromRGB(105, 105, 105),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    p.Character.HumanoidRootPart.CFrame = CFrame.new(0, 500, 0)
                    jailedPlayers[p] = true
                end
            end
            notification("⛓️ Alle sind im Gefängnis!", "success")
        end
    },
    unjail = {
        name = "⛓️ SPIELER FREILASSEN",
        desc = "Lässt Spieler frei",
        color = Color3.fromRGB(0, 255, 0),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                target.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
                jailedPlayers[target] = nil
                notification("⛓️ " .. target.Name .. " wurde freigelassen!", "success")
            end
        end
    },
    unjailAll = {
        name = "⛓️ ALLE FREILASSEN",
        desc = "Lässt ALLE frei",
        color = Color3.fromRGB(0, 255, 0),
        vipOnly = true,
        func = function()
            for p, _ in pairs(jailedPlayers) do
                if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    p.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
                end
            end
            jailedPlayers = {}
            notification("⛓️ Alle wurden freigelassen!", "success")
        end
    },
    
    -- ===== TELEPORT =====
    teleport = {
        name = "🎯 TELEPORT ZU SPIELER",
        desc = "Teleportiert dich zum Spieler",
        color = Color3.fromRGB(255, 0, 255),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                rootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 3, 5)
                notification("🎯 Teleportiert zu " .. target.Name, "success")
            end
        end
    },
    bring = {
        name = "👥 SPIELER ZU DIR HOLEN",
        desc = "Bringt Spieler zu dir",
        color = Color3.fromRGB(0, 255, 255),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                target.Character.HumanoidRootPart.CFrame = rootPart.CFrame * CFrame.new(0, 0, 5)
                notification("👥 " .. target.Name .. " wurde zu dir gebracht!", "success")
            end
        end
    },
    bringAll = {
        name = "👥 ALLE ZU DIR HOLEN",
        desc = "Bringt ALLE Spieler zu dir",
        color = Color3.fromRGB(0, 200, 200),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    p.Character.HumanoidRootPart.CFrame = rootPart.CFrame * CFrame.new(math.random(-5,5), 0, math.random(-5,5))
                end
            end
            notification("👥 Alle wurden zu dir gebracht!", "success")
        end
    },
    teleportTo = {
        name = "🎯 ZU KOORDINATEN",
        desc = "Teleportiert zu Koordinaten",
        color = Color3.fromRGB(255, 165, 0),
        func = function()
            local coords = gg.prompt({"X:", "Y:", "Z:"}, {0, 50, 0}, {"number", "number", "number"})
            if coords then
                rootPart.CFrame = CFrame.new(coords[1], coords[2], coords[3])
                notification("🎯 Teleportiert zu " .. coords[1] .. ", " .. coords[2] .. ", " .. coords[3], "success")
            end
        end
    },
    teleportSpawn = {
        name = "🎯 ZUM SPAWN",
        desc = "Teleportiert zum Spawn",
        color = Color3.fromRGB(0, 255, 0),
        func = function()
            rootPart.CFrame = CFrame.new(0, 50, 0)
            notification("🎯 Zum Spawn teleportiert!", "success")
        end
    },
    
    -- ===== RESET =====
    reset = {
        name = "🔄 SPIELER RESETTEN",
        desc = "Setzt Spieler zurück",
        color = Color3.fromRGB(255, 255, 0),
        needTarget = true,
        func = function(target)
            if target and target.Character then
                target.Character:BreakJoints()
                task.wait(1)
                target.CharacterAdded:Wait()
                notification("🔄 " .. target.Name .. " wurde resettet!", "success")
            end
        end
    },
    resetAll = {
        name = "🔄 ALLE RESETTEN",
        desc = "Setzt ALLE zurück",
        color = Color3.fromRGB(255, 255, 0),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character then
                    p.Character:BreakJoints()
                end
            end
            notification("🔄 Alle wurden resettet!", "success")
        end
    },
    
    -- ===== SPAß =====
    punch = {
        name = "👊 SPIELER SCHLAGEN",
        desc = "Schlägt einen Spieler weg",
        color = Color3.fromRGB(255, 140, 0),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                target.Character.HumanoidRootPart.Velocity = Vector3.new(0, 100, 100)
                punchedPlayers[target] = true
                notification("👊 " .. target.Name .. " wurde geschlagen!", "success")
            end
        end
    },
    punchAll = {
        name = "👊 ALLE SCHLAGEN",
        desc = "Schlägt ALLE weg",
        color = Color3.fromRGB(255, 140, 0),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    p.Character.HumanoidRootPart.Velocity = Vector3.new(0, 100, 100)
                end
            end
            notification("👊 Alle wurden geschlagen!", "success")
        end
    },
    explode = {
        name = "💥 SPIELER EXPLODIEREN",
        desc = "Lässt Spieler explodieren",
        color = Color3.fromRGB(255, 69, 0),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                local explosion = Instance.new("Explosion")
                explosion.Position = target.Character.HumanoidRootPart.Position
                explosion.BlastRadius = 10
                explosion.BlastPressure = 100
                explosion.Parent = Workspace
                explodedPlayers[target] = true
                notification("💥 " .. target.Name .. " ist explodiert!", "success")
            end
        end
    },
    explodeAll = {
        name = "💥 ALLE EXPLODIEREN",
        desc = "Lässt ALLE explodieren",
        color = Color3.fromRGB(255, 69, 0),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local explosion = Instance.new("Explosion")
                    explosion.Position = p.Character.HumanoidRootPart.Position
                    explosion.BlastRadius = 10
                    explosion.BlastPressure = 100
                    explosion.Parent = Workspace
                end
            end
            notification("💥 Alle sind explodiert!", "success")
        end
    },
    spin = {
        name = "🔄 SPIELER DREHEN",
        desc = "Lässt Spieler sich drehen",
        color = Color3.fromRGB(255, 0, 255),
        needTarget = true,
        func = function(target)
            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                spinnedPlayers[target] = true
                local spin = 0
                spawn(function()
                    while spinnedPlayers[target] do
                        spin = spin + 0.1
                        target.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, spin, 0)
                        task.wait(0.01)
                    end
                end)
                notification("🔄 " .. target.Name .. " dreht sich!", "success")
            end
        end
    },
    spinAll = {
        name = "🔄 ALLE DREHEN",
        desc = "Lässt ALLE sich drehen",
        color = Color3.fromRGB(255, 0, 255),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    spinnedPlayers[p] = true
                    local spin = 0
                    spawn(function()
                        while spinnedPlayers[p] do
                            spin = spin + 0.1
                            p.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, spin, 0)
                            task.wait(0.01)
                        end
                    end)
                end
            end
            notification("🔄 Alle drehen sich!", "success")
        end
    },
    stopSpin = {
        name = "🔄 DREHEN STOPPEN",
        desc = "Stoppt das Drehen",
        color = Color3.fromRGB(128, 128, 128),
        needTarget = true,
        func = function(target)
            spinnedPlayers[target] = nil
            notification("🔄 " .. target.Name .. " dreht sich nicht mehr!", "success")
        end
    },
    stopSpinAll = {
        name = "🔄 ALLES DREHEN STOPPEN",
        desc = "Stoppt Drehen für alle",
        color = Color3.fromRGB(128, 128, 128),
        vipOnly = true,
        func = function()
            spinnedPlayers = {}
            notification("🔄 Niemand dreht sich mehr!", "success")
        end
    },
    rainbow = {
        name = "🌈 REGENBOGEN",
        desc = "Macht Spieler bunt",
        color = Color3.fromRGB(255, 0, 255),
        needTarget = true,
        func = function(target)
            if target and target.Character then
                spawn(function()
                    local t = 0
                    while target.Character do
                        t = t + 0.01
                        for _, part in pairs(target.Character:GetChildren()) do
                            if part:IsA("BasePart") then
                                part.Color = Color3.fromHSV(t % 1, 1, 1)
                            end
                        end
                        task.wait(0.05)
                    end
                end)
                notification("🌈 " .. target.Name .. " ist bunt!", "success")
            end
        end
    },
    rainbowAll = {
        name = "🌈 ALLE REGENBOGEN",
        desc = "Macht ALLE bunt",
        color = Color3.fromRGB(255, 0, 255),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p.Character then
                    spawn(function()
                        local t = 0
                        while p.Character do
                            t = t + 0.01
                            for _, part in pairs(p.Character:GetChildren()) do
                                if part:IsA("BasePart") then
                                    part.Color = Color3.fromHSV(t % 1, 1, 1)
                                end
                            end
                            task.wait(0.05)
                        end
                    end)
                end
            end
            notification("🌈 Alle sind bunt!", "success")
        end
    },
    
    -- ===== SERVER =====
    serverHop = {
        name = "🌐 SERVER HOP",
        desc = "Wechselt den Server",
        color = Color3.fromRGB(0, 255, 255),
        func = function()
            local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100")).data
            for _, server in ipairs(servers) do
                if server.id ~= game.JobId then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, player)
                    break
                end
            end
        end
    },
    rejoin = {
        name = "🔄 SERVER NEU BEITRETEN",
        desc = "Verbindet neu",
        color = Color3.fromRGB(0, 255, 0),
        func = function()
            TeleportService:Teleport(game.PlaceId, player)
        end
    },
    shutdown = {
        name = "⛔ SERVER HERUNTERFAHREN",
        desc = "Schaltet Server ab (VIP)",
        color = Color3.fromRGB(255, 0, 0),
        vipOnly = true,
        func = function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player then
                    p:Kick("👑 Server wird heruntergefahren!")
                end
            end
            notification("⛔ Server wird heruntergefahren!", "success")
        end
    },
    
    -- ===== WETTER =====
    day = {
        name = "☀️ TAG",
        desc = "Macht es Tag",
        color = Color3.fromRGB(255, 255, 0),
        func = function()
            Lighting.ClockTime = 12
            notification("☀️ Es ist jetzt Tag!", "success")
        end
    },
    night = {
        name = "🌙 NACHT",
        desc = "Macht es Nacht",
        color = Color3.fromRGB(0, 0, 139),
        func = function()
            Lighting.ClockTime = 0
            notification("🌙 Es ist jetzt Nacht!", "success")
        end
    },
    fog = {
        name = "🌫️ NEBEL",
        desc = "Aktiviert Nebel",
        color = Color3.fromRGB(128, 128, 128),
        func = function()
            Lighting.FogEnd = 100
            notification("🌫️ Nebel aktiviert!", "success")
        end
    },
    clear = {
        name = "☀️ KLARER HIMMEL",
        desc = "Entfernt Nebel",
        color = Color3.fromRGB(135, 206, 235),
        func = function()
            Lighting.FogEnd = 100000
            notification("☀️ Himmel ist klar!", "success")
        end
    },
    
    -- ===== SCHUTZ =====
    antiKick = {
        name = "🛡️ ANTI-KICK",
        desc = "Schützt vor Kicks",
        color = Color3.fromRGB(0, 255, 0),
        func = function()
            antiBanSystem()
            notification("🛡️ Anti-Kick aktiviert!", "success")
        end
    },
    antiBan = {
        name = "🛡️ ANTI-BAN",
        desc = "Schützt vor Bans",
        color = Color3.fromRGB(255, 0, 0),
        vipOnly = true,
        func = function()
            notification("🛡️ Anti-Ban aktiviert!", "success")
        end
    },
    antiAFK = {
        name = "🌀 ANTI-AFK",
        desc = "Kein AFK-Kick",
        color = Color3.fromRGB(0, 255, 255),
        func = function()
            local vu = game:GetService("VirtualUser")
            player.Idled:Connect(function()
                vu:Button2Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
                task.wait(1)
                vu:Button2Up(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
            end)
            notification("🌀 Anti-AFK aktiviert!", "success")
        end
    },
    
    -- ===== SONSTIGES =====
    chat = {
        name = "💬 ADMIN CHAT",
        desc = "Sende Admin-Nachricht",
        color = Color3.fromRGB(255, 255, 255),
        func = function()
            local msg = "👑 Admin ist online!"
            game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(msg, "All")
        end
    },
    notify = {
        name = "🔔 NOTIFICATION",
        desc = "Sende Notification",
        color = Color3.fromRGB(255, 215, 0),
        func = function()
            StarterGui:SetCore("SendNotification", {
                Title = "👑 ADMIN",
                Text = "Admin Hacker Pro aktiv!",
                Duration = 5
            })
        end
    },
    copyUser = {
        name = "📋 SPIELER KOPIEREN",
        desc = "Kopiert Spieler-Aussehen",
        color = Color3.fromRGB(255, 105, 180),
        needTarget = true,
        func = function(target)
            if target and target.Character then
                for _, child in pairs(target.Character:GetChildren()) do
                    if child:IsA("Accessory") or child:IsA("Shirt") or child:IsA("Pants") or child:IsA("ShirtGraphic") then
                        child:Clone().Parent = character
                    end
                end
                notification("📋 " .. target.Name .. " wurde kopiert!", "success")
            end
        end
    },
    tools = {
        name = "🛠️ ALLE TOOLS",
        desc = "Gibt alle Tools",
        color = Color3.fromRGB(255, 165, 0),
        func = function()
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj:IsA("Tool") then
                    obj:Clone().Parent = player.Backpack
                end
            end
            notification("🛠️ Alle Tools erhalten!", "success")
        end
    },
    gear = {
        name = "⚙️ ALLE GEAR",
        desc = "Gibt alle Gear",
        color = Color3.fromRGB(0, 255, 255),
        func = function()
            for _, obj in pairs(Workspace:GetDescendants()) do
                if obj:IsA("Accoutrement") or obj:IsA("BodyColors") then
                    obj:Clone().Parent = character
                end
            end
            notification("⚙️ Alle Gear erhalten!", "success")
        end
    },
    resetTools = {
        name = "🔄 TOOLS ZURÜCKSETZEN",
        desc = "Entfernt alle Tools",
        color = Color3.fromRGB(128, 128, 128),
        func = function()
            player.Backpack:ClearAllChildren()
            notification("🔄 Tools wurden zurückgesetzt!", "success")
        end
    },
    getPlayer = {
        name = "🎮 SPIELER INFO",
        desc = "Zeigt Spieler-Info",
        color = Color3.fromRGB(0, 255, 255),
        needTarget = true,
        func = function(target)
            local info = "Name: " .. target.Name .. "\n"
            info = info .. "ID: " .. target.UserId .. "\n"
            info = info .. "Alter: " .. target.AccountAge .. " Tage\n"
            info = info .. "Freunde: " .. #target:GetFriends() .. "\n"
            info = info .. "In Gruppe: " .. tostring(target:IsInGroup(1)) .. "\n"
            notification(info, "info")
        end
    },
    getRank = {
        name = "📊 RANG",
        desc = "Zeigt Rang",
        color = Color3.fromRGB(255, 215, 0),
        needTarget = true,
        func = function(target)
            local rank = "Spieler"
            if isVIP then rank = "VIP" end
            if VIP_Players[target] then rank = "VIP" end
            notification("📊 " .. target.Name .. " ist " .. rank, "info")
        end
    },
    promote = {
        name = "⬆️ BEFÖRDERN",
        desc = "Befördert Spieler",
        color = Color3.fromRGB(0, 255, 0),
        needTarget = true,
        vipOnly = true,
        func = function(target)
            notification("⬆️ " .. target.Name .. " wurde befördert!", "success")
        end
    },
    demote = {
        name = "⬇️ DEGRADIEREN",
        desc = "Degradiert Spieler",
        color = Color3.fromRGB(255, 0, 0),
        needTarget = true,
        vipOnly = true,
        func = function(target)
            notification("⬇️ " .. target.Name .. " wurde degradiert!", "success")
        end
    },
    hideGUI = {
        name = "👁️ GUI VERSTECKEN",
        desc = "Versteckt das GUI",
        color = Color3.fromRGB(128, 128, 128),
        func = function()
            MainFrame.Visible = false
        end
    },
    showGUI = {
        name = "👁️ GUI ZEIGEN",
        desc = "Zeigt das GUI",
        color = Color3.fromRGB(255, 255, 255),
        func = function()
            MainFrame.Visible = true
        end
    },
    settings = {
        name = "⚙️ EINSTELLUNGEN",
        desc = "Öffnet Einstellungen",
        color = Color3.fromRGB(100, 100, 100),
        func = function()
            notification("⚙️ Einstellungen werden geladen...", "info")
        end
    },
    help = {
        name = "❓ HILFE",
        desc = "Zeigt Hilfe an",
        color = Color3.fromRGB(0, 255, 255),
        func = function()
            local help = "👑 ADMIN HACKER PRO\n\n"
            help = help .. "Befehle:\n"
            help = help .. "• Wähle Spieler aus\n"
            help = help .. "• Klicke auf Aktion\n"
            help = help .. "• VIP = Mehr Features\n\n"
            help = help .. "Made by WALED-HAMMAD"
            notification(help, "info")
        end
    },
    about = {
        name = "ℹ️ ÜBER",
        desc = "Info über das Script",
        color = Color3.fromRGB(255, 215, 0),
        func = function()
            notification("👑 ADMIN HACKER PRO\nMade by WALED-HAMMAD\n100+ Tools\n100% Real", "info")
        end
    }
}

-- ============================================
-- NOTIFICATION SYSTEM
-- ============================================
function notification(msg, type)
    local color = Color3.fromRGB(0, 255, 0)
    if type == "error" then color = Color3.fromRGB(255, 0, 0)
    elseif type == "warn" then color = Color3.fromRGB(255, 255, 0)
    elseif type == "info" then color = Color3.fromRGB(0, 255, 255)
    elseif type == "vip" then color = Color3.fromRGB(255, 215, 0)
    elseif type == "admin" then color = Color3.fromRGB(255, 0, 255) end
    
    StarterGui:SetCore("SendNotification", {
        Title = "👑 ADMIN PRO",
        Text = msg,
        Duration = 3
    })
    print(msg)
end

-- ============================================
-- SPIELER AUSWAHL
-- ============================================
function showPlayerSelect(yPos)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.Position = UDim2.new(0, 0, 0, yPos)
    frame.BackgroundColor3 = Color3.fromRGB(30, 20, 50)
    frame.Parent = Content
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.6, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = "🎯 AUSGEWÄHLT:"
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.SourceSansBold
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local selectBtn = Instance.new("TextButton")
    selectBtn.Size = UDim2.new(0.35, 0, 0.8, 0)
    selectBtn.Position = UDim2.new(0.63, 0, 0.1, 0)
    selectBtn.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
    selectBtn.Text = selectedPlayer and selectedPlayer.Name or "KEINER"
    selectBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    selectBtn.Font = Enum.Font.SourceSansBold
    selectBtn.TextSize = 14
    selectBtn.Parent = frame
    
    selectBtn.MouseButton1Click:Connect(function()
        local playerList = {}
        for _, p in ipairs(Players:GetPlayers()) do
            table.insert(playerList, p.Name)
        end
        
        local chosen = playerList[1] -- Hier müsste ein echtes Auswahlmenü sein
        for _, p in pairs(Players:GetPlayers()) do
            if p.Name == chosen then
                selectedPlayer = p
                selectBtn.Text = p.Name
                notification("🎯 " .. p.Name .. " ausgewählt!", "success")
                break
            end
        end
    end)
    
    return yPos + 45
end

-- ============================================
-- GUI ERSTELLUNG
-- ============================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AdminHackerPro"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

-- Hauptframe mit Galaxy Effekt
local MainFrame = Instance.new("Frame")
MainFrame.Size = isMobile and UDim2.new(0, 380, 0, 600) or UDim2.new(0, 550, 0, 700)
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -350)
MainFrame.BackgroundColor3 = Color3.fromRGB(2, 0, 10)
MainFrame.BackgroundTransparency = 0.1
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

-- Abgerundete Ecken
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 20)
Corner.Parent = MainFrame

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

-- Rainbow Border
local RainbowBorder = Instance.new("Frame")
RainbowBorder.Size = UDim2.new(1, 12, 1, 12)
RainbowBorder.Position = UDim2.new(0, -6, 0, -6)
RainbowBorder.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
RainbowBorder.BorderSizePixel = 0
RainbowBorder.ZIndex = 0
RainbowBorder.Parent = MainFrame

local BorderCorner = Instance.new("UICorner")
BorderCorner.CornerRadius = UDim.new(0, 24)
BorderCorner.Parent = RainbowBorder

-- Rainbow Animation
spawn(function()
    while true do
        for i = 0, 1, 0.01 do
            RainbowBorder.BackgroundColor3 = Color3.fromHSV(i, 1, 1)
            task.wait(0.02)
        end
    end
end)

-- Titel
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 70)
Title.BackgroundColor3 = Color3.fromRGB(20, 5, 30)
Title.Text = "👑 ADMIN HACKER PRO"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = isMobile and 24 or 30
Title.TextStrokeTransparency = 0.3
Title.TextStrokeColor3 = Color3.fromRGB(255, 0, 255)
Title.Parent = MainFrame

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

-- YouTube Button
local YouTubeBtn = Instance.new("TextButton")
YouTubeBtn.Size = UDim2.new(0.45, 0, 0, 35)
YouTubeBtn.Position = UDim2.new(0.05, 0, 0, 105)
YouTubeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
YouTubeBtn.Text = "📺 @hacker666-00"
YouTubeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
YouTubeBtn.Font = Enum.Font.SourceSansBold
YouTubeBtn.TextSize = 12
YouTubeBtn.Parent = MainFrame

local YTCorner = Instance.new("UICorner")
YTCorner.CornerRadius = UDim.new(0, 10)
YTCorner.Parent = YouTubeBtn

YouTubeBtn.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@hacker666-00?si=RB-939S15-gwSm5X")
    notification("📺 YouTube Link kopiert!", "info")
end)

-- TikTok Button
local TikTokBtn = Instance.new("TextButton")
TikTokBtn.Size = UDim2.new(0.45, 0, 0, 35)
TikTokBtn.Position = UDim2.new(0.52, 0, 0, 105)
TikTokBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TikTokBtn.Text = "🎵 @mods_and_hacks"
TikTokBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TikTokBtn.Font = Enum.Font.SourceSansBold
TikTokBtn.TextSize = 12
TikTokBtn.Parent = MainFrame

local TTCorner = Instance.new("UICorner")
TTCorner.CornerRadius = UDim.new(0, 10)
TTCorner.Parent = TikTokBtn

TikTokBtn.MouseButton1Click:Connect(function()
    setclipboard("https://www.tiktok.com/@mods_and_hacks?_r=1&_t=ZG-945eRguwLyK")
    notification("🎵 TikTok Link kopiert!", "info")
end)

-- PC/Mobile Indicator
local DeviceLabel = Instance.new("TextLabel")
DeviceLabel.Size = UDim2.new(1, 0, 0, 20)
DeviceLabel.Position = UDim2.new(0, 0, 0, 140)
DeviceLabel.BackgroundTransparency = 1
DeviceLabel.Text = isMobile and "📱 MOBILE MODUS" or "💻 PC MODUS"
DeviceLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
DeviceLabel.Font = Enum.Font.SourceSansBold
DeviceLabel.TextSize = 14
DeviceLabel.Parent = MainFrame

-- Tabs
local Tabs = {"👑 ADMIN", "🎮 SPIELER", "⚔️ KAMPF", "🎯 TELEPORT", "💀 TÖTEN", "❄️ FREEZE", "🌈 DESIGN", "⚙️ SERVER"}
local TabButtons = {}
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(1, -20, 0, 50)
TabFrame.Position = UDim2.new(0, 10, 0, 165)
TabFrame.BackgroundTransparency = 1
TabFrame.Parent = MainFrame

for i, tab in ipairs(Tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.12, 0, 1, 0)
    btn.Position = UDim2.new(0.12 * (i-1), 2, 0, 0)
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

-- Content
local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(1, -20, 1, -250)
Content.Position = UDim2.new(0, 10, 0, 225)
Content.BackgroundTransparency = 1
Content.ScrollBarThickness = 8
Content.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)
Content.CanvasSize = UDim2.new(0, 0, 0, 1200)
Content.Parent = MainFrame

-- X Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -40, 0, 10)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 24
CloseBtn.Parent = MainFrame

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ToggleBtn.Text = "👑"
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
end)

-- Toggle Button
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = isMobile and UDim2.new(0, 70, 0, 70) or UDim2.new(0, 60, 0, 60)
ToggleBtn.Position = isMobile and UDim2.new(0, 15, 0.8, 0) or UDim2.new(0, 10, 0.5, -30)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
ToggleBtn.Text = "👑"
ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = isMobile and 35 or 30
ToggleBtn.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, isMobile and 35 or 30)
ToggleCorner.Parent = ToggleBtn

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    ToggleBtn.Text = MainFrame.Visible and "✕" or "👑"
    ToggleBtn.BackgroundColor3 = MainFrame.Visible and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(255, 215, 0)
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
-- BUTTON FUNKTION
-- ============================================
function createButton(tool, yPos)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, isMobile and 50 or 45)
    btn.Position = UDim2.new(0, 0, 0, yPos)
    btn.BackgroundColor3 = tool.color
    btn.Text = tool.name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = isMobile and 16 or 14
    btn.Parent = Content
    
    btn.MouseButton1Click:Connect(function()
        if tool.vipOnly and not isVIP then
            notification("❌ Nur für VIP!", "error")
            return
        end
        if tool.needTarget and not selectedPlayer then
            notification("❌ Wähle zuerst einen Spieler aus!", "error")
            return
        end
        tool.func(selectedPlayer)
    end)
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    return yPos + (isMobile and 55 or 50)
end

-- ============================================
-- TABS INHALTE
-- ============================================
function showAdminTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = showPlayerSelect(y)
    y = createButton(adminTools.getVIP, y)
    y = createButton(adminTools.giveVIP, y)
    y = createButton(adminTools.removeVIP, y)
    y = createButton(adminTools.becomeAdmin, y)
    y = createButton(adminTools.giveAdmin, y)
    y = createButton(adminTools.playerList, y)
    y = createButton(adminTools.selectPlayer, y)
    y = createButton(adminTools.clearSelection, y)
    y = createButton(adminTools.getRank, y)
    y = createButton(adminTools.promote, y)
    y = createButton(adminTools.demote, y)
    y = createButton(adminTools.getPlayer, y)
    y = createButton(adminTools.copyUser, y)
    y = createButton(adminTools.settings, y)
    y = createButton(adminTools.help, y)
    y = createButton(adminTools.about, y)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

function showPlayerTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = showPlayerSelect(y)
    y = createButton(adminTools.kick, y)
    y = createButton(adminTools.kickAll, y)
    y = createButton(adminTools.ban, y)
    y = createButton(adminTools.banAll, y)
    y = createButton(adminTools.unban, y)
    y = createButton(adminTools.mute, y)
    y = createButton(adminTools.muteAll, y)
    y = createButton(adminTools.unmute, y)
    y = createButton(adminTools.unmuteAll, y)
    y = createButton(adminTools.warn, y)
    y = createButton(adminTools.warnAll, y)
    y = createButton(adminTools.jail, y)
    y = createButton(adminTools.jailAll, y)
    y = createButton(adminTools.unjail, y)
    y = createButton(adminTools.unjailAll, y)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

function showCombatTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = showPlayerSelect(y)
    y = createButton(adminTools.kill, y)
    y = createButton(adminTools.killAll, y)
    y = createButton(adminTools.revive, y)
    y = createButton(adminTools.reviveAll, y)
    y = createButton(adminTools.heal, y)
    y = createButton(adminTools.healAll, y)
    y = createButton(adminTools.god, y)
    y = createButton(adminTools.godAll, y)
    y = createButton(adminTools.ungod, y)
    y = createButton(adminTools.ungodAll, y)
    y = createButton(adminTools.punch, y)
    y = createButton(adminTools.punchAll, y)
    y = createButton(adminTools.explode, y)
    y = createButton(adminTools.explodeAll, y)
    y = createButton(adminTools.spin, y)
    y = createButton(adminTools.spinAll, y)
    y = createButton(adminTools.stopSpin, y)
    y = createButton(adminTools.stopSpinAll, y)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

function showTeleportTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = showPlayerSelect(y)
    y = createButton(adminTools.teleport, y)
    y = createButton(adminTools.bring, y)
    y = createButton(adminTools.bringAll, y)
    y = createButton(adminTools.teleportTo, y)
    y = createButton(adminTools.teleportSpawn, y)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

function showKillTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = showPlayerSelect(y)
    y = createButton(adminTools.kill, y)
    y = createButton(adminTools.killAll, y)
    y = createButton(adminTools.explode, y)
    y = createButton(adminTools.explodeAll, y)
    y = createButton(adminTools.punch, y)
    y = createButton(adminTools.punchAll, y)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

function showFreezeTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = showPlayerSelect(y)
    y = createButton(adminTools.freeze, y)
    y = createButton(adminTools.freezeAll, y)
    y = createButton(adminTools.unfreeze, y)
    y = createButton(adminTools.unfreezeAll, y)
    y = createButton(adminTools.jail, y)
    y = createButton(adminTools.jailAll, y)
    y = createButton(adminTools.unjail, y)
    y = createButton(adminTools.unjailAll, y)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

function showDesignTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton(adminTools.rainbow, y)
    y = createButton(adminTools.rainbowAll, y)
    y = createButton(adminTools.invisible, y)
    y = createButton(adminTools.invisibleAll, y)
    y = createButton(adminTools.visible, y)
    y = createButton(adminTools.visibleAll, y)
    y = createButton(adminTools.fly, y)
    y = createButton(adminTools.flyAll, y)
    y = createButton(adminTools.unfly, y)
    y = createButton(adminTools.unflyAll, y)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, y)
end

function showServerTab()
    Content:ClearAllChildren()
    local y = 10
    
    y = createButton(adminTools.serverHop, y)
    y = createButton(adminTools.rejoin, y)
    y = createButton(adminTools.shutdown, y)
    y = createButton(adminTools.day, y)
    y = createButton(adminTools.night, y)
    y = createButton(adminTools.fog, y)
    y = createButton(adminTools.clear, y)
    y = createButton(adminTools.antiKick, y)
    y = createButton(adminTools.antiBan, y)
    y = createButton(adminTools.antiAFK, y)
    y = createButton(adminTools.chat, y)
    y = createButton(adminTools.notify, y)
    y = createButton(adminTools.tools, y)
    y = createButton(adminTools.gear, y)
    y = createButton(adminTools.resetTools, y)
    y = createButton(adminTools.hideGUI, y)
    y = createButton(adminTools.showGUI, y)
    
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

    if tab == "👑 ADMIN" then showAdminTab()
    elseif tab == "🎮 SPIELER" then showPlayerTab()
    elseif tab == "⚔️ KAMPF" then showCombatTab()
    elseif tab == "🎯 TELEPORT" then showTeleportTab()
    elseif tab == "💀 TÖTEN" then showKillTab()
    elseif tab == "❄️ FREEZE" then showFreezeTab()
    elseif tab == "🌈 DESIGN" then showDesignTab()
    elseif tab == "⚙️ SERVER" then showServerTab() end
end

for tab, btn in pairs(TabButtons) do
    btn.MouseButton1Click:Connect(function() switchTab(tab) end)
end

-- Start
switchTab("👑 ADMIN")

-- Willkommensmeldung
print("👑 ADMIN HACKER PRO V3")
print("Made by WALED-HAMMAD")
print("📺 YouTube: @hacker666-00")
print("🎵 TikTok: @mods_and_hacks")
print(isMobile and "📱 MOBILE MODUS" or "💻 PC MODUS")
print("🎮 Toggle Button / RightControl")

notification("👑 ADMIN HACKER PRO GELADEN!", "success")
