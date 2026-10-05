-- Why do i love gpt 5.6 sol high the reason is below.
-- dsc.gg/oxyenv 

return function(arg)
	local make = arg.make
	local c = arg.C
	local notify = arg.notify
	local track = arg.track
	local players = arg.Players
	local localPlayer = arg.LocalPlayer
	local runService = arg.RunService
	local sectionLabel = arg.sectionLabel
	local noteLabel = arg.noteLabel
	local makeSlider = arg.makeSlider
	local makeToggleRow = arg.makeToggleRow
	local safe = arg.safe
	local players2 = arg.pages.players
	if not players2 then
		return
	end
	local fn = nil
	local fn2 = nil
	local tbl = {}
	local userId = nil
	local str = ""
	local str2 = "distance"
	local tbl2 = {}
	local flag = false
	local str3 = "cops"
	local n = 150
	local tbl3 = {}

	local function fn3(arg2)
		if str3 == "cops" then
			return arg.isPolice(arg2)
		end

		if str3 == "wanted" then
			return arg.wantedOf(arg2) > 0
		end

		if str3 == "pinned" then
			return tbl[arg2.UserId] == true
		end
		return true
	end

	local function fn4(arg2)
		local v = arg.vehicleOfPlayer(arg2)
		if v then
			return v.Name, arg.plateOf(v), true
		end
		local lastVehicleOf = arg.lastVehicleOf and arg.lastVehicleOf(arg2)
		if lastVehicleOf then
			return lastVehicleOf.name, lastVehicleOf.plate, false
		end
		return nil
	end

	local function fn5(arg2, arg3)
		local n2 = arg2 and arg3 and math.clamp(arg2 / math.max(1, arg3), 0, 1) or 1
		if n2 > 0.6 then
			return c.GREEN
		end

		if n2 > 0.3 then
			return c.AMBER or c.ACCENT
		end
		return c.RED
	end

	local function fn6(arg2)
		local v = arg.distanceTo(arg2)
		if not v then
			return "?"
		end

		if v >= 1000 then
			return ("%.1fk"):format(v / 1000)
		end
		return ("%d"):format(v)
	end

	local function fn7(arg2)
		local v, v2 = arg.healthOf(arg2)
		if not v then
			return "?"
		end
		return ("%d%%"):format(math.clamp(math.floor(v / math.max(1, v2) * 100), 0, 100))
	end

	local function fn8()
		local tbl4 = {}

		for _, player in ipairs(players:GetPlayers()) do
			if player ~= localPlayer then
				if str == "" or player.Name:lower():find(str, 1, true) or player.DisplayName:lower():find(str, 1, true) then
					tbl4[#tbl4 + 1] = player
				end
			end
		end

		table.sort(tbl4, function(arg2, arg3)
			local n2 = tbl[arg2.UserId] and 1 or 0
			local n3 = tbl[arg3.UserId] and 1 or 0
			if n2 ~= n3 then
				return n2 > n3
			end

			if str2 == "name" then
				local name = arg3.Name
				return arg2.Name:lower() < name:lower()
			end

			if str2 == "team" then
				local v = arg.teamName(arg2)
				local v2 = arg.teamName(arg3)
				if v ~= v2 then
					return v < v2
				end
				local name = arg3.Name
				return arg2.Name:lower() < name:lower()
			end

			local huge = arg.distanceTo(arg2) or math.huge
			local huge2 = arg.distanceTo(arg3) or math.huge
			if huge == huge2 then
				local name = arg3.Name
				return arg2.Name:lower() < name:lower()
			end
			return huge < huge2
		end)

		return tbl4
	end

	local fn9 = nil

	local TextButton = make("TextButton", {
		Parent = players2,
		LayoutOrder = 0,
		Visible = false,
		Size = UDim2.new(1, 0, 0, 40),
		BackgroundColor3 = c.SURFACE2,
		BackgroundTransparency = 0.25,
		Text = "",
		AutoButtonColor = false,
		BorderSizePixel = 0,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 10), Parent = TextButton })
	make("UIStroke", { Parent = TextButton, Color = c.RED, Transparency = 0.55, Thickness = 1 })

	make("ImageLabel", {
		Parent = TextButton,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 14, 0.5, 0),
		Size = UDim2.fromOffset(16, 16),
		Image = arg.iconId and arg.iconId("eye") or "",
		ImageColor3 = c.RED,
	})

	local TextLabel = make("TextLabel", {
		Parent = TextButton,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 40, 0.5, 0),
		Size = UDim2.new(1, -100, 1, 0),
		Font = Enum.Font.GothamMedium,
		TextSize = 13,
		TextColor3 = c.SUBTEXT,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
		RichText = true,
		Text = "",
	})

	local TextLabel2 = make("TextLabel", {
		Parent = TextButton,
		BackgroundColor3 = c.RED,
		BackgroundTransparency = 0.82,
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -12, 0.5, 0),
		Size = UDim2.fromOffset(52, 24),
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		Text = "Stop",
		TextColor3 = c.RED,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 7), Parent = TextLabel2 })

	track(TextButton.MouseButton1Click:Connect(safe(function()
		if arg.stopViewing then
			arg.stopViewing()
		end
	end)))

	local function fn10(arg2)
		if arg2 then
			TextLabel.Text = "Viewing  <font color=\"#ffffff\"><b>" .. arg2 .. "</b></font>"
			TextButton.Visible = true
		else
			TextButton.Visible = false
		end
	end

	arg.viewWatchers = arg.viewWatchers or {}

	table.insert(arg.viewWatchers, function(arg2)
		fn10(arg2)

		if fn then
			fn()
		end
	end)

	arg.ramWatchers = arg.ramWatchers or {}

	table.insert(arg.ramWatchers, function()
		if fn2 then
			fn2()
		end
	end)

	local getViewing = arg.getViewing and arg.getViewing()

	if getViewing then
		fn10(getViewing.DisplayName or getViewing.Name)
	end

	sectionLabel(players2, "Players", 1)
	local v = arg.makeSearchBox(players2, 2, "search players…")

	arg.makeChoice(players2, nil, 3, {
		{ key = "distance", text = "Nearest" },
		{ key = "name", text = "Name" },
		{ key = "team", text = "Team" },
	}, "distance", function(arg2)
		str2 = arg2
		fn9()
	end)

	local Frame = make("Frame", {
		Parent = players2,
		Size = UDim2.new(1, 0, 0, 300),
		BackgroundColor3 = c.SURFACE2,
		BackgroundTransparency = 0.45,
		BorderSizePixel = 0,
		LayoutOrder = 4,
		ClipsDescendants = true,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = Frame })

	local ScrollingFrame = make("ScrollingFrame", {
		Parent = Frame,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 0,
		ScrollBarImageTransparency = 1,
		ElasticBehavior = Enum.ElasticBehavior.Never,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollingDirection = Enum.ScrollingDirection.Y,
	})

	if arg.listScrollbar then
		arg.listScrollbar(ScrollingFrame, Frame, { inset = 8, right = 4 })
	end

	make("UIListLayout", { Parent = ScrollingFrame, Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder })

	make("UIPadding", {
		Parent = ScrollingFrame,
		PaddingTop = UDim.new(0, 6),
		PaddingBottom = UDim.new(0, 6),
		PaddingLeft = UDim.new(0, 6),
		PaddingRight = UDim.new(0, 6),
	})

	arg.growWithWindow(Frame, 300)

	local function fn11()
		for _, child in ipairs(ScrollingFrame:GetChildren()) do
			if not (child:IsA("UIListLayout") or child:IsA("UIPadding")) then
				child:Destroy()
			end
		end

		table.clear(tbl2)
	end

	local function fn12(arg2, arg3, arg4, arg5, arg6)
		local TextButton2 = make("TextButton", {
			Parent = arg2,
			Size = UDim2.fromOffset(0, arg.IS_MOBILE and 32 or 24),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundColor3 = arg5 or c.SURFACE,
			BackgroundTransparency = 0.15,
			BorderSizePixel = 0,
			Text = "",
			AutoButtonColor = false,
			LayoutOrder = arg4,
		})

		make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = TextButton2 })

		make("UIPadding", {
			Parent = TextButton2,
			PaddingLeft = UDim.new(0, arg.IS_MOBILE and 14 or 10),
			PaddingRight = UDim.new(0, arg.IS_MOBILE and 14 or 10),
		})

		local TextLabel3 = make("TextLabel", {
			Parent = TextButton2,
			Size = UDim2.new(1, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundTransparency = 1,
			Text = arg3,
			Font = Enum.Font.GothamBold,
			TextSize = 11,
			TextColor3 = c.TEXT,
		})

		arg.hover(TextButton2, { BackgroundTransparency = 0.02 })

		TextButton2.MouseButton1Click:Connect(safe(function()
			arg6(TextLabel3)
		end))

		return TextButton2, TextLabel3
	end

	local function fn13(arg2, arg3, arg4)
		local Frame2 = make("Frame", {
			Parent = arg2,
			Size = UDim2.fromOffset(0, 18),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundColor3 = c.SURFACE2,
			BorderSizePixel = 0,
			LayoutOrder = arg4 or 2,
		})

		make("UICorner", { CornerRadius = UDim.new(0, 4), Parent = Frame2 })
		make("UIStroke", { Parent = Frame2, Color = c.BORDER, Thickness = 1, Transparency = 0.2 })
		make("UIPadding", { Parent = Frame2, PaddingLeft = UDim.new(0, 7), PaddingRight = UDim.new(0, 7) })

		make("TextLabel", {
			Parent = Frame2,
			Size = UDim2.new(0, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundTransparency = 1,
			Text = arg3,
			Font = Enum.Font.RobotoMono,
			TextSize = 11,
			TextColor3 = c.TEXT,
		})

		return Frame2
	end

	local function fn14(arg2, arg3, arg4)
		local v2 = arg.vehicleOfPlayer(arg3)
		local v3, v4, v5 = fn4(arg3)
		if not v3 then
			return
		end

		local Frame2 = make("Frame", {
			Parent = arg2,
			Size = UDim2.new(1, -14, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = c.OFF,
			BackgroundTransparency = 0.25,
			BorderSizePixel = 0,
			LayoutOrder = arg4,
		})

		make("UICorner", { CornerRadius = UDim.new(0, 7), Parent = Frame2 })
		make("UIListLayout", { Parent = Frame2, SortOrder = Enum.SortOrder.LayoutOrder })

		make("UIPadding", {
			Parent = Frame2,
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8),
			PaddingTop = UDim.new(0, 6),
			PaddingBottom = UDim.new(0, 6),
		})

		local Frame3 = make("Frame", { Parent = Frame2, Size = UDim2.new(1, 0, 0, 20), BackgroundTransparency = 1, LayoutOrder = 1 })

		make("TextLabel", {
			Parent = Frame3,
			Size = UDim2.new(1, -90, 1, 0),
			BackgroundTransparency = 1,
			Text = v5 and v3 or v3 .. "  ·  last seen",
			Font = Enum.Font.GothamBold,
			TextSize = 11,
			TextColor3 = v5 and c.TEXT or c.SUBTEXT,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
		})

		if v4 then
			local Frame4 = make("Frame", {
				Parent = Frame3,
				Size = UDim2.new(0, 90, 1, 0),
				Position = UDim2.new(1, -90, 0, 0),
				BackgroundTransparency = 1,
			})

			make("UIListLayout", {
				Parent = Frame4,
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Center,
			})

			fn13(Frame4, v4)
		end

		if not (v2 and v5) then
			make("TextLabel", {
				Parent = Frame2,
				Size = UDim2.new(1, 0, 0, 14),
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Text = "Out of range, preview loads when you're closer",
				Font = Enum.Font.Gotham,
				TextSize = 10,
				TextColor3 = c.SUBTEXT,
				TextXAlignment = Enum.TextXAlignment.Left,
			})

			return Frame2
		end

		local ok, result = pcall(function()
			return v2:Clone()
		end)

		if not ok or not result then
			return Frame2
		end

		for _, descendant in ipairs(result:GetDescendants()) do
			if descendant:IsA("Script") or descendant:IsA("LocalScript") or descendant:IsA("ModuleScript") then
				descendant:Destroy()
			elseif descendant:IsA("BasePart") then
				descendant.Anchored = true
			end
		end

		local ViewportFrame = make("ViewportFrame", {
			Parent = Frame2,
			Size = UDim2.new(1, 0, 0, 96),
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			LightColor = Color3.new(1, 1, 1),
			Ambient = Color3.fromRGB(150, 150, 160),
		})

		local camera = Instance.new("Camera")
		camera.FieldOfView = 60
		ViewportFrame.CurrentCamera = camera
		camera.Parent = ViewportFrame
		result.Parent = ViewportFrame
		local boundingBox, v6 = result:GetBoundingBox()
		camera.CFrame = CFrame.lookAt(boundingBox.Position + (Vector3.new(1, 0.5, 1)).Unit * math.max(v6.Magnitude / 2, 4) / math.tan(math.rad(camera.FieldOfView / 2)) * 1.08, boundingBox.Position)
		return Frame2
	end

	local function fn15(arg2, arg3)
		make("UIListLayout", {
			Parent = arg3,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, 5),
			SortOrder = Enum.SortOrder.LayoutOrder,
			Wraps = true,
		})

		fn12(arg3, "Teleport", 1, c.ACCENT, function()
			if arg.tpToPlayer then
				arg.tpToPlayer(arg2)
			else
				notify("Teleport isn't loaded", "warn")
			end
		end)

		local function fn16()
			return (arg.getViewing and arg.getViewing()) == arg2 and "Stop view" or "View"
		end

		local v2, v3 = fn12(arg3, fn16(), 2, nil, function(arg4)
			if (arg.getViewing and arg.getViewing()) == arg2 then
				if arg.stopViewing then
					arg.stopViewing()
				end

				notify("Stopped viewing " .. arg2.DisplayName, "off")
			elseif arg.viewPlayer then
				arg.viewPlayer(arg2)
			end

			arg4.Text = fn16()
		end)

		fn = function()
			if v3 and v3.Parent then
				v3.Text = fn16()
			end
		end

		local function fn17()
			return arg.isFollowing and arg.isFollowing(arg2) and "Stop follow" or "Follow"
		end

		fn12(arg3, fn17(), 6, nil, function(arg4)
			if not arg.followPlayer then
				notify("Vehicle module isn't loaded", "warn")
				return
			end

			if arg.isFollowing and arg.isFollowing(arg2) then
				if arg.stopFollow then
					arg.stopFollow()
				end

				notify("Stopped following " .. arg2.DisplayName, "off")
			else
				arg.followPlayer(arg2)
				local followPlayer = arg.configReg and arg.configReg.followPlayer

				if followPlayer and followPlayer.set then
					pcall(followPlayer.set, true)
				end

				notify("Following " .. arg2.DisplayName, "ok")
			end

			arg4.Text = fn17()
		end)

		local function fn18()
			return arg.getForcedTarget and arg.getForcedTarget() == arg2 and "Unlock aim" or "Lock aim"
		end

		fn12(arg3, fn18(), 3, nil, function(arg4)
			if not (arg.setForcedTarget and arg.toggleLock) then
				return
			end
			local getForcedTarget = arg.getForcedTarget and arg.getForcedTarget()

			if getForcedTarget == arg2 then
				arg.toggleLock()
			else
				if getForcedTarget and arg.toggleLock then
					arg.toggleLock()
				end

				if arg.selectTarget then
					arg.selectTarget(arg2)
				end

				arg.setForcedTarget(arg2)
			end

			arg4.Text = fn18()
		end)

		local v4, v5 = fn12(arg3, "", 4, nil, function(arg4)
			if not arg.toggleWhitelist then
				return
			end
			arg.toggleWhitelist(arg2)
			arg4.Text = arg.isWhitelisted and arg.isWhitelisted(arg2) and "Aim at them" or "Never aim"
		end)

		v5.Text = arg.isWhitelisted and arg.isWhitelisted(arg2) and "Aim at them" or "Never aim"

		local function fn19()
			return arg.ramBusyFor and arg.ramBusyFor(arg2) and "Stop" or "Ram"
		end

		local v6 = nil

		local v7, v8 = fn12(arg3, fn19(), 5, nil, function(arg4)
			if not arg.ramPlayer then
				notify("Vehicle module isn't loaded", "warn")
				return
			end

			if arg.ramActive and arg.ramActive() then
				if arg.cancelRam then
					arg.cancelRam()
				end

				notify("Ram stopped", "off")
				arg4.Text = fn19()
				return
			end

			local v7, v8 = arg.ramPlayer(arg2)

			if not v7 then
				notify(v8 or "Can't ram them", "warn")
			end

			arg4.Text = fn19()

			task.delay(1.5, function()
				pcall(function()
					arg4.Text = fn19()
				end)
			end)
		end)

		fn2 = function()
			if v8 and v8.Parent then
				v8.Text = fn19()
			end

			if v6 and v6.Parent then
				v6.Text = huntText()
			end
		end

		fn12(arg3, "Send car", 7, nil, function()
			if not arg.sendCarTo then
				notify("Vehicle module isn't loaded", "warn")
				return
			end
			local v9, v10 = arg.sendCarTo(arg2)

			if not v9 then
				notify(v10 or "Can't send it", "warn")
			end
		end)

		local function fn20()
			return arg.huntingFor and arg.huntingFor(arg2) and "Stop ramming" or "Keep ramming"
		end

		local v9

		v9, v6 = fn12(arg3, fn20(), 8, nil, function(arg4)
			if not arg.huntPlayer then
				notify("Vehicle module isn't loaded", "warn")
				return
			end

			if arg.huntingFor and arg.huntingFor(arg2) then
				if arg.cancelRam then
					arg.cancelRam()
				end

				notify("Stopped ramming " .. arg2.DisplayName, "off")
				arg4.Text = fn20()
				return
			end

			if arg.ramQuota then
				local ok, result, result2, result3 = pcall(arg.ramQuota)

				if ok and not result3 and result and result2 and result >= result2 then
					if arg.premiumPopup then
						pcall(arg.premiumPopup, ("Unlimited rams (free is %d a day)"):format(result2))
					end

					return
				end
			end

			arg.huntPlayer(arg2)
			notify("Ramming " .. arg2.DisplayName .. " until you stop", "ok")
			arg4.Text = fn20()
		end)

		local v10, v11 = fn12(arg3, "", 9, nil, function()
			tbl[arg2.UserId] = not tbl[arg2.UserId] or nil
			notify(tbl[arg2.UserId] and "Pinned " .. arg2.Name or "Unpinned " .. arg2.Name, tbl[arg2.UserId] and "ok" or "off")
			fn9()
		end)

		v11.Text = tbl[arg2.UserId] and "Unpin" or "Pin"

		fn12(arg3, "Copy name", 10, nil, function()
			local writeClipboard = setclipboard or toclipboard or syn and syn.write_clipboard
			if not writeClipboard then
				notify("Your executor has no clipboard", "warn")
				return
			end
			pcall(writeClipboard, arg2.Name)
			notify("Copied @" .. arg2.Name, "ok")
		end)
	end

	local function fn16(arg2, arg3)
		local flag2 = tbl[arg2.UserId] == true

		local Frame2 = make("Frame", {
			Parent = ScrollingFrame,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = c.SURFACE2,
			BorderSizePixel = 0,
			LayoutOrder = arg3,
		})

		make("UICorner", { CornerRadius = UDim.new(0, 7), Parent = Frame2 })

		make("UIListLayout", {
			Parent = Frame2,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
		})

		if flag2 then
			make("UIStroke", { Color = c.ACCENT, Thickness = 1, Transparency = 0.55, Parent = Frame2 })
		end

		local TextButton2 = make("TextButton", {
			Parent = Frame2,
			Size = UDim2.new(1, 0, 0, 40),
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false,
			LayoutOrder = 1,
		})

		local Frame3 = make("Frame", {
			Parent = TextButton2,
			Size = UDim2.fromOffset(3, 24),
			Position = UDim2.fromOffset(7, 8),
			BackgroundColor3 = arg.teamColor(arg2),
			BorderSizePixel = 0,
		})

		make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Frame3 })

		local ImageLabel = make("ImageLabel", {
			Parent = TextButton2,
			Size = UDim2.fromOffset(26, 26),
			Position = UDim2.fromOffset(16, 7),
			BackgroundColor3 = c.OFF,
			BorderSizePixel = 0,
			Image = ("rbxthumb://type=AvatarHeadShot&id=%d&w=48&h=48"):format(arg2.UserId),
		})

		make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = ImageLabel })
		local Frame4 = nil
		local friends = arg.iconId and (arg.iconId("friends") or arg.iconId("user"))

		if friends then
			Frame4 = make("Frame", {
				Parent = TextButton2,
				Size = UDim2.fromOffset(10, 10),
				Position = UDim2.fromOffset(33, 24),
				BackgroundColor3 = c.SURFACE2,
				BorderSizePixel = 0,
				ZIndex = 3,
				Visible = false,
			})

			make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Frame4 })
			make("UIStroke", { Color = c.GREEN, Thickness = 1, Transparency = 0.15, Parent = Frame4 })

			make("ImageLabel", {
				Parent = Frame4,
				Size = UDim2.fromOffset(6, 6),
				Position = UDim2.fromOffset(2, 2),
				BackgroundTransparency = 1,
				Image = friends,
				ImageColor3 = c.GREEN,
				ZIndex = 3,
				ScaleType = Enum.ScaleType.Fit,
			})
		end

		make("TextLabel", {
			Parent = TextButton2,
			Size = UDim2.new(1, -178, 0, 15),
			Position = UDim2.fromOffset(50, 4),
			BackgroundTransparency = 1,
			Text = arg2.DisplayName,
			Font = Enum.Font.GothamBold,
			TextSize = 12,
			TextColor3 = c.TEXT,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
		})

		local TextLabel3 = make("TextLabel", {
			Parent = TextButton2,
			Size = UDim2.new(1, -178, 0, 13),
			Position = UDim2.fromOffset(50, 20),
			BackgroundTransparency = 1,
			Text = "",
			Font = Enum.Font.Gotham,
			TextSize = 10,
			TextColor3 = c.SUBTEXT,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
		})

		if flag2 then
			local pushpin = arg.iconId and (arg.iconId("pushpin") or arg.iconId("pin"))

			if pushpin then
				make("ImageLabel", {
					Parent = TextButton2,
					Size = UDim2.fromOffset(15, 15),
					Position = UDim2.fromOffset(9, 1),
					BackgroundTransparency = 1,
					Image = pushpin,
					ImageColor3 = c.ACCENT,
					ZIndex = 3,
					ScaleType = Enum.ScaleType.Fit,
					Rotation = -28,
				})
			end
		end

		local TextLabel4 = make("TextLabel", {
			Parent = TextButton2,
			Size = UDim2.fromOffset(120, 15),
			Position = UDim2.new(1, -128, 0, 5),
			BackgroundTransparency = 1,
			Text = "",
			Font = Enum.Font.GothamBold,
			TextSize = 11,
			TextColor3 = c.TEXT,
			TextXAlignment = Enum.TextXAlignment.Right,
		})

		local TextLabel5 = make("TextLabel", {
			Parent = TextButton2,
			Size = UDim2.fromOffset(120, 13),
			Position = UDim2.new(1, -128, 0, 21),
			BackgroundTransparency = 1,
			Text = "",
			Font = Enum.Font.GothamBold,
			TextSize = 10,
			TextColor3 = c.SUBTEXT,
			TextXAlignment = Enum.TextXAlignment.Right,
		})

		local function fn17()
			local v2 = arg.teamName(arg2)
			local v3 = arg.wantedOf(arg2)
			local v4, v5, v6 = fn4(arg2)
			local tbl4 = { v2 }

			if v3 > 0 then
				tbl4[#tbl4 + 1] = ("wanted %d"):format(v3)
			end

			if v4 then
				tbl4[#tbl4 + 1] = (v5 and v4 .. "  " .. v5 or v4) .. (v6 and "" or " (last seen)")
			end

			TextLabel3.Text = table.concat(tbl4, "  ·  ")
			TextLabel4.Text = fn6(arg2) .. " studs"
			local v7, v8 = arg.healthOf(arg2)
			TextLabel5.Text = fn7(arg2)
			TextLabel5.TextColor3 = v7 and fn5(v7, v8) or c.SUBTEXT

			if Frame4 then
				Frame4.Visible = arg.isFriend and arg.isFriend(arg2) or false
			end

			if ramLbl then
				local v9 = ramText()

				if ramLbl.Text ~= v9 then
					ramLbl.Text = v9
				end
			end

			if huntLbl then
				local v9 = huntText()

				if huntLbl.Text ~= v9 then
					huntLbl.Text = v9
				end
			end
		end

		fn17()
		arg.hover(TextButton2, {}, { t = 0.12, extra = { { Frame2, { BackgroundTransparency = 0.15 } } } })

		if userId == arg2.UserId then
			fn14(Frame2, arg2, 2)

			local Frame5 = make("Frame", {
				Parent = Frame2,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				LayoutOrder = 3,
			})

			make("UIPadding", {
				Parent = Frame5,
				PaddingTop = UDim.new(0, 8),
				PaddingBottom = UDim.new(0, 8),
				PaddingLeft = UDim.new(0, 7),
				PaddingRight = UDim.new(0, 7),
			})

			fn15(arg2, Frame5)
		end

		TextButton2.MouseButton1Click:Connect(safe(function()
			userId = userId ~= arg2.UserId and arg2.UserId or nil
			fn9()
		end))

		tbl2[arg2.UserId] = { card = Frame2, paint = fn17 }
	end

	fn9 = function(arg2)
		if not (arg2 or players2.Visible) then
			return
		end
		fn11()
		local v2 = fn8()

		for i, v3 in ipairs(v2) do
			fn16(v3, i)
		end

		if #v2 == 0 then
			make("TextLabel", {
				Parent = ScrollingFrame,
				Size = UDim2.new(1, 0, 0, 20),
				BackgroundTransparency = 1,
				Text = str == "" and "nobody else here" or "no matches",
				Font = Enum.Font.Gotham,
				TextSize = 11,
				TextColor3 = c.SUBTEXT,
				TextXAlignment = Enum.TextXAlignment.Center,
				LayoutOrder = 1,
			})
		end
	end

	track(v:GetPropertyChangedSignal("Text"):Connect(safe(function()
		str = v.Text:lower()
		fn9()
	end)))

	sectionLabel(players2, "Watch", 5)

	makeToggleRow(players2, "bell", "Proximity Alert", "Tell me when someone on a team gets close.", 6, false, function(arg2)
		flag = arg2
		table.clear(tbl3)
	end, "playerWatch", function(arg2)
		arg.makeChoice(arg2, "Watch for", 1, {
			{ key = "cops", text = "Cops" },
			{ key = "wanted", text = "Wanted" },
			{ key = "pinned", text = "Pinned" },
			{ key = "all", text = "Anyone" },
		}, "cops", function(arg3)
			str3 = arg3
			table.clear(tbl3)
		end, "playerWatchTeam")

		makeSlider(arg2, "Distance", 2, 30, 500, 150, function(arg3)
			n = arg3
		end, true, "playerWatchDist")
	end)

	noteLabel(players2, "Pinned players sort to the top of the list and stay there.", 7)

	track(runService.Heartbeat:Connect(safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(x)x=x or 0;if m[1][7][m[1][6]]then m[2][7][m[2][6]]+=x;if m[2][7][m[2][6]]>=0.5 then m[2][7][m[2][6]]=0;local M=os.clock();for _,r in ipairs(m[3]:GetPlayers())do if r~=m[4]and(m[5][7][m[5][6]](r))then _=m[6].distanceTo(r);if _ and _<=m[7][7][m[7][6]]then if not m[8][r.UserId]or M-m[8][r.UserId]>20 then m[8][r.UserId]=M;m[9](("%s is %d studs away"):format(r.DisplayName,math.floor(_)),"warn");end;elseif _ and _>m[7][7][m[7][6]]*1.35 then m[8][r.UserId]=nil;end;end;end;end;end;if not m[10].Visible then return;end;m[11][7][m[11][6]]+=x;if m[11][7][m[11][6]]<(m[12][7][m[12][6]]and m[13]or m[14])then return;end;m[11][7][m[11][6]]=0;local M=0;for _,_ in pairs(m[15])do M+=1;pcall(_.paint);end;x=m[16][7][m[16][6]]();if not m[12][7][m[12][6]]then for _,r in ipairs(x)do local l=m[15][r.UserId];if l and l.card.LayoutOrder~=_ then l.card.LayoutOrder=_;end;end;end;if M~=#x then m[17][7][m[17][6]]();end;end)))

	arg.onPlayersTabOpened = function()
		fn9(true)
	end

	arg.deferS(function()
		task.wait(1.5)
		fn9(true)
	end)

	local flag2 = false

	local function fn17()
		if flag2 then
			return
		end
		flag2 = true

		task.delay(0.6, safe(function()
			flag2 = false
			fn9(false)
		end))
	end

	track(players.PlayerAdded:Connect(safe(fn17)))
	arg.friendWatchers = arg.friendWatchers or {}

	table.insert(arg.friendWatchers, function()
		fn17()
	end)

	track(players.PlayerRemoving:Connect(safe(function(arg2)
		tbl2[arg2.UserId] = nil
		tbl[arg2.UserId] = nil
		tbl3[arg2.UserId] = nil

		if userId == arg2.UserId then
			userId = nil
		end

		fn17()
	end)))

	table.insert(arg.cleanups, function()
		flag = false
		table.clear(tbl2)
	end)
end
