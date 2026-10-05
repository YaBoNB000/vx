-- Why do i love gpt 5.6 sol high the reason is below.
-- dsc.gg/oxyenv 

return function(arg)
	local make = arg.make
	local makeTween = arg.makeTween
	local c = arg.C
	local track = arg.track
	local replicatedStorage = arg.ReplicatedStorage
	local shop = arg.pages.shop
	local v = nil
	local v2 = nil
	local str = "all"
	local tbl = {}
	local TextButton = nil

	local function fn(arg2)
		local playerFunc = replicatedStorage:FindFirstChild("Remote") and replicatedStorage.Remote:FindFirstChild("PlayerFunc")
		if not playerFunc then
			return false
		end

		return (pcall(function()
			playerFunc:InvokeServer("purchase", arg2)
		end))
	end

	local tbl2 = { ["yellow usb"] = true, ["blue usb"] = true, pocket = true }

	local function fn2(arg2)
		local config = arg2:FindFirstChild("Config")
		if not config then
			return nil
		end
		local ok, result = pcall(require, config)
		if not (ok and type(result) == "table" and type(result.COST) == "number") then
			return nil
		end
		local flag = not result.UNIQUE
		local flag2

		if flag then
			flag2 = result.CATEGORY == "Food" or result.CATEGORY == "Drink"
		else
			flag2 = flag
		end

		if flag2 then
			return math.round(result.COST * 1.2)
		end
		return result.COST
	end

	local function fn3()
		local tbl3 = {}
		local stuff = replicatedStorage:FindFirstChild("Stuff")
		if not stuff then
			return tbl3
		end

		for _, v3 in ipairs({ "Black Market", "Food", "Weapons", "Items" }) do
			local v4 = stuff:FindFirstChild(v3)

			if v4 then
				if v3 == "Items" then
					for _, child in ipairs(v4:GetChildren()) do
						local flag = child:IsA("Model") and not tbl2[child.Name:lower()] and fn2(child)

						if flag then
							table.insert(tbl3, { name = child.Name, instance = child, cat = v3, cost = flag })
						end
					end
				else
					for _, descendant in ipairs(v4:GetDescendants()) do
						local flag = descendant:IsA("Model") and not tbl2[descendant.Name:lower()] and fn2(descendant)

						if flag then
							local name = descendant.Name

							if descendant.Parent and descendant.Parent.Name:match("^%d+$") then
								name = descendant.Parent.Name .. " - " .. descendant.Name
							end

							table.insert(tbl3, { name = name, instance = descendant, cat = v3, cost = flag })
						end
					end
				end
			end
		end

		table.sort(tbl3, function(arg2, arg3)
			return arg2.name < arg3.name
		end)

		return tbl3
	end

	local v3 = arg.makeSearchBox(shop, 1, "search items…")
	local v4 = nil

	arg.makeChoice(shop, nil, 2, {
		{ key = "all", text = "All" },
		{ key = "Weapons", text = "Weapons" },
		{ key = "Black Market", text = "Black Market" },
		{ key = "Food", text = "Food" },
		{ key = "Items", text = "Items" },
	}, "all", function(arg2)
		str = arg2

		if v4 then
			v4()
		end
	end)

	local ScrollingFrame = make("ScrollingFrame", {
		Parent = shop,
		Size = UDim2.new(1, 0, 0, 220),
		BackgroundColor3 = c.SURFACE,
		BorderSizePixel = 0,
		ScrollBarThickness = 4,
		ScrollBarImageColor3 = c.ACCENT,
		CanvasSize = UDim2.new(0, 0, 0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		LayoutOrder = 3,
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

	arg.growWithWindow(ScrollingFrame, 220)

	local tbl3 = {
		{ key = "Weapons", title = "WEAPONS", icon = "crosshair" },
		{ key = "Food", title = "FOOD", icon = "beef" },
		{ key = "Black Market", title = "BLACK MARKET", icon = "glasses" },
		{ key = "Items", title = "ITEMS", icon = "package" },
	}

	local function fn4(arg2, arg3)
		local Frame = make("Frame", { Parent = ScrollingFrame, Size = UDim2.new(1, 0, 0, 20), BackgroundTransparency = 1, LayoutOrder = arg3 })
		local iconId = arg.iconId and arg.iconId(arg2.icon)

		if iconId then
			make("ImageLabel", {
				Parent = Frame,
				BackgroundTransparency = 1,
				Image = iconId,
				ImageColor3 = c.SUBTEXT,
				Size = UDim2.fromOffset(12, 12),
				Position = UDim2.new(0, 0, 0.5, -6),
				ScaleType = Enum.ScaleType.Fit,
			})
		end

		make("TextLabel", {
			Parent = Frame,
			Size = UDim2.new(1, -18, 1, 0),
			Position = UDim2.fromOffset(18, 0),
			BackgroundTransparency = 1,
			Text = arg2.title,
			Font = Enum.Font.GothamBold,
			TextSize = 11,
			TextColor3 = c.SUBTEXT,
			TextXAlignment = Enum.TextXAlignment.Left,
		})
	end

	local function fn5()
		local str2 = v3.Text:lower()

		for _, child in ipairs(ScrollingFrame:GetChildren()) do
			if not (child:IsA("UIListLayout") or child:IsA("UIPadding")) then
				child:Destroy()
			end
		end

		v = nil
		v2 = nil

		if TextButton then
			TextButton.Visible = false
		end

		local n = 0

		for _, v5 in ipairs(tbl3) do
			if str == "all" or str == v5.key then
				local tbl4 = {}

				for _, v6 in ipairs(tbl) do
					if v6.cat == v5.key and (str2 == "" or v6.name:lower():find(str2, 1, true)) then
						table.insert(tbl4, v6)
					end
				end

				if #tbl4 > 0 then
					n += 1
					fn4(v5, n)

					for _, v6 in ipairs(tbl4) do
						n += 1

						local TextButton2 = make("TextButton", {
							Parent = ScrollingFrame,
							Size = UDim2.new(1, 0, 0, 26),
							BackgroundColor3 = c.SURFACE2,
							BorderSizePixel = 0,
							Text = "  " .. v6.name,
							Font = Enum.Font.Gotham,
							TextSize = 11,
							TextColor3 = c.TEXT,
							TextXAlignment = Enum.TextXAlignment.Left,
							AutoButtonColor = false,
							LayoutOrder = n,
						})

						make("UICorner", { CornerRadius = UDim.new(0, 4), Parent = TextButton2 })

						if v6.cost then
							make("TextLabel", {
								Parent = TextButton2,
								Size = UDim2.new(0, 92, 1, 0),
								Position = UDim2.new(1, -100, 0, 0),
								BackgroundTransparency = 1,
								Text = "$" .. tostring(v6.cost),
								Font = Enum.Font.GothamBold,
								TextSize = 11,
								TextColor3 = c.GREEN,
								TextXAlignment = Enum.TextXAlignment.Right,
							})
						end

						track(TextButton2.MouseEnter:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()if l[1][7][l[1][6]]~=l[2]then l[2].BackgroundColor3=l[3].BORDER;end;end)))

						track(TextButton2.MouseLeave:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()if l[1][7][l[1][6]]~=l[2]then l[2].BackgroundColor3=l[3].SURFACE2;end;end)))

						track(TextButton2.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()if l[1][7][l[1][6]]then l[1][7][l[1][6]].BackgroundColor3=l[2].SURFACE2;l[1][7][l[1][6]]:SetAttribute("vxBg",nil);end;l[5][7][l[5][6]]=l[3];l[1][7][l[1][6]]=l[4];l[4].BackgroundColor3=l[2].ACCENT;l[4]:SetAttribute("vxBg","accent");if l[6][7][l[6][6]]then l[6][7][l[6][6]].Visible=l[3].cat=="Weapons";end;end)))
					end
				end
			end
		end
	end

	v4 = fn5
	track(v3:GetPropertyChangedSignal("Text"):Connect(arg.safe(fn5)))
	local Frame = make("Frame", { Parent = shop, Size = UDim2.new(1, 0, 0, 32), BackgroundTransparency = 1, LayoutOrder = 3 })

	make("TextLabel", {
		Parent = Frame,
		Size = UDim2.fromOffset(52, 32),
		BackgroundTransparency = 1,
		Text = "Qty",
		Font = Enum.Font.Gotham,
		TextSize = 12,
		TextColor3 = c.SUBTEXT,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	local TextBox = make("TextBox", {
		Parent = Frame,
		Size = UDim2.fromOffset(60, 28),
		Position = UDim2.fromOffset(48, 2),
		BackgroundColor3 = c.SURFACE2,
		BorderSizePixel = 0,
		Text = "1",
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		TextColor3 = c.TEXT,
		TextXAlignment = Enum.TextXAlignment.Center,
		ClearTextOnFocus = false,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 6), Parent = TextBox })

	local TextButton2 = make("TextButton", {
		Parent = Frame,
		Size = UDim2.new(0, 90, 0, 28),
		Position = UDim2.new(0, 120, 0, 2),
		BackgroundColor3 = c.GREEN,
		BorderSizePixel = 0,
		Text = "Purchase",
		Font = Enum.Font.GothamBold,
		TextSize = 13,
		TextColor3 = Color3.new(1, 1, 1),
		AutoButtonColor = false,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = TextButton2 })

	TextButton = make("TextButton", {
		Parent = Frame,
		Size = UDim2.new(0, 90, 0, 28),
		Position = UDim2.new(0, 214, 0, 2),
		BackgroundColor3 = c.AMBER,
		BorderSizePixel = 0,
		Text = "Refill",
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		TextColor3 = Color3.new(1, 1, 1),
		AutoButtonColor = false,
		Visible = false,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = TextButton })
	make("UIStroke", { Color = c.AMBER2, Thickness = 1, Transparency = 0.5, Parent = TextButton })

	local function fn6(arg2, arg3)
		if arg2 == TextButton and c.AMBER then
		end

		arg2.BackgroundColor3 = arg3 and c.ACCENT or c.RED

		task.delay(0.2, arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()l[1](l[2],0.2,{BackgroundColor3=l[3]}):Play();end))
	end

	arg.hover(TextButton2, { BackgroundColor3 = c.GREEN:Lerp(Color3.new(1, 1, 1), 0.14) })

	track(TextButton2.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()if not l[1][7][l[1][6]]then l[2][7][l[2][6]](l[3],false);return;end;local N=math.max(1,math.floor(tonumber(l[4].Text)or 1));local r=l[1][7][l[1][6]].cat=="Food";local j=l[1][7][l[1][6]].name;local e=l[1][7][l[1][6]].instance;l[5].spawnS(function()local X=true;for u=1,N,1 do if not l[6]({isResturant=r,item=e})then X=false;break;end;end;l[2][7][l[2][6]](l[3],X);if X then l[7](("Bought %d\195\151 %s"):format(N,j),"ok");else l[7]("Purchase failed","err");end;end);end)))

	arg.hover(TextButton, { BackgroundColor3 = c.AMBER2 })

	track(TextButton.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()if not l[1][7][l[1][6]]then l[2][7][l[2][6]](l[3][7][l[3][6]],false);return;end;local N=math.max(1,math.floor(tonumber(l[4].Text)or 1));local r=l[1][7][l[1][6]].name;local j=l[1][7][l[1][6]].instance;task.spawn(l[5].safe(function()local e=l[6]({item=j,quantity=N});l[2][7][l[2][6]](l[3][7][l[3][6]],e);l[7](e and(("Refilled %s \195\151%d"):format(r,N))or"Refill failed",e and"ok"or"err");end));end)))

	arg.refreshShop = function()
		tbl = fn3()
		fn5()
	end

	arg.deferS(arg.refreshShop)
end
