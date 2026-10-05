-- Why do i love gpt 5.6 sol high the reason is below.
-- dsc.gg/oxyenv 

return function(arg)
	local make = arg.make
	local c = arg.C
	local notify = arg.notify
	local track = arg.track
	local players = arg.Players
	local localPlayer = arg.LocalPlayer
	local workspace = arg.Workspace
	local runService = arg.RunService
	local replicatedStorage = arg.ReplicatedStorage
	local makeButton = arg.makeButton
	local sectionLabel = arg.sectionLabel
	local teleport = arg.pages.teleport

	local function fn()
		return workspace.CurrentCamera
	end

	local v = nil

	if arg.spawnS then
		arg.spawnS(function()
			pcall(function()
				v = arg.atLowIdentity(function()
					local algorithms = replicatedStorage.Modules.Algorithms
					return require(replicatedStorage.Modules.ModuleLoader).assign(algorithms)
				end)
			end)
		end)
	end

	local function pivotChar(arg2)
		local character = localPlayer.Character
		if not (character and typeof(arg2) == "CFrame") then
			return false
		end
		local magnitude = (arg2.Position - character:GetPivot().Position).Magnitude
		local flag = v and v.charPivotTo ~= nil

		if getgenv and getgenv().__vxFlight then
			local format = ("TP %.0f studs -> (%.0f,%.0f,%.0f) announced=%s").format
			local x = arg2.Position.X
			local y = arg2.Position.Y
			local z = arg2.Position.Z
			local v2 = tostring
			getgenv().__vxFlight(format("TP %.0f studs -> (%.0f,%.0f,%.0f) announced=%s", magnitude, x, y, z, v2(flag)))
		end

		if arg.desyncFrozen and arg.desyncFrozen() then
			return (pcall(function()
				character:PivotTo(arg2)
			end))
		end

		if v and v.charPivotTo then
			local renderBuryCF = arg.renderBuryCF and arg.renderBuryCF(arg2)

			if pcall(function()
				v.charPivotTo(character, renderBuryCF or arg2)
			end) then
				if renderBuryCF then
					pcall(function()
						character:PivotTo(arg2)
					end)
				end

				return true
			end
		end

		return (pcall(function()
			character:PivotTo(arg2)
		end))
	end

	arg.pivotChar = pivotChar

	if arg.spawnS and not arg._gameCore then
		arg.spawnS(function()
			local ok, gameCore = pcall(function()
				local moduleLoader = replicatedStorage:WaitForChild("Modules", 20):WaitForChild("ModuleLoader", 20)
				local core = localPlayer:WaitForChild("PlayerScripts", 20):WaitForChild("Framework", 20):WaitForChild("Core", 20)

				return arg.atLowIdentity(function()
					return require(moduleLoader).assign(core)
				end)
			end)

			if ok and type(gameCore) == "table" then
				arg._gameCore = gameCore
			end
		end)
	end

	local fn2 = nil

	local function fn3(arg2)
		if arg2:FindFirstChildOfClass("ProximityPrompt") then
			return arg2
		end

		while arg2.Parent and arg2.Parent.Name ~= "Locations" and arg2.Parent.Name ~= "Gameplay" do
			arg2 = arg2.Parent
		end

		local v2 = nil

		for _, descendant in ipairs(arg2:GetDescendants()) do
			if descendant:IsA("BasePart") and descendant.Name:sub(1, 12) == "_Interaction" and descendant:FindFirstChildOfClass("ProximityPrompt") then
				if descendant.Name == "_Interaction" then
					return descendant
				end
				v2 = v2 or descendant
			end
		end

		return v2
	end

	local function tpToLocation(arg2, arg3)
		if typeof(arg2) ~= "Instance" then
			if notify then
				notify("Location unavailable", "err")
			end

			return
		end

		local gameCore = arg._gameCore
		if not (gameCore and type(gameCore.enterLocation) == "function") then
			return fn2(arg2.Position, arg3)
		end
		local v2 = fn3(arg2) or arg2

		arg.spawnS(function()
			if arg.desyncActive and arg.desyncActive() then
				if arg.ghostExpose then
					arg.ghostExpose(4)
				end

				if arg.desyncSyncNow then
					pcall(arg.desyncSyncNow, 2)
				end
			end

			arg._noclipHoldUntil = os.clock() + 4

			pcall(function()
				arg.atLowIdentity(function()
					gameCore.enterLocation({ spawnPoint = v2 })
				end)
			end)

			local now = os.clock()

			while os.clock() - now < 6 do
				task.wait(0.5)
				local character = localPlayer.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart then
					if not humanoidRootPart.Anchored then
						if not (os.clock() - now > 2) then
							continue
						end
					elseif not (arg.desyncActive and arg.desyncActive()) and os.clock() - now > 2 then
						local raycastParams = RaycastParams.new()
						raycastParams.FilterType = Enum.RaycastFilterType.Exclude
						raycastParams.FilterDescendantsInstances = { character }

						if not workspace:Raycast(humanoidRootPart.Position, Vector3.new(0, -8, 0), raycastParams) then
							pcall(function()
								humanoidRootPart.CFrame = humanoidRootPart.CFrame + Vector3.new(0, 3, 0)
							end)

							break
						else
							continue
						end
					else
						continue
					end
				end

				break
			end
		end)

		if notify then
			notify("Teleported to " .. (arg3 or "location"), "ok")
		end
	end

	arg.tpToLocation = tpToLocation

	fn2 = function(arg2, arg3)
		if typeof(arg2) ~= "Vector3" then
			if notify then
				notify("Couldn't locate " .. (arg3 or "target"), "err")
			end

			return
		end

		if not localPlayer.Character then
			localPlayer.CharacterAdded:Wait()
		end

		local cframe = CFrame.new(arg2 + Vector3.new(0, 3, 0))

		arg.spawnS(function()
			pcall(function()
				localPlayer:RequestStreamAroundAsync(cframe.Position, 3)
			end)

			pivotChar(cframe)

			if arg.ghostActive and arg.ghostActive() and arg.ghostRebase then
				arg.ghostRebase(cframe)
			end

			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local desyncFrozen = arg.desyncFrozen and arg.desyncFrozen()
			local flag = humanoidRootPart and not desyncFrozen and arg.flyActive ~= true and not humanoidRootPart.Anchored

			if flag then
				pcall(function()
					humanoidRootPart.Anchored = true
				end)
			end

			local raycastParams = RaycastParams.new()
			raycastParams.FilterType = Enum.RaycastFilterType.Exclude
			raycastParams.FilterDescendantsInstances = { character }
			local now = os.clock()

			while os.clock() - now < 3 do
				if not workspace:Raycast(cframe.Position, Vector3.new(0, -25, 0), raycastParams) then
					task.wait(0.1)
					continue
				end
				break
			end

			arg._noclipHoldUntil = os.clock() + 2

			if flag and humanoidRootPart and humanoidRootPart.Parent then
				pcall(function()
					humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
					humanoidRootPart.Anchored = false
				end)
			end
		end)

		if notify then
			notify("Teleported to " .. (arg3 or "target"), "ok")
		end
	end

	arg.charPivotQuiet = function(arg2)
		if not (localPlayer.Character and typeof(arg2) == "CFrame") then
			return false
		end
		local v2 = pivotChar(arg2)

		if v2 and arg.ghostActive and arg.ghostActive() and arg.ghostRebase then
			arg.ghostRebase(arg2)
		end

		return v2
	end

	local function fn4(arg2)
		local v2 = workspace:FindFirstChild(arg.charsFolderName or "Characters")

		if v2 then
			local humanoidRootPart = v2:FindFirstChild(arg2.Name)
			humanoidRootPart = humanoidRootPart and humanoidRootPart:FindFirstChild("HumanoidRootPart")
			if humanoidRootPart then
				return humanoidRootPart.Position
			end
		end

		return arg2:GetAttribute("CharacterPosition")
	end

	local function tpToPlayer(arg2)
		local displayName = arg2.DisplayName
		fn2(fn4(arg2), displayName)
	end

	local function fn5(arg2)
		local spawnLocation = arg2:FindFirstChild("SpawnLocation", true)
		if spawnLocation and spawnLocation:IsA("BasePart") then
			return spawnLocation
		end

		for _, descendant in ipairs(arg2:GetDescendants()) do
			if descendant.Name == "_Interaction" and descendant:IsA("BasePart") and descendant:FindFirstChildWhichIsA("ProximityPrompt", true) then
				return descendant
			end
		end

		return nil
	end

	local tbl = nil
	local connection = nil
	local Part = nil
	local n = 0
	local stopViewing = nil

	local function fn6()
		if not (Part and Part.Parent) then
			Part = make("Part", {
				Name = "VxViewAnchor",
				Anchored = true,
				CanCollide = false,
				Transparency = 1,
				Size = Vector3.one,
				Parent = workspace,
			})
		end

		return Part
	end

	local function fn7()
		local character = localPlayer.Character
		character = character and character:FindFirstChildOfClass("Humanoid")

		if not character then
			local v2 = workspace:FindFirstChild(arg.charsFolderName or "Characters")
			v2 = v2 and v2:FindFirstChild(localPlayer.Name)

			if v2 then
				character = v2:FindFirstChildOfClass("Humanoid") or v2:FindFirstChild("HumanoidRootPart")
			end
		end

		return character
	end

	local function fn8(arg2)
		local character = workspace:FindFirstChild(arg.charsFolderName or "Characters")
		character = character and character:FindFirstChild(arg2.Name) or arg2.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return nil
		end
		return character:FindFirstChildOfClass("Humanoid") or humanoidRootPart
	end

	local n2 = 0

	local function fn9(arg2)
		if typeof(arg2) ~= "Vector3" or os.clock() - n2 < 1 then
			return
		end
		n2 = os.clock()

		task.spawn(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()pcall(function()q[1]:RequestStreamAroundAsync(q[2]);end);end))
	end

	arg.viewWatchers = arg.viewWatchers or {}

	local function fn10(arg2)
		for _, viewWatcher in ipairs(arg.viewWatchers) do
			pcall(viewWatcher, arg2)
		end
	end

	local function stopViewing2()
		if connection then
			connection:Disconnect()
			connection = nil
		end

		tbl = nil
		local v2 = fn()
		v2.CameraType = Enum.CameraType.Custom
		local v3 = fn7()

		if v3 then
			v2.CameraSubject = v3
		end

		if Part then
			pcall(function()
				Part:Destroy()
			end)

			Part = nil
		end

		if stopViewing then
			stopViewing.Visible = false
		end

		fn10(nil)
	end

	local function fn11()
		if connection then
			connection:Disconnect()
		end

		n = 0

		connection = runService.Heartbeat:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function(F)if not q[1][3][q[1][5]]then return;end;local O=q[2][3][q[2][5]]();if O.CameraType~=Enum.CameraType.Custom then O.CameraType=Enum.CameraType.Custom;end;local L=nil;if q[1][3][q[1][5]].kind=="player"then local W=q[1][3][q[1][5]].plr;if not(W and W.Parent)then q[3][3][q[3][5]]();return;end;L=q[4][3][q[4][5]](W);local k=q[5][3][q[5][5]](W);if k then if O.CameraSubject~=k then O.CameraSubject=k;end;elseif typeof(L)=="Vector3"then W=q[6][3][q[6][5]]();W.CFrame=CFrame.new(L);if O.CameraSubject~=W then O.CameraSubject=W;end;end;else local W=q[1][3][q[1][5]].part;if not(W and W.Parent)then q[3][3][q[3][5]]();return;end;L=W.Position;W=q[6][3][q[6][5]]();W.CFrame=CFrame.new(L);if O.CameraSubject~=W then O.CameraSubject=W;end;end;q[7][3][q[7][5]]+=F;if q[7][3][q[7][5]]>=0.7 then q[7][3][q[7][5]]=0;q[8][3][q[8][5]](L);end;end))
	end

	local function fn12(arg2)
		fn10(arg2)

		if stopViewing then
			stopViewing.Text = "Stop viewing " .. arg2
			stopViewing.Visible = true
		end
	end

	local function viewPlayer(arg2)
		stopViewing2()
		local v2 = fn4(arg2)

		if typeof(v2) ~= "Vector3" then
			if notify then
				notify(arg2.DisplayName .. " isn't loaded in", "err")
			end

			return
		end

		fn9(v2)
		tbl = { kind = "player", plr = arg2 }
		local custom = Enum.CameraType.Custom
		fn().CameraType = custom
		fn11()
		fn12(arg2.DisplayName)

		if notify then
			notify("Viewing " .. arg2.DisplayName, "ok")
		end
	end

	local function fn13(arg2, arg3)
		stopViewing2()
		fn9(arg2.Position)
		tbl = { kind = "location", part = arg2, name = arg3 }
		local custom = Enum.CameraType.Custom
		fn().CameraType = custom
		fn11()
		fn12(arg3)

		if notify then
			notify("Viewing " .. arg3, "ok")
		end
	end

	stopViewing = makeButton(teleport, "Stop viewing", c.DANGER, 1, function()
		stopViewing2()
	end)

	stopViewing.TextColor3 = c.RED
	stopViewing.Visible = false

	local function fn14(arg2, arg3)
		return arg.makeSearchBox(teleport, arg2, arg3)
	end

	local function fn15(arg2, arg3)
		local ScrollingFrame = make("ScrollingFrame", {
			Parent = teleport,
			Size = UDim2.new(1, 0, 0, arg3),
			BackgroundColor3 = c.SURFACE,
			BorderSizePixel = 0,
			LayoutOrder = arg2,
			CanvasSize = UDim2.new(0, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollBarThickness = 4,
			ScrollBarImageColor3 = c.ACCENT,
		})

		make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = ScrollingFrame })
		make("UIListLayout", { Parent = ScrollingFrame, Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder })

		make("UIPadding", {
			Parent = ScrollingFrame,
			PaddingTop = UDim.new(0, 5),
			PaddingBottom = UDim.new(0, 5),
			PaddingLeft = UDim.new(0, 5),
			PaddingRight = UDim.new(0, 5),
		})

		return ScrollingFrame
	end

	local function fn16(arg2)
		for _, child in ipairs(arg2:GetChildren()) do
			if not (child:IsA("UIListLayout") or child:IsA("UIPadding")) then
				child:Destroy()
			end
		end
	end

	local function fn17(arg2, arg3)
		make("TextLabel", {
			Parent = arg2,
			Size = UDim2.new(1, 0, 0, 20),
			BackgroundTransparency = 1,
			Text = arg3,
			Font = Enum.Font.Gotham,
			TextSize = 11,
			TextColor3 = c.SUBTEXT,
			TextXAlignment = Enum.TextXAlignment.Center,
			LayoutOrder = 0,
		})
	end

	local function fn18(arg2, arg3, arg4, arg5, arg6)
		local TextButton = make("TextButton", {
			Parent = arg2,
			Size = UDim2.fromOffset(42, 22),
			Position = UDim2.new(1, arg4, 0.5, -11),
			BackgroundColor3 = arg5,
			BorderSizePixel = 0,
			Text = arg3,
			Font = Enum.Font.GothamBold,
			TextSize = 10,
			TextColor3 = Color3.new(1, 1, 1),
			AutoButtonColor = false,
		})

		make("UICorner", { CornerRadius = UDim.new(0, 5), Parent = TextButton })
		track(TextButton.MouseButton1Click:Connect(arg.safe(arg6)))
		arg.hover(TextButton, { BackgroundColor3 = arg5:Lerp(Color3.new(1, 1, 1), 0.14) })
		return TextButton
	end

	local v2 = nil
	local flag = false

	local function fn19()
		if v2 or flag then
			return
		end
		flag = true

		arg.spawnS(function()
			local ok, result = pcall(function()
				local moduleLoader = replicatedStorage:WaitForChild("Modules", 20):WaitForChild("ModuleLoader", 20)
				local core = localPlayer:WaitForChild("PlayerScripts", 20):WaitForChild("Framework", 20):WaitForChild("Core", 20)

				return arg.atLowIdentity(function()
					return require(moduleLoader).assign(core)
				end)
			end)

			if ok then
				v2 = result
			end

			flag = false
		end)
	end

	fn19()

	local function mapMarkerPos()
		if not v2 then
			return nil
		end

		local ok, result = pcall(function()
			return v2.navigationPoint
		end)

		if ok and typeof(result) == "Vector3" then
			return result
		end

		local ok2, result2 = pcall(function()
			return v2.waypoints and v2.waypoints.Navigation
		end)

		if ok2 and type(result2) == "function" then
			local ok3, result3 = pcall(result2)
			if ok3 and typeof(result3) == "Vector3" then
				return result3
			end
		end

		return nil
	end

	arg.mapMarkerPos = mapMarkerPos

	arg.coreJobs = function()
		if not v2 then
			return nil
		end

		local ok, result = pcall(function()
			return v2.teamJobs
		end)

		return ok and type(result) == "table" and result or nil
	end

	arg.jobWaypointPos = function()
		if not v2 then
			return nil
		end

		local ok, result = pcall(function()
			return v2.waypoints and v2.waypoints["Current Job"]
		end)

		if ok and type(result) == "function" then
			local ok2, result2 = pcall(result)
			if ok2 and typeof(result2) == "Vector3" then
				return result2
			end
		end

		return nil
	end

	sectionLabel(teleport, "Map marker", 4)

	makeButton(teleport, "Teleport to marker", c.ACCENT, 5, function()
		local v3 = mapMarkerPos()

		if not v3 then
			if notify then
				notify("No marker set. Open the map and press Navigate", "warn")
			end

			return
		end

		fn2(v3, "your marker")
	end)

	makeButton(teleport, "Drive to marker", c.SURFACE, 6, function()
		if arg.autoDriveOwner and arg.autoDriveOwner() == "marker" then
			if arg.autoDriveStop then
				arg.autoDriveStop()
			end

			if notify then
				notify("Stopped driving", "off")
			end

			return
		end

		if arg.isFollowing and arg.isFollowing() and arg.stopFollow then
			arg.stopFollow()
		end

		local v3 = mapMarkerPos()

		if not v3 then
			if notify then
				notify("No marker set. Open the map and press Navigate", "warn")
			end

			return
		end

		if not (arg.autoDriveTo and arg.spawnS) then
			if notify then
				notify("Auto-drive not loaded", "warn")
			end

			return
		end

		arg.spawnS(function()
			if notify then
				notify("Driving to your marker", "info")
			end

			local v4, v5 = arg.autoDriveTo(v3, { reach = 28, offroad = arg.driveOffroad, name = "Map marker", owner = "marker" })

			if notify then
				notify(v4 and "Arrived at your marker" or "Stopped: " .. tostring(v5), v4 and "ok" or "warn")
			end
		end)
	end)

	arg.tpToPlayer = tpToPlayer
	arg.viewPlayer = viewPlayer
	arg.stopViewing = stopViewing2

	arg.getViewing = function()
		return tbl and tbl.kind == "player" and tbl.plr or nil
	end

	sectionLabel(teleport, "Teleport to location", 7)
	local v3 = fn14(8, "search locations…")
	local v4 = fn15(9, 170)
	arg.growWithWindow(v4, 170)

	local function fn20()
		fn16(v4)
		local str = v3.Text:lower()
		local locations = nil

		pcall(function()
			locations = replicatedStorage.Stuff.Locations
		end)

		local n3 = 0

		if locations then
			local children = locations:GetChildren()

			table.sort(children, function(arg2, arg3)
				return arg2.Name < arg3.Name
			end)

			for _, child in ipairs(children) do
				if str == "" or child.Name:lower():find(str, 1, true) then
					local v5 = fn5(child)

					if v5 then
						n3 += 1

						local Frame = make("Frame", {
							Parent = v4,
							Size = UDim2.new(1, 0, 0, 30),
							BackgroundColor3 = c.SURFACE2,
							BorderSizePixel = 0,
							LayoutOrder = n3,
						})

						make("UICorner", { CornerRadius = UDim.new(0, 6), Parent = Frame })

						make("TextLabel", {
							Parent = Frame,
							Size = UDim2.new(1, -150, 1, 0),
							Position = UDim2.fromOffset(8, 0),
							BackgroundTransparency = 1,
							Text = child.Name,
							Font = Enum.Font.Gotham,
							TextSize = 11,
							TextColor3 = c.TEXT,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextTruncate = Enum.TextTruncate.AtEnd,
						})

						fn18(Frame, "View", -140, c.SURFACE, function()
							if v5 and v5.Parent then
								fn13(v5, child.Name)
							elseif notify then
								notify("Location unavailable", "err")
							end
						end)

						fn18(Frame, "Drive", -94, c.SURFACE, function()
							if arg.autoDriveOwner and arg.autoDriveOwner() == "location" and arg.autoDriveActive and arg.autoDriveActive() then
								if arg.autoDriveStop then
									arg.autoDriveStop()
								end

								if notify then
									notify("Stopped driving", "off")
								end

								return
							end

							if arg.isFollowing and arg.isFollowing() and arg.stopFollow then
								arg.stopFollow()
							end

							if not (v5 and v5.Parent) then
								if notify then
									notify("Location unavailable", "err")
								end

								return
							end

							if not (arg.autoDriveTo and arg.spawnS) then
								if notify then
									notify("Auto-drive not loaded", "warn")
								end

								return
							end

							arg.spawnS(function()
								if notify then
									notify("Driving to " .. child.Name, "info")
								end

								local v6, v7 = arg.autoDriveTo(v5.Position, { reach = 28, offroad = arg.driveOffroad, name = child.Name, owner = "location" })

								if notify then
									notify(v6 and "Arrived at " .. child.Name or "Stopped: " .. tostring(v7), v6 and "ok" or "warn")
								end
							end)
						end)

						fn18(Frame, "TP", -48, c.ACCENT, function()
							if v5 and v5.Parent then
								tpToLocation(v5, child.Name)
							elseif notify then
								notify("Location unavailable", "err")
							end
						end)
					end
				end
			end
		end

		if n3 == 0 then
			fn17(v4, locations and "— no matching locations —" or "— Locations folder not found —")
		end
	end

	track(v3:GetPropertyChangedSignal("Text"):Connect(arg.safe(fn20)))
	sectionLabel(teleport, "Crimes (robbable)", 11)
	local str = "all"
	local fn21 = nil

	local function fn22(arg2)
		if str == "all" then
			return true
		end
		local str2 = arg2:lower()
		if str == "robbery" then
			return str2:find("robbery", 1, true) ~= nil
		end

		if str == "heist" then
			return str2:find("heist", 1, true) ~= nil
		end

		if str == "car" then
			return str2:find("car", 1, true) ~= nil
		end

		if str == "trade" then
			return str2:find("trade", 1, true) ~= nil
		end
		return true
	end

	arg.makeChoice(teleport, nil, 12, {
		{ key = "all", text = "All" },
		{ key = "robbery", text = "Robbery" },
		{ key = "heist", text = "Heist" },
		{ key = "car", text = "Car" },
		{ key = "trade", text = "Trade" },
	}, "all", function(arg2)
		str = arg2

		if fn21 then
			fn21()
		end
	end)

	local v5 = fn15(13, 170)
	arg.growWithWindow(v5, 170)

	local function fn23(arg2)
		local startLocation = arg2:FindFirstChild("StartLocation")
		local value = startLocation and startLocation.Value
		if typeof(value) == "Vector3" then
			return value
		end

		if typeof(value) == "Instance" then
			if value:IsA("BasePart") then
				return value.Position
			end

			local ok, result = pcall(function()
				return value:GetPivot()
			end)

			if ok and result then
				return result.Position
			end
		end

		local includePlayerLocation = arg2:FindFirstChild("IncludePlayerLocation")
		if includePlayerLocation and typeof(includePlayerLocation.Value) == "Vector3" then
			return includePlayerLocation.Value
		end
		local object = arg2:FindFirstChild("Object")

		if object and typeof(object.Value) == "Instance" then
			local ok, result = pcall(function()
				return object.Value:GetPivot()
			end)

			if ok and result then
				return result.Position
			end
		end

		return nil
	end

	fn21 = function()
		fn16(v5)
		local active = nil

		pcall(function()
			active = replicatedStorage.Gameplay.Missions.Active
		end)

		local n3 = 0

		if active then
			local tbl2 = {}

			for _, child in ipairs(active:GetChildren()) do
				if child:IsA("BoolValue") and child:FindFirstChild("ID") then
					tbl2[#tbl2 + 1] = child
				end
			end

			table.sort(tbl2, function(arg2, arg3)
				local n4 = arg2:FindFirstChild("ID") and arg2.ID.Value or 0
				local n5 = arg3:FindFirstChild("ID") and arg3.ID.Value or 0
				if n4 == n5 then
					return arg2.Name < arg3.Name
				end
				return n4 < n5
			end)

			for _, v6 in ipairs(tbl2) do
				if fn22(v6.Name) then
					local objectName = v6:FindFirstChild("ObjectName")
					local name = objectName and objectName.Value ~= "" and v6.Name .. "  ·  " .. objectName.Value or v6.Name
					local flag2 = v6.Value == false
					n3 += 1

					local Frame = make("Frame", {
						Parent = v5,
						Size = UDim2.new(1, 0, 0, 30),
						BackgroundColor3 = c.SURFACE2,
						BorderSizePixel = 0,
						LayoutOrder = n3,
					})

					make("UICorner", { CornerRadius = UDim.new(0, 6), Parent = Frame })

					make("TextLabel", {
						Parent = Frame,
						Size = UDim2.new(1, -200, 1, 0),
						Position = UDim2.fromOffset(8, 0),
						BackgroundTransparency = 1,
						Text = name,
						Font = Enum.Font.Gotham,
						TextSize = 11,
						TextColor3 = c.TEXT,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextTruncate = Enum.TextTruncate.AtEnd,
					})

					make("TextLabel", {
						Parent = Frame,
						Size = UDim2.fromOffset(74, 30),
						Position = UDim2.new(1, -184, 0, 0),
						BackgroundTransparency = 1,
						Text = flag2 and "available" or "unavailable",
						Font = Enum.Font.GothamBold,
						TextSize = 10,
						TextColor3 = flag2 and c.GREEN or c.AMBER,
						TextXAlignment = Enum.TextXAlignment.Right,
					})

					fn18(Frame, "Drive", -94, c.SURFACE, function()
						if arg.autoDriveOwner and arg.autoDriveOwner() == "crime" and arg.autoDriveActive and arg.autoDriveActive() then
							if arg.autoDriveStop then
								arg.autoDriveStop()
							end

							if notify then
								notify("Stopped driving", "off")
							end

							return
						end

						local v7 = fn23(v6)

						if not v7 then
							if notify then
								notify("Location not available yet", "err")
							end

							return
						end

						if not (arg.autoDriveTo and arg.spawnS) then
							if notify then
								notify("Auto-drive not loaded", "warn")
							end

							return
						end

						if arg.isFollowing and arg.isFollowing() and arg.stopFollow then
							arg.stopFollow()
						end

						arg.spawnS(function()
							if notify then
								notify("Driving to " .. v6.Name, "info")
							end

							local v8, v9 = arg.autoDriveTo(v7, { reach = 28, offroad = arg.driveOffroad, name = v6.Name, owner = "crime" })

							if notify then
								notify(v8 and "Arrived at " .. v6.Name or "Stopped: " .. tostring(v9), v8 and "ok" or "warn")
							end
						end)
					end)

					fn18(Frame, "TP", -48, c.ACCENT, function()
						local v7 = fn23(v6)

						if v7 then
							fn2(v7, v6.Name)
						elseif notify then
							notify("Location not available yet", "err")
						end
					end)
				end
			end
		end

		if n3 == 0 then
			local str2 = "— Missions.Active not found —"

			if active then
				str2 = str == "all" and "— nothing robbable right now —" or "— no crimes match this filter —"
			end

			fn17(v5, str2)
		end
	end

	arg.onTeleportTabOpened = function()
		fn20()
		fn21()
	end

	local flag2 = false

	local function fn24()
		if not teleport.Visible then
			return
		end

		if flag2 then
			return
		end
		flag2 = true

		task.delay(0.4, arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()q[1][3][q[1][5]]=false;if q[2].Visible then q[3][3][q[3][5]]();end;end))
	end

	local active = nil

	pcall(function()
		active = replicatedStorage.Gameplay.Missions.Active
	end)

	if active then
		track(active.ChildAdded:Connect(arg.safe(fn24)))
		track(active.ChildRemoved:Connect(arg.safe(fn24)))
	end

	track(players.PlayerRemoving:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(F)if q[1][3][q[1][5]]and q[1][3][q[1][5]].kind=="player"and q[1][3][q[1][5]].plr==F then q[2][3][q[2][5]]();end;end)))

	task.defer(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()q[1][3][q[1][5]]();end))

	sectionLabel(teleport, "Blink", 2)
	local uis = arg.UIS
	local makeToggleRow = arg.makeToggleRow
	local color = Color3.fromRGB(66, 196, 137)
	local n3 = 50
	local flag3 = false
	local flag4 = false
	local flag5 = false
	local tbl2 = {}
	local screenGui = nil
	local textButton = nil
	local flag6 = false

	local function fn25(arg2)
		local humanoidRootPart

		if arg2 then
			humanoidRootPart = arg2:FindFirstChild("HumanoidRootPart") or arg2:FindFirstChild("Torso") or arg2:FindFirstChild("UpperTorso")
		else
			humanoidRootPart = arg2
		end

		return humanoidRootPart
	end

	local function fn26(arg2, arg3, arg4)
		local n4 = arg3.CFrame - arg3.CFrame.Position

		pcall(function()
			arg3.CFrame = CFrame.new(arg4) * n4
			arg3.AssemblyLinearVelocity = Vector3.zero
		end)

		if arg.ghostActive and arg.ghostActive() and arg.ghostRebase then
			arg.ghostRebase(arg3.CFrame)
		end
	end

	local function fn27(arg2, arg3)
		if flag3 then
			return
		end
		local character = localPlayer.Character
		local v6 = character and fn25(character)
		if not v6 then
			return
		end
		local v7 = fn()
		local v8 = v7:ScreenPointToRay(arg2, arg3)
		local raycastParams = RaycastParams.new()
		raycastParams.FilterDescendantsInstances = { character }
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude
		local hit = workspace:Raycast(v8.Origin, v8.Direction * 500, raycastParams)
		local n4

		if hit then
			n4 = hit.Position + hit.Normal * 3
		else
			local lookVector = v7.CFrame.LookVector
			local vector = Vector3.new(lookVector.X, 0, lookVector.Z)
			n4 = v6.Position + (vector.Magnitude > 0 and vector.Unit or lookVector) * n3
		end

		if not (arg.desyncActive and arg.desyncActive()) then
			local raycastParams2 = RaycastParams.new()
			raycastParams2.FilterType = Enum.RaycastFilterType.Exclude
			raycastParams2.FilterDescendantsInstances = { character }
			local hit2 = workspace:Raycast(n4 + Vector3.new(0, 5, 0), Vector3.new(0, -4000, 0), raycastParams2)

			if hit2 then
				local n5 = hit2.Position.Y + (arg.surfaceMaxH or 60)

				if n4.Y > n5 then
					n4 = Vector3.new(n4.X, n5, n4.Z)
				end
			end
		end

		fn26(character, v6, n4)
	end

	arg.blink = function()
		if not flag5 then
			return
		end
		local mouseLocation = uis:GetMouseLocation()
		fn27(mouseLocation.X, mouseLocation.Y)
	end

	local function fn28(arg2)
		flag4 = arg2

		if textButton then
			textButton.BackgroundColor3 = arg2 and color or c.ACCENT
			textButton.Text = arg2 and "Tap spot" or "Blink"
		end
	end

	local function fn29()
		if screenGui then
			return
		end
		screenGui = Instance.new("ScreenGui")
		screenGui.Name = "VXSANS_BLINK"
		screenGui.ResetOnSpawn = false
		screenGui.DisplayOrder = 8000
		screenGui.Parent = arg.CoreGui or arg.uiHost()
		textButton = Instance.new("TextButton")
		textButton.Size = UDim2.fromOffset(46, 46)
		textButton.Position = UDim2.new(1, -60, 0.6, -23)
		textButton.BackgroundColor3 = c.ACCENT
		textButton.Text = "Blink"
		textButton.TextColor3 = Color3.new(1, 1, 1)
		textButton.Font = Enum.Font.GothamBold
		textButton.TextSize = 12
		textButton.AutoButtonColor = true
		local uiCorner = Instance.new("UICorner")
		uiCorner.CornerRadius = UDim.new(1, 0)
		uiCorner.Parent = textButton
		textButton.Parent = screenGui

		if arg.registerMobileButton then
			arg.registerMobileButton("blink", textButton)
		end

		table.insert(tbl2, textButton.InputBegan:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function(F)if F.UserInputType==Enum.UserInputType.Touch or F.UserInputType==Enum.UserInputType.MouseButton1 then q[1][3][q[1][5]]=true;q[2][3][q[2][5]]=false;q[4][3][q[4][5]]=q[3][3][q[3][5]].Position;q[5][3][q[5][5]]=F;q[6][3][q[6][5]]=F.Position;end;end)))

		table.insert(tbl2, uis.InputChanged:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function(F)if q[1][3][q[1][5]]and q[2].editLayout and F==q[3][3][q[3][5]]and(F.UserInputType==Enum.UserInputType.Touch or F.UserInputType==Enum.UserInputType.MouseMovement)then local O=F.Position-q[4][3][q[4][5]];local F=O.Magnitude;if F>8 then q[5][3][q[5][5]]=true;end;q[6][3][q[6][5]].Position=UDim2.new(q[7][3][q[7][5]].X.Scale,q[7][3][q[7][5]].X.Offset+O.X,q[7][3][q[7][5]].Y.Scale,q[7][3][q[7][5]].Y.Offset+O.Y);if q[2].clampGui then q[2].clampGui(q[6][3][q[6][5]]);end;end;end)))

		table.insert(tbl2, uis.InputEnded:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function(F)if q[1][3][q[1][5]]and(F==q[2][3][q[2][5]]or F.UserInputType==Enum.UserInputType.MouseButton1)then q[1][3][q[1][5]]=false;if q[3].clampGui then q[3].clampGui(q[4][3][q[4][5]]);end;if not q[5][3][q[5][5]]then q[6][3][q[6][5]](not q[7][3][q[7][5]]);if q[8]then q[8](q[7][3][q[7][5]]and"Blink armed - tap where to go"or"Blink cancelled",q[7][3][q[7][5]]and"ok"or"info");end;end;end;end)))
	end

	local function fn30()
		if screenGui then
			pcall(function()
				screenGui:Destroy()
			end)
		end

		screenGui = nil
		textButton = nil
		flag4 = false
	end

	local function fn31()
		flag5 = true

		table.insert(tbl2, uis.InputBegan:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function(F,O)if O then return;end;if q[1][3][q[1][5]]and F.UserInputType==Enum.UserInputType.Touch then q[2][3][q[2][5]](false);q[3][3][q[3][5]](F.Position.X,F.Position.Y);end;end)))

		if arg.IS_MOBILE then
			fn29()
		end

		if notify then
			local keybinds = arg.state and arg.state.keybinds
			notify(arg.IS_MOBILE and "Blink on - tap the Blink button, then a spot" or "Blink on - press " .. (keybinds and keybinds.blink and keybinds.blink.Name or "X") .. " to blink to your cursor", "ok")
		end
	end

	local function fn32()
		flag5 = false

		for _, v6 in ipairs(tbl2) do
			pcall(function()
				v6:Disconnect()
			end)
		end

		table.clear(tbl2)
		fn30()
	end

	makeToggleRow(teleport, "mouse-pointer-click", "Blink", "PC: press your Blink key (set in the Keybinds tab, default 8) to blink to your cursor. Mobile: tap the Blink button, then tap where to go.", 3, false, function(arg2)
		if arg2 == flag6 then
			return
		end
		flag6 = arg2

		if arg2 then
			fn31()
		else
			fn32()
		end
	end, "blink")

	table.insert(arg.cleanups, function()
		fn32()
	end)

	local screenGui2 = nil
	local textButton2 = nil
	local flag7 = false
	local v6 = nil

	arg.spawnS(function()
		local ok, result = pcall(function()
			local moduleLoader = replicatedStorage:WaitForChild("Modules", 20):WaitForChild("ModuleLoader", 20)
			local core = localPlayer:WaitForChild("PlayerScripts", 20):WaitForChild("Framework", 20):WaitForChild("Core", 20)

			return arg.atLowIdentity(function()
				return require(moduleLoader).assign(core)
			end)
		end)

		if ok and type(result) == "table" then
			v6 = result
		end
	end)

	local function fn33()
		local character = localPlayer.Character
		character = character and character:FindFirstChild("HumanoidRootPart")
		if character and arg.desyncActive and arg.desyncActive() and not character.Anchored and not arg._ghostHolding then
			return character.CFrame
		end
		local ghostRealCF = arg.ghostActive and arg.ghostActive() and arg.ghostRealCF and arg.ghostRealCF()
		if ghostRealCF then
			return ghostRealCF
		end
		return character and character.CFrame
	end

	local function fn34()
		local insideLocation = localPlayer:FindFirstChild("InsideLocation")
		if not (insideLocation and insideLocation.Value) then
			return nil
		end
		local v7 = fn33()
		if not v7 then
			return nil
		end
		local v8 = nil
		local v9 = nil

		for _, descendant in ipairs(insideLocation.Value:GetDescendants()) do
			if descendant:IsA("ProximityPrompt") and descendant.Name == "EnterLocation" then
				local location = descendant:FindFirstChild("Location")
				location = location and location.Value

				if location and location:IsA("BasePart") and location.Position.Y > v7.Position.Y + 150 then
					local magnitude = Vector3.new(location.Position.X - v7.Position.X, 0, location.Position.Z - v7.Position.Z).Magnitude

					if not v8 or magnitude < v8 then
						v8 = magnitude
						v9 = location
					end
				end
			end
		end

		return v9
	end

	local raycastParams = RaycastParams.new()
	raycastParams.FilterType = Enum.RaycastFilterType.Exclude
	local tbl3 = {}

	for _, v7 in ipairs({
		"Pavement",
		"Asphalt",
		"Concrete",
		"Cobblestone",
		"Grass",
		"LeafyGrass",
		"Ground",
		"Sand",
		"Rock",
		"Slate",
		"Mud",
		"Salt",
		"Limestone",
		"Sandstone",
		"Basalt",
		"Snow",
		"Glacier",
		"CrackedLava",
		"Pebble",
	}) do
		local ok, result = pcall(function()
			return Enum.Material[v7]
		end)

		if ok and result then
			tbl3[result] = true
		end
	end

	local function fn35(arg2, arg3)
		local filterDescendantsInstances = { localPlayer.Character }
		local v7 = workspace:FindFirstChild(arg.charsFolderName or "Characters")

		if v7 then
			filterDescendantsInstances[#filterDescendantsInstances + 1] = v7
		end

		local gameplay = workspace:FindFirstChild("Gameplay")
		gameplay = gameplay and gameplay:FindFirstChild("Vehicles")

		if gameplay then
			filterDescendantsInstances[#filterDescendantsInstances + 1] = gameplay
		end

		raycastParams.FilterDescendantsInstances = filterDescendantsInstances
		local n4 = math.max(arg2.Y + 600, 1500)
		local v8 = nil

		for i = 1, 25 do
			local hit = workspace:Raycast(Vector3.new(arg2.X, n4, arg2.Z), Vector3.new(0, -6000, 0), raycastParams)

			if not (not hit or hit.Position.Y < arg3 + 3) then
				if hit.Material ~= Enum.Material.Water and (hit.Instance == workspace.Terrain or tbl3[hit.Material]) then
					v8 = hit
				end

				n4 = hit.Position.Y - 0.2
				continue
			end

			break
		end

		return v8
	end

	local function fn36(arg2, arg3)
		local hit = workspace:Raycast(Vector3.new(arg2, 1500, arg3), Vector3.new(0, -6000, 0), raycastParams)
		if not hit or hit.Material == Enum.Material.Water then
			return nil
		end

		if not (hit.Instance == workspace.Terrain or tbl3[hit.Material]) then
			return nil
		end
		local y = hit.Position.Y

		for _, v7 in ipairs({ 2.5, 5 }) do
			for i = 0, 3 do
				local n4 = i * 3.1415926535897931 / 2
				local vector = Vector3.new
				local sin = math.sin
				if workspace:Raycast(Vector3.new(arg2, y + v7, arg3), vector(math.cos(n4), 0, sin(n4)) * 2.5, raycastParams) then
					return nil
				end
			end
		end

		return hit
	end

	local function fn37(arg2)
		local v7 = fn36(arg2.X, arg2.Z)
		if v7 then
			return v7
		end

		for _, v8 in ipairs({ 8, 16, 28, 44, 64, 90, 120, 160 }) do
			local n4 = math.max(12, math.floor(v8 / 4))

			for i = 0, n4 - 1 do
				local n5 = i * 2 * 3.1415926535897931 / n4
				local z = arg2.Z
				local v9 = fn36(arg2.X + math.cos(n5) * v8, z + math.sin(n5) * v8)
				if v9 then
					return v9
				end
			end
		end

		return nil
	end

	local function fn38()
		local character = localPlayer.Character
		character = character and character:FindFirstChildOfClass("Humanoid")
		if not character or character.SeatPart then
			return nil
		end
		local insideLocation = localPlayer:FindFirstChild("InsideLocation")
		if insideLocation and insideLocation.Value then
			return nil
		end
		local v7 = fn33()
		if not v7 then
			return nil
		end
		local v8 = fn35(v7.Position, v7.Position.Y - character.HipHeight - 1)
		if v8 then
			return v8, v7, character
		end
		return nil
	end

	local function returnToSurface()
		local v7 = fn34()

		if v7 then
			if not (v6 and type(v6.enterLocation) == "function") then
				if notify then
					notify("Couldn't reach the game's exit, try the door", "warn")
				end

				return
			end

			if arg.desyncActive and arg.desyncActive() then
				if arg.ghostExpose then
					arg.ghostExpose(4)
				end

				if arg.desyncSyncNow then
					pcall(arg.desyncSyncNow, 2)
				end
			end

			arg._surfQuietUntil = os.clock() + 3
			arg._noclipHoldUntil = os.clock() + 3

			pcall(function()
				arg.atLowIdentity(function()
					v6.enterLocation({ spawnPoint = v7 })
				end)
			end)

			return
		end

		local v8, v9, v10 = fn38()

		if not v8 then
			if notify then
				notify("You're already on the surface", "info")
			end

			return
		end

		local humanoidRootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
		local v11 = fn37(v9.Position) or v8
		local n4 = v11.Position.Y + v10.HipHeight + (humanoidRootPart and humanoidRootPart.Size.Y / 2 or 1) + 0.5
		local n5 = v9 - v9.Position
		local n6 = CFrame.new(v11.Position.X, n4, v11.Position.Z) * n5
		arg._noclipHoldUntil = os.clock() + 2
		arg._surfQuietUntil = os.clock() + 2

		if arg.pivotChar then
			arg.pivotChar(n6)
		else
			localPlayer.Character:PivotTo(n6)
		end

		if arg.ghostActive and arg.ghostActive() and arg.ghostRebase then
			arg.ghostRebase(n6)
		end

		pcall(function()
			if humanoidRootPart then
				humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
			end
		end)

		if notify then
			notify("Back on the surface", "ok")
		end

		local y = n6.Y

		arg.spawnS(function()
			local now = os.clock()
			local y2 = y

			while os.clock() - now < 5 do
				task.wait(0.1)
				local v12 = fn33()
				if not v12 then
					return
				end

				if v12.Y < y - 6 then
					local humanoidRootPart2 = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
					local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid")

					if arg.devlog then
						arg.devlog(("surface: pulled back down %.0f after %.1fs (from y%.0f, step %.0f) ghost=%s adv=%s fly=%s noclip=%s infjump=%s state=%s vel=%.0f anchored=%s"):format(y - v12.Y, os.clock() - now, y, y2 - v12.Y, tostring(arg.ghostActive and arg.ghostActive()), tostring(arg.desyncActive and arg.desyncActive()), tostring(arg.flyActive), tostring(arg.noclipActive), tostring(arg.infJumpActive), humanoid and humanoid:GetState().Name or "?", humanoidRootPart2 and humanoidRootPart2.AssemblyLinearVelocity.Y or 0, tostring(humanoidRootPart2 and humanoidRootPart2.Anchored)))
					end

					return
				end

				y2 = v12.Y
			end
		end)
	end

	local function fn39()
		if screenGui2 then
			return
		end
		screenGui2 = Instance.new("ScreenGui")
		screenGui2.Name = "VXSANS_SURFACE"
		screenGui2.ResetOnSpawn = false
		screenGui2.DisplayOrder = 8001
		screenGui2.IgnoreGuiInset = true
		screenGui2.Parent = arg.CoreGui or arg.uiHost()
		textButton2 = Instance.new("TextButton")
		textButton2.AnchorPoint = Vector2.new(0.5, 1)
		textButton2.Position = UDim2.new(0.5, 0, 1, arg.IS_MOBILE and -112 or -104)
		textButton2.Size = UDim2.fromOffset(196, 42)
		textButton2.BackgroundColor3 = c.SURFACE or Color3.fromRGB(22, 22, 30)
		textButton2.BackgroundTransparency = 0.04
		textButton2.AutoButtonColor = false
		textButton2.Visible = false
		textButton2.Text = ""
		local uiCorner = Instance.new("UICorner")
		uiCorner.CornerRadius = UDim.new(1, 0)
		uiCorner.Parent = textButton2
		local uiStroke = Instance.new("UIStroke")
		uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke.Color = c.BORDER or Color3.fromRGB(60, 60, 75)
		uiStroke.Thickness = 1
		uiStroke.Transparency = 0.1
		uiStroke.Parent = textButton2
		local frame = Instance.new("Frame")
		frame.AnchorPoint = Vector2.new(0, 0.5)
		frame.Position = UDim2.new(0, 6, 0.5, 0)
		frame.Size = UDim2.fromOffset(30, 30)
		frame.BackgroundColor3 = c.ACCENT
		frame.BorderSizePixel = 0
		frame.Parent = textButton2
		local uiCorner2 = Instance.new("UICorner")
		uiCorner2.CornerRadius = UDim.new(1, 0)
		uiCorner2.Parent = frame

		for _, v7 in ipairs({ -45, 45 }) do
			local frame2 = Instance.new("Frame")
			frame2.AnchorPoint = Vector2.new(0.5, 0.5)
			frame2.Size = UDim2.fromOffset(10, 2.5)
			frame2.Position = UDim2.new(0.5, v7 < 0 and -3 or 3, 0.5, 0)
			frame2.Rotation = v7
			frame2.BackgroundColor3 = Color3.new(1, 1, 1)
			frame2.BorderSizePixel = 0
			frame2.Parent = frame
		end

		local textLabel = Instance.new("TextLabel")
		textLabel.Name = "Label"
		textLabel.BackgroundTransparency = 1
		textLabel.Position = UDim2.new(0, 44, 0, 0)
		textLabel.Size = UDim2.new(1, -56, 1, 0)
		textLabel.Font = Enum.Font.GothamBold
		textLabel.TextSize = 14
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.TextColor3 = c.TEXT or Color3.new(1, 1, 1)
		textLabel.Text = "Return to surface"
		textLabel.Parent = textButton2
		local uiScale = Instance.new("UIScale")
		uiScale.Parent = textButton2

		track(textButton2.MouseEnter:Connect(function()
			uiScale.Scale = 1.04
		end))

		track(textButton2.MouseLeave:Connect(function()
			uiScale.Scale = 1
		end))

		textButton2.Parent = screenGui2

		track(textButton2.Activated:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()q[1][3][q[1][5]]();end)))
	end

	arg.spawnS(function()
		fn39()

		while screenGui2 and screenGui2.Parent do
			local ok, text = pcall(fn34)
			text = ok and text or nil
			local ok2, result = pcall(fn38)
			local visible = text ~= nil or ok2 and result ~= nil

			if os.clock() < (arg._surfQuietUntil or 0) then
				visible = false
			end

			if arg._ghostHolding then
				visible = flag7
			end

			if visible and not arg._ghostHolding then
				text = text and "Leave building" or "Return to surface"
				local label = textButton2:FindFirstChild("Label")

				if label and label.Text ~= text then
					label.Text = text
				end
			end

			if visible ~= flag7 then
				flag7 = visible

				pcall(function()
					textButton2.Visible = visible
				end)
			end

			task.wait(0.5)
		end
	end)

	arg.returnToSurface = returnToSurface

	table.insert(arg.cleanups, function()
		if screenGui2 then
			local v7 = screenGui2
			screenGui2 = nil

			if arg.nukeGui then
				arg.nukeGui(v7)
			else
				pcall(function()
					v7:Destroy()
				end)
			end
		end
	end)

	table.insert(arg.cleanups, function()
		stopViewing2()
	end)
end
