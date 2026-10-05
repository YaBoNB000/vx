-- Why do i love gpt 5.6 sol high the reason is below.
-- dsc.gg/oxyenv 

return function(arg)
	local make = arg.make
	local c = arg.C
	local track = arg.track
	local console = arg.pages.console
	local Frame = make("Frame", { Parent = console, Size = UDim2.new(1, 0, 0, 16), BackgroundTransparency = 1, LayoutOrder = 1 })

	make("TextLabel", {
		Parent = Frame,
		Size = UDim2.new(1, -60, 1, 0),
		BackgroundTransparency = 1,
		Text = "OUTPUT",
		Font = Enum.Font.GothamBold,
		TextSize = 10,
		TextColor3 = c.SUBTEXT,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	local TextButton = make("TextButton", {
		Parent = Frame,
		Size = UDim2.fromOffset(52, 16),
		Position = UDim2.new(1, -52, 0, 0),
		BackgroundColor3 = c.SURFACE2,
		BorderSizePixel = 0,
		Text = "Clear",
		Font = Enum.Font.GothamBold,
		TextSize = 10,
		TextColor3 = c.SUBTEXT,
		AutoButtonColor = false,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 5), Parent = TextButton })
	make("UIStroke", { Color = c.BORDER, Thickness = 1, Transparency = 0.4, Parent = TextButton })

	track(TextButton.MouseEnter:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()q[1](q[2],0.12,{TextColor3=q[3].TEXT}):Play();end)))

	track(TextButton.MouseLeave:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()q[1](q[2],0.12,{TextColor3=q[3].SUBTEXT}):Play();end)))

	local color = Color3.fromRGB(10, 11, 15)

	local function fn(arg2)
		return color:Lerp(arg2 or c.ACCENT, 0.05)
	end

	local ScrollingFrame = make("ScrollingFrame", {
		Parent = console,
		Size = UDim2.new(1, 0, 0, 340),
		BackgroundColor3 = fn(c.ACCENT),
		BorderSizePixel = 0,
		ScrollBarThickness = 4,
		ScrollBarImageColor3 = c.ACCENT,
		CanvasSize = UDim2.new(0, 0, 0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		LayoutOrder = 2,
	})

	pcall(function()
		arg.win:onAccent(function(arg2)
			if ScrollingFrame and ScrollingFrame.Parent then
				ScrollingFrame.BackgroundColor3 = fn(arg2)
			end
		end)
	end)

	make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = ScrollingFrame })
	make("UIListLayout", { Parent = ScrollingFrame, Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder })

	make("UIPadding", {
		Parent = ScrollingFrame,
		PaddingTop = UDim.new(0, 6),
		PaddingBottom = UDim.new(0, 6),
		PaddingLeft = UDim.new(0, 8),
		PaddingRight = UDim.new(0, 8),
	})

	local TextLabel = make("TextLabel", {
		Parent = ScrollingFrame,
		Size = UDim2.new(1, 0, 0, 16),
		BackgroundTransparency = 1,
		Text = "— no output yet —",
		Font = Enum.Font.Code,
		TextSize = 11,
		TextColor3 = c.SUBTEXT,
		TextXAlignment = Enum.TextXAlignment.Left,
		LayoutOrder = 0,
	})

	local n = 200
	local tbl = {}
	local n2 = 0
	local tbl2 = { error = c.RED, warn = c.AMBER, info = c.ACCENT, out = c.SUBTEXT }

	local function fn2(arg2, arg3)
		if TextLabel then
			TextLabel:Destroy()
			TextLabel = nil
		end

		n2 += 1

		local TextLabel2 = make("TextLabel", {
			Parent = ScrollingFrame,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Text = arg2,
			Font = Enum.Font.Code,
			TextSize = 11,
			TextColor3 = tbl2[arg3] or c.TEXT,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextWrapped = true,
			LayoutOrder = n2,
		})

		table.insert(tbl, TextLabel2)

		if n < #tbl then
			local v = table.remove(tbl, 1)

			if v then
				v:Destroy()
			end
		end

		task.defer(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()if q[1].Parent then q[1].CanvasPosition=Vector2.new(0,q[1].AbsoluteCanvasSize.Y);end;end))
	end

	track(TextButton.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()for C,C in ipairs(q[1])do if C then C:Destroy();end;end;table.clear(q[1]);end)))

	local v = ipairs
	local logBuffer = arg.logBuffer or {}

	for _, v2 in v(logBuffer) do
		fn2(v2.text, v2.kind)
	end

	arg.addLogSink(function(arg2)
		if ScrollingFrame and ScrollingFrame.Parent then
			fn2(arg2.text, arg2.kind)
		end
	end)
end
