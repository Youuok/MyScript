local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Bo May La Nhat Hub",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Sirius",
    Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "BoMayLaNhatHub"
    },
 
    Discord = {
       Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local Tab = Window:CreateTab("🏠Home",nil) -- Title, Image

 local Section = Tab:CreateSection("Main")

 Rayfield:Notify({
    Title = "Cam On Vi Da Su Dung",
    Content = "Cam On",
    Duration = 3,
    Image = nil,
 })

 local Button = MainTab:CreateButton({
    Name = "Farm",
    Callback = function()
    -- Auto Quest and Farm Level Script (Educational Purpose Only)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Function to teleport
local function teleportTo(location)
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = location
end

-- Function to attack NPC
local function attackNPC(npc)
    local tool = player.Backpack:FindFirstChild("Sword") or player.Backpack:FindFirstChild("Combat")
    if tool then
        character.Humanoid:EquipTool(tool)
        while npc.Humanoid.Health > 0 do
            tool:Activate()
            wait(0.1) -- Delay between attacks
        end
    end
end

-- Function to accept quest
local function acceptQuest(questGiver)
    teleportTo(questGiver.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0))
    wait(1) -- Wait to ensure interaction
    fireproximityprompt(questGiver.ProximityPrompt) -- Simulate interaction with quest giver
end

-- Function to farm specific NPCs for levels
local function farmNPCForLevel(questGiverName, npcName, targetLevel)
    while player.Level.Value < targetLevel do
        wait(1) -- Delay to prevent crashes
        local questGiver = game.Workspace:FindFirstChild(questGiverName)
        if questGiver then
            acceptQuest(questGiver)
        end

        local npc = game.Workspace:FindFirstChild(npcName)
        if npc and npc:FindFirstChild("Humanoid") and npc.Humanoid.Health > 0 then
            teleportTo(npc.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0))
            attackNPC(npc)
        end
    end
end

-- Auto Farm Logic
local function autoFarmToMaxLevel()
    -- Farm specific NPCs in sequence
    farmNPCForLevel("BanditQuestGiver", "Bandit", 15) -- Level 0-15
    farmNPCForLevel("MonkeyQuestGiver", "Monkey", 30) -- Level 15-30
    farmNPCForLevel("GorillaQuestGiver", "Gorilla", 50) -- Level 30-50
    -- Add more NPCs and quests until level 2600
end

-- Start Auto Farm
autoFarmToMaxLevel()
    end,
 })