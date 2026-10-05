-- Why do i love gpt 5.6 sol high the reason is below.
-- dsc.gg/oxyenv 

return function(arg)
	local make = arg.make
	local c = arg.C
	local track = arg.track
	local localPlayer = arg.LocalPlayer
	local runService = arg.RunService
	local uis = arg.UIS
	local workspace = arg.Workspace
	local getRoot = arg.getRoot
	local safeMode = arg.SAFE_MODE
	local makeToggleRow = arg.makeToggleRow
	local sectionLabel = arg.sectionLabel
	local tools = arg.pages.tools
	local mouse = localPlayer:GetMouse()
	local flag = false
	local v = nil
	local grab = nil
	local n2 = 20
	local canCollide = nil
	local connection = nil
	local attachment = nil
	local alignPosition = nil
	local alignOrientation = nil
	local rotation = nil
	local flag2 = false
	local flag3 = nil
	local flag4 = nil

	local function fn()
		if safeMode then
			return
		end

		if not (gethiddenproperty and sethiddenproperty) then
			return
		end

		if not flag2 then
			local ok, result = pcall(function()
				return gethiddenproperty(localPlayer, "SimulationRadius")
			end)

			local ok2, result2 = pcall(function()
				return gethiddenproperty(localPlayer, "MaximumSimulationRadius")
			end)

			flag3 = ok and type(result) == "number" and result or nil
			flag4 = ok2 and type(result2) == "number" and result2 or nil
			flag2 = true
		end

		pcall(function()
			sethiddenproperty(localPlayer, "SimulationRadius", 1e9)
		end)

		pcall(function()
			sethiddenproperty(localPlayer, "MaximumSimulationRadius", 1e9)
		end)
	end

	local function fn2()
		if not flag2 then
			return
		end

		pcall(function()
			local v2 = sethiddenproperty
			local v3 = flag3
			local n

			if flag3 then
				n = v3
			else
				n = 1000
			end

			v2(localPlayer, "SimulationRadius", n)
		end)

		pcall(function()
			local v2 = sethiddenproperty
			local v3 = flag4
			local n

			if flag4 then
				n = v3
			else
				n = 1000
			end

			v2(localPlayer, "MaximumSimulationRadius", n)
		end)

		flag2 = false
	end

	local function fn3()
		if alignPosition then
			alignPosition:Destroy()
			alignPosition = nil
		end

		if alignOrientation then
			alignOrientation:Destroy()
			alignOrientation = nil
		end

		if attachment then
			attachment:Destroy()
			attachment = nil
		end

		if v then
			pcall(function()
				if canCollide ~= nil then
					v.CanCollide = canCollide
				end

				v.AssemblyLinearVelocity = Vector3.zero
				v.AssemblyAngularVelocity = Vector3.zero
			end)
		end

		v = nil
		canCollide = nil
		fn2()

		if grab then
			grab()
		end
	end

	local function fn4()
		flag = true

		if grab then
			grab()
		end

		if connection then
			return
		end

		connection = runService.RenderStepped:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()local o=e[1][6][e[1][3]];if not o or not o.Parent or o.Anchored or not e[2][6][e[2][3]]then return;end;local J=Enum.KeyCode.E;if e[3]:IsKeyDown(J)then e[4][6][e[4][3]]=math.min(e[4][6][e[4][3]]+0.7,250);end;o=Enum.KeyCode.Q;if e[3]:IsKeyDown(o)then e[4][6][e[4][3]]=math.max(e[4][6][e[4][3]]-0.7,3);end;if e[3]:IsKeyDown(Enum.KeyCode.R)and e[5][6][e[5][3]]then local o,l,n=e[5][6][e[5][3]],CFrame.Angles,math.rad;e[5][6][e[5][3]]=o*l(0,0.06981317007977318,0);end;local o=nil;if e[6].IS_MOBILE then J=e[7].CurrentCamera.CFrame;o={Origin=J.Position,Direction=J.LookVector};else o=e[8].UnitRay;end;local l=o.Origin+o.Direction*e[4][6][e[4][3]];J=e[9](e[10].Character);l=if J and(l-J.Position).Magnitude<6 then o.Origin+o.Direction*math.max(e[4][6][e[4][3]],10)else l;if e[11][6][e[11][3]]and e[5][6][e[5][3]]then e[11][6][e[11][3]].CFrame=e[5][6][e[5][3]];end;e[2][6][e[2][3]].Position=l;end))
	end

	local function stopGrab()
		flag = false
		fn3()

		if connection then
			connection:Disconnect()
			connection = nil
		end
	end

	arg.stopGrab = stopGrab
	sectionLabel(tools, "Physics", 1)

	makeToggleRow(tools, "hand", "Grab Tool", "Hold LMB on a loose part", 2, false, function(arg2)
		if arg2 then
			fn4()
		else
			stopGrab()
		end
	end, "grabTool")

	local function fn5(parent)
		if not (parent and parent:IsA("BasePart") and not parent.Anchored) then
			return false
		end

		if localPlayer.Character and parent:IsDescendantOf(localPlayer.Character) then
			return false
		end

		if parent.Size.Magnitude >= 500 then
			return false
		end
		fn()
		local n = 50

		pcall(function()
			n = parent.AssemblyMass
		end)

		v = parent

		if grab then
			grab()
		end

		canCollide = parent.CanCollide
		parent.CanCollide = false
		n2 = math.clamp((workspace.CurrentCamera.CFrame.Position - parent.Position).Magnitude, 8, 60)
		attachment = Instance.new("Attachment")
		attachment.Parent = parent
		alignPosition = Instance.new("AlignPosition")
		alignPosition.Attachment0 = attachment
		alignPosition.Mode = Enum.PositionAlignmentMode.OneAttachment
		alignPosition.RigidityEnabled = false
		alignPosition.MaxForce = math.clamp(n * 8000, 50000, 100000000)
		alignPosition.Responsiveness = 30
		alignPosition.Position = parent.Position
		alignPosition.Parent = parent
		rotation = parent.CFrame.Rotation
		alignOrientation = Instance.new("AlignOrientation")
		alignOrientation.Attachment0 = attachment
		alignOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
		alignOrientation.RigidityEnabled = false
		alignOrientation.MaxTorque = math.clamp(n * 8000, 50000, 100000000)
		alignOrientation.Responsiveness = 30
		alignOrientation.CFrame = rotation
		alignOrientation.Parent = parent
		return true
	end

	track(uis.InputBegan:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(o,J)if not e[1][6][e[1][3]]then return;end;if o.UserInputType~=Enum.UserInputType.MouseButton1 then return;end;if J then return;end;e[2][6][e[2][3]](e[3].Target);end)))

	track(uis.InputEnded:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(o)if o.UserInputType==Enum.UserInputType.MouseButton1 and e[1][6][e[1][3]]then e[2][6][e[2][3]]();end;end)))

	track(uis.InputChanged:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(o)local J=e[1][6][e[1][3]]and o.UserInputType==Enum.UserInputType.MouseWheel;if J then e[2][6][e[2][3]]=math.clamp(e[2][6][e[2][3]]+o.Position.Z*3,5,250);end;end)))

	if arg.IS_MOBILE and arg.mobileGui and arg.mobilePadButton then
		local mobilePadButton = arg.mobilePadButton
		local mobileOnTap = arg.mobileOnTap
		local mobilePadIcon = arg.mobilePadIcon

		local function fn6()
			local currentCamera = workspace.CurrentCamera
			local raycastParams = RaycastParams.new()
			raycastParams.FilterType = Enum.RaycastFilterType.Exclude
			raycastParams.FilterDescendantsInstances = { localPlayer.Character }
			local hit = workspace:Raycast(currentCamera.CFrame.Position, currentCamera.CFrame.LookVector * 250, raycastParams)
			return hit and hit.Instance or nil
		end

		local n = 46
		local n3 = 12

		local Frame = make("Frame", {
			Name = "GrabPad",
			Parent = arg.mobileGui,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(46, 4 * n + 3 * n3),
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 22, 0.5, 40),
			Visible = false,
		})

		if arg.registerMobileButton then
			arg.registerMobileButton("grab", Frame)
		end

		local function fn7(arg2)
			return UDim2.fromOffset(n / 2, n / 2 + (arg2 - 1) * (n + n3))
		end

		local accent = c.ACCENT
		local MGrab = mobilePadButton("MGrab", "", 46, fn7(1), Frame, accent)

		if mobilePadIcon then
			mobilePadIcon(MGrab, "hand")
		end

		local MPull = mobilePadButton("MPull", "+", 46, fn7(2), Frame)
		local MPush = mobilePadButton("MPush", "-", 46, fn7(3), Frame)
		local MRot = mobilePadButton("MRot", "", 46, fn7(4), Frame)

		if mobilePadIcon then
			mobilePadIcon(MRot, "rotate-cw")
		end

		if arg.mobileDraggable then
			for _, v2 in ipairs({ MGrab, MPull, MPush, MRot }) do
				arg.mobileDraggable(Frame, v2)
			end
		end

		local v2 = mobileOnTap

		local function fn8(arg2, arg3)
			v2(arg2, function()
				if arg.editLayout then
					return
				end
				arg3()
			end)
		end

		fn8(MGrab, function()
			if v then
				fn3()
			else
				fn5(fn6())
			end
		end)

		fn8(MPull, function()
			n2 = math.max(n2 - 6, 3)
		end)

		fn8(MPush, function()
			n2 = math.min(n2 + 6, 250)
		end)

		fn8(MRot, function()
			if rotation then
				rotation *= CFrame.Angles(0, 0.26179938779914941, 0)
			end
		end)

		grab = function()
			local grab2 = flag and (not arg.mobileBtnAllowed or arg.mobileBtnAllowed("grab"))

			if Frame.Visible ~= grab2 then
				Frame.Visible = grab2
			end

			local green = v and c.GREEN or c.ACCENT

			if MGrab.BackgroundColor3 ~= green then
				MGrab.BackgroundColor3 = green
			end
		end

		if arg.mobileBtnRefresh then
			arg.mobileBtnRefresh.grab = grab
		end

		grab()
	end

	local function fn6()
	end

	local ProximityPromptService = game:GetService("ProximityPromptService")
	local flag5 = false
	local flag6 = false
	local n = 0
	local tbl = {}
	local tbl2 = {}

	local function fn7(arg2)
		if tbl[arg2] == nil then
			tbl[arg2] = arg2.HoldDuration
		end

		if arg2.HoldDuration > 0.05 then
			arg2.HoldDuration = 0.05
		end
	end

	local function fn8(arg2)
		local parent = arg2.Parent
		if not parent then
			return nil
		end

		if parent:IsA("BasePart") then
			return parent.Position
		end

		if parent:IsA("Attachment") then
			return parent.WorldPosition
		end
		return nil
	end

	track(ProximityPromptService.PromptShown:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(o)e[1][o]=true;if e[2][6][e[2][3]]then e[3][6][e[3][3]](o);end;end)))

	track(ProximityPromptService.PromptHidden:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(o)e[1][o]=nil;end)))

	local function fn9()
		flag5 = true

		for k in pairs(tbl2) do
			fn7(k)
		end
	end

	local function stopInstant()
		flag5 = false

		for k, v2 in pairs(tbl) do
			if typeof(k) == "Instance" and k.Parent then
				pcall(function()
					k.HoldDuration = v2
				end)
			end
		end

		table.clear(tbl)
	end

	arg.stopInstant = stopInstant

	local function fn10()
		if not fireproximityprompt then
			return
		end
		local v2 = getRoot(localPlayer.Character)
		if not v2 then
			return
		end
		local huge = math.huge
		local v3 = nil

		for k in pairs(tbl2) do
			if typeof(k) == "Instance" and k.Parent and k.Enabled then
				local v4 = fn8(k)

				if v4 then
					local magnitude = (v4 - v2.Position).Magnitude

					if magnitude < huge then
						huge = magnitude
						v3 = k
					end
				end
			end
		end

		if v3 then
			pcall(fireproximityprompt, v3)
		end
	end

	track(runService.Heartbeat:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(o)if not e[1][6][e[1][3]]then return;end;e[2][6][e[2][3]]+=o;if e[2][6][e[2][3]]>=e[3]then e[2][6][e[2][3]]=0;e[4][6][e[4][3]]();end;end)))

	sectionLabel(tools, "Interaction", 4)

	makeToggleRow(tools, "zap", "Instant Interact", "No hold on any E prompt", 5, false, function(arg2)
		if arg2 then
			fn9()
		else
			stopInstant()
		end
	end, "instantInteract")

	makeToggleRow(tools, "mouse-pointer-click", "Auto Interact", "Fires the prompt you're closest to", 6, false, function(arg2)
		flag6 = arg2
		n = 0

		if arg2 and not fireproximityprompt then
			arg.log("Executor has no fireproximityprompt; Auto Interact won't fire.", "warn")
		end
	end, "autoInteract")

	table.insert(arg.cleanups, function()
		stopGrab()
		stopInstant()
	end)
end
