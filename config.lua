-- Why do i love gpt 5.6 sol high the reason is below.
-- dsc.gg/oxyenv 

return function(arg)
	local make = arg.make
	local makeTween = arg.makeTween
	local c = arg.C
	local notify = arg.notify
	local track = arg.track
	local sectionLabel = arg.sectionLabel
	local noteLabel = arg.noteLabel
	local config = arg.pages.config
	local HttpService = game:GetService("HttpService")
	local str = "vxdata/cache.dat"
	local flag = type(writefile) == "function" and type(readfile) == "function" and type(isfile) == "function"

	if flag then
		pcall(function()
			if type(makefolder) == "function" and type(isfolder) == "function" and not isfolder("vxdata") then
				makefolder("vxdata")
			end

			if isfile("VxSans_Presets.json") and not isfile(str) then
				writefile(str, readfile("VxSans_Presets.json"))

				if type(delfile) == "function" then
					pcall(delfile, "VxSans_Presets.json")
				end
			end
		end)
	end

	local function fn()
		if not (flag and isfile(str)) then
			return {}
		end

		local ok, result = pcall(function()
			return HttpService:JSONDecode(readfile(str))
		end)

		return ok and type(result) == "table" and result or {}
	end

	local function fn2(arg2)
		if not flag then
			return false
		end

		return (pcall(function()
			writefile(str, HttpService:JSONEncode(arg2))
		end))
	end

	local function fn3()
		local tbl = {}

		for k, v in pairs(arg.configReg) do
			tbl[k] = v.get()
		end

		return tbl
	end

	local function fn4(arg2)
		arg.applyingConfig = true

		pcall(function()
			local n = 0

			for k, v in pairs(arg2) do
				local v2 = arg.configReg[k]

				if v2 then
					if arg.dbglog then
						arg.dbglog("[config] apply " .. tostring(k), "out")
					end

					pcall(v2.set, v)
					n += 1

					if n % 6 == 0 then
						task.wait()
					end
				end
			end
		end)

		arg.applyingConfig = false

		if arg.dbglog then
			arg.dbglog("[config] done", "info")
		end
	end

	local str2 = "VXS1"
	local n = 8000
	local n2 = 16000
	local n3 = 200
	local n4 = 64
	local n5 = 32
	local tbl = {}

	for i = 1, 64 do
		tbl[("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(i, i)] = i - 1
	end

	local function fn5(arg2)
		local tbl2 = {}

		for i = 1, #arg2, 3 do
			local v = arg2:byte(i)
			local v2 = arg2:byte(i + 1)
			local v3 = arg2:byte(i + 2)
			local n6 = v * 65536 + (v2 or 0) * 256 + (v3 or 0)
			tbl2[#tbl2 + 1] = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(n6 // 262144 + 1, n6 // 262144 + 1) .. ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(n6 // 4096 % 64 + 1, n6 // 4096 % 64 + 1) .. (v2 and ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(n6 // 64 % 64 + 1, n6 // 64 % 64 + 1) or "=") .. (v3 and ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(n6 % 64 + 1, n6 % 64 + 1) or "=")
		end

		return table.concat(tbl2)
	end

	local function fn6(arg2)
		local str3 = arg2:gsub("[^A-Za-z0-9+/]", "")
		if #str3 % 4 == 1 then
			return nil
		end
		local tbl2 = {}

		for i = 1, #str3, 4 do
			local v = tbl[str3:sub(i, i)]
			local v2 = tbl[str3:sub(i + 1, i + 1)]
			if not v or not v2 then
				return nil
			end
			local v3 = tbl[str3:sub(i + 2, i + 2)]
			local v4 = tbl[str3:sub(i + 3, i + 3)]
			local n6 = v * 262144 + v2 * 4096 + (v3 or 0) * 64 + (v4 or 0)
			tbl2[#tbl2 + 1] = string.char(n6 // 65536 % 256)

			if v3 then
				tbl2[#tbl2 + 1] = string.char(n6 // 256 % 256)
			end

			if v4 then
				tbl2[#tbl2 + 1] = string.char(n6 % 256)
			end
		end

		return table.concat(tbl2)
	end

	local function fn7(arg2)
		local n6 = 2166136261

		for i = 1, #arg2 do
			n6 = bit32.bxor(n6, arg2:byte(i)) * 16777619 % 4294967296
		end

		return string.format("%08x", n6)
	end

	local tbl2 = { notifications = true }
	local tbl3 = {}

	for _, v in ipairs({
		"aimAssist",
		"autoShoot",
		"silentAim",
		"silentAuto",
		"silentTp",
		"defenseMode",
		"defenseAutoFire",
		"autoAtm",
		"autoCuff",
		"autoEquip",
		"autoFarmer",
		"autoFarmerTp",
		"autoGolf",
		"autoHack",
		"autoInteract",
		"autoRestaurant",
		"autoStealCash",
		"autoTaxi",
		"autoRam",
		"autoRamInstant",
		"autoRamFilter",
		"autoRamMode",
		"antiArrest",
		"antiAfk",
		"blink",
		"flight",
		"noclip",
		"infJump",
		"float",
		"groundLock",
		"speedController",
		"cruiseControl",
		"ghostDesyncMode",
		"noDamage",
		"antiRagdoll",
		"infStamina",
		"infHunger",
		"infAmmo",
		"noReload",
		"noCrashes",
		"carFuel",
		"noTrafficCams",
	}) do
		tbl3[v] = true
	end

	local tbl4 = {
		aimAssist = "Aim Assist",
		autoShoot = "Auto Shoot",
		silentAim = "Silent Aim",
		silentAuto = "Silent Auto Fire",
		silentTp = "Teleport Shot",
		defenseMode = "Defense Mode",
		defenseAutoFire = "Defense Auto Fire",
		autoAtm = "Auto ATM",
		autoCuff = "Auto Handcuff",
		autoEquip = "Auto Equip",
		autoFarmer = "Auto Farmer",
		autoFarmerTp = "Farmer Teleport",
		autoGolf = "Auto Golf",
		autoHack = "Auto Hack",
		autoInteract = "Auto Interact",
		autoRestaurant = "Auto Restaurant",
		autoStealCash = "Auto Steal Cash",
		autoTaxi = "Auto Taxi",
		antiArrest = "Anti Arrest",
		autoRam = "Auto Ram",
		autoRamInstant = "Ram Instant",
		autoRamFilter = "Ram Who",
		autoRamMode = "Ram How Often",
		antiAfk = "Anti AFK",
		blink = "Blink",
		flight = "Flight",
		noclip = "No Clip",
		infJump = "Infinite Jump",
		float = "Float",
		groundLock = "Ground Lock",
		speedController = "Speed Control",
		cruiseControl = "Cruise Control",
		ghostDesyncMode = "Ghost Advanced Mode",
		noDamage = "No Damage",
		antiRagdoll = "Anti Ragdoll",
		infStamina = "Infinite Stamina",
		infHunger = "Infinite Hunger",
		infAmmo = "Infinite Ammo",
		noReload = "No Reload",
		noCrashes = "No Crashes",
		carFuel = "Full Fuel",
		noTrafficCams = "No Traffic Cams",
	}

	local tbl5 = nil

	local function fn8(arg2)
		if not tbl5 then
			tbl5 = { None = true }

			for _, v in ipairs(Enum.KeyCode:GetEnumItems()) do
				tbl5[v.Name] = true
			end
		end

		return tbl5[arg2] == true
	end

	local tbl6 = nil

	arg.deferS(function()
		tbl6 = {}

		for k, v in pairs(arg.configReg) do
			local ok, result = pcall(v.get)

			if ok then
				tbl6[k] = result
			end
		end
	end)

	local function fn9(arg2, arg3)
		if typeof(arg2) ~= typeof(arg3) then
			return true
		end

		if typeof(arg2) == "table" then
			if #arg2 ~= #arg3 then
				return true
			end

			for i = 1, #arg2 do
				if arg2[i] ~= arg3[i] then
					return true
				end
			end

			return false
		end

		return arg2 ~= arg3
	end

	local function fn10()
		local tbl7 = {}
		local n6 = 0

		for k, v in pairs(arg.configReg) do
			if not tbl2[k] then
				local ok, result = pcall(v.get)

				if ok and (not tbl6 or fn9(result, tbl6[k])) then
					tbl7[k] = result
					n6 += 1
				end
			end
		end

		if n6 == 0 then
			return nil, "nothing to share yet, set something up first"
		end

		local ok, result = pcall(function()
			return HttpService:JSONEncode(tbl7)
		end)

		if not ok then
			return nil, "couldn't build your config"
		end
		return str2 .. "." .. fn7(result) .. "." .. fn5(result)
	end

	local function fn11(arg2, arg3, arg4, arg5)
		if arg3 == "boolean" then
			if type(arg5) ~= "boolean" then
				return nil
			end
			return arg5
		end

		if arg3 == "number" then
			if type(arg5) ~= "number" or arg5 ~= arg5 or math.abs(arg5) > 1000000 then
				return nil
			end
			return arg5
		end

		if arg3 == "string" then
			if type(arg5) ~= "string" or #arg5 > n5 then
				return nil
			end

			if arg2:sub(1, 8) == "keybind_" then
				if not fn8(arg5) then
					return nil
				end

				if arg2 == "keybind_toggleMenu" and arg5 == "None" then
					return nil
				end
			end

			return arg5
		end

		if arg3 == "table" then
			if type(arg5) ~= "table" then
				return nil
			end
			local n6 = #arg5
			if n6 > n4 then
				return nil
			end

			if arg2:sub(1, 3) == "hud" and n6 ~= 4 then
				return nil
			end
			local tbl7 = {}

			for i = 1, n6 do
				local v = arg5[i]

				if arg2:sub(1, 3) == "hud" then
					if type(v) ~= "number" or v ~= v then
						return nil
					end
					tbl7[i] = i % 2 == 1 and math.clamp(v, 0, 1) or math.clamp(v, -600, 600)
					continue
				end

				if type(v) == "string" and #v <= n5 then
					tbl7[i] = v
					continue
				end
				return nil
			end

			return tbl7
		end

		return nil
	end

	local function fn12(arg2)
		if type(arg2) ~= "string" then
			return nil, "nothing pasted"
		end
		local str3 = arg2:gsub("%s+", ""):gsub("`", "")
		if #str3 == 0 then
			return nil, "nothing pasted"
		end

		if #str3 > n then
			return nil, "that config is too big"
		end
		local match, v = str3:match("^" .. str2 .. "%.(%x%x%x%x%x%x%x%x)%.(.+)$")
		if not match then
			return nil, "that is not a VxSans config"
		end
		local v2 = fn6(v)
		if not v2 or #v2 == 0 or #v2 > n2 then
			return nil, "config looks corrupted"
		end

		if fn7(v2) ~= match:lower() then
			return nil, "config looks corrupted, ask for it again"
		end

		local ok, result = pcall(function()
			return HttpService:JSONDecode(v2)
		end)

		if not ok or type(result) ~= "table" then
			return nil, "config looks corrupted"
		end
		local tbl7 = {}
		local tbl8 = {}
		local n6 = 0
		local n7 = 0
		local n8 = 0

		for k, v3 in pairs(result) do
			n6 += 1

			if not (n3 < n6) then
				local flag2 = type(k) == "string" and #k <= 48 and arg.configReg[k] or nil

				if not flag2 or tbl2[k] then
					n7 += 1
				else
					local ok2, result2 = pcall(flag2.get)
					local v4 = ok2 and fn11(k, typeof(result2), result2, v3) or nil

					if v4 == nil then
						n7 += 1
					elseif tbl3[k] and v4 == true then
						tbl8[#tbl8 + 1] = k
						n8 += 1
					else
						tbl7[k] = v4
						n8 += 1
					end
				end

				continue
			end

			break
		end

		table.sort(tbl8)
		return tbl7, tbl8, ("applied %d, ignored %d"):format(n8 - #tbl8, n7)
	end

	sectionLabel(config, "New preset", 1)
	local Frame = make("Frame", { Parent = config, Size = UDim2.new(1, 0, 0, 32), BackgroundTransparency = 1, LayoutOrder = 2 })

	local TextBox = make("TextBox", {
		Parent = Frame,
		Size = UDim2.new(1, -96, 0, 30),
		Position = UDim2.fromOffset(0, 1),
		BackgroundColor3 = c.SURFACE2,
		BorderSizePixel = 0,
		Text = "",
		PlaceholderText = "preset name…",
		PlaceholderColor3 = c.SUBTEXT,
		Font = Enum.Font.Gotham,
		TextSize = 12,
		TextColor3 = c.TEXT,
		TextXAlignment = Enum.TextXAlignment.Left,
		ClearTextOnFocus = false,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = TextBox })
	make("UIStroke", { Color = c.BORDER, Thickness = 1, Transparency = 0.4, Parent = TextBox })
	make("UIPadding", { PaddingLeft = UDim.new(0, 10), Parent = TextBox })

	local TextButton = make("TextButton", {
		Parent = Frame,
		Size = UDim2.new(0, 88, 0, 30),
		Position = UDim2.new(1, -88, 0, 1),
		BackgroundColor3 = c.GREEN,
		BorderSizePixel = 0,
		Text = "Save",
		Font = Enum.Font.GothamBold,
		TextSize = 13,
		TextColor3 = Color3.new(1, 1, 1),
		AutoButtonColor = false,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = TextButton })
	sectionLabel(config, "Saved presets", 3)

	local ScrollingFrame = make("ScrollingFrame", {
		Parent = config,
		Size = UDim2.new(1, 0, 0, 200),
		BackgroundColor3 = c.SURFACE,
		BorderSizePixel = 0,
		LayoutOrder = 4,
		CanvasSize = UDim2.new(0, 0, 0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 4,
		ScrollBarImageColor3 = c.ACCENT,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = ScrollingFrame })
	make("UIListLayout", { Parent = ScrollingFrame, Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder })

	make("UIPadding", {
		Parent = ScrollingFrame,
		PaddingTop = UDim.new(0, 6),
		PaddingBottom = UDim.new(0, 6),
		PaddingLeft = UDim.new(0, 6),
		PaddingRight = UDim.new(0, 6),
	})

	local v = nil
	local onConfigTabOpened = nil

	local function fn13(arg2)
		local v2 = fn()
		if not v2[arg2] then
			return
		end
		fn4(v2[arg2])
		v = arg2
		notify("Loaded " .. arg2, "ok")
		onConfigTabOpened()
	end

	onConfigTabOpened = function()
		for _, child in ipairs(ScrollingFrame:GetChildren()) do
			if not (child:IsA("UIListLayout") or child:IsA("UIPadding")) then
				child:Destroy()
			end
		end

		local v2 = fn()
		local tbl7 = {}

		for k in pairs(v2) do
			table.insert(tbl7, k)
		end

		table.sort(tbl7)

		if #tbl7 == 0 then
			make("TextLabel", {
				Parent = ScrollingFrame,
				Size = UDim2.new(1, 0, 0, 20),
				BackgroundTransparency = 1,
				Text = flag and "— no presets saved —" or "— executor has no file access —",
				Font = Enum.Font.Gotham,
				TextSize = 11,
				TextColor3 = c.SUBTEXT,
				TextXAlignment = Enum.TextXAlignment.Center,
				LayoutOrder = 0,
			})

			return
		end

		for i, v3 in ipairs(tbl7) do
			local Frame2 = make("Frame", {
				Parent = ScrollingFrame,
				Size = UDim2.new(1, 0, 0, 30),
				BackgroundColor3 = c.SURFACE2,
				BorderSizePixel = 0,
				LayoutOrder = i,
			})

			make("UICorner", { CornerRadius = UDim.new(0, 6), Parent = Frame2 })

			local TextButton2 = make("TextButton", {
				Parent = Frame2,
				Size = UDim2.new(1, -108, 1, 0),
				Position = UDim2.fromOffset(4, 0),
				BackgroundTransparency = 1,
				Text = v3,
				Font = Enum.Font.GothamBold,
				TextSize = 11,
				TextColor3 = c.TEXT,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				AutoButtonColor = false,
			})

			make("UIPadding", { PaddingLeft = UDim.new(0, 6), Parent = TextButton2 })

			track(TextButton2.MouseEnter:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()l[1](l[2],0.1,{TextColor3=l[3].ACCENT}):Play();end)))

			track(TextButton2.MouseLeave:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()l[1](l[2],0.1,{TextColor3=l[3].TEXT}):Play();end)))

			track(TextButton2.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()l[1][7][l[1][6]](l[2]);end)))

			local flag2 = v3 == v

			if flag2 then
				make("UIStroke", { Color = c.ACCENT, Thickness = 1, Transparency = 0.35, Parent = Frame2 })
			end

			local TextButton3 = make("TextButton", {
				Parent = Frame2,
				Size = UDim2.fromOffset(50, 22),
				Position = UDim2.new(1, -104, 0.5, -11),
				BackgroundColor3 = flag2 and c.GREEN or c.ACCENT,
				BorderSizePixel = 0,
				Text = flag2 and "Update" or "Load",
				Font = Enum.Font.GothamBold,
				TextSize = 10,
				TextColor3 = Color3.new(1, 1, 1),
				AutoButtonColor = false,
			})

			make("UICorner", { CornerRadius = UDim.new(0, 5), Parent = TextButton3 })

			local TextButton4 = make("TextButton", {
				Parent = Frame2,
				Size = UDim2.fromOffset(46, 22),
				Position = UDim2.new(1, -50, 0.5, -11),
				BackgroundColor3 = c.DANGER,
				BorderSizePixel = 0,
				Text = "Del",
				Font = Enum.Font.GothamBold,
				TextSize = 10,
				TextColor3 = c.RED,
				AutoButtonColor = false,
			})

			make("UICorner", { CornerRadius = UDim.new(0, 5), Parent = TextButton4 })
			arg.hover(TextButton3, { BackgroundColor3 = flag2 and c.GREEN:Lerp(Color3.new(1, 1, 1), 0.32) or c.ACCENT2 })

			track(TextButton3.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()if l[1]then local x=l[2][7][l[2][6]]();x[l[3]]=l[4][7][l[4][6]]();if l[5][7][l[5][6]](x)then l[6]("Updated "..l[3],"ok");else l[6]("Update failed","err");end;else l[7][7][l[7][6]](l[3]);end;end)))

			arg.hover(TextButton4, { BackgroundColor3 = c.RED, TextColor3 = c.TEXT })

			track(TextButton4.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()local x=l[1][7][l[1][6]]();x[l[2]]=nil;l[3][7][l[3][6]](x);x=l[4][7][l[4][6]];if x==l[2]then l[4][7][l[4][6]]=nil;end;l[5]("Deleted "..l[2],"off");l[6][7][l[6][6]]();end)))
		end
	end

	arg.hover(TextButton, { BackgroundColor3 = c.GREEN:Lerp(Color3.new(1, 1, 1), 0.14) })

	track(TextButton.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()if not l[1]then l[2]("No file access on this executor","err");return;end;local x=l[3].Text:gsub("^%s+",""):gsub("%s+$","");if x==""then l[2]("Enter a preset name","err");return;end;local r=l[4][7][l[4][6]]();r[x]=l[5][7][l[5][6]]();if l[6][7][l[6][6]](r)then l[2]("Saved "..x,"ok");l[3].Text="";l[7][7][l[7][6]]=x;l[8][7][l[8][6]]();else l[2]("Save failed","err");end;end)))

	arg.deferS(onConfigTabOpened)
	arg.onConfigTabOpened = onConfigTabOpened
	sectionLabel(config, "Share a config", 5)
	noteLabel(config, "Copy yours to send, or paste one someone sent you. Features that act on their own arrive switched off, you turn on the ones you want.", 6)

	local TextBox2 = make("TextBox", {
		Parent = config,
		Size = UDim2.new(1, 0, 0, 56),
		BackgroundColor3 = c.SURFACE2,
		BorderSizePixel = 0,
		LayoutOrder = 7,
		Text = "",
		PlaceholderText = "paste a config here…",
		PlaceholderColor3 = c.SUBTEXT,
		Font = Enum.Font.Code,
		TextSize = 11,
		TextColor3 = c.TEXT,
		ClearTextOnFocus = false,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextWrapped = true,
		MultiLine = true,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = TextBox2 })
	make("UIStroke", { Color = c.BORDER, Thickness = 1, Transparency = 0.4, Parent = TextBox2 })

	make("UIPadding", {
		PaddingLeft = UDim.new(0, 8),
		PaddingTop = UDim.new(0, 6),
		PaddingRight = UDim.new(0, 8),
		Parent = TextBox2,
	})

	local Frame2 = make("Frame", { Parent = config, Size = UDim2.new(1, 0, 0, 32), BackgroundTransparency = 1, LayoutOrder = 8 })

	local function fn14(arg2, arg3, arg4, arg5)
		local TextButton2 = make("TextButton", {
			Parent = Frame2,
			Size = UDim2.new(arg5, -4, 0, 30),
			Position = UDim2.new(arg4, 0, 0, 1),
			BackgroundColor3 = arg3,
			BorderSizePixel = 0,
			Text = arg2,
			Font = Enum.Font.GothamBold,
			TextSize = 12,
			TextColor3 = Color3.new(1, 1, 1),
			AutoButtonColor = false,
		})

		make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = TextButton2 })
		arg.hover(TextButton2, { BackgroundColor3 = arg3:Lerp(Color3.new(1, 1, 1), 0.16) })
		return TextButton2
	end

	local copyMine = fn14("Copy mine", c.ACCENT, 0, 0.5)
	local loadPasted = fn14("Load pasted", c.GREEN, 0.5, 0.5)

	local ScrollingFrame2 = make("ScrollingFrame", {
		Parent = config,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = 9,
		Visible = false,
		CanvasSize = UDim2.new(0, 0, 0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 4,
		ScrollBarImageColor3 = c.ACCENT,
	})

	make("UIListLayout", { Parent = ScrollingFrame2, Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder })

	local function fn15()
		for _, child in ipairs(ScrollingFrame2:GetChildren()) do
			if not child:IsA("UIListLayout") then
				child:Destroy()
			end
		end

		ScrollingFrame2.Visible = false
		ScrollingFrame2.Size = UDim2.new(1, 0, 0, 0)
	end

	local function fn16(arg2)
		fn15()
		if #arg2 == 0 then
			return
		end
		ScrollingFrame2.Visible = true
		ScrollingFrame2.Size = UDim2.new(1, 0, 0, math.min(#arg2 * 34 + 4, 170))

		for i, v2 in ipairs(arg2) do
			local Frame3 = make("Frame", {
				Parent = ScrollingFrame2,
				Size = UDim2.new(1, -4, 0, 30),
				BackgroundColor3 = c.SURFACE2,
				BorderSizePixel = 0,
				LayoutOrder = i,
			})

			make("UICorner", { CornerRadius = UDim.new(0, 6), Parent = Frame3 })

			make("TextLabel", {
				Parent = Frame3,
				Size = UDim2.new(1, -74, 1, 0),
				Position = UDim2.fromOffset(10, 0),
				BackgroundTransparency = 1,
				Text = tbl4[v2] or v2,
				Font = Enum.Font.GothamBold,
				TextSize = 11,
				TextColor3 = c.TEXT,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
			})

			local TextButton2 = make("TextButton", {
				Parent = Frame3,
				Size = UDim2.fromOffset(62, 22),
				Position = UDim2.new(1, -68, 0.5, -11),
				BackgroundColor3 = c.ACCENT,
				BorderSizePixel = 0,
				Text = "Turn on",
				Font = Enum.Font.GothamBold,
				TextSize = 10,
				TextColor3 = Color3.new(1, 1, 1),
				AutoButtonColor = false,
			})

			make("UICorner", { CornerRadius = UDim.new(0, 5), Parent = TextButton2 })

			track(TextButton2.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()local x=l[1].configReg[l[2]];if x then pcall(x.set,true);end;l[3]:Destroy();if#l[4]:GetChildren()<=1 then l[5][7][l[5][6]]();end;end)))
		end
	end

	track(copyMine.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()local x,r=l[1][7][l[1][6]]();if not x then l[2](r,"err");return;end;local r=type(setclipboard)=="function"and setclipboard or type(toclipboard)=="function"and toclipboard or type(setrbxclipboard)=="function"and setrbxclipboard;l[3].Text=x;if r and(pcall(r,x))then l[2]("Config copied, paste it anywhere","ok");else l[2]("No clipboard here, copy it from the box","warn");end;l[3]:CaptureFocus();end)))

	track(loadPasted.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()local x,r,N=l[1][7][l[1][6]](l[2].Text);if not x then l[3][7][l[3][6]]();l[4](r,"err");return;end;l[5][7][l[5][6]](x);l[2].Text="";l[4](N,"ok");l[6][7][l[6][6]](r);if#r>0 then l[4](#r.." need turning on by hand","warn");end;end)))
end
