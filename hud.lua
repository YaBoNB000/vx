-- Why do i love gpt 5.6 sol high the reason is below.
-- dsc.gg/oxyenv 

return function(arg)
	local make = arg.make
	local makeTween = arg.makeTween
	local c = arg.C
	local track = arg.track
	local state = arg.state
	local uis = arg.UIS
	local runService = arg.RunService
	local screenGui = arg.ScreenGui
	local main = arg.Main
	local makeToggleRow = arg.makeToggleRow
	local sectionLabel = arg.sectionLabel
	local hud = arg.pages.hud
	local str = "EN-US"

	pcall(function()
		str = game:GetService("LocalizationService").RobloxLocaleId:upper()
	end)

	local function fn()
		local getRegion = arg.getRegion and arg.getRegion()
		if type(getRegion) == "string" and getRegion ~= "" and getRegion ~= "…" then
			return getRegion
		end
		return str
	end

	local function fn2(arg2, arg3)
		for _, v in ipairs(arg3) do
			track(v.InputBegan:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function(R)if not M[1].Visible then return;end;if R.UserInputType==Enum.UserInputType.MouseButton1 or R.UserInputType==Enum.UserInputType.Touch then M[3][7][M[3][6]]=true;M[4][7][M[4][6]]=R.Position;M[5][7][M[5][6]]=M[2].Position;end;end)))
		end

		track(uis.InputChanged:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function(R)if M[1][7][M[1][6]]and(R.UserInputType==Enum.UserInputType.MouseMovement or R.UserInputType==Enum.UserInputType.Touch)then local Z=R.Position-M[2][7][M[2][6]];M[3].Position=UDim2.new(M[4][7][M[4][6]].X.Scale,M[4][7][M[4][6]].X.Offset+Z.X,M[4][7][M[4][6]].Y.Scale,M[4][7][M[4][6]].Y.Offset+Z.Y);if M[5].clampGui then M[5].clampGui(M[3]);end;end;end)))

		track(uis.InputEnded:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function(R)if R.UserInputType==Enum.UserInputType.MouseButton1 or R.UserInputType==Enum.UserInputType.Touch then if M[1][7][M[1][6]]and M[2].clampGui then M[2].clampGui(M[3]);end;M[1][7][M[1][6]]=false;end;end)))
	end

	local Frame = make("Frame", {
		Name = "HudInfo",
		Parent = screenGui,
		Visible = false,
		Active = true,
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.new(0.5, 0, 0, 8),
		Size = UDim2.fromOffset(10, 26),
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = c.GLASS,
		BackgroundTransparency = 0.1,
		BorderSizePixel = 0,
		ZIndex = 55,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = Frame })
	make("UIStroke", { Color = c.BORDER, Thickness = 1, Transparency = 0.35, Parent = Frame })
	make("UIPadding", { Parent = Frame, PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12) })

	make("UIGradient", {
		Parent = make("TextLabel", {
			Parent = Frame,
			Size = UDim2.new(0, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundTransparency = 1,
			Text = "…",
			Font = Enum.Font.GothamBold,
			TextSize = 12,
			TextColor3 = c.TEXT,
			ZIndex = 56,
		}),
		Color = ColorSequence.new(c.ACCENT, c.ACCENT2),
	})

	fn2(Frame, { Frame })

	local Frame2 = make("Frame", {
		Name = "HudKeys",
		Parent = screenGui,
		Visible = false,
		Position = UDim2.new(0, 24, 1, -150),
		Size = UDim2.fromOffset(110, 98),
		BackgroundTransparency = 1,
		ZIndex = 55,
	})

	local tbl = {}

	local function fn3(arg2, arg3, arg4, arg5, arg6, arg7)
		local Frame3 = make("Frame", {
			Parent = Frame2,
			Position = UDim2.fromOffset(arg4, arg5),
			Size = UDim2.fromOffset(arg6, arg7),
			BackgroundColor3 = c.GLASS,
			BackgroundTransparency = 0.1,
			BorderSizePixel = 0,
			ZIndex = 55,
		})

		make("UICorner", { CornerRadius = UDim.new(0, 6), Parent = Frame3 })
		make("UIStroke", { Color = c.BORDER, Thickness = 1, Transparency = 0.35, Parent = Frame3 })

		tbl[arg3] = {
			box = Frame3,
			lbl = make("TextLabel", {
				Parent = Frame3,
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				Text = arg2,
				Font = Enum.Font.GothamBold,
				TextSize = arg7 < 24 and 11 or 15,
				TextColor3 = c.TEXT,
				ZIndex = 56,
			}),
		}

		return Frame3
	end

	local v = fn3("W", Enum.KeyCode.W, 38, 0, 34, 34)
	local v2 = fn3("A", Enum.KeyCode.A, 0, 38, 34, 34)
	local v3 = fn3("S", Enum.KeyCode.S, 38, 38, 34, 34)
	local v4 = fn3("D", Enum.KeyCode.D, 76, 38, 34, 34)
	local space = fn3("SPACE", Enum.KeyCode.Space, 0, 76, 110, 22)
	fn2(Frame2, { v, v2, v3, v4, space })

	local function fn4(arg2, arg3)
		arg.configReg[arg2] = {
			get = function()
				local position = arg3.Position
				return { position.X.Scale, position.X.Offset, position.Y.Scale, position.Y.Offset }
			end,
			set = function(arg4)
				if type(arg4) == "table" and #arg4 == 4 then
					arg3.Position = UDim2.new(arg4[1], arg4[2], arg4[3], arg4[4])
				end
			end,
		}
	end

	fn4("hudKeysPos", Frame2)
	fn4("hudInfoPos", Frame)

	local Frame3 = make("Frame", {
		Name = "PerfSuggest",
		Parent = screenGui,
		Visible = false,
		Active = true,
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.new(0.5, 0, 0, 42),
		Size = UDim2.fromOffset(304, 44),
		BackgroundColor3 = c.GLASS,
		BackgroundTransparency = 0.06,
		BorderSizePixel = 0,
		ZIndex = 70,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 10), Parent = Frame3 })
	make("UIStroke", { Color = c.ACCENT, Thickness = 1, Transparency = 0.3, Parent = Frame3 })

	make("TextLabel", {
		Parent = Frame3,
		Size = UDim2.new(1, -132, 1, 0),
		Position = UDim2.fromOffset(12, 0),
		BackgroundTransparency = 1,
		Text = "Low FPS, boost performance?",
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		TextColor3 = c.TEXT,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextWrapped = true,
		ZIndex = 71,
	})

	local TextButton = make("TextButton", {
		Parent = Frame3,
		Size = UDim2.fromOffset(76, 28),
		Position = UDim2.new(1, -120, 0.5, -14),
		BackgroundColor3 = c.GREEN,
		BorderSizePixel = 0,
		Text = "Boost",
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		TextColor3 = Color3.new(1, 1, 1),
		AutoButtonColor = false,
		ZIndex = 71,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = TextButton })

	local TextButton2 = make("TextButton", {
		Parent = Frame3,
		Size = UDim2.fromOffset(28, 28),
		Position = UDim2.new(1, -36, 0.5, -14),
		BackgroundColor3 = c.SURFACE2,
		BorderSizePixel = 0,
		Text = "×",
		Font = Enum.Font.GothamBold,
		TextSize = 20,
		TextColor3 = c.SUBTEXT,
		AutoButtonColor = false,
		ZIndex = 71,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = TextButton2 })

	local function fn5()
		if not Frame3.Visible then
			return
		end
		makeTween(Frame3, 0.18, { BackgroundTransparency = 1 }):Play()

		task.delay(0.2, arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()if M[1]then M[1].Visible=false;end;end))
	end

	arg.hover(TextButton, { BackgroundColor3 = c.GREEN:Lerp(Color3.new(1, 1, 1), 0.14) })

	track(TextButton.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()local R={"fastMode","liteGraphics"};if M[1].IS_MOBILE then R[#R+1]="ultraLite";end;for Z,V in ipairs(R)do Z=M[1].configReg and M[1].configReg[V];if Z and Z.set and not(Z.get and(Z.get()))then pcall(Z.set,true);end;end;M[2]._fastSuggested=true;M[3][7][M[3][6]]();end)))

	arg.hover(TextButton2, { BackgroundColor3 = c.BORDER, TextColor3 = c.TEXT })

	track(TextButton2.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()M[1]._fastSuggested=true;M[2][7][M[2][6]]();end)))

	track(runService.RenderStepped:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(R)M[1][7][M[1][6]]+=1;M[2][7][M[2][6]]+=R;if M[2][7][M[2][6]]>=0.5 then M[3][7][M[3][6]]=math.floor(M[1][7][M[1][6]]/M[2][7][M[2][6]]+0.5);M[1][7][M[1][6]],M[2][7][M[2][6]]=0,0;M[4].fps=M[3][7][M[3][6]];if not M[4].fpsPeak or M[3][7][M[3][6]]>M[4].fpsPeak then M[4].fpsPeak=M[3][7][M[3][6]];end;if M[4].fastMode then M[5][7][M[5][6]]();elseif not M[4]._fastSuggested then R=M[4].fpsPeak or M[3][7][M[3][6]];if M[3][7][M[3][6]]<=30 and M[3][7][M[3][6]]<R*0.7 then M[4]._lowStreak=(M[4]._lowStreak or 0)+1;else M[4]._lowStreak=0;end;if(M[4]._lowStreak or 0)>=6 and not M[6].Visible then M[7].Text=("Low FPS (%d), boost performance?"):format(M[3][7][M[3][6]]);M[6].BackgroundTransparency=1;M[6].Visible=true;M[8](M[6],0.2,{BackgroundTransparency=0.06}):Play();end;end;if M[9].Visible then local Z=0;pcall(function()Z=math.floor(game:GetService("Players").LocalPlayer:GetNetworkPing()*1000);end);M[10].Text=("%s   %dms   %d FPS"):format(M[11][7][M[11][6]](),Z,M[3][7][M[3][6]]);end;end;if M[12].Visible then for Z,V in pairs(M[13])do R=M[14]:IsKeyDown(Z);if M[15][Z]~=R then M[15][Z]=R;M[8](V.box,0.08,{BackgroundColor3=R and M[16].ACCENT or M[16].GLASS,BackgroundTransparency=R and 0 or 0.1}):Play();V.lbl.TextColor3=R and M[16].BG or M[16].TEXT;end;end;end;end)))

	sectionLabel(hud, "Overlays", 1)

	makeToggleRow(hud, "keyboard", "Keystrokes", "WASD + Space, lights up on press", 2, false, function(visible)
		Frame2.Visible = visible
	end, "hudKeystrokes")

	makeToggleRow(hud, "globe", "Info Bar", "Region · ping · FPS", 3, false, function(visible)
		Frame.Visible = visible
	end, "hudInfoBar")

	sectionLabel(hud, "Interface", 4)

	makeToggleRow(hud, "bell", "Notifications", "Show popups", 5, true, function(notifyEnabled)
		state.notifyEnabled = notifyEnabled
	end, "notifications")

	sectionLabel(hud, "Performance", 6)

	makeToggleRow(hud, "zap", "Fast Mode", "Boost FPS, ESP refreshes a little slower", 7, false, function(fastMode)
		state.fastMode = fastMode

		if not fastMode then
			local v5 = state
			state._fastSuggested = false
			v5._lowStreak = 0
		end
	end, "fastMode")

	local Lighting = game:GetService("Lighting")
	local terrain = workspace:FindFirstChildOfClass("Terrain")
	local v5 = workspace
	local tbl2 = { ParticleEmitter = true, Trail = true, Beam = true, Smoke = true, Fire = true, Sparkles = true }

	local tbl3 = {
		BlurEffect = true,
		BloomEffect = true,
		SunRaysEffect = true,
		DepthOfFieldEffect = true,
		ColorCorrectionEffect = true,
	}

	local tbl4 = { on = false, saved = setmetatable({}, { __mode = "k" }), conns = {} }

	local function fn6(arg2)
		local className = arg2.ClassName

		if tbl2[className] or tbl3[className] then
			if arg2.Enabled ~= false and tbl4.saved[arg2] == nil then
				tbl4.saved[arg2] = { Enabled = arg2.Enabled }

				pcall(function()
					arg2.Enabled = false
				end)
			end
		elseif className == "Atmosphere" then
			if tbl4.saved[arg2] == nil then
				tbl4.saved[arg2] = { Density = arg2.Density }

				pcall(function()
					arg2.Density = 0
				end)
			end
		elseif className == "PointLight" or className == "SpotLight" or className == "SurfaceLight" then
			if arg2.Shadows and tbl4.saved[arg2] == nil then
				tbl4.saved[arg2] = { Shadows = true }

				pcall(function()
					arg2.Shadows = false
				end)
			end
		end
	end

	local function fn7()
		local ok, result = pcall(function()
			return require(arg.LocalPlayer.PlayerScripts.Framework.Core)
		end)

		local windShake = ok and type(result) == "table" and result.windShake
		return type(windShake) == "table" and type(windShake.Pause) == "function" and windShake or nil
	end

	local function fn8()
		tbl4.saved[Lighting] = { GlobalShadows = Lighting.GlobalShadows }

		pcall(function()
			Lighting.GlobalShadows = false
		end)

		tbl4.conns[#tbl4.conns + 1] = Lighting:GetPropertyChangedSignal("GlobalShadows"):Connect(arg.safe(function()
			if tbl4.on and Lighting.GlobalShadows and not tbl4.settingGS then
				tbl4.settingGS = true

				pcall(function()
					Lighting.GlobalShadows = false
				end)

				tbl4.settingGS = false
			end
		end))

		task.spawn(function()
			local v6 = fn7()

			if v6 then
				tbl4.wind = v6

				pcall(function()
					v6:Pause()
				end)
			end
		end)

		for _, descendant in ipairs(Lighting:GetDescendants()) do
			fn6(descendant)
		end

		if terrain then
			tbl4.saved[terrain] = {
				WaterWaveSize = terrain.WaterWaveSize,
				WaterWaveSpeed = terrain.WaterWaveSpeed,
				WaterReflectance = terrain.WaterReflectance,
				WaterTransparency = terrain.WaterTransparency,
				Decoration = terrain.Decoration,
			}

			pcall(function()
				local v6 = terrain
				terrain.WaterWaveSize = 0
				v6.WaterWaveSpeed = 0
				local v7 = terrain
				terrain.WaterReflectance = 0
				v7.WaterTransparency = 1
				terrain.Decoration = false
			end)
		end

		arg.spawnS(function()
			local n = 0

			for _, descendant in ipairs(v5:GetDescendants()) do
				if tbl4.on then
					fn6(descendant)
					n += 1

					if n % 2500 == 0 then
						task.wait()
					end

					continue
				end

				break
			end
		end)

		tbl4.conns[#tbl4.conns + 1] = v5.DescendantAdded:Connect(arg.safe(function(arg2)
			if tbl4.on then
				fn6(arg2)
			end
		end))

		tbl4.conns[#tbl4.conns + 1] = Lighting.DescendantAdded:Connect(arg.safe(function(arg2)
			if tbl4.on then
				fn6(arg2)
			end
		end))
	end

	local function fn9()
		for _, conn in ipairs(tbl4.conns) do
			pcall(function()
				conn:Disconnect()
			end)
		end

		tbl4.conns = {}
		local wind = tbl4.wind
		tbl4.wind = nil

		if wind then
			task.spawn(function()
				pcall(function()
					wind:Resume()
				end)
			end)
		end

		for k, v6 in pairs(tbl4.saved) do
			if typeof(k) == "Instance" and k.Parent then
				for k2, v7 in pairs(v6) do
					pcall(function()
						k[k2] = v7
					end)
				end
			end
		end

		tbl4.saved = setmetatable({}, { __mode = "k" })
	end

	makeToggleRow(hud, "leaf", "Lite Graphics", "Boosts FPS on phones and low end devices", 8, false, function(on)
		if on == tbl4.on then
			return
		end
		tbl4.on = on

		if on then
			fn8()
		else
			fn9()
		end
	end, "liteGraphics")

	table.insert(arg.cleanups, function()
		if tbl4.on then
			tbl4.on = false
			pcall(fn9)
		end
	end)

	local v6 = workspace
	local tbl5 = { on = false, saved = setmetatable({}, { __mode = "k" }), conns = {}, mini = nil }
	local tbl6 = { PointLight = true, SpotLight = true, SurfaceLight = true }
	local tbl7 = { Decal = true, Texture = true }

	local function fn10(arg2)
		local activeVehicle = state.activeVehicle
		local character = arg.LocalPlayer.Character
		return activeVehicle and arg2:IsDescendantOf(activeVehicle) or character and arg2:IsDescendantOf(character)
	end

	local function fn11(arg2)
		local className = arg2.ClassName

		if tbl6[className] then
			if arg2.Enabled and tbl5.saved[arg2] == nil and not fn10(arg2) then
				tbl5.saved[arg2] = { Enabled = true }

				pcall(function()
					arg2.Enabled = false
				end)
			end
		elseif tbl7[className] then
			if arg2.Transparency < 1 and tbl5.saved[arg2] == nil then
				tbl5.saved[arg2] = { Transparency = arg2.Transparency }

				pcall(function()
					arg2.Transparency = 1
				end)
			end
		end
	end

	local tbl8 = { VisualMap3D = true, Icons2D = true, Cursor = true, DirectionMarker = true }

	local function fn12(visible)
		pcall(function()
			local playerGui = arg.LocalPlayer:FindFirstChildOfClass("PlayerGui")
			local mini = tbl5.mini or playerGui and playerGui:FindFirstChild("VisualMap3D", true)
			if not (mini and mini:IsA("ViewportFrame")) then
				return
			end
			tbl5.mini = mini

			for _, child in ipairs(mini.Parent:GetChildren()) do
				if tbl8[child.Name] and child:IsA("GuiObject") then
					child.Visible = visible
				end
			end
		end)
	end

	local fn13 = nil

	local function fn14()
		fn12(false)

		arg.spawnS(function()
			local n = 0

			for _, descendant in ipairs(v6:GetDescendants()) do
				if tbl5.on then
					fn11(descendant)
					n += 1

					if n % 2500 == 0 then
						task.wait()
					end

					continue
				end

				break
			end
		end)

		fn13()

		tbl5.conns[#tbl5.conns + 1] = v6.DescendantAdded:Connect(arg.safe(function(arg2)
			if tbl5.on then
				fn11(arg2)
			end
		end))

		tbl5.conns[#tbl5.conns + 1] = arg.LocalPlayer.CharacterAdded:Connect(arg.safe(function()
			fn12(false)
		end))
	end

	local function fn15()
		for _, conn in ipairs(tbl5.conns) do
			pcall(function()
				conn:Disconnect()
			end)
		end

		tbl5.conns = {}

		for k, v7 in pairs(tbl5.saved) do
			if typeof(k) == "Instance" and k.Parent then
				for k2, v8 in pairs(v7) do
					pcall(function()
						k[k2] = v8
					end)
				end
			end
		end

		tbl5.saved = setmetatable({}, { __mode = "k" })
		fn12(true)
	end

	fn13 = function()
		local v7

		arg.spawnS(function()
			while tbl5.on and state.running do
				local activeVehicle = state.activeVehicle

				if activeVehicle ~= v7 then
					v7 = activeVehicle

					if activeVehicle then
						for k, v8 in pairs(tbl5.saved) do
							if v8.Enabled and typeof(k) == "Instance" and k:IsDescendantOf(activeVehicle) then
								pcall(function()
									k.Enabled = true
								end)

								tbl5.saved[k] = nil
							end
						end
					end
				end

				task.wait(1)
			end
		end)
	end

	makeToggleRow(hud, "rocket", "Ultra Lite", "Boosts FPS even further and changes some features", 9, false, function(on)
		if on == tbl5.on then
			return
		end
		tbl5.on = on

		if on then
			local liteGraphics = arg.configReg and arg.configReg.liteGraphics

			if liteGraphics and liteGraphics.get and liteGraphics.set and not liteGraphics.get() then
				pcall(liteGraphics.set, true)
			end

			fn14()
		else
			fn15()
		end
	end, "ultraLite")

	table.insert(arg.cleanups, function()
		if tbl5.on then
			tbl5.on = false
			pcall(fn15)
		end
	end)

	local Lighting2 = game:GetService("Lighting")
	local tbl9 = { on = false, saved = nil, token = 0, conns = {}, applying = false }

	local function fn16()
		return Lighting2:FindFirstChildOfClass("Atmosphere")
	end

	local function fn17()
		tbl9.applying = true

		pcall(function()
			Lighting2.ClockTime = 14
			Lighting2.Brightness = 1.4
			Lighting2.ExposureCompensation = -0.2
			Lighting2.GlobalShadows = false
			Lighting2.FogEnd = 1e9
			Lighting2.Ambient = Color3.fromRGB(190, 190, 190)
			Lighting2.OutdoorAmbient = Color3.fromRGB(190, 190, 190)
			local v7 = fn16()

			if v7 then
				v7.Density = 0
			end
		end)

		tbl9.applying = false
	end

	local function fn18()
		if not tbl9.saved then
			return
		end
		local v7 = fn16()

		for k, v8 in pairs(tbl9.saved) do
			if k == "AtmosphereDensity" then
				if v7 then
					pcall(function()
						v7.Density = v8
					end)
				end
			else
				pcall(function()
					Lighting2[k] = v8
				end)
			end
		end
	end

	local function fn19()
		for _, conn in ipairs(tbl9.conns) do
			pcall(function()
				conn:Disconnect()
			end)
		end

		table.clear(tbl9.conns)
	end

	sectionLabel(hud, "Visuals", 11)

	makeToggleRow(hud, "glasses", "Fullbright", "See at night like it's daytime", 12, false, function(on)
		if on == tbl9.on then
			return
		end
		tbl9.on = on
		tbl9.token = tbl9.token + 1

		if on then
			local v7 = fn16()

			tbl9.saved = {
				ClockTime = Lighting2.ClockTime,
				Brightness = Lighting2.Brightness,
				ExposureCompensation = Lighting2.ExposureCompensation,
				GlobalShadows = Lighting2.GlobalShadows,
				FogEnd = Lighting2.FogEnd,
				Ambient = Lighting2.Ambient,
				OutdoorAmbient = Lighting2.OutdoorAmbient,
				AtmosphereDensity = v7 and v7.Density or nil,
			}

			local token = tbl9.token
			fn17()

			local function fn20(arg2)
				tbl9.conns[#tbl9.conns + 1] = arg2:Connect(arg.safe(function()
					if tbl9.on and not tbl9.applying then
						fn17()
					end
				end))
			end

			for _, v8 in ipairs({
				"ClockTime",
				"Brightness",
				"Ambient",
				"OutdoorAmbient",
				"FogEnd",
				"ExposureCompensation",
				"GlobalShadows",
			}) do
				fn20(Lighting2:GetPropertyChangedSignal(v8))
			end

			if v7 then
				fn20(v7:GetPropertyChangedSignal("Density"))
			end

			tbl9.conns[#tbl9.conns + 1] = Lighting2.ChildAdded:Connect(arg.safe(function(arg2)
				if tbl9.on and arg2:IsA("Atmosphere") then
					fn20(arg2:GetPropertyChangedSignal("Density"))
					fn17()
				end
			end))

			arg.spawnS(function()
				while tbl9.on and state.running and token == tbl9.token do
					fn17()
					task.wait(1)
				end
			end)
		else
			fn19()
			fn18()
		end
	end, "fullbright")

	table.insert(arg.cleanups, function()
		tbl9.on = false
		fn19()
		fn18()
	end)

	table.insert(arg.cleanups, function()
		pcall(function()
			Frame:Destroy()
		end)

		pcall(function()
			Frame2:Destroy()
		end)

		pcall(function()
			Frame3:Destroy()
		end)
	end)
end
