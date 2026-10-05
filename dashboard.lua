-- Why do i love gpt 5.6 sol high the reason is below.
-- dsc.gg/oxyenv 

return function(arg)
	local make = arg.make
	local c = arg.C
	local track = arg.track
	local sectionLabel = arg.sectionLabel
	local localPlayer = arg.LocalPlayer
	local players = arg.Players
	local runService = arg.RunService
	local makeTween = arg.makeTween
	local dashboard = arg.pages.dashboard
	if not dashboard then
		return
	end
	local vx = arg.VX or {}
	local now = os.clock()
	local num = tonumber(vx.now)

	local function fn()
		return num and num + os.clock() - now or os.time()
	end

	local function fn2(arg2)
		return arg.iconId and arg.iconId(arg2)
	end

	local color = Color3.fromRGB(251, 191, 36)
	local flag = vx.pm and true or false
	local num2 = tonumber(vx.ke)
	local flag2 = flag and num2 ~= nil and num2 - fn() > 315360000
	local flag3 = num2 ~= nil and num2 - fn() <= 315360000

	local Frame = make("Frame", {
		Parent = dashboard,
		Size = UDim2.new(1, 0, 0, 92),
		BackgroundColor3 = c.SURFACE,
		BorderSizePixel = 0,
		LayoutOrder = 1,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 14), Parent = Frame })
	make("UIStroke", { Color = c.ACCENT, Thickness = 1.2, Transparency = 0.7, Parent = Frame })

	local ImageLabel = make("ImageLabel", {
		Parent = Frame,
		Size = UDim2.fromOffset(54, 54),
		Position = UDim2.fromOffset(16, 19),
		BackgroundColor3 = c.SURFACE2,
		BorderSizePixel = 0,
		ScaleType = Enum.ScaleType.Fit,
	})

	make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = ImageLabel })
	make("UIStroke", { Color = c.ACCENT, Thickness = 1.5, Transparency = 0.45, Parent = ImageLabel })
	ImageLabel.Image = ("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150"):format(localPlayer.UserId)
	local flag4 = tonumber(vx.ls) ~= nil or tonumber(vx.fc) ~= nil

	make("TextLabel", {
		Parent = Frame,
		Size = UDim2.new(1, -200, 0, 13),
		Position = UDim2.fromOffset(82, 20),
		BackgroundTransparency = 1,
		Text = flag4 and "WELCOME BACK" or "WELCOME",
		Font = Enum.Font.GothamBold,
		TextSize = 9,
		TextColor3 = c.ACCENT2,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	make("TextLabel", {
		Parent = Frame,
		Size = UDim2.new(1, -200, 0, 20),
		Position = UDim2.fromOffset(82, 33),
		BackgroundTransparency = 1,
		Text = localPlayer.DisplayName,
		Font = Enum.Font.GothamBold,
		TextSize = 16,
		TextColor3 = c.TEXT,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
	})

	make("TextLabel", {
		Parent = Frame,
		Size = UDim2.new(1, -200, 0, 14),
		Position = UDim2.fromOffset(82, 54),
		BackgroundTransparency = 1,
		Text = "@" .. localPlayer.Name,
		Font = Enum.Font.Gotham,
		TextSize = 11,
		TextColor3 = c.SUBTEXT,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
	})

	local Frame2 = make("Frame", {
		Parent = Frame,
		Size = UDim2.fromOffset(92, 26),
		Position = UDim2.new(1, -108, 0, 22),
		BackgroundColor3 = flag and color or c.SURFACE2,
		BackgroundTransparency = flag and 0.86 or 0,
		BorderSizePixel = 0,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = Frame2 })

	make("UIStroke", {
		Color = flag and color or c.BORDER,
		Thickness = 1,
		Transparency = flag and 0.35 or 0.5,
		Parent = Frame2,
	})

	local v = fn2(flag and "crown" or "user")

	if v then
		make("ImageLabel", {
			Parent = Frame2,
			BackgroundTransparency = 1,
			Image = v,
			ImageColor3 = flag and color or c.SUBTEXT,
			Size = UDim2.fromOffset(12, 12),
			Position = UDim2.new(0, 11, 0.5, -6),
			ScaleType = Enum.ScaleType.Fit,
		})
	end

	make("TextLabel", {
		Parent = Frame2,
		Size = UDim2.new(1, -28, 1, 0),
		Position = UDim2.fromOffset(28, 0),
		BackgroundTransparency = 1,
		Text = flag and "Premium Key" or "Free Key",
		Font = Enum.Font.GothamBold,
		TextSize = 10,
		TextColor3 = flag and color or c.SUBTEXT,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	local TextLabel = make("TextLabel", {
		Parent = Frame,
		Size = UDim2.fromOffset(120, 14),
		Position = UDim2.new(1, -108, 0, 53),
		BackgroundTransparency = 1,
		Text = "",
		Font = Enum.Font.Gotham,
		TextSize = 11,
		TextColor3 = c.SUBTEXT,
		TextXAlignment = Enum.TextXAlignment.Right,
	})

	TextLabel.Size = UDim2.fromOffset(92, 14)

	if flag2 then
		TextLabel.Text = "Never expires"
		TextLabel.TextColor3 = color
		TextLabel.TextTransparency = 0.35
	elseif flag3 then
		local function fn3(arg2)
			if arg2 <= 0 then
				return "Expired"
			end
			local n = math.floor(arg2 / 86400)
			if n >= 1 then
				return n .. (n == 1 and " day left" or " days left")
			end
			local n2 = math.floor(arg2 / 3600)
			local n3 = math.floor(arg2 % 3600 / 60)
			if n2 >= 1 then
				return ("%dh %dm left"):format(n2, n3)
			end
			return ("%dm left"):format(math.max(1, n3))
		end

		local function fn4()
			local n = num2 - fn()
			TextLabel.Text = fn3(n)
			TextLabel.TextColor3 = n > 0 and n < 3600 and c.AMBER or c.SUBTEXT
		end

		fn4()

		track(runService.Heartbeat:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(k)K[1][6][K[1][3]]+=k or 0;if K[1][6][K[1][3]]<20 then return;end;K[1][6][K[1][3]]=0;K[2][6][K[2][3]]();end)))
	end

	local Frame3 = make("Frame", { Parent = dashboard, Size = UDim2.new(1, 0, 0, 62), BackgroundTransparency = 1, LayoutOrder = 2 })

	make("UIListLayout", {
		Parent = Frame3,
		FillDirection = Enum.FillDirection.Horizontal,
		Padding = UDim.new(0, 8),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local n = 0

	local function fn3(arg2, arg3, arg4, arg5)
		n += 1

		local Frame4 = make("Frame", {
			Parent = Frame3,
			Size = UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 0.95,
			BorderSizePixel = 0,
			LayoutOrder = n,
		})

		make("UIFlexItem", { Parent = Frame4, FlexMode = Enum.UIFlexMode.Fill })
		make("UICorner", { CornerRadius = UDim.new(0, 11), Parent = Frame4 })
		make("UIStroke", { Color = c.BORDER, Thickness = 1, Transparency = 0.88, Parent = Frame4 })

		local TextLabel2 = make("TextLabel", {
			Parent = Frame4,
			Size = UDim2.new(1, -24, 0, 22),
			Position = UDim2.fromOffset(13, 12),
			BackgroundTransparency = 1,
			Text = arg4,
			Font = Enum.Font.GothamBold,
			TextSize = 17,
			TextColor3 = arg5 or c.TEXT,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
		})

		local v2 = fn2(arg2)

		if v2 then
			make("ImageLabel", {
				Parent = Frame4,
				BackgroundTransparency = 1,
				Image = v2,
				ImageColor3 = arg5 or c.SUBTEXT,
				Size = UDim2.fromOffset(10, 10),
				Position = UDim2.fromOffset(13, 40),
				ScaleType = Enum.ScaleType.Fit,
			})
		end

		make("TextLabel", {
			Parent = Frame4,
			Size = UDim2.new(1, -40, 0, 12),
			Position = UDim2.fromOffset(v2 and 27 or 13, 39),
			BackgroundTransparency = 1,
			Text = arg3,
			Font = Enum.Font.Gotham,
			TextSize = 10,
			TextColor3 = c.SUBTEXT,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
		})

		return TextLabel2
	end

	local function fn4(arg2)
		local n2 = math.max(0, fn() - arg2)
		if n2 < 90 then
			return "Just now"
		end

		if n2 < 3600 then
			return math.floor(n2 / 60) .. "m ago"
		end

		if n2 < 86400 then
			return math.floor(n2 / 3600) .. "h ago"
		end
		local n3 = math.floor(n2 / 86400)
		if n3 < 7 then
			return n3 .. (n3 == 1 and " day ago" or " days ago")
		end
		local n4 = math.floor(n3 / 7)
		return n4 .. (n4 == 1 and " week ago" or " weeks ago")
	end

	local num3 = tonumber(vx.fc)

	if num3 then
		local n2 = math.max(0, math.floor((fn() - num3) / 86400))
		local str = n2 == 0 and "Day one"

		if not str then
			str = n2 .. (n2 == 1 and " day" or " days")
		end

		fn3("calendar-days", "with vxsans", str, c.ACCENT2)
	end

	local num4 = tonumber(vx.ls)

	if num4 then
		fn3("footprints", "since you last played", fn4(num4), Color3.fromRGB(96, 205, 255))
	elseif tonumber(vx.fc) then
		fn3("footprints", "since you last played", "A while", Color3.fromRGB(96, 205, 255))
	end

	fn3("clock", "this session", "0m", c.GREEN)

	track(runService.Heartbeat:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(k)K[1][6][K[1][3]]+=k or 0;if K[1][6][K[1][3]]<20 or not K[2][6][K[2][3]]then return;end;K[1][6][K[1][3]]=0;k=math.floor((os.clock()-K[3])/60);K[2][6][K[2][3]].Text=k>=60 and(("%dh %dm"):format(math.floor(k/60),k%60))or k.."m";end)))

	local HttpService = game:GetService("HttpService")
	local TeleportService = game:GetService("TeleportService")
	local placeId = game.PlaceId
	local jobId = game.JobId
	local color2 = Color3.fromRGB(59, 158, 255)
	local color3 = Color3.fromRGB(150, 158, 176)
	local color4 = Color3.fromRGB(239, 96, 96)

	local function fn5(arg2)
		if not arg2 or arg2 == "" then
			return ""
		end
		return "#" .. tostring(arg2):gsub("[^%w]", ""):sub(1, 4):upper()
	end

	local function fn6(arg2)
		local team = arg2.Team
		if not team then
			return false
		end
		local str = team.Name:lower()
		return str:find("police") ~= nil or str:find("sheriff") ~= nil or str:find("trooper") ~= nil
	end

	local function fn7(arg2)
		local attribute = arg2:GetAttribute("WantedLevel")

		if attribute == nil then
			attribute = arg2.Character
			attribute = attribute and attribute:GetAttribute("WantedLevel")
		end

		return tonumber(attribute) or 0
	end

	local function fn8()
		local players2 = players:GetPlayers()
		local n2 = 0
		local n3 = 0

		for _, v2 in ipairs(players2) do
			if fn6(v2) then
				n2 += 1
			end

			if fn7(v2) > 0 then
				n3 += 1
			end
		end

		local n4 = #players2
		return n2, math.max(0, n4 - n2 - n3), n3, n4
	end

	local function fn9(arg2)
		local request_ = syn and syn.request or http and http.request or http_request or request

		if request_ then
			local ok, result = pcall(request_, { Url = arg2, Method = "GET" })

			if ok and type(result) == "table" then
				local body = result.Body or result.body
				local statusCode = result.StatusCode or result.status_code or result.Status
				if body then
					return body, tonumber(statusCode) or 200
				end
			end
		end

		local ok, result = pcall(function()
			return game:HttpGet(arg2)
		end)

		if ok then
			return result, 200
		end
		return nil, nil
	end

	local function fn10(arg2)
		local ok = pcall(function()
			TeleportService:TeleportToPlaceInstance(placeId, arg2, localPlayer)
		end)

		if not ok and arg.notify then
			arg.notify("Couldn't jump to that server, try another", "warn")
		end

		return ok
	end

	local str = ("https://games.roblox.com/v1/games/%d/servers/Public"):format(placeId)

	local function fn11(arg2)
		local v2, v3 = fn9(str .. "?limit=100&sortOrder=" .. arg2)
		if v3 == 429 then
			return nil, "rate"
		end

		if not v2 then
			return nil, "blocked"
		end

		if type(v2) == "string" and v2:find("Too many") then
			return nil, "rate"
		end

		local ok, result = pcall(function()
			return HttpService:JSONDecode(v2)
		end)

		if ok and type(result) == "table" and type(result.data) == "table" then
			return result.data
		end
		return nil, "blocked"
	end

	local function fn12()
		local Asc, v2 = fn11("Asc")
		if not Asc then
			return nil, v2
		end
		task.wait(0.15)
		local Desc = fn11("Desc")
		local tbl = {}
		local tbl2 = {}

		local function fn13(arg2)
			if type(arg2) ~= "table" then
				return
			end

			for _, v3 in ipairs(arg2) do
				if v3.id and not tbl[v3.id] then
					tbl[v3.id] = true
					tbl2[#tbl2 + 1] = v3
				end
			end
		end

		fn13(Asc)
		fn13(Desc)
		return tbl2
	end

	sectionLabel(dashboard, "Server hop", 4)

	local Frame4 = make("Frame", {
		Parent = dashboard,
		Size = UDim2.new(1, 0, 0, 76),
		BackgroundColor3 = c.SURFACE,
		BorderSizePixel = 0,
		LayoutOrder = 5,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 12), Parent = Frame4 })
	make("UIStroke", { Color = c.BORDER, Thickness = 1, Transparency = 0.88, Parent = Frame4 })

	local Frame5 = make("Frame", {
		Parent = Frame4,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 0, 12),
		Position = UDim2.fromOffset(14, 12),
		BackgroundTransparency = 1,
	})

	make("UIListLayout", {
		Parent = Frame5,
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, 8),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	make("TextLabel", {
		Parent = Frame5,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 0, 12),
		BackgroundTransparency = 1,
		Text = "THIS SERVER",
		Font = Enum.Font.GothamBold,
		TextSize = 9,
		TextColor3 = c.ACCENT2,
		TextXAlignment = Enum.TextXAlignment.Left,
		LayoutOrder = 1,
	})

	make("TextLabel", {
		Parent = Frame5,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 0, 12),
		BackgroundTransparency = 1,
		Text = fn5(jobId),
		Font = Enum.Font.GothamBold,
		TextSize = 9,
		TextColor3 = c.SUBTEXT,
		TextXAlignment = Enum.TextXAlignment.Left,
		LayoutOrder = 2,
	})

	local TextLabel2 = make("TextLabel", {
		Parent = Frame4,
		Size = UDim2.new(1, -190, 0, 12),
		Position = UDim2.fromOffset(176, 12),
		BackgroundTransparency = 1,
		Text = "",
		Font = Enum.Font.Gotham,
		TextSize = 11,
		TextColor3 = c.SUBTEXT,
		TextXAlignment = Enum.TextXAlignment.Right,
		TextTruncate = Enum.TextTruncate.AtEnd,
	})

	local Frame6 = make("Frame", {
		Parent = Frame4,
		Size = UDim2.new(1, -28, 0, 10),
		Position = UDim2.fromOffset(14, 32),
		BackgroundColor3 = c.SURFACE2,
		BorderSizePixel = 0,
		ClipsDescendants = true,
	})

	make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Frame6 })

	local Frame7 = make("Frame", {
		Parent = Frame6,
		Size = UDim2.new(0, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = color2,
		BorderSizePixel = 0,
	})

	local Frame8 = make("Frame", {
		Parent = Frame6,
		Size = UDim2.new(0, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = color3,
		BorderSizePixel = 0,
	})

	local Frame9 = make("Frame", {
		Parent = Frame6,
		Size = UDim2.new(0, 0, 1, 0),
		Position = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = color4,
		BorderSizePixel = 0,
	})

	local function fn13(arg2, arg3, arg4)
		local Frame10 = make("Frame", {
			Parent = Frame4,
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(0, 0, 0, 14),
			Position = UDim2.new(arg2, arg3, 0, 52),
			AnchorPoint = Vector2.new(arg2, 0),
			BackgroundTransparency = 1,
		})

		make("UIListLayout", {
			Parent = Frame10,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 6),
			SortOrder = Enum.SortOrder.LayoutOrder,
		})

		local Frame11 = make("Frame", {
			Parent = Frame10,
			Size = UDim2.fromOffset(7, 7),
			BackgroundColor3 = arg4,
			BorderSizePixel = 0,
			LayoutOrder = 1,
		})

		make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Frame11 })

		return make("TextLabel", {
			Parent = Frame10,
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(0, 0, 0, 14),
			BackgroundTransparency = 1,
			Text = "",
			Font = Enum.Font.GothamBold,
			TextSize = 11,
			TextColor3 = c.TEXT,
			TextXAlignment = Enum.TextXAlignment.Left,
			LayoutOrder = 2,
		})
	end

	local v2 = fn13(0, 14, color2)
	local v3 = fn13(0.5, 0, color3)
	local v4 = fn13(1, -14, color4)

	local function fn14()
		local v5, v6, v7, v8 = fn8()
		TextLabel2.Text = v8 .. (v8 == 1 and " player" or " players")
		v2.Text = v5 .. " Police"
		v3.Text = v6 .. " Civilians"
		v4.Text = v7 .. " Crims"
		local n2 = math.max(1, v8)
		local n3 = v5 / n2
		local n4 = v6 / n2
		makeTween(Frame7, 0.3, { Size = UDim2.new(n3, 0, 1, 0) }):Play()
		makeTween(Frame8, 0.3, { Position = UDim2.new(n3, 0, 0, 0), Size = UDim2.new(n4, 0, 1, 0) }):Play()
		makeTween(Frame9, 0.3, { Position = UDim2.new(n3 + n4, 0, 0, 0), Size = UDim2.new(1 - n3 - n4, 0, 1, 0) }):Play()
	end

	fn14()

	local function fn15()
		if dashboard.Visible then
			fn14()
		end
	end

	track(players.PlayerAdded:Connect(arg.safe(fn15)))
	track(players.PlayerRemoving:Connect(arg.safe(fn15)))

	arg.spawnS(function()
		while dashboard.Parent do
			task.wait(2.5)

			if dashboard.Visible then
				pcall(fn14)
			end
		end
	end)

	local Frame10 = make("Frame", { Parent = dashboard, Size = UDim2.new(1, 0, 0, 38), BackgroundTransparency = 1, LayoutOrder = 6 })

	make("UIListLayout", {
		Parent = Frame10,
		FillDirection = Enum.FillDirection.Horizontal,
		Padding = UDim.new(0, 8),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local TextButton = make("TextButton", {
		Parent = Frame10,
		Size = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = c.ACCENT,
		BorderSizePixel = 0,
		Text = "",
		AutoButtonColor = false,
		LayoutOrder = 1,
	})

	make("UIFlexItem", { Parent = TextButton, FlexMode = Enum.UIFlexMode.Fill })
	make("UICorner", { CornerRadius = UDim.new(0, 9), Parent = TextButton })

	local Frame11 = make("Frame", {
		Parent = TextButton,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 1, 0),
		Position = UDim2.fromScale(0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundTransparency = 1,
	})

	make("UIListLayout", {
		Parent = Frame11,
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, 8),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local shuffle = fn2("shuffle")

	if shuffle then
		make("ImageLabel", {
			Parent = Frame11,
			BackgroundTransparency = 1,
			Image = shuffle,
			ImageColor3 = Color3.new(1, 1, 1),
			Size = UDim2.fromOffset(15, 15),
			ScaleType = Enum.ScaleType.Fit,
			LayoutOrder = 1,
		})
	end

	make("TextLabel", {
		Parent = Frame11,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 0, 16),
		BackgroundTransparency = 1,
		Text = "Join new server",
		Font = Enum.Font.GothamBold,
		TextSize = 13,
		TextColor3 = Color3.new(1, 1, 1),
		TextXAlignment = Enum.TextXAlignment.Left,
		LayoutOrder = 2,
	})

	track(TextButton.MouseEnter:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()K[1](K[2],0.12,{BackgroundColor3=K[3].ACCENT2}):Play();end)))

	track(TextButton.MouseLeave:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()K[1](K[2],0.12,{BackgroundColor3=K[3].ACCENT}):Play();end)))

	local TextButton2 = make("TextButton", {
		Parent = Frame10,
		Size = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 0.95,
		BorderSizePixel = 0,
		Text = "",
		AutoButtonColor = false,
		LayoutOrder = 2,
	})

	make("UIFlexItem", { Parent = TextButton2, FlexMode = Enum.UIFlexMode.Fill })
	make("UICorner", { CornerRadius = UDim.new(0, 9), Parent = TextButton2 })
	make("UIStroke", { Color = c.BORDER, Thickness = 1, Transparency = 0.85, Parent = TextButton2 })

	local Frame12 = make("Frame", {
		Parent = TextButton2,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 1, 0),
		Position = UDim2.fromScale(0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundTransparency = 1,
	})

	make("UIListLayout", {
		Parent = Frame12,
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, 8),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local v5 = fn2("repeat")

	if v5 then
		make("ImageLabel", {
			Parent = Frame12,
			BackgroundTransparency = 1,
			Image = v5,
			ImageColor3 = c.SUBTEXT,
			Size = UDim2.fromOffset(15, 15),
			ScaleType = Enum.ScaleType.Fit,
			LayoutOrder = 1,
		})
	end

	make("TextLabel", {
		Parent = Frame12,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 0, 16),
		BackgroundTransparency = 1,
		Text = "Rejoin",
		Font = Enum.Font.GothamBold,
		TextSize = 13,
		TextColor3 = c.SUBTEXT,
		TextXAlignment = Enum.TextXAlignment.Left,
		LayoutOrder = 2,
	})

	track(TextButton2.MouseEnter:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()K[1](K[2],0.12,{BackgroundTransparency=0.9}):Play();K[1](K[3],0.12,{Transparency=0.6}):Play();K[4].TextColor3=K[5].TEXT;if K[6][6][K[6][3]]then K[6][6][K[6][3]].ImageColor3=K[5].TEXT;end;end)))

	track(TextButton2.MouseLeave:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()K[1](K[2],0.12,{BackgroundTransparency=0.95}):Play();K[1](K[3],0.12,{Transparency=0.85}):Play();K[4].TextColor3=K[5].SUBTEXT;if K[6][6][K[6][3]]then K[6][6][K[6][3]].ImageColor3=K[5].SUBTEXT;end;end)))

	track(TextButton2.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()if K[1][6][K[1][3]]then return;end;K[1][6][K[1][3]]=true;K[2].Text="Rejoining";if K[3].notify then K[3].notify("Rejoining this server","info");end;if not pcall(function()K[4]:TeleportToPlaceInstance(K[5],K[6],K[7]);end)then K[1][6][K[1][3]]=false;K[2].Text="Rejoin";if K[3].notify then K[3].notify("Could not rejoin, try again","warn");end;end;end)))

	local TextButton3 = make("TextButton", {
		Parent = Frame10,
		Size = UDim2.fromOffset(38, 38),
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 0.95,
		BorderSizePixel = 0,
		Text = "",
		AutoButtonColor = false,
		LayoutOrder = 3,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 9), Parent = TextButton3 })
	local UIStroke = make("UIStroke", { Color = c.BORDER, Thickness = 1, Transparency = 0.85, Parent = TextButton3 })
	local v6 = fn2("rotate-cw")
	local ImageLabel2 = nil

	if v6 then
		ImageLabel2 = make("ImageLabel", {
			Parent = TextButton3,
			BackgroundTransparency = 1,
			Image = v6,
			ImageColor3 = c.SUBTEXT,
			Size = UDim2.fromOffset(15, 15),
			Position = UDim2.new(0.5, -7.5, 0.5, -7.5),
			ScaleType = Enum.ScaleType.Fit,
		})
	else
		make("TextLabel", {
			Parent = TextButton3,
			BackgroundTransparency = 1,
			Text = "↻",
			Font = Enum.Font.GothamBold,
			TextSize = 16,
			TextColor3 = c.SUBTEXT,
			Size = UDim2.new(1, 0, 1, 0),
		})
	end

	arg.hover(TextButton3, { BackgroundTransparency = 0.9 }, { extra = { { UIStroke, { Transparency = 0.6 } }, { ImageLabel2, { ImageColor3 = c.TEXT } } } })

	track(TextButton.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()if K[1][6][K[1][3]]then return;end;K[1][6][K[1][3]]=true;if K[2].notify then K[2].notify("Finding a fresh server\226\128\166","info");end;K[2].spawnS(function()local k=K[3][6][K[3][3]]();if not k then task.wait(1);k=(K[3][6][K[3][3]]());end;K[1][6][K[1][3]]=false;if not k then if K[2].notify then K[2].notify("Couldn't reach the server list, try again","warn");end;return;end;local o={};for F,F in ipairs(k)do if F.id~=K[4]and(tonumber(F.playing)or 0)<(tonumber(F.maxPlayers)or 0)then o[#o+1]=F;end;end;if#o>0 then K[5][6][K[5][3]](o[math.random(#o)].id);elseif K[2].notify then K[2].notify("No other open servers right now","info");end;end);end)))

	track(TextButton3.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()if K[1][6][K[1][3]]then K[2](K[1][6][K[1][3]],0.4,{Rotation=K[1][6][K[1][3]].Rotation+180}):Play();end;K[3][6][K[3][3]](true);end)))

	local v7 = nil
	local str2 = "fewest"
	local n2 = 1
	local n3 = 6
	local tbl = {}
	local fn16 = nil

	local Frame13 = make("Frame", {
		Parent = dashboard,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = 8,
	})

	make("UIListLayout", { Parent = Frame13, Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder })
	local Frame14 = make("Frame", { Parent = Frame13, Size = UDim2.new(1, 0, 0, 12), BackgroundTransparency = 1, LayoutOrder = 1 })

	make("TextLabel", {
		Parent = Frame14,
		Size = UDim2.new(0, 120, 1, 0),
		BackgroundTransparency = 1,
		Text = "LIVE SERVERS",
		Font = Enum.Font.GothamBold,
		TextSize = 9,
		TextColor3 = c.ACCENT2,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	local TextLabel3 = make("TextLabel", {
		Parent = Frame14,
		Size = UDim2.new(1, -124, 1, 0),
		Position = UDim2.fromOffset(124, 0),
		BackgroundTransparency = 1,
		Text = "Loading…",
		Font = Enum.Font.Gotham,
		TextSize = 11,
		TextColor3 = c.SUBTEXT,
		TextXAlignment = Enum.TextXAlignment.Right,
		TextTruncate = Enum.TextTruncate.AtEnd,
	})

	local Frame15 = make("Frame", { Parent = Frame13, Size = UDim2.new(1, 0, 0, 24), BackgroundTransparency = 1, LayoutOrder = 2 })

	make("UIListLayout", {
		Parent = Frame15,
		FillDirection = Enum.FillDirection.Horizontal,
		Padding = UDim.new(0, 6),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local function fn17()
		for k, v8 in pairs(tbl) do
			local flag5 = k == str2
			v8.BackgroundTransparency = flag5 and 0.12 or 0.95
			v8.TextColor3 = flag5 and Color3.new(1, 1, 1) or c.SUBTEXT
		end
	end

	local function fn18(arg2, arg3, arg4)
		local TextButton4 = make("TextButton", {
			Parent = Frame15,
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = c.ACCENT,
			BackgroundTransparency = 0.95,
			BorderSizePixel = 0,
			Text = arg3,
			Font = Enum.Font.GothamBold,
			TextSize = 11,
			TextColor3 = c.SUBTEXT,
			AutoButtonColor = false,
			LayoutOrder = arg4,
		})

		make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = TextButton4 })
		make("UIPadding", { Parent = TextButton4, PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12) })
		tbl[arg2] = TextButton4

		arg.hover(TextButton4, { BackgroundTransparency = 0.9 }, { when = function()
			return str2 ~= arg2
		end })

		track(TextButton4.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()K[2][6][K[2][3]]=K[1];K[3][6][K[3][3]]=1;K[4][6][K[4][3]]();K[5][6][K[5][3]]();end)))
	end

	fn18("random", "Random", 1)
	fn18("fewest", "Fewest", 2)
	fn18("most", "Most", 3)
	fn17()

	local Frame16 = make("Frame", {
		Parent = Frame13,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = 3,
	})

	make("UIListLayout", { Parent = Frame16, Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder })

	local Frame17 = make("Frame", {
		Parent = Frame13,
		Size = UDim2.new(1, 0, 0, 24),
		Visible = false,
		BackgroundTransparency = 1,
		LayoutOrder = 4,
	})

	make("UIListLayout", {
		Parent = Frame17,
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0, 10),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local function fn19(arg2, arg3)
		local TextButton4 = make("TextButton", {
			Parent = Frame17,
			Size = UDim2.fromOffset(26, 24),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 0.94,
			BorderSizePixel = 0,
			Text = arg2,
			Font = Enum.Font.GothamBold,
			TextSize = 15,
			TextColor3 = c.TEXT,
			AutoButtonColor = false,
			LayoutOrder = arg3,
		})

		make("UICorner", { CornerRadius = UDim.new(0, 7), Parent = TextButton4 })
		arg.hover(TextButton4, { BackgroundTransparency = 0.88 })
		return TextButton4
	end

	local v8 = fn19("‹", 1)

	local TextLabel4 = make("TextLabel", {
		Parent = Frame17,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 1, 0),
		BackgroundTransparency = 1,
		Text = "",
		Font = Enum.Font.Gotham,
		TextSize = 11,
		TextColor3 = c.SUBTEXT,
		LayoutOrder = 2,
	})

	local v9 = fn19("›", 3)

	track(v8.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()if K[1][6][K[1][3]]>1 then K[1][6][K[1][3]]-=1;K[2][6][K[2][3]]();end;end)))

	track(v9.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()K[1][6][K[1][3]]+=1;K[2][6][K[2][3]]();end)))

	local function fn20()
		for _, child in ipairs(Frame16:GetChildren()) do
			if not child:IsA("UIListLayout") then
				child:Destroy()
			end
		end
	end

	local function fn21(arg2)
		fn20()

		make("UIPadding", {
			Parent = make("TextLabel", {
				Parent = Frame16,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Text = arg2,
				Font = Enum.Font.Gotham,
				TextSize = 12,
				TextColor3 = c.SUBTEXT,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextWrapped = true,
				LayoutOrder = 1,
			}),
			PaddingTop = UDim.new(0, 4),
			PaddingBottom = UDim.new(0, 4),
		})
	end

	local function fn22(arg2, arg3)
		local n4 = tonumber(arg2.playing) or 0
		local n5 = tonumber(arg2.maxPlayers) or 0
		local flag5 = arg2.id == jobId

		local Frame18 = make("Frame", {
			Parent = Frame16,
			Size = UDim2.new(1, 0, 0, 40),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 0.95,
			BorderSizePixel = 0,
			LayoutOrder = arg3,
		})

		make("UICorner", { CornerRadius = UDim.new(0, 9), Parent = Frame18 })

		make("UIStroke", {
			Color = flag5 and c.ACCENT or c.BORDER,
			Thickness = 1,
			Transparency = flag5 and 0.5 or 0.9,
			Parent = Frame18,
		})

		make("TextLabel", {
			Parent = Frame18,
			Size = UDim2.fromOffset(58, 16),
			Position = UDim2.fromOffset(14, 5),
			BackgroundTransparency = 1,
			Text = n4 .. "/" .. n5,
			Font = Enum.Font.GothamBold,
			TextSize = 13,
			TextColor3 = c.TEXT,
			TextXAlignment = Enum.TextXAlignment.Left,
		})

		make("TextLabel", {
			Parent = Frame18,
			Size = UDim2.fromOffset(58, 12),
			Position = UDim2.fromOffset(14, 22),
			BackgroundTransparency = 1,
			Text = fn5(arg2.id),
			Font = Enum.Font.GothamBold,
			TextSize = 9,
			TextColor3 = c.SUBTEXT,
			TextXAlignment = Enum.TextXAlignment.Left,
		})

		local Frame19 = make("Frame", {
			Parent = Frame18,
			Size = UDim2.new(1, -232, 0, 6),
			Position = UDim2.fromOffset(82, 17),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 0.86,
			BorderSizePixel = 0,
		})

		make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Frame19 })

		local Frame20 = make("Frame", {
			Parent = Frame19,
			Size = UDim2.new(n5 > 0 and math.clamp(n4 / n5, 0, 1) or 0, 0, 1, 0),
			BackgroundColor3 = c.ACCENT,
			BorderSizePixel = 0,
		})

		make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Frame20 })

		if arg2.ping then
			make("TextLabel", {
				Parent = Frame18,
				Size = UDim2.new(0, 60, 1, 0),
				Position = UDim2.new(1, -140, 0, 0),
				BackgroundTransparency = 1,
				Text = math.floor(tonumber(arg2.ping) or 0) .. " ms",
				Font = Enum.Font.Gotham,
				TextSize = 11,
				TextColor3 = c.SUBTEXT,
				TextXAlignment = Enum.TextXAlignment.Right,
			})
		end

		if flag5 then
			make("TextLabel", {
				Parent = Frame18,
				Size = UDim2.new(0, 64, 1, 0),
				Position = UDim2.new(1, -78, 0, 0),
				BackgroundTransparency = 1,
				Text = "Current",
				Font = Enum.Font.GothamBold,
				TextSize = 11,
				TextColor3 = c.ACCENT2,
				TextXAlignment = Enum.TextXAlignment.Right,
			})
		else
			local TextButton4 = make("TextButton", {
				Parent = Frame18,
				Size = UDim2.fromOffset(58, 26),
				Position = UDim2.new(1, -68, 0.5, -13),
				BackgroundColor3 = c.ACCENT,
				BorderSizePixel = 0,
				Text = "Join",
				Font = Enum.Font.GothamBold,
				TextSize = 12,
				TextColor3 = Color3.new(1, 1, 1),
				AutoButtonColor = false,
			})

			make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = TextButton4 })

			track(TextButton4.MouseEnter:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()K[1](K[2],0.12,{BackgroundColor3=K[3].ACCENT2}):Play();end)))

			track(TextButton4.MouseLeave:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()K[1](K[2],0.12,{BackgroundColor3=K[3].ACCENT}):Play();end)))

			track(TextButton4.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()K[1].Text="\226\128\166";K[2][6][K[2][3]](K[3].id);end)))
		end
	end

	local function fn23(arg2)
		return (tonumber(arg2.playing) or 0) < (tonumber(arg2.maxPlayers) or 0)
	end

	fn16 = function()
		fn20()
		if not v7 then
			Frame17.Visible = false
			return
		end
		local tbl2 = {}

		for _, v10 in ipairs(v7) do
			if fn23(v10) then
				tbl2[#tbl2 + 1] = v10
			end
		end

		table.sort(tbl2, function(arg2, arg3)
			if str2 == "random" then
				return (arg2._rk or 0) < (arg3._rk or 0)
			end
			local n4 = tonumber(arg2.playing) or 0
			local n5 = tonumber(arg3.playing) or 0
			if str2 == "most" then
				return n4 > n5
			end
			return n4 < n5
		end)

		if #tbl2 == 0 then
			TextLabel3.Text = "0 servers"
			Frame17.Visible = false
			fn21("No open servers right now. Tap refresh to try again.")
			return
		end

		local n4 = math.max(1, math.ceil(#tbl2 / n3))
		n2 = math.clamp(n2, 1, n4)
		TextLabel3.Text = #tbl2 .. (#tbl2 == 1 and " server" or " servers")
		local n5 = (n2 - 1) * n3

		for i = n5 + 1, math.min(n5 + n3, #tbl2) do
			fn22(tbl2[i], i)
		end

		Frame17.Visible = n4 > 1

		if n4 > 1 then
			TextLabel4.Text = "Page " .. n2 .. " / " .. n4
			v8.TextTransparency = n2 <= 1 and 0.6 or 0
			v9.TextTransparency = n2 >= n4 and 0.6 or 0
		end
	end

	local function fn24(arg2, arg3)
		if not arg2 then
			v7 = nil
			Frame17.Visible = false
			TextLabel3.Text = "Offline"
			fn21(arg3 == "rate" and "Roblox is rate-limiting the server list. Wait a few seconds, then tap refresh." or "Couldn't load the server list. Tap refresh to try again.")
			return
		end

		for _, v10 in ipairs(arg2) do
			v10._rk = math.random()
		end

		v7 = arg2
		n2 = 1
		fn16()
	end

	local flag5 = false
	local n4 = 0

	local function fn25(arg2)
		if flag5 then
			return
		end

		if arg2 and os.clock() - n4 < 2 then
			return
		end
		local now2 = os.clock()
		flag5 = true
		n4 = now2
		TextLabel3.Text = "Loading…"

		arg.spawnS(function()
			local v10, v11 = fn12()

			if not v10 then
				task.wait(v11 == "rate" and 3 or 1)
				v10, v11 = fn12()
			end

			flag5 = false
			if not dashboard.Parent then
				return
			end
			fn24(v10, v11)
		end)
	end

	arg.spawnS(function()
		while dashboard.Parent and not dashboard.Visible do
			task.wait(0.4)
		end

		if dashboard.Parent then
			fn25()
		end
	end)

	if not flag then
		local Frame18 = make("Frame", {
			Parent = dashboard,
			Size = UDim2.new(1, 0, 0, 76),
			BackgroundColor3 = c.ACCENT,
			BackgroundTransparency = 0.9,
			BorderSizePixel = 0,
			LayoutOrder = 3,
		})

		make("UICorner", { CornerRadius = UDim.new(0, 12), Parent = Frame18 })
		make("UIStroke", { Color = c.ACCENT, Thickness = 1, Transparency = 0.55, Parent = Frame18 })
		local gift = fn2("gift")

		if gift then
			make("ImageLabel", {
				Parent = Frame18,
				BackgroundTransparency = 1,
				Image = gift,
				ImageColor3 = c.ACCENT2,
				Size = UDim2.fromOffset(15, 15),
				Position = UDim2.fromOffset(16, 15),
				ScaleType = Enum.ScaleType.Fit,
			})
		end

		make("TextLabel", {
			Parent = Frame18,
			Size = UDim2.new(1, -176, 0, 16),
			Position = UDim2.fromOffset(38, 14),
			BackgroundTransparency = 1,
			Text = "Play free for longer",
			Font = Enum.Font.GothamBold,
			TextSize = 13,
			TextColor3 = c.TEXT,
			TextXAlignment = Enum.TextXAlignment.Left,
		})

		make("TextLabel", {
			Parent = Frame18,
			Size = UDim2.new(1, -176, 0, 36),
			Position = UDim2.fromOffset(38, 32),
			BackgroundTransparency = 1,
			Text = "Collect coins at vxsans.xyz/rewards and swap them for a week of access, or for Premium.",
			Font = Enum.Font.Gotham,
			TextSize = 11,
			TextColor3 = c.SUBTEXT,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextWrapped = true,
		})

		local TextButton4 = make("TextButton", {
			Parent = Frame18,
			Size = UDim2.fromOffset(96, 30),
			Position = UDim2.new(1, -112, 0.5, -15),
			BackgroundColor3 = c.ACCENT,
			BorderSizePixel = 0,
			Text = "Copy link",
			Font = Enum.Font.GothamBold,
			TextSize = 12,
			TextColor3 = Color3.new(1, 1, 1),
			AutoButtonColor = false,
		})

		make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = TextButton4 })

		track(TextButton4.MouseEnter:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()K[1](K[2],0.12,{BackgroundColor3=K[3].ACCENT2}):Play();end)))

		track(TextButton4.MouseLeave:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()K[1](K[2],0.12,{BackgroundColor3=K[3].ACCENT}):Play();end)))

		track(TextButton4.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()local k="https://vxsans.xyz/rewards";local o=setclipboard and(pcall(setclipboard,k))or false;if K[1].notify then K[1].notify(o and"Link copied, open it in your browser"or k,o and"ok"or"info");end;end)))
	end

	local tbl2 = {}

	for _, v10 in ipairs({
		{ key = "silentAim", label = "Silent Aim", icon = "skull" },
		{ key = "aimAssist", label = "Aim Assist", icon = "target" },
		{ master = "espMaster", label = "ESP", icon = "eye" },
		{ key = "speedController", label = "Speed Control", icon = "zap" },
		{ key = "noclip", label = "No Clip", icon = "brick-wall" },
		{ key = "infJump", label = "Infinite Jump", icon = "feather" },
		{ key = "autoAtm", label = "Auto ATM", icon = "banknote" },
		{ key = "autoStealCash", label = "Steal Cash", icon = "banknote" },
	}) do
		local master = v10.master and arg[v10.master] or arg.configReg and arg.configReg[v10.key]

		if master and master.get and master.set then
			tbl2[#tbl2 + 1] = { def = v10, ref = master }
		end
	end

	if #tbl2 > 0 then
		sectionLabel(dashboard, "Quick toggles", 10)

		local Frame18 = make("Frame", {
			Parent = dashboard,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			LayoutOrder = 11,
		})

		make("UIGridLayout", {
			Parent = Frame18,
			CellSize = UDim2.new(0.5, -5, 0, 38),
			CellPadding = UDim2.fromOffset(10, 8),
			SortOrder = Enum.SortOrder.LayoutOrder,
		})

		local tbl3 = {}

		for i, v10 in ipairs(tbl2) do
			local TextButton4 = make("TextButton", {
				Parent = Frame18,
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 0.95,
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				LayoutOrder = i,
			})

			make("UICorner", { CornerRadius = UDim.new(0, 10), Parent = TextButton4 })
			local UIStroke2 = make("UIStroke", { Color = c.BORDER, Thickness = 1, Transparency = 0.88, Parent = TextButton4 })
			local v11 = fn2(v10.def.icon)
			local ImageLabel3 = nil

			if v11 then
				ImageLabel3 = make("ImageLabel", {
					Parent = TextButton4,
					BackgroundTransparency = 1,
					Image = v11,
					ImageColor3 = c.SUBTEXT,
					Size = UDim2.fromOffset(13, 13),
					Position = UDim2.new(0, 12, 0.5, -6.5),
					ScaleType = Enum.ScaleType.Fit,
				})
			end

			make("TextLabel", {
				Parent = TextButton4,
				Size = UDim2.new(1, -60, 1, 0),
				Position = UDim2.fromOffset(33, 0),
				BackgroundTransparency = 1,
				Text = v10.def.label,
				Font = Enum.Font.Gotham,
				TextSize = 12,
				TextColor3 = c.TEXT,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
			})

			local Frame19 = make("Frame", {
				Parent = TextButton4,
				Size = UDim2.fromOffset(8, 8),
				Position = UDim2.new(1, -20, 0.5, -4),
				BackgroundColor3 = c.OFF,
				BorderSizePixel = 0,
			})

			make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Frame19 })
			local flag6 = false

			local function fn26(arg2)
				Frame19.BackgroundColor3 = arg2 and c.ACCENT or c.OFF
				Frame19:SetAttribute("vxBg", arg2 and "accent" or nil)

				if ImageLabel3 then
					ImageLabel3.ImageColor3 = arg2 and c.ACCENT2 or c.SUBTEXT
				end

				local n5 = arg2 and (flag6 and 0.86 or 0.9) or flag6 and 0.9 or 0.95
				arg2 = arg2 and (flag6 and 0.45 or 0.6) or flag6 and 0.7 or 0.88
				makeTween(TextButton4, 0.14, { BackgroundTransparency = n5 }):Play()
				makeTween(UIStroke2, 0.14, { Transparency = arg2 }):Play()
			end

			local function fn27()
				local ok, result = pcall(v10.ref.get)
				return ok and result == true
			end

			local v12 = fn27()
			fn26(v12)

			tbl3[#tbl3 + 1] = function()
				fn26(fn27())
			end

			track(TextButton4.MouseEnter:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()K[1][6][K[1][3]]=true;K[2][6][K[2][3]](K[3][6][K[3][3]]());end)))

			track(TextButton4.MouseLeave:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()K[1][6][K[1][3]]=false;K[2][6][K[2][3]](K[3][6][K[3][3]]());end)))

			track(TextButton4.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()pcall(K[1].ref.set,not K[2][6][K[2][3]]());K[3][6][K[3][3]](K[2][6][K[2][3]]());end)))
		end

		arg.spawnS(function()
			while dashboard.Parent do
				task.wait(0.5)

				if dashboard.Visible then
					for _, v10 in ipairs(tbl3) do
						pcall(v10)
					end
				end
			end
		end)
	end

	sectionLabel(dashboard, "Did you know", 20)

	local Frame18 = make("Frame", {
		Parent = dashboard,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = 21,
	})

	local Frame19 = make("Frame", {
		Parent = Frame18,
		Size = UDim2.new(0, 2, 1, -6),
		Position = UDim2.fromOffset(1, 3),
		BackgroundColor3 = c.ACCENT,
		BackgroundTransparency = 0.35,
		BorderSizePixel = 0,
	})

	make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Frame19 })

	local TextLabel5 = make("TextLabel", {
		Parent = Frame18,
		Size = UDim2.new(1, -18, 0, 0),
		Position = UDim2.fromOffset(16, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Text = "",
		Font = Enum.Font.Gotham,
		TextSize = 12,
		TextColor3 = c.SUBTEXT,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextWrapped = true,
	})

	make("UIPadding", { Parent = TextLabel5, PaddingTop = UDim.new(0, 2), PaddingBottom = UDim.new(0, 4) })

	local tbl3 = {
		{
			key = "silentAim",
			text = "Silent Aim lands every shot on the head, and your camera never moves while it happens.",
		},
		{
			key = "espHealth",
			text = "ESP shows you who is fighting, who is wanted, how much health they have left and more.",
		},
		{ key = "autoAtm", text = "Auto ATM plays the hack minigame for you while you stand there." },
		{ key = "blink", text = "Blink drops you wherever your cursor is pointing." },
		{ key = "autoStealCash", text = "Auto Steal Cash picks up bags and drops near you on its own." },
		{
			key = "defenseMode",
			text = "Defense Mode fights back for you the moment somebody opens fire.",
		},
		{ key = "infStamina", text = "Infinite Stamina means you never stop sprinting." },
		{ key = "noclip", text = "No Clip walks you straight through walls, fences and locked doors." },
		{
			key = nil,
			text = "Click a player through ESP, then press your Lock Target key to keep every shot on them.",
		},
		{ key = nil, text = "Save your setup as a preset in Settings and load it back any time." },
	}

	local function fn26(arg2)
		if not arg2.key then
			return true
		end
		local configReg = arg.configReg and arg.configReg[arg2.key]
		if not (configReg and configReg.get) then
			return true
		end
		local ok, result = pcall(configReg.get)
		return not (ok and result == true)
	end

	local n5 = math.random(1, #tbl3)

	local function fn27()
		for i = 1, #tbl3 do
			n5 = n5 % #tbl3 + 1
			if not fn26(tbl3[n5]) then
				continue
			end
			break
		end

		TextLabel5.Text = tbl3[n5].text
	end

	fn27()

	arg.spawnS(function()
		while dashboard.Parent do
			task.wait(14)

			if dashboard.Visible then
				makeTween(TextLabel5, 0.18, { TextTransparency = 1 }):Play()
				task.wait(0.2)
				fn27()
				makeTween(TextLabel5, 0.22, { TextTransparency = 0 }):Play()
			end
		end
	end)
end
