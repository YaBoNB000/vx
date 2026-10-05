-- Why do i love gpt 5.6 sol high the reason is below.
-- dsc.gg/oxyenv 

return function(arg)
	local make = arg.make
	local c = arg.C
	local notify = arg.notify
	local track = arg.track
	local state = arg.state
	local players = arg.Players
	local localPlayer = arg.LocalPlayer
	local runService = arg.RunService
	local workspace = arg.Workspace
	local replicatedStorage = arg.ReplicatedStorage
	local camera = arg.Camera
	local uis = arg.UIS
	local makeToggleRow = arg.makeToggleRow
	local makeSlider = arg.makeSlider
	local makeGroup = arg.makeGroup
	local sectionLabel = arg.sectionLabel
	local aim = arg.pages.aim
	state.aimAssistEnabled = false
	local flag = true
	local flag2 = true
	local flag3 = true
	local n = 600
	local tbl = {}
	local flag4 = false
	local flag5 = false
	local flag6 = false
	local flag7 = false
	local flag8 = false

	local tbl2 = {
		"Police",
		"Medical",
		"Fire",
		"Transit",
		"Road Service",
		"Farmer",
		"Chef",
		"Delivery",
		"Civilian",
		"Prisoner",
	}

	local tbl3 = {}

	for _, v in ipairs(tbl2) do
		tbl3[v] = true
	end

	local tbl4 = {}
	local str = "HumanoidRootPart"
	local n2 = 60
	local flag9 = true

	local function fn(arg2)
		local v = workspace:FindFirstChild(arg.charsFolderName or "Characters")
		v = v and v:FindFirstChild(arg2.Name)
		if v and v.Parent then
			return v
		end
		return arg2.Character
	end

	local n3 = 0.135
	local n4 = 110
	local flag10 = false
	local n5 = 300
	local n6 = 0.025
	local v = nil
	local v2 = nil
	local n7 = 4
	local n8 = 0.125
	local VirtualInputManager = game:GetService("VirtualInputManager")
	local flag11 = false
	local v3 = nil
	local v4 = nil
	local flag12 = false
	local n9 = 0
	local n10 = 0
	local flag13 = false
	local n11 = 0
	local v5 = nil
	local n12 = 0

	local function fn2()
		local main = arg.win and arg.win.main
		if not (main and main.Visible) then
			return false
		end
		local viewportSize = camera.ViewportSize
		local n13 = viewportSize.X / 2
		local n14 = viewportSize.Y / 2
		local absolutePosition = main.AbsolutePosition
		local absoluteSize = main.AbsoluteSize
		local flag14 = n13 >= absolutePosition.X - 4 and n13 <= absolutePosition.X + absoluteSize.X + 4 and n14 >= absolutePosition.Y - 4 and n14 <= absolutePosition.Y + absoluteSize.Y + 4

		if flag14 and notify and os.clock() - n12 > 6 then
			n12 = os.clock()
			notify("Auto Shoot held: move the window off your crosshair", "err")
		end

		return flag14
	end

	local function fn3()
		local v6 = flag13
		local v7

		if flag13 then
			v7 = v6
		else
			v7 = fn2()
		end

		if v7 then
			return
		end
		local viewportSize = camera.ViewportSize
		VirtualInputManager:SendMouseButtonEvent(viewportSize.X / 2, viewportSize.Y / 2, 0, true, game, 0)
		flag13 = true
	end

	local function fn4()
		if not flag13 then
			return
		end
		local viewportSize = camera.ViewportSize
		VirtualInputManager:SendMouseButtonEvent(viewportSize.X / 2, viewportSize.Y / 2, 0, false, game, 0)
		flag13 = false
	end

	local function fn5()
		if fn2() then
			return
		end
		local viewportSize = camera.ViewportSize
		local n13 = viewportSize.X / 2
		local n14 = viewportSize.Y / 2
		VirtualInputManager:SendMouseButtonEvent(n13, n14, 0, true, game, 0)
		VirtualInputManager:SendMouseButtonEvent(n13, n14, 0, false, game, 0)
	end

	local function fn6(arg2)
		local v6 = fn(arg2)
		if not v6 then
			return nil
		end
		local humanoidRootPart = v6:FindFirstChild("HumanoidRootPart") or v6:FindFirstChild("Torso")
		if not humanoidRootPart then
			return nil
		end
		local assemblyRootPart = humanoidRootPart.AssemblyRootPart

		if assemblyRootPart and assemblyRootPart ~= humanoidRootPart then
			local model = assemblyRootPart:FindFirstAncestorOfClass("Model")
			if model and model:FindFirstChild("_Chassis") then
				return model
			end
		end

		local humanoid = v6:FindFirstChildOfClass("Humanoid")

		if humanoid and humanoid.SeatPart then
			local model = humanoid.SeatPart:FindFirstAncestorOfClass("Model")
			if model and model:FindFirstChild("_Chassis") then
				return model
			end
		end

		return nil
	end

	local v6 = nil
	local n13 = 0
	local tbl5 = {}

	local function fn7(arg2, arg3)
		while arg2 and arg2.Parent and arg2.Parent ~= arg3 do
			arg2 = arg2.Parent
		end

		if arg2 and arg2.Parent == arg3 and arg2:IsA("Model") then
			return arg2
		end
		return nil
	end

	local function fn8(arg2, arg3)
		if not (arg2:IsA("BasePart") and arg2.Name == "WheelCollision") then
			return
		end
		local parent = arg2.Parent
		if not (parent and parent.Name == "Tire") then
			return
		end
		local v7 = fn7(arg2, arg3)
		if not v7 then
			return
		end
		local size = arg2.Size
		tbl5[arg2] = { part = arg2, radius = (size.Y + size.Z) / 4, vehicle = v7 }
	end

	arg.spawnS(function()
		local gameplay = workspace:FindFirstChild("Gameplay") or workspace:WaitForChild("Gameplay", 10)
		local vehicles

		if gameplay then
			vehicles = gameplay:FindFirstChild("Vehicles") or gameplay:WaitForChild("Vehicles", 10)
		else
			vehicles = gameplay
		end

		if not vehicles then
			return
		end

		for _, descendant in ipairs(vehicles:GetDescendants()) do
			fn8(descendant, vehicles)
		end

		track(vehicles.DescendantAdded:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function(L)R[1][7][R[1][6]](L,R[2]);end)))

		track(vehicles.DescendantRemoving:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function(L)R[1][L]=nil;end)))
	end)

	local function fn9()
		if v6 and os.clock() - n13 < 0.5 then
			return v6
		end
		local tbl6 = {}
		local v7 = fn6(localPlayer)
		local humanoidRootPart = fn(localPlayer)
		humanoidRootPart = humanoidRootPart and humanoidRootPart:FindFirstChild("HumanoidRootPart")
		humanoidRootPart = humanoidRootPart and humanoidRootPart.Position or camera.CFrame.Position
		local n14 = n + 40

		for k, v8 in pairs(tbl5) do
			if not k.Parent then
				tbl5[k] = nil
			elseif v8.vehicle ~= v7 then
				if (k.Position - humanoidRootPart).Magnitude <= n14 then
					local attribute = k:GetAttribute("Durability")

					if attribute == nil or attribute > 0 then
						tbl6[#tbl6 + 1] = v8
					end
				end
			end
		end

		local now = os.clock()
		v6 = tbl6
		n13 = now
		return tbl6
	end

	local function fn10(arg2)
		local part = arg2.part
		local radius = arg2.radius
		local position = part.Position
		local cFrame = part.CFrame
		local rightVector = cFrame.RightVector
		local unit = (camera.CFrame.Position - position).Unit
		local n14 = unit - unit:Dot(rightVector) * rightVector

		if n14.Magnitude < 0.001 then
			n14 = cFrame.UpVector
		end

		return position + n14.Unit * radius
	end

	local function fn11(arg2)
		if arg2 == localPlayer then
			return
		end

		arg.spawnS(function()
			local ok, result = pcall(function()
				return localPlayer:IsFriendsWith(arg2.UserId)
			end)

			tbl4[arg2.UserId] = ok and result and true or false
		end)
	end

	local function fn12()
		for _, player in ipairs(players:GetPlayers()) do
			fn11(player)
		end
	end

	track(players.PlayerAdded:Connect(arg.safe(fn11)))
	arg.friendWatchers = arg.friendWatchers or {}

	local function fn13(arg2)
		for _, friendWatcher in ipairs(arg.friendWatchers) do
			pcall(friendWatcher, arg2)
		end
	end

	track(localPlayer.FriendStatusChanged:Connect(arg.safe(function(arg2, arg3)
		if not arg2 then
			return
		end
		local v7 = tbl4[arg2.UserId]
		tbl4[arg2.UserId] = arg3 == Enum.FriendStatus.Friend

		if v7 ~= tbl4[arg2.UserId] then
			fn13(arg2)
		end
	end)))

	arg.spawnS(function()
		while arg.state.running do
			task.wait(300)

			for _, player in ipairs(players:GetPlayers()) do
				if player ~= localPlayer then
					local ok, result = pcall(function()
						return localPlayer:IsFriendsWith(player.UserId)
					end)

					if ok then
						result = result and true or false

						if tbl4[player.UserId] ~= result then
							tbl4[player.UserId] = result
							fn13(player)
						end
					end

					task.wait(0.25)
				end
			end
		end
	end)

	arg.isFriend = function(arg2)
		if not arg2 or arg2 == localPlayer then
			return false
		end
		local v7 = tbl4[arg2.UserId]
		if v7 == nil then
			fn11(arg2)
			return false
		end
		return v7
	end

	local function fn14(arg2)
		if tbl[arg2.Name] then
			return true
		end

		if flag4 and arg2.Team ~= nil and arg2.Team == localPlayer.Team then
			return true
		end

		if flag5 and tbl4[arg2.UserId] then
			return true
		end

		if flag6 then
			local crew = localPlayer:FindFirstChild("Crew")
			local crew2 = arg2:FindFirstChild("Crew")
			if crew and crew2 and crew.Value ~= "" and crew.Value == crew2.Value then
				return true
			end
		end

		if flag7 then
			local team = arg2.Team
			if not team or not tbl3[team.Name] then
				return true
			end
		end

		if flag8 then
			local attribute = arg2:GetAttribute("WantedLevel")
			if not (type(attribute) == "number" and attribute > 0) then
				return true
			end
		end

		return false
	end

	local function fn15(arg2, arg3)
		if arg2 == localPlayer then
			return false
		end

		if fn14(arg2) then
			return false
		end
		local v7 = fn(arg2)
		if not v7 then
			return false
		end
		local humanoid = v7:FindFirstChildOfClass("Humanoid")
		local head = v7:FindFirstChild("Head")
		if not humanoid or humanoid.Health <= 0 or not head then
			return false
		end
		local humanoidRootPart = v7:FindFirstChild("HumanoidRootPart")
		local v8 = fn(localPlayer)

		if humanoidRootPart and v8 then
			local humanoidRootPart2 = v8:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart2 then
				humanoidRootPart2 = (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude > (arg3 or n)
			end

			if humanoidRootPart2 then
				return false
			end
		end

		return true
	end

	local function fn16(arg2)
		if not (arg2 and arg2.Parent and arg2 ~= localPlayer) then
			return false
		end

		if fn14(arg2) then
			return false
		end
		local v7 = fn(arg2)

		if v7 then
			if v7:GetAttribute("IsDead") == true then
				return false
			end
			local humanoid = v7:FindFirstChildOfClass("Humanoid")
			if humanoid and humanoid.Health <= 0 then
				return false
			end
		end

		return true
	end

	local v7 = nil
	local flag14 = nil
	local n14 = 0

	local function fn17()
		local v8 = fn(localPlayer)

		if not v8 then
			v7 = nil
			flag14 = nil
			return nil
		end

		if v7 and v7.Parent and v7:IsDescendantOf(v8) then
			return flag14
		end
		local now = os.clock()
		if now - n14 < 0.25 then
			return nil
		end
		n14 = now

		for _, descendant in ipairs(v8:GetDescendants()) do
			if descendant.Name == "Config" and descendant:FindFirstChild("Ammo") then
				if descendant ~= v7 then
					local ok, result = pcall(require, descendant)
					v7 = descendant
					flag14 = ok and type(result) == "table" and result or nil
				end

				return flag14
			end
		end

		v7 = nil
		flag14 = nil
		return nil
	end

	local function fn18()
		return fn17() ~= nil
	end

	local function fn19()
		local v8 = fn17()
		return v8 ~= nil and tonumber(v8.SHOOT_MODE) == 2
	end

	local function fn20(arg2, filterDescendantsInstances)
		local position = camera.CFrame.Position
		local unit = (arg2 - position).Unit
		local magnitude = (arg2 - position).Magnitude
		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude
		raycastParams.FilterDescendantsInstances = filterDescendantsInstances or {}
		local hit = workspace:Raycast(position, unit * magnitude, raycastParams)
		if hit then
			return (hit.Position - position).Magnitude >= magnitude - 2
		end
		return true
	end

	local function fn21()
		local vector2 = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
		local v8 = fn(localPlayer)
		local tbl6 = {}

		if flag then
			for _, player in ipairs(players:GetPlayers()) do
				if fn15(player) then
					local v9 = fn(player)
					local head = v9 and v9:FindFirstChild("Head")

					if head then
						local v10, v11 = camera:WorldToViewportPoint(head.Position)

						if v11 then
							local magnitude = (Vector2.new(v10.X, v10.Y) - vector2).Magnitude

							if magnitude < n4 then
								tbl6[#tbl6 + 1] = {
									dist = magnitude,
									ttype = "player",
									target = player,
									pos = head.Position,
									char = v9,
									player = player,
								}
							end
						end
					end
				end
			end
		end

		if flag2 then
			for _, v9 in ipairs(fn9()) do
				local v10 = fn10(v9)
				local v11, v12 = camera:WorldToViewportPoint(v10)

				if v12 then
					local magnitude = (Vector2.new(v11.X, v11.Y) - vector2).Magnitude

					if magnitude < n4 then
						tbl6[#tbl6 + 1] = { dist = magnitude, ttype = "tyre", target = v9, pos = v10, vehicle = v9.vehicle }
					end
				end
			end
		end

		if #tbl6 == 0 then
			return nil, nil, nil
		end

		table.sort(tbl6, function(arg2, arg3)
			return arg2.dist < arg3.dist
		end)

		for _, v9 in ipairs(tbl6) do
			if not flag3 then
				return v9.target, v9.ttype, v9.pos
			end
			local tbl7 = { v8 }

			if v9.ttype == "player" then
				if v9.char then
					table.insert(tbl7, v9.char)
				end

				local v10 = fn6(v9.player)

				if v10 then
					table.insert(tbl7, v10)
				end
			elseif v9.ttype == "tyre" and v9.vehicle then
				table.insert(tbl7, v9.vehicle)
			end

			if fn20(v9.pos, tbl7) then
				return v9.target, v9.ttype, v9.pos
			end
		end

		return nil, nil, nil
	end

	local function fn22(arg2, arg3)
		if arg3 == "player" then
			return fn15(arg2)
		end

		if arg3 == "tyre" then
			if arg2 and arg2.part and arg2.part:IsA("BasePart") and arg2.part.Parent then
				local attribute = arg2.part:GetAttribute("Durability")
				return attribute == nil or attribute > 0
			end
		end

		return false
	end

	local function fn23(arg2, arg3)
		if arg3 == "player" then
			local v8 = fn(arg2)
			if not v8 then
				return nil
			end
			local humanoidRootPart = v8:FindFirstChild(str) or v8:FindFirstChild("HumanoidRootPart") or v8:FindFirstChild("Head")
			return humanoidRootPart and humanoidRootPart.Position or nil
		end

		if arg3 == "tyre" then
			return fn10(arg2)
		end
		return nil
	end

	local connection = nil
	local v8 = nil
	local v9 = nil
	local flag15 = false

	local function fn24()
		if flag12 then
			flag12 = false

			if v8 then
				v8(false)
			else
				state.aimAssistEnabled = false
			end
		end
	end

	local function fn25()
		if connection then
			return
		end

		connection = runService.RenderStepped:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function(L)R[1][7][R[1][6]]+=L or 0;if not R[2].aimAssistEnabled then R[3][7][R[3][6]],R[4][7][R[4][6]]=nil,nil;return;end;if R[5][7][R[5][6]](R[6])then if R[7][7][R[7][6]]then R[7][7][R[7][6]](false);else R[2].aimAssistEnabled=false;end;R[3][7][R[3][6]],R[4][7][R[4][6]]=nil,nil;return;end;local j=R[8][7][R[8][6]](R[6]);local E=j and(j:FindFirstChildOfClass("Humanoid"));if not j or E and E.Health<=0 then R[3][7][R[3][6]],R[4][7][R[4][6]]=nil,nil;if R[9][7][R[9][6]]then R[10][7][R[10][6]]();end;return;end;local a=false;if R[11][7][R[11][6]]then if R[12][7][R[12][6]](R[11][7][R[11][6]])then if R[13][7][R[13][6]](R[11][7][R[11][6]],1/0)then R[3][7][R[3][6]],R[4][7][R[4][6]],a=R[11][7][R[11][6]],"player",true;else R[3][7][R[3][6]],R[4][7][R[4][6]],a=nil,nil,true;end;else R[11][7][R[11][6]]=nil;R[14][7][R[14][6]]();R[3][7][R[3][6]],R[4][7][R[4][6]]=nil,nil;end;end;R[15][7][R[15][6]]+=L or 0;local I=R[15][7][R[15][6]]>=0.05;local Y=not a;if Y and(not R[3][7][R[3][6]]or not R[16][7][R[16][6]](R[3][7][R[3][6]],R[4][7][R[4][6]]))then if I then R[15][7][R[15][6]]=0;R[3][7][R[3][6]],R[4][7][R[4][6]]=R[17][7][R[17][6]]();I=false;end;end;if not R[3][7][R[3][6]]then return;end;L=R[18][7][R[18][6]](R[3][7][R[3][6]],R[4][7][R[4][6]]);if not L then if a then R[11][7][R[11][6]]=nil;R[14][7][R[14][6]]();end;R[3][7][R[3][6]],R[4][7][R[4][6]]=nil,nil;return;end;j,E=R[19]:WorldToViewportPoint(L);if not E and not a then if I then R[15][7][R[15][6]]=0;R[3][7][R[3][6]],R[4][7][R[4][6]]=R[17][7][R[17][6]]();end;return;end;I=Vector2.new(R[19].ViewportSize.X/2,R[19].ViewportSize.Y/2);local F=(Vector2.new(j.X,j.Y)-I).Magnitude;if Y then if F>R[20]then R[3][7][R[3][6]],R[4][7][R[4][6]]=nil,nil;return;end;if F>R[21][7][R[21][6]]then return;end;end;table.clear(R[22]);R[22][1]=R[8][7][R[8][6]](R[6]);if R[4][7][R[4][6]]=="player"then R[22][#R[22]+1]=R[8][7][R[8][6]](R[3][7][R[3][6]]);E=R[5][7][R[5][6]](R[3][7][R[3][6]]);if E then R[22][#R[22]+1]=E;end;elseif R[4][7][R[4][6]]=="tyre"then if R[3][7][R[3][6]].vehicle then R[22][#R[22]+1]=R[3][7][R[3][6]].vehicle;end;end;j=not R[23][7][R[23][6]]or(R[24][7][R[24][6]](L,R[22]));if not j and not a then R[3][7][R[3][6]],R[4][7][R[4][6]]=nil,nil;return;end;I=math.clamp(F/R[21][7][R[21][6]],0,1);F,Y=R[25]*(0.6+0.4*I^0.8),tick();F*=0.85+0.3*math.sin(Y*0.7+math.random()*2);F=if a then(math.max(F,0.35))else F;local o=R[19].CFrame.Position;local w=R[26][7][R[26][6]]/100;local N=R[19].CFrame.RightVector;local g=R[19].CFrame.UpVector;local k=math.atan2(L.Y-o.Y,L.X-o.X)*0.5;a=L+(N*math.cos(k)+g*math.sin(k))*R[27]*math.max(0,1-I*1.2)*0.5*w+Vector3.new(math.sin(Y*13)*3.0E-4,math.cos(Y*17)*3.0E-4,math.sin(Y*11)*1.0E-4)*w*(0.5+0.5*math.sin(Y*0.3));E,I=CFrame.lookAt(o,a),F*(1+0.15*math.sin(Y*4)*w);I=math.clamp(I+(1-w)*0.45,0,0.95);R[19].CFrame=R[19].CFrame:Lerp(E,I);Y,a=L-o,false;if Y.Magnitude>0.01 then w=math.clamp(R[19].CFrame.LookVector:Dot(Y.Unit),-1,1);a=math.deg(math.acos(w))<=R[28][7][R[28][6]];end;if a and R[29][7][R[29][6]]and R[4][7][R[4][6]]=="player"then E=R[8][7][R[8][6]](R[3][7][R[3][6]]);if E then I=RaycastParams.new();I.FilterType=Enum.RaycastFilterType.Exclude;Y,F={R[8][7][R[8][6]](R[6])},R[5][7][R[5][6]](R[6]);if F then table.insert(Y,F);end;I.FilterDescendantsInstances=Y;L=R[30]:Raycast(o,R[19].CFrame.LookVector*(R[31][7][R[31][6]]+50),I);a=L~=nil and(L.Instance:IsDescendantOf(E));end;end;E=R[32][7][R[32][6]]and j and a and not R[33]:GetFocusedTextBox();if E and autoEquip then pcall(tryEquip);end;if defenseOwnsLock and j and R[3][7][R[3][6]]==R[11][7][R[11][6]]then defenseLastSeen=os.clock();end;if E then R[34][7][R[34][6]]=os.clock();if R[35].IS_MOBILE and mobileRealFire then if R[36][7][R[36][6]]()then touchFireSet(true);elseif tfDown then if os.clock()-tfDownAt>0.08 then touchFireSet(false);end;elseif R[1][7][R[1][6]]>=R[37][7][R[37][6]]then R[1][7][R[1][6]]=0;touchFireSet(true);end;elseif R[35].IS_MOBILE then if R[4][7][R[4][6]]=="player"and R[3][7][R[3][6]]and R[35].silentFireAt and R[1][7][R[1][6]]>=R[37][7][R[37][6]]then R[1][7][R[1][6]]=0;pcall(R[35].silentFireAt,R[3][7][R[3][6]],1);end;elseif R[36][7][R[36][6]]()then R[38][7][R[38][6]]();else if R[9][7][R[9][6]]then R[10][7][R[10][6]]();end;if R[1][7][R[1][6]]>=R[37][7][R[37][6]]then R[1][7][R[1][6]]=0;pcall(R[39][7][R[39][6]]);end;end;elseif R[9][7][R[9][6]]then R[10][7][R[10][6]]();end;if not E and tfDown then touchFireSet(false);end;end))
	end

	local flag16 = false
	local flag17 = false
	local n15 = 0
	local n16 = 0

	local function fn26()
		local screenGui = localPlayer.PlayerGui and localPlayer.PlayerGui:FindFirstChild("ScreenGui")
		local right = screenGui and screenGui:FindFirstChild("Right")
		right = right and right:FindFirstChild("Bottom")
		right = right and right:FindFirstChild("Mobile")
		right = right and right:FindFirstChild("Gun")
		if not (right and right.Visible) then
			return nil
		end
		local fire = right:FindFirstChild("Fire")
		if not (fire and fire.Visible) then
			return nil
		end
		return fire
	end

	local function fn27(arg2)
		local absoluteSize = fn26()
		if arg2 and not absoluteSize then
			return false
		end

		if arg2 == flag17 then
			arg2 = arg2 and absoluteSize and os.clock() - n16 > 0.1

			if arg2 then
				n16 = os.clock()
				local absolutePosition = absoluteSize.AbsolutePosition
				local absoluteSize2 = absoluteSize.AbsoluteSize

				pcall(function()
					VirtualInputManager:SendTouchEvent(2, 1, absolutePosition.X + absoluteSize2.X / 2, absolutePosition.Y + absoluteSize2.Y / 2)
				end)
			end

			return true
		end

		local absolutePosition = absoluteSize and absoluteSize.AbsolutePosition
		absoluteSize = absoluteSize and absoluteSize.AbsoluteSize
		local n17 = absolutePosition and absolutePosition.X + absoluteSize.X / 2 or 0
		local n18 = absolutePosition and absolutePosition.Y + absoluteSize.Y / 2 or 0

		local ok = pcall(function()
			VirtualInputManager:SendTouchEvent(2, arg2 and 0 or 2, n17, n18)
		end)

		if ok then
			flag17 = arg2
			n15 = os.clock()
			n16 = os.clock()
		end

		return ok
	end

	arg.mobileFireAvailable = function()
		return fn26() ~= nil
	end

	local function stopAimAssist()
		if connection then
			connection:Disconnect()
			connection = nil
		end

		v = nil
		v2 = nil
		fn4()

		if flag17 then
			fn27(false)
		end
	end

	track(runService.Heartbeat:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()if R[1][7][R[1][6]]then if os.clock()-R[2][7][R[2][6]]>0.12 or not R[3][7][R[3][6]]or not R[4].aimAssistEnabled then R[5][7][R[5][6]]();end;end;end)))

	table.insert(arg.cleanups, function()
		pcall(fn4)
	end)

	arg.stopAimAssist = stopAimAssist

	local function toggleAimAssist(aimAssistEnabled)
		state.aimAssistEnabled = aimAssistEnabled

		if aimAssistEnabled then
			fn25()
		else
			stopAimAssist()
		end
	end

	arg.toggleAimAssist = toggleAimAssist
	local flag18 = false
	local n17 = 5
	local flag19 = true
	local n18 = 0.7
	local n19 = 14
	local tbl6 = {}
	local n20 = 0
	local v10 = nil
	local flag20 = false
	local n21 = 0
	local flag21 = false
	local n22 = 1
	local n23 = 0

	local tbl7 = {
		Enum.KeyCode.One,
		Enum.KeyCode.Two,
		Enum.KeyCode.Three,
		Enum.KeyCode.Four,
		Enum.KeyCode.Five,
		Enum.KeyCode.Six,
		Enum.KeyCode.Seven,
		Enum.KeyCode.Eight,
		Enum.KeyCode.Nine,
	}

	local function fn28()
		local playerGui = localPlayer:FindFirstChild("PlayerGui")
		if not playerGui then
			return nil
		end
		local backpack = playerGui:FindFirstChild("Backpack")
		if backpack then
			return backpack
		end

		for _, descendant in ipairs(playerGui:GetDescendants()) do
			if descendant.Name == "Backpack" then
				return descendant
			end
		end

		return nil
	end

	local tbl8 = {}

	local function fn29()
		local v11 = fn28()
		if not v11 then
			return
		end

		for _, descendant in ipairs(v11:GetDescendants()) do
			if descendant:IsA("Model") then
				tbl8[descendant.Name] = true
			end
		end

		for _, child in ipairs(v11:GetChildren()) do
			if child:IsA("Model") then
				tbl8[child.Name] = true
			end
		end
	end

	local function fn30()
		local v11 = fn(localPlayer)
		if not v11 then
			return false
		end

		for _, descendant in ipairs(v11:GetDescendants()) do
			if descendant.Name == "Config" and (descendant:FindFirstChild("TotalAmmo") or descendant:FindFirstChild("Ammo")) then
				return true
			end
		end

		fn29()

		for _, child in ipairs(v11:GetChildren()) do
			if child:IsA("Model") and tbl8[child.Name] then
				return true
			end
		end

		return false
	end

	local function fn31()
		if not flag21 then
			return
		end
		local now = os.clock()
		if now - n23 < 1.5 then
			return
		end

		if uis:GetFocusedTextBox() then
			return
		end
		n23 = now
		if fn30() then
			return
		end

		if arg.IS_MOBILE then
			pcall(function()
				local screenGui = localPlayer.PlayerGui:FindFirstChild("ScreenGui")
				screenGui = screenGui and screenGui:FindFirstChild("Center")
				screenGui = screenGui and screenGui:FindFirstChild("Bottom")
				screenGui = screenGui and screenGui:FindFirstChild("InventoryBar")
				local v11 = screenGui and screenGui:FindFirstChild(tostring(math.clamp(n22, 1, 5)))

				if v11 and v11.Visible then
					local absolutePosition = v11.AbsolutePosition
					local absoluteSize = v11.AbsoluteSize
					local n24 = absolutePosition.X + absoluteSize.X / 2
					local n25 = absolutePosition.Y + absoluteSize.Y / 2
					VirtualInputManager:SendTouchEvent(1, 0, n24, n25)
					VirtualInputManager:SendTouchEvent(1, 2, n24, n25)
				end
			end)

			return
		end

		local v11 = tbl7[math.clamp(n22, 1, 5)]
		if not v11 then
			return
		end

		pcall(function()
			VirtualInputManager:SendKeyEvent(true, v11, false, game)
			task.wait(0.03)
			VirtualInputManager:SendKeyEvent(false, v11, false, game)
		end)
	end

	local function fn32(arg2, arg3, arg4)
		local n24 = arg4 - arg3
		local v11 = n24:Dot(n24)
		if v11 < 0.0001 then
			return (arg2 - arg3).Magnitude
		end
		return (arg2 - arg3 + n24 * math.clamp((arg2 - arg3):Dot(n24) / v11, 0, 1)).Magnitude
	end

	local function fn33(arg2, arg3)
		if not (typeof(arg2) == "Instance" and arg2:IsA("Player")) then
			return
		end

		if arg2 == localPlayer then
			return
		end

		if typeof(arg3) ~= "Vector3" then
			arg3 = nil
		end

		table.insert(tbl6, { plr = arg2, pos = arg3, t = os.clock() })

		while #tbl6 > 40 do
			table.remove(tbl6, 1)
		end
	end

	task.spawn(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()if not pcall(function()local L=R[1]:FindFirstChild("Remote")or(R[1]:WaitForChild("Remote",10));local j=L and(L:FindFirstChild("PlayerEvent")or(L:WaitForChild("PlayerEvent",10)));if not(j and(j:IsA("RemoteEvent")))then return;end;R[2](j.OnClientEvent:Connect(R[3].safe(function(...)if not R[4][7][R[4][6]]then return;end;local L,j,E=table.pack(...),false;for a=1,L.n,1 do local I=L[a];j,E=if type(I)=="string"and I:lower()=="bullet"then true else j,if type(I)=="table"and I.plr~=nil then I else E;end;if j and E then R[5][7][R[5][6]](E.plr,E.pos);end;end)));end)then R[3].log("Defense Mode: couldn't hook Remote.PlayerEvent","warn");end;end))

	local function fn34()
		if not flag20 and n20 == 0 then
			return
		end
		n20 = 0
		n21 = 0

		if flag20 then
			v3 = nil
			v4 = nil
			flag20 = false
		end

		if v10 ~= nil then
			arg.setAutoShoot(v10)
			v10 = nil
		end

		if arg.silentDefendStop then
			arg.silentDefendStop()
		end
	end

	local function fn35(arg2)
		if not (arg2 and arg2.Parent) then
			return false
		end
		local humanoid = fn(arg2)
		humanoid = humanoid and humanoid:FindFirstChildOfClass("Humanoid")
		if humanoid and humanoid.Health <= 0 then
			return false
		end
		return true
	end

	local function fn36()
		local v11 = fn(localPlayer)
		local humanoidRootPart = v11 and v11:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return nil
		end
		local position = humanoidRootPart.Position
		local now = os.clock()
		local v12 = nil
		local v13 = nil

		for i = #tbl6, 1, -1 do
			local v14 = tbl6[i]

			if not (n18 < now - v14.t) then
				local plr = v14.plr

				if plr and plr.Parent and plr ~= localPlayer and not fn14(plr) then
					local humanoidRootPart2 = fn(plr)
					humanoidRootPart2 = humanoidRootPart2 and humanoidRootPart2:FindFirstChild("HumanoidRootPart")
					local magnitude

					if humanoidRootPart2 and v14.pos then
						magnitude = fn32(position, humanoidRootPart2.Position, v14.pos)
					elseif v14.pos then
						magnitude = (position - v14.pos).Magnitude
					else
						magnitude = nil

						if humanoidRootPart2 then
							magnitude = (position - humanoidRootPart2.Position).Magnitude
						end
					end

					if magnitude and magnitude <= n19 then
						local n24 = magnitude + (now - v14.t) * 4

						if not v12 or n24 < v12 then
							v12 = n24
							v13 = plr
						end
					end
				end

				continue
			end

			break
		end

		return v13
	end

	local function fn37()
		local vxSilent = (getgenv and getgenv() or _G).__vxSilent
		return vxSilent ~= nil and vxSilent.on == true
	end

	local function fn38()
		if not flag18 then
			return
		end

		if v3 and not flag20 then
			return
		end
		local now = os.clock()
		if flag20 and v3 and fn35(v3) and fn15(v3) then
			n20 = now + n17
			return
		end
		local v11 = fn36()
		if not v11 or not fn15(v11) then
			return
		end

		if v10 == nil then
			v10 = flag11
		end

		v3 = v11
		v4 = v11
		flag20 = true
		n20 = now + n17
		n21 = now

		if fn37() then
			if flag19 and arg.silentDefendFire then
				arg.silentDefendFire(n17)
			end
		else
			if not state.aimAssistEnabled then
				if v8 then
					v8(true)
				else
					toggleAimAssist(true)
				end
			end

			if flag19 then
				arg.setAutoShoot(true)
			end
		end

		pcall(fn31)

		if notify then
			notify("Defending against " .. v11.DisplayName, "err")
		end
	end

	track(runService.Heartbeat:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()if not R[1][7][R[1][6]]and R[2][7][R[2][6]]<=0 then R[3][7][R[3][6]]=nil;return;end;local L=R[4][7][R[4][6]](R[5]);local j=L and(L:FindFirstChildOfClass("Humanoid"));if j then L=j.Health;if R[3][7][R[3][6]]and L<R[3][7][R[3][6]]-0.01 and L>0 then R[6][7][R[6][6]]();end;R[3][7][R[3][6]]=L;else R[3][7][R[3][6]]=nil;end;if R[2][7][R[2][6]]>0 then j=if not R[1][7][R[1][6]]then true else if R[7][7][R[7][6]]then if not R[8][7][R[8][6]](R[7][7][R[7][6]])or not R[9][7][R[9][6]](R[7][7][R[7][6]])then true else false else true;if not j then L=os.clock()-math.max(R[2][7][R[2][6]]-R[10][7][R[10][6]],R[11][7][R[11][6]]);j=if os.clock()>R[2][7][R[2][6]]and L>R[10][7][R[10][6]]then true else j;end;if j then R[12][7][R[12][6]]();end;end;end)))

	arg.setAutoShoot = function(arg2)
		if v5 then
			v5(arg2)
		else
			flag11 = arg2 and true or false
		end
	end

	arg.setForcedTarget = function(arg2)
		if not (typeof(arg2) == "Instance" and arg2:IsA("Player")) then
			return
		end
		v3 = arg2

		if not fn37() and not state.aimAssistEnabled then
			flag12 = true

			if v8 then
				v8(true)
			else
				toggleAimAssist(true)
			end
		end

		if notify then
			local lockStatus = arg.lockStatus and arg.lockStatus()

			if lockStatus == "stream" then
				notify("Locked onto " .. arg2.DisplayName .. ", but they're too far to hit yet", "err")
			elseif lockStatus == "far" then
				notify("Locked onto " .. arg2.DisplayName .. ", but they're out of range", "err")
			else
				notify("Locked onto " .. arg2.DisplayName, "ok")
			end
		end
	end

	arg.clearForcedTarget = function()
		v3 = nil
		fn24()
	end

	local function fn39()
		local vector2 = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
		local v11 = nil
		local v12 = nil

		for _, player in ipairs(players:GetPlayers()) do
			if player ~= localPlayer and fn15(player) then
				local v13 = fn23(player, "player")

				if v13 then
					local v14, v15 = camera:WorldToViewportPoint(v13)

					if v15 then
						local magnitude = (Vector2.new(v14.X, v14.Y) - vector2).Magnitude

						if not v11 or magnitude < v11 then
							v11 = magnitude
							v12 = player
						end
					end
				end
			end
		end

		return v12
	end

	arg.selectTarget = function(arg2)
		if arg2 == nil or typeof(arg2) == "Instance" and arg2:IsA("Player") then
			v4 = arg2
		end
	end

	arg.lockStatus = function()
		if not v3 then
			return nil
		end
		local vxSilent = (getgenv and getgenv() or _G).__vxSilent
		local flag22 = vxSilent ~= nil and vxSilent.on == true
		if flag22 and vxSilent.tp then
			return "ok"
		end
		local v11 = fn(v3)
		local head = v11 and v11:FindFirstChild("Head")
		if not head then
			return "stream"
		end
		local humanoidRootPart = fn(localPlayer)
		humanoidRootPart = humanoidRootPart and humanoidRootPart:FindFirstChild("HumanoidRootPart")

		if humanoidRootPart then
			local magnitude = (head.Position - humanoidRootPart.Position).Magnitude
			if (flag22 and (tonumber(vxSilent.range) or 600) or n) < magnitude then
				return "far"
			end
		end

		return "ok"
	end

	arg.getSelectedTarget = function()
		return v4
	end

	arg.getForcedTarget = function()
		return v3
	end

	arg.toggleLock = function()
		if v3 then
			v3 = nil
			v4 = nil
			fn24()

			if notify then
				notify("Unlocked", "off")
			end

			return
		end

		local v11

		if v4 and fn16(v4) then
			v11 = v4
		else
			v11 = fn39()
		end

		if v11 then
			v4 = v11
			arg.setForcedTarget(v11)
		elseif notify then
			notify("No target selected or near crosshair", "err")
		end
	end

	arg.toggleAutoShoot = function()
		arg.setAutoShoot(not flag11)
	end

	local function fn40(arg2)
		if tbl[arg2.Name] then
			tbl[arg2.Name] = nil

			if notify then
				notify(arg2.Name .. " off whitelist", "off")
			end
		else
			tbl[arg2.Name] = true

			if notify then
				notify(arg2.Name .. " whitelisted", "ok")
			end
		end
	end

	local genv = getgenv and getgenv() or _G
	genv.__vxSilent = genv.__vxSilent or {}
	local vxSilent = genv.__vxSilent

	if vxSilent.on == nil then
		vxSilent.on = false
	end

	if vxSilent.fov == nil then
		vxSilent.fov = 150
	end

	if vxSilent.range == nil then
		vxSilent.range = 600
	end

	if vxSilent.tp == nil then
		vxSilent.tp = false
	end

	if vxSilent.burst == nil then
		vxSilent.burst = 4
	end

	if vxSilent.autofire == nil then
		vxSilent.autofire = false
	end

	if vxSilent.autoshots == nil then
		vxSilent.autoshots = 6
	end

	if vxSilent.combat == nil then
		vxSilent.combat = true
	end

	if vxSilent.always == nil then
		vxSilent.always = false
	end

	local head = nil

	local function fn41(arg2)
		local v11 = fn(arg2)
		local humanoidRootPart

		if v11 then
			humanoidRootPart = v11:FindFirstChild("HumanoidRootPart") or v11.PrimaryPart
		else
			humanoidRootPart = v11
		end

		if humanoidRootPart then
			return humanoidRootPart.Position
		end
		local attribute = arg2:GetAttribute("CharacterPosition")
		return typeof(attribute) == "Vector3" and attribute or nil
	end

	local function fn42(arg2)
		local head2 = fn(arg2)
		head2 = head2 and head2:FindFirstChild("Head")
		if head2 then
			return head2.Position
		end
		local v11 = fn41(arg2)
		return v11 and v11 + Vector3.new(0, 2.5, 0) or nil
	end

	local flag22 = false

	local function fn43(arg2)
		if arg2 == localPlayer or fn14(arg2) then
			return false
		end

		if vxSilent.combat and not flag22 and arg2:GetAttribute("CombatMode") ~= true then
			return false
		end
		local v11 = fn(arg2)

		if v11 then
			if v11:GetAttribute("IsDead") == true then
				return false
			end
			local humanoid = v11:FindFirstChildOfClass("Humanoid")
			if humanoid and humanoid.Health <= 0 then
				return false
			end
		end

		local v12 = fn41(arg2)
		if not v12 then
			return false
		end
		local v13 = fn41(localPlayer)
		if v13 and (v12 - v13).Magnitude > vxSilent.range then
			return false
		end
		return true
	end

	local v11 = nil

	local function fn44()
		return v11 and v11.Parent and fn43(v11)
	end

	local function fn45()
		if v3 and v3.Parent then
			flag22 = true
			local v12 = fn43(v3)
			flag22 = false
			if v12 then
				return v3
			end
		end

		if vxSilent.autofire and fn44() then
			return v11
		end

		if vxSilent.fov <= 0 then
			return nil
		end
		local vector2 = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
		local v12 = nil
		local v13 = nil

		for _, player in ipairs(players:GetPlayers()) do
			if player ~= localPlayer and fn43(player) then
				local v14 = fn42(player)

				if v14 then
					local v15, v16 = camera:WorldToViewportPoint(v14)

					if v16 then
						local magnitude = (Vector2.new(v15.X, v15.Y) - vector2).Magnitude

						if magnitude <= vxSilent.fov and (not v12 or magnitude < v12) then
							v12 = magnitude
							v13 = player
						end
					end
				end
			end
		end

		return v13
	end

	local genv2 = getgenv and getgenv() or _G
	local playerEvent = nil
	vxSilent.seq = vxSilent.seq or 0

	local function fn46(arg2)
		if not playerEvent then
			return
		end
		local v12 = fn42(arg2)
		local humanoidRootPart = fn(localPlayer)

		if humanoidRootPart then
			humanoidRootPart = humanoidRootPart:FindFirstChild("HumanoidRootPart") or humanoidRootPart.PrimaryPart
		end

		if not (v12 and humanoidRootPart) then
			return
		end
		local n24 = v12 + Vector3.new((math.random() - 0.5) * 1.5, (math.random() - 0.5) * 1.5, (math.random() - 0.5) * 1.5)
		local position = humanoidRootPart.Position

		playerEvent:FireServer("damage", {
			target = arg2,
			bodyParts = head and { { head, 1 } } or nil,
			shotCode = { position, (n24 - position).Unit },
			pos = n24,
			damageFactor = 1.5,
		})
	end

	arg.silentFireAt = function(arg2, arg3)
		local n24 = arg3 or 1

		for i = 1, n24 do
			pcall(fn46, arg2)
		end
	end

	local flag23 = false
	local n24 = 0
	local v12 = nil

	table.insert(arg.cleanups, function()
		if v12 then
			pcall(v12)
		end
	end)

	local function fn47(arg2)
		if getgenv then
			local format = ("%.0f %s").format
			getgenv().__vxTP = format("%.0f %s", os.clock(), arg2)
		end
	end

	local function fn48(arg2, arg3)
		local humanoidRootPart = fn(localPlayer)

		if humanoidRootPart then
			humanoidRootPart = humanoidRootPart:FindFirstChild("HumanoidRootPart") or humanoidRootPart.PrimaryPart
		end

		local v13 = fn42(arg2)
		local desyncActive = arg.desyncActive and arg.desyncActive()

		if not (humanoidRootPart and v13) then
			local v14 = tostring
			fn47(("no hp/root: hp=%s root=%s -> straight"):format(tostring(v13 ~= nil), v14(humanoidRootPart ~= nil)))

			for i = 1, arg3 do
				pcall(fn46, arg2)
			end

			return
		end

		local flag24 = (v13 - humanoidRootPart.Position).Magnitude > 500
		local v14 = tostring
		fn47(("dist=%.0f far=%s S.tp=%s desync=%s tpBusy=%s"):format((v13 - humanoidRootPart.Position).Magnitude, tostring(flag24), tostring(vxSilent.tp), tostring(desyncActive), v14(flag23)))
		local flag25 = false

		if desyncActive then
			local attribute = localPlayer:GetAttribute("CharacterPosition")
			local position = typeof(attribute) == "Vector3" and attribute or typeof(attribute) == "CFrame" and attribute.Position or nil
			flag25 = position ~= nil and (position - v13).Magnitude < 550
		end

		local flag26 = not desyncActive
		local flag27

		if flag26 then
			flag27 = not (vxSilent.tp and flag24)
		else
			flag27 = flag26
		end

		if flag27 or desyncActive and flag25 then
			fn47("-> straight fire (in range or no tp-shot)")

			for i = 1, arg3 do
				pcall(fn46, arg2)
			end

			return
		end

		if flag23 and os.clock() - n24 < 4 then
			fn47("-> blocked, blink in progress")
			return
		end
		fn47("-> BLINK path")
		flag23 = true
		n24 = os.clock()

		arg.spawnS(function()
			if desyncActive and arg.desyncSuspend then
				pcall(arg.desyncSuspend)
			end

			local v15 = humanoidRootPart

			local ok, cFrame = pcall(function()
				return v15.CFrame
			end)

			if not ok then
				flag23 = false
				return
			end

			local function fn49()
				for i = 1, 10 do
					if not (v15 and v15.Parent) then
						return
					end

					pcall(function()
						v15.CFrame = cFrame
					end)

					runService.Heartbeat:Wait()

					local ok2, result = pcall(function()
						return (v15.Position - cFrame.Position).Magnitude
					end)

					if ok2 and result < 4 then
						return
					end
				end
			end

			v12 = fn49

			local ok2, result = pcall(function()
				local function fn50(arg4)
					pcall(function()
						v15.CFrame = CFrame.new(arg4 - Vector3.new(0, 250, 0), arg4)
					end)
				end

				pcall(function()
					localPlayer:RequestStreamAroundAsync(v13, 5)
				end)

				local n25 = os.clock() + 1.5
				local head2

				while true do
					if not (v15 and v15.Parent) then
						return
					end
					head2 = fn(arg2)
					head2 = head2 and head2:FindFirstChild("Head")
					if head2 then
						break
					end
					runService.Heartbeat:Wait()
					head2 = nil
					if not (n25 <= os.clock()) then
						continue
					end
					break
				end

				if not head2 and arg.IS_MOBILE then
					return
				end
				head2 = head2 and head2.Position or v13
				fn50(head2)
				local n26 = os.clock() + 1.2

				while true do
					fn50(head2)
					runService.Heartbeat:Wait()
					local attribute = localPlayer:GetAttribute("CharacterPosition")
					local position = typeof(attribute) == "Vector3" and attribute or typeof(attribute) == "CFrame" and attribute.Position

					if not (position and (v15.Position - position).Magnitude < 60) then
						local flag28 = os.clock() >= n26

						if not flag28 then
							flag28 = not (v15 and v15.Parent)
						end

						if not flag28 then
							continue
						end
					end

					break
				end

				for i = 1, arg3 do
					pcall(fn46, arg2)
				end

				local n27 = os.clock() + 0.15

				repeat
					runService.Heartbeat:Wait()
				until n27 <= os.clock()
			end)

			fn49()

			if desyncActive and arg.desyncResume then
				pcall(arg.desyncResume)
			end

			v12 = nil
			flag23 = false

			if not ok2 then
				arg.log("Teleport Shot aborted: " .. tostring(result), "warn")
			end
		end)
	end

	track(runService.Heartbeat:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(L)L=L or 0;R[1][7][R[1][6]]+=L;if R[1][7][R[1][6]]>=0.2 then R[1][7][R[1][6]]=0;if R[2].updateAimCircle then R[2].updateAimCircle();end;end;if not R[3].on then R[4][7][R[4][6]],R[5][7][R[5][6]],R[6][7][R[6][6]],R[7][7][R[7][6]]=R[3].seq,nil,0,0;return;end;local j=R[8][7][R[8][6]]();if not j then R[5][7][R[5][6]]=nil;end;if R[3].seq~=R[4][7][R[4][6]]then R[4][7][R[4][6]]=R[3].seq;local E,a=pcall(R[9][7][R[9][6]]);if E and a then R[10][7][R[10][6]](a,math.max(1,R[3].burst));if R[3].autofire and os.clock()>=R[11][7][R[11][6]]and R[5][7][R[5][6]]~=a then R[5][7][R[5][6]],R[6][7][R[6][6]]=a,0;end;end;end;if os.clock()<(R[3].defendUntil or 0)then j=R[12][7][R[12][6]]();if j and not R[13]:GetFocusedTextBox()then local E=tonumber(j.RPM)or 500;R[14][7][R[14][6]]+=L;if R[14][7][R[14][6]]>=math.clamp(60/math.max(1,E),0.05,0.6)then R[14][7][R[14][6]]=0;if R[2].IS_MOBILE and R[2].silentFireAt and R[15][7][R[15][6]]then pcall(R[2].silentFireAt,R[15][7][R[15][6]],1);else pcall(R[16][7][R[16][6]]);end;end;end;else R[14][7][R[14][6]]=0;end;local E,a=math.max(1,R[3].autoshots),R[3].autofire and(R[8][7][R[8][6]]())and not R[13]:GetFocusedTextBox()and(R[12][7][R[12][6]]())or nil;if a and R[6][7][R[6][6]]<E then j=tonumber(a.RPM)or 500;local a=math.clamp(60/math.max(1,j),0.05,0.6);R[7][7][R[7][6]]+=L;if R[7][7][R[7][6]]>=a then R[7][7][R[7][6]]=0;R[6][7][R[6][6]]+=1;if R[2].IS_MOBILE and R[2].silentFireAt and R[5][7][R[5][6]]then pcall(R[2].silentFireAt,R[5][7][R[5][6]],1);else pcall(R[16][7][R[16][6]]);end;end;else R[7][7][R[7][6]]=0;if R[5][7][R[5][6]]and R[6][7][R[6][6]]>=E then R[5][7][R[5][6]],R[6][7][R[6][6]]=nil,0;R[11][7][R[11][6]]=os.clock()+1.5;end;end;end)))

	arg.ensureSilentHook = function()
		local remote = replicatedStorage:FindFirstChild("Remote")
		remote = remote and remote:FindFirstChild("PlayerEvent")
		playerEvent = remote or playerEvent
		if not (getgenv and getgenv().__vxNCHooks) then
			return
		end
		local vxSilentHook = genv2.__vxSilentHook

		if not vxSilentHook then
			vxSilentHook = not (hookmetamethod and getnamecallmethod)
		end

		if vxSilentHook or not remote then
			return
		end

		pcall(function()
			local modules = replicatedStorage:FindFirstChild("Modules")
			modules = modules and modules:FindFirstChild("GameRules")
			local atLowIdentity

			if modules then
				atLowIdentity = arg.atLowIdentity and arg.atLowIdentity(function()
					return require(modules)
				end) or require(modules)
			else
				atLowIdentity = modules
			end

			if type(atLowIdentity) == "table" and type(atLowIdentity.characterMeshesToBodyParts) == "table" then
				head = atLowIdentity.characterMeshesToBodyParts.Head
			end
		end)

		genv2.__vxSilentHook = pcall(function()
			hookmetamethod(game, "__namecall", --[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
			function(L,...)if R[1].on and L==R[2][7][R[2][6]]and getnamecallmethod()=="FireServer"and...=="bullet"then R[1].seq=R[1].seq+1;end;return R[3][7][R[3][6]](L,...);end)
		end) or nil
	end

	arg.spawnS(function()
		pcall(function()
			local remote = replicatedStorage:FindFirstChild("Remote")
			playerEvent = remote and remote:FindFirstChild("PlayerEvent") or playerEvent
			local modules = replicatedStorage:FindFirstChild("Modules")
			modules = modules and modules:FindFirstChild("GameRules")

			local atLowIdentity = modules and (arg.atLowIdentity and arg.atLowIdentity(function()
				return require(modules)
			end) or require(modules))

			if type(atLowIdentity) == "table" and type(atLowIdentity.characterMeshesToBodyParts) == "table" then
				head = atLowIdentity.characterMeshesToBodyParts.Head
			end
		end)
	end)

	arg.silentDefendFire = function(arg2)
		vxSilent.defendUntil = os.clock() + (tonumber(arg2) or 5)
	end

	arg.silentDefendStop = function()
		vxSilent.defendUntil = 0
	end

	arg.toggleSilentAim = function(arg2)
		vxSilent.on = arg2 and true or false

		if vxSilent.on and state.aimAssistEnabled then
			if v8 then
				v8(false)
			else
				toggleAimAssist(false)
			end

			if notify then
				notify("Aim Assist off, Silent Aim doesn't need it", "info")
			end
		end

		if not vxSilent.on then
			vxSilent.defendUntil = 0
		end

		if vxSilent.on then
			arg.ensureSilentHook()
		end

		if arg.updateAimCircle then
			arg.updateAimCircle()
		end
	end

	table.insert(arg.cleanups, function()
		vxSilent.on = false
		vxSilent.defendUntil = 0
	end)

	local screenGui = nil
	local Frame = nil

	arg.updateAimCircle = function()
		local fov, always

		if vxSilent.on then
			fov = vxSilent.fov
			always = fov > 0 and (vxSilent.always or fn18())
		else
			local aimAssistEnabled = flag10 and state.aimAssistEnabled
			always = false
			fov = 0

			if aimAssistEnabled then
				fov = n4
				always = fov > 0
			end
		end

		if always and not screenGui then
			screenGui = Instance.new("ScreenGui")
			screenGui.Name = "VXSANS_SILENTFOV"
			screenGui.ResetOnSpawn = false
			screenGui.IgnoreGuiInset = true
			screenGui.DisplayOrder = 7000
			screenGui.Parent = arg.CoreGui or arg.uiHost()

			Frame = make("Frame", {
				Parent = screenGui,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromOffset(fov * 2, fov * 2),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
			})

			make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Frame })
			make("UIStroke", { Color = Color3.new(1, 1, 1), Thickness = 1.5, Transparency = 0.3, Parent = Frame })
		end

		if Frame and fov > 0 then
			Frame.Size = UDim2.fromOffset(fov * 2, fov * 2)
		end

		if screenGui then
			screenGui.Enabled = always
		end
	end

	table.insert(arg.cleanups, function()
		if screenGui then
			pcall(function()
				screenGui:Destroy()
			end)
		end
	end)

	sectionLabel(aim, "Aim", 1)
	local v13 = nil
	local v14 = nil
	local v15 = nil
	local v16 = nil

	v8 = makeGroup(aim, "target", "Aim Assist", "Key: Q · smooth lock to targets", 2, false, function(arg2)
		if arg2 and fn37() then
			if v9 then
				v9(false)
			else
				arg.toggleSilentAim(false)
			end

			if notify then
				notify("Silent Aim off, it can't run with Aim Assist", "info")
			end
		end

		toggleAimAssist(arg2)
	end, "aimAssist", function(arg2)
		local v17, v18 = makeToggleRow(arg2, "user", "Target Players", "Aim at enemy players", 1, true, function(arg3)
			flag = arg3
		end, "aimPlayers")

		v13 = v17
		v14 = v18

		local v19, v20 = makeToggleRow(arg2, "disc", "Target Tyres", "Aim at other cars' tyres", 2, true, function(arg3)
			flag2 = arg3
		end, "aimTyres")

		v15 = v19
		v16 = v20

		makeToggleRow(arg2, "brick-wall", "Wall Check", "Ignore targets you can't see", 3, true, function(arg3)
			flag3 = arg3
		end, "aimWallCheck")

		if arg.IS_MOBILE then
			makeToggleRow(arg2, "crosshair", "Fire The Real Gun", "Experimental. Shoots by pressing the game's own fire button, like PC does, so shots can miss. Off means it uses the old instant-hit method.", 7, false, function(arg3)
				flag16 = arg3

				if not arg3 and flag17 then
					fn27(false)
				end

				if arg3 and notify then
					notify(arg.mobileFireAvailable and arg.mobileFireAvailable() and "Real gun fire on" or "Real gun fire on (hold a weapon to test it)", "info")
				end
			end, "mobileRealFire")
		end

		makeToggleRow(arg2, "scan-face", "Aim at Head", "Off = torso (easier to hit)", 4, false, function(arg3)
			str = arg3 and "Head" or "HumanoidRootPart"
		end, "aimAtHead")

		makeSlider(arg2, "Aim Circle", 5, 20, 400, n4, function(arg3)
			n4 = arg3

			if arg.updateAimCircle then
				arg.updateAimCircle()
			end
		end, true, "aimFov", "How close to your crosshair someone has to be before it pulls onto them.")

		makeToggleRow(arg2, "eye", "Show Aim Circle", "Draw the circle on your crosshair so you can see its size", 6, false, function(arg3)
			flag10 = arg3 and true or false

			if arg.updateAimCircle then
				arg.updateAimCircle()
			end
		end, "aimShowCircle")

		makeSlider(arg2, "Max Distance", 7, 100, 5000, n, function(arg3)
			n = arg3
		end, true, "aimMaxDistance")

		makeSlider(arg2, "Humanization", 8, 0, 100, n2, function(arg3)
			n2 = arg3
		end, true, "aimHumanize", "Lower = more accurate. Higher = looks more human.")
	end)

	arg.aimEnableToggle = v8

	arg.setAimTarget = function(arg2)
		if arg2 == "players" then
			if v13 then
				v13(not v14())
			end
		elseif arg2 == "vehicle" then
			if v15 then
				v15(not v16())
			end
		end
	end

	sectionLabel(aim, "Auto Fire", 3)

	v5 = makeGroup(aim, "crosshair", "Auto Shoot", "Fires when on target", 4, false, function(arg2)
		flag11 = arg2 and true or false

		if not flag11 then
			pcall(fn4)
		end
	end, "autoShoot", function(arg2)
		makeToggleRow(arg2, "circle-check", "Verify Shot", "Only fire if it would connect", 1, true, function(arg3)
			flag9 = arg3
		end, "aimVerifyShot")

		makeSlider(arg2, "Fire Rate (per sec)", 2, 1, 25, 8, function(arg3)
			n8 = 1 / math.max(1, arg3)
		end, true, "autoShootRate")

		makeSlider(arg2, "Fire Cone (deg)", 3, 1, 20, n7, function(arg3)
			n7 = arg3
		end, true, "fireCone")
	end)

	sectionLabel(aim, "Silent Aim", 5)

	v9 = makeGroup(aim, "skull", "Silent Aim ⭐", "Premium · your shots land on their head wherever you aim. Can quickly kill people from across the map.", 6, false, function(arg2)
		if flag15 then
			return
		end
		local flag24

		if arg2 then
			flag24 = not (arg.VX and arg.VX.pm)
		else
			flag24 = arg2
		end

		if flag24 then
			if arg.premiumPopup then
				arg.premiumPopup("Silent Aim")
			elseif notify then
				notify("Silent Aim is Premium, upgrade at vxsans.xyz", "err")
			end

			flag15 = true

			if v9 then
				v9(false)
			end

			flag15 = false
			return
		end

		arg.toggleSilentAim(arg2)

		if notify then
			notify("Silent Aim " .. (arg2 and "on" or "off"), arg2 and "ok" or "off")
		end
	end, "silentAim", function(arg2)
		makeToggleRow(arg2, "radar", "Teleport Shot", "Teleports you to far targets so the shot hits, then brings you straight back", 1, vxSilent.tp, function(arg3)
			vxSilent.tp = arg3 and true or false
		end, "silentTp")

		makeSlider(arg2, "Aim Circle", 2, 0, 400, vxSilent.fov, function(fov)
			vxSilent.fov = fov

			if arg.updateAimCircle then
				arg.updateAimCircle()
			end
		end, true, "silentFov", "Size of the circle that picks who gets shot. 0 only uses your locked target.")

		makeSlider(arg2, "Range", 3, 100, 5000, vxSilent.range, function(range)
			vxSilent.range = range
		end, true, "silentRange", "How far away someone can be and still get hit.")

		makeSlider(arg2, "Hits per Shot", 4, 1, 8, vxSilent.burst, function(burst)
			vxSilent.burst = burst
		end, true, "silentBurst", "How many hits each of your shots counts as. Higher kills faster.")

		makeToggleRow(arg2, "zap", "Auto Fire", "Once you land a hit, keeps shooting that person until they drop", 5, vxSilent.autofire, function(arg3)
			vxSilent.autofire = arg3 and true or false

			if not vxSilent.autofire then
				v11 = nil
			end
		end, "silentAuto", function(arg3)
			makeSlider(arg3, "Auto Shots", 1, 1, 15, vxSilent.autoshots, function(autoshots)
				vxSilent.autoshots = autoshots
			end, true, "silentAutoShots", "How many shots to send per person before giving up. Stops early if they die.")
		end)

		makeToggleRow(arg2, "sword", "Combat Only", "Only shoots players who are marked as in combat", 7, vxSilent.combat, function(arg3)
			vxSilent.combat = arg3 and true or false
		end, "silentCombat")

		makeToggleRow(arg2, "eye", "Always Show Circle", "Keeps the circle visible even with no gun out", 8, vxSilent.always, function(arg3)
			vxSilent.always = arg3 and true or false

			if arg.updateAimCircle then
				arg.updateAimCircle()
			end
		end, "silentAlways")
	end)

	sectionLabel(aim, "Defense", 7)

	makeGroup(aim, "shield", "Defense Mode", "Aim at whoever shoots you", 8, false, function(arg2)
		flag18 = arg2

		if not arg2 then
			fn34()
		end
	end, "defenseMode", function(arg2)
		makeToggleRow(arg2, "sword", "Defense Auto Fire", "Shoot back, not just aim", 1, true, function(arg3)
			flag19 = arg3
		end, "defenseAutoFire")

		makeSlider(arg2, "Retaliate For (sec)", 2, 1, 15, n17, function(arg3)
			n17 = arg3
		end, true, "defenseHold")
	end)

	sectionLabel(aim, "Equipment", 9)

	makeGroup(aim, "backpack", "Auto Equip", "Equip weapon before firing", 10, false, function(arg2)
		flag21 = arg2
	end, "autoEquip", function(arg2)
		makeSlider(arg2, "Hotbar Slot", 1, 1, 5, n22, function(arg3)
			n22 = arg3
		end, true, "equipSlot")
	end)

	sectionLabel(aim, "Whitelist", 11)

	makeToggleRow(aim, "shield-check", "Team Check", "Never target players on your team.", 12, false, function(arg2)
		flag4 = arg2
	end, "aimTeamCheck")

	makeToggleRow(aim, "friends", "Crew Check", "Never target players in your crew (your mafia tag).", 13, false, function(arg2)
		flag6 = arg2
	end, "aimCrewCheck")

	makeToggleRow(aim, "user", "Friends Check", "Never target people on your friends list.", 13, false, function(arg2)
		flag5 = arg2

		if arg2 then
			fn12()
		end
	end, "aimFriendCheck")

	local str2 = ""
	local v17 = arg.makeSearchBox(aim, 14, "Search players to whitelist…")

	local ScrollingFrame = make("ScrollingFrame", {
		Parent = aim,
		Size = UDim2.new(1, 0, 0, 120),
		BackgroundColor3 = c.SURFACE,
		BorderSizePixel = 0,
		LayoutOrder = 15,
		CanvasSize = UDim2.new(0, 0, 0, 0),
		ScrollBarThickness = 4,
		ScrollBarImageColor3 = c.ACCENT,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
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

	local onAimTabOpened = nil

	onAimTabOpened = function()
		for _, child in ipairs(ScrollingFrame:GetChildren()) do
			if not (child:IsA("UIListLayout") or child:IsA("UIPadding")) then
				child:Destroy()
			end
		end

		local n25 = 0

		for _, player in ipairs(players:GetPlayers()) do
			if player ~= localPlayer and (str2 == "" or player.Name:lower():find(str2, 1, true)) then
				n25 += 1

				local Frame2 = make("Frame", {
					Parent = ScrollingFrame,
					Size = UDim2.new(1, 0, 0, 32),
					BackgroundColor3 = c.SURFACE2,
					BorderSizePixel = 0,
					LayoutOrder = n25,
				})

				make("UICorner", { CornerRadius = UDim.new(0, 4), Parent = Frame2 })

				local ImageLabel = make("ImageLabel", {
					Parent = Frame2,
					Size = UDim2.fromOffset(24, 24),
					Position = UDim2.fromOffset(5, 4),
					BackgroundColor3 = c.OFF,
					BorderSizePixel = 0,
					Image = ("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150"):format(player.UserId),
				})

				make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = ImageLabel })

				make("TextLabel", {
					Parent = Frame2,
					Size = UDim2.new(1, -92, 1, 0),
					Position = UDim2.fromOffset(36, 0),
					BackgroundTransparency = 1,
					Text = player.Name,
					Font = Enum.Font.Gotham,
					TextSize = 11,
					TextColor3 = c.TEXT,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.AtEnd,
				})

				local flag24 = tbl[player.Name] == true

				local TextButton = make("TextButton", {
					Parent = Frame2,
					Size = UDim2.fromOffset(50, 22),
					Position = UDim2.new(1, -56, 0.5, -11),
					BackgroundColor3 = flag24 and c.GREEN or c.OFF,
					BorderSizePixel = 0,
					Text = flag24 and "ON" or "OFF",
					Font = Enum.Font.GothamBold,
					TextSize = 10,
					TextColor3 = flag24 and Color3.new(1, 1, 1) or c.SUBTEXT,
					AutoButtonColor = false,
				})

				make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = TextButton })
				arg.hover(TextButton, { BackgroundColor3 = (flag24 and c.GREEN or c.OFF):Lerp(Color3.new(1, 1, 1), 0.16) })

				track(TextButton.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()R[1][7][R[1][6]](R[2]);R[3][7][R[3][6]]();end)))
			end
		end
	end

	local flag24 = false

	local function fn49()
		if not aim.Visible then
			return
		end

		if flag24 then
			return
		end
		flag24 = true

		task.delay(0.4, arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()R[1][7][R[1][6]]=false;if R[2].Visible then R[3][7][R[3][6]]();end;end))
	end

	arg.toggleWhitelist = function(arg2)
		fn40(arg2)

		if aim.Visible then
			onAimTabOpened()
		end
	end

	arg.isWhitelisted = function(arg2)
		return arg2 ~= nil and tbl[arg2.Name] == true
	end

	arg.onAimTabOpened = onAimTabOpened
	track(players.PlayerAdded:Connect(arg.safe(fn49)))
	track(players.PlayerRemoving:Connect(arg.safe(fn49)))

	track(v17:GetPropertyChangedSignal("Text"):Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()R[2][7][R[2][6]]=R[1].Text:lower();R[3][7][R[3][6]]();end)))

	arg.configReg.aimWhitelist = {
		get = function()
			local tbl9 = {}

			for k, v18 in pairs(tbl) do
				if v18 then
					tbl9[#tbl9 + 1] = k
				end
			end

			table.sort(tbl9)
			return tbl9
		end,
		set = function(arg2)
			table.clear(tbl)

			if type(arg2) == "table" then
				for _, v18 in ipairs(arg2) do
					if type(v18) == "string" then
						tbl[v18] = true
					end
				end
			end

			if arg.onAimTabOpened then
				arg.onAimTabOpened()
			end
		end,
	}

	sectionLabel(aim, "Target Roles", 30)

	makeToggleRow(aim, "flag", "Role Filter", "Only aim at the roles turned ON below (e.g. Police only).", 31, false, function(arg2)
		flag7 = arg2
	end, "aimRoleFilterOn")

	makeToggleRow(aim, "user", "Wanted Only", "Only aim at players with a wanted level (active criminals).", 33, false, function(arg2)
		flag8 = arg2
	end, "aimWantedOnly")

	local ScrollingFrame2 = make("ScrollingFrame", {
		Parent = aim,
		Size = UDim2.new(1, 0, 0, 132),
		BackgroundColor3 = c.SURFACE,
		BorderSizePixel = 0,
		LayoutOrder = 32,
		CanvasSize = UDim2.new(0, 0, 0, 0),
		ScrollBarThickness = 4,
		ScrollBarImageColor3 = c.ACCENT,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = ScrollingFrame2 })
	make("UIListLayout", { Parent = ScrollingFrame2, Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder })

	make("UIPadding", {
		Parent = ScrollingFrame2,
		PaddingTop = UDim.new(0, 5),
		PaddingBottom = UDim.new(0, 5),
		PaddingLeft = UDim.new(0, 5),
		PaddingRight = UDim.new(0, 5),
	})

	local fn50 = nil

	fn50 = function()
		for _, child in ipairs(ScrollingFrame2:GetChildren()) do
			if not (child:IsA("UIListLayout") or child:IsA("UIPadding")) then
				child:Destroy()
			end
		end

		for i, v18 in ipairs(tbl2) do
			local Frame2 = make("Frame", {
				Parent = ScrollingFrame2,
				Size = UDim2.new(1, 0, 0, 30),
				BackgroundColor3 = c.SURFACE2,
				BorderSizePixel = 0,
				LayoutOrder = i,
			})

			make("UICorner", { CornerRadius = UDim.new(0, 4), Parent = Frame2 })

			make("TextLabel", {
				Parent = Frame2,
				Size = UDim2.new(1, -74, 1, 0),
				Position = UDim2.fromOffset(10, 0),
				BackgroundTransparency = 1,
				Text = v18,
				Font = Enum.Font.Gotham,
				TextSize = 11,
				TextColor3 = c.TEXT,
				TextXAlignment = Enum.TextXAlignment.Left,
			})

			local flag25 = tbl3[v18] == true

			local TextButton = make("TextButton", {
				Parent = Frame2,
				Size = UDim2.fromOffset(50, 22),
				Position = UDim2.new(1, -56, 0.5, -11),
				BackgroundColor3 = flag25 and c.GREEN or c.OFF,
				BorderSizePixel = 0,
				Text = flag25 and "ON" or "OFF",
				Font = Enum.Font.GothamBold,
				TextSize = 10,
				TextColor3 = flag25 and Color3.new(1, 1, 1) or c.SUBTEXT,
				AutoButtonColor = false,
			})

			make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = TextButton })
			arg.hover(TextButton, { BackgroundColor3 = (flag25 and c.GREEN or c.OFF):Lerp(Color3.new(1, 1, 1), 0.16) })

			track(TextButton.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()R[1][R[2]]=not R[1][R[2]];R[3][7][R[3][6]]();end)))
		end
	end

	fn50()

	arg.configReg.aimRoleFilterRoles = {
		get = function()
			local tbl9 = {}

			for _, v18 in ipairs(tbl2) do
				if not tbl3[v18] then
					tbl9[#tbl9 + 1] = v18
				end
			end

			return tbl9
		end,
		set = function(arg2)
			for _, v18 in ipairs(tbl2) do
				tbl3[v18] = true
			end

			if type(arg2) == "table" then
				for _, v18 in ipairs(arg2) do
					if tbl3[v18] ~= nil then
						tbl3[v18] = false
					end
				end
			end

			fn50()
		end,
	}
end
