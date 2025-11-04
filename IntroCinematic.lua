--[[
	Intro Cinematic Script
	Place this LocalScript in StarterGui or StarterPlayer > StarterPlayerScripts

	Instructions:
	1. Replace STUDIO_DECAL_ID with your studio logo decal asset ID
	2. Update the DEVELOPERS table with your team members' names and roles
	3. Customize colors, fonts, and timings as needed
]]

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

-- Configuration
local STUDIO_DECAL_ID = "rbxassetid://0" -- Replace with your studio logo decal ID
local FADE_IN_TIME = 1.5
local STUDIO_DISPLAY_TIME = 3
local FADE_OUT_TIME = 1.5
local LOADING_TIME_MIN = 10 -- Minimum loading time in seconds
local LOADING_TIME_MAX = 20 -- Maximum loading time in seconds
local DEVELOPERS = {
	{name = "John Doe", role = "Lead Developer"},
	{name = "Jane Smith", role = "Scripter"},
	{name = "Bob Johnson", role = "Builder"},
	{name = "Alice Williams", role = "UI Designer"}
}

-- Wait for player and their GUI to load
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local introGui = Instance.new("ScreenGui")
introGui.Name = "IntroCinematic"
introGui.DisplayOrder = 100
introGui.IgnoreGuiInset = true
introGui.ResetOnSpawn = false
introGui.Parent = playerGui

-- Create main frame (black background)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.Position = UDim2.new(0, 0, 0, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = introGui

-- Studio Logo Screen
local studioFrame = Instance.new("Frame")
studioFrame.Name = "StudioFrame"
studioFrame.Size = UDim2.new(1, 0, 1, 0)
studioFrame.Position = UDim2.new(0, 0, 0, 0)
studioFrame.BackgroundTransparency = 1
studioFrame.Parent = mainFrame

local studioLogo = Instance.new("ImageLabel")
studioLogo.Name = "StudioLogo"
studioLogo.Size = UDim2.new(0, 400, 0, 400)
studioLogo.Position = UDim2.new(0.5, -200, 0.5, -200)
studioLogo.BackgroundTransparency = 1
studioLogo.Image = STUDIO_DECAL_ID
studioLogo.ImageTransparency = 1
studioLogo.Parent = studioFrame

-- Developers Screen
local developersFrame = Instance.new("Frame")
developersFrame.Name = "DevelopersFrame"
developersFrame.Size = UDim2.new(1, 0, 1, 0)
developersFrame.Position = UDim2.new(0, 0, 0, 0)
developersFrame.BackgroundTransparency = 1
developersFrame.Visible = false
developersFrame.Parent = mainFrame

local developersTitle = Instance.new("TextLabel")
developersTitle.Name = "DevelopersTitle"
developersTitle.Size = UDim2.new(0.8, 0, 0, 60)
developersTitle.Position = UDim2.new(0.1, 0, 0.15, 0)
developersTitle.BackgroundTransparency = 1
developersTitle.Text = "DEVELOPED BY"
developersTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
developersTitle.TextSize = 36
developersTitle.Font = Enum.Font.GothamBold
developersTitle.TextTransparency = 1
developersTitle.Parent = developersFrame

-- Create developer list container
local developersList = Instance.new("Frame")
developersList.Name = "DevelopersList"
developersList.Size = UDim2.new(0.6, 0, 0.5, 0)
developersList.Position = UDim2.new(0.2, 0, 0.3, 0)
developersList.BackgroundTransparency = 1
developersList.Parent = developersFrame

-- Create individual developer labels
local yOffset = 0
for i, dev in ipairs(DEVELOPERS) do
	local devContainer = Instance.new("Frame")
	devContainer.Name = "DevContainer" .. i
	devContainer.Size = UDim2.new(1, 0, 0, 70)
	devContainer.Position = UDim2.new(0, 0, 0, yOffset)
	devContainer.BackgroundTransparency = 1
	devContainer.Parent = developersList

	local nameLabel = Instance.new("TextLabel")
	nameLabel.Name = "NameLabel"
	nameLabel.Size = UDim2.new(1, 0, 0, 35)
	nameLabel.Position = UDim2.new(0, 0, 0, 0)
	nameLabel.BackgroundTransparency = 1
	nameLabel.Text = dev.name
	nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	nameLabel.TextSize = 28
	nameLabel.Font = Enum.Font.GothamBold
	nameLabel.TextTransparency = 1
	nameLabel.Parent = devContainer

	local roleLabel = Instance.new("TextLabel")
	roleLabel.Name = "RoleLabel"
	roleLabel.Size = UDim2.new(1, 0, 0, 25)
	roleLabel.Position = UDim2.new(0, 0, 0, 35)
	roleLabel.BackgroundTransparency = 1
	roleLabel.Text = dev.role
	roleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	roleLabel.TextSize = 20
	roleLabel.Font = Enum.Font.Gotham
	roleLabel.TextTransparency = 1
	roleLabel.Parent = devContainer

	yOffset = yOffset + 80
end

-- Loading Bar Screen
local loadingFrame = Instance.new("Frame")
loadingFrame.Name = "LoadingFrame"
loadingFrame.Size = UDim2.new(1, 0, 1, 0)
loadingFrame.Position = UDim2.new(0, 0, 0, 0)
loadingFrame.BackgroundTransparency = 1
loadingFrame.Visible = false
loadingFrame.Parent = mainFrame

local loadingTitle = Instance.new("TextLabel")
loadingTitle.Name = "LoadingTitle"
loadingTitle.Size = UDim2.new(0.8, 0, 0, 50)
loadingTitle.Position = UDim2.new(0.1, 0, 0.4, 0)
loadingTitle.BackgroundTransparency = 1
loadingTitle.Text = "LOADING..."
loadingTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingTitle.TextSize = 32
loadingTitle.Font = Enum.Font.GothamBold
loadingTitle.TextTransparency = 1
loadingTitle.Parent = loadingFrame

-- Loading bar background
local loadingBarBg = Instance.new("Frame")
loadingBarBg.Name = "LoadingBarBg"
loadingBarBg.Size = UDim2.new(0.5, 0, 0, 8)
loadingBarBg.Position = UDim2.new(0.25, 0, 0.5, 0)
loadingBarBg.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
loadingBarBg.BorderSizePixel = 0
loadingBarBg.BackgroundTransparency = 1
loadingBarBg.Parent = loadingFrame

local loadingBarBgCorner = Instance.new("UICorner")
loadingBarBgCorner.CornerRadius = UDim.new(0, 4)
loadingBarBgCorner.Parent = loadingBarBg

-- Loading bar fill
local loadingBarFill = Instance.new("Frame")
loadingBarFill.Name = "LoadingBarFill"
loadingBarFill.Size = UDim2.new(0, 0, 1, 0)
loadingBarFill.Position = UDim2.new(0, 0, 0, 0)
loadingBarFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
loadingBarFill.BorderSizePixel = 0
loadingBarFill.Parent = loadingBarBg

local loadingBarFillCorner = Instance.new("UICorner")
loadingBarFillCorner.CornerRadius = UDim.new(0, 4)
loadingBarFillCorner.Parent = loadingBarFill

-- Loading percentage text
local loadingPercent = Instance.new("TextLabel")
loadingPercent.Name = "LoadingPercent"
loadingPercent.Size = UDim2.new(0.8, 0, 0, 30)
loadingPercent.Position = UDim2.new(0.1, 0, 0.53, 0)
loadingPercent.BackgroundTransparency = 1
loadingPercent.Text = "0%"
loadingPercent.TextColor3 = Color3.fromRGB(200, 200, 200)
loadingPercent.TextSize = 20
loadingPercent.Font = Enum.Font.Gotham
loadingPercent.TextTransparency = 1
loadingPercent.Parent = loadingFrame

-- Play Button Screen
local playButtonFrame = Instance.new("Frame")
playButtonFrame.Name = "PlayButtonFrame"
playButtonFrame.Size = UDim2.new(1, 0, 1, 0)
playButtonFrame.Position = UDim2.new(0, 0, 0, 0)
playButtonFrame.BackgroundTransparency = 1
playButtonFrame.Visible = false
playButtonFrame.Parent = mainFrame

local playButton = Instance.new("TextButton")
playButton.Name = "PlayButton"
playButton.Size = UDim2.new(0, 250, 0, 80)
playButton.Position = UDim2.new(0.5, -125, 0.5, -40)
playButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
playButton.BorderSizePixel = 0
playButton.Text = "PLAY"
playButton.TextColor3 = Color3.fromRGB(255, 255, 255)
playButton.TextSize = 32
playButton.Font = Enum.Font.GothamBold
playButton.AutoButtonColor = false
playButton.BackgroundTransparency = 1
playButton.TextTransparency = 1
playButton.Active = true
playButton.Modal = true
playButton.Parent = playButtonFrame

-- Add rounded corners to play button
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 12)
buttonCorner.Parent = playButton

-- Add stroke to play button
local buttonStroke = Instance.new("UIStroke")
buttonStroke.Color = Color3.fromRGB(255, 255, 255)
buttonStroke.Thickness = 3
buttonStroke.Transparency = 1
buttonStroke.Parent = playButton

-- Tween creation helper function
local function createTween(object, properties, duration, easingStyle, easingDirection)
	easingStyle = easingStyle or Enum.EasingStyle.Quad
	easingDirection = easingDirection or Enum.EasingDirection.InOut

	local tweenInfo = TweenInfo.new(
		duration,
		easingStyle,
		easingDirection,
		0,
		false,
		0
	)

	return TweenService:Create(object, tweenInfo, properties)
end

-- Function to fade in an object
local function fadeIn(object, duration, propertyName)
	propertyName = propertyName or "ImageTransparency"
	local properties = {[propertyName] = 0}
	local tween = createTween(object, properties, duration)
	tween:Play()
	return tween
end

-- Function to fade out an object
local function fadeOut(object, duration, propertyName)
	propertyName = propertyName or "ImageTransparency"
	local properties = {[propertyName] = 1}
	local tween = createTween(object, properties, duration)
	tween:Play()
	return tween
end

-- Function to fade in multiple text objects
local function fadeInTexts(parent, duration)
	for _, child in ipairs(parent:GetDescendants()) do
		if child:IsA("TextLabel") or child:IsA("TextButton") then
			fadeIn(child, duration, "TextTransparency")
		end
	end
end

-- Function to fade out multiple text objects
local function fadeOutTexts(parent, duration)
	for _, child in ipairs(parent:GetDescendants()) do
		if child:IsA("TextLabel") or child:IsA("TextButton") then
			fadeOut(child, duration, "TextTransparency")
		end
	end
end

-- Realistic loading bar animation with true randomness
local function animateLoadingBar()
	-- Random loading time between min and max
	local loadingTime = math.random(LOADING_TIME_MIN * 100, LOADING_TIME_MAX * 100) / 100

	-- Get the max width for the loading bar
	local maxWidth = loadingBarBg.AbsoluteSize.X

	local currentProgress = 0
	local targetProgress = 0

	-- Create random checkpoints throughout the loading process
	local checkpoints = {}

	-- Always start at 0
	table.insert(checkpoints, {percent = 0, time = 0})

	-- Generate 8-15 random checkpoints with varying speeds
	local numCheckpoints = math.random(8, 15)
	local timeAccumulator = 0

	for i = 1, numCheckpoints do
		local percentJump = math.random(3, 15) -- Random jump between 3-15%
		local newPercent = math.min(checkpoints[#checkpoints].percent + percentJump, 95)

		-- Random time for this segment (creates variable speed)
		local segmentTime = math.random(50, 200) / 100
		timeAccumulator = timeAccumulator + segmentTime

		table.insert(checkpoints, {percent = newPercent, time = timeAccumulator})
	end

	-- Always end at 100%
	table.insert(checkpoints, {percent = 100, time = loadingTime})

	-- Animate through all checkpoints
	for i = 2, #checkpoints do
		local startPercent = checkpoints[i-1].percent
		local endPercent = checkpoints[i].percent
		local startTime = checkpoints[i-1].time
		local endTime = checkpoints[i].time
		local duration = endTime - startTime

		local segmentStart = tick()

		while tick() - segmentStart < duration do
			local elapsed = tick() - segmentStart
			local progress = elapsed / duration

			-- Use easing for smooth movement
			local easedProgress = 1 - math.pow(1 - progress, 3) -- Cubic ease out

			targetProgress = startPercent + (endPercent - startPercent) * easedProgress

			-- Smooth interpolation to target
			currentProgress = currentProgress + (targetProgress - currentProgress) * 0.3

			-- Update bar
			local barWidth = math.floor((currentProgress / 100) * maxWidth)
			loadingBarFill.Size = UDim2.new(0, barWidth, 1, 0)

			-- Update percentage text
			local displayPercent = math.floor(currentProgress)
			loadingPercent.Text = displayPercent .. "%"

			task.wait(0.03)
		end

		-- Snap to target for this checkpoint
		currentProgress = endPercent
		local barWidth = math.floor((currentProgress / 100) * maxWidth)
		loadingBarFill.Size = UDim2.new(0, barWidth, 1, 0)
		loadingPercent.Text = math.floor(currentProgress) .. "%"
	end

	-- Ensure we reach exactly 100%
	loadingBarFill.Size = UDim2.new(1, 0, 1, 0)
	loadingPercent.Text = "100%"
	wait(0.5) -- Hold at 100% briefly
end

-- Cinematic sequence
local function playCinematic()
	-- Phase 1: Studio Logo
	wait(0.5) -- Small initial delay

	-- Fade in studio logo
	local logoFadeIn = fadeIn(studioLogo, FADE_IN_TIME, "ImageTransparency")
	logoFadeIn.Completed:Wait()

	-- Display studio logo
	wait(STUDIO_DISPLAY_TIME)

	-- Fade out studio logo
	local logoFadeOut = fadeOut(studioLogo, FADE_OUT_TIME, "ImageTransparency")
	logoFadeOut.Completed:Wait()

	-- Hide studio frame
	studioFrame.Visible = false

	-- Phase 2: Developers Screen
	developersFrame.Visible = true
	wait(0.3)

	-- Fade in developers title
	local titleFadeIn = fadeIn(developersTitle, FADE_IN_TIME, "TextTransparency")
	titleFadeIn.Completed:Wait()

	wait(0.5)

	-- Fade in developers list
	fadeInTexts(developersList, FADE_IN_TIME)
	wait(FADE_IN_TIME)

	-- Display developers
	wait(STUDIO_DISPLAY_TIME)

	-- Fade out developers screen
	fadeOutTexts(developersFrame, FADE_OUT_TIME)
	wait(FADE_OUT_TIME)

	developersFrame.Visible = false

	-- Phase 3: Loading Bar
	loadingFrame.Visible = true
	wait(0.3)

	-- Fade in loading screen elements
	fadeIn(loadingTitle, FADE_IN_TIME, "TextTransparency")
	fadeIn(loadingBarBg, FADE_IN_TIME, "BackgroundTransparency")
	fadeIn(loadingPercent, FADE_IN_TIME, "TextTransparency")
	wait(FADE_IN_TIME)

	-- Animate the loading bar
	animateLoadingBar()

	-- Fade out loading screen
	fadeOut(loadingTitle, FADE_OUT_TIME, "TextTransparency")
	fadeOut(loadingBarBg, FADE_OUT_TIME, "BackgroundTransparency")
	fadeOut(loadingPercent, FADE_OUT_TIME, "TextTransparency")
	wait(FADE_OUT_TIME)

	loadingFrame.Visible = false

	-- Phase 4: Play Button
	playButtonFrame.Visible = true
	wait(0.3)

	-- Fade in play button
	fadeIn(playButton, FADE_IN_TIME, "BackgroundTransparency")
	fadeIn(playButton, FADE_IN_TIME, "TextTransparency")
	fadeIn(buttonStroke, FADE_IN_TIME, "Transparency")
end

-- Play button hover effects
playButton.MouseEnter:Connect(function()
	createTween(playButton, {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}, 0.2):Play()
	createTween(playButton, {Size = UDim2.new(0, 270, 0, 90)}, 0.2):Play()
end)

playButton.MouseLeave:Connect(function()
	createTween(playButton, {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}, 0.2):Play()
	createTween(playButton, {Size = UDim2.new(0, 250, 0, 80)}, 0.2):Play()
end)

-- Variable to prevent multiple clicks
local buttonClicked = false

-- Function to handle button click
local function onPlayButtonClick()
	if buttonClicked then return end
	buttonClicked = true

	print("Play button clicked!") -- Debug message

	-- Disable button interactions
	playButton.Active = false

	-- Fade out play button
	fadeOut(playButton, FADE_OUT_TIME, "BackgroundTransparency")
	fadeOut(playButton, FADE_OUT_TIME, "TextTransparency")
	fadeOut(buttonStroke, FADE_OUT_TIME, "Transparency")

	wait(FADE_OUT_TIME)

	-- Fade out the black background
	local finalFadeOut = createTween(mainFrame, {BackgroundTransparency = 1}, FADE_OUT_TIME)
	finalFadeOut:Play()
	finalFadeOut.Completed:Wait()

	-- Destroy the GUI
	introGui:Destroy()
end

-- Connect button events (use both for better compatibility)
playButton.MouseButton1Click:Connect(onPlayButtonClick)
playButton.Activated:Connect(onPlayButtonClick)

-- Start the cinematic
playCinematic()
