-- Why do i love gpt 5.6 sol high the reason is below.
-- dsc.gg/oxyenv 

return function(arg)
	local make = arg.make
	local makeTween = arg.makeTween
	local c = arg.C
	local notify = arg.notify
	local track = arg.track
	local state = arg.state
	local safeMode = arg.SAFE_MODE
	local makeSlider = arg.makeSlider
	local makeToggleRow = arg.makeToggleRow
	local makeGroup = arg.makeGroup
	local sectionLabel = arg.sectionLabel
	local replicatedStorage = arg.ReplicatedStorage
	local localPlayer = arg.LocalPlayer
	local vehicle = arg.pages.vehicle

	local Frame = make("Frame", {
		Parent = vehicle,
		Size = UDim2.new(1, 0, 0, 86),
		BackgroundColor3 = c.SURFACE,
		BorderSizePixel = 0,
		LayoutOrder = 1,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 10), Parent = Frame })
	make("UIStroke", { Color = c.BORDER, Thickness = 1, Transparency = 0.4, Parent = Frame })

	make("TextLabel", {
		Parent = Frame,
		Size = UDim2.new(0, 130, 0, 40),
		Position = UDim2.fromOffset(14, 10),
		BackgroundTransparency = 1,
		Text = "0",
		Font = Enum.Font.GothamBold,
		TextSize = 34,
		TextColor3 = c.ACCENT,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	local TextButton = make("TextButton", {
		Parent = Frame,
		Size = UDim2.fromOffset(64, 17),
		Position = UDim2.fromOffset(14, 50),
		BackgroundColor3 = c.SURFACE2,
		BorderSizePixel = 0,
		Text = "studs / sec",
		Font = Enum.Font.Gotham,
		TextSize = 10,
		TextColor3 = c.SUBTEXT,
		AutoButtonColor = false,
	})

	make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = TextButton })
	make("UIStroke", { Color = c.BORDER, Thickness = 1, Transparency = 0.5, Parent = TextButton })

	track(TextButton.MouseEnter:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()M[1](M[2][7][M[2][6]],0.12,{TextColor3=M[3].TEXT}):Play();end)))

	track(TextButton.MouseLeave:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()M[1](M[2][7][M[2][6]],0.12,{TextColor3=M[3].SUBTEXT}):Play();end)))

	track(TextButton.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()M[1].useMph=not M[1].useMph;M[2][7][M[2][6]].Text=M[1].useMph and"mph"or"studs / sec";for b,b in ipairs(M[1].sliderRefreshers)do b();end;end)))

	make("TextLabel", {
		Parent = Frame,
		Size = UDim2.new(0, 130, 0, 20),
		Position = UDim2.new(1, -144, 0, 16),
		BackgroundTransparency = 1,
		Text = "NO VEHICLE",
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		TextColor3 = c.SUBTEXT,
		TextXAlignment = Enum.TextXAlignment.Right,
	})

	local Frame2 = make("Frame", {
		Parent = Frame,
		Size = UDim2.new(1, -28, 0, 6),
		Position = UDim2.new(0, 14, 1, -16),
		BackgroundColor3 = c.OFF,
		BorderSizePixel = 0,
	})

	make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Frame2 })
	local Frame3 = make("Frame", { Parent = Frame2, Size = UDim2.new(0, 0, 1, 0), BackgroundColor3 = c.ACCENT, BorderSizePixel = 0 })
	make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Frame3 })
	make("UIGradient", { Parent = Frame3, Color = ColorSequence.new(c.ACCENT, c.ACCENT2) })

	arg.configReg.useMph = {
		get = function()
			return state.useMph
		end,
		set = function(arg2)
			state.useMph = arg2 and true or false
			TextButton.Text = state.useMph and "mph" or "studs / sec"

			for _, sliderRefresher in ipairs(state.sliderRefreshers) do
				sliderRefresher()
			end
		end,
	}

	ColorSequence.new(c.ACCENT, c.ACCENT2)
	ColorSequence.new(c.AMBER, c.AMBER2)

	arg.updateVehicleUI = --[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(b)local O=M[1].currentSpeed<-0.5;M[2][7][M[2][6]].Text=tostring(M[3](M[1].currentSpeed));local w=O and M[1].maxReverse or M[1].maxSpeed;M[4][7][M[4][6]].Size=UDim2.new(math.clamp(math.abs(M[1].currentSpeed)/w,0,1),0,1,0);if O~=M[1].lastReversing then M[1].lastReversing=O;M[5][7][M[5][6]].Color=O and M[6]or M[7];M[2][7][M[2][6]].TextColor3=O and M[8].AMBER or M[8].ACCENT;end;local w,P;if not M[1].controllerActive then w,P=M[8].SUBTEXT,"OFF";elseif not b then w,P=M[8].RED,"NO VEHICLE";elseif M[1].spaceHeld then w,P=M[8].RED,"HANDBRAKE";elseif M[1].wHeld and M[1].sHeld then w,P=M[8].SUBTEXT,"NEUTRAL";elseif M[1].cruiseActive then P,w=("CRUISE %d"):format(M[3](M[1].cruiseTarget)),M[8].ACCENT;elseif O then w,P=M[8].AMBER,"REVERSE";elseif M[1].currentSpeed>0.5 then w,P=M[8].GREEN,"DRIVE";else w,P=M[8].SUBTEXT,"IDLE";end;M[9][7][M[9][6]].Text=P;M[9][7][M[9][6]].TextColor3=w;if M[10].updateStatusDot then M[10].updateStatusDot(b and M[8].GREEN or(M[1].controllerActive and M[8].RED or M[8].OFF));end;end

	sectionLabel(vehicle, "Car", 2)
	local atLowIdentity = arg.atLowIdentity
	local ModuleLoader = nil
	local v = nil
	local module = nil
	local module2 = nil
	local flag = false

	local function fn()
		if flag then
			return module ~= nil
		end
		flag = true

		pcall(function()
			atLowIdentity(function()
				ModuleLoader = require(replicatedStorage.Modules.ModuleLoader)
				v = ModuleLoader.assign(replicatedStorage.Modules.Algorithms)
				local playerScripts = localPlayer:FindFirstChild("PlayerScripts")
				playerScripts = playerScripts and playerScripts:FindFirstChild("Framework")
				local vehicle2 = playerScripts and playerScripts:FindFirstChild("Vehicle")

				if vehicle2 then
					module = require(vehicle2)
				end

				playerScripts = playerScripts and playerScripts:FindFirstChild("Core")

				if playerScripts then
					module2 = require(playerScripts)
				end
			end)
		end)

		return module ~= nil
	end

	local function fn2(arg2)
		if not (module2 and type(module2.notify) == "function") then
			return arg2()
		end
		local notify2 = module2.notify

		module2.notify = function(arg3, ...)
			local message = type(arg3) == "table" and arg3.message
			if type(message) == "string" and string.find(string.lower(message), "too far") then
				return
			end
			return notify2(arg3, ...)
		end

		local ok, result = pcall(arg2)
		module2.notify = notify2

		if not ok then
			error(result)
		end
	end

	local function fn3()
		local v2 = nil

		pcall(function()
			if v and v.getVehicleInfo then
				v2 = v.getVehicleInfo.getBelongingVehicle(localPlayer)
			end
		end)

		return v2
	end

	local function driverSeatOf(arg2)
		if not arg2 then
			return nil, nil
		end

		for _, descendant in ipairs(arg2:GetDescendants()) do
			if descendant:IsA("ProximityPrompt") and descendant.Name == "EnterDriver" then
				local parent = descendant.Parent

				if parent and parent:IsA("Attachment") then
					parent = parent.Parent
				end

				if parent and parent:IsA("BasePart") then
					return parent, descendant
				end
			end
		end

		return nil, nil
	end

	arg.driverSeatOf = driverSeatOf

	local function fn4()
		local character = localPlayer.Character
		local primaryPart

		if character then
			primaryPart = character.PrimaryPart or character:FindFirstChild("HumanoidRootPart")
		else
			primaryPart = character
		end

		arg.spawnS(function()
			if not fn() then
				if notify then
					notify("Vehicle module not found here", "err")
				end

				return
			end

			local v2 = fn3()
			local ghostRealCF = arg.ghostRealCF and arg.ghostRealCF()

			if not ghostRealCF then
				local v3 = primaryPart

				if primaryPart then
					ghostRealCF = primaryPart.CFrame
				else
					ghostRealCF = v3
				end
			end

			if v2 and v2.PrimaryPart and ghostRealCF then
				local ok = pcall(function()
					local chassis = v2:FindFirstChild("_Chassis")

					if chassis then
						chassis.AssemblyLinearVelocity = Vector3.zero
						chassis.AssemblyAngularVelocity = Vector3.zero
					end

					v2:PivotTo(ghostRealCF * CFrame.new(0, 3, -8))
				end)

				if notify then
					notify(ok and "Brought your car to you" or "Couldn't move your car", ok and "ok" or "err")
				end

				return
			end

			if module and type(module.spawnVehicle) == "function" then
				pcall(function()
					module.spawnVehicle()
				end)
			end

			task.wait(0.6)

			if fn3() then
				if notify then
					notify("Bringing your car", "ok")
				end
			elseif notify then
				notify("No car spawned. Spawn one from your garage first", "err")
			end
		end)
	end

	local function fn5()
		local character = localPlayer.Character
		local primaryPart = character and (character.PrimaryPart or character:FindFirstChild("HumanoidRootPart"))

		if not primaryPart then
			if notify then
				notify("No character yet", "err")
			end

			return
		end

		arg.spawnS(function()
			fn()
			local v2, v3 = driverSeatOf(fn3())

			if not v2 then
				if notify then
					notify(fn3() and "Couldn't find your car's driver seat" or "No car spawned. Spawn one from your garage first", "err")
				end

				return
			end

			pcall(function()
				primaryPart.CFrame = v2.CFrame * CFrame.new(0, 3, 0)
			end)

			task.wait(0.15)

			if arg.desyncSyncNow and not arg.desyncSyncNow(1.5) then
				if notify then
					notify("Couldn't sync in time, try again", "err")
				end

				return
			end

			local ok, result = pcall(function()
				fn2(function()
					if module and type(module.enterVehicle) == "function" then
						module.enterVehicle(v2)

						if arg.desyncDone then
							arg.desyncDone()
						end
					elseif fireproximityprompt then
						fireproximityprompt(v3)
					else
						error("no enter path")
					end
				end)
			end)

			if not ok then
				arg.log("Enter Car failed: " .. tostring(result), "warn")
			end

			if notify then
				notify(ok and "Getting in" or "Couldn't enter", ok and "ok" or "err")
			end
		end)
	end

	arg.enterSeat = function(arg2)
		if not (arg2 and arg2:IsA("BasePart")) then
			return false
		end
		local character = localPlayer.Character
		local primaryPart

		if character then
			primaryPart = character.PrimaryPart or character:FindFirstChild("HumanoidRootPart")
		else
			primaryPart = character
		end

		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		if not (primaryPart and humanoid) then
			return false
		end

		if humanoid.SeatPart == arg2 then
			return true
		end
		fn()

		local function fn6()
			if humanoid.SeatPart then
				return true
			end

			local ok, result = pcall(function()
				return v and v.getVehicleInfo and v.getVehicleInfo.inVehicle(localPlayer)
			end)

			if ok and typeof(result) == "Instance" then
				return true
			end
			return humanoid.Sit == true
		end

		if fn6() then
			return true
		end

		pcall(function()
			arg2.Disabled = false
		end)

		pcall(function()
			primaryPart.CFrame = arg2.CFrame * CFrame.new(0, 3, 0)
		end)

		task.wait(0.15)
		if arg.desyncSyncNow and not arg.desyncSyncNow(1.5) then
			return false
		end

		if not pcall(function()
			fn2(function()
				if module and type(module.enterVehicle) == "function" then
					module.enterVehicle(arg2)

					if arg.desyncDone then
						arg.desyncDone()
					end
				else
					local v2 = nil

					for _, descendant in ipairs(arg2:GetDescendants()) do
						if descendant:IsA("ProximityPrompt") and descendant.Name == "EnterDriver" then
							v2 = descendant
							break
						else
							v2 = nil
						end
					end

					if v2 and fireproximityprompt then
						fireproximityprompt(v2)
					else
						error("no enter path")
					end
				end
			end)
		end) then
			return false
		end

		for i = 1, 20 do
			if fn6() then
				return true
			end
			task.wait(0.1)
		end

		return (fn6())
	end

	arg.driverSeatOf = driverSeatOf

	arg.belongingVehicle = function()
		fn()
		return fn3()
	end

	local Frame4 = make("Frame", { Parent = vehicle, Size = UDim2.new(1, 0, 0, 40), BackgroundTransparency = 1, LayoutOrder = 3 })

	make("UIListLayout", {
		Parent = Frame4,
		FillDirection = Enum.FillDirection.Horizontal,
		Padding = UDim.new(0, 8),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local function fn6(arg2, arg3, arg4)
		local TextButton2 = make("TextButton", {
			Parent = Frame4,
			Size = UDim2.new(0.5, -4, 1, 0),
			BackgroundColor3 = c.SURFACE,
			BorderSizePixel = 0,
			Text = arg2,
			Font = Enum.Font.GothamBold,
			TextSize = 13,
			TextColor3 = c.TEXT,
			AutoButtonColor = false,
			LayoutOrder = arg4,
		})

		make("UICorner", { CornerRadius = UDim.new(0, 11), Parent = TextButton2 })
		make("UIStroke", { Color = c.BORDER, Thickness = 1, Transparency = 0.55, Parent = TextButton2 })

		track(TextButton2.MouseEnter:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()M[1](M[2],0.12,{BackgroundColor3=M[3].SURFACE2}):Play();end)))

		track(TextButton2.MouseLeave:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()M[1](M[2],0.12,{BackgroundColor3=M[3].SURFACE}):Play();end)))

		track(TextButton2.MouseButton1Click:Connect(arg.safe(arg3)))
	end

	fn6("Bring Car", fn4, 1)
	fn6("Enter Car", fn5, 2)
	sectionLabel(vehicle, "Driving", 4)
	local maxSpeed = state.maxSpeed
	local maxReverse = state.maxReverse
	local acceleration = state.acceleration
	local braking = state.braking
	local coastDrag = state.coastDrag
	local n = safeMode and 160 or 500
	local n2 = safeMode and 100 or 300

	arg.setControllerOn = makeGroup(vehicle, "zap", "Speed Controller", "W forward · S brake / reverse · Z", 5, true, function(controllerActive)
		state.controllerActive = controllerActive

		if not controllerActive then
			arg.detach()
		end
	end, "speedController", function(arg2)
		local maxSpeed2 = makeSlider(arg2, "Max Speed", 1, 50, n, math.min(maxSpeed, n), function(maxSpeed2)
			state.maxSpeed = maxSpeed2
		end, nil, "maxSpeed")

		local reverseSpeed = makeSlider(arg2, "Reverse Speed", 2, 20, n2, math.min(maxReverse, n2), function(maxReverse2)
			state.maxReverse = maxReverse2
		end, nil, "maxReverse")

		local acceleration2 = makeSlider(arg2, "Acceleration", 3, 10, 200, acceleration, function(acceleration2)
			state.acceleration = acceleration2
		end, nil, "acceleration")

		local braking2 = makeSlider(arg2, "Braking", 4, 20, 500, braking, function(braking2)
			state.braking = braking2
		end, nil, "braking")

		local coastDrag2 = makeSlider(arg2, "Coast Drag", 5, 0, 200, coastDrag, function(coastDrag2)
			state.coastDrag = coastDrag2
		end, nil, "coastDrag")

		arg.makeButton(arg2, "Reset tuning", nil, 6, function()
			maxSpeed2(maxSpeed)
			reverseSpeed(maxReverse)
			acceleration2(acceleration)
			braking2(braking)
			coastDrag2(coastDrag)

			if notify then
				notify("Tuning reset", "info")
			end
		end)
	end, { collapse = false })

	arg.setCruiseOn = makeToggleRow(vehicle, "navigation", "Cruise Control", "Hold current speed · W/S trims · C", 6, false, function(cruiseActive)
		state.cruiseActive = cruiseActive

		if cruiseActive then
			state.cruiseTarget = state.currentSpeed
		end
	end, "cruiseControl")

	makeToggleRow(vehicle, "shield-alert", "Collision Stop", "Auto-brake before hitting walls", 7, true, function(crashGuard)
		state.crashGuard = crashGuard
	end, "collisionStop")

	arg.driveOffroad = true

	makeToggleRow(vehicle, "car", "Off-road Shortcuts", "Auto-drive may cut across terrain", 7, true, function(driveOffroad)
		arg.driveOffroad = driveOffroad
	end, "driveOffroad")

	makeToggleRow(vehicle, "navigation", "Auto-drive Status", "Show destination, ETA and what it's doing", 7, true, function(driveHudOn)
		arg.driveHudOn = driveHudOn
	end, "driveHud")

	if not safeMode then
		sectionLabel(vehicle, "Suspension", 8)
		local v2 = nil

		local v3 = makeGroup(vehicle, "anchor", "Ground Lock", "Pin the car to the ground", 9, false, function(groundLockEnabled)
			state.groundLockEnabled = groundLockEnabled

			if groundLockEnabled and v2 then
				v2(false)
			end
		end, "groundLock", function(arg2)
			makeSlider(arg2, "Ride Height", 1, -20, 20, state.rideHeight, function(rideHeight)
				state.rideHeight = rideHeight
			end, true, "rideHeight")
		end)

		v2 = makeGroup(vehicle, "feather", "Float", "Float the car above the ground", 10, false, function(floatEnabled)
			state.floatEnabled = floatEnabled

			if floatEnabled and v3 then
				v3(false)
			end
		end, "float", function(arg2)
			makeSlider(arg2, "Float Height", 1, 0, 30, state.floatHeight, function(floatHeight)
				state.floatHeight = floatHeight
			end, true, "floatHeight")
		end)
	end

	sectionLabel(vehicle, "Stats", 17)
	local flag2 = false
	local flag3 = false
	arg.noCrashActive = false
	local n3 = 0
	local v2 = nil
	local v3 = nil
	local value = 15
	local v4 = nil
	local tbl = {}

	local function fn7()
		local getCurrentVehicle = arg.getCurrentVehicle and arg.getCurrentVehicle()

		if not getCurrentVehicle then
			v3 = nil
			value = 15
			v4 = nil
			return
		end

		if getCurrentVehicle == v4 and v3 and v3.Parent then
			return
		end
		v4 = getCurrentVehicle
		v3 = nil
		value = 15

		for _, descendant in ipairs(getCurrentVehicle:GetDescendants()) do
			if descendant.Name == "Config" and descendant:FindFirstChild("Fuel") then
				v3 = descendant
				local ok, result = pcall(require, descendant)

				if ok and type(result) == "table" and type(result.MAX_FUEL) == "number" then
					value = result.MAX_FUEL
				end

				return
			end
		end
	end

	local function fn8()
		if not (flag3 and v3) then
			return
		end
		local fuel = v3:FindFirstChild("Fuel")
		if not (fuel and (fuel:IsA("NumberValue") or fuel:IsA("IntValue"))) then
			return
		end

		if fuel.Value < value then
			fuel.Value = value
		end
	end

	local function fn9()
		if not flag2 then
			return
		end
		local getCurrentVehicle = arg.getCurrentVehicle and arg.getCurrentVehicle()
		if not getCurrentVehicle then
			return
		end
		local collisions = getCurrentVehicle:FindFirstChild("Collisions") or getCurrentVehicle:FindFirstChild("Collisions", true)
		if not collisions then
			return
		end

		for _, descendant in ipairs(collisions:GetDescendants()) do
			if descendant:IsA("BasePart") and descendant.Parent then
				if not tbl[descendant] then
					tbl[descendant] = { parent = descendant.Parent }
				end

				pcall(function()
					descendant.Parent = nil
				end)
			end
		end
	end

	local function fn10()
		for k, v5 in pairs(tbl) do
			pcall(function()
				if v5.parent and v5.parent.Parent then
					k.Parent = v5.parent
				end
			end)
		end

		tbl = {}
	end

	local function fn11()
		n3 += 1
		local v5 = n3

		arg.spawnS(function()
			while (flag2 or flag3) and state.running and v5 == n3 do
				local getCurrentVehicle = arg.getCurrentVehicle and arg.getCurrentVehicle()

				if getCurrentVehicle ~= v2 then
					fn10()
					v2 = getCurrentVehicle
				end

				fn7()
				fn8()
				local v6 = flag2

				if not flag2 then
					getCurrentVehicle = v6
				end

				if getCurrentVehicle then
					fn9()
				end

				task.wait(0.2)
			end
		end)
	end

	makeToggleRow(vehicle, "shield", "No Crashes", "Disables car collisions", 18, false, function(noCrashActive)
		flag2 = noCrashActive
		arg.noCrashActive = noCrashActive

		if noCrashActive then
			fn11()
		else
			fn10()
			v2 = nil
		end
	end, "noCrashes")

	makeToggleRow(vehicle, "fuel", "Full Fuel", "Keeps your fuel full", 19, false, function(arg2)
		flag3 = arg2

		if arg2 then
			fn11()
		end
	end, "carFuel")

	local RunService = game:GetService("RunService")
	local exclude = Enum.RaycastFilterType.Exclude
	RaycastParams.new().FilterType = exclude

	track(RunService.Stepped:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()local b=M[1].getCurrentVehicle and(M[1].getCurrentVehicle());if not(b and b.Parent)then M[2][7][M[2][6]],M[3][7][M[3][6]]=nil,nil;return;end;local O,w=pcall(function()return b:GetPivot();end);if not O then return;end;if M[3][7][M[3][6]]~=b then M[4].FilterDescendantsInstances={b,M[5].Character};M[2][7][M[2][6]],M[3][7][M[3][6]]=nil,b;end;O=workspace:Raycast(w.Position+Vector3.new(0,2,0),Vector3.new(0,-16,0),M[4]);if not(O and O.Normal.Y>0.9)then return;end;if not(M[2][7][M[2][6]]and M[2][7][M[2][6]].Parent)then O=b:FindFirstChild("_Chassis")or b.PrimaryPart;w=O and(O:FindFirstChild("Center"));M[2][7][M[2][6]]=w and(w:FindFirstChild("VectorForce"))or nil;if not M[2][7][M[2][6]]then for O,w in ipairs(b:GetDescendants())do if w:IsA("VectorForce")and not w:FindFirstAncestor("Thrusters")then O=w.Force;if O.X==0 and O.Z==0 and O.Y>100 then M[2][7][M[2][6]]=w;break;end;end;end;end;end;if M[2][7][M[2][6]]and M[2][7][M[2][6]].Force.Y>0 then M[2][7][M[2][6]].Force=Vector3.new(0.0,0.0,0.0);end;end)))

	table.insert(arg.cleanups, function()
		flag2 = false
		flag3 = false
		arg.noCrashActive = false
		fn10()
	end)

	local n4 = 44.857142857142861
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local players = arg.Players or game:GetService("Players")
	local flag4 = false
	local flag5 = true
	local n5 = 2000
	local flag6 = false
	local flag7 = false
	local str = "once"
	local str2 = "nearest"
	local n6 = 6
	local n7 = 0

	local function fn12()
		n7 += 1
	end

	local tbl2 = {}
	local crashGuard = nil
	local flag8 = false
	local tbl3 = {}
	local tbl4 = {}
	local tbl5 = {}
	local vxRamLog = {}

	if getgenv then
		getgenv().__vxRamLog = vxRamLog
	end

	local function fn13(arg2)
		vxRamLog[#vxRamLog + 1] = ("%.0f %s"):format(os.clock(), arg2)

		if #vxRamLog > 60 then
			table.remove(vxRamLog, 1)
		end
	end

	local flag9 = false
	local tbl6 = {}

	arg.markSyntheticKey = function(arg2)
		tbl6[arg2] = os.clock()
	end

	local tbl7 = { W = "gas", S = "brake", A = "left", D = "right" }

	local function fn14(arg2, arg3)
		local flag10

		if arg3 then
			flag10 = not (flag4 or flag8 or flag7)
		else
			flag10 = arg3
		end

		if flag10 then
			arg3 = false
		end

		if tbl2[arg2] == arg3 then
			return
		end
		tbl2[arg2] = arg3

		if arg2 == "W" or arg2 == "S" then
			state.autoThrottle = tbl2.W and not tbl2.S and 1 or tbl2.S and not tbl2.W and -1 or 0
		end

		if arg.IS_MOBILE and arg.touchHold then
			local mobileVehicleButtons = arg.mobileVehicleButtons and arg.mobileVehicleButtons()
			mobileVehicleButtons = mobileVehicleButtons and mobileVehicleButtons[tbl7[arg2]]
			if mobileVehicleButtons and arg.touchHold(mobileVehicleButtons, arg3) then
				return
			end
		end

		flag9 = true
		tbl6[Enum.KeyCode[arg2]] = os.clock()

		pcall(function()
			VirtualInputManager:SendKeyEvent(arg3, Enum.KeyCode[arg2], false, game)
		end)

		flag9 = false
	end

	local function fn15()
		for _, v5 in ipairs({ "W", "A", "D", "S" }) do
			fn14(v5, false)
		end
	end

	local function fn16()
		if crashGuard ~= nil then
			state.crashGuard = crashGuard
			crashGuard = nil
		end

		state.autoCap = nil
		state.autoYaw = nil
	end

	local flag10 = false

	local function fn17()
		fn15()
		fn16()

		if flag10 then
			flag10 = false
			local speedController = arg.configReg and arg.configReg.speedController

			if speedController and speedController.set then
				pcall(speedController.set, false)
			end
		end
	end

	local v5 = nil
	local v6 = nil
	local v7 = nil
	local flag11 = false
	local fn18 = nil
	local n8 = 10
	local tbl8 = nil

	local function fn19()
		if tbl8 then
			return tbl8
		end
		local v8 = os.date("%Y-%m-%d")
		local v9 = nil

		pcall(function()
			if type(readfile) == "function" and type(isfile) == "function" and isfile("vxdata/ramquota.json") then
				local data = game:GetService("HttpService"):JSONDecode(readfile("vxdata/ramquota.json"))

				if type(data) == "table" and data.date == v8 then
					v9 = data
				end
			end
		end)

		tbl8 = v9 or { date = v8, n = 0 }
		return tbl8
	end

	local function fn20(arg2)
		pcall(function()
			if type(writefile) ~= "function" then
				return
			end

			if type(makefolder) == "function" and type(isfolder) == "function" and not isfolder("vxdata") then
				makefolder("vxdata")
			end

			writefile("vxdata/ramquota.json", game:GetService("HttpService"):JSONEncode(arg2))
		end)
	end

	local function fn21(arg2)
		if arg.premiumPopup then
			local v8 = pcall
			local premiumPopup = arg.premiumPopup
			local str3 = "Unlimited rams (free is %d a day)"
			local format = str3.format
			arg2 = arg2 or 10
			v8(premiumPopup, format(str3, arg2))
		elseif notify then
			notify(("Daily ram limit reached (%d). Premium has unlimited rams"):format(arg2 or 10), "warn")
		end
	end

	local function fn22(arg2, arg3)
		if not notify then
			return
		end
		local n9 = arg3 - arg2
		notify(n9 > 0 and ("Ram %d/%d used today, %d left"):format(arg2, arg3, n9) or ("That was your last free ram today (%d/%d)"):format(arg2, arg3), n9 > 0 and "info" or "warn")
	end

	local function fn23()
		local v8 = fn19()

		if v8.date ~= os.date("%Y-%m-%d") then
			v8.date = os.date("%Y-%m-%d")
			v8.n = 0
		end

		if n8 <= v8.n then
			fn21(10)
			return false
		end
		v8.n = v8.n + 1
		fn20(v8)
		fn22(v8.n, 10)
		return true
	end

	local function fn24()
		if arg.VX and arg.VX.pm then
			return true
		end
		local HttpService = game:GetService("HttpService")
		local vxsansHost = getgenv and getgenv().VXSANS_HOST or _G.VXSANS_HOST
		local vxsansSession = getgenv and getgenv().VXSANS_SESSION or _G.VXSANS_SESSION
		local vxsansHwid = getgenv and getgenv().VXSANS_HWID or _G.VXSANS_HWID

		if vxsansHost and vxsansSession and vxsansHwid then
			local ok, result = pcall(function()
				return HttpService:JSONDecode(game:HttpGet(vxsansHost .. "/ram.php?token=" .. HttpService:UrlEncode(tostring(vxsansSession)) .. "&hwid=" .. HttpService:UrlEncode(tostring(vxsansHwid))))
			end)

			if ok and type(result) == "table" and result.status == "ok" then
				if result.premium then
					return true
				end

				if result.allowed then
					fn22(tonumber(result.used) or 0, tonumber(result.cap) or 10)
					return true
				end
				fn21(tonumber(result.cap) or 10)
				return false
			end
		end

		return fn23()
	end

	arg.ramQuota = function()
		local HttpService = game:GetService("HttpService")
		local vxsansHost = getgenv and getgenv().VXSANS_HOST or _G.VXSANS_HOST
		local vxsansSession = getgenv and getgenv().VXSANS_SESSION or _G.VXSANS_SESSION
		local vxsansHwid = getgenv and getgenv().VXSANS_HWID or _G.VXSANS_HWID

		if vxsansHost and vxsansSession and vxsansHwid then
			local ok, result = pcall(function()
				return HttpService:JSONDecode(game:HttpGet(vxsansHost .. "/ram.php?peek=1&token=" .. HttpService:UrlEncode(tostring(vxsansSession)) .. "&hwid=" .. HttpService:UrlEncode(tostring(vxsansHwid))))
			end)

			if ok and type(result) == "table" and result.status == "ok" then
				return tonumber(result.used) or 0, tonumber(result.cap) or 10, result.premium and true or false
			end
		end

		return fn19().n, 10, arg.VX and arg.VX.pm and true or false
	end

	arg.cancelRam = function()
		flag4 = false
		flag8 = false
		v7 = nil
		fn12()
		fn17()

		if fn18 then
			flag11 = true
			pcall(fn18, false)
			flag11 = false
		end

		if v5 then
			local mode = v5.mode
			str2 = v5.filter
			str = mode
			local autoRamFilter = arg.configReg and arg.configReg.autoRamFilter

			if autoRamFilter and autoRamFilter.set then
				pcall(autoRamFilter.set, str2)
			end

			local autoRamMode = arg.configReg and arg.configReg.autoRamMode

			if autoRamMode and autoRamMode.set then
				pcall(autoRamMode.set, str)
			end

			v5 = nil
			v6 = nil
		end
	end

	arg.ramActive = function()
		return flag4 or flag8
	end

	arg.ramActiveFor = function(arg2)
		return flag8 and v7 == arg2 or flag4 and v6 == arg2
	end

	arg.ramBusyFor = function(arg2)
		return flag8 and v7 == arg2
	end

	arg.huntingFor = function(arg2)
		return flag4 and v6 == arg2
	end

	local function fn25(arg2)
		local TextButton2 = make("TextButton", {
			Parent = arg2,
			LayoutOrder = 0,
			Visible = false,
			Size = UDim2.new(1, 0, 0, 40),
			BackgroundColor3 = c.SURFACE2,
			BackgroundTransparency = 0.25,
			Text = "",
			AutoButtonColor = false,
			BorderSizePixel = 0,
		})

		make("UICorner", { CornerRadius = UDim.new(0, 10), Parent = TextButton2 })
		make("UIStroke", { Parent = TextButton2, Color = c.RED, Transparency = 0.55, Thickness = 1 })

		make("ImageLabel", {
			Parent = TextButton2,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 14, 0.5, 0),
			Size = UDim2.fromOffset(16, 16),
			Image = arg.iconId and (arg.iconId("zap") or arg.iconId("car")) or "",
			ImageColor3 = c.RED,
		})

		local TextLabel = make("TextLabel", {
			Parent = TextButton2,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 40, 0.5, 0),
			Size = UDim2.new(1, -110, 1, 0),
			Font = Enum.Font.GothamMedium,
			TextSize = 13,
			TextColor3 = c.SUBTEXT,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			RichText = true,
			Text = "",
		})

		local TextLabel2 = make("TextLabel", {
			Parent = TextButton2,
			BackgroundColor3 = c.RED,
			BackgroundTransparency = 0.82,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -12, 0.5, 0),
			Size = UDim2.fromOffset(62, 24),
			Font = Enum.Font.GothamBold,
			TextSize = 12,
			Text = "Cancel",
			TextColor3 = c.RED,
		})

		make("UICorner", { CornerRadius = UDim.new(0, 7), Parent = TextLabel2 })

		track(TextButton2.MouseButton1Click:Connect(arg.safe(function()
			if arg.cancelRam then
				arg.cancelRam()
			end
		end)))

		return TextButton2, TextLabel
	end

	local tbl9 = {}

	for _, v8 in ipairs({ vehicle, arg.pages.players }) do
		if v8 then
			local v9, v10 = fn25(v8)
			tbl9[#tbl9 + 1] = { b = v9, l = v10 }
		end
	end

	local function fn26(arg2)
		return "<font color=\"#ffffff\"><b>" .. (arg2.DisplayName or arg2.Name) .. "</b></font>"
	end

	local v8 = nil

	arg.spawnS(function()
		while state.running do
			local text

			if flag8 and v7 then
				text = "Ramming  " .. fn26(v7)
			elseif flag4 and v6 then
				text = "Ramming  " .. fn26(v6)
			else
				text = nil

				if flag4 then
					text = "<font color=\"#ffffff\"><b>Auto Ram</b></font>  on"
				end
			end

			if text ~= v8 then
				v8 = text
				local v9 = ipairs
				local ramWatchers = arg.ramWatchers or {}

				for _, ramWatcher in v9(ramWatchers) do
					pcall(ramWatcher, text)
				end

				for _, v10 in ipairs(tbl9) do
					if text then
						v10.l.Text = text
					end

					v10.b.Visible = text ~= nil
				end
			end

			task.wait(0.3)
		end
	end)

	local tbl10 = {}

	local function fn27(arg2, arg3, arg4, arg5, arg6)
		if not notify then
			return
		end
		local now = os.clock()
		local v9 = tbl10[arg2]
		local flag12

		if v9 then
			flag12 = now - tbl10[arg2] < (arg5 or 6)
		else
			flag12 = v9
		end

		if flag12 then
			return
		end
		tbl10[arg2] = now
		arg4 = arg4 or "info"

		if not arg6 then
			arg6 = (arg5 or 6) >= 10 and 5 or nil
		end

		notify(arg3, arg4, arg6)
	end

	local function fn28(arg2)
		tbl10[arg2] = nil
	end

	local v9 = nil
	local n9 = 0

	local function fn29()
		local getCurrentVehicle = arg.getCurrentVehicle and arg.getCurrentVehicle() or state.activeVehicle
		local chassis = getCurrentVehicle and getCurrentVehicle:FindFirstChild("_Chassis")

		if chassis and chassis:IsA("BasePart") then
			local now = os.clock()
			v9 = getCurrentVehicle
			n9 = now
			return getCurrentVehicle, chassis
		end

		if v9 and v9.Parent and os.clock() - n9 < 4 then
			local chassis2 = v9:FindFirstChild("_Chassis")
			if chassis2 and chassis2:IsA("BasePart") then
				return v9, chassis2
			end
		end

		v9 = nil

		if arg.vehicleOfPlayer then
			local v10 = arg.vehicleOfPlayer(localPlayer)
			local chassis2 = v10 and v10.Parent and v10:FindFirstChild("_Chassis")
			if chassis2 and chassis2:IsA("BasePart") then
				return v10, chassis2
			end
		end
	end

	local function fn30()
		local vehicleOfPlayer = arg.vehicleOfPlayer and arg.vehicleOfPlayer(localPlayer)
		local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")

		if vehicleOfPlayer and vehicleOfPlayer.Parent and humanoidRootPart then
			local chassis = vehicleOfPlayer:FindFirstChild("_Chassis")
			if chassis then
				return ("Auto Ram: your %s is %d studs away, get in it or turn Instant on to use it from here"):format(vehicleOfPlayer.Name, math.floor((chassis.Position - humanoidRootPart.Position).Magnitude))
			end
		end

		if vehicleOfPlayer then
			return "Auto Ram: your car isn't loaded in, drive closer to it"
		end
		return "Auto Ram: get in a car"
	end

	local function fn31(arg2)
		arg2 = arg2 and arg2.Character
		local humanoid = arg2 and arg2:FindFirstChildOfClass("Humanoid")
		if not (humanoid and humanoid.Health > 0) then
			return nil
		end
		local humanoidRootPart = arg2:FindFirstChild("HumanoidRootPart")
		if humanoid.SeatPart or humanoid.Sit then
			return nil
		end
		return humanoidRootPart
	end

	local function fn32(arg2)
		if not arg2 or arg2 == localPlayer then
			return nil
		end
		local character = arg2.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if humanoid then
			humanoid = humanoid.Health <= 0 or humanoid.SeatPart or humanoid.Sit
		end

		if humanoid then
			return nil
		end
		local v10, v11 = arg.positionOf(arg2)
		if not v10 then
			return nil
		end
		return v10, v11 and character and character:FindFirstChild("HumanoidRootPart") or nil
	end

	local n10 = 0

	local function fn33(arg2)
		if typeof(arg2) ~= "Vector3" or os.clock() - n10 < 1 then
			return
		end
		n10 = os.clock()

		arg.spawnS(function()
			pcall(function()
				localPlayer:RequestStreamAroundAsync(arg2)
			end)
		end)
	end

	local function fn34(arg2, arg3, arg4, arg5)
		if not arg3 then
			return arg2
		end
		local assemblyLinearVelocity = arg3.AssemblyLinearVelocity
		local vector = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)
		if vector.Magnitude < 2 then
			return arg2
		end
		return arg2 + vector * math.clamp((arg2 - arg4).Magnitude / math.max(arg5 or 44.857142857142861, 10), 0, 1.2)
	end

	local function fn35(arg2, arg3, arg4, arg5)
		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude
		local filterDescendantsInstances = { localPlayer.Character, arg2 }
		local characters = workspace:FindFirstChild("Characters")

		if characters then
			filterDescendantsInstances[#filterDescendantsInstances + 1] = characters
		end

		local gameplay = workspace:FindFirstChild("Gameplay")
		gameplay = gameplay and gameplay:FindFirstChild("Vehicles")

		if gameplay then
			filterDescendantsInstances[#filterDescendantsInstances + 1] = gameplay
		end

		raycastParams.FilterDescendantsInstances = filterDescendantsInstances
		local v10 = math.atan2(arg4.X, arg4.Z)

		for _, v11 in ipairs({ 0, 30, -30, 60, -60, 90, -90, 120, -120, 150, -150, 180 }) do
			local n11 = v10 + math.rad(v11)
			local cos = math.cos
			local vector = Vector3.new(math.sin(n11), 0, cos(n11))
			local n12 = arg3 - vector * arg5
			local hit = workspace:Raycast(n12 + Vector3.new(0, 80, 0), Vector3.new(0, -300, 0), raycastParams)

			if hit and hit.Material ~= Enum.Material.Water and math.abs(hit.Position.Y - arg3.Y) < 12 then
				local n13 = hit.Position + Vector3.new(0, 3, 0)
				local n14 = arg3 + Vector3.new(0, 3, 0) - n13
				local n15 = Vector3.new(vector.Z, 0, -vector.X) * 3

				if not workspace:Raycast(n13, n14, raycastParams) and not workspace:Raycast(n13 + n15, n14, raycastParams) and not workspace:Raycast(n13 - n15, n14, raycastParams) then
					local y = hit.Position.Y
					local n16 = math.max(1, math.floor(arg5 / 3))
					local flag12 = true

					for i = 1, n16 do
						local hit2 = workspace:Raycast(n12 + vector * i * arg5 / n16 + Vector3.new(0, 6, 0), Vector3.new(0, -20, 0), raycastParams)

						if not hit2 then
							flag12 = false
							break
						elseif hit2.Position.Y - y > 1.2 then
							flag12 = false
							break
						else
							y = hit2.Position.Y
						end
					end

					if flag12 then
						return hit.Position, vector
					end
				end
			end
		end

		return nil
	end

	local function fn36(arg2, arg3, arg4, arg5, arg6)
		local chassis = arg2:FindFirstChild("_Chassis")
		if not chassis then
			return false
		end
		arg4 = arg4 or 120

		local function fn37(arg7)
			return arg7 - arg7.Position
		end

		local v10 = fn37(arg2:GetPivot())

		local function fn38(arg7, arg8)
			local position = arg2:GetPivot().Position
			local n11 = arg7 - position
			local magnitude = n11.Magnitude
			if magnitude < 0.5 then
				return 0
			end
			local n12 = math.min(magnitude, arg4 / 60)

			pcall(function()
				local v11 = arg2
				local pivotTo = v11.PivotTo
				local cframe = CFrame.new(position + n11.Unit * n12)
				local v12 = arg8
				local v13

				if arg8 then
					v13 = v12
				else
					v13 = v10
				end

				pivotTo(v11, cframe * v13)
				chassis.AssemblyLinearVelocity = n11.Unit * arg4
				chassis.AssemblyAngularVelocity = Vector3.zero
			end)

			return magnitude
		end

		local function fn39(arg7, arg8, arg9)
			local now = os.clock()

			while os.clock() - now < (arg9 or 10) do
				if arg5 and not arg5() then
					return false
				end

				if not (arg2.Parent and chassis.Parent) then
					return false
				end
				local n11 = arg4 / 60
				if fn38(arg7, arg8) <= n11 then
					return true
				end
				task.wait()
			end

			return true
		end

		local pivot = arg2:GetPivot()
		fn39(Vector3.new(pivot.Position.X, pivot.Position.Y - 55, pivot.Position.Z), v10, 3)

		if arg6 then
			local now = os.clock()
			local exitTo = nil

			while true do
				if not (os.clock() - now < 14) then
					exitTo = 1
					break
				else
					if arg5 and not arg5() then
						exitTo = 1
						break
					elseif arg2.Parent and chassis.Parent then
						local v11 = arg6()

						if typeof(v11) ~= "Vector3" then
							exitTo = 1
							break
						elseif fn38(Vector3.new(v11.X, v11.Y - 55, v11.Z), v10) <= 6 then
							exitTo = 1
							break
						else
							task.wait()
							continue
						end
					end

					break
				end
			end

			if exitTo == 1 then
				local position = arg6() or pivot.Position
				fn33(position)
				local position2 = arg2:GetPivot().Position
				local vector = Vector3.new(position.X - position2.X, 0, position.Z - position2.Z)
				local unit = vector.Magnitude > 1 and vector.Unit or Vector3.new(0, 0, 1)
				local n11 = Vector3.new(position.X, position.Y + 4, position.Z) - unit * 10
				local cframe = CFrame.lookAt(n11, Vector3.new(position.X, n11.Y, position.Z))
				fn39(n11, fn37(cframe), 3)

				return (pcall(function()
					arg2:PivotTo(cframe)
					chassis.AssemblyLinearVelocity = Vector3.zero
					chassis.AssemblyAngularVelocity = Vector3.zero
				end))
			end

			return false
		end

		local z = arg3.Position.Z
		local vector = Vector3.new(arg3.Position.X, math.min(pivot.Position.Y, arg3.Position.Y) - 55, z)
		local v11 = fn37(arg3)
		fn39(vector, v11)
		fn39(arg3.Position, fn37(arg3), 3)

		return (pcall(function()
			arg2:PivotTo(arg3)
			chassis.AssemblyLinearVelocity = Vector3.zero
			chassis.AssemblyAngularVelocity = Vector3.zero
		end))
	end

	local function fn37(arg2, arg3, arg4, arg5)
		local chassis = arg2:FindFirstChild("_Chassis")
		if not chassis then
			return false
		end
		local vector = Vector3.new(arg3.X - chassis.Position.X, 0, arg3.Z - chassis.Position.Z)
		local unit = vector.Magnitude > 1 and vector.Unit or chassis.CFrame.LookVector
		local vector2 = fn35(arg2, arg3, unit, arg4 or 22)

		if not vector2 then
			vector2 = Vector3.new(arg3.X - unit.X * (arg4 or 22), arg3.Y + 1, arg3.Z - unit.Z * (arg4 or 22))
			fn13("pivot: no clear landing (not loaded?), landing raw")
		end

		local cframe = CFrame.lookAt(vector2 + Vector3.new(0, 4, 0), Vector3.new(arg3.X, vector2.Y + 4, arg3.Z))
		if arg5 then
			return fn36(arg2, cframe, 120)
		end

		return (pcall(function()
			chassis.AssemblyLinearVelocity = Vector3.zero
			chassis.AssemblyAngularVelocity = Vector3.zero
			arg2:PivotTo(cframe)
		end))
	end

	local function fn38(arg2)
		local v10, v11 = fn32(arg2)
		if v10 then
			return v10, v11, false
		end
		local character = arg2 and arg2.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		if not (humanoid and humanoid.Health > 0 and (humanoid.SeatPart or humanoid.Sit)) then
			return nil
		end
		local vehicleOfPlayer = arg.vehicleOfPlayer and arg.vehicleOfPlayer(arg2)
		vehicleOfPlayer = vehicleOfPlayer and vehicleOfPlayer:FindFirstChild("_Chassis")
		if vehicleOfPlayer then
			return vehicleOfPlayer.Position, vehicleOfPlayer, true
		end
		local positionOf = arg.positionOf and arg.positionOf(arg2)
		if positionOf then
			return positionOf, character and character:FindFirstChild("HumanoidRootPart"), true
		end
		return nil
	end

	local function fn39(arg2, arg3)
		local v10 = tbl4[arg2]
		local flag12 = not arg3 and v10

		if flag12 then
			flag12 = os.clock() - v10 < ((tbl5[arg2] or 0) >= 3 and 45 or 12)
		end

		if flag12 then
			return true
		end
		local v11 = tbl3[arg2]
		if not v11 then
			return false
		end

		if str == "once" then
			return true
		end
		return os.clock() - v11 < n6
	end

	local function fn40(arg2)
		if str2 == "cops" then
			return arg.isPolice(arg2)
		end

		if str2 == "wanted" then
			return arg.wantedOf(arg2) > 0
		end
		return true
	end

	local function fn41()
		return flag5 and n5 or math.min(n5, 600)
	end

	local function fn42(arg2, arg3)
		if flag4 and v6 and not arg3 and (v6.Parent == nil or not players:FindFirstChild(v6.Name)) then
			return nil, "left"
		end
		local parent = flag4 and v6 and v6.Parent and v6
		local getSelectedTarget

		if parent then
			getSelectedTarget = parent
		else
			getSelectedTarget = arg.getSelectedTarget and arg.getSelectedTarget()
		end

		if getSelectedTarget and getSelectedTarget ~= localPlayer and not fn39(getSelectedTarget, true) and fn40(getSelectedTarget) then
			local v10 = fn38(getSelectedTarget)
			local flag12

			if v10 then
				local v11 = flag5

				if flag5 then
					flag12 = v11
				else
					flag12 = (v10 - arg2).Magnitude <= fn41()
				end
			else
				flag12 = v10
			end

			if flag12 then
				return getSelectedTarget
			end
			fn13(("pick: %s locked but %s"):format(getSelectedTarget.Name, v10 and "out of range" or "no position (dead? not loaded?)"))
			if flag4 and v6 == getSelectedTarget and not arg3 then
				return nil, v10 and "outofrange" or "nopos"
			end
		end

		if str2 == "target" and not arg3 and getSelectedTarget and fn39(getSelectedTarget, true) then
			fn13("pick: target filter, done")
			return nil, "done"
		end
		local v10 = nil
		local v11 = nil

		for _, player in ipairs(players:GetPlayers()) do
			if player ~= localPlayer and not fn39(player) and fn40(player) then
				local v12 = fn38(player)

				if v12 then
					local magnitude = (v12 - arg2).Magnitude

					if (flag5 or magnitude <= fn41()) and (not v10 or magnitude < v10) then
						v10 = magnitude
						v11 = player
					end
				end
			end
		end

		local v12 = fn13
		local str3

		if v11 then
			str3 = "pick: " .. v11.Name .. " at " .. math.floor(v10 or 0)
		else
			str3 = v11
		end

		v12(str3 or "pick: nobody (filter=" .. str2 .. ", reach=" .. fn41() .. ")")
		return v11
	end

	local function fn43(arg2, arg3, arg4)
		local n11 = arg4.Position - arg3.Position
		local vector = Vector3.new(n11.X, 0, n11.Z)
		if vector.Magnitude < 1 then
			return false
		end
		local v10 = fn34(arg4.Position, arg4, arg3.Position, n4 + 20)
		local v11 = fn35(arg2, v10, vector.Unit, 22)
		if not v11 then
			return false
		end

		return (pcall(function()
			arg2:PivotTo(CFrame.lookAt(v11 + Vector3.new(0, 4, 0), Vector3.new(v10.X, v11.Y + 4, v10.Z)))
		end))
	end

	local currentSpeed = n4 * 2.2
	local fn44 = nil

	local function fn45(arg2, arg3, arg4, arg5)
		local flag12 = not (arg.stillIn and arg.stillIn(arg2))
		local cFrame = nil

		if flag12 then
			local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
			cFrame = humanoidRootPart and humanoidRootPart.CFrame or nil
		end

		local tbl11 = { fn44(arg2, arg3, arg4, arg5, flag12) }

		if cFrame and arg.charPivotQuiet then
			arg.charPivotQuiet(cFrame)
		end

		return table.unpack(tbl11)
	end

	fn44 = function(arg2, arg3, arg4, arg5, arg6)
		arg5 = arg5 or 3
		local str3 = nil
		local flag12

		for i = 1, arg5 do
			local v10, v11, v12 = fn38(arg4)
			if not (v10 and v11) then
				return false
			end
			local v13 = fn34(v10, v11, arg3.Position, currentSpeed)
			if not fn37(arg2, v13, 24) then
				return false
			end
			task.wait(0.06)
			local raycastParams = RaycastParams.new()
			raycastParams.FilterType = Enum.RaycastFilterType.Exclude
			raycastParams.FilterDescendantsInstances = { arg2, localPlayer.Character }
			local now = os.clock()

			while os.clock() - now < 1.5 and not workspace:Raycast(arg3.Position, Vector3.new(0, -12, 0), raycastParams) do
				task.wait(0.1)
			end

			if os.clock() - now > 0.15 then
				local v14, v15 = fn38(arg4)

				if v14 then
					fn37(arg2, fn34(v14, v15, arg3.Position, currentSpeed), 24)
					task.wait(0.05)
				end
			end

			local v14, v15 = fn38(arg4)
			local v16 = v14 and fn34(v14, v15, arg3.Position, currentSpeed) or v13

			if Vector3.new(v16.X - v13.X, 0, v16.Z - v13.Z).Magnitude > 6 then
				fn37(arg2, v16, 22)
				task.wait(0.04)
			end

			local lookVector = arg3.CFrame.LookVector
			local vector = Vector3.new(lookVector.X, 0, lookVector.Z)
			local unit = vector.Magnitude > 0.1 and vector.Unit or (v16 - arg3.Position).Unit
			local flag13 = not arg6

			if flag13 and state.controllerActive and arg.attach and state.activeVehicle ~= arg2 then
				pcall(arg.attach, arg2)
			end

			if state.activeVehicle == arg2 and state.boost and state.boost.Parent then
				state.currentSpeed = currentSpeed
			end

			local character = arg4.Character
			character = character and character:FindFirstChildOfClass("Humanoid")
			character = character and character.Health or nil
			local assemblyLinearVelocity = v12 and v11 and v11.AssemblyLinearVelocity or Vector3.zero

			if flag13 then
				fn14("W", true)
			end

			pcall(function()
				for _, descendant in ipairs(arg2:GetDescendants()) do
					if descendant:IsA("BasePart") then
						descendant.AssemblyLinearVelocity = unit * currentSpeed
					end
				end
			end)

			local now2 = os.clock()
			local flag14

			if arg6 then
				flag14 = arg6
			else
				flag14 = not (state.activeVehicle == arg2 and state.boost and state.boost.Parent)
			end

			local flag15 = false
			local huge = math.huge
			local flag16 = false

			while true do
				flag12 = false

				if os.clock() - now2 < 1.1 then
					if not (flag4 or flag8) then
						fn14("W", false)
						return false
					end
					local v17, v18 = fn38(arg4)

					if v17 then
						local v19 = fn34(v17, v18, arg3.Position, currentSpeed)
						local vector2 = Vector3.new(v19.X - arg3.Position.X, 0, v19.Z - arg3.Position.Z)

						if vector2.Magnitude > 3 then
							local unit2 = vector2.Unit
							local v20 = math.asin(math.clamp(unit:Cross(unit2).Y, -1, 1))

							if math.abs(v20) > 0.35 then
								unit2 = CFrame.Angles(0, (v20 > 0 and 1 or -1) * 0.35, 0) * unit
							end

							unit = unit2

							if not flag14 and state.activeVehicle == arg2 then
								state.autoYaw = math.clamp(v20 * 3, -1.3, 1.3)
							end
						end
					end

					if os.clock() - now2 < 0.9 then
						if flag14 then
							pcall(function()
								arg3.AssemblyLinearVelocity = Vector3.new(unit.X * currentSpeed, arg3.AssemblyLinearVelocity.Y, unit.Z * currentSpeed)
							end)

							if arg6 then
							end
						else
							state.currentSpeed = currentSpeed
						end
					end

					if not flag15 and os.clock() - now2 > 0.25 then
						flag15 = arg3.AssemblyLinearVelocity.Magnitude > 8

						if not flag15 then
							fn13("fling: car didn't move, re-placing")
							flag12 = true
							break
						end
					end

					local character2 = arg4.Character
					local humanoid = character2 and character2:FindFirstChildOfClass("Humanoid")
					character2 = character2 and character2:FindFirstChild("HumanoidRootPart")
					local position = v12 and v11 and v11.Parent and v11.Position or character2 and character2.Position
					position = position and (position - arg3.Position).Magnitude or math.huge

					if position < huge then
						huge = position
					end

					local flag17 = false

					if flag6 then
						flag17 = not flag16
					end

					if flag17 and position < 9 then
						local autoYaw = state.autoYaw
						state.autoYaw = nil
						state.currentSpeed = currentSpeed * 3

						pcall(function()
							arg3.AssemblyLinearVelocity = Vector3.new(unit.X * currentSpeed * 3, 8, unit.Z * currentSpeed * 3)
							arg3.AssemblyAngularVelocity = Vector3.new(0, 1500, 0)
						end)

						fn13("fling: impact spike")
						task.wait(0.2)

						pcall(function()
							arg3.AssemblyAngularVelocity = Vector3.zero
							arg3.AssemblyLinearVelocity = Vector3.new(unit.X * currentSpeed, 0, unit.Z * currentSpeed)
						end)

						state.currentSpeed = currentSpeed
						state.autoYaw = autoYaw
						flag16 = true
					end

					if math.floor((os.clock() - now2) * 10) % 2 == 0 then
						fn13(("  t=%.1f spd=%.0f d=%.0f ctl=%s boost=%s cur=%.0f W=%s"):format(os.clock() - now2, arg3.AssemblyLinearVelocity.Magnitude, position, tostring(state.activeVehicle == arg2), tostring(state.boost and state.boost.Enabled), state.currentSpeed or -1, tostring(state.wHeld)))
					end

					local flag18 = huge < 14

					if v12 and v11 and v11.Parent then
						flag18 = flag18 and ((v11.AssemblyLinearVelocity - assemblyLinearVelocity).Magnitude > 12 or (v11.Position - arg3.Position).Magnitude < 18 and os.clock() - now2 > 0.3 and arg3.AssemblyLinearVelocity.Magnitude < currentSpeed * 0.5)
						if flag18 then
							fn14("W", false)
							return true
						end
					elseif humanoid and flag18 then
						local state2 = humanoid:GetState()
						if state2 == Enum.HumanoidStateType.Ragdoll or state2 == Enum.HumanoidStateType.Physics or state2 == Enum.HumanoidStateType.FallingDown or state2 == Enum.HumanoidStateType.PlatformStanding or humanoid.PlatformStand or humanoid.Health <= 0 or character and humanoid.Health < character - 2 or character2 and not humanoid.Sit and not humanoid.SeatPart and character2.AssemblyLinearVelocity.Y > 10 then
							fn14("W", false)
							return true
						end
					end

					task.wait(0.05)
				else
					break
				end
			end

			fn14("W", false)

			if flag12 then
				str3 = "stuck"
			else
				str3 = nil
			end

			task.wait(0.15)
		end

		return false, str3
	end

	local function fn46(arg2, arg3)
		local v10, v11 = fn29()
		if not v11 then
			return false
		end

		if arg.IS_MOBILE and not state.controllerActive then
			local speedController = arg.configReg and arg.configReg.speedController

			if speedController and speedController.set then
				pcall(speedController.set, true)
				flag10 = true
				fn13("phone: Speed Controller borrowed")
			end
		end

		if not (arg.stillIn and arg.stillIn(v10)) then
			fn27("getincar", "Get in your car to ram", "warn", 8)
			fn16()
			return false, "notincar"
		end

		local v12 = fn38(arg2)
		if not v12 then
			return false
		end

		if crashGuard == nil then
			crashGuard = state.crashGuard
		end

		state.crashGuard = false
		local flag12 = state.controllerActive and state.activeVehicle == v10

		if flag12 then
			state.autoCap = currentSpeed + 5
		end

		local v13 = tostring
		fn13(("run: %s dist=%d instant=%s ctl=%s"):format(arg2.Name, math.floor((v12 - v11.Position).Magnitude), tostring(flag5), v13(flag12)))
		local v14 = n7
		local stillIn = arg.stillIn and arg.stillIn(v10)

		if not stillIn then
			local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
			local magnitude = humanoidRootPart and (v12 - humanoidRootPart.Position).Magnitude or 1e9

			if magnitude > 45 then
				fn13(("run: out of car, target %.0f away -> too far to push while standing still"):format(magnitude))
				fn27("farout", ("%s is %d studs away. From outside the car Ram only reaches ~45 studs (the car isn't yours to push further off). Get in to ram from anywhere."):format(arg2.DisplayName, math.floor(magnitude)), "warn", 20, 6)
				fn16()
				return false, "farout"
			end
		end

		if flag5 or not stillIn then
			local pivot = v10:GetPivot()
			fn33(v12)
			fn37(v10, v12, 22)
			local now = os.clock()
			local v15, v16

			while true do
				task.wait(0.15)
				v15, v16 = fn38(arg2)

				if v15 and not v16 then
					fn33(v15)
				end

				if not (v16 or not v15 or os.clock() - now > 4) then
					continue
				end
				break
			end

			if not v16 then
				fn13("fling: target never streamed in (" .. tostring(v15 ~= nil) .. ")")
			end

			local v17 = nil
			local flag13 = false

			if v14 == n7 then
				flag13, v17 = fn45(v10, v11, arg2, 2)
			end

			local v18 = fn13
			local fling = flag13 and "HIT"

			if not fling then
				fling = "miss" .. (v17 and " " .. v17 or "")
			end

			v18("fling: " .. fling)
			fn15()

			if flag13 then
				tbl3[arg2] = os.clock()
				tbl4[arg2] = nil
				tbl5[arg2] = 0
				fn27("hit_" .. arg2.Name, "Got " .. arg2.DisplayName, "ok", 0)
			else
				tbl4[arg2] = os.clock()
				tbl5[arg2] = (tbl5[arg2] or 0) + 1

				if v17 == "stuck" then
					fn27("stuck", "Missed " .. arg2.DisplayName .. ", the car couldn't get moving there", "warn", 10)
				else
					fn27("miss_" .. arg2.Name, "Missed " .. arg2.DisplayName, "warn", 6)
				end
			end

			task.wait(0.25)
			state.currentSpeed = 0

			pcall(function()
				v11.AssemblyLinearVelocity = Vector3.zero
				v11.AssemblyAngularVelocity = Vector3.zero
				v10:PivotTo(pivot)
			end)

			fn16()
			return flag13
		end

		local v15, v16 = fn32(arg2)

		if not v15 then
			tbl3[arg2] = os.clock()
			fn16()
			return false, "notloaded"
		end

		if not v16 then
			fn33(v15)
		end

		local v17 = n7
		local now = os.clock()
		local now2 = os.clock()
		local n11 = math.clamp(math.max(arg3 or 12, (v15 - v11.Position).Magnitude / 35 + 6), 12, 25)
		local now3 = os.clock()
		local now4 = os.clock()
		local n12 = select(1, arg.healthOf(arg2)) or 0
		local flag13 = false
		local huge = math.huge
		local v18 = nil
		local n13 = 0
		local n14 = 0
		local n15 = 0
		local n16 = 0

		while os.clock() - now < (n11 or 12) do
			if not (flag4 or flag8) then
				fn15()
				fn16()
				return false, "off"
			end

			if v17 ~= n7 then
				fn15()
				fn16()
				return false, "settings"
			end

			local v19, v20 = fn29()

			if not v20 then
				fn15()
				fn16()
				return false, "nocar"
			end

			local character = arg2.Character
			character = character and character:FindFirstChildOfClass("Humanoid")

			if character then
				local flag14 = character.Health <= 0

				if flag14 then
					character = flag14
				else
					character = n12 > 0 and character.Health < n12 - 5
				end
			end

			if character then
				tbl3[arg2] = os.clock()
				fn15()
				fn27("hit_" .. arg2.Name, "Got " .. arg2.DisplayName, "ok", 0)
				return true
			end

			local v21, v22 = fn32(arg2)
			if not v21 then
				break
			end

			if v22 and not fn31(arg2) then
				break
			end

			if not v22 and os.clock() - now2 > 1.5 then
				now2 = os.clock()
				fn33(v21)
			end

			local position = v20.Position
			local v23 = fn34(v21, v22, position, n4 + 20)
			local vector = Vector3.new(v23.X - position.X, 0, v23.Z - position.Z)
			local lookVector = v20.CFrame.LookVector
			local vector2 = Vector3.new(lookVector.X, 0, lookVector.Z)
			if vector.Magnitude < 0.5 or vector2.Magnitude < 0.01 then
				break
			end
			local magnitude = vector.Magnitude
			local unit = vector.Unit
			local unit2 = vector2.Unit
			local y = unit2:Cross(unit).Y
			local v24 = unit2:Dot(unit)
			local magnitude2 = v20.AssemblyLinearVelocity.Magnitude
			local flag14 = false

			if flag6 then
				flag14 = not flag13
			end

			if flag14 and (v21 - v20.Position).Magnitude < 9 and magnitude2 > 15 then
				local autoYaw = state.autoYaw
				local currentSpeed2 = state.currentSpeed
				state.autoYaw = nil
				state.currentSpeed = currentSpeed * 3

				pcall(function()
					v20.AssemblyLinearVelocity = Vector3.new(unit2.X * currentSpeed * 3, 8, unit2.Z * currentSpeed * 3)
					v20.AssemblyAngularVelocity = Vector3.new(0, 1500, 0)
				end)

				fn13("drive: impact spike")
				task.wait(0.2)

				pcall(function()
					v20.AssemblyAngularVelocity = Vector3.zero
					v20.AssemblyLinearVelocity = Vector3.new(unit2.X * magnitude2, 0, unit2.Z * magnitude2)
				end)

				state.currentSpeed = currentSpeed2 or magnitude2
				state.autoYaw = autoYaw
				flag13 = true
			end

			if flag5 and v22 and magnitude > 45 and os.clock() - now4 > 2.5 then
				if fn43(v19, v20, v22) then
					now4 = os.clock()
					now3 = os.clock()
					fn15()
					task.wait(0.3)
					huge = math.huge
					continue
				end
			end

			if magnitude2 < 4 and tbl2.W then
				local now5 = v18 or os.clock()

				if os.clock() - now5 > 1.1 and os.clock() > n13 then
					n13 = os.clock() + 1
					n14 += 1
					fn13("wedged #" .. n14)

					if n14 >= 2 then
						fn14("W", false)
						fn14("S", true)
						task.wait(0.6)
						fn15()
						fn16()
						return false, "wedged"
					end

					v18 = now5
				else
					v18 = now5
				end
			else
				v18 = nil
			end

			if os.clock() < n13 then
				fn14("W", false)
				fn14("S", true)
				fn14("A", y <= 0)
				fn14("D", y > 0)
				task.wait(0.1)
				continue
			end

			fn14("S", false)

			if state.controllerActive and state.activeVehicle == v19 then
				fn14("A", false)
				fn14("D", false)
				state.autoYaw = math.clamp(math.atan2(y, v24) * 2.2, -1.3, 1.3)
			else
				state.autoYaw = nil
				local n17 = math.abs(y)

				if n17 > 0.08 then
					n15 += math.clamp(n17 / 0.45, 0.25, 1)
					local flag15

					if n15 >= 1 then
						n15 -= 1
						flag15 = true
					else
						flag15 = false
					end

					fn14("A", flag15 and y > 0)
					local v25 = fn14
					flag15 = flag15 and y <= 0
					v25("D", flag15)
				else
					fn14("A", false)
					fn14("D", false)
					n15 = 0
				end
			end

			fn14("W", (v24 > -0.1 or magnitude2 < 10) and magnitude2 < (v24 < 0.3 and n4 + 8 or n4 + 30))

			if magnitude < huge - 3 then
				now3 = os.clock()
				huge = magnitude
			elseif os.clock() - now3 > 5 then
				fn13("gave up: no closer for 5s at " .. math.floor(magnitude))
				break
			end

			local humanoid = v22 and v22.Parent and v22.Parent:FindFirstChildOfClass("Humanoid")

			if v22 and magnitude < 16 and magnitude2 > n4 * 0.85 then
				n16 = os.clock() + 1.2
			end

			local flag15

			if humanoid then
				flag15 = os.clock() < (n16 or 0)
			else
				flag15 = humanoid
			end

			if flag15 then
				local state2 = humanoid:GetState()
				local health = humanoid.Health

				if state2 == Enum.HumanoidStateType.Physics or state2 == Enum.HumanoidStateType.FallingDown or health <= 0 or n12 > 0 and health < n12 - 5 then
					tbl3[arg2] = os.clock()
					fn15()
					fn27("hit_" .. arg2.Name, "Got " .. arg2.DisplayName, "ok", 0)
					return true
				end
			end

			task.wait(0.1)
		end

		fn15()
		fn13("run over: no hit (" .. math.floor(os.clock() - now) .. "s)")
		return false
	end

	arg.spawnS(function()
		while state.running do
			if flag4 and not flag8 then
				local ok, result = pcall(function()
					local v10, v11 = fn29()

					if not v11 then
						fn27("nocar", fn30(), "warn", 10)
						fn17()
						return
					end

					fn28("nocar")
					local v12, v13 = fn42(v11.Position)

					if not v12 then
						local str3

						if v13 == "done" and str == "constant" then
							str3 = nil
						elseif v13 == "done" then
							str3 = "Auto Ram: already got them. Switch How often to Constant to keep going"
						elseif v13 == "nolock" then
							str3 = "Auto Ram: lock someone first (click their ESP dot)"
						else
							str3 = ("Auto Ram: nobody reachable (%s)%s"):format(str2, flag5 and "" or ", try turning Instant on")
						end

						if str3 == "left" then
							fn27("left", (v6 and v6.DisplayName or "They") .. " left the server, stopped ramming", "info", 10, 5)

							if arg.cancelRam then
								arg.cancelRam()
							else
								fn18(false)
							end

							return
						end

						if str3 == "outofrange" or str3 == "nopos" then
							fn27("hwait", (v6 and v6.DisplayName or "They") .. (str3 == "nopos" and " isn't loaded in, waiting" or " is out of range, waiting"), "info", 12, 4)
							fn17()
							task.wait(1)
							return
						end

						if str3 then
							fn27("notarget", str3, "info", 10)
						end

						fn17()
						return
					end

					fn28("notarget")

					if not fn24() then
						if arg.cancelRam then
							arg.cancelRam()
						else
							fn18(false)
						end

						return
					end

					local v14 = fn29()

					if not (v14 and arg.stillIn and arg.stillIn(v14)) then
						fn27("getincar", "Get in your car to ram", "warn", 8)
						fn17()
						task.wait(2)
						return
					end

					fn27("going_" .. v12.Name, "Going for " .. v12.DisplayName, "info", 8)
					local v15, v16 = fn46(v12, str2 == "target" and 14 or 9)
					local flag12 = not v15
					if flag12 and v16 == "farout" and flag4 then
						task.wait(4)
						return
					end

					if flag12 and flag4 then
						local str3

						if v16 == "notloaded" then
							str3 = v12.DisplayName .. " isn't loaded in, skipping for now"
						elseif v16 == "nocar" then
							str3 = "Lost the car mid run"
						elseif v16 == "settings" then
							str3 = nil
						elseif v16 == "wedged" then
							str3 = "Stuck against something, backing off " .. v12.DisplayName
						else
							str3 = "Lost " .. v12.DisplayName .. ", moving on"
						end

						if str3 then
							fn27("miss_" .. v12.Name, str3, "warn", 8)
						end
					end

					task.wait(str == "constant" and 0.2 or 0.5)
				end)

				if not ok then
					fn13("loop ERROR: " .. tostring(result))
					fn17()
				end
			else
				local flag12 = not flag8
				local w

				if flag12 then
					w = tbl2.W or tbl2.A or tbl2.D or tbl2.S or crashGuard ~= nil
				else
					w = flag12
				end

				if w then
					fn17()
				end
			end

			task.wait(0.15)
		end

		fn17()
	end)

	local flag12 = false

	local function fn47(arg2)
		pcall(function()
			local chassis = arg2:FindFirstChild("_Chassis")
			chassis = chassis and chassis:FindFirstChild("Horn")

			if not chassis then
				for _, descendant in ipairs(arg2:GetDescendants()) do
					if descendant:IsA("Sound") and descendant.Name == "Horn" then
						chassis = descendant
						break
					end
				end
			end

			if chassis then
				chassis:Play()
			end
		end)
	end

	local function fn48(arg2)
		pcall(function()
			local chassis = arg2:FindFirstChild("_Chassis")
			chassis = chassis and chassis:FindFirstChild("Horn")

			if not chassis then
				for _, descendant in ipairs(arg2:GetDescendants()) do
					if descendant:IsA("Sound") and descendant.Name == "Horn" then
						chassis = descendant
						break
					end
				end
			end

			if chassis and chassis.IsPlaying then
				chassis:Stop()
			end
		end)
	end

	local function fn49(arg2)
		for _, child in ipairs(arg2:GetChildren()) do
			if child:IsA("Seat") and child.Occupant then
				local playerFromCharacter = players:GetPlayerFromCharacter(child.Occupant.Parent)
				if playerFromCharacter and playerFromCharacter ~= localPlayer then
					return playerFromCharacter, child
				end
			end
		end
	end

	arg.cancelSendCar = nil

	arg.sendCarTo = function(arg2, arg3)
		if flag12 then
			return false, "already sending it"
		end

		if not arg2 then
			return false, "no player"
		end

		if arg.isFollowing and arg.isFollowing() and arg.stopFollow then
			pcall(arg.stopFollow)
		end

		if arg.autoDriveActive and arg.autoDriveActive() and arg.autoDriveStop then
			pcall(arg.autoDriveStop)
		end

		state.autoYaw = nil
		state.autoCap = nil
		local getCurrentVehicle = arg.getCurrentVehicle and arg.getCurrentVehicle() or state.activeVehicle
		local vehicleOfPlayer

		if getCurrentVehicle then
			vehicleOfPlayer = getCurrentVehicle
		else
			vehicleOfPlayer = arg.vehicleOfPlayer and arg.vehicleOfPlayer(localPlayer)
		end

		local chassis = vehicleOfPlayer and vehicleOfPlayer:FindFirstChild("_Chassis")
		if not (chassis and chassis:IsA("BasePart")) then
			return false, "You have no car in this server"
		end
		local v10 = fn38(arg2)
		if not v10 then
			return false, "can't find them right now"
		end
		flag12 = true

		arg.spawnS(function()
			local pivot = vehicleOfPlayer:GetPivot()
			fn33(v10)
			local flag13 = false

			arg.cancelSendCar = function()
				flag13 = true
			end

			local floatingAction = arg.floatingAction and arg.floatingAction("Bring car back", function()
				flag13 = true
			end)

			fn37(vehicleOfPlayer, fn38(arg2) or v10, 9)
			fn47(vehicleOfPlayer)

			if notify then
				notify("Car sent to " .. arg2.DisplayName .. ", waiting for them", "info")
			end

			local now = os.clock()
			local now2 = os.clock()
			local v11 = nil

			while true do
				if os.clock() - now < (arg3 or 90) and not flag13 then
					v11 = fn49(vehicleOfPlayer)

					if not v11 then
						if os.clock() - now2 > 5 and not flag13 then
							now2 = os.clock()
							fn47(vehicleOfPlayer)
						end

						task.wait(0.25)
						continue
					end
				end

				break
			end

			if floatingAction then
				pcall(function()
					floatingAction:Destroy()
				end)
			end

			arg.cancelSendCar = nil
			fn48(vehicleOfPlayer)

			pcall(function()
				local chassis2 = vehicleOfPlayer:FindFirstChild("_Chassis")

				if chassis2 then
					chassis2.AssemblyLinearVelocity = Vector3.zero
					chassis2.AssemblyAngularVelocity = Vector3.zero
				end

				vehicleOfPlayer:PivotTo(pivot)
			end)

			if notify then
				notify(v11 and "Brought " .. v11.DisplayName .. " back" or flag13 and "Car brought back" or "Nobody got in, car returned", v11 and "ok" or "warn")
			end

			flag12 = false
		end)

		return true
	end

	local flag13 = false
	local n11 = 30
	local v10 = nil
	local flag14 = false

	local function fn50(arg2)
		if not arg2 or arg2 == localPlayer then
			return nil
		end
		local character = arg2.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		if humanoid and humanoid.Health <= 0 then
			return nil
		end
		local v11, v12 = arg.positionOf(arg2)
		if not v11 then
			return nil
		end
		return v11, v12 and character and character:FindFirstChild("HumanoidRootPart") or nil
	end

	local function fn51()
		local getSelectedTarget = arg.getSelectedTarget and arg.getSelectedTarget()
		if getSelectedTarget and getSelectedTarget ~= localPlayer and fn50(getSelectedTarget) then
			return getSelectedTarget
		end
		return v10 and fn50(v10) and v10 or nil
	end

	local v11 = nil

	arg.followPlayer = function(arg2)
		v10 = arg2

		if arg.selectTarget then
			arg.selectTarget(arg2)
		end

		return true
	end

	arg.isFollowing = function(arg2)
		return flag13 and (arg2 == nil or v10 == arg2 or arg.getSelectedTarget and arg.getSelectedTarget() == arg2)
	end

	arg.stopFollow = function()
		if v11 then
			pcall(v11, false)
		else
			flag13 = false
		end

		flag14 = false
		fn15()
		state.autoYaw = nil

		if arg.driveHudUnpin then
			arg.driveHudUnpin()
		end

		if arg.walkStop then
			arg.walkStop()
		end

		if arg.autoDriveStop and arg.autoDriveOwner and arg.autoDriveOwner() == "follow" then
			arg.autoDriveStop()
		end
	end

	local v12 = nil
	local flag15 = false

	local function fn52()
		local v13 = v12
		local v14

		if v12 then
			v14 = v13
		else
			v14 = flag15
		end

		if v14 then
			return v12
		end
		flag15 = true

		pcall(function()
			v12 = arg.atLowIdentity(function()
				local algorithms = replicatedStorage.Modules.Algorithms
				return require(replicatedStorage.Modules.ModuleLoader).assign(algorithms)
			end)
		end)

		return v12
	end

	local function fn53(arg2)
		local v13, v14 = fn50(arg2)
		if not v13 then
			return nil
		end
		local n12 = v13

		pcall(function()
			local v15 = fn52()
			local getLocationInsideAtPos = v15 and v15.getLocationInsideAtPos and v15.getLocationInsideAtPos(v13)

			if getLocationInsideAtPos then
				local v16 = v15.getLocationOutsideCenter(getLocationInsideAtPos)

				if typeof(v16) == "Vector3" then
					n12 = v16
				end
			end
		end)

		if n12 == v13 then
			local raycastParams = RaycastParams.new()
			raycastParams.FilterType = Enum.RaycastFilterType.Exclude
			raycastParams.FilterDescendantsInstances = { localPlayer.Character, workspace:FindFirstChild("Characters") }
			local hit = workspace:Raycast(v13 + Vector3.new(0, 3, 0), Vector3.new(0, 300, 0), raycastParams)

			if hit then
				local hit2 = workspace:Raycast(hit.Position + Vector3.new(0, 200, 0), Vector3.new(0, -500, 0), raycastParams)

				if hit2 then
					n12 = hit2.Position + Vector3.new(0, 2, 0)
				end
			end
		end

		return n12, v13, v14
	end

	local flag16 = false

	local function fn54(arg2, arg3)
		local v13 = fn51()
		if not v13 then
			fn27("fnotarget", "Follow: pick someone first (click their ESP dot)", "info", 120)
			return false
		end
		local v14, v15, magnitude = fn53(v13)
		if not v14 then
			fn15()
			return false
		end

		if not magnitude then
			fn33(v15)
		end

		local n12 = math.abs(v14.Y - arg3.Position.Y)
		local magnitude2 = Vector3.new(v14.X - arg3.Position.X, 0, v14.Z - arg3.Position.Z).Magnitude
		local flag17 = n12 > 8 and magnitude2 < 80
		local n13 = flag14 and n11 * 2.2 or n11 * 1.25

		if flag17 then
			n13 = 0
		end

		if magnitude2 <= n13 then
			flag14 = true
			fn15()
			state.autoYaw = nil
			state.autoCap = nil
			local magnitude3 = arg3.AssemblyLinearVelocity.Magnitude
			magnitude = magnitude and magnitude.AssemblyLinearVelocity.Magnitude or 0

			if magnitude3 - magnitude > 14 and arg.driveBrake then
				arg.driveBrake()
			end

			if arg.driveHudPin then
				arg.driveHudPin("Following " .. v13.DisplayName, "In range")
			end

			return true
		end

		flag14 = false

		local function fn55()
			if not (flag13 and not flag4 and state.running) then
				return false
			end

			if fn51() ~= v13 then
				return false
			end
			return true
		end

		if not flag17 and magnitude2 <= 320 and arg.driveLineClear and arg.driveLineClear(arg3.Position, v14) then
			local v16, v17 = arg.autoDriveTo(v14, {
				reach = n11,
				park = false,
				maxT = 4,
				owner = "follow",
				chase = true,
				name = "Following " .. v13.DisplayName,
				alive = fn55,
			})

			return v16, v17
		end

		local now = os.clock()

		if magnitude then
			local assemblyLinearVelocity = magnitude.AssemblyLinearVelocity
			local vector = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)

			if vector.Magnitude > 8 and magnitude2 > 150 then
				v14 += vector * 3
			end
		end

		local v16, v17 = arg.autoDriveTo(v14, {
			reach = n11,
			park = false,
			maxT = 120,
			owner = "follow",
			chase = true,
			offroad = arg.driveOffroad ~= false,
			forceDirect = flag16 and magnitude2 <= 400,
			name = "Following " .. v13.DisplayName,
			alive = function()
				if not fn55() then
					return false
				end
				local v16 = fn53(v13)
				if not v16 then
					return false
				end
				local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
				local magnitude3 = humanoidRootPart and (v14 - humanoidRootPart.Position).Magnitude or 200
				local magnitude4 = (v16 - v14).Magnitude
				if arg.driveLineClear and humanoidRootPart and (v16 - humanoidRootPart.Position).Magnitude <= 320 and arg.driveLineClear(humanoidRootPart.Position, v16) then
					return false
				end

				if os.clock() - now < 12 then
					return true
				end
				return magnitude4 < math.max(200, magnitude3 * 0.6)
			end,
		})

		return v16, v17
	end

	local function fn55()
		local v13 = fn51()
		if not v13 then
			fn27("fnotarget", "Follow: pick someone first (click their ESP dot)", "info", 120)
			return false
		end
		local v14, v15 = fn50(v13)
		if not v14 then
			return false
		end

		if not v15 then
			fn33(v14)
		end

		local n12 = math.clamp(n11 * 0.4, 5, 14)
		fn27("fwalk:" .. v13.Name, "Following " .. v13.DisplayName .. " on foot", "ok", 3600)

		if arg.followOnFoot then
			return arg.followOnFoot(function()
				local v16, v17 = fn50(v13)

				if v16 and not v17 then
					fn33(v16)
				end

				return v16
			end, {
				gap = n12,
				name = "Following " .. v13.DisplayName,
				alive = function()
					if not (flag13 and not flag4 and state.running) then
						return false
					end

					if fn51() ~= v13 then
						return false
					end
					local v16 = fn29()
					if v16 and arg.stillIn and arg.stillIn(v16) then
						return false
					end
					return true
				end,
			})
		end

		return arg.walkTo(v14, n12, 40, function()
			if not (flag13 and not flag4 and state.running) then
				return false
			end

			if fn51() ~= v13 then
				return false
			end
			local v16 = fn50(v13)
			return v16 ~= nil and (v16 - nil).Magnitude < 12
		end)
	end

	arg.spawnS(function()
		local n12 = 0
		local now = nil
		local n13 = 0
		local n14 = 0

		while state.running do
			flag7 = flag13 and not flag4

			if flag7 then
				arg.driveHudPinned = true
			elseif arg.driveHudPinned and arg.driveHudUnpin then
				arg.driveHudUnpin()
			end

			if flag13 and flag4 and arg.autoDriveOwner and arg.autoDriveOwner() == "follow" and arg.autoDriveStop then
				arg.autoDriveStop()
			end

			local autoDriveTo = flag7 and arg.autoDriveTo

			if autoDriveTo then
				autoDriveTo = not (arg.autoDriveOwner and arg.autoDriveOwner() == "follow")
			end

			if autoDriveTo then
				local v13, v14 = fn29()
				local flag17 = not v14
				local flag18

				if flag17 then
					flag18 = flag17
				else
					flag18 = not (arg.stillIn and arg.stillIn(v13))
				end

				if flag18 then
					if arg.walkTo then
						pcall(fn55)
					else
						fn27("fnocar", "Follow: get in your car first", "warn", 120)
					end
				else
					local ok, result, result2 = pcall(fn54, v13, v14)

					if ok and result == false and type(result2) == "string" and (result2:find("road") or result2:find("cliff") or result2:find("blocked") or result2:find("off%-road")) then
						n14 += 1
						flag16 = n14 >= 2

						if n14 == 6 then
							fn27("fboxed", "Follow: can't find a way to them from here, trying", "warn", 12)
						end

						task.wait(0.6)
					else
						flag16 = false
						n14 = 0
					end
				end

				task.wait(0.3)
			elseif flag7 and not arg.autoDriveTo then
				pcall(function()
					local v13, v14 = fn29()

					if not v14 then
						fn27("fnocar", fn30(), "warn", 12)
						fn15()
						return
					end

					if not (arg.stillIn and arg.stillIn(v13)) then
						fn27("fnocar", "Follow: get in your car first", "warn", 12)
						fn15()
						state.autoYaw = nil
						return
					end

					local v15 = fn51()

					if not v15 then
						fn27("fnotarget", "Follow: pick someone first (click their ESP dot)", "info", 12)
						fn15()
						return
					end

					local v16, v17 = fn32(v15)
					if not v16 then
						fn15()
						return
					end

					if not v17 then
						fn33(v16)
					end

					local position = v14.Position
					local vector = Vector3.new(v16.X - position.X, 0, v16.Z - position.Z)
					local lookVector = v14.CFrame.LookVector
					local vector2 = Vector3.new(lookVector.X, 0, lookVector.Z)
					if vector.Magnitude < 0.5 or vector2.Magnitude < 0.01 then
						fn15()
						return
					end
					local magnitude = vector.Magnitude
					local unit = vector.Unit
					local unit2 = vector2.Unit
					local y = unit2:Cross(unit).Y
					local v18 = unit2:Dot(unit)
					local magnitude2 = v14.AssemblyLinearVelocity.Magnitude

					if magnitude2 < 4 and tbl2.W then
						now = now or os.clock()

						if os.clock() - now > 1.1 and os.clock() > n13 then
							n13 = os.clock() + 1
						end
					else
						now = nil
					end

					if os.clock() < n13 then
						fn14("W", false)
						fn14("S", true)
						fn14("A", y <= 0)
						fn14("D", y > 0)
						return
					end

					fn14("S", false)
					local v19 = math.atan2(y, v18)

					if state.controllerActive and state.activeVehicle == v13 then
						fn14("A", false)
						fn14("D", false)
						state.autoYaw = math.clamp(v19 * 2.2, -1.3, 1.3)
					else
						state.autoYaw = nil
						local n15 = math.abs(y)

						if n15 > 0.08 then
							n12 += math.clamp(n15 / 0.45, 0.25, 1)
							local flag17

							if n12 >= 1 then
								n12 -= 1
								flag17 = true
							else
								flag17 = false
							end

							fn14("A", flag17 and y > 0)
							fn14("D", flag17 and y <= 0)
						else
							n12 = 0
							fn14("A", false)
							fn14("D", false)
						end
					end

					fn14("W", magnitude > n11 * 1.25 and v18 > -0.1 and magnitude2 < (magnitude > n11 * 2.5 and n4 + 40 or n4 + 8))
				end)
			else
				local flag17 = not flag13

				if flag17 then
					flag17 = tbl2.W or tbl2.A or tbl2.D or tbl2.S
				end

				if flag17 and not flag4 then
					fn15()
					state.autoYaw = nil
				end
			end

			task.wait(flag7 and 0.05 or 0.1)
		end
	end)

	sectionLabel(vehicle, "Follow", 15)

	local function fn56(arg2)
		flag13 = arg2

		if not arg2 then
			fn15()
			state.autoYaw = nil

			if arg.autoDriveStop and arg.autoDriveOwner and arg.autoDriveOwner() == "follow" then
				arg.autoDriveStop()
			end
		end

		if arg2 and flag4 and notify then
			notify("Auto Ram is on, turn it off or Follow will sit idle", "warn")
		end
	end

	local function fn57(arg2)
		makeSlider(arg2, "Distance", 1, 10, 120, 30, function(arg3)
			n11 = arg3
		end, true, "followGap", "How far back to sit.")
	end

	v11 = makeGroup
	v11 = v11(vehicle, "footprints", "Follow Player", "Goes after whoever you have locked: drives if you're in a car, walks if you're not.", 16, false, fn56, "followPlayer", fn57)

	table.insert(arg.cleanups, function()
		flag13 = false
		fn15()
		state.autoYaw = nil
	end)

	sectionLabel(vehicle, "Ram", 11)

	makeToggleRow(vehicle, "zap", "Instant", "Ram teleports onto them at ramming speed, then teleports back. Off: it drives at them.", 12, true, function(arg2)
		flag5 = arg2
		fn12()
	end, "autoRamInstant")

	makeSlider(vehicle, "Repeat delay (s)", 13, 2, 30, 6, function(arg2)
		n6 = arg2
	end, true, "autoRamCooldown", "Keep Ramming: how long before it goes back for the same person.")

	makeSlider(vehicle, "Ram range", 14, 60, 4000, 2000, function(arg2)
		n5 = arg2
	end, true, "autoRamRange", "How far Auto Ram will drive to reach someone. With Instant on there is no limit.")

	fn18 = function(arg2)
		flag4 = arg2 and true or false

		if not arg2 then
			flag8 = false
			fn12()
			fn17()
			table.clear(tbl10)
		end

		if arg2 then
			table.clear(tbl3)
			table.clear(tbl4)
			table.clear(tbl5)
		end
	end

	arg.huntPlayer = function(arg2)
		if not arg2 then
			return false, "no player"
		end

		if flag8 then
			arg.cancelRam()
		end

		if arg.selectTarget then
			arg.selectTarget(arg2)
		end

		local v13 = v5
		local tbl11

		if v5 then
			tbl11 = v13
		else
			tbl11 = { filter = str2, mode = str }
		end

		v5 = tbl11
		v6 = arg2
		str2 = "target"
		str = "constant"
		table.clear(tbl3)
		fn12()
		local autoRamFilter = arg.configReg and arg.configReg.autoRamFilter

		if autoRamFilter and autoRamFilter.set then
			pcall(autoRamFilter.set, "target")
		end

		local autoRamMode = arg.configReg and arg.configReg.autoRamMode

		if autoRamMode and autoRamMode.set then
			pcall(autoRamMode.set, "constant")
		end

		if fn18 then
			flag11 = true
			pcall(fn18, true)
			flag11 = false
		end

		return true
	end

	arg.ramPlayer = function(arg2)
		if flag8 then
			return false, "already running"
		end
		local v13, v14 = fn29()
		if not v14 then
			return false, "get in a car first"
		end

		if not (arg.stillIn and arg.stillIn(v13)) then
			return false, "get in your car to ram"
		end

		if not fn38(arg2) then
			return false, "can't find them right now"
		end

		if not fn24() then
			return false, "daily ram limit reached"
		end
		flag8 = true
		v7 = arg2

		arg.spawnS(function()
			local ok, result = pcall(fn46, arg2, 14)

			if not ok then
				result = false
			end

			flag8 = false
			v7 = nil
			fn17()

			if notify then
				notify(result and "Got " .. arg2.Name or "Missed " .. arg2.Name, result and "ok" or "warn")
			end
		end)

		return true
	end

	table.insert(arg.cleanups, function()
		flag4 = false
		flag8 = false
		fn17()

		if arg.releaseAllTouch then
			pcall(arg.releaseAllTouch)
		end
	end)
end
