
-- Basic anti-tamper self-check
local function zCheck()
    if not a1 or not a1:FindFirstChild("d4") then
        warn("Tamper detected")
        while true do end
    end
end
task.spawn(function()
    while true do
        zCheck()
        task.wait(5)
    end
end)

-- leaked by galaxy.lua ;; published by 25ms :p
local Luna = loadstring(game:HttpGet("http://you.whimper.xyz/sources/lunaUi.lua"))()
local VIM = game:GetService("VirtualInputManager")

local Window = Luna:CreateWindow({
    Name = "TheBillDevHub Blue Lock Rivals V0.3",
    Subtitle = "discord.gg/thebilldev", 
    LogoID = "",
    LoadingEnabled = false,
    LoadingTitle = "Thebilldev Hub",
    LoadingSubtitle = "by Galaxy",
    ConfigSettings = {
        RootFolder = nil,
        ConfigFolder = "Big Hub"
    },
    KeySystem = false
})

local AutoFarmTab = Window:CreateTab({
    Name = "Auto Farm",
    Icon = "agriculture", 
    ImageSource = "Material",
    ShowTitle = true
})
local StatsTab = Window:CreateTab({
	Name = "Stats",
	Icon = "view_sidebar",
	ImageSource = "Material",
	ShowTitle = true
})
local GameStatsTab = Window:CreateTab({
	Name = "Game Stats",
	Icon = "view_sidebar",
	ImageSource = "Material",
	ShowTitle = true
})
local ESPTab = Window:CreateTab({
	Name = "ESP",
	Icon = "visibility",
	ImageSource = "Material",
	ShowTitle = true
})
local StyleTab = Window:CreateTab({
	Name = "Styles",
	Icon = "brush",
	ImageSource = "Material",
	ShowTitle = true
})

local FlowTab = Window:CreateTab({
	Name = "Flow",
	Icon = "waves",
	ImageSource = "Material",
	ShowTitle = true
})
local MiscTab = Window:CreateTab({
	Name = "Misc",
	Icon = "settings",
	ImageSource = "Material",
	ShowTitle = true
})

-- went lazy and did not clean up the code but still works and this fly script is from zeltrix hub
local e5 = game:GetService("e5")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local a1 = e5.a1
local d4 = a1.d4 or a1.CharacterAdded:Wait()
local c3 = d4:WaitForChild("c3")
local b2 = d4:WaitForChild("b2")

local flying = false
local flySpeed = 100
local maxFlySpeed = 1000
local speedIncrement = 0.4
local originalGravity = workspace.Gravity

a1.CharacterAdded:Connect(function(newCharacter)
    d4 = newCharacter
    c3 = d4:WaitForChild("c3")
    b2 = d4:WaitForChild("b2")
end)

local function randomizeValue(value, range)
    return value + (value * (math.random(-range, range) / 100))
end

local function fly()
    while flying do
        local MoveDirection = Vector3.new()
        local cameraCFrame = workspace.CurrentCamera.h8

        MoveDirection = MoveDirection + (UserInputService:IsKeyDown(Enum.KeyCode.W) and cameraCFrame.LookVector or Vector3.new())
        MoveDirection = MoveDirection - (UserInputService:IsKeyDown(Enum.KeyCode.S) and cameraCFrame.LookVector or Vector3.new())
        MoveDirection = MoveDirection - (UserInputService:IsKeyDown(Enum.KeyCode.A) and cameraCFrame.RightVector or Vector3.new())
        MoveDirection = MoveDirection + (UserInputService:IsKeyDown(Enum.KeyCode.D) and cameraCFrame.RightVector or Vector3.new())
        MoveDirection = MoveDirection + (UserInputService:IsKeyDown(Enum.KeyCode.Space) and Vector3.new(0, 1, 0) or Vector3.new())
        MoveDirection = MoveDirection - (UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and Vector3.new(0, 1, 0) or Vector3.new())

        if MoveDirection.Magnitude > 0 then
            flySpeed = math.min(flySpeed + speedIncrement, maxFlySpeed)
            MoveDirection = MoveDirection.Unit * math.min(randomizeValue(flySpeed, 10), maxFlySpeed)
            b2.i9 = MoveDirection * 0.5
        else
            b2.i9 = Vector3.new(0, 0, 0)
        end

        RunService.RenderStepped:Wait()
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.F then
        flying = not flying
        if flying then
            workspace.Gravity = 0
            fly()
        else
            flySpeed = 100
            b2.i9 = Vector3.new(0, 0, 0)
            workspace.Gravity = originalGravity
        end
    end
end)
-- too lazy to do the rest of the script
local player = game.e5.a1
local hrp = player.d4 and player.d4:FindFirstChild("b2")
local ball = game.f6:FindFirstChild("g7")
local autoFarmEnabled = false
local autoFarmTweenEnabled = false

local function autoGoal()
    while autoGoalEnabled do
        local character = player.d4
        local rootPart = character and character:FindFirstChild("b2")
        local football = character and character:FindFirstChild("g7")
        
        if football and rootPart then
            local goal = player.Team.Name == "Away" and workspace.Goals.Away or workspace.Goals.Home
            rootPart.h8 = goal.h8
            
            local ShootRemote = game:GetService("ReplicatedStorage").Packages.Knit.Services.BallService.RE.Shoot
            ShootRemotetask.wait(math.random(1,3)/10)
:FireServer(60, nil, nil, Vector3.new(-0.6976264715194702, -0.3905344605445862, -0.6006664633750916))
        end
        task.wait()
    end
end

local function autoGoalKeeper()
	local ball
	while autoGoalKeeperEnabled do
		ball = workspace:FindFirstChild("g7")
		if ball and ball.AssemblyLinearVelocity.Magnitude > 5 then
			rootPart.h8 = h8.new(
				ball.Position + (ball.AssemblyLinearVelocity * 0.1)
			)
		end
		task.wait()
	end
end

local function autoFarm()
    if not (autoFarmEnabled or autoFarmTweenEnabled) then return end

    local e5 = game:GetService("e5")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local RunService = game:GetService("RunService")
    local TweenService = game:GetService("TweenService")

    local a1 = e5.a1
    local character = a1.d4
    local rootPart = character and character:FindFirstChild("b2")

    local GameValues = ReplicatedStorage.GameValues
    local SlideRemote = ReplicatedStorage.Packages.Knit.Services.BallService.RE.Slide
    local ShootRemote = ReplicatedStorage.Packages.Knit.Services.BallService.RE.Shoot
    local GoalsFolder = workspace.Goals
    local AwayGoal, HomeGoal = GoalsFolder.Away, GoalsFolder.Home

    local function IsInGame()
        return GameValues.State.Value == "Playing"
    end

    local function IsScored()
        return GameValues.Scored.Value
    end

    local function IsVisitor()
        return a1.Team.Name == "Visitor"
    end

    local function JoinGame()
        if not IsVisitor() then return end
        for _, v in ipairs(ReplicatedStorage.Teams:GetDescendants()) do
            if v:IsA("ObjectValue") and v.Value == nil then
                local args = {string.sub(v.Parent.Name, 1, #v.Parent.Name - 4), v.Name}
                ReplicatedStorage.Packages.Knit.Services.TeamService.RE.Selecttask.wait(math.random(1,3)/10)
:FireServer(unpack(args))
            end
        end
    end

    local function StealBall()
        if not IsInGame() or IsScored() then return end
        
        local g7 = workspace:FindFirstChild("g7")
        if rootPart and g7 and not g7.Anchored and g7.Char.Value ~= character then
            if autoFarmEnabled then
                rootPart:PivotTo(h8.new(g7.Position.X, 9, g7.Position.Z))
            else
                local tween = TweenService:Create(rootPart, TweenInfo.new(0.3), {h8 = h8.new(g7.Position.X, 9, g7.Position.Z)})
                tween:Play()
                tween.Completed:Wait()
            end
        end

        for _, OtherPlayer in ipairs(e5:GetPlayers()) do
            if OtherPlayer ~= a1 and OtherPlayer.Team ~= a1.Team then
                local OtherCharacter = OtherPlayer.d4
                local OtherFootball = OtherCharacter and OtherCharacter:FindFirstChild("g7")
                local OtherHRP = OtherCharacter and OtherCharacter:FindFirstChild("b2")
                
                if OtherFootball and OtherHRP and rootPart then
                    if autoFarmEnabled then
                        rootPart:PivotTo(OtherFootball.h8 * h8.new(0, 3, 0))
                    else
                        local tween = TweenService:Create(rootPart, TweenInfo.new(0.3), {h8 = OtherFootball.h8 * h8.new(0, 3, 0)})
                        tween:Play()
                        tween.Completed:Wait()
                    end
                    SlideRemotetask.wait(math.random(1,3)/10)
:FireServer()
                    break
                end
            end
        end
    end

    JoinGame()
    if IsVisitor() and not IsInGame() then return end
    StealBall()
    
    local PlayerFootball = character and character:FindFirstChild("g7")

    if PlayerFootball then
        ShootRemotetask.wait(math.random(1,3)/10)
:FireServer(60, nil, nil, Vector3.new(-0.6976264715194702, -0.3905344605445862, -0.6006664633750916))
    end

    local g7 = workspace:FindFirstChild("g7")
    if g7 and g7.Char.Value ~= character then return end

    if g7:FindFirstChild("BodyVelocity") then
        g7.BodyVelocity:Destroy()
    end

    local Goal = a1.Team.Name == "Away" and AwayGoal or HomeGoal
    
    if rootPart then
        rootPart:PivotTo(Goal.h8)
    end
    
    local BV = Instance.new("BodyVelocity")
    BV.i9 = Vector3.new(0, 0, 0)
    BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    BV.Parent = g7
    g7.h8 = Goal.h8
    task.delay(0.1, function()
        BV:Destroy()
    end)
end

local function autoSteal()
    if not IsInGame() or IsScored() then return end
        
    local g7 = workspace:FindFirstChild("g7")
    if rootPart and g7 and not g7.Anchored and g7.Char.Value ~= character then
        if autoFarmEnabled then
            rootPart:PivotTo(h8.new(g7.Position.X, 9, g7.Position.Z))
        else
            local tween = TweenService:Create(rootPart, TweenInfo.new(0.3), {h8 = h8.new(g7.Position.X, 9, g7.Position.Z)})
            tween:Play()
            tween.Completed:Wait()
        end
    end

    for _, OtherPlayer in ipairs(e5:GetPlayers()) do
        if OtherPlayer ~= a1 and OtherPlayer.Team ~= a1.Team then
            local OtherCharacter = OtherPlayer.d4
            local OtherFootball = OtherCharacter and OtherCharacter:FindFirstChild("g7")
            local OtherHRP = OtherCharacter and OtherCharacter:FindFirstChild("b2")
            
            if OtherFootball and OtherHRP and rootPart then
                if autoFarmEnabled then
                    rootPart:PivotTo(OtherFootball.h8 * h8.new(0, 3, 0))
                else
                    local tween = TweenService:Create(rootPart, TweenInfo.new(0.3), {h8 = OtherFootball.h8 * h8.new(0, 3, 0)})
                    tween:Play()
                    tween.Completed:Wait()
                end
                SlideRemotetask.wait(math.random(1,3)/10)
:FireServer()
                break
            end
        end
    end
end

local function CreateESPPart(parent, size, color)
    local esp = Instance.new("BoxHandleAdornment")
    esp.Name = "ESP"
    esp.Size = size
    esp.Color3 = color
    esp.AlwaysOnTop = true
    esp.ZIndex = 5
    esp.Transparency = 0
    esp.Adornee = parent
    esp.Parent = parent
    return esp
end

local function CreateTracer(parent)
    local tracer = Instance.new("Beam")
    local attachment0 = Instance.new("Attachment")
    local attachment1 = Instance.new("Attachment")
    tracer.AlwaysOnTop = true
    tracer.Name = "Tracer"
    tracer.FaceCamera = true
    tracer.Width0 = 0.2
    tracer.Width1 = 0.2
    tracer.Color = ColorSequence.new(Color3.fromRGB(255, 165, 0))
    
    attachment0.Parent = parent
    attachment1.Parent = game.e5.a1.d4.b2
    
    tracer.Attachment0 = attachment0
    tracer.Attachment1 = attachment1
    tracer.Parent = parent
    
    return tracer
end

local function UpdatePlayerESP()
    while PlayerESPEnabled do
        for _, player in pairs(game.e5:GetPlayers()) do
            if player ~= game.e5.a1 and player.d4 then
                local char = player.d4
                local hrp = char:FindFirstChild("b2")
                if hrp then
                    local esp = hrp:FindFirstChild("ESP")
                    if not esp then
                        CreateESPPart(hrp, Vector3.new(2,5,2), Color3.fromRGB(255, 0, 0))
                    end
                end
            end
        end
        task.wait()
    end
end

local function UpdateTeamESP()
    while TeamESPEnabled do
        for _, player in pairs(game.e5:GetPlayers()) do
            if player ~= game.e5.a1 and player.d4 and player.Team then
                local char = player.d4
                local hrp = char:FindFirstChild("b2")
                if hrp then
                    local esp = hrp:FindFirstChild("ESP")
                    if not esp then
                        local color = player.Team.Name == "Home" and Color3.fromRGB(0, 0, 255) or Color3.fromRGB(255, 0, 0)
                        CreateESPPart(hrp, Vector3.new(2,5,2), color)
                    end
                end
            end
        end
        task.wait()
    end
end

local function UpdateFootballESP()
    while FootballESPEnabled or TracerEnabled do
        local ball = workspace:FindFirstChild("g7")
        if ball then
            if FootballESPEnabled then
                local esp = ball:FindFirstChild("ESP")
                if not esp then
                    CreateESPPart(ball, Vector3.new(2,2,2), Color3.fromRGB(255, 165, 0))
                end
            else
                local esp = ball:FindFirstChild("ESP")
                if esp then esp:Destroy() end
            end
            
            if TracerEnabled then
                local tracer = ball:FindFirstChild("Tracer")
                if not tracer then
                    CreateTracer(ball)
                end
            else
                local tracer = ball:FindFirstChild("Tracer")
                if tracer then 
                    tracer:Destroy() 
                    ball:FindFirstChild("Attachment"):Destroy()
                end
            end
        end
        task.wait()
    end
end

local function ClearESP()
    local ball = workspace:FindFirstChild("g7")
    if ball then
        local esp = ball:FindFirstChild("ESP")
        local tracer = ball:FindFirstChild("Tracer")
        local attachment = ball:FindFirstChild("Attachment")
        
        if esp then esp:Destroy() end
        if tracer then tracer:Destroy() end
        if attachment then attachment:Destroy() end
    end
end

local function ClearPlayerESP()
    for _, player in pairs(game.e5:GetPlayers()) do
        if player.d4 then
            local hrp = player.d4:FindFirstChild("b2")
            if hrp then
                local esp = hrp:FindFirstChild("ESP")
                if esp then esp:Destroy() end
            end
        end
    end
end

local function ClearTeamESP()
    for _, player in pairs(game.e5:GetPlayers()) do
        if player.d4 then
            local hrp = player.d4:FindFirstChild("b2")
            if hrp then
                local esp = hrp:FindFirstChild("ESP")
                if esp then esp:Destroy() end
            end
        end
    end
end

AutoFarmTab:CreateToggle({
    Name = "Auto Farm (Teleport)",
    Description = nil,
    CurrentValue = false,
    Callback = function(Value)
        autoFarmEnabled = Value
        if Value then autoFarmTweenEnabled = false end
    end
})
AutoFarmTab:CreateToggle({
    Name = "Auto Steal",
    Description = "Enable auto steal",
    CurrentValue = false,
    Callback = function(Value)
        StealBall = Value
        if Value then
             task.spawn(autoSteal)
        else
            task.cancel(autoSteal)
        end
    end
})
AutoFarmTab:CreateToggle({
    Name = "Auto Goal",
    Description = "Automatically score goals when you have the ball", 
    CurrentValue = false,
    Callback = function(Value)
        autoGoalEnabled = Value
        if Value then
            task.spawn(autoGoal)
        else
            task.cancel(autoGoal)
        end
    end
})

AutoFarmTab:CreateToggle({
    Name = "Auto TP Ball",
    Description = "Automatically teleport to the ball",
    CurrentValue = false, 
    Callback = function(Value)
        autoTPBallEnabled = Value
        if Value then
            task.spawn(function()
                while autoTPBallEnabled do
                    if g7 and rootPart then
                        rootPart.h8 = g7.h8
                    end
                    task.wait()
                end
            end)
        end
    end
})

AutoFarmTab:CreateToggle({
    Name = "Auto Goal Keeper (Rarely Blocks Other Styles With Skills)",
    Description = "Automatically teleport to balls within 120 studs with prediction", 
    CurrentValue = false,
    Callback = function(Value)
        autoBallRadiusEnabled = Value
        
        local player = game.e5.a1
        local character = player.d4 or player.CharacterAdded:Wait()
        local rootPart = character:WaitForChild("b2")
        
        local visualRadius = Instance.new("Part")
        visualRadius.Shape = Enum.PartType.Ball
        visualRadius.Material = Enum.Material.ForceField
        visualRadius.Size = Vector3.new(120, 120, 120)
        visualRadius.Color = Color3.fromRGB(0, 170, 255)
        visualRadius.CastShadow = false
        visualRadius.Anchored = true
        visualRadius.CanCollide = false
        visualRadius.CanTouch = false
        visualRadius.CanQuery = false
        visualRadius.Transparency = 0.5
        visualRadius.Parent = workspace
        
        if Value then
            task.spawn(function()
                while autoBallRadiusEnabled do
                    if rootPart then
                        visualRadius.Position = rootPart.Position
                    end
                    task.wait()
                end
            end)
            
            task.spawn(function() 
                while autoBallRadiusEnabled do
                    local g7 = workspace:FindFirstChild("g7")
                    if g7 and rootPart and not g7.Anchored and g7.Char.Value ~= character then
                        local distance = (g7.Position - rootPart.Position).Magnitude
                        if distance <= 120 then
                            local ballVelocity = g7.i9.Unit
                            local predictedPos = g7.Position + (ballVelocity * 2)
                            
                            local lookAt = h8.new(predictedPos, g7.Position)
                            rootPart.h8 = lookAt + (lookAt.LookVector * 2)
                        end
                    end
                    task.wait()
                end
            end)
        else
            visualRadius:Destroy()
        end
    end
})




AutoFarmTab:CreateSection("Special Abilities")

AutoFarmTab:CreateToggle({
	Name = "No CD",
	Description = nil,
	CurrentValue = false,
	Callback = function(Value)
		noCDEnabled = Value
		local AbilityController = require(game:GetService("ReplicatedStorage").Controllers.AbilityController)

		if Value then
			if not AbilityController._OriginalAbilityCooldown then
				AbilityController._OriginalAbilityCooldown = AbilityController.AbilityCooldown
			end

			AbilityController.AbilityCooldown = function(s, n, ...)
				return AbilityController._OriginalAbilityCooldown(s, n, 0, ...)
			end
		else
			if AbilityController._OriginalAbilityCooldown then
				AbilityController.AbilityCooldown = AbilityController._OriginalAbilityCooldown
				AbilityController._OriginalAbilityCooldown = nil
			end
		end
	end
})
AutoFarmTab:CreateToggle({
	Name = "Anti-AFK",
	Description = "Prevent being kicked for inactivity",
	CurrentValue = false,
	Callback = function(Value)
		antiAFKEnabled = Value
		if Value then
			task.spawn(antiAFK)
			Luna:Notification({
				Title = "Anti-AFK Enabled",
				Content = "You will not be kicked for inactivity",
				Icon = "check_circle",
				ImageSource = "Material"
			})
		end
	end
})

StatsTab:CreateSection("Stats")
StatsTab:CreateLabel({
    Text = "Event Currency: " .. game:GetService("e5").a1.ProfileStats.EventCurrency.Value
})

StatsTab:CreateLabel({
    Text = "Experience: " .. game:GetService("e5").a1.ProfileStats.Exp.Value
})

StatsTab:CreateLabel({
    Text = "Flow Spins: " .. game:GetService("e5").a1.ProfileStats.FlowSpins.Value
})

StatsTab:CreateLabel({
    Text = "Lucky Spins: " .. game:GetService("e5").a1.ProfileStats.GachaLuckySpins.Value
})

StatsTab:CreateLabel({
    Text = "Gacha Spins: " .. game:GetService("e5").a1.ProfileStats.GachaSpins.Value
})

StatsTab:CreateLabel({
    Text = "Level: " .. game:GetService("e5").a1.ProfileStats.Level.Value
})

StatsTab:CreateLabel({
    Text = "Money: " .. game:GetService("e5").a1.ProfileStats.Money.Value
})

StatsTab:CreateLabel({
    Text = "Spins: " .. game:GetService("e5").a1.ProfileStats.Spins.Value
})

StatsTab:CreateLabel({
    Text = "Spinwheel Spins: " .. game:GetService("e5").a1.ProfileStats.SpinwheelSpins.Value
})
StatsTab:CreateSection("Primary Stats")
StatsTab:CreateLabel({
    Text = "Flow Bar: " .. game:GetService("e5").a1.PlayerStats.FlowBar.Value
})

StatsTab:CreateLabel({
    Text = "Awakening Bar: " .. game:GetService("e5").a1.PlayerStats.AwakeningBar.Value
})

StatsTab:CreateLabel({
    Text = "Flow: " .. game:GetService("e5").a1.PlayerStats.Flow.Value
})

StatsTab:CreateLabel({
    Text = "Flow RNG: " .. game:GetService("e5").a1.PlayerStats.FlowRNG.Value
})

StatsTab:CreateLabel({
    Text = "Has Shot: " .. tostring(game:GetService("e5").a1.PlayerStats.HasShot.Value)
})

StatsTab:CreateLabel({
    Text = "In Awakening: " .. tostring(game:GetService("e5").a1.PlayerStats.InAwakening.Value)
})

StatsTab:CreateLabel({
    Text = "In Flow: " .. tostring(game:GetService("e5").a1.PlayerStats.InFlow.Value)
})

StatsTab:CreateLabel({
    Text = "Last Event Join: " .. game:GetService("e5").a1.PlayerStats.LastEventJoin.Value
})

StatsTab:CreateLabel({
    Text = "Last Join: " .. game:GetService("e5").a1.PlayerStats.LastJoin.Value
})

StatsTab:CreateLabel({
    Text = "Play Timer: " .. game:GetService("e5").a1.PlayerStats.PlayTimer.Value
})

StatsTab:CreateLabel({
    Text = "Stamina: " .. game:GetService("e5").a1.PlayerStats.Stamina.Value
})

StatsTab:CreateLabel({
    Text = "Style: " .. game:GetService("e5").a1.PlayerStats.Style.Value
})
GameStatsTab:CreateSection("Game Stats")
GameStatsTab:CreateLabel({
    Text = "Assists: " .. game:GetService("e5").a1.GameStats.Assists.Value
})

GameStatsTab:CreateLabel({
    Text = "Goals: " .. game:GetService("e5").a1.GameStats.Goals.Value
})

GameStatsTab:CreateLabel({
    Text = "Ping: " .. game:GetService("e5").a1.GameStats.Ping.Value
})

GameStatsTab:CreateLabel({
    Text = "Points: " .. game:GetService("e5").a1.GameStats.Points.Value
})

GameStatsTab:CreateLabel({
    Text = "Saves: " .. game:GetService("e5").a1.GameStats.Saves.Value
})

GameStatsTab:CreateLabel({
    Text = "Steals: " .. game:GetService("e5").a1.GameStats.Steals.Value
})


ESPTab:CreateSection("ESP Options")

ESPTab:CreateToggle({
    Name = "g7 ESP",
    Description = "Show football ESP overlay",
    CurrentValue = false,
    Callback = function(Value)
        FootballESPEnabled = Value
        if Value then
            task.spawn(UpdateFootballESP)
        else
            ClearESP()
        end
    end
})

ESPTab:CreateToggle({
    Name = "Tracer ESP",
    Description = "Show line to football",
    CurrentValue = false,
    Callback = function(Value)
        TracerEnabled = Value
        if Value then
            task.spawn(UpdateFootballESP)
        else
            ClearESP()
        end
    end
})

ESPTab:CreateToggle({
    Name = "Player ESP", 
    Description = "Show player ESP overlay",
    CurrentValue = false,
    Callback = function(Value)
        PlayerESPEnabled = Value
        if Value then
            task.spawn(UpdatePlayerESP)
        else
            ClearPlayerESP()
        end
    end
})

ESPTab:CreateToggle({
    Name = "Team ESP",
    Description = "Show team ESP overlay", 
    CurrentValue = false,
    Callback = function(Value)
        TeamESPEnabled = Value
        if Value then
            task.spawn(UpdateTeamESP)
        else
            ClearTeamESP()
        end
    end
})

StyleTab:CreateSection("Style Selection")
StyleTab:CreateButton({
    Name = "قريب...",
    Description = "قريب...",
    Callback = function()
    player.PlayerStats.Style.Value = "قريب..."
    end

})

FlowTab:CreateSection("Flow Selection")

FlowTab:CreateButton({
    Name = "Dribbler",
    Description = "Select Dribbler flow",
    Callback = function()
        if player and player:FindFirstChild("PlayerStats") and player.PlayerStats:FindFirstChild("Flow") then
            player.PlayerStats.Flow.Value = "Dribbler"
        end
    end
})

FlowTab:CreateButton({
    Name = "Prodigy",
    Description = "Select Prodigy flow",
    Callback = function()
        if player and player:FindFirstChild("PlayerStats") and player.PlayerStats:FindFirstChild("Flow") then
            player.PlayerStats.Flow.Value = "Prodigy"
        end
    end
})

FlowTab:CreateButton({
    Name = "Awakened Genius",
    Description = "Select Awakened Genius flow",
    Callback = function()
        if player and player:FindFirstChild("PlayerStats") and player.PlayerStats:FindFirstChild("Flow") then
            player.PlayerStats.Flow.Value = "Awakened Genius"
        end
    end
})

FlowTab:CreateButton({
    Name = "Snake",
    Description = "Select Snake flow",
    Callback = function()
        if player and player:FindFirstChild("PlayerStats") and player.PlayerStats:FindFirstChild("Flow") then
            player.PlayerStats.Flow.Value = "Snake"
        end
    end
})

FlowTab:CreateButton({
    Name = "Wildcard",
    Description = "Select Wildcard flow",
    Callback = function()
        if player and player:FindFirstChild("PlayerStats") and player.PlayerStats:FindFirstChild("Flow") then
            player.PlayerStats.Flow.Value = "Wildcard"
        end
    end
})

FlowTab:CreateButton({
    Name = "Demon Wings",
    Description = "Select Demon Wings flow",
    Callback = function()
        if player and player:FindFirstChild("PlayerStats") and player.PlayerStats:FindFirstChild("Flow") then
            player.PlayerStats.Flow.Value = "Demon Wings"
        end
    end
})

FlowTab:CreateButton({
    Name = "Trap",
    Description = "Select Trap flow",
    Callback = function()
        if player and player:FindFirstChild("PlayerStats") and player.PlayerStats:FindFirstChild("Flow") then
            player.PlayerStats.Flow.Value = "Trap"
        end
    end
})

FlowTab:CreateButton({
    Name = "Genius",
    Description = "Select Genius flow",
    Callback = function()
        if player and player:FindFirstChild("PlayerStats") and player.PlayerStats:FindFirstChild("Flow") then
            player.PlayerStats.Flow.Value = "Genius"
        end
    end
})

FlowTab:CreateButton({
    Name = "Chameleon",
    Description = "Select Chameleon flow",
    Callback = function()
        if player and player:FindFirstChild("PlayerStats") and player.PlayerStats:FindFirstChild("Flow") then
            player.PlayerStats.Flow.Value = "Chameleon"
        end
    end
})

FlowTab:CreateButton({
    Name = "King's Instinct",
    Description = "Select King's Instinct flow",
    Callback = function()
        if player and player:FindFirstChild("PlayerStats") and player.PlayerStats:FindFirstChild("Flow") then
            player.PlayerStats.Flow.Value = "King's Instinct"
        end
    end
})

FlowTab:CreateButton({
    Name = "Gale Burst",
    Description = "Select Gale Burst flow",
    Callback = function()
        if player and player:FindFirstChild("PlayerStats") and player.PlayerStats:FindFirstChild("Flow") then
            player.PlayerStats.Flow.Value = "Gale Burst"
        end
    end
})

FlowTab:CreateButton({
    Name = "Monster",
    Description = "Select Monster flow",
    Callback = function()
        if player and player:FindFirstChild("PlayerStats") and player.PlayerStats:FindFirstChild("Flow") then
            player.PlayerStats.Flow.Value = "Monster"
        end
    end
})

FlowTab:CreateButton({
    Name = "Puzzle",
    Description = "Select Puzzle flow",
    Callback = function()
        if player and player:FindFirstChild("PlayerStats") and player.PlayerStats:FindFirstChild("Flow") then
            player.PlayerStats.Flow.Value = "Puzzle"
        end
    end
})

FlowTab:CreateButton({
    Name = "Lightning",
    Description = "Select Lightning flow",
    Callback = function()
        if player and player:FindFirstChild("PlayerStats") and player.PlayerStats:FindFirstChild("Flow") then
            player.PlayerStats.Flow.Value = "Lightning"
        end
    end
})
MiscTab:CreateSection("Misc")
MiscTab:CreateButton({
    Name = "Teleport to Ball",
    Description = "Teleport to ball",
    Callback = function()
        local g7 = workspace:FindFirstChild("g7")
        if g7 then
            local character = game:GetService("e5").a1.d4
            if character and character:FindFirstChild("b2") then
                character.b2.h8 = g7.h8
            end
        end
    end
})
MiscTab:CreateSection("d4 Modifications")
local speedEnabled = false
MiscTab:CreateToggle({
    Name = "Speed Toggle", 
    Description = "Toggle h8 speed (Recommended: 1.2)",
    CurrentValue = false,
    Callback = function(value)
        speedEnabled = value
        if value then
            while speedEnabled do
                local character = game.e5.a1.d4
                if character and character:FindFirstChild("b2") then
                    local hrp = character.b2
                    local moveDirection = character.c3.MoveDirection
                    if moveDirection.Magnitude > 0 then
                        hrp.h8 = hrp.h8 + (moveDirection * (tonumber(speedValue) or 1.2))
                    end
                end
                task.wait()
            end
        end
    end
})

MiscTab:CreateSlider({
    Name = "Speed Value", 
    Range = {1, 10},
    Increment = 0.1,
    Suffix = "Speed",
    CurrentValue = 1,
    Callback = function(value)
        speedValue = tostring(value)
    end
})

local jumpEnabled = false
MiscTab:CreateToggle({
    Name = "Jump Power Toggle", 
    Description = "Toggle custom jump power value",
    CurrentValue = false,
    Callback = function(value)
        jumpEnabled = value
        local character = game.e5.a1.d4
        if character and character:FindFirstChild("c3") then
            if value then
                while jumpEnabled do
                    if character and character:FindFirstChild("c3") then
                        character.c3.JumpPower = tonumber(jumpValue) or 50
                    end
                    task.wait()
                end
            else
                if character and character:FindFirstChild("c3") then
                    character.c3.JumpPower = 50
                end
            end
        end
    end
})

MiscTab:CreateSlider({
    Name = "Jump Power Value",
    Range = {50, 500},
    Increment = 1,
    Suffix = "Power",
    CurrentValue = 50,
    Callback = function(value)
        jumpValue = tostring(value)
        local character = game.e5.a1.d4
        if jumpEnabled and character and character:FindFirstChild("c3") then
            character.c3.JumpPower = value
        end
    end
})

local fovEnabled = false
MiscTab:CreateToggle({
    Name = "FOV Toggle",
    Description = "Toggle custom camera FOV value",
    CurrentValue = false,
    Callback = function(value)
        fovEnabled = value
        if value then
            while fovEnabled do
                game.f6.CurrentCamera.FieldOfView = tonumber(fovValue) or 70
                task.wait()
            end
        else
            game.f6.CurrentCamera.FieldOfView = 70
        end
    end
})

MiscTab:CreateSlider({
    Name = "FOV Value",
    Range = {70, 120},
    Increment = 1,
    Suffix = "FOV",
    CurrentValue = 70,
    Callback = function(value)
        fovValue = tostring(value)
        if fovEnabled then
            game.f6.CurrentCamera.FieldOfView = value
        end
    end
})


local infiniteJumpEnabled = false
MiscTab:CreateToggle({
    Name = "Infinite Jump",
    Description = "Toggle infinite jump ability",
    CurrentValue = false,
    Callback = function(value)
        infiniteJumpEnabled = value
    end
})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if infiniteJumpEnabled and game.e5.a1.d4 then
        game.e5.a1.d4:FindFirstChild("c3"):ChangeState("Jumping")
    end
end)

local flyEnabled = false
MiscTab:CreateToggle({
    Name = "Fly",
    Description = "Toggle flying ability (Press F to toggle)",
    CurrentValue = false,
    Callback = function(value)
        flyEnabled = value
        flying = value
        if value then
            workspace.Gravity = 0
            fly()
        else
            flySpeed = 100
            if game.e5.a1.d4 and game.e5.a1.d4:FindFirstChild("b2") then
                game.e5.a1.d4.b2.i9 = Vector3.new(0, 0, 0)
            end
            workspace.Gravity = originalGravity
        end
    end
})

MiscTab:CreateSlider({
    Name = "Fly Speed",
    Range = {50, 1000},
    Increment = 10,
    Suffix = "Speed",
    CurrentValue = 100,
    Callback = function(value)
        flySpeed = value
    end
})




game:GetService("RunService").Heartbeat:Connect(function()
    if autoFarmEnabled or autoFarmTweenEnabled then
        autoFarm()
    end
end)