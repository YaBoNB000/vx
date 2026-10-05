
return function(arg)
	local v2, make, c2, notify, track, state, localPlayer, replicatedStorage, workspace_, getRoot
	local atLowIdentity, makeToggleRow, sectionLabel, cheats, UserInputService, flag, cFrame, flag2, flag3, flag4
	local str, n2, flag5, n3, n4, tbl, flag6, fn, fn2, fn3
	local fn4, fn5

	do
		v2 = arg
		make = v2.make
		c2 = v2.C
		notify = v2.notify
		track = v2.track
		state = v2.state
		localPlayer = v2.LocalPlayer
		local runService
		runService = v2.RunService
		local camera
		camera = v2.Camera
		replicatedStorage = v2.ReplicatedStorage
		workspace_ = v2.Workspace
		getRoot = v2.getRoot
		atLowIdentity = v2.atLowIdentity
		makeToggleRow = v2.makeToggleRow
		local makeSlider
		makeSlider = v2.makeSlider
		sectionLabel = v2.sectionLabel
		cheats = v2.pages.cheats
		v2.autoJobs = v2.autoJobs or {}

		v2.soloJob = function(arg2)
			for k, autoJob in pairs(v2.autoJobs) do
				if k ~= arg2 then
					pcall(autoJob)
				end
			end
		end

		sectionLabel(cheats, "Money", 1)

		do
			local VirtualInputManager = game:GetService("VirtualInputManager")
			local color = Color3.fromRGB(74, 75, 93)
			local flag7 = false
			local tbl2 = {}
			local v = nil

			local function fn6(arg2)
				while arg2 do
					if arg2:IsA("LayerCollector") then
						return arg2.Enabled
					end

					if arg2:IsA("GuiObject") and not arg2.Visible then
						return false
					end
					arg2 = arg2.Parent
				end

				return false
			end

			local function fn7()
				local playerGui = localPlayer:FindFirstChild("PlayerGui")
				if not playerGui then
					return nil
				end
				local v3 = nil

				for _, child in ipairs(playerGui:GetChildren()) do
					local ok, result = pcall(function()
						return child.Center.Middle.HackingMinigames["ATM Hack"]
					end)

					if ok and result then
						if fn6(result) then
							return result
						end
						v3 = v3 or result
					end
				end

				return v3
			end

			local function fn8(arg2)
				local tbl3 = {}

				for match in string.gmatch(arg2.Sequence1.Text, "([^%s]+)") do
					table.insert(tbl3, match)
				end

				return tbl3
			end

			local function fn9(arg2)
				local absolutePosition = arg2.AbsolutePosition
				local absoluteSize = arg2.AbsoluteSize
				local n = absolutePosition.X + absoluteSize.X / 2
				local n5 = absolutePosition.Y + absoluteSize.Y / 2

				if v2.IS_MOBILE then
					if pcall(function()
						VirtualInputManager:SendTouchEvent(1, 0, n, n5)
						VirtualInputManager:SendTouchEvent(1, 2, n, n5)
					end) then
						return
					end
				end

				VirtualInputManager:SendMouseButtonEvent(n, n5, 0, true, game, 0)
				VirtualInputManager:SendMouseButtonEvent(n, n5, 0, false, game, 0)
			end

			local function fn10(arg2, arg3)
				for _, descendant in ipairs(arg2.List:GetDescendants()) do
					if descendant:IsA("ImageButton") and not tbl2[descendant] and descendant.ImageColor3 ~= color then
						for _, descendant2 in ipairs(descendant:GetDescendants()) do
							if descendant2:IsA("TextLabel") and descendant2.Text == arg3 then
								return descendant
							end
						end
					end
				end

				return nil
			end

			local n5 = 0.06
			local n6 = 0

			local function fn11(arg2)
				if os.clock() < n6 then
					return false
				end

				for _, v3 in ipairs(fn8(arg2)) do
					local v4 = fn10(arg2, v3)

					if v4 then
						fn9(v4)
						tbl2[v4] = true
						n6 = os.clock() + n5
						return true
					end
				end

				return false
			end

			track(runService.Heartbeat:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()if not l[1][4][l[1][7]]then return;end;local q=l[2][4][l[2][7]]();if q and(l[3][4][l[3][7]](q))and q.Sequence1.Text~=""then local X=q.Sequence1.Text;if X~=l[4][4][l[4][7]]then l[4][4][l[4][7]]=X;l[5][4][l[5][7]]=os.clock();table.clear(l[6]);elseif next(l[6])~=nil and os.clock()-l[5][4][l[5][7]]>0.8 then table.clear(l[6]);l[5][4][l[5][7]]=os.clock();if l[7].log then l[7].log("[atm] stuck, re-entering the code","warn");end;end;local C,n=pcall(l[8][4][l[8][7]],q);X=C and n;if X then l[5][4][l[5][7]]=os.clock();end;else l[4][4][l[4][7]]=nil;end;end)))

			makeToggleRow(cheats, "banknote", "Auto ATM", "Solves the ATM hack minigame", 2, false, function(arg2)
				flag7 = arg2

				if arg2 then
					table.clear(tbl2)
					v = nil
				end
			end, "autoAtm")
		end

		do
			local flag7 = false
			local flag8 = false
			local n = 0
			local flag9 = false
			local v = nil
			local entities = nil
			local playerFunc = nil

			local function fn6()
				if flag8 then
					return true
				end

				flag8 = pcall(function()
					atLowIdentity(function()
						local algorithms = replicatedStorage.Modules.Algorithms
						v = require(replicatedStorage.Modules.ModuleLoader).assign(algorithms)
					end)

					entities = workspace.Gameplay.Entities
					playerFunc = replicatedStorage.Remote.PlayerFunc
				end)

				return flag8
			end

			local function fn7()
				if flag9 then
					return
				end
				flag9 = true
				v.invokeServerTraffic("miniGolf", "createLobby")
				task.wait(1)
				v.invokeServerTraffic("miniGolf", "setLobbyReady")
			end

			local function fn8()
				local v3 = nil

				for _, child in ipairs(entities:GetChildren()) do
					if child:IsA("Model") and child.Name == "Content" then
						v3 = child:FindFirstChild(localPlayer.Name)
						if not v3 then
							continue
						end
					else
						continue
					end

					break
				end

				if not v3 then
					fn7()
					return
				end
				flag9 = false
				local parent = v3.Parent
				if not parent then
					return
				end
				local flag10 = parent:FindFirstChild("_Flag")
				if not flag10 then
					return
				end
				local flagPole = flag10:FindFirstChild("FlagPole")
				if not flagPole then
					return
				end
				local part = flagPole:FindFirstChild("Part")
				if not part or not part:IsA("BasePart") then
					return
				end
				playerFunc:InvokeServer("miniGolf", "shot")
				task.wait(1)
				playerFunc:InvokeServer("miniGolf", "shot")
				task.wait(0.5)

				if v3:IsA("BasePart") then
					v3.CFrame = part.CFrame
				elseif v3:IsA("Model") then
					v3:PivotTo(part.CFrame)
				end
			end

			local v3 = nil

			local function toggleAutoGolf(arg2)
				if arg2 and not fn6() then
					v2.log("Auto Golf: couldn't load miniGolf modules for this game.", "warn")

					if v3 then
						v3(false)
					end

					return
				end

				flag7 = arg2

				if arg2 then
					n += 1

					task.spawn(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
				function()while l[1][4][l[1][7]]and l[2].running and l[3]==l[4][4][l[4][7]]do task.wait(3);if not(l[1][4][l[1][7]]and l[2].running and l[3]==l[4][4][l[4][7]])then break;end;pcall(l[5]);end;end))
				end
			end

			v2.toggleAutoGolf = toggleAutoGolf

			local function fn9(arg2)
				toggleAutoGolf(arg2)
			end

			v3 = makeToggleRow
			v3 = v3(cheats, "flag", "Auto Golf", "Auto-completes golf rounds", 3, false, fn9, "autoGolf")
		end

		do
			local v = nil
			local flag7 = false
			local flag8 = false

			local function fn6()
				local HttpService = game:GetService("HttpService")
				local vxsansSession = getgenv and getgenv().VXSANS_SESSION or _G.VXSANS_SESSION or ""
				local vxsansHwid = getgenv and getgenv().VXSANS_HWID or _G.VXSANS_HWID or ""
				local str2 = (getgenv and getgenv().VXSANS_HOST or _G.VXSANS_HOST or "https://api.vxsans.xyz") .. "/premium.php?m=autohack&token=" .. HttpService:UrlEncode(tostring(vxsansSession)) .. "&hwid=" .. HttpService:UrlEncode(tostring(vxsansHwid))
				local request_ = syn and syn.request
				local request_2

				if request_ then
					request_2 = request_
				else
					request_2 = http and http.request
				end

				local v3 = request_2 or http_request or request
				local body = nil

				if v3 then
					local ok, result = pcall(function()
						return v3({ Url = str2, Method = "GET" })
					end)

					ok = ok and type(result) == "table" and (not result.StatusCode or result.StatusCode < 400)
					local v4 = nil

					if ok then
						body = result.Body
					else
						body = v4
					end
				end

				local result

				if not body then
					local ok

					ok, result = pcall(function()
						return game:HttpGet(str2)
					end)

					if not ok then
						result = body
					end
				else
					result = body
				end

				if type(result) ~= "string" or #result < 64 then
					return nil, type(result) == "string" and result:match("^%-%-%s*(.-)%s*$") or nil
				end
				return result
			end

			local function fn7()
				if flag7 then
					return true
				end

				if flag8 then
					return false
				end
				flag8 = true
				local v3, v4 = fn6()
				flag8 = false
				if not v3 then
					return false, v4
				end
				local ok, result = pcall(loadstring, v3)
				if not ok or type(result) ~= "function" then
					return false
				end
				local ok2, result2 = pcall(result)
				if not ok2 or type(result2) ~= "function" then
					return false
				end
				local ok3, result3 = pcall(result2, v2)
				if not ok3 or type(result3) ~= "function" then
					return false
				end
				v = result3
				flag7 = true
				return true
			end

			local v3 = nil

			local function fn8(arg2)
				if arg2 then
					if not (v2.VX and v2.VX.pm) then
						if v2.premiumPopup then
							v2.premiumPopup("Auto Hack")
						elseif notify then
							notify("Auto Hack is Premium — upgrade at vxsans.xyz", "err")
						end

						if v3 then
							v3(false)
						end

						return
					end

					local v4, v5 = fn7()

					if not v4 then
						local str2

						if v5 == "premium required" then
							str2 = "Auto Hack is Premium, upgrade at vxsans.xyz"
						else
							local flag9 = v5 == "expired" or v5 == "bad token"
							str2 = "Auto Hack: couldn't load, try again"

							if flag9 then
								str2 = "Auto Hack: session went stale, relaunch from the loader"
							end
						end

						if notify then
							notify(str2, "err")
						end

						if v3 then
							v3(false)
						end

						return
					end
				end

				if v then
					local ok, result = pcall(v, arg2)
					local flag9

					if arg2 then
						flag9 = not ok or result == false
					else
						flag9 = arg2
					end

					if flag9 and v3 then
						v3(false)
					end
				end
			end

			v3 = makeToggleRow
			v3 = v3(cheats, "cpu", "Auto Hack ⭐", "Premium · auto-solves every hack minigame", 4, false, fn8, "autoHack")
		end

		do
			local flag7 = false
			local n = 0
			local playerFunc = nil
			local playerEvent = nil

			local function fn6()
				if playerFunc and playerFunc.Parent then
					return playerFunc
				end
				local remote = replicatedStorage:FindFirstChild("Remote")
				playerFunc = remote and remote:FindFirstChild("PlayerFunc")
				return playerFunc
			end

			local function fn7()
				if playerEvent and playerEvent.Parent then
					return playerEvent
				end
				local remote = replicatedStorage:FindFirstChild("Remote")
				playerEvent = remote and remote:FindFirstChild("PlayerEvent")
				return playerEvent
			end

			local function fn8()
				local v = fn7()

				if v then
					pcall(function()
						v:FireServer("interacted")
					end)
				end
			end

			local tbl2 = {}
			local flag8 = false

			local function fn9(arg2)
				local parent = arg2.Parent
				local n5 = 0
				local flag9 = false
				local flag10 = false

				while parent and n5 < 8 do
					local str2 = tostring(parent.Name):lower()

					if str2:find("sack", 1, true) or str2:find("loot", 1, true) or str2:find("money bag", 1, true) or str2:find("cash bag", 1, true) then
						flag9 = true
					end

					if str2 == "content" then
						flag10 = true
					end

					parent = parent.Parent
					n5 += 1
				end

				return flag9 or flag10
			end

			local function fn10(arg2)
				if not arg2:IsA("ProximityPrompt") then
					return
				end

				if arg2.Name == "CashDrop" then
					tbl2[arg2] = "cashdrop"
				elseif arg2.Name == "Mission" then
					tbl2[arg2] = "mission"
				elseif fn9(arg2) then
					tbl2[arg2] = "cash"
				end
			end

			local function fn11()
				if flag8 then
					return
				end
				flag8 = true

				for _, descendant in ipairs(workspace_:GetDescendants()) do
					fn10(descendant)
				end

				track(workspace_.DescendantAdded:Connect(v2.safe(fn10)))

				track(workspace_.DescendantRemoving:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
				function(q)l[1][q]=nil;end)))
			end

			local function fn12(arg2)
				local access = arg2:FindFirstChild("Access")
				if not access then
					return true
				end
				local str2 = tostring(access.Value)
				if str2 == "" then
					return true
				end

				for _, part in ipairs(string.split(str2, ";")) do
					if part == localPlayer.Name then
						return true
					end
				end

				return false
			end

			local fireproximityprompt_ = fireproximityprompt

			if not fireproximityprompt_ and getgenv then
				fireproximityprompt_ = getgenv().fireproximityprompt
			end

			local n5 = 220

			local function fn13(arg2, arg3)
				if not arg3 then
					return true
				end
				local parent = arg2.Parent
				local position

				if parent and parent:IsA("BasePart") then
					position = parent.Position
				else
					position = nil

					if parent then
						local ok, result = pcall(function()
							return parent:GetPivot()
						end)

						position = nil

						if ok then
							position = result.Position
						end
					end
				end

				if not position then
					return true
				end
				return (position - arg3).Magnitude <= n5
			end

			local tbl3 = { Steal = true, Take = true, Remove = true }
			local obj = setmetatable({}, { __mode = "k" })

			local function fn14()
				local v = fn6()
				local now = os.clock()
				local character = localPlayer.Character
				character = character and character:FindFirstChild("HumanoidRootPart")
				character = character and character.Position

				for k, v3 in pairs(tbl2) do
					if not k.Parent then
						tbl2[k] = nil
					else
						local enabled = k.Enabled

						if enabled then
							enabled = now - (obj[k] or 0) >= 1
						end

						if enabled then
							if v3 == "cashdrop" then
								if v and fn12(k) and fn13(k, character) then
									obj[k] = now

									v2.spawnS(function()
										fn8()
										local n6 = tonumber(k.HoldDuration) or 0

										if n6 > 0 then
											task.wait(n6)
										end

										os.clock()

										pcall(function()
											return v:InvokeServer("cashDrop", k)
										end)
									end)
								end
							elseif v3 == "mission" then
								if v and tbl3[k.ActionText] then
									obj[k] = now

									v2.spawnS(function()
										fn8()

										pcall(function()
											v:InvokeServer("talkToMission", k.Parent)
										end)
									end)
								end
							elseif v3 == "cash" then
								if fireproximityprompt_ and fn13(k, character) then
									obj[k] = now

									v2.spawnS(function()
										fn8()
										pcall(fireproximityprompt_, k)
									end)
								end
							end
						end
					end
				end
			end

			local function fn15()
				n += 1
				local v = n

				v2.spawnS(function()
					while flag7 and state.running and v == n do
						fn14()
						task.wait(0.4)
					end
				end)
			end

			makeToggleRow(v2.pages.tools, "banknote", "Auto Steal Cash", "Grabs cash bags, bank/store sacks & steal drops nearby", 7, false, function(arg2)
				flag7 = arg2

				if arg2 then
					fn11()
					fn15()
				end
			end, "autoStealCash")

			table.insert(v2.cleanups, function()
				flag7 = false
			end)
		end

		sectionLabel(cheats, "Player", 10)

		do
			local flag7 = false
			local flag8 = false
			local v = nil
			local flag9 = false

			local function fn6()
				if v or flag9 then
					return
				end
				flag9 = true

				v2.spawnS(function()
					local ok, result = pcall(function()
						local modules = replicatedStorage:WaitForChild("Modules", 20)
						local moduleLoader = modules and modules:WaitForChild("ModuleLoader", 20)

						if not moduleLoader then
							error("Modules.ModuleLoader not found")
						end

						local playerScripts = localPlayer:WaitForChild("PlayerScripts", 20)
						playerScripts = playerScripts and playerScripts:WaitForChild("Framework", 20)
						playerScripts = playerScripts and playerScripts:WaitForChild("Core", 20)

						if not playerScripts then
							error("PlayerScripts.Framework.Core not found")
						end

						return atLowIdentity(function()
							return require(moduleLoader).assign(playerScripts)
						end)
					end)

					if ok and result then
						v = result
					else
						v2.log("Stamina/Food load failed: " .. tostring(result), "warn")
					end

					flag9 = false
				end)
			end

			local flag10 = false

			local function fn7()
				if flag10 or not v then
					return
				end
				local setCoreStaminaOrFood = v.setCoreStaminaOrFood
				if type(setCoreStaminaOrFood) ~= "function" then
					return
				end

				v.setCoreStaminaOrFood = function(arg2, arg3, ...)
					local v3 = v[arg2]

					if type(v3) == "number" and type(arg3) == "number" and arg3 < v3 then
						if arg2 == "food" and flag8 or arg2 == "stamina" and flag7 then
							return
						end
					end

					local v4 = table.pack(...)
					local v5 = setCoreStaminaOrFood
					v4.n = 3 + v4.n - 1
					table.move(v4, 1, v4.n, 3, v4)
					v4[1] = arg2
					v4[2] = arg3
					return v5(table.unpack(v4, 1, v4.n))
				end

				flag10 = true
			end

			track(runService.Heartbeat:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(q)if not(l[1][4][l[1][7]]or l[2][4][l[2][7]])or not l[3][4][l[3][7]]then return;end;if not l[4][4][l[4][7]]then l[5][4][l[5][7]]();end;end)))

			makeToggleRow(cheats, "footprints", "Infinite Stamina", "Stamina never goes down", 11, false, function(arg2)
				flag7 = arg2

				if arg2 then
					fn6()
				end
			end, "infStamina")

			makeToggleRow(cheats, "beef", "Infinite Hunger", "Hunger never goes down. Eat once first if you're low", 12, false, function(arg2)
				flag8 = arg2

				if arg2 then
					fn6()
				end
			end, "infHunger")
		end

		sectionLabel(cheats, "Protection", 13)

		do
			local Ragdoll = nil
			local Core = nil
			local onRagdoll = nil
			local flag7 = false

			local function fn6()
				if Ragdoll then
					return true
				end

				pcall(function()
					atLowIdentity(function()
						Core = require(localPlayer.PlayerScripts.Framework.Core)
						Ragdoll = require(replicatedStorage.Modules.Ragdoll)
					end)
				end)

				return Ragdoll ~= nil
			end

			local flag8 = false

			v2.gameRagdollActive = function()
				if not Ragdoll then
					if not flag8 then
						flag8 = true
						v2.spawnS(fn6)
					end

					return false
				end

				return Ragdoll.isActive == true
			end

			local activate = nil
			local connection = nil

			local function fn7(arg2)
				if arg2 then
					if not fn6() then
						if notify then
							notify("Anti-ragdoll: modules not found here", "err")
						end

						return
					end

					if not flag7 then
						activate = rawget(Ragdoll, "activate")

						if type(activate) == "function" then
							Ragdoll.activate = function(arg3, arg4, ...)
								if arg3 == localPlayer.Character then
									if arg4 then
										Ragdoll.isActive = true
										v2._ragPretend = os.clock()
										return
									end

									if v2._ragPretend then
										v2._ragPretend = nil
										Ragdoll.isActive = false
										return
									end

									if not Ragdoll.isActive then
										return
									end
								end

								return activate(arg3, arg4, ...)
							end
						end

						if Core then
							onRagdoll = Core.onRagdoll

							Core.onRagdoll = function()
							end
						end

						flag7 = true
					end

					if not connection then
						connection = runService.Heartbeat:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
				function(q)l[1][4][l[1][7]]+=q;if l[1][4][l[1][7]]<0.05 then return;end;l[1][4][l[1][7]]=0;q=l[2].Character;local X=q and(q:FindFirstChild("HumanoidRootPart"));if not X then return;end;local C=l[3]._ragPretend;if C and(os.clock()-C>0.6 and X.AssemblyLinearVelocity.Y>-5 or os.clock()-C>4)then l[3]._ragPretend=nil;pcall(function()l[4][4][l[4][7]].isActive=false;end);end;if X.AssemblyRootPart~=X then return;end;local C,n=false,X:FindFirstChild("RagdollRootBallSocket");if n and n.Enabled then pcall(function()n.Enabled=false;end);C=true;end;for n,n in ipairs(q:GetDescendants())do if n:IsA("AnimationConstraint")and not n.Enabled then pcall(function()n.Enabled=true;end);C=true;end;end;if C then l[3]._ragFixUntil=os.clock()+3;end;if os.clock()<(l[3]._ragFixUntil or 0)and l[3].noclipActive~=true and not X.CanCollide then pcall(function()X.CanCollide=true;end);end;end))

						track(connection)
					end
				else
					if connection then
						pcall(function()
							connection:Disconnect()
						end)

						connection = nil
					end

					if v2._ragPretend then
						v2._ragPretend = nil

						pcall(function()
							Ragdoll.isActive = false
						end)
					end

					if flag7 and Ragdoll then
						if activate then
							pcall(function()
								Ragdoll.activate = activate
							end)

							activate = nil
						end

						if Core and onRagdoll ~= nil then
							pcall(function()
								Core.onRagdoll = onRagdoll
							end)
						end

						flag7 = false
					end
				end
			end

			local flag9 = false
			local n = 0
			local Part = nil
			local flag10 = false
			local flag11 = false

			local function fn8()
				if Part and Part.Parent then
					return
				end

				Part = make("Part", {
					Name = "SafeFloor",
					Size = Vector3.new(48, 1, 48),
					Anchored = true,
					Transparency = 0.5,
					CanCollide = true,
					Parent = workspace_,
				})
			end

			local tbl2 = {}

			local function fn9(arg2)
				if arg2:IsA("Model") and arg2.Name == "PD Handcuffs" then
					tbl2[arg2] = true
				end
			end

			for _, descendant in ipairs(workspace_:GetDescendants()) do
				fn9(descendant)
			end

			track(workspace_.DescendantAdded:Connect(v2.safe(fn9)))

			track(workspace_.DescendantRemoving:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(q)l[1][q]=nil;end)))

			local function fn10(arg2)
				for k in pairs(tbl2) do
					if k.Parent then
						local handle = k:FindFirstChild("Handle") or k:FindFirstChildWhichIsA("BasePart")
						if handle and (handle.Position - arg2.Position).Magnitude < 8 then
							return true
						end
						continue
					end

					tbl2[k] = nil
				end

				return false
			end

			local function fn11(arg2)
				flag9 = arg2

				if arg2 then
					local character = localPlayer.Character

					if not (character and getRoot(character)) then
						if notify then
							notify("Anti-arrest: no character yet", "err")
						end

						return
					end

					fn8()
					n += 1
					local v = n

					v2.spawnS(function()
						while flag9 and state.running and v == n do
							local character2 = localPlayer.Character
							character2 = character2 and getRoot(character2)
							local team = localPlayer.Team

							if character2 and not (team ~= nil and team.Name == "Police") and not flag10 and not flag11 and fn10(character2) then
								flag10 = true
								flag11 = true
								fn8()
								Part.Position = Vector3.new(character2.Position.X, -500, character2.Position.Z)
								character2.CFrame = CFrame.new(Part.Position + Vector3.new(0, 3, 0))
								task.wait(8)
								flag10 = false
								task.wait(8)
								flag11 = false
							else
								task.wait(0.3)
							end
						end
					end)
				else
					if Part then
						pcall(function()
							Part:Destroy()
						end)

						Part = nil
					end

					flag10 = false
					flag11 = false
				end
			end

			makeToggleRow(cheats, "bandage", "Anti Ragdoll", "Stops the game ragdolling you", 14, false, function(arg2)
				fn7(arg2)
			end, "antiRagdoll")

			makeToggleRow(cheats, "siren", "Anti Arrest", "Dodges nearby handcuffs automatically", 15, false, function(arg2)
				fn11(arg2)
			end, "antiArrest")

			local connection2 = nil
			local VirtualUser = game:GetService("VirtualUser")

			local function fn12(arg2)
				if arg2 then
					if connection2 then
						return
					end

					connection2 = localPlayer.Idled:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
				function()pcall(function()l[1]:CaptureController();l[1]:ClickButton2(Vector2.new());end);end))

					track(connection2)
				elseif connection2 then
					pcall(function()
						connection2:Disconnect()
					end)

					connection2 = nil
				end
			end

			makeToggleRow(cheats, "clock", "Anti AFK", "Stops the game kicking you for being idle.", 16, false, function(arg2)
				fn12(arg2)
			end, "antiAfk")

			table.insert(v2.cleanups, function()
				fn11(false)
				fn7(false)
				fn12(false)
			end)
		end

		do
			local genv = getgenv and getgenv() or _G
			genv.__vxND = genv.__vxND or { on = false }
			local vxND = genv.__vxND

			local function fn6()
				if not (getgenv and getgenv().__vxNCHooks) then
					return
				end
				local vxNDHook = genv.__vxNDHook

				if not vxNDHook then
					vxNDHook = not (hookmetamethod and getnamecallmethod)
				end

				if vxNDHook then
					return
				end
				local remote = replicatedStorage:FindFirstChild("Remote")
				if not (remote and remote:FindFirstChild("PlayerEvent")) then
					return
				end

				genv.__vxNDHook = pcall(function()
					hookmetamethod(game, "__namecall", --[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
					function(q,...)if l[1].on and q==l[2][4][l[2][7]]and getnamecallmethod()=="FireServer"and...=="takeDamage"then return;end;return l[3][4][l[3][7]](q,...);end)
				end) or nil
			end

			makeToggleRow(cheats, "shield-check", "No Damage", "Blocks crash / fall / run-over damage", 16, false, function(on)
				vxND.on = on

				if on then
					fn6()
				end
			end, "noDamage")

			table.insert(v2.cleanups, function()
				vxND.on = false
			end)
		end

		sectionLabel(cheats, "Roads", 17)

		do
			local tbl2 = { _TrafficLightArea = true, _SpeedCameraArea = true }
			local flag7 = false
			local n = 0
			local tbl3 = {}

			local function fn6()
				local world = workspace_:FindFirstChild("World")
				return world and world:FindFirstChild("Interactive")
			end

			local function fn7(arg2)
				if flag7 and tbl2[arg2.Name] and arg2.Parent and not tbl3[arg2] then
					tbl3[arg2] = arg2.Parent

					task.defer(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
				function()if l[1][l[2]]and l[2].Parent then pcall(function()l[2].Parent=nil;end);end;end))
				end
			end

			local function fn8()
				local v = fn6()
				if not v then
					return
				end

				for _, descendant in ipairs(v:GetDescendants()) do
					fn7(descendant)
				end
			end

			local function fn9()
				for k, v in pairs(tbl3) do
					pcall(function()
						if v.Parent then
							k.Parent = v
						end
					end)
				end

				table.clear(tbl3)
			end

			local flag8 = false

			local function fn10()
				if flag8 then
					return
				end
				local v = fn6()

				if v then
					flag8 = true
					track(v.DescendantAdded:Connect(v2.safe(fn7)))
				end
			end

			local function fn11(arg2)
				flag7 = arg2

				if arg2 then
					n += 1
					fn10()
					fn8()

					task.spawn(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
				function()while l[1][4][l[1][7]]and l[2].running and l[3]==l[4][4][l[4][7]]do l[5][4][l[5][7]]();l[6][4][l[6][7]]();task.wait(2);end;end))
				else
					fn9()
				end
			end

			makeToggleRow(cheats, "camera-off", "No Traffic Cams", "Ignores speed cams & lights", 18, false, function(arg2)
				fn11(arg2)
			end, "noTrafficCams")

			table.insert(v2.cleanups, function()
				fn11(false)
			end)
		end

		sectionLabel(cheats, "Weapons", 20)

		do
			local value = 999
			local flag7 = false
			local flag8 = false
			local obj = setmetatable({}, { __mode = "k" })

			local function fn6(arg2)
				if arg2 == "TotalAmmo" then
					return flag7
				end

				if arg2 == "Ammo" then
					return flag8
				end
				return false
			end

			local function fn7(arg2)
				if not (arg2 and arg2:IsA("IntValue")) then
					return
				end

				if fn6(arg2.Name) then
					arg2.Value = value
				end

				if not obj[arg2] then
					obj[arg2] = true

					track(arg2.Changed:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
				function(q)if l[1][4][l[1][7]](l[2].Name)and q~=l[3]then l[2].Value=l[3];end;end)))
				end
			end

			local function fn8()
				local character = localPlayer.Character
				if not character then
					return
				end

				for _, descendant in ipairs(character:GetDescendants()) do
					if descendant.Name == "Config" then
						fn7(descendant:FindFirstChild("TotalAmmo"))
						fn7(descendant:FindFirstChild("Ammo"))
					end
				end
			end

			local function fn9(arg2)
				track(arg2.DescendantAdded:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
				function(q)if(l[1][4][l[1][7]]or l[2][4][l[2][7]])and(q:IsA("IntValue"))and(q.Name=="TotalAmmo"or q.Name=="Ammo")and q.Parent and q.Parent.Name=="Config"then l[3][4][l[3][7]](q);end;end)))
			end

			if localPlayer.Character then
				fn9(localPlayer.Character)
			end

			track(localPlayer.CharacterAdded:Connect(v2.safe(fn9)))

			makeToggleRow(cheats, "infinity", "Infinite Ammo", "Reserve ammo never runs out", 21, false, function(arg2)
				flag7 = arg2

				if arg2 then
					fn8()
				end
			end, "infAmmo")

			makeToggleRow(cheats, "rotate-cw", "No Reload", "Clip stays full, so you never reload", 22, false, function(arg2)
				flag8 = arg2

				if arg2 then
					fn8()
				end
			end, "noReload")

			table.insert(v2.cleanups, function()
				flag7 = false
				flag8 = false
			end)
		end

		sectionLabel(cheats, "Police", 23)

		do
			local players = v2.Players
			local flag7 = false
			local n = 0
			local n5 = 20
			local n6 = 0.8
			local obj = setmetatable({}, { __mode = "k" })
			local playerFunc = nil

			local function fn6()
				if playerFunc and playerFunc.Parent then
					return playerFunc
				end
				local remote = replicatedStorage:FindFirstChild("Remote")
				playerFunc = remote and remote:FindFirstChild("PlayerFunc")
				return playerFunc
			end

			local function fn7(arg2)
				local attribute = arg2:GetAttribute("WantedLevel")

				if type(attribute) ~= "number" then
					attribute = arg2.Character
					attribute = attribute and attribute:GetAttribute("WantedLevel")
				end

				return type(attribute) == "number" and attribute or 0
			end

			local function fn8(arg2)
				local attribute = arg2:GetAttribute("CharacterPosition")
				if typeof(attribute) == "Vector3" then
					return attribute
				end
				local v = getRoot(arg2.Character)
				return v and v.Position
			end

			local function fn9()
				local team = localPlayer.Team
				if not team then
					return false
				end
				local str2 = tostring(team.Name):lower()
				return str2:find("police") ~= nil or str2:find("sheriff") ~= nil or str2:find("trooper") ~= nil
			end

			local function fn10()
				n += 1
				local v = n

				v2.spawnS(function()
					while flag7 and state.running and v == n do
						if fn9() then
							local v3 = getRoot(localPlayer.Character)
							local v4 = fn6()

							if v3 and v4 then
								local position = v3.Position
								local now = os.clock()

								for _, player in ipairs(players:GetPlayers()) do
									if player ~= localPlayer and fn7(player) > 0 then
										local flag8 = fn8(player)
										flag8 = flag8 and (flag8 - position).Magnitude <= n5

										if flag8 then
											flag8 = now - (obj[player] or 0) >= n6
										end

										if flag8 then
											obj[player] = now

											v2.spawnS(function()
												pcall(function()
													v4:InvokeServer("handcuff", player, false)
												end)
											end)
										end
									end
								end
							end
						end

						task.wait(0.25)
					end
				end)
			end

			local v = nil

			local function fn11(arg2)
				local flag8

				if arg2 then
					flag8 = not (v2.VX and v2.VX.pm)
				else
					flag8 = arg2
				end

				if flag8 then
					if v2.premiumPopup then
						v2.premiumPopup("Auto Handcuff")
					elseif notify then
						notify("Auto Handcuff is Premium — upgrade at vxsans.xyz", "err")
					end

					if v then
						v(false)
					end

					return
				end

				flag7 = arg2

				if arg2 then
					fn10()
				end
			end

			v = makeToggleRow
			v = v(cheats, "handcuffs", "Auto Handcuff ⭐", "Premium · cuffs wanted players in range. Cuffs must be equipped.", 24, false, fn11, "autoCuff")

			table.insert(v2.cleanups, function()
				flag7 = false
			end)
		end

		sectionLabel(cheats, "Movement", 25)

		do
			local uis = v2.UIS
			local flag7 = false
			local obj = setmetatable({}, { __mode = "k" })
			local tbl2 = {}
			local flag8 = true
			local v3 = nil

			local function fn6(arg2)
				table.clear(tbl2)

				for _, descendant in ipairs(arg2:GetDescendants()) do
					if descendant:IsA("BasePart") then
						tbl2[#tbl2 + 1] = descendant
					end
				end

				flag8 = false
			end

			track(runService.Stepped:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()if not l[1][4][l[1][7]]then return;end;if os.clock()<(l[2]._noclipHoldUntil or 0)then for q in pairs(l[3])do if q.Parent and not q.CanCollide then q.CanCollide=true;end;end;return;end;local q=l[4].Character;if not q then return;end;if q~=l[5][4][l[5][7]]then l[5][4][l[5][7]],l[6][4][l[6][7]]=q,true;if l[7][4][l[7][7]]then l[7][4][l[7][7]]:Disconnect();end;l[7][4][l[7][7]]=q.DescendantAdded:Connect(function()l[6][4][l[6][7]]=true;end);end;if l[6][4][l[6][7]]then l[8][4][l[8][7]](q);end;local X=q:FindFirstChildOfClass("Humanoid");local C=X and(X:GetState());if C==Enum.HumanoidStateType.Ragdoll or C==Enum.HumanoidStateType.FallingDown or C==Enum.HumanoidStateType.Physics or l[2].gameRagdollActive and(l[2].gameRagdollActive())then for X in pairs(l[3])do if X.Parent and not X.CanCollide and X.Name~="HumanoidRootPart"then X.CanCollide=true;end;end;return;end;local X=q:FindFirstChild("HumanoidRootPart");if X and l[2].flyActive~=true then local C=X.AssemblyLinearVelocity;if C.Y<-l[9]then pcall(function()X.AssemblyLinearVelocity=Vector3.new(C.X,-l[9],C.Z);end);end;end;for X=1,#l[10],1 do q=l[10][X];if q.Parent and q.CanCollide then l[3][q]=true;q.CanCollide=false;end;end;end)))

			table.insert(v2.cleanups, function()
				if v3 then
					v3:Disconnect()
				end
			end)

			local function setNoclip(noclipActive)
				flag7 = noclipActive
				v2.noclipActive = noclipActive

				if not noclipActive then
					for k in pairs(obj) do
						if k and k.Parent then
							pcall(function()
								k.CanCollide = true
							end)
						end
					end

					table.clear(obj)
				end
			end

			makeToggleRow(cheats, "brick-wall", "No Clip", "Walk through walls", 26, false, function(arg2)
				setNoclip(arg2)
			end, "noclip")

			v2.__setNoclip = setNoclip
			local flag9 = false

			track(uis.JumpRequest:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()if not l[1][4][l[1][7]]then return;end;local q=l[2].Character;local X=q and(q:FindFirstChildOfClass("Humanoid"));if not(X and X.FloorMaterial==Enum.Material.Air)then return;end;if l[3][X:GetState()]then return;end;if l[4].gameRagdollActive and(l[4].gameRagdollActive())then return;end;if not(l[4].desyncActive and(l[4].desyncActive()))then local C=q:FindFirstChild("HumanoidRootPart");if C then if not l[5][4][l[5][7]]then l[5][4][l[5][7]]=RaycastParams.new();l[5][4][l[5][7]].FilterType=Enum.RaycastFilterType.Exclude;end;l[5][4][l[5][7]].FilterDescendantsInstances={q,l[6]:FindFirstChild("Characters")};local q=l[6]:Raycast(C.Position,Vector3.new(0,-4000,0),l[5][4][l[5][7]]);if q and C.Position.Y-q.Position.Y>(l[4].surfaceMaxH or 60)then return;end;end;end;X:ChangeState(Enum.HumanoidStateType.Jumping);end)))

			makeToggleRow(cheats, "feather", "Infinite Jump", "Jump again in mid-air", 27, false, function(infJumpActive)
				flag9 = infJumpActive
				v2.infJumpActive = infJumpActive
			end, "infJump")

			v2.flySpeed = v2.flySpeed or 100
			v2.flyActive = false
			local tbl3 = { held = {}, bound = nil }

			local function fn7()
				local playerGui = localPlayer:FindFirstChild("PlayerGui")
				playerGui = playerGui and playerGui:FindFirstChild("ScreenGui")
				if not playerGui then
					return 0, 0
				end

				local function fn8(arg2)
					local v = playerGui:FindFirstChild(arg2)
					local bottom = v and v:FindFirstChild("Bottom")
					bottom = bottom and bottom:FindFirstChild("Mobile")
					return bottom and bottom:FindFirstChild("Vehicle")
				end

				local Right = fn8("Right")
				local Left = fn8("Left")
				local gas = Right and Right:FindFirstChild("Gas")
				if not gas then
					return 0, 0
				end

				if tbl3.bound ~= gas then
					local v = tbl3
					tbl3.bound = gas
					v.held = {}
					local v4 = pairs
					local tbl4 = {}
					local brake = Right:FindFirstChild("Brake")
					local left = Left and Left:FindFirstChild("Left")
					Left = Left and Left:FindFirstChild("Right")
					tbl4[1] = gas
					tbl4[2] = brake
					tbl4[3] = left
					tbl4[4] = Left

					for _, v5 in v4(tbl4) do
						track(v5.InputBegan:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
				function(q)if q.UserInputType==Enum.UserInputType.Touch then l[1][l[2]]=true;end;end)))

						track(v5.InputEnded:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
				function(q)if q.UserInputType==Enum.UserInputType.Touch then l[1][l[2]]=false;end;end)))
					end
				end

				if not (Right.Visible and gas.Visible) then
					table.clear(tbl3.held)
					return 0, 0
				end
				local held = tbl3.held
				return (held.Gas and 1 or 0) - (held.Brake and 1 or 0), (held.Right and 1 or 0) - (held.Left and 1 or 0)
			end

			v2.flyDelta = function(arg2, arg3)
				local currentCamera = workspace_.CurrentCamera
				if not currentCamera then
					return Vector3.zero
				end
				local cFrame2 = currentCamera.CFrame
				local lookVector = cFrame2.LookVector
				local rightVector = cFrame2.RightVector
				local vector = Vector3.new(lookVector.X, 0, lookVector.Z)
				local vector2 = Vector3.new(rightVector.X, 0, rightVector.Z)
				local unit = vector.Magnitude > 0.001 and vector.Unit or Vector3.new(0, 0, -1)
				local unit2 = vector2.Magnitude > 0.001 and vector2.Unit or Vector3.new(1, 0, 0)
				local moveDirection = arg2.MoveDirection
				local v = moveDirection:Dot(unit)
				local v4 = moveDirection:Dot(unit2)

				if v2.IS_MOBILE and moveDirection.Magnitude < 0.05 then
					local v5, v6 = fn7()

					if v5 ~= 0 or v6 ~= 0 then
						v4 = v6
						v = v5
					end
				end

				local n = lookVector * v + unit2 * v4
				local jump = arg2.Jump or uis:IsKeyDown(Enum.KeyCode.Space)
				local n5 = 0

				if jump then
					n5 = 1
				end

				if uis:IsKeyDown(Enum.KeyCode.LeftControl) then
					n5 -= 1
				end

				local n6 = n + Vector3.new(0, n5, 0)
				if n6.Magnitude <= 0.001 then
					return Vector3.zero
				end
				local flySpeed = v2.flySpeed or 100

				if uis:IsKeyDown(Enum.KeyCode.LeftShift) then
					flySpeed *= 1.8
				end

				return n6.Unit * flySpeed * arg3
			end

			local raycastParams = nil
			local v4 = nil

			local function fn8()
				local character = localPlayer.Character

				if not raycastParams then
					raycastParams = RaycastParams.new()
					raycastParams.FilterType = Enum.RaycastFilterType.Exclude
				end

				if character ~= v4 then
					v4 = character
					local filterDescendantsInstances = {}

					if character then
						filterDescendantsInstances[#filterDescendantsInstances + 1] = character
					end

					local v = workspace_:FindFirstChild(v2.charsFolderName or v2.VX and v2.VX.ch or "Characters")

					if v then
						filterDescendantsInstances[#filterDescendantsInstances + 1] = v
					end

					local v5 = workspace_:FindFirstChild(v2.VX and v2.VX.gp or "Gameplay")

					if v5 then
						v5 = v5:FindFirstChild(v2.VX and v2.VX.vf or "Vehicles")
					end

					if v5 then
						filterDescendantsInstances[#filterDescendantsInstances + 1] = v5
					end

					raycastParams.FilterDescendantsInstances = filterDescendantsInstances
				end

				return raycastParams
			end

			local function fn9(arg2, arg3)
				local v = fn8()
				local position = typeof(arg2) == "Vector3" and arg2 or arg2.Position

				for i = 1, 2 do
					if not (arg3.Magnitude < 0.0001) then
						local hit = workspace_:Raycast(position, arg3.Unit * (arg3.Magnitude + 2.5), v)
						if hit then
							arg3 -= hit.Normal * arg3:Dot(hit.Normal)
							continue
						end
					end

					break
				end

				if arg3.Magnitude > 0.0001 and workspace_:Raycast(position, arg3.Unit * (arg3.Magnitude + 2.5), v) then
					return Vector3.zero
				end
				return arg3
			end

			v2.flyApply = function(arg2, arg3, arg4, arg5)
				local v = v2.flyDelta(arg3, arg4)
				if v.Magnitude < 0.0001 then
					return false
				end
				local cFrame2 = arg5 or arg2.CFrame

				if v2.noclipActive ~= true then
					v = fn9(cFrame2.Position, v)
				end

				if v.Magnitude < 0.0001 then
					return false
				end
				local n = cFrame2.Position + v
				local currentCamera = workspace_.CurrentCamera
				currentCamera = currentCamera and Vector3.new(currentCamera.CFrame.LookVector.X, 0, currentCamera.CFrame.LookVector.Z) or nil
				local cframe

				if currentCamera and currentCamera.Magnitude > 0.001 then
					cframe = CFrame.lookAt(n, n + currentCamera.Unit)
				else
					cframe = cFrame2 - cFrame2.Position + n
				end

				arg2.CFrame = cframe

				if arg5 and v2.ghostRebase then
					v2.ghostRebase(cframe)
				end

				return true
			end

			v2.surfaceFly = v2.surfaceFly ~= false
			v2.surfaceMaxH = v2.surfaceMaxH or 60
			local raycastParams2 = nil
			local v5 = nil
			local v6 = nil
			local v7 = nil
			local now = nil

			v2.surfaceClamp = function(arg2, arg3)
				if not v2.surfaceFly then
					v5 = nil
					return arg2
				end

				if not raycastParams2 then
					raycastParams2 = RaycastParams.new()
					raycastParams2.FilterType = Enum.RaycastFilterType.Exclude
				end

				local filterDescendantsInstances = { localPlayer.Character }
				local characters = workspace_:FindFirstChild("Characters")

				if characters then
					filterDescendantsInstances[#filterDescendantsInstances + 1] = characters
				end

				local gameplay = workspace_:FindFirstChild("Gameplay")

				if gameplay then
					local entities = gameplay:FindFirstChild("Entities")

					if entities then
						filterDescendantsInstances[#filterDescendantsInstances + 1] = entities
					end

					local vehicles = gameplay:FindFirstChild("Vehicles")

					if vehicles then
						filterDescendantsInstances[#filterDescendantsInstances + 1] = vehicles
					end
				end

				raycastParams2.FilterDescendantsInstances = filterDescendantsInstances
				local hit = workspace_:Raycast(Vector3.new(arg2.X, arg2.Y + 5, arg2.Z), Vector3.new(0, -20000, 0), raycastParams2)
				local y

				if hit then
					y = hit.Position.Y
					v6 = y
					v7 = arg2
					now = nil
				else
					if not now then
						now = os.clock()
					end

					if v7 and os.clock() - now > 2.5 then
						v5 = nil
						return v7
					end

					if not v6 then
						v5 = nil
						return arg2
					end
					y = v6
				end

				local n = y + (v2.surfaceMaxH or 60)
				if arg2.Y <= n then
					v5 = nil
					return arg2
				end
				local n5 = math.max(n, (v5 or arg2.Y) - (v2.flySpeed or 100) * (arg3 or 0.016666666666666666) * 2 + 8)
				v5 = n5
				return Vector3.new(arg2.X, n5, arg2.Z)
			end

			local flag10 = false
			local v8 = nil
			local flag11 = false
			local n5 = 5
			local n6 = 40
			local raycastParams3 = RaycastParams.new()
			raycastParams3.FilterType = Enum.RaycastFilterType.Exclude
			raycastParams3.IgnoreWater = true

			local function fn10(arg2)
				if v2.ghostActive and v2.ghostActive() then
					pcall(function()
						arg2.Anchored = true
					end)

					v8 = arg2
					return
				end

				local filterDescendantsInstances = { arg2.Parent }
				local characters = workspace_:FindFirstChild("Characters")

				if characters then
					filterDescendantsInstances[#filterDescendantsInstances + 1] = characters
				end

				local gameplay = workspace_:FindFirstChild("Gameplay")

				if gameplay then
					local entities = gameplay:FindFirstChild("Entities")

					if entities then
						filterDescendantsInstances[#filterDescendantsInstances + 1] = entities
					end

					local vehicles = gameplay:FindFirstChild("Vehicles")

					if vehicles then
						filterDescendantsInstances[#filterDescendantsInstances + 1] = vehicles
					end
				end

				raycastParams3.FilterDescendantsInstances = filterDescendantsInstances
				local hit = workspace_:Raycast(arg2.Position + Vector3.new(0, 4, 0), Vector3.new(0, -4096, 0), raycastParams3)
				local cFrame2 = arg2.CFrame
				local n = hit and hit.Position.Y - n5 or arg2.Position.Y - n6
				local n7 = cFrame2 - cFrame2.Position
				local cFrame3 = CFrame.new(arg2.Position.X, n, arg2.Position.Z) * n7
				flag11 = true

				pcall(function()
					arg2.CFrame = cFrame3
					arg2.AssemblyLinearVelocity = Vector3.zero
					arg2.AssemblyAngularVelocity = Vector3.zero
				end)

				task.wait(0.15)

				if flag10 and arg2.Parent then
					pcall(function()
						arg2.Anchored = true
					end)

					v8 = arg2

					pcall(function()
						arg2.CFrame = cFrame2
					end)
				end

				flag11 = false
			end

			local v9 = nil

			local function fn11()
				local v = v8
				v8 = nil
				if not v then
					return
				end

				if v2.ghostActive and v2.ghostActive() then
					return
				end

				pcall(function()
					v.Anchored = false
					v.AssemblyLinearVelocity = Vector3.zero
					v.AssemblyAngularVelocity = Vector3.zero
				end)
			end

			track(runService.Heartbeat:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(q)if not l[1][4][l[1][7]]or l[2][4][l[2][7]]then return;end;if l[3].desyncActive and(l[3].desyncActive())then return;end;local X=l[4].Character;local C,n=X and(X:FindFirstChild("HumanoidRootPart")),X and(X:FindFirstChildOfClass("Humanoid"));if not(C and n)then return;end;if l[5]then if l[6][4][l[6][7]]then l[7][4][l[7][7]]();end;local N=l[3].ghostActive and(l[3].ghostActive())and l[3].ghostRealCF and(l[3].ghostRealCF())or nil;local j=N and N.Position or C.Position;X=not l[8][4][l[8][7]]or(j-l[8][4][l[8][7]]).Magnitude>8;if X then l[8][4][l[8][7]]=j;end;local c=l[3].flyDelta(n,q);if l[3].noclipActive~=true and c.Magnitude>1.0E-4 then c=l[9][4][l[9][7]](l[8][4][l[8][7]],c);end;local v=l[8][4][l[8][7]]+c;if l[3].surfaceFly then v=l[3].surfaceClamp(v,q);end;l[8][4][l[8][7]]=v;j=l[10].CurrentCamera;local D=j and(Vector3.new(j.CFrame.LookVector.X,0,j.CFrame.LookVector.Z));pcall(function()local j=if c.Magnitude>1.0E-4 and D and D.Magnitude>0.001 then(CFrame.lookAt(v,v+D.Unit))else(N and N-N.Position or C.CFrame-C.Position)+v;if N and l[3].ghostRebase then local N,c={C.Parent},l[10]:FindFirstChild("Characters");if c then N[#N+1]=c;end;c=l[10]:FindFirstChild("Gameplay");if c then local D=c:FindFirstChild("Entities");if D then N[#N+1]=D;end;D=c:FindFirstChild("Vehicles");if D then N[#N+1]=D;end;end;l[11].FilterDescendantsInstances=N;c=l[10]:Raycast(v+Vector3.new(0,4,0),Vector3.new(0,-4096,0),l[11]);N=c and c.Position.Y-l[12]-12 or v.Y-l[13];C.CFrame=CFrame.new(v.X,N,v.Z)*(j-j.Position);l[3].ghostRebase(j);else C.CFrame=j;end;C.AssemblyLinearVelocity=Vector3.new(0.0,0.0,0.0);C.AssemblyAngularVelocity=Vector3.new(0.0,0.0,0.0);end);return;end;if l[6][4][l[6][7]]~=C then l[3].spawnS(l[14][4][l[14][7]],C);return;end;if not C.Anchored then pcall(function()C.Anchored=true;end);end;X=l[3].ghostActive and(l[3].ghostActive())and l[3].ghostRealCF;l[3].flyApply(C,n,q,if X then(l[3].ghostRealCF())else nil);end)))

			local mobilePadButton = nil
			local raycastParams4 = RaycastParams.new()
			raycastParams4.FilterType = Enum.RaycastFilterType.Exclude
			raycastParams4.IgnoreWater = true

			local function fn12()
				local character = localPlayer.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				if not (humanoidRootPart and humanoid) then
					return
				end
				local ghostRealCF = v2.ghostRealCF and v2.ghostRealCF() or humanoidRootPart.CFrame
				local position = ghostRealCF.Position
				local filterDescendantsInstances = { character }
				local characters = workspace_:FindFirstChild("Characters")

				if characters then
					filterDescendantsInstances[#filterDescendantsInstances + 1] = characters
				end

				local gameplay = workspace_:FindFirstChild("Gameplay")

				if gameplay then
					local entities = gameplay:FindFirstChild("Entities")

					if entities then
						filterDescendantsInstances[#filterDescendantsInstances + 1] = entities
					end

					local vehicles = gameplay:FindFirstChild("Vehicles")

					if vehicles then
						filterDescendantsInstances[#filterDescendantsInstances + 1] = vehicles
					end
				end

				raycastParams4.FilterDescendantsInstances = filterDescendantsInstances
				local hit = workspace_:Raycast(position + Vector3.new(0, 4, 0), Vector3.new(0, -10000, 0), raycastParams4)
				if not hit then
					return
				end
				local n = hit.Position.Y + humanoid.HipHeight + humanoidRootPart.Size.Y / 2 + 0.5
				if position.Y - n < 6 then
					return
				end
				local n7 = ghostRealCF - ghostRealCF.Position
				local cFrame2 = CFrame.new(position.X, n, position.Z) * n7

				pcall(function()
					humanoidRootPart.CFrame = cFrame2
					humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
					humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
				end)

				if v2.ghostRebase then
					v2.ghostRebase(cFrame2)
				end
			end

			local function fn13(flyActive)
				flag10 = flyActive
				v2.flyActive = flyActive
				v9 = nil

				if not flyActive then
					local flag12 = not v2.applyingConfig

					if flag12 then
						flag12 = not (v2.desyncActive and v2.desyncActive())
					end

					if flag12 then
						fn12()
					end

					fn11()
				end

				if mobilePadButton then
					pcall(function()
						mobilePadButton.BackgroundColor3 = flyActive and c2.ACCENT or c2.SURFACE
					end)
				end
			end

			local v, v10 = makeToggleRow(cheats, "plane", "Flight", "Lets you fly. Works well with Ghost and No Clip.", 28, false, function(arg2)
				fn13(arg2)
			end, "flight", function(arg2)
				makeSlider(arg2, "Flight Speed", 1, 20, 250, v2.flySpeed, function(flySpeed)
					v2.flySpeed = flySpeed
				end, true, "flySpeed", "How fast Flight moves.")
			end)

			if v2.IS_MOBILE and v2.mobilePadButton then
				mobilePadButton = v2.mobilePadButton
				mobilePadButton = mobilePadButton("FlightToggle", "", 46, UDim2.new(1, -37, 0.6, -54))

				if v2.registerMobileButton then
					v2.registerMobileButton("flight", mobilePadButton)
				end

				if v2.mobilePadIcon then
					v2.mobilePadIcon(mobilePadButton, "plane")
				end

				local function fn14()
					if v then
						v(not v10())
					end
				end

				if v2.mobileDraggableTap then
					v2.mobileDraggableTap(mobilePadButton, fn14)
				elseif v2.mobileOnTap then
					v2.mobileOnTap(mobilePadButton, fn14)
				end
			end

			table.insert(v2.cleanups, function()
				setNoclip(false)
				flag9 = false
				fn13(false)
			end)
		end

		local n5, flag7, n6, fn6, v3, n7, n8, v4, n9, n10
		local fn7, anchored, streamingPauseMode, n11, n12, flag8, fn8

		do
			local tbl2 = { Text = "" }
			UserInputService = game:GetService("UserInputService")
			n5 = 0.15
			flag7 = false
			flag = false
			cFrame = nil
			n6 = 0
			v2.ghostMode = v2.ghostMode or "render"
			flag2 = false
			fn6 = nil
			flag3 = false
			v3 = nil
			n7 = 0
			n8 = nil
			v4 = nil
			n9 = 0
			n10 = 0
			flag4 = true

			fn7 = function()
				return 0
			end

			local function fn9()
				return 45
			end

			local function fn10()
				return fn7() + 120
			end

			local str2 = "-"
			local n13 = 0
			local n14 = 0
			str = nil
			local connection = nil
			anchored = nil
			streamingPauseMode = nil
			local flag9 = false
			n2 = 0
			flag5 = false
			local flag10 = false
			n3 = 0
			local n15 = 0
			n4 = 0
			n11 = nil
			n12 = 0
			flag8 = false
			local fn11 = nil
			tbl = {}
			flag6 = false

			local function fn12(arg2)
				if v2.DEBUG and v2.log then
					v2.log("[dsy] " .. arg2, "warn")
				end
			end

			fn = function()
				return localPlayer.Character
			end

			fn2 = function(arg2)
				local humanoidRootPart

				if arg2 then
					humanoidRootPart = arg2:FindFirstChild("HumanoidRootPart") or arg2.PrimaryPart
				else
					humanoidRootPart = arg2
				end

				return humanoidRootPart
			end

			local function fn13(arg2)
				return arg2 and arg2:FindFirstChildOfClass("Humanoid")
			end

			fn8 = function()
				local attribute = localPlayer:GetAttribute("CharacterPosition")
				if typeof(attribute) == "Vector3" then
					return attribute
				end

				if typeof(attribute) == "CFrame" then
					return attribute.Position
				end
				return nil
			end

			local raycastParams = RaycastParams.new()
			raycastParams.FilterType = Enum.RaycastFilterType.Exclude
			local v5 = nil
			local v6 = nil

			local function fn14(arg2)
				if not (v5 and v5.Parent) then
					local v = workspace_:FindFirstChild(v2.VX and v2.VX.gp or "Gameplay")

					if v then
						v = v:FindFirstChild(v2.VX and v2.VX.vf or "Vehicles")
					end

					v5 = v
				end

				if not (v6 and v6.Parent) then
					local v = workspace_
					local findFirstChild = v.FindFirstChild
					local charsFolderName = v2.charsFolderName
					local ch

					if charsFolderName then
						ch = charsFolderName
					else
						ch = v2.VX and v2.VX.ch
					end

					v6 = findFirstChild(v, ch or "Characters")
				end

				local tbl3 = { arg2, camera }

				if v5 then
					tbl3[#tbl3 + 1] = v5
				end

				if v6 then
					tbl3[#tbl3 + 1] = v6
				end

				return tbl3
			end

			local connection2 = nil

			local function fn15(arg2)
				if connection2 then
					pcall(function()
						connection2:Disconnect()
					end)
				end

				connection2 = nil
				if not arg2 then
					return
				end

				connection2 = arg2:GetPropertyChangedSignal("Anchored"):Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
				function()if l[1][4][l[1][7]]and not l[2][4][l[2][7]]and not l[3][4][l[3][7]]and not l[4].Anchored then l[4].Anchored=true;l[5][4][l[5][7]]+=1;end;end))

				track(connection2)
			end

			fn3 = function()
				fn12("stopMode called")

				if connection then
					pcall(function()
						connection:Disconnect()
					end)

					connection = nil
				end

				if connection2 then
					pcall(function()
						connection2:Disconnect()
					end)

					connection2 = nil
				end

				n4 += 1
				pcall(fn11, false)
				local v = fn2(fn())
				flag3 = false
				vy = 0

				if v then
					pcall(function()
						local raycastParams2 = RaycastParams.new()
						raycastParams2.FilterType = Enum.RaycastFilterType.Exclude
						raycastParams2.IgnoreWater = true
						local filterDescendantsInstances = { fn() }
						local characters = workspace_:FindFirstChild("Characters")

						if characters then
							filterDescendantsInstances[#filterDescendantsInstances + 1] = characters
						end

						local gameplay = workspace_:FindFirstChild("Gameplay")

						if gameplay then
							local entities = gameplay:FindFirstChild("Entities")

							if entities then
								filterDescendantsInstances[#filterDescendantsInstances + 1] = entities
							end

							local vehicles = gameplay:FindFirstChild("Vehicles")

							if vehicles then
								filterDescendantsInstances[#filterDescendantsInstances + 1] = vehicles
							end
						end

						raycastParams2.FilterDescendantsInstances = filterDescendantsInstances
						local v7 = fn13(fn())
						local hit = workspace_:Raycast(v.Position + Vector3.new(0, 4, 0), Vector3.new(0, -12000, 0), raycastParams2)

						if hit and v7 then
							local n = hit.Position.Y + v7.HipHeight + v.Size.Y / 2 + 0.5

							if v.Position.Y - n > 6 then
								v.CFrame = CFrame.new(v.Position.X, n, v.Position.Z) * (v.CFrame - v.CFrame.Position)
								v.AssemblyLinearVelocity = Vector3.zero
								v.AssemblyAngularVelocity = Vector3.zero
							end
						end
					end)

					pcall(function()
						v.Anchored = false
					end)
				end

				if fn6 then
					pcall(fn6)
				end

				anchored = nil
				flag9 = false
				flag5 = false
				flag10 = false
				flag7 = false
				v3 = nil
				n8 = nil
				v4 = nil
				n9 = 0
				n10 = 0

				pcall(function()
					if streamingPauseMode ~= nil then
						workspace_.StreamingPauseMode = streamingPauseMode
					end
				end)

				streamingPauseMode = nil
				cFrame = nil
				n2 = 0
				n3 = 0
				n6 = 0
				str2 = "-"
				n13 = 0
				n14 = 0
				n11 = nil
				n12 = 0
				flag8 = false
				str = nil
				tbl2.Text = "Server drift:  idle"
			end

			local function fn16()
				connection = runService.RenderStepped:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
				function(q)if l[1]then l[1](q);end;l[2][4][l[2][7]]+=q;if l[2][4][l[2][7]]<0.15 then return;end;l[2][4][l[2][7]]=0;q=l[3][4][l[3][7]](l[4][4][l[4][7]]());local X=l[5][4][l[5][7]]();l[6].Text=string.format("Drift %s  \194\183  hides %d  \194\183  last: %s  \194\183  reanchor %d",q and X and(string.format("%.0f",(q.Position-X).Magnitude))or"?",l[7][4][l[7][7]],l[8][4][l[8][7]],l[9][4][l[9][7]]);end))

				track(connection)
			end

			local function fn17(arg2)
				local assemblyRootPart = arg2 and arg2.AssemblyRootPart
				return assemblyRootPart ~= nil and assemblyRootPart ~= arg2
			end

			local function fn18(arg2, arg3, arg4)
				local v = nil
				local v7 = nil

				for i = 1, 10 do
					local hit = workspace_:Raycast(Vector3.new(arg2, arg4, arg3), Vector3.new(0, -5000, 0), raycastParams)
					if not hit or hit.Material == Enum.Material.Water then
						break
					end
					v = v or hit
					if hit.Instance == workspace_.Terrain then
						return hit
					end

					if v7 and v7.Position.Y - hit.Position.Y > 40 then
						break
					end
					arg4 = hit.Position.Y - 0.2
					v7 = hit
				end

				return v7
			end

			local function fn19(arg2, arg3, cFrame2)
				local v = n4

				if fn7() <= 0 then
					local cFrame3 = arg2.CFrame
					raycastParams.FilterDescendantsInstances = fn14(arg3)
					local insideLocation = localPlayer:FindFirstChild("InsideLocation")
					insideLocation = insideLocation and insideLocation.Value
					local ghostHideCF = v2._ghostHideCF

					if not (ghostHideCF and v2._ghostHideLoc == insideLocation) then
						local v7 = fn18(cFrame3.Position.X, cFrame3.Position.Z, cFrame3.Position.Y + 2)

						if v7 then
							local n = cFrame3 - cFrame3.Position
							ghostHideCF = CFrame.new(cFrame3.Position.X, v7.Position.Y - 5, cFrame3.Position.Z) * n
						else
							ghostHideCF = v7
						end

						local v8 = v2
						v2._ghostHideCF = ghostHideCF
						v8._ghostHideLoc = insideLocation
					end

					if ghostHideCF and not fn17(arg2) then
						local cameraType = camera.CameraType
						local cFrame4 = camera.CFrame

						pcall(function()
							camera.CameraType = Enum.CameraType.Scriptable
						end)

						if v2.pivotChar and (ghostHideCF.Position - cFrame3.Position).Magnitude > 30 then
							pcall(function()
								localPlayer:RequestStreamAroundAsync(ghostHideCF.Position)
							end)

							if n4 ~= v then
								pcall(function()
									camera.CameraType = cameraType
								end)

								return false
							end

							pcall(v2.pivotChar, ghostHideCF)
						end

						flag7 = true
						v2._ghostHolding = true
						local now = os.clock()
						local n, v7

						repeat
							pcall(function()
								arg2.CFrame = ghostHideCF
								arg2.AssemblyLinearVelocity = Vector3.zero
								camera.CFrame = cFrame4
							end)

							runService.Heartbeat:Wait()

							if n4 ~= v or not arg2.Parent then
								pcall(function()
									arg2.CFrame = cFrame3
									camera.CameraType = cameraType
								end)

								flag7 = false
								v2._ghostHolding = false
								return false
							end

							if (arg2.Position - ghostHideCF.Position).Magnitude > 25 then
								flag7 = false
								v2._ghostHolding = false

								pcall(function()
									camera.CameraType = cameraType
								end)

								return false
							end

							v7 = fn8()
							n = os.clock() - now
						until n > 0.25 and v7 and (v7 - ghostHideCF.Position).Magnitude < (v7 - cFrame3.Position).Magnitude - 1 or n > 1.5

						arg2.Anchored = true
						arg2.CFrame = cFrame3
						flag7 = false
						v2._ghostHolding = false

						pcall(function()
							camera.CameraType = cameraType
							camera.CFrame = cFrame4
						end)
					end

					arg2.Anchored = true
					flag3 = true
					raycastParams.FilterDescendantsInstances = fn14(arg3)
				else
					local magnitude = n11 and (n11 - cFrame2.Position).Magnitude or math.huge

					if magnitude > fn10() or magnitude < fn7() - 120 then
						n11 = cFrame2.Position + Vector3.new(0, fn7(), 0)
					end

					local v7 = n11
					local cameraType = camera.CameraType
					local cFrame3 = camera.CFrame

					local function fn20()
						local cFrame4 = camera.CFrame
						cameraType = camera.CameraType
						cFrame3 = cFrame4

						pcall(function()
							camera.CameraType = Enum.CameraType.Scriptable
						end)
					end

					local function fn21()
						pcall(function()
							camera.CameraType = cameraType
							camera.CFrame = cFrame3
						end)
					end

					local flag11 = not true

					v2.spawnS(function()
						pcall(function()
							localPlayer:RequestStreamAroundAsync(v7)
						end)

						flag11 = true
					end)

					local now = os.clock()

					while true do
						if not flag11 and os.clock() - now < 3 then
							runService.Heartbeat:Wait()
							if n4 == v then
								continue
							end
							return false
						end

						break
					end

					if not flag11 and notify and os.clock() - n15 > 8 then
						n15 = os.clock()
						notify("That area was slow to load, carrying on", "warn")
					end

					local n = 0

					local function fn22(arg4)
						if fn17(arg2) then
							return nil
						end
						fn20()
						flag7 = true
						arg2.CFrame = CFrame.new(v7)
						arg2.Anchored = false

						for i = 1, arg4 do
							arg2.CFrame = CFrame.new(v7)

							pcall(function()
								camera.CFrame = cFrame3
							end)

							runService.Heartbeat:Wait()

							if n4 ~= v then
								fn21()
								flag7 = false
								return nil
							end

							if fn17(arg2) then
								local v8 = arg2
								local v9 = anchored
								local anchored2

								if anchored then
									anchored2 = v9
								else
									anchored2 = false
								end

								v8.Anchored = anchored2
								arg2.CFrame = cFrame2
								fn21()
								flag7 = false
								return nil
							end

							if not (fn() and fn2(fn()) == arg2 and arg2.Parent) then
								fn21()
								flag7 = false
								return nil
							end
						end

						arg2.Anchored = true
						flag3 = true
						vy = 0
						arg2.CFrame = cFrame2
						fn21()
						flag7 = false
						local n16 = 0

						pcall(function()
							n16 = localPlayer:GetNetworkPing()
						end)

						for i = 1, math.clamp(math.floor((n16 * 2 + 1.2) * 60 + 0.5), 150, 450) do
							local v8 = fn8()

							if v8 then
								local magnitude2 = (v8 - cFrame2.Position).Magnitude

								if n < magnitude2 then
									n = magnitude2
								end

								if fn9() < magnitude2 then
									return true
								end
							end

							runService.Heartbeat:Wait()
							if n4 ~= v then
								return nil
							end

							if not (arg2 and arg2.Parent) then
								return nil
							end
						end

						return false
					end

					local n16 = 0

					pcall(function()
						n16 = localPlayer:GetNetworkPing()
					end)

					local n17 = math.clamp(math.floor((n16 + 0.12) * 60 + 0.5), 12, 70)
					local n18 = math.clamp(math.floor((n16 * 2 + 0.2) * 60 + 0.5), 24, 130)
					local tbl3 = { n17, n18 }
					local v8 = nil

					for _, v9 in ipairs(tbl3) do
						v8 = fn22(v9)
						if v8 == false then
							continue
						end
						break
					end

					raycastParams.FilterDescendantsInstances = fn14(arg3)

					if v8 ~= true then
						flag3 = false

						pcall(function()
							local v9 = arg2
							local v10 = anchored
							local anchored2

							if anchored then
								anchored2 = v10
							else
								anchored2 = false
							end

							v9.Anchored = anchored2
						end)

						if v8 == false and notify and os.clock() - n15 > 8 then
							n15 = os.clock()
							local v9 = fn8()
							local magnitude2 = v9 and arg2 and arg2.Parent and (arg2.Position - v9).Magnitude or -1
							local n19 = 0

							pcall(function()
								n19 = localPlayer:GetNetworkPing() * 1000
							end)

							fn12(string.format("hide FAILED: drift %.0f need >%.0f | serverPeak %.0f | ping %.0fms", magnitude2, fn9(), n, n19))
							notify("Ghost couldn't hide you here", "warn")
						end

						return false
					end
				end

				return true
			end

			local function fn20()
				local v = fn2(fn())
				local v7 = fn8()
				return v and v7 and (v.Position - v7).Magnitude < 40 or false
			end

			local tbl3 = {}
			local flag11 = false
			local tbl4 = {}

			local function fn21(arg2)
				for _, v in ipairs(tbl3) do
					pcall(function()
						local n = tbl4[v] or 0
						v.LocalTransparencyModifier = arg2 and math.max(n, 0.62) or n
					end)
				end
			end

			fn11 = function(arg2)
				if arg2 == flag11 then
					return
				end
				flag11 = arg2

				if arg2 then
					table.clear(tbl3)
					table.clear(tbl4)
					local v = fn()
					if not v then
						flag11 = false
						return
					end

					for _, descendant in ipairs(v:GetDescendants()) do
						if descendant:IsA("BasePart") or descendant:IsA("Decal") then
							tbl3[#tbl3 + 1] = descendant
							tbl4[descendant] = descendant.LocalTransparencyModifier
						end
					end

					fn21(true)
				else
					fn21(false)
					table.clear(tbl3)
					table.clear(tbl4)
				end
			end

			local function fn22(arg2)
				if not str then
					return
				end
				n2 = math.max(n2, os.clock() + (arg2 or 0.5))

				if flag10 then
					n4 += 1
				end
			end

			local n16 = 0
			local n17 = 2.5

			local function fn23(arg2, arg3, arg4)
				local n = math.min(arg2, 0.033333333333333333)

				if v2.flyActive == true then
					n16 = 0
					v2.flyApply(arg3, arg4, n)
					return
				end

				local position = arg3.Position
				local n18 = arg3.Size.Y / 2

				local function fn24(arg5)
					return arg5 - n18 - arg4.HipHeight
				end

				local flag12 = v2.noclipActive == true
				local n19 = arg4.MoveDirection * arg4.WalkSpeed * n

				if n19.Magnitude > 0.001 and not flag12 then
					local z = position.Z
					local vector = Vector3.new(position.X, fn24(position.Y) + n17 + 0.5, z)
					local hit = workspace_:Raycast(vector, n19.Unit * (n19.Magnitude + 2), raycastParams)

					if hit then
						local normal = hit.Normal
						n19 -= normal * n19:Dot(normal)

						if n19.Magnitude > 0.001 and workspace_:Raycast(vector, n19.Unit * (n19.Magnitude + 2), raycastParams) then
							n19 = Vector3.zero
						end
					end
				end

				local n20 = position.X + n19.X
				local n21 = position.Z + n19.Z
				n16 -= workspace_.Gravity * n
				local n22 = n16 * n
				local hit = workspace_:Raycast(Vector3.new(n20, position.Y + n17, n21), Vector3.new(0, -2048, 0), raycastParams)
				local n23, flag13

				if hit then
					n23 = hit.Position.Y + arg4.HipHeight + n18
					local n24 = position.Y + n22
					local flag14 = n23 - position.Y <= n17 + 0.5 and n16 <= 0 and n24 <= n23
					flag13 = false

					if flag14 then
						n16 = 0
						flag13 = true
					else
						n23 = n24
					end
				elseif n16 <= 0 and flag4 and v2.infJumpActive ~= true then
					n23 = position.Y
					n16 = 0
					flag13 = true
				else
					n23 = position.Y + n22
					flag13 = false
				end

				if (flag13 or v2.infJumpActive == true) and (arg4.Jump or UserInputService:IsKeyDown(Enum.KeyCode.Space)) then
					n16 = arg4.JumpPower > 0 and arg4.JumpPower or 50
				end

				local vector = Vector3.new(n20, n23, n21)

				if flag13 then
					n8 = arg3.CFrame - arg3.Position + vector
				end

				if arg4.MoveDirection.Magnitude <= 0.05 and flag13 and (vector - position).Magnitude < 0.02 then
					return
				end

				if arg4.MoveDirection.Magnitude > 0.05 then
					arg3.CFrame = CFrame.lookAt(vector, vector + Vector3.new(arg4.MoveDirection.X, 0, arg4.MoveDirection.Z))
				else
					arg3.CFrame = arg3.CFrame - arg3.Position + vector
				end
			end

			local function fn24(arg2)
				local v = fn()
				local v7 = fn2(v)
				local v8 = fn13(v)
				if not (v7 and v8) then
					return
				end

				if not fn17(v7) and workspace_:Raycast(v7.Position, Vector3.new(0, -12, 0), raycastParams) then
					n8 = v7.CFrame
				end

				if v2._dsLastY and math.abs(v7.Position.Y - v2._dsLastY) > 150 then
					v2._locGrace = os.clock() + 8
					n8 = v7.CFrame
					v4 = nil
					n9 = 0
				end

				v2._dsLastY = v7.Position.Y

				if flag7 or flag10 or flag then
					if n10 == 0 then
						n10 = os.clock()
					elseif os.clock() - n10 > 5 then
						flag7 = false
						flag10 = false
						flag = false
						n10 = 0
					end
				else
					n10 = 0
				end

				local flag12 = n8 and not flag7 and not flag10 and not flag and not fn17(v7) and v2.flyActive ~= true

				if flag12 then
					flag12 = os.clock() >= (v2._locGrace or 0)
				end

				if flag12 then
					local n = v7.Position - n8.Position
					local flag13 = n.Y < -100 and not workspace_:Raycast(v7.Position, Vector3.new(0, -3000, 0), raycastParams)
					local flag14 = n.Magnitude > 150 and v4 and (v7.Position - v4).Magnitude < 6 and os.clock() - n9 > 0.6

					if flag13 or flag14 then
						local position = n8.Position
						local n18 = v7.Size.Y / 2
						local hit = workspace_:Raycast(Vector3.new(position.X, position.Y + 80, position.Z), Vector3.new(0, -600, 0), raycastParams)
						local n19 = hit and hit.Position.Y + v8.HipHeight + n18 + 1 or position.Y + 3

						pcall(function()
							v7.Anchored = true
							v7.AssemblyLinearVelocity = Vector3.zero
							local n20 = n8 - position
							v7.CFrame = CFrame.new(position.X, n19, position.Z) * n20
						end)

						n16 = 0
						flag5 = false
						flag3 = false
						v4 = nil
						n9 = 0
						return
					end

					if n.Magnitude > 150 and (not v4 or (v7.Position - v4).Magnitude >= 6) then
						local position = v7.Position
						local now = os.clock()
						v4 = position
						n9 = now
					elseif n.Magnitude <= 150 then
						v4 = nil
						n9 = 0
					end
				else
					v4 = nil
					n9 = 0
				end

				if flag then
					return
				end

				if flag7 then
					return
				end

				if flag10 then
					if v7.Anchored then
						fn23(arg2, v7, v8)
					end

					return
				end

				if fn17(v7) then
					if flag5 then
						flag5 = false
						flag3 = false

						pcall(function()
							local v9 = v7
							local v10 = anchored
							local anchored2

							if anchored then
								anchored2 = v10
							else
								anchored2 = false
							end

							v9.Anchored = anchored2
						end)

						str2 = "car"

						if notify then
							notify("Ghost paused while you're driving", "warn")
						end
					end

					flag9 = true
					return
				end

				if flag9 then
					n3 = 0
				end

				flag9 = false

				if flag5 then
					if n6 <= os.clock() then
						local n = 0

						pcall(function()
							n = localPlayer:GetNetworkPing()
						end)

						n6 = os.clock() + math.clamp(0.9 - n * 3, 0.25, 0.9)
						local v9 = fn8()

						if v9 then
							local magnitude = (v7.Position - v9).Magnitude

							if magnitude >= fn9() then
								flag8 = true
							end

							if flag8 and magnitude < fn9() then
								flag5 = false
								flag8 = false
								str2 = "decoy lost"
								n3 = math.max(n3, os.clock() + 0.15)
							end
						end
					end
				end

				fn11(flag5)

				if flag11 then
					fn21(true)
				end

				local flag13 = v3 ~= nil and not flag5

				if flag13 then
					local flag14 = workspace_:Raycast(v7.Position + Vector3.new(0, 6, 0), Vector3.new(0, -14, 0), raycastParams) ~= nil

					if os.clock() >= n7 or flag14 then
						v3 = nil
						flag13 = false
					else
						if not v7.Anchored then
							pcall(function()
								v7.Anchored = true
							end)
						end

						v7.CFrame = v3
					end
				end

				if not flag13 then
					local n = n2 + n5
					flag13 = os.clock() >= n
				end

				if flag13 and not flag5 then
					if os.clock() < n3 then
						return
					end
					flag10 = true
					n14 += 1
					fn15(v7)

					v2.spawnS(function()
						local ok, result = pcall(fn19, v7, v, v7.CFrame)
						flag5 = ok and result and true or false

						if flag5 then
							fn15(v7)
						end

						if flag5 then
							n12 = 0
							v3 = nil
						else
							n12 = math.min(n12 + 1, 5)
							local n = n12 * 2
							n3 = os.clock() + n

							if n12 >= 2 then
								n11 = nil
							end
						end

						flag10 = false
					end)

					return
				end

				if not flag13 then
					if flag5 then
						flag5 = false
						flag3 = false

						pcall(function()
							v7.Anchored = false
						end)

						str2 = "exposed to shoot"
					end

					return
				end

				if v7.Anchored and not flag7 then
					cFrame = v7.CFrame
				end

				fn23(arg2, v7, v8)
			end

			local n18 = 5
			local n19 = 0.77
			local n20 = 0.38
			local v7 = nil
			local connection3 = nil
			local flag12 = false
			local v8 = nil
			local v9 = nil
			local n21 = 0
			local n22 = 0
			local v10 = nil
			local n23 = 0.9
			local v11 = nil
			local n24 = 0

			local function fn25()
				local v = fn()
				local v12 = fn2(v)
				local v13 = fn13(v)
				if not (v12 and v13) then
					return nil
				end
				return v, v12, v13, v13.RigType == Enum.HumanoidRigType.R15
			end

			local function fn26()
				local v, v12, v13, v14 = fn25()
				if not v13 then
					return
				end
				local animator = v13:FindFirstChildOfClass("Animator")
				if not animator then
					return
				end
				local animation = Instance.new("Animation")
				animation.AnimationId = v14 and "rbxassetid://18537363391" or "rbxassetid://215384594"

				local ok, result = pcall(function()
					return animator:LoadAnimation(animation)
				end)

				pcall(function()
					animation:Destroy()
				end)

				if not (ok and result) then
					return
				end
				v7 = result

				pcall(function()
					result.Priority = Enum.AnimationPriority.Action4
					result.Looped = true
					result:Play()
					result:AdjustWeight(0.001)
					result:AdjustSpeed(0)
					result.TimePosition = v14 and 0.77 or 0.38
				end)
			end

			fn4 = function()
				flag2 = true
				v8 = nil
				n22 = 0
				v10 = nil
				n24 = os.clock() + 0.2
				v9 = fn()
				fn26()
				fn11(true)

				connection3 = runService.Heartbeat:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
				function()if not l[1][4][l[1][7]]then return;end;local q,X,C,n=l[2][4][l[2][7]]();if not X then return;end;if q~=l[3][4][l[3][7]]then l[3][4][l[3][7]]=q;pcall(l[4][4][l[4][7]],false);pcall(l[4][4][l[4][7]],true);l[5][4][l[5][7]]();end;if l[6][4][l[6][7]](X)then pcall(l[4][4][l[4][7]],false);l[7][4][l[7][7]]=nil;return;end;if os.clock()<l[8][4][l[8][7]]then l[7][4][l[7][7]]=X.CFrame;pcall(l[4][4][l[4][7]],false);if l[9][4][l[9][7]]then pcall(function()l[9][4][l[9][7]]:AdjustWeight(0.001);end);end;return;end;if not l[10][4][l[10][7]]then pcall(l[4][4][l[4][7]],true);end;if not(l[9][4][l[9][7]]and l[9][4][l[9][7]].IsPlaying)and os.clock()>=l[11][4][l[11][7]]then l[11][4][l[11][7]]=os.clock()+0.5;l[5][4][l[5][7]]();end;if l[7][4][l[7][7]]and math.abs(X.Position.Y-l[7][4][l[7][7]].Position.Y)>150 then l[12]._locGrace=os.clock()+8;l[13][4][l[13][7]]=nil;end;l[7][4][l[7][7]]=X.CFrame;local N=X.CFrame-X.Position;l[14].FilterDescendantsInstances=l[15][4][l[15][7]](l[16][4][l[16][7]]());local j=l[12].flyActive==true;local c=not j;if c and l[13][4][l[13][7]]and os.clock()>=(l[12]._locGrace or 0)and l[7][4][l[7][7]].Position.Y-l[13][4][l[13][7]].Position.Y<-60 and not l[17]:Raycast(l[7][4][l[7][7]].Position,Vector3.new(0,-3000,0),l[14])then l[7][4][l[7][7]]=l[13][4][l[13][7]];pcall(function()X.CFrame=l[13][4][l[13][7]];X.AssemblyLinearVelocity=Vector3.new(0.0,0.0,0.0);end);end;q=l[17]:Raycast(X.Position+Vector3.new(0,4,0),Vector3.new(0,-4096,0),l[14]);local v=l[18]+((j or c and q~=nil and X.Position.Y-q.Position.Y>C.HipHeight+X.Size.Y/2+3)and 12 or 0)+(c and os.clock()<l[19][4][l[19][7]]and 45 or 0);local D,y=q and q.Position.Y-v or X.Position.Y-(C.HipHeight+X.Size.Y/2+v),c and q and X.Position.Y-q.Position.Y<C.HipHeight+X.Size.Y/2+4;if y then l[13][4][l[13][7]]=l[7][4][l[7][7]];end;v=0;if C.MoveDirection.Magnitude<0.05 then l[20][4][l[20][7]]=-l[20][4][l[20][7]];v=l[20][4][l[20][7]];end;local q=Vector3.new(X.Position.X+v,D,X.Position.Z+v);pcall(function()X.CFrame=CFrame.new(q)*N*CFrame.Angles(math.rad(n and 180 or 90),0,0);if not j then l[21][4][l[21][7]]=X.AssemblyLinearVelocity;X.AssemblyLinearVelocity=Vector3.new(0.0,0.0,0.0);end;end);if l[9][4][l[9][7]]then pcall(function()l[9][4][l[9][7]]:AdjustWeight(100);l[9][4][l[9][7]]:AdjustSpeed(0);l[9][4][l[9][7]].TimePosition=n and l[22]or l[23];end);end;end))

				track(connection3)

				pcall(function()
					runService:UnbindFromRenderStep("VxGhostRender")
				end)

				pcall(function()
					runService:BindToRenderStep("VxGhostRender", Enum.RenderPriority.Camera.Value - 1, v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
					function()if not l[1][4][l[1][7]]then return;end;local q=l[2][4][l[2][7]](l[3][4][l[3][7]]());if q and l[4][4][l[4][7]]then local X,C,n=q.Position.X-l[4][4][l[4][7]].Position.X,q.Position.Z-l[4][4][l[4][7]].Position.Z,math.abs(q.Position.Y-l[4][4][l[4][7]].Position.Y);local N,j=n>150,q.CFrame.UpVector.Y<0;if(X*X+C*C>1600 or N)and not j then if n>150 then l[5]._locGrace=os.clock()+8;end;l[4][4][l[4][7]]=q.CFrame;else pcall(function()q.CFrame=l[4][4][l[4][7]];end);end;end;if l[7][4][l[7][7]]then local X=l[7][4][l[7][7]];l[7][4][l[7][7]]=nil;if q then pcall(function()q.AssemblyLinearVelocity=X;end);end;end;if l[8][4][l[8][7]]then pcall(function()l[8][4][l[8][7]]:AdjustWeight(0.001);end);end;if l[9][4][l[9][7]]then l[10][4][l[10][7]](true);end;end))

					flag12 = true
				end)
			end

			fn6 = function()
				flag2 = false

				if connection3 then
					pcall(function()
						connection3:Disconnect()
					end)

					connection3 = nil
				end

				if flag12 then
					pcall(function()
						runService:UnbindFromRenderStep("VxGhostRender")
					end)

					flag12 = false
				end

				if v7 then
					pcall(function()
						v7:Stop()
						v7:Destroy()
					end)

					v7 = nil
				end

				local v = fn()
				local v12 = fn2(v)
				local v13 = v8
				v8 = nil
				v9 = nil

				if v12 and v13 then
					if v2.applyingConfig then
						pcall(function()
							v12.CFrame = v13
							v12.AssemblyLinearVelocity = Vector3.zero
						end)
					else
						pcall(function()
							v12.CFrame = v13 - Vector3.new(0, 45, 0)
							v12.AssemblyLinearVelocity = Vector3.zero
						end)

						pcall(function()
							runService.Heartbeat:Once(function()
								if fn() == v then
									pcall(function()
										v12.CFrame = v13
										v12.AssemblyLinearVelocity = Vector3.zero
									end)
								end
							end)
						end)
					end
				end

				pcall(fn11, false)
			end

			fn5 = function()
				local v = fn()
				local v12 = fn2(v)
				local v13 = fn13(v)

				if not (v12 and v13) then
					if notify then
						notify("No character", "err")
					end

					return false
				end

				fn12("startAnchor(desync): begin")
				anchored = v12.Anchored
				local v14 = v2
				v2._ghostHideCF = nil
				v14._ghostHideLoc = nil
				fn15(v12)
				flag5 = false
				n2 = 0
				n3 = 0
				local cFrame2 = v12.CFrame
				cFrame = v12.CFrame
				n8 = cFrame2
				n16 = 0
				local cFrame3 = v12.CFrame
				local n = os.clock() + 10
				v3 = cFrame3
				n7 = n
				n12 = 0
				n11 = nil
				flag8 = false

				pcall(function()
					if streamingPauseMode == nil then
						streamingPauseMode = workspace_.StreamingPauseMode
					end

					workspace_.StreamingPauseMode = Enum.StreamingPauseMode.Disabled
				end)

				fn16(fn24)
				fn12("startAnchor(desync): drive loop armed")
				return true
			end

			v2.desyncPulse = function(arg2)
				fn22(arg2 or 1.1)
			end

			v2.desyncDone = function()
				if str then
					n2 = math.min(n2, os.clock() + 0.25)
				end
			end

			v2.desyncRebase = function(cFrame2)
				if not str then
					return false
				end

				if typeof(cFrame2) ~= "CFrame" then
					local v = fn2(fn())
					cFrame2 = v and v.CFrame
				end

				if typeof(cFrame2) ~= "CFrame" then
					return false
				end

				if flag5 and fn7() <= 0 then
					local v = fn2(fn())

					if v then
						pcall(function()
							v.CFrame = cFrame2
							v.AssemblyLinearVelocity = Vector3.zero
						end)
					end

					cFrame = cFrame2
					n8 = cFrame2
					n16 = 0

					v2.spawnS(function()
						pcall(function()
							localPlayer:RequestStreamAroundAsync(cFrame2.Position)
						end)
					end)

					return true
				end

				cFrame = cFrame2
				n8 = cFrame2
				n16 = 0
				n2 = 0
				n3 = 0
				if v2.flyActive == true then
					return true
				end
				local v = fn2(fn())

				if v then
					pcall(function()
						v.Anchored = false
						v.CFrame = cFrame2
						v.AssemblyLinearVelocity = Vector3.zero
						v.AssemblyAngularVelocity = Vector3.zero
					end)
				end

				flag5 = false
				flag3 = false
				n11 = nil

				v2.spawnS(function()
					pcall(function()
						localPlayer:RequestStreamAroundAsync(cFrame2.Position)
					end)
				end)

				return true
			end

			v2.ghostActive = function()
				return str ~= nil or flag2
			end

			v2.spawnS(function()
				local insideLocation = localPlayer:WaitForChild("InsideLocation", 60)
				if not insideLocation then
					return
				end

				track(insideLocation.Changed:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
				function()if not(l[1][4][l[1][7]]or l[2][4][l[2][7]])then return;end;l[3]._locGrace=os.clock()+8;l[3].spawnS(function()for q=1,40,1 do task.wait(0.1);q=l[5][4][l[5][7]](l[6][4][l[6][7]]());if q and l[1][4][l[1][7]]and not l[7][4][l[7][7]]and not q.Anchored then l[8][4][l[8][7]]=q.CFrame;l[10][4][l[10][7]]=0;end;end;end);end)))
			end)

			v2.desyncFrozen = function()
				return str ~= nil and flag5 and fn7() <= 0
			end

			v2.renderBuryCF = function(arg2)
				if not flag2 or typeof(arg2) ~= "CFrame" then
					return nil
				end
				local v, v12, v13, v14 = fn25()
				if not (v12 and v13) then
					return nil
				end
				raycastParams.FilterDescendantsInstances = fn14(v)
				local hit = workspace_:Raycast(arg2.Position + Vector3.new(0, 4, 0), Vector3.new(0, -4096, 0), raycastParams)
				local n = n18 + 45
				hit = hit and hit.Position.Y - n or arg2.Position.Y - v13.HipHeight + v12.Size.Y / 2 + n
				n24 = os.clock() + 0.2
				local n25 = arg2 - arg2.Position
				return CFrame.new(arg2.Position.X, hit, arg2.Position.Z) * n25 * CFrame.Angles(math.rad(v14 and 180 or 90), 0, 0)
			end

			v2.ghostRebase = function(arg2)
				if str then
					return v2.desyncRebase(arg2)
				end

				if not flag2 then
					return false
				end

				if typeof(arg2) ~= "CFrame" then
					arg2 = fn2(fn())
					arg2 = arg2 and arg2.CFrame
				end

				if typeof(arg2) ~= "CFrame" then
					return false
				end
				v8 = arg2
				return true
			end

			v2.ghostExpose = function(arg2)
				local n = arg2 or 2.5

				if str then
					fn22(n)
				elseif flag2 then
					n22 = os.clock() + n
				end
			end

			v2.ghostRealCF = function()
				if flag2 and v8 then
					return v8
				end

				if str and cFrame then
					return cFrame
				end
				local v = fn2(fn())
				return v and v.CFrame
			end

			v2.desyncSyncNow = function(arg2)
				if not str then
					return true
				end
				local n = arg2 or 1.5
				fn22(n + 0.5)
				local now = os.clock()

				while os.clock() - now < n do
					local v = fn2(fn())
					local v12 = fn8()
					if v and v12 and (v.Position - v12).Magnitude < 25 then
						return true
					end
					runService.Heartbeat:Wait()
				end

				return false
			end

			v2.desyncHoldFire = function()
				if str then
					fn22(0.6)
				end
			end

			v2.desyncFireTick = function()
				if str then
					fn22(0.6)
				end
			end

			v2.desyncSynced = function()
				return not str or fn20()
			end
		end
	end

	v2.desyncActive = function()
		return str ~= nil
	end

	local cFrame2 = nil

	v2.desyncSuspend = function()
		if not str then
			return
		end
		local v = fn2(fn())
		cFrame2 = cFrame or v and v.CFrame
		flag = true
		n4 += 1

		if v then
			pcall(function()
				v.Anchored = false
			end)
		end

		flag3 = false
		flag5 = false
	end

	v2.desyncResume = function()
		if not str then
			return
		end
		local v = fn2(fn())

		if v and cFrame2 then
			pcall(function()
				v.CFrame = cFrame2
			end)
		end

		cFrame2 = nil
		flag = false
		flag5 = false
		flag3 = false
		n2 = 0
		n3 = 0
	end

	do
		local tbl2 = {}

		local function fn6(arg2, arg3)
			local configReg = v2.configReg and v2.configReg[arg2]
			if not configReg then
				return
			end

			if arg3 then
				if tbl2[arg2] == nil then
					tbl2[arg2] = configReg.get() and true or false
				end

				if not configReg.get() then
					pcall(configReg.set, true)
				end
			elseif tbl2[arg2] ~= nil then
				if tbl2[arg2] == false and configReg.get() then
					pcall(configReg.set, false)
				end

				tbl2[arg2] = nil
			end
		end

		local function fn7()
			fn6("silentAim", true)
			fn6("noDamage", true)

			if v2.ghostMode == "desync" then
				str = "desync"

				v2.spawnS(function()
					local ok, result = pcall(fn5)

					if ok and result then
						if notify then
							notify("Ghost on (desync)", "ok")
						end
					else
						str = nil
						pcall(fn3)
						flag6 = true
						pcall(tbl.desync, false)
						flag6 = false
					end
				end)
			elseif pcall(fn4) then
				if notify then
					notify("Ghost on", "ok")
				end
			else
				pcall(fn3)
				flag6 = true
				pcall(tbl.desync, false)
				flag6 = false
			end
		end

		local function fn8()
			fn3()
			local v = tbl2
			tbl2.silentAim = nil
			v.noDamage = nil
		end

		tbl.desync = makeToggleRow(cheats, "eye", "Ghost ⭐", "Premium · makes you invisible to others. May cause instability.", 12, false, function(arg2)
			if flag6 then
				return
			end

			if arg2 then
				if not (v2.VX and v2.VX.pm) then
					if v2.premiumPopup then
						v2.premiumPopup("Ghost")
					elseif notify then
						notify("Ghost is Premium, upgrade at vxsans.xyz", "err")
					end

					flag6 = true
					pcall(tbl.desync, false)
					flag6 = false
					return
				end

				local v = str
				local v3

				if str then
					v3 = v
				else
					v3 = flag2
				end

				if v3 then
					return
				end
				fn7()
			elseif str or flag2 then
				fn8()

				if notify then
					notify("Ghost off", "off")
				end
			end
		end, nil, function(arg2)
			makeToggleRow(arg2, "skull", "Advanced mode", "Freezes your spot on the map for others while you move around freely. Needs good ping, best on PC.", 1, false, function(arg3)
				v2.ghostMode = arg3 and "desync" or "render"

				if str or flag2 then
					fn8()
					fn7()
				end
			end, "ghostDesyncMode")

			makeToggleRow(arg2, "shield", "Ghost Stability", "Improves stability of ghost.", 2, true, function(arg3)
				flag4 = arg3
			end, "ghostStability")
		end)
	end

	do
		local ProximityPromptService = game:GetService("ProximityPromptService")
		local tbl2 = {}

		track(ProximityPromptService.PromptShown:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(q)l[1][q]=true;end)))

		track(ProximityPromptService.PromptHidden:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(q)l[1][q]=nil;end)))

		local function fn6(arg2)
			local v = fn2(fn())
			if not v then
				return nil
			end
			local huge = math.huge
			local v3 = nil

			for k in pairs(tbl2) do
				local parent = k.Parent
				local parent2

				if parent and parent:IsA("Attachment") then
					parent2 = parent.Parent
				else
					parent2 = parent
				end

				if parent2 and parent2:IsA("BasePart") and k.Enabled then
					if k.KeyboardKeyCode == arg2 then
						local magnitude = (parent2.Position - v.Position).Magnitude

						if magnitude < huge then
							huge = magnitude
							v3 = k
						end
					end
				else
					tbl2[k] = nil
				end
			end

			return v3
		end
	end

	track(UserInputService.InputBegan:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(q,X)if l[1]:GetFocusedTextBox()then return;end;if q.KeyCode and l[2].keybinds and q.KeyCode==l[2].keybinds.desyncSync then if l[3][4][l[3][7]]or l[4][4][l[4][7]]then l[5].ghostExpose(2.5);if l[6]then l[6]("Visible for a moment","warn");end;end;return;end;if not l[3][4][l[3][7]]or l[7][4][l[7][7]]or l[8][4][l[8][7]]then return;end;if not(q.KeyCode and l[9][q.KeyCode])then return;end;local X=l[10][4][l[10][7]](q.KeyCode);if not X then return;end;l[7][4][l[7][7]]=true;l[5].spawnS(function()local q=l[5].desyncSyncNow(1.5);if q and fireproximityprompt then pcall(fireproximityprompt,X);elseif l[6]and not q then l[6]("Couldn't sync in time, press again","warn");end;l[11][4][l[11][7]],l[7][4][l[7][7]]=math.min(l[11][4][l[11][7]],os.clock()+0.25),false;end);end)))

	track(localPlayer.CharacterAdded:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()l[2][4][l[2][7]]();for q,q in pairs(l[3])do pcall(q,false);end;end)))

	table.insert(v2.cleanups, function()
		pcall(fn3)
	end)

	sectionLabel(cheats, "Jobs", 60)
	local flag7
	flag7 = false
	local flag8
	flag8 = false
	local tbl2
	tbl2 = {}
	local v3
	v3 = nil
	local v4, n5, fn6, fn7, fn8, fn9, hudProgress, hudStatus

	do
		local v5 = nil
		local n6 = 0
		v4 = nil
		local flag9 = false
		local n7 = 0
		local n8 = 0
		local n9 = 0
		n5 = 0

		fn6 = function(arg2)
			local team = localPlayer.Team
			local flag10 = team ~= nil
			local flag11

			if flag10 then
				flag11 = tostring(team.Name):lower():find(arg2, 1, true) ~= nil
			else
				flag11 = flag10
			end

			return flag11
		end

		local n10 = 12
		local n11 = 1000

		fn7 = function()
			if flag9 then
				return
			end
			local remote = replicatedStorage:FindFirstChild("Remote")
			remote = remote and remote:FindFirstChild("PlayerEvent")
			if not remote then
				return
			end
			flag9 = true

			track(remote.OnClientEvent:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
			function(q,X,C)local function n(N)return l[1][4][l[1][7]]and tostring(N)==l[1][4][l[1][7]]and os.clock()-l[2][4][l[2][7]]<6;end;if q=="updateJobs"and type(X)=="table"then l[3][4][l[3][7]]=X;local N=nil;for j,c in pairs(X)do if type(c)=="table"and typeof(c.location)=="Vector3"and not n(j)then local v=tostring(c.infoDescription or""):match("([%d%.]+)");N={id=tostring(j),location=c.location,step=c.step,steps=tonumber(c.steps)or 2,miles=tonumber(v)or 0};end;end;l[4][4][l[4][7]]=N;else local N=q=="missionJoined"and type(C)=="table"and typeof(C.location)=="Vector3"and not n(C.missionId);if N then l[4][4][l[4][7]]={id=tostring(C.missionId or l[4][4][l[4][7]]and l[4][4][l[4][7]].id or""),location=C.location,step=l[4][4][l[4][7]]and l[4][4][l[4][7]].step,steps=l[4][4][l[4][7]]and l[4][4][l[4][7]].steps or 2,miles=l[4][4][l[4][7]]and l[4][4][l[4][7]].miles or 0};end;end;n=q=="jobStep"and X=="start"and type(C)=="table"and C.ingredients~=nil;if n then l[5][4][l[5][7]]=C;end;end)))
		end

		fn8 = function()
			local remote = replicatedStorage:FindFirstChild("Remote")
			return remote and remote:FindFirstChild("PlayerFunc")
		end

		local function fn10()
			local gameplay = workspace_:FindFirstChild("Gameplay")
			gameplay = gameplay and gameplay:FindFirstChild("Entities")
			gameplay = gameplay and gameplay:FindFirstChild("ClientContent")
			return gameplay and gameplay:FindFirstChild("VehicleInteraction")
		end

		fn9 = function(arg2)
			local v = fn8()
			if not v then
				return false
			end

			return (pcall(function()
				v:InvokeServer("talkToMission", arg2)
			end))
		end

		local function fn11()
			local getCurrentVehicle = v2.getCurrentVehicle and v2.getCurrentVehicle()
			if getCurrentVehicle and getCurrentVehicle.PrimaryPart then
				return getCurrentVehicle
			end
			local v = getRoot and getRoot()
			return v and v.Parent
		end

		local tbl3 = nil

		local function fn12()
			if tbl3 then
				return tbl3
			end
			local screenGui = v2.ScreenGui
			if not screenGui then
				return nil
			end

			local Frame = make("Frame", {
				Parent = screenGui,
				Size = UDim2.fromOffset(250, 42),
				AnchorPoint = Vector2.new(0.5, 1),
				Position = UDim2.new(0.5, 0, 1, -72),
				BackgroundColor3 = c2.SURFACE,
				BackgroundTransparency = 0.1,
				BorderSizePixel = 0,
				Visible = false,
				ZIndex = 50,
			})

			make("UICorner", { CornerRadius = UDim.new(0, 10), Parent = Frame })
			make("UIStroke", { Color = c2.ACCENT, Thickness = 1, Transparency = 0.55, Parent = Frame })

			local TextLabel = make("TextLabel", {
				Parent = Frame,
				Size = UDim2.new(1, -20, 0, 14),
				Position = UDim2.fromOffset(10, 7),
				BackgroundTransparency = 1,
				Text = "",
				Font = Enum.Font.GothamBold,
				TextSize = 11,
				TextColor3 = c2.TEXT,
				TextXAlignment = Enum.TextXAlignment.Left,
				ZIndex = 51,
			})

			local Frame2 = make("Frame", {
				Parent = Frame,
				Size = UDim2.new(1, -20, 0, 6),
				Position = UDim2.fromOffset(10, 26),
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 0.85,
				BorderSizePixel = 0,
				ZIndex = 51,
			})

			make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Frame2 })

			local Frame3 = make("Frame", {
				Parent = Frame2,
				Size = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = c2.ACCENT,
				BorderSizePixel = 0,
				ZIndex = 52,
			})

			make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Frame3 })
			make("UIGradient", { Parent = Frame3, Color = ColorSequence.new(c2.ACCENT, c2.ACCENT2) })
			tbl3 = { holder = Frame, lbl = TextLabel, fill = Frame3 }
			return tbl3
		end

		local TweenService = game:GetService("TweenService")

		hudProgress = function(text, arg2)
			local v = fn12()
			if not v then
				return
			end
			v.statusOn = false
			v.holder.Visible = true
			v.lbl.Text = text
			v.fill.Size = UDim2.new(0, 0, 1, 0)

			if v.tween then
				pcall(function()
					v.tween:Cancel()
				end)
			end

			local linear = Enum.EasingStyle.Linear
			v.tween = TweenService:Create(v.fill, TweenInfo.new(math.max(0.1, arg2), linear), { Size = UDim2.new(1, 0, 1, 0) })
			v.tween:Play()
		end

		local function hudProgressText(text)
			if tbl3 and tbl3.holder.Visible then
				tbl3.lbl.Text = text
			end
		end

		hudStatus = function(text)
			local v = fn12()
			if not v then
				return
			end
			v.holder.Visible = true
			v.lbl.Text = text
			if v.statusOn then
				return
			end
			v.statusOn = true

			if v.tween then
				pcall(function()
					v.tween:Cancel()
				end)
			end

			v.fill.Size = UDim2.new(0.2, 0, 1, 0)
			v.tween = TweenService:Create(v.fill, TweenInfo.new(0.85, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), { Size = UDim2.new(0.7, 0, 1, 0) })
			v.tween:Play()
		end

		local function hudHide()
			if tbl3 then
				tbl3.statusOn = false

				if tbl3.tween then
					pcall(function()
						tbl3.tween:Cancel()
					end)
				end

				pcall(function()
					tbl3.holder.Visible = false
				end)
			end
		end

		local v = getconnections
		local getconnections_

		if v then
			getconnections_ = v
		else
			getconnections_ = getgenv and getgenv().getconnections
		end

		local getupvalues_ = debug and debug.getupvalues or getupvalues
		local function fn13(l)if type(l)~="table"then return false;end;local q=0;for X,X in pairs(l)do if type(X)~="table"or X.jobName==nil then return false;end;q+=1;end;return q>0;end
		local obj = setmetatable({}, { __mode = "k" })

		local function fn14()
			local remote = replicatedStorage:FindFirstChild("Remote")
			remote = remote and remote:FindFirstChild("PlayerEvent")
			if not (remote and getconnections_ and getupvalues_) then
				return
			end
			local ok, result = pcall(getconnections_, remote.OnClientEvent)
			if not (ok and type(result) == "table") then
				return
			end

			for _, v6 in ipairs(result) do
				local function_ = type(v6) == "table" and v6.Function or nil

				if type(function_) == "function" then
					local ok2, result2 = pcall(getupvalues_, function_)

					if ok2 and type(result2) == "table" then
						for _, v7 in pairs(result2) do
							if type(v7) == "table" then
								if fn13(v7) then
									obj[v7] = true
								end

								for _, v8 in pairs(v7) do
									if type(v8) == "table" and fn13(v8) then
										obj[v8] = true
									end
								end
							end
						end
					end
				end
			end
		end

		local function jobTables()
			fn14()
			local tbl4 = {}
			local coreJobs = v2.coreJobs and v2.coreJobs()

			if type(coreJobs) == "table" and next(coreJobs) ~= nil then
				tbl4[#tbl4 + 1] = coreJobs
			end

			if type(tbl2) == "table" and next(tbl2) ~= nil then
				tbl4[#tbl4 + 1] = tbl2
			end

			for k in pairs(obj) do
				tbl4[#tbl4 + 1] = k
			end

			return tbl4
		end

		v2.jobTables = jobTables
		v2.hudProgress = hudProgress
		v2.hudProgressText = hudProgressText
		v2.hudStatus = hudStatus
		v2.hudHide = hudHide

		local function fn15()
			for _, v6 in ipairs(jobTables()) do
				for k, v7 in pairs(v6) do
					local flag10 = type(v7) == "table" and v7.jobName == "Taxi Order" and typeof(v7.location) == "Vector3"

					if flag10 then
						flag10 = not (v5 and tostring(k) == v5 and os.clock() - n6 < 6)
					end

					if flag10 then
						local match = tostring(v7.infoDescription or ""):match("([%d%.]+)")

						return {
							id = tostring(k),
							location = v7.location,
							step = v7.step,
							steps = tonumber(v7.steps) or 2,
							miles = tonumber(match) or 0,
						}
					end
				end
			end

			return nil
		end

		local function fn16()
			local str2 = nil
			local n = -1

			local function fn17(arg2)
				if type(arg2) ~= "table" then
					return
				end

				for k, v6 in pairs(arg2) do
					local flag10 = type(v6) == "table" and v6.jobName == "Taxi Order" and v6.location == nil

					if flag10 then
						flag10 = (tonumber(v6.reward) or 0) > n
					end

					if flag10 then
						n = tonumber(v6.reward) or 0
						str2 = tostring(k)
					end
				end
			end

			fn17(tbl2)

			for _, v6 in ipairs(jobTables()) do
				fn17(v6)
			end

			return str2
		end

		local n = 0

		local function fn17()
			n += 1
			local v6 = n
			local now = os.clock()
			local n12 = 0

			while flag7 and v6 == n do
				if not fn6("transit") then
					if os.clock() - n9 > 8 then
						n9 = os.clock()
						notify("Auto Taxi: switch to the Transit team to start", "info")
					end

					hudStatus("Auto Taxi  ·  join the Transit team")
					task.wait(1)
				elseif v3 and v3.location then
					local getCurrentVehicle = v2.getCurrentVehicle and v2.getCurrentVehicle()

					if getCurrentVehicle then
						now = os.clock()
					end

					if not getCurrentVehicle then
						if os.clock() - now > 5 and os.clock() - n7 > 8 then
							n7 = os.clock()
							notify("Auto Taxi: get in a taxi to finish the job", "info")
						end

						task.wait(0.6)
					else
						local v7 = fn10()

						if not v7 then
							task.wait(0.5)
						else
							local location = v3.location
							local position = getRoot and getRoot()
							position = position and position.Position or location
							local flag10 = v3.step and v3.steps and v3.step >= v3.steps
							local miles = v3.miles and v3.miles > 0 and v3.miles or 0
							local n13

							if flag10 and miles > 0 then
								n13 = miles * n10
							else
								n13 = (position - location).Magnitude / n11 * n10
							end

							local n14 = math.max(12, n13) * (1 + math.random() * 0.15)
							local taxi = flag10 and "Dropping off" or "Heading to pickup"
							local getCurrentVehicle2 = flag8 and v2.autoDriveTo and v2.getCurrentVehicle and v2.getCurrentVehicle()
							local flag11 = false

							if getCurrentVehicle2 then
								flag11 = v2.autoDriveTo(location, {
									reach = 26,
									closeUp = 10,
									park = false,
									name = "Taxi: " .. taxi,
									maxT = 240,
									alive = function()
										return flag7 and v6 == n and v3 ~= nil and v3.location == location
									end,
								}) == true

								if not flag11 and v2.log then
									v2.log("Auto Taxi: drive leg failed, blinking instead", "warn")
								end
							end

							if not flag11 then
								hudProgress(("Auto Taxi  ·  %s"):format(taxi), n14)
								local n15 = 0

								while flag7 and v6 == n and n15 < n14 and v3 and v3.location == location do
									hudProgressText(("Auto Taxi  ·  %s   %ds"):format(taxi, math.max(0, math.ceil(n14 - n15))))
									task.wait(0.5)
									n15 += 0.5
								end

								hudHide()
							end

							if flag11 and flag7 and v3 and v3.location == location then
								local v8 = fn11()

								if v8 and v8.PrimaryPart then
									pcall(function()
										v8.PrimaryPart.AssemblyLinearVelocity = Vector3.zero
										v8.PrimaryPart.AssemblyAngularVelocity = Vector3.zero
									end)
								end

								task.wait(0.6)
								fn9(v7)
								n12 += 1
								task.wait(0.2)
								local n15 = tonumber(v3 and v3.steps) or 2
								flag10 = flag10 or n12 >= n15

								if flag10 then
									local id = v3 and v3.id or v5
									local now2 = os.clock()
									v5 = id
									n6 = now2
									v3 = nil
								else
									local now2 = os.clock()

									while true do
										task.wait(0.3)
										if not (not flag7 or not v3 or v3.location ~= location or os.clock() - now2 > 6) then
											continue
										end
										break
									end
								end
							elseif flag7 and v3 and v3.location == location then
								local v8 = fn11()
								local v9 = nil

								if v8 then
									local ok, result = pcall(function()
										return v8:GetPivot()
									end)

									if ok then
										v9 = result
									end

									pcall(function()
										v8:PivotTo(CFrame.new(location + Vector3.new(0, 1, 0)))
									end)
								end

								task.wait(4)

								if v8 and v8.PrimaryPart then
									pcall(function()
										v8.PrimaryPart.AssemblyLinearVelocity = Vector3.zero
										v8.PrimaryPart.AssemblyAngularVelocity = Vector3.zero
									end)
								end

								fn9(v7)
								n12 += 1
								task.wait(0.2)

								if v8 and v9 then
									pcall(function()
										v8:PivotTo(v9)
									end)
								end

								local n15 = tonumber(v3 and v3.steps) or 2

								if flag10 or n12 >= n15 then
									local id = v3 and v3.id or v5
									local now2 = os.clock()
									v5 = id
									n6 = now2
									v3 = nil
								else
									local now2 = os.clock()

									while true do
										task.wait(0.3)
										if not (not flag7 or not v3 or v3.location ~= location or os.clock() - now2 > 6) then
											continue
										end
										break
									end
								end
							end
						end
					end
				else
					local v7 = fn16()

					if v7 then
						fn9(v7 .. "join")
						local now2 = os.clock()

						while true do
							task.wait(0.2)
							if not (not flag7 or v3 or os.clock() - now2 > 4) then
								continue
							end
							break
						end

						v3 = v3 or fn15()
						n12 = 0
					else
						hudStatus("Auto Taxi  ·  waiting for an order…")

						if os.clock() - n8 > 10 then
							n8 = os.clock()
							notify("Auto Taxi: no taxi orders available right now -- waiting for one", "info")
						end

						task.wait(0.4)
					end
				end
			end
		end

		v2.spawnS(function()
			for i = 1, 60 do
				fn7()
				if not flag9 then
					task.wait(0.5)
					continue
				end
				break
			end
		end)

		local v6 = makeToggleRow(cheats, "car", "Auto Taxi", "Accepts taxi orders and completes them. Drive a taxi for it to work.", 61, false, function(arg2)
			flag7 = arg2

			if arg2 then
				v2.soloJob("taxi")
				fn7()
				v3 = v3 or fn15()
				v2.spawnS(fn17)
			else
				hudHide()

				if v2.autoDriveStop then
					v2.autoDriveStop()
				end
			end
		end, "autoTaxi", function(arg2)
			makeToggleRow(arg2, "navigation", "Drive There", "Drives to each pickup and drop-off on the road instead of jumping there.", 1, false, function(arg3)
				flag8 = arg3
			end, "autoTaxiDrive")
		end)

		v2.autoJobs.taxi = function()
			if v6 then
				v6(false)
			end
		end

		table.insert(v2.cleanups, function()
			flag7 = false
			hudHide()
		end)

		local flag10 = false
		local n12 = 0
		local n13 = 12
		local tbl4 = {}
		local n14 = 9

		local function fn18(arg2, arg3)
			local v7 = fn8()
			if not v7 then
				return false
			end

			if arg3 == nil then
				return (pcall(function()
					v7:InvokeServer("equipSpecialItem", arg2)
				end))
			end

			return (pcall(function()
				v7:InvokeServer("equipSpecialItem", arg2, arg3)
			end))
		end

		local function fn19()
			local gameplay = workspace_:FindFirstChild("Gameplay")
			gameplay = gameplay and gameplay:FindFirstChild("Entities")
			gameplay = gameplay and gameplay:FindFirstChild("ClientContent")
			gameplay = gameplay and gameplay:FindFirstChild("CookSpot")
			gameplay = gameplay and gameplay:FindFirstChild("Handle")
			return gameplay and gameplay:FindFirstChild("Interact")
		end

		local function fn20()
			local gameplay = replicatedStorage:FindFirstChild("Gameplay")
			gameplay = gameplay and gameplay:FindFirstChild("Entities")
			return gameplay and gameplay:FindFirstChild("CookSpot")
		end

		local function fn21()
			local gameplay = replicatedStorage:FindFirstChild("Gameplay")
			gameplay = gameplay and gameplay:FindFirstChild("Missions")
			gameplay = gameplay and gameplay:FindFirstChild("Chef")
			return gameplay and gameplay:FindFirstChild("Restaurants")
		end

		local function fn22(arg2)
			local v7 = fn21()
			if not v7 then
				return nil, nil
			end
			local v8 = v7:FindFirstChild(tostring(arg2))
			if not v8 then
				return nil, nil
			end
			local v9 = nil
			local v10 = nil

			for _, descendant in ipairs(v8:GetDescendants()) do
				if descendant.Name == "Relocate" and not v9 then
					v9 = descendant
				elseif descendant.Name == "CookOrderPickUp" and not v10 then
					v10 = descendant
				end
			end

			return v9, v10
		end

		local function fn23(arg2)
			local restaurant = arg2 or v4

			if restaurant then
				restaurant = (arg2 or v4).restaurant
			end

			if type(restaurant) == "number" then
				return restaurant
			end

			if type(restaurant) == "string" then
				local num = tonumber(restaurant:match("(%d+)"))
				if num then
					return num
				end
			end

			if typeof(restaurant) == "Instance" then
				local num = tonumber(tostring(restaurant.Name):match("(%d+)"))
				if num then
					return num
				end
			end

			return 2
		end

		local function fn24(arg2)
			local tbl5 = {}
			local ingredients = arg2 or v4

			if ingredients then
				ingredients = (arg2 or v4).ingredients
			end

			if type(ingredients) ~= "table" then
				return tbl5
			end

			for _, ingredient in ipairs(ingredients) do
				if type(ingredient) == "string" then
					tbl5[#tbl5 + 1] = ingredient
				elseif type(ingredient) == "table" and type(ingredient.name) == "string" then
					tbl5[#tbl5 + 1] = ingredient.name
				end
			end

			if #tbl5 == 0 then
				for k, ingredient in pairs(ingredients) do
					if type(ingredient) == "string" then
						tbl5[#tbl5 + 1] = ingredient
					elseif type(k) == "string" then
						tbl5[#tbl5 + 1] = k
					end
				end
			end

			return tbl5
		end

		local function fn25(arg2)
			local flag11 = type(arg2) == "table" and arg2.location == nil and arg2.jobName ~= nil and arg2.jobName ~= "Taxi Order"

			if flag11 then
				flag11 = tostring(arg2.infoDescription or ""):lower():find("ingredient") ~= nil
			end

			return flag11
		end

		local function fn26(arg2)
			local v7 = nil
			local n15 = -1
			local flag11 = false
			local tbl5 = {}

			local function fn27(arg3)
				if type(arg3) ~= "table" then
					return
				end

				for k, v8 in pairs(arg3) do
					local str2 = tostring(k)
					local v9 = tbl4[str2]
					local flag12

					if v9 then
						local v10 = tbl4[str2]
						flag12 = os.clock() - v10 < n14
					else
						flag12 = v9
					end

					if not flag12 then
						flag12 = arg2 and arg2[str2]

						if flag12 then
							local v10 = arg2[str2]
							flag12 = os.clock() - v10 < 15
						end
					end

					if type(v8) == "table" and v8.jobName ~= nil and v8.location == nil then
						flag11 = true
						tbl5[tostring(v8.jobName)] = true
					end

					local flag13 = fn25(v8) and not flag12

					if flag13 then
						flag13 = (tonumber(v8.reward) or 0) > n15
					end

					if flag13 then
						n15 = tonumber(v8.reward) or 0
						v7 = str2
					end
				end
			end

			fn27(tbl2)

			for _, v8 in ipairs(jobTables()) do
				fn27(v8)
			end

			return v7, flag11, tbl5
		end

		local function fn27(arg2, arg3)
			local now = os.clock()
			local flag11

			repeat
				local v7 = fn8()
				local v8, v9 = arg2()

				if v7 and v8 ~= nil then
					local ok, result = pcall(function()
						if v9 == nil then
							return v7:InvokeServer("talkToMission", v8)
						end
						return v7:InvokeServer("talkToMission", v8, v9)
					end)

					if ok and result then
						return true
					end
				end

				task.wait(0.25)
				flag11 = not flag10

				if not flag11 then
					flag11 = os.clock() - now > (arg3 or 5)
				end
			until flag11

			return false
		end

		local function fn28(arg2)
			local restN = arg2.restN or 2
			local n15 = n13 * (1 + math.random() * 0.4)
			hudProgress(("Auto Restaurant  ·  cooking (rest. %d)"):format(restN), n15 + 6)
			local v7 = ipairs
			local ingredients = arg2.ingredients or {}

			for _, ingredient in v7(ingredients) do
				fn18(ingredient, true)
				task.wait(0.06)
				fn18(ingredient)
				task.wait(0.06)
			end

			fn27(function()
				return arg2.id .. "ingredients"
			end, 6)

			fn27(function()
				return fn19()
			end, 6)

			local v8 = fn20()

			if v8 then
				fn18(v8, true)
			else
				fn18("CookSpot", true)
			end

			task.wait(0.06)
			fn18("CookSpot")
			local n16 = 0

			while flag10 and n16 < n15 do
				hudProgressText(("Auto Restaurant  ·  plating   %ds"):format(math.max(0, math.ceil(n15 - n16))))
				task.wait(0.5)
				n16 += 0.5
			end

			hudHide()
			if not flag10 then
				return false
			end
			local v9, v10 = fn22(restN)
			v10 = v9 and v10
			local flag11 = false

			if v10 then
				flag11 = fn27(function()
					local v11, v12 = fn22(restN)
					if v11 and v12 then
						return v11, { dropOff = v12 }
					end
				end, 6)
			end

			if flag11 then
				notify("Auto Restaurant: order complete", "ok")
			else
				notify(("Auto Restaurant: couldn't finish order (rest. %d), retrying"):format(restN), "info")
			end

			task.wait(0.3)
			return flag11
		end

		local n15 = 0

		local function fn29()
			n15 += 1
			local v7 = n15
			local tbl5 = {}

			local function fn30(arg2)
				local flag11 = tbl4[arg2]

				if flag11 then
					local v8 = tbl4[arg2]
					flag11 = os.clock() - v8 < n14
				end

				return flag11
			end

			local tbl6 = nil
			local n16 = 0

			while flag10 and v7 == n15 do
				if not fn6("chef") then
					if os.clock() - n5 > 8 then
						n5 = os.clock()
						notify("Auto Restaurant: switch to the Chef team to start", "info")
					end

					hudStatus("Auto Restaurant  ·  join the Chef team")
					task.wait(1)
				else
					if not tbl6 and type(v4) == "table" then
						local str2 = tostring(v4.id or "")

						if str2 ~= "" and not fn30(str2) then
							tbl6 = { id = str2, ingredients = fn24(v4), restN = fn23(v4) }
						end
					end

					if tbl6 then
						fn28(tbl6)
						tbl4[tbl6.id] = os.clock()
						local flag11 = type(v4) == "table"
						local flag12

						if flag11 then
							local v8 = tostring
							local id = v4.id or ""
							local id2 = tbl6.id
							flag12 = v8(id) == id2
						else
							flag12 = flag11
						end

						if flag12 then
							v4 = nil
						end

						tbl6 = nil
					else
						hudStatus("Auto Restaurant  ·  waiting for an order…")

						if os.clock() - n16 > 1.2 then
							n16 = os.clock()
							local v8 = fn26(tbl5)

							if v8 then
								local flag11 = type(v4) == "table"

								if flag11 then
									flag11 = tostring(v4.id or "")
								end

								flag11 = flag11 or ""
								fn9(v8 .. "join")
								local now = os.clock()

								while true do
									task.wait(0.15)
									local flag12 = not flag10

									if not flag12 then
										flag12 = type(v4) == "table"

										if flag12 then
											flag12 = tostring(v4.id or "") ~= flag11
										end
									end

									if not (flag12 or os.clock() - now > 2) then
										continue
									end
									break
								end

								local flag12 = type(v4) == "table"

								if flag12 then
									flag12 = tostring(v4.id or "")
								end

								if (flag12 or "") == flag11 then
									tbl5[v8] = os.clock()
								end
							elseif os.clock() - n12 > 12 then
								n12 = os.clock()
								notify("Auto Restaurant: stand at a restaurant with chef orders available", "info")
							end
						end

						task.wait(0.2)
					end
				end
			end
		end

		local v7 = makeToggleRow(cheats, "beef", "Auto Restaurant", "Accepts chef orders and cooks them. Stand in a restaurant as a chef for it to work.", 62, false, function(arg2)
			flag10 = arg2

			if arg2 then
				v2.soloJob("restaurant")
				fn7()
				v2.spawnS(fn29)
			else
				hudHide()
			end
		end, "autoRestaurant")

		v2.autoJobs.restaurant = function()
			if v7 then
				v7(false)
			end
		end

		table.insert(v2.cleanups, function()
			flag10 = false
		end)
	end

	local tbl3
	tbl3 = {}
	local flag9
	flag9 = false
	local flag10
	flag10 = false
	local n6
	n6 = 0
	local n7
	n7 = 0
	local n8
	n8 = 0
	local n9
	n9 = 0
	local tbl4
	tbl4 = nil
	local flag11
	flag11 = false
	local fn10

	fn10 = function()
		local v = coroutine.running()
		if state.walkCtx and state.walkCtx.thread == v then
			return state.walkCtx.alive == nil or state.walkCtx.alive()
		end

		if tbl4 and tbl4.thread == v then
			return tbl4.alive == nil or tbl4.alive()
		end

		if tbl4 or state.walkCtx then
			return false
		end

		if not (flag9 and state.running) then
			return false
		end

		if n8 ~= n6 then
			return false
		end
		n9 = os.clock()
		return true
	end

	local flag12
	flag12 = false
	local flag13
	flag13 = false
	local flag14
	flag14 = false
	local v
	v = nil
	local RunService
	RunService = game:GetService("RunService")
	local VirtualInputManager
	VirtualInputManager = game:GetService("VirtualInputManager")
	local PathfindingService
	PathfindingService = game:GetService("PathfindingService")

	tbl3.onFarmerTeam = function()
		local team = localPlayer.Team
		local flag15 = team ~= nil
		local flag16

		if flag15 then
			flag16 = tostring(team.Name):lower():find("farmer", 1, true) ~= nil
		else
			flag16 = flag15
		end

		return flag16
	end

	local fn11

	fn11 = function()
		local remote = replicatedStorage:FindFirstChild("Remote")
		return remote and remote:FindFirstChild("PlayerFunc")
	end

	local fn12

	fn12 = function()
		return localPlayer.Character
	end

	local fn13

	fn13 = function()
		local v5 = fn12()
		return v5 and (v5:FindFirstChild("HumanoidRootPart") or v5.PrimaryPart)
	end

	local fn14

	fn14 = function()
		local v5 = fn12()
		return v5 and v5:FindFirstChildOfClass("Humanoid")
	end

	local v5 = nil

	tbl3.algorithms = function()
		if v5 then
			return v5
		end
		local ok, result = pcall(require, replicatedStorage.Modules.Algorithms)

		if ok then
			v5 = result
		end

		if restoreIdentity then
			restoreIdentity()
		end

		return v5
	end

	local str2
	str2 = ""
	local fn15

	fn15 = function(arg2, arg3)
		if tbl4 then
			return
		end

		if arg2 == str2 or not notify then
			return
		end
		str2 = arg2
		notify(arg2, arg3 or "info")
	end

	tbl3.fstat = function(arg2)
		if tbl4 then
			return
		end

		if v2.hudStatus then
			v2.hudStatus("Auto Farmer  ·  " .. arg2)
		end
	end

	local fn16

	fn16 = function(arg2, arg3)
		if tbl4 then
			return
		end

		if v2.hudProgress then
			v2.hudProgress(arg2, arg3)
		end
	end

	tbl3.fbarText = function(arg2)
		if tbl4 then
			return
		end

		if v2.hudProgressText then
			v2.hudProgressText(arg2)
		end
	end

	tbl3.fbarHide = function()
		if v2.hudHide then
			v2.hudHide()
		end
	end

	local tbl5
	tbl5 = {}
	local fn17

	fn17 = function()
	end

	local fn18, fn19, fn20, fn21, fn22, fn23, fn24, fn25

	do
		local n = 0
		local tbl6 = { [Enum.HumanoidStateType.Ragdoll] = true, [Enum.HumanoidStateType.FallingDown] = true }

		fn18 = function()
			local v6 = fn14()
			if not v6 then
				return
			end

			if not tbl6[v6:GetState()] then
				return
			end

			if os.clock() - n < 4 then
				return
			end
			n = os.clock()
			fn17("stuck: down on the floor, getting up")

			pcall(function()
				v6:ChangeState(Enum.HumanoidStateType.GettingUp)
			end)
		end

		fn19 = function(arg2)
			if not fn10() then
				return false
			end
			local v6 = fn14()
			if not (v6 and arg2) then
				return false
			end
			fn18()
			v6:MoveTo(arg2)
			return true
		end

		local n10 = 0
		fn20 = nil
		fn21 = nil
		fn22 = nil

		local function fn26()
			if not fn10() then
				return
			end

			if os.clock() - n10 < 1.2 then
				return
			end
			n10 = os.clock()
			local v6 = fn14()

			if v6 then
				pcall(function()
					v6.Jump = true
				end)
			end
		end

		fn23 = function(arg2, arg3)
			return Vector3.new(arg2.X - arg3.X, 0, arg2.Z - arg3.Z).Magnitude
		end

		fn24 = function(arg2, arg3)
			local vector = Vector3.new(arg3.X - arg2.X, 0, arg3.Z - arg2.Z)
			local magnitude = vector.Magnitude
			if magnitude < 1 then
				return true
			end
			local unit = vector.Unit
			local vector2 = Vector3.new(-unit.Z, 0, unit.X)
			local raycastParams = RaycastParams.new()
			raycastParams.FilterType = Enum.RaycastFilterType.Exclude
			raycastParams.FilterDescendantsInstances = { fn12() }
			local n11 = arg2 + Vector3.new(0, 1.5, 0)

			for _, v6 in ipairs({ -2.5, 0, 2.5 }) do
				local hit = workspace:Raycast(n11 + vector2 * v6, unit * magnitude, raycastParams)
				if hit and hit.Instance and hit.Instance.CanCollide then
					return false
				end
			end

			return true
		end

		local function fn27(arg2, arg3, arg4, arg5)
			for i = arg3, #arg2 do
				local vector = Vector3.new(arg2[i].X - arg4.X, 0, arg2[i].Z - arg4.Z)
				local magnitude = vector.Magnitude
				if magnitude >= arg5 then
					return arg4 + vector.Unit * arg5
				end
				arg5 -= magnitude
				arg4 = arg2[i]
			end

			return arg2[#arg2]
		end

		fn25 = function(arg2, arg3, arg4)
			arg3 = arg3 or 6
			arg4 = arg4 or 45
			local now = os.clock()
			local n11 = 0
			local n12 = 0
			local n13 = 0
			local position, groundUnder

			while fn10() and os.clock() - now < arg4 do
				local v6 = fn14()
				local v7 = fn13()
				if not (v6 and v7) then
					return false
				end

				if fn23(v7.Position, arg2) <= arg3 then
					return true
				end
				fn18()
				n11 += 1

				local tbl7 = {
					AgentRadius = 2.5,
					AgentHeight = 5,
					AgentCanJump = true,
					AgentJumpHeight = 7,
					AgentMaxSlope = 50,
					WaypointSpacing = 5,
				}

				local v8 = PathfindingService:CreatePath(tbl7)
				local n14

				if pcall(function()
					v8:ComputeAsync(v7.Position, arg2)
				end) and v8.Status == Enum.PathStatus.Success then
					local tbl8 = {}
					local tbl9 = {}

					for _, v9 in ipairs(v8:GetWaypoints()) do
						local n15 = #tbl8

						if n15 == 0 or fn23(v9.Position, tbl8[n15]) > 1 then
							tbl8[n15 + 1] = v9.Position
							n15 += 1
						end

						if v9.Action == Enum.PathWaypointAction.Jump then
							tbl9[n15] = true
						end
					end

					tbl8[#tbl8 + 1] = arg2
					local n15 = 12 + math.random() * 5
					local tbl10 = {}
					local v9 = nil

					tbl7 = function(arg5)
						v9 = arg5
					end

					local connection = v8.Blocked:Connect(tbl7)
					local position2 = v7.Position
					local now2 = os.clock()
					local n16 = 1
					local exitTo = nil

					while true do
						if not fn10() then
							exitTo = 1
							break
						else
							if arg4 < os.clock() - now then
								exitTo = 2
								break
							elseif fn14() ~= v6 then
								exitTo = 2
								break
							else
								v7 = fn13()

								if not v7 then
									exitTo = 3
									break
								else
									position = v7.Position
									groundUnder = fn23
									groundUnder = groundUnder(position, arg2)

									if groundUnder <= arg3 then
										exitTo = 4
										break
									else
										fn18()

										while n16 < #tbl8 do
											local v10 = tbl8[n16]
											local v11 = tbl8[n16 + 1]
											n14 = v11.Z - v10.Z
											local vector = Vector3.new(v11.X - v10.X, 0, n14)
											tbl7 = position.Z - v10.Z
											local vector2 = Vector3.new(position.X - v10.X, 0, tbl7)
											n14 = position
											local v12 = fn23(v10, n14)
											if v12 < 3 or v12 < n15 and vector.Magnitude > 0.01 and vector2:Dot(vector.Unit) > 0 then
												n16 += 1
												continue
											end
											break
										end

										if fn23(tbl8[n16], position) > 20 then
											exitTo = 2
											break
										elseif v9 and v9 >= n16 then
											exitTo = 2
											break
										else
											local v10 = nil

											for _, v11 in ipairs({ n15, n15 * 0.6, n15 * 0.3 }) do
												n14 = position
												v10 = fn27(tbl8, n16, n14, v11)
												groundUnder = fn24
												groundUnder = groundUnder(position, v10)
												if not groundUnder then
													v10 = nil
													continue
												end
												break
											end

											v10 = v10 or fn27(tbl8, n16, position, n15 * 0.3)

											for i = n16, math.min(#tbl8, n16 + 3) do
												local flag15 = tbl9[i] and not tbl10[i]

												if flag15 then
													n14 = position
													flag15 = fn23(tbl8[i], n14) < 6
												end

												if flag15 then
													tbl10[i] = true

													pcall(function()
														v6:ChangeState(Enum.HumanoidStateType.Jumping)
													end)

													break
												end
											end

											tbl7 = v6
											tbl7 = tbl7
											tbl7:MoveTo(v10)

											if fn21 then
												fn21()
											end

											tbl7 = v6
											tbl7 = tbl7

											if tbl6[tbl7:GetState()] then
												now2 = os.clock()
												task.wait(0.1)
												continue
											elseif (position - position2).Magnitude > 3 then
												now2 = os.clock()
												position2 = position
												task.wait(0.1)
												continue
											elseif not (os.clock() - now2 > 2.5) then
												task.wait(0.1)
												continue
											end
										end
									end
								end
							end

							break
						end
					end

					if exitTo == 1 then
						connection:Disconnect()
						return false
					end

					if exitTo ~= 2 then
						if exitTo == 3 then
							connection:Disconnect()
							return false
						end

						if exitTo == 4 then
							connection:Disconnect()

							if fn22 then
								fn22()
							end

							return true
						end

						n12 += 1
						groundUnder = fn23
						groundUnder = groundUnder(position, arg2)

						if groundUnder < 12 or n12 >= 3 then
							groundUnder = fn23
							fn17(("walk: wedged %d studs from it, giving up to the caller"):format(groundUnder(position, arg2)))
							connection:Disconnect()
							return false
						end

						fn17("walk: wedged, re-planning from here")
					end

					connection:Disconnect()
				elseif flag12 then
					local v9 = tbl3.algorithms()
					local v10 = fn13()

					if v9 and type(v9.charPivotTo) == "function" and v10 then
						local raycastParams = RaycastParams.new()
						raycastParams.FilterType = Enum.RaycastFilterType.Exclude
						raycastParams.FilterDescendantsInstances = { fn12() }
						local n15 = math.max(arg3, 4)
						local flag15 = false

						for i = 0, 7 do
							local n16 = i * 3.1415926535897931 / 4
							local n17 = arg2.X + math.cos(n16) * n15
							local n18 = arg2.Z + math.sin(n16) * n15
							local v11 = tbl3.groundUnder(n17, n18, arg2.Y + 30, raycastParams)

							if v11 then
								local vector = Vector3.new(n17, v11 + 3.5, n18)

								if fn24(vector, arg2) then
									fn17("walk: no route in tp mode, hopping to a clear spot by the target")

									pcall(function()
										local cframe = CFrame.new
										v9.charPivotTo(fn12(), cframe(vector))
									end)

									if fn20 then
										fn20()
									end

									flag15 = true
									break
								end
							end
						end

						if flag15 then
							task.wait(0.3)
						else
							local position2 = fn13() and fn13().Position
							if not fn19(arg2) then
								break
							end
							task.wait(0.5)
							local position3 = fn13() and fn13().Position

							if position2 and position3 and (position3 - position2).Magnitude < 1.5 then
								fn26()
								n13 += 1

								if n13 >= 3 then
									local v11 = fn13()
									tbl7 = tbl3.algorithms()

									if v11 and tbl7 and type(tbl7.charPivotTo) == "function" then
										local vector = Vector3.new(arg2.X - v11.Position.X, 0, arg2.Z - v11.Position.Z)

										if vector.Magnitude > 1 then
											n14 = v11.Position + vector.Unit * math.min(18, vector.Magnitude)
											local raycastParams2 = RaycastParams.new()
											raycastParams2.FilterType = Enum.RaycastFilterType.Exclude
											raycastParams2.FilterDescendantsInstances = { fn12() }
											groundUnder = tbl3.groundUnder
											groundUnder = groundUnder(n14.X, n14.Z, n14.Y + 30, raycastParams2)

											if groundUnder then
												fn17("walk: boxed in with no route, hopping past it")

												pcall(function()
													local cframe = CFrame.new
													local x = n14.X
													local n16 = groundUnder + 3.5
													local z = n14.Z
													tbl7.charPivotTo(fn12(), cframe(x, n16, z))
												end)

												if fn20 then
													fn20()
												end
											end
										end
									end

									n13 = 0
								end
							else
								n13 = 0
							end
						end
					else
						local position2 = fn13() and fn13().Position
						if not fn19(arg2) then
							break
						end
						task.wait(0.5)
						local position3 = fn13() and fn13().Position

						if position2 and position3 and (position3 - position2).Magnitude < 1.5 then
							fn26()
							n13 += 1

							if n13 >= 3 then
								local v11 = fn13()
								tbl7 = tbl3.algorithms()
								local flag15 = v11 and tbl7 and type(tbl7.charPivotTo) == "function"
								n13 = 0

								if flag15 then
									local vector = Vector3.new(arg2.X - v11.Position.X, 0, arg2.Z - v11.Position.Z)

									if vector.Magnitude > 1 then
										n14 = v11.Position + vector.Unit * math.min(18, vector.Magnitude)
										local raycastParams = RaycastParams.new()
										raycastParams.FilterType = Enum.RaycastFilterType.Exclude
										raycastParams.FilterDescendantsInstances = { fn12() }
										groundUnder = tbl3.groundUnder
										groundUnder = groundUnder(n14.X, n14.Z, n14.Y + 30, raycastParams)

										if groundUnder then
											fn17("walk: boxed in with no route, hopping past it")

											pcall(function()
												local cframe = CFrame.new
												local x = n14.X
												local n15 = groundUnder + 3.5
												local z = n14.Z
												tbl7.charPivotTo(fn12(), cframe(x, n15, z))
											end)

											if fn20 then
												fn20()
											end
										end
									end
								end
							end
						else
							n13 = 0
						end
					end
				else
					local position2 = fn13() and fn13().Position
					if not fn19(arg2) then
						break
					end
					task.wait(0.5)
					local position3 = fn13() and fn13().Position

					if position2 and position3 and (position3 - position2).Magnitude < 1.5 then
						fn26()
						n13 += 1

						if n13 >= 3 then
							local v9 = fn13()
							tbl7 = tbl3.algorithms()
							local flag15 = v9 and tbl7 and type(tbl7.charPivotTo) == "function"
							n13 = 0

							if flag15 then
								local vector = Vector3.new(arg2.X - v9.Position.X, 0, arg2.Z - v9.Position.Z)

								if vector.Magnitude > 1 then
									n14 = v9.Position + vector.Unit * math.min(18, vector.Magnitude)
									local raycastParams = RaycastParams.new()
									raycastParams.FilterType = Enum.RaycastFilterType.Exclude
									raycastParams.FilterDescendantsInstances = { fn12() }
									groundUnder = tbl3.groundUnder
									groundUnder = groundUnder(n14.X, n14.Z, n14.Y + 30, raycastParams)

									if groundUnder then
										fn17("walk: boxed in with no route, hopping past it")

										pcall(function()
											local cframe = CFrame.new
											local x = n14.X
											local n15 = groundUnder + 3.5
											local z = n14.Z
											tbl7.charPivotTo(fn12(), cframe(x, n15, z))
										end)

										if fn20 then
											fn20()
										end
									end
								end
							end
						end
					else
						n13 = 0
					end
				end

				if n11 > 14 then
					break
				end
			end

			if fn22 then
				fn22()
			end

			local v6 = fn13()
			local flag15 = v6 ~= nil
			local flag16

			if flag15 then
				groundUnder = v6.Position
				flag16 = fn23(groundUnder, arg2) <= arg3 + 6
			else
				flag16 = flag15
			end

			return flag16
		end
	end

	local fn26
	fn26 = nil
	local fn27
	fn27 = nil
	local fn28
	fn28 = nil
	local fn29
	fn29 = nil
	local fn30, fn31
	local tbl6 = {}

	fn30 = function(arg2)
		if tbl6[arg2] then
			return tbl6[arg2]
		end
		local playerScripts = localPlayer:FindFirstChild("PlayerScripts")
		playerScripts = playerScripts and playerScripts:FindFirstChild("Framework")
		playerScripts = playerScripts and playerScripts:FindFirstChild(arg2)

		if playerScripts then
			local ok, result = pcall(require, playerScripts)

			if ok then
				tbl6[arg2] = result
			end
		end

		if fn20 then
			fn20()
		end

		return tbl6[arg2]
	end

	fn31 = function()
		local Core = fn30("Core")

		local ok, result = pcall(function()
			return Core and Core.stamina
		end)

		if fn20 then
			fn20()
		end

		return ok and tonumber(result) or 0
	end

	fn21 = function()
		local v6 = fn14()
		if not v6 then
			return
		end

		if v6.MoveDirection.Magnitude < 0.1 then
			return
		end

		if fn31() < 12 then
			return
		end
		local Character = fn30("Character")
		if not Character then
			return
		end

		pcall(function()
			Character.runningUserInput(true)
		end)

		if fn20 then
			fn20()
		end
	end

	fn22 = function()
		local character = tbl6.Character
		if not character then
			return
		end

		pcall(function()
			character.stopRunningUserInput()
		end)

		if fn20 then
			fn20()
		end
	end

	tbl3.groundUnder = function(arg2, arg3, arg4, arg5)
		local hit = workspace:Raycast(Vector3.new(arg2, arg4, arg3), Vector3.new(0, -400, 0), arg5)
		if not hit or hit.Material == Enum.Material.Water then
			return nil, false
		end
		local y = hit.Position.Y
		local flag15 = false

		for i = 1, 3 do
			local hit2 = workspace:Raycast(Vector3.new(arg2, y - 1, arg3), Vector3.new(0, -60, 0), arg5)

			if hit2 and hit2.Material ~= Enum.Material.Water and y - hit2.Position.Y > 8 then
				y = hit2.Position.Y
				flag15 = true
				continue
			end

			break
		end

		return y, flag15
	end

	tbl3.landSpot = function(arg2, arg3)
		local v6 = fn13()
		local n

		if v6 then
			local vector = Vector3.new(v6.Position.X - arg2.X, 0, v6.Position.Z - arg2.Z)

			if not (vector.Magnitude > 1) then
				n = arg2
			else
				n = arg2 + vector.Unit * math.max(arg3 or 6, 5)
			end
		else
			n = arg2
		end

		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude
		raycastParams.FilterDescendantsInstances = { fn12() }
		local v7 = tbl3.groundUnder(n.X, n.Z, n.Y + 30, raycastParams)
		return Vector3.new(n.X, v7 and v7 + 3.5 or arg2.Y + 4, n.Z)
	end

	local fn32

	fn32 = function(arg2, arg3)
		local n = arg3 or 6
		if not (fn13() and arg2) then
			return false
		end

		local function fn33()
			local v6 = fn13()
			return v6 and (v6.Position - arg2).Magnitude or 1e9
		end

		if flag12 then
			if fn26() then
				fn27()
			end

			if fn33() > 20 then
				local v6 = tbl3.algorithms()

				if v6 and type(v6.charPivotTo) == "function" then
					for i = 1, 2 do
						if not fn10() then
							return false
						end

						pcall(function()
							local charPivotTo = v6.charPivotTo
							local v7 = fn12()
							local v8 = table.pack(CFrame.new(tbl3.landSpot(arg2, n)))
							charPivotTo(v7, table.unpack(v8, 1, v8.n))
						end)

						if fn20 then
							fn20()
						end

						task.wait(0.5)
						if fn33() <= math.max(n + 12, 25) then
							break
						end
					end
				end

				local v7 = fn33()

				if math.max(n + 12, 25) < v7 then
					fn17("tp: pivot didn't land, walking it")
				end
			end
		elseif fn26() then
			local v6 = fn33()

			if v6 > 90 and fn28 then
				fn28(arg2, 35, math.clamp(v6 / 12, 15, 70))
			end

			fn27()
		end

		local v6 = fn33()
		if v6 >= 1e9 then
			return false
		end
		return fn25(arg2, n, math.clamp(v6 / 6, 20, 180))
	end

	local fn33
	fn33 = nil

	fn33 = function(arg2)
		if not arg2 then
			return nil
		end

		if arg2:IsA("BasePart") then
			return arg2.Position
		end

		if arg2:IsA("Attachment") then
			return arg2.WorldPosition
		end

		if arg2:IsA("Model") then
			local primaryPart = arg2.PrimaryPart or arg2:FindFirstChildWhichIsA("BasePart", true)
			if not primaryPart then
				return nil
			end

			local ok, result = pcall(function()
				return arg2:GetPivot()
			end)

			return ok and result.Position or primaryPart.Position
		end

		if arg2:IsA("ProximityPrompt") then
			return fn33(arg2.Parent)
		end
		return nil
	end

	tbl3.interaction = function()
		if tbl3._ia then
			return tbl3._ia
		end
		local flag15 = not getgc

		if not flag15 then
			flag15 = os.clock() - (tbl3._iaAt or -99) < 20
		end

		if flag15 then
			return nil
		end
		tbl3._iaAt = os.clock()

		pcall(function()
			for _, v6 in ipairs(getgc(true)) do
				if type(v6) == "table" and type(rawget(v6, "refreshDisplayedPrompts")) == "function" and type(rawget(v6, "triggerListener")) == "function" then
					tbl3._ia = v6
					break
				end
			end
		end)

		return tbl3._ia
	end

	local fn34

	fn34 = function(arg2, arg3)
		if not (arg2 and arg2.Parent) then
			return
		end

		if not arg3 then
			arg3 = (arg2.HoldDuration or 0) + 0.25
		end

		local v6 = tbl3.interaction()

		local function fn35()
			if v6 and v6.holdBegan and v6.holdBegan ~= arg2 then
				fn17("hold: game still held another prompt, cleared it")
				v6.holdBegan = false
			end
		end

		local function fn36(arg4, arg5)
			if not (v6 and arg2.HoldDuration >= 1) then
				return
			end
			task.wait(0.3)
			if v6.holdBegan == arg2 then
				return
			end
			local n = 0

			pcall(function()
				n = #getconnections(arg2.PromptButtonHoldBegan)
			end)

			local v7 = tostring
			local enabled = arg2.Enabled
			fn17(("hold: not registered (game holdBegan=%s, listeners=%d, enabled=%s), retrying"):format(tostring(v6.holdBegan), n, v7(enabled)))
			arg5()
			task.wait(0.2)
			fn35()
			arg4()
		end

		fn35()

		if v2.IS_MOBILE then
			if pcall(function()
				arg2:InputHoldBegin()
			end) then
				fn36(function()
					pcall(function()
						arg2:InputHoldBegin()
					end)
				end, function()
					pcall(function()
						arg2:InputHoldEnd()
					end)
				end)

				task.wait(arg3)

				pcall(function()
					arg2:InputHoldEnd()
				end)

				return
			end

			local playerGui = localPlayer:FindFirstChild("PlayerGui")
			playerGui = playerGui and playerGui:FindFirstChild("ProximityPrompts")
			local v7 = nil

			if playerGui then
				local v8 = nil

				for _, descendant in ipairs(playerGui:GetDescendants()) do
					if descendant:IsA("ImageButton") and descendant.Parent:IsA("BillboardGui") then
						v8 = descendant
						break
					else
						v8 = nil
					end
				end

				v7 = v8
			end

			if v7 then
				local absolutePosition = v7.AbsolutePosition
				local absoluteSize = v7.AbsoluteSize
				local n = absolutePosition.X + absoluteSize.X / 2
				local n10 = absolutePosition.Y + absoluteSize.Y / 2

				pcall(function()
					VirtualInputManager:SendTouchEvent(1, 0, n, n10)
					task.wait(arg3)
					VirtualInputManager:SendTouchEvent(1, 2, n, n10)
				end)
			end
		else
			pcall(function()
				VirtualInputManager:SendKeyEvent(true, arg2.KeyboardKeyCode, false, game)
			end)

			fn36(function()
				pcall(function()
					VirtualInputManager:SendKeyEvent(true, arg2.KeyboardKeyCode, false, game)
				end)
			end, function()
				pcall(function()
					VirtualInputManager:SendKeyEvent(false, arg2.KeyboardKeyCode, false, game)
				end)
			end)

			local n = os.clock() + arg3

			while os.clock() < n do
				if fn10() then
					task.wait(0.1)
					continue
				end
				break
			end

			pcall(function()
				VirtualInputManager:SendKeyEvent(false, arg2.KeyboardKeyCode, false, game)
			end)
		end
	end

	tbl3.ensureFarmHook = function()
		if flag10 then
			return
		end
		local remote = replicatedStorage:FindFirstChild("Remote")
		remote = remote and remote:FindFirstChild("PlayerEvent")
		if not remote then
			return
		end
		flag10 = true

		track(remote.OnClientEvent:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function(q,X,X)local C=q=="jobStep"and type(X)=="table"and X.team=="Farmer";if C then l[1][4][l[1][7]]=X;end;end)))
	end

	tbl3.pressButton = function(arg2)
		if not (arg2 and arg2.Parent) then
			return false
		end

		if getconnections then
			for _, v6 in ipairs({ "MouseButton1Click", "Activated", "MouseButton1Down" }) do
				local ok, result = pcall(function()
					return arg2[v6]
				end)

				if ok and result then
					local ok2, result2 = pcall(getconnections, result)

					if ok2 and result2 and #result2 > 0 then
						local v7, v8, v9 = ipairs(result2)
						local flag15 = false

						for _, v10 in v7, v8, v9 do
							if pcall(function()
								v10.Function()
							end) then
								flag15 = true
							end
						end

						if flag15 then
							return true
						end
					end
				end
			end
		end

		if firesignal then
			if pcall(function()
				firesignal(arg2.MouseButton1Click)
			end) then
				return true
			end
		end

		return false
	end

	tbl3.tapOffer = function(arg2)
		local absolutePosition = arg2.AbsolutePosition
		local absoluteSize = arg2.AbsoluteSize
		local screenGui = arg2:FindFirstAncestorWhichIsA("ScreenGui")
		local n = screenGui and screenGui.IgnoreGuiInset and 0

		if not n then
			n = game:GetService("GuiService"):GetGuiInset().Y
		end

		local n10 = absolutePosition.X + absoluteSize.X / 2
		local n11 = absolutePosition.Y + absoluteSize.Y / 2 + n

		if v2.IS_MOBILE then
			pcall(function()
				VirtualInputManager:SendTouchEvent(1, 0, n10, n11)
				task.wait(0.05)
				VirtualInputManager:SendTouchEvent(1, 2, n10, n11)
			end)
		else
			pcall(function()
				VirtualInputManager:SendMouseMoveEvent(n10, n11, game)
				task.wait(0.05)
				VirtualInputManager:SendMouseButtonEvent(n10, n11, 0, true, game, 0)
				task.wait(0.05)
				VirtualInputManager:SendMouseButtonEvent(n10, n11, 0, false, game, 0)
			end)
		end
	end

	tbl3.phoneRoot = function()
		local playerGui = localPlayer:FindFirstChild("PlayerGui")
		playerGui = playerGui and playerGui:FindFirstChild("ScreenGui")
		playerGui = playerGui and playerGui:FindFirstChild("Right")
		playerGui = playerGui and playerGui:FindFirstChild("Bottom")
		return playerGui and playerGui:FindFirstChild("Phone")
	end

	local n10 = 0

	tbl3.ensureJobApp = function()
		local v6 = tbl3.phoneRoot()
		if not v6 then
			return false
		end
		local job = v6:FindFirstChild("Job")
		if job and job.Visible then
			return true
		end

		if os.clock() - n10 < 4 then
			return false
		end
		n10 = os.clock()
		local home = v6:FindFirstChild("Home")
		home = home and home:FindFirstChild("Job", true)
		if not (home and home:IsA("GuiButton") and home.Visible) then
			return false
		end
		fn17("phone: opening the jobs app")
		if not tbl3.pressButton(home) then
			fn17("phone: couldn't press the jobs icon")
			return false
		end
		task.wait(1)
		local job2 = v6:FindFirstChild("Job")
		return job2 and job2.Visible and true or false
	end

	tbl3.myMission = function()
		local gameplay = replicatedStorage:FindFirstChild("Gameplay")
		gameplay = gameplay and gameplay:FindFirstChild("Missions")
		gameplay = gameplay and gameplay:FindFirstChild("Active")
		if not gameplay then
			return nil
		end

		for _, child in ipairs(gameplay:GetChildren()) do
			local players = child:FindFirstChild("Players")

			if players then
				for _, child2 in ipairs(players:GetChildren()) do
					local name = child2.Name

					if child2:IsA("ObjectValue") and child2.Value then
						name = child2.Value.Name
					end

					if name == localPlayer.Name then
						return child
					end
				end
			end
		end

		return nil
	end

	tbl3.hasActiveJob = function()
		return tbl3.myMission() ~= nil
	end

	tbl3.offerId = function(arg2)
		local getconnections_ = getconnections or getgenv and getgenv().getconnections
		local getupvalues_ = debug and debug.getupvalues or getupvalues
		if not (getconnections_ and getupvalues_) then
			return nil
		end
		local ok, result = pcall(getconnections_, arg2.MouseButton1Down)
		if not (ok and result and result[1] and result[1].Function) then
			return nil
		end
		local ok2, result2 = pcall(getupvalues_, result[1].Function)
		if not ok2 then
			return nil
		end
		local flag15 = type(result2[3]) == "table" and result2[3][2]
		if type(flag15) ~= "function" then
			return nil
		end
		local ok3, result3 = pcall(getupvalues_, flag15)
		if not ok3 then
			return nil
		end
		local v6 = result3[3]
		if type(v6) ~= "function" then
			return nil
		end
		local ok4, result4 = pcall(getupvalues_, v6)
		if not ok4 then
			return nil
		end
		local v7 = result4[4]
		if type(v7) ~= "function" then
			return nil
		end
		local ok5, result5 = pcall(getupvalues_, v7)
		if not ok5 then
			return nil
		end

		for _, v8 in pairs(result5) do
			if type(v8) == "string" and v8:match("^%d+$") then
				return v8
			end
		end

		return nil
	end

	tbl3.missionCall = function(arg2, arg3)
		local ok, result = pcall(function()
			local v6 = fn11()
			if not v6 then
				return nil
			end
			return v6:InvokeServer("talkToMission", tostring(arg3) .. arg2)
		end)

		if fn20 then
			fn20()
		end

		return ok, result
	end

	tbl3.nameToMission = function(arg2)
		local str3 = tostring(arg2):lower()
		if str3:find("harvest", 1, true) or str3:find("wheat", 1, true) or str3:find("corn", 1, true) or str3:find("canola", 1, true) or str3:find("blueberr", 1, true) then
			return "Crops"
		end

		if str3:find("collect", 1, true) or str3:find("milk", 1, true) or str3:find("wool", 1, true) or str3:find("egg", 1, true) then
			return "Animals"
		end
		return nil
	end

	tbl3.currentMission = function()
		local v6 = tbl3.myMission()
		if not v6 then
			return nil
		end

		if fn29 then
			local v7 = fn29()

			if v7 and v7.jobName then
				local v8 = tbl3.nameToMission(v7.jobName)
				if v8 then
					return v8
				end
			end
		end

		local v7 = tbl3.nameToMission(v6.Name)
		if v7 then
			return v7
		end

		if type(v) == "table" and v.mission then
			return tostring(v.mission)
		end
		return nil
	end

	local str3
	str3 = nil
	local fn35

	do
		local tbl7 = {}
		local tbl8 = { "harvest", "collect", "wheat", "corn", "canola", "blueberr", "milk", "wool", "egg" }

		tbl3.isFarmOffer = function(arg2)
			if type(arg2) ~= "table" then
				return false
			end

			if arg2.location ~= nil then
				return false
			end
			local str4 = tostring(arg2.jobName or ""):lower()
			if str4 == "" or str4 == "taxi order" then
				return false
			end

			if tostring(arg2.infoDescription or ""):lower():find("ingredient") then
				return false
			end

			for _, v6 in ipairs(tbl8) do
				if str4:find(v6, 1, true) then
					return true
				end
			end

			return false
		end

		tbl3.bestFarmOffer = function()
			local v6 = nil
			local v7 = nil
			local n = -1

			local function fn36(arg2)
				if type(arg2) ~= "table" then
					return
				end

				for k, v8 in pairs(arg2) do
					local str4 = tostring(k)
					local flag15 = tbl7[str4]

					if flag15 then
						local v9 = tbl7[str4]
						flag15 = os.clock() - v9 < 25
					end

					local flag16 = tbl3.isFarmOffer(v8) and not flag15

					if flag16 then
						flag16 = (tonumber(v8.reward) or 0) > n
					end

					if flag16 then
						n = tonumber(v8.reward) or 0
						local str5 = tostring(v8.jobName)
						v6 = str4
						v7 = str5
					end
				end
			end

			local ok, result = pcall(function()
				return v2.jobTables and v2.jobTables()
			end)

			if fn20 then
				fn20()
			end

			if not (ok and result) then
				fn17("jobs: job tables not available")
				return nil
			end

			for _, v8 in ipairs(result) do
				fn36(v8)
			end

			return v6, v7, n
		end

		fn35 = function()
			local v6, v7, v8 = tbl3.bestFarmOffer()

			if not v6 then
				local coreJobs = v2.coreJobs and v2.coreJobs()
				local n = 0

				if type(coreJobs) == "table" then
					for k in pairs(coreJobs) do
						n += 1
					end
				end

				local n11 = 0

				for k in pairs(allJobTables()) do
					n11 += 1
				end

				fn17(("jobs: none on offer yet (core.teamJobs=%d entries, %d tables seen)"):format(n, n11))
				return false
			end

			fn15("Picking a job: " .. tostring(v7), "ok")
			local v9 = tostring
			fn17(("jobs: joining %s (%s, $%s)"):format(v6, tostring(v7), v9(v8)))
			tbl7[v6] = os.clock()
			local join, flag15 = tbl3.missionCall("join", v6)
			task.wait(2)
			if tbl3.myMission() then
				fn17("took job " .. v6 .. " (" .. tostring(v7) .. ")")
				return true
			end
			flag15 = join and type(flag15) == "string" and flag15 ~= "" and flag15 or nil
			fn17("jobs: join " .. v6 .. " refused: " .. tostring(flag15 or "no reason given"))

			if flag15 then
				if flag15:lower():find("vehicle", 1, true) then
					str3 = "spawn your tractor"
					fn15("Auto Farmer: spawn your tractor to start", "warn")
				else
					str3 = flag15:lower()
					fn15(flag15, "warn")
				end

				tbl3.fstat(str3)
				return false
			end

			str3 = nil
			return false
		end
	end

	tbl3.cancelActiveJob = function()
		local v6 = tbl3.myMission()
		local id = v6 and v6:FindFirstChild("ID")
		if not id then
			return false
		end
		tbl3.missionCall("leave", id.Value)
		task.wait(2)
		fn17("dropped the job")
		return tbl3.myMission() == nil
	end

	tbl3.findRelocateInteraction = function()
		return workspace:FindFirstChild("Relocate", true)
	end

	tbl3.dropOffPart = function()
		local gameplay = workspace:FindFirstChild("Gameplay")
		gameplay = gameplay and gameplay:FindFirstChild("Entities")
		if not gameplay then
			return nil
		end
		local v6 = fn13()
		local v7 = nil
		local v8 = nil

		for _, child in ipairs(gameplay:GetChildren()) do
			if child.Name == "DropOff" then
				local position = child:IsA("BasePart") and child.Position
				local position2

				if position then
					position2 = position
				else
					position2 = child:IsA("Model") and child.PrimaryPart and child.PrimaryPart.Position
				end

				if position2 then
					local magnitude = v6 and (position2 - v6.Position).Magnitude or 0

					if not v7 or magnitude < v7 then
						v7 = magnitude
						v8 = child
					end
				end
			end
		end

		return v8
	end

	tbl3.draggedItem = function()
		local gameplay = workspace:FindFirstChild("Gameplay")
		gameplay = gameplay and gameplay:FindFirstChild("Entities")
		local v6 = fn13()
		if not (gameplay and v6) then
			return nil
		end
		local v7 = nil
		local v8 = nil

		for _, child in ipairs(gameplay:GetChildren()) do
			if child:IsA("Model") and child.PrimaryPart and child:GetAttribute("DraggedOnce") then
				if child.PrimaryPart:FindFirstChildOfClass("BodyPosition") or child.PrimaryPart:FindFirstChildOfClass("BodyGyro") then
					return child
				end
				local magnitude = (child.PrimaryPart.Position - v6.Position).Magnitude

				if magnitude < 16 and (not v7 or magnitude < v7) then
					v7 = magnitude
					v8 = child
				end
			end
		end

		return v8
	end

	tbl5.deliver = function(arg2)
		local v6 = tbl3.dropOffPart()
		if not v6 then
			return false
		end

		pcall(function()
			for _, child in ipairs(arg2.PrimaryPart:GetChildren()) do
				if child:IsA("BodyPosition") or child:IsA("BodyGyro") or child:IsA("AlignPosition") or child:IsA("AlignOrientation") then
					child:Destroy()
				end
			end
		end)

		local v7 = fn33(v6)
		if not v7 then
			return false
		end
		fn15("Taking it to the drop off", "info")
		tbl3.fstat("dropping it off")
		fn32(v7, 4)
		local character = localPlayer.Character
		local rightHand = character and (character:FindFirstChild("RightHand") or character:FindFirstChild("Right Arm"))
		local v8 = fn13()
		local tbl7 = {}

		for _, v9 in ipairs({ 2, 1.2, 3 }) do
			for i = 0, 7 do
				local n = i * 3.1415926535897931 / 4
				tbl7[#tbl7 + 1] = v7 + Vector3.new(math.cos(n) * v9, 0, math.sin(n) * v9)
			end
		end

		if v8 then
			table.sort(tbl7, function(arg3, arg4)
				return (arg3 - v8.Position).Magnitude < (arg4 - v8.Position).Magnitude
			end)
		end

		local now = os.clock()
		local n = 99
		local n11 = 1

		for i = 1, 80 do
			if arg2.Parent then
				if fn10() then
					if v2.IS_MOBILE then
						local magnitude = rightHand and (rightHand.Position - v7).Magnitude or 99

						if magnitude < n then
							n = magnitude
						end

						if fn19(tbl7[n11]) then
							if magnitude > 2.6 and os.clock() - now > 1.5 then
								n11 = n11 % #tbl7 + 1
								now = os.clock()
							end

							task.wait(0.1)
							continue
						end
					else
						pcall(function()
							arg2.PrimaryPart.Anchored = true
							arg2:PivotTo(CFrame.new(v7 + Vector3.new(0, 1, 0)))
						end)

						task.wait(0.1)
						continue
					end
				end
			end

			break
		end

		local flag15 = arg2.Parent == nil
		fn17(("drop: %s (closest hand distance %.1f)"):format(flag15 and "accepted" or "NOT accepted", n))
		return flag15
	end

	tbl3.relocateOnce = function()
		local v6 = tbl3.findRelocateInteraction()
		if not (v6 and v6:IsA("ProximityPrompt")) then
			return false
		end
		local parent = v6.Parent
		local v7 = fn33(parent)
		if not v7 then
			return false
		end
		fn32(v7, 8)
		local now = os.clock()

		while true do
			if parent and parent.Parent and os.clock() - now < 8 then
				local v8 = fn13()
				local v9 = fn33(parent)

				if v8 and v9 then
					if not ((v8.Position - v9).Magnitude <= 6) then
						if fn19(v9) then
							task.wait(0.2)
							continue
						end
					end
				end
			end

			break
		end

		local v8 = fn13()
		local v9 = fn33(parent)
		if not (v8 and v9) then
			return false
		end

		if (v6.MaxActivationDistance or 10) < (v8.Position - v9).Magnitude then
			return false
		end

		pcall(function()
			v6.HoldDuration = 0.25
		end)

		if v2.IS_MOBILE then
			pcall(function()
				v6:InputHoldBegin()
			end)
		else
			pcall(function()
				VirtualInputManager:SendKeyEvent(true, v6.KeyboardKeyCode, false, game)
			end)
		end

		local now2 = os.clock()

		while os.clock() - now2 < 0.55 do
			if fn19(fn33(parent)) then
				task.wait(0.08)
				continue
			end
			break
		end

		if v2.IS_MOBILE then
			pcall(function()
				v6:InputHoldEnd()
			end)
		else
			pcall(function()
				VirtualInputManager:SendKeyEvent(false, v6.KeyboardKeyCode, false, game)
			end)
		end

		task.wait(0.35)
		local v10 = tbl3.draggedItem()
		if not v10 then
			return false
		end
		return tbl5.deliver(v10)
	end

	local fn36
	local n11 = 0

	fn36 = function()
		fn15("Doing the animal job", "ok")

		local function fn37()
			local v6 = tbl3.findRelocateInteraction()
			v6 = v6 and fn33(v6.Parent)
			if v6 then
				return v6
			end
			local v7 = fn29()
			return v7 and typeof(v7.location) == "Vector3" and v7.location or nil
		end

		local v6 = fn37()

		if v6 then
			local v7 = fn13()
			local magnitude = v7 and (v7.Position - v6).Magnitude or 0

			if magnitude > 80 then
				fn17(("animals: target is %.0f studs away, heading over"):format(magnitude))
				tbl3.fstat("heading to the animals")
				fn32(v6, 25)
			end
		end

		if fn26() then
			fn17("animals: getting out of the vehicle")
			fn27()
		end

		local n = 0
		local v7 = nil
		local n12 = 0
		local n13 = 0
		local n14 = 0

		while flag9 and tbl3.onFarmerTeam() and n < 60 do
			local v8 = tbl3.findRelocateInteraction()

			if not v8 then
				fn17("animals: prompt gone, job done")
				n11 = 0
				break
			end

			local objectText = v8.ObjectText
			v7 = v7 or objectText

			if not v8.Enabled then
				local n15 = n12 + 1
				tbl3.fstat("waiting on the animal")

				if n15 == 1 then
					fn17("animals: prompt disabled by the game (" .. tostring(objectText) .. ")")
				end

				if n15 == 2 and n13 < 3 then
					local v9 = tbl3.draggedItem()

					if v9 then
						n13 += 1
						fn17("animals: still carrying the last item, delivering it (" .. n13 .. ")")

						if tbl5.deliver(v9) then
							n12 = 0
						else
							n12 = n15
						end
					else
						n12 = n15
					end
				else
					n12 = n15
				end

				if n12 >= 8 then
					fn17("animals: prompt stayed disabled, giving up on this job")
					break
				end
				task.wait(1)
				continue
			end

			if tbl3.relocateOnce() then
				local v9 = tbl3.findRelocateInteraction()
				local objectText2 = v9 and v9.ObjectText or objectText
				local flag15 = objectText2 and objectText2 ~= ""
				n14 = 0

				if flag15 then
					fn15("Collected " .. tostring(objectText2), "info")
				end
			else
				n14 += 1
				fn17("animals: pickup failed x" .. n14 .. " at " .. tostring(objectText))
				if n14 >= 6 then
					fn15("Could not reach the animals, stopping this one", "warn")
					break
				end
			end

			n += 1
			task.wait(0.4 + math.random() * 0.4)
			n12 = 0
		end

		local v8 = tbl3.findRelocateInteraction()

		if v8 and v7 and (v8 and v8.ObjectText or nil) == v7 then
			n11 += 1
			fn17("animals: no progress, strike " .. n11)

			if n11 >= 2 then
				n11 = 0
				fn15("This one is not working, taking another job", "warn")
				tbl3.cancelActiveJob()
				v = nil
				task.wait(2)
			end
		else
			n11 = 0
		end
	end

	local fn37

	fn37 = function()
		local v6 = tbl3.algorithms()
		local getVehicleInfo = v6 and v6.getVehicleInfo
		if not (getVehicleInfo and type(getVehicleInfo.inVehicle) == "function") then
			return nil
		end
		local ok, result = pcall(getVehicleInfo.inVehicle, localPlayer)

		if fn20 then
			fn20()
		end

		return ok and typeof(result) == "Instance" and result or nil
	end

	tbl3.isTractor = function(arg2)
		local flag15 = arg2 ~= nil
		local flag16

		if flag15 then
			flag16 = tostring(arg2.Name):lower():find("tractor", 1, true) ~= nil
		else
			flag16 = flag15
		end

		return flag16
	end

	fn20 = function()
		local setThreadIdentity = setthreadidentity or setidentity or syn and syn.set_thread_identity or setthreadcontext

		if setThreadIdentity then
			pcall(setThreadIdentity, 8)
		end
	end

	tbl3.takenByOthers = function()
		local tbl7 = {}
		local getVehicleInfo = tbl3.algorithms()
		getVehicleInfo = getVehicleInfo and getVehicleInfo.getVehicleInfo
		local players = v2.Players
		if not (getVehicleInfo and type(getVehicleInfo.inVehicle) == "function" and players) then
			return tbl7
		end

		for _, player in ipairs(players:GetPlayers()) do
			if player ~= localPlayer then
				local ok, result = pcall(getVehicleInfo.inVehicle, player)

				if fn20 then
					fn20()
				end

				if ok and typeof(result) == "Instance" then
					tbl7[result] = true
				end
			end
		end

		return tbl7
	end

	tbl3.vehOwner = function(arg2)
		if not arg2 then
			return nil
		end
		local getVehicleInfo = tbl3.algorithms()
		getVehicleInfo = getVehicleInfo and getVehicleInfo.getVehicleInfo

		if getVehicleInfo then
			for _, v6 in ipairs({ "getVehicleOwner", "getOwner", "getBelongingPlayer", "getVehiclePlayer" }) do
				local v7 = getVehicleInfo[v6]

				if type(v7) == "function" then
					local ok, result = pcall(v7, arg2)
					if ok and result ~= nil then
						return result
					end
				end
			end
		end

		local players = v2.Players

		local function fn38(arg3)
			if typeof(arg3) == "Instance" then
				return arg3
			end

			if type(arg3) == "string" and arg3 ~= "" and players then
				return players:FindFirstChild(arg3) or arg3
			end

			if type(arg3) == "number" and arg3 > 0 and players then
				return players:GetPlayerByUserId(arg3) or arg3
			end
			return nil
		end

		local config = arg2:FindFirstChild("Config")

		for _, v6 in ipairs({ "Owner", "Player", "Driver", "BelongsTo" }) do
			local v7 = config and config:FindFirstChild(v6) or arg2:FindFirstChild(v6)

			if v7 and v7:IsA("ValueBase") then
				local v8 = fn38(v7.Value)
				if v8 then
					return v8
				end
			end

			local attribute = arg2:GetAttribute(v6)
			if attribute == nil then
				continue
			end
			local v8 = fn38(attribute)
			if v8 then
				return v8
			end
		end

		return nil
	end

	local fn38

	do
		local v6 = nil
		local n = 0

		fn38 = function(arg2)
			if tbl4 and tbl4.vehicle then
				return tbl4.vehicle
			end
			local v7 = fn37()
			if tbl3.isTractor(v7) then
				return v7
			end

			if arg2 then
				return v6 and v6.Parent and v6 or nil
			end

			if v6 and v6.Parent and os.clock() - n < 10 then
				return v6
			end
			local result = nil

			if v2.belongingVehicle then
				local ok
				ok, result = pcall(v2.belongingVehicle)
				fn20()
				local v8 = nil

				if not ok then
					result = v8
				end
			end

			if tbl3.isTractor(result) then
				local now = os.clock()
				v6 = result
				n = now
				return result
			end

			local gameplay = workspace:FindFirstChild("Gameplay")
			gameplay = gameplay and gameplay:FindFirstChild("Vehicles")
			if not gameplay then
				return nil
			end
			local v8 = tbl3.takenByOthers()
			local v9 = fn13()
			local v10 = nil
			local v11 = nil

			for _, child in ipairs(gameplay:GetChildren()) do
				if tbl3.isTractor(child) and not v8[child] then
					if tbl3.vehOwner(child) == localPlayer then
						local chassis = child:FindFirstChild("_Chassis")
						local magnitude = chassis and v9 and (chassis.Position - v9.Position).Magnitude or 1e9

						if not v10 or magnitude < v10 then
							v10 = magnitude
							v11 = child
						end
					end
				end
			end

			local now = os.clock()
			v6 = v11
			n = now
			return v11
		end
	end

	fn26 = function()
		if tbl4 then
			return fn37() ~= nil
		end
		return tbl3.isTractor(fn37())
	end

	tbl3.tractorSeat = function(arg2)
		if not arg2 then
			return nil
		end

		if v2.driverSeatOf then
			local v6 = v2.driverSeatOf(arg2)
			if v6 then
				return v6
			end
		end

		return arg2:FindFirstChild("DriveSeat")
	end

	fn27 = function()
		if not fn26() then
			return true
		end

		local function fn39(arg2)
			if not (v2.IS_MOBILE and v2.touchHold and v2.mobileVehicleButtons) then
				return nil
			end
			local v6 = v2.mobileVehicleButtons()
			return v6 and v6[arg2]
		end

		local function fn40(arg2)
			local brake = fn39("brake")
			if brake then
				v2.touchHold(brake, arg2)
				return
			end

			if v2.markSyntheticKey then
				v2.markSyntheticKey(Enum.KeyCode.S)
			end

			pcall(function()
				VirtualInputManager:SendKeyEvent(arg2, Enum.KeyCode.S, false, game)
			end)
		end

		local chassis = fn37()

		if chassis then
			chassis = chassis:FindFirstChild("_Chassis") or chassis:FindFirstChildWhichIsA("BasePart")
		end

		if chassis then
			local now = os.clock()
			local exitTo = nil

			while true do
				if not (os.clock() - now < 1.5) then
					exitTo = 1
					break
				else
					if fn26() then
						if chassis.AssemblyLinearVelocity.Magnitude < 6 then
							exitTo = 1
							break
						else
							fn40(true)
							task.wait(0.08)
							continue
						end
					end

					break
				end
			end

			if exitTo ~= 1 then
				fn40(false)
				return true
			end
			fn40(false)
		end

		local function fn41()
			local exit = fn39("exit")
			if exit then
				return exit
			end

			if not v2.IS_MOBILE then
				return nil
			end
			local playerGui = localPlayer:FindFirstChild("PlayerGui")
			local screenGui = playerGui and playerGui:FindFirstChild("ScreenGui")
			if not screenGui then
				return nil
			end
			local v6 = nil

			pcall(function()
				for _, descendant in ipairs(screenGui:GetDescendants()) do
					if (descendant:IsA("TextButton") or descendant:IsA("ImageButton")) and descendant.Visible then
						local str4 = tostring(descendant.Name):lower()
						local isTextButton = descendant:IsA("TextButton")
						local str5

						if isTextButton then
							str5 = tostring(descendant.Text):lower()
						else
							str5 = isTextButton
						end

						str5 = str5 or ""
						if str4:find("exit") or str4:find("leave") or str4:find("getout") or str5:find("exit") or str5 == "leave" then
							v6 = descendant
							break
						end
					end
				end
			end)

			return v6
		end

		local function fn42()
			local v6 = fn41()

			if v6 and v2.touchHold then
				pcall(function()
					v2.touchHold(v6, true)
				end)

				task.wait(0.12)

				pcall(function()
					v2.touchHold(v6, false)
				end)

				return true
			end

			return false
		end

		local function fn43()
			if v2._gameVehicle then
				return v2._gameVehicle
			end

			local ok, gameVehicle = pcall(function()
				local moduleLoader = replicatedStorage:WaitForChild("Modules", 10):WaitForChild("ModuleLoader", 10)
				local vehicle = localPlayer:WaitForChild("PlayerScripts", 10):WaitForChild("Framework", 10):WaitForChild("Vehicle", 10)

				return atLowIdentity(function()
					return require(moduleLoader).assign(vehicle)
				end)
			end)

			if ok and type(gameVehicle) == "table" and type(gameVehicle.enterVehicle) == "function" then
				v2._gameVehicle = gameVehicle
			end

			return v2._gameVehicle
		end

		local v6 = fn43()

		if v6 then
			pcall(function()
				atLowIdentity(function()
					v6.enterVehicle(false, { playerInput = true })
				end)
			end)

			for i = 1, 14 do
				if not fn26() then
					return true
				end
				task.wait(0.15)
			end

			fn17("exit: game enterVehicle(false) did not unseat, falling back to the button")
		end

		local v7 = fn42()

		if not v7 then
			pcall(function()
				VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
				task.wait(0.12)
				VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F, false, game)
			end)

			if v2.IS_MOBILE and v2.restoreTouch then
				pcall(v2.restoreTouch)
			end
		end

		for i = 1, 20 do
			if not fn26() then
				return true
			end

			if v7 and i % 4 == 0 then
				fn42()
			end

			task.wait(0.15)
		end

		return not fn26()
	end

	tbl5.toolSpot = function(arg2, arg3, arg4)
		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude
		raycastParams.FilterDescendantsInstances = { localPlayer.Character }
		local raycastParams2 = RaycastParams.new()
		raycastParams2.FilterType = Enum.RaycastFilterType.Exclude
		local filterDescendantsInstances = { localPlayer.Character }

		if arg3 then
			filterDescendantsInstances[#filterDescendantsInstances + 1] = arg3
		end

		raycastParams2.FilterDescendantsInstances = filterDescendantsInstances
		local n = math.max(3, (arg4 or 10) - 3)
		local v6 = fn13()
		local position = v6 and v6.Position or arg2
		local v7 = nil
		local v8 = nil

		for _, v9 in ipairs({ 3.5, 5, 6.5 }) do
			for i = 0, 15 do
				local n12 = i * 3.1415926535897931 / 8
				local n13 = arg2.X + math.cos(n12) * v9
				local n14 = arg2.Z + math.sin(n12) * v9
				local hit = workspace:Raycast(Vector3.new(n13, arg2.Y + 4, n14), Vector3.new(0, -30, 0), raycastParams)
				local flag15 = hit and hit.Material ~= Enum.Material.Water

				if flag15 then
					flag15 = not (arg3 and hit.Instance:IsDescendantOf(arg3))
				end

				flag15 = flag15 and hit.Position.Y <= arg2.Y + 1 and hit.Position.Y >= arg2.Y - 8

				if flag15 then
					local y = hit.Position.Y
					local vector = Vector3.new(n13, y + 3, n14)

					if workspace:Raycast(Vector3.new(n13, y + 0.5, n14), Vector3.new(0, 6, 0), raycastParams) then
						flag15 = false
					end

					local flag16

					if flag15 then
						for i2 = 0, 3 do
							local n15 = Vector3.new(math.cos(i2 * 3.1415926535897931 / 2), 0, math.sin(i2 * 3.1415926535897931 / 2)) * 1.6
							if workspace:Raycast(Vector3.new(n13, y + 2, n14), n15, raycastParams) or workspace:Raycast(Vector3.new(n13, y + 4.5, n14), n15, raycastParams) then
								flag15 = false
								break
							end
						end

						flag16 = flag15
					else
						flag16 = flag15
					end

					if flag16 and (vector - arg2).Magnitude > n then
						flag16 = false
					end

					if not (flag16 and workspace:Raycast(vector, arg2 - vector, raycastParams2)) then
						if flag16 then
							local magnitude = (vector - position).Magnitude

							if not v7 or magnitude < v7 then
								v7 = magnitude
								v8 = vector
							end
						end
					end
				end
			end

			if not v8 then
				continue
			end
			break
		end

		return v8
	end

	tbl5.openSides = function(arg2, arg3, arg4, arg5)
		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude
		local filterDescendantsInstances = { localPlayer.Character }

		if arg5 then
			filterDescendantsInstances[#filterDescendantsInstances + 1] = arg5
		end

		raycastParams.FilterDescendantsInstances = filterDescendantsInstances
		local position = fn13()
		position = position and position.Position or arg2
		local tbl7 = {}

		for i = 0, 15 do
			local n = i * 3.1415926535897931 / 8
			local sin = math.sin
			local vector = Vector3.new(math.cos(n), 0, sin(n))

			if not workspace:Raycast(arg2 + vector * 2 + Vector3.new(0, arg4 or 2.5, 0), vector * (arg3 - 2), raycastParams) then
				local n12 = arg2 + vector * arg3
				tbl7[#tbl7 + 1] = { dir = vector, point = n12, d = (n12 - position).Magnitude }
			end
		end

		table.sort(tbl7, function(arg6, arg7)
			return arg6.d < arg7.d
		end)

		return tbl7
	end

	tbl5.getDown = function(arg2, arg3)
		local v6 = fn14()
		local v7 = fn13()
		if not (v6 and v7) then
			return
		end

		if v7.Position.Y - arg2 < 5 then
			return
		end
		fn17(("walk: %.0f studs above the ground, climbing down first"):format(v7.Position.Y - arg2))
		local now = os.clock()
		local n = 0

		while os.clock() - now < 8 do
			local v8 = fn13()
			if not v8 then
				return
			end

			if v8.Position.Y - arg2 < 4 then
				fn17("walk: down")
				return
			end
			local flag15 = arg3 and n == 0
			local unit = nil

			if flag15 then
				local vector = Vector3.new(arg3.X - v8.Position.X, 0, arg3.Z - v8.Position.Z)
				unit = vector.Magnitude > 1 and vector.Unit or nil
			end

			if not unit then
				local n12 = n * 3.1415926535897931 / 4
				local sin = math.sin
				unit = Vector3.new(math.cos(n12), 0, sin(n12))
			end

			v6:MoveTo(v8.Position + unit * 7)
			task.wait(0.35)
			v6.Jump = true
			task.wait(0.9)
			n += 1
		end
	end

	local fn39

	fn39 = function()
		if fn26() then
			return true
		end
		local v6 = fn38()
		if not v6 then
			fn15("Auto Farmer: spawn your tractor to start", "info")
			return false
		end
		local v7 = tbl3.tractorSeat(v6)
		if not v7 then
			return false
		end

		local function fn40()
			for _, descendant in ipairs(v6:GetDescendants()) do
				if descendant:IsA("ProximityPrompt") and (descendant.Name == "EnterDriver" or descendant.Name == "Enter") then
					return descendant
				end
			end

			return nil
		end

		local function fn41(arg2)
			arg2 = arg2 and arg2.Parent
			if arg2 and arg2:IsA("Attachment") then
				return arg2.WorldPosition
			end

			if arg2 and arg2:IsA("BasePart") then
				return arg2.Position
			end
			return v7.Position
		end

		if flag12 then
			for i = 1, 3 do
				if fn26() then
					fn20()
					return true
				end

				if v2.enterSeat and v2.enterSeat(v7) then
					fn20()
					return true
				end
				fn20()
				task.wait(0.3)
			end

			return fn26()
		end

		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude
		raycastParams.FilterDescendantsInstances = { v6, localPlayer.Character }
		local hit = workspace:Raycast(v7.Position + Vector3.new(0, 5, 0), Vector3.new(0, -60, 0), raycastParams)

		if hit then
			tbl5.getDown(hit.Position.Y, v7.Position)
		end

		local ok, result = pcall(function()
			for i = 1, 5 do
				if not fn10() then
					return false
				end

				if fn26() then
					return true
				end
				local maxActivationDistance = fn40()
				local position = maxActivationDistance and fn41(maxActivationDistance) or v7.Position
				maxActivationDistance = maxActivationDistance and maxActivationDistance.MaxActivationDistance or 10
				local v8 = fn13()
				local magnitude = v8 and position and (v8.Position - position).Magnitude or 999
				local position2 = v6:GetPivot().Position
				local vector = Vector3.new(position.X - position2.X, 0, position.Z - position2.Z)
				local unit = vector.Magnitude > 0.5 and vector.Unit or Vector3.new(1, 0, 0)
				local v9 = tbl5.openSides(position, 7, 2.5, v6)
				local point = v9[1] and v9[1].point or position + unit * 5

				if magnitude > 15 then
					fn32(point, 3)
				end

				local v10 = fn13()

				if v10 and (v10.Position - position).Magnitude > maxActivationDistance - 1 then
					local v11 = fn14()
					local now = os.clock()

					while true do
						if v11 and os.clock() - now < 3 then
							local v12 = fn13()

							if v12 then
								if not ((v12.Position - position).Magnitude <= maxActivationDistance - 1) then
									v11:MoveTo(position)
									task.wait(0.1)
									continue
								end
							end
						end

						break
					end

					local v12 = fn13()

					if v11 and v12 and (v12.Position - position).Magnitude > maxActivationDistance - 1 then
						v11:MoveTo(point)
						task.wait(1.2)
						v11:MoveTo(position)
						task.wait(1)
					end
				end

				fn20()
				local v11 = fn40()
				local v12 = fn13()
				local magnitude2 = v12 and v11 and (v12.Position - fn41(v11)).Magnitude or 999

				if v11 and magnitude2 > maxActivationDistance and magnitude2 < 20 then
					local v13 = fn14()
					local now = os.clock()

					while true do
						if v13 and os.clock() - now < 2.5 then
							local v14 = fn13()

							if v14 then
								local v15 = fn41(v11)
								magnitude2 = (v14.Position - v15).Magnitude

								if not (magnitude2 <= maxActivationDistance - 0.5) then
									v13:MoveTo(v15)
									task.wait(0.1)
									continue
								end
							end
						end

						break
					end
				end

				local flag15

				if v11 then
					flag15 = magnitude2 <= (v11.MaxActivationDistance or 10)
				else
					flag15 = v11
				end

				if flag15 then
					fn34(v11, (v11.HoldDuration or 0) + 0.6)

					for i2 = 1, 12 do
						if fn26() then
							return true
						end
						task.wait(0.1)
					end
				elseif not v11 then
					if v2.enterSeat and v2.enterSeat(v7) then
						return true
					end
				end

				task.wait(0.3)
			end

			if not fn26() and v2.enterSeat then
				local v8 = fn13()

				if v8 and (v8.Position - v7.Position).Magnitude < 20 then
					fn17("enter: prompt unreachable on foot, seat entry as a last resort")
					if v2.enterSeat(v7) then
						fn20()
						return true
					end
				end
			end

			return fn26()
		end)

		if not ok then
			fn17("enter: walk-in errored: " .. tostring(result))
			return fn26()
		end
		return result
	end

	local tbl7
	tbl7 = {}
	local tbl8, tbl9, fn40
	local tbl10 = { W = "gas", S = "brake", A = "left", D = "right" }
	tbl8 = nil
	tbl9 = nil

	fn40 = function(arg2, arg3)
		if arg3 and not fn10() then
			arg3 = false
		end

		if tbl7[arg2] == arg3 then
			return
		end
		tbl7[arg2] = arg3

		if arg2 == "W" or arg2 == "S" then
			local v6 = state
			local autoThrottle = tbl7.W and not tbl7.S and 1

			if not autoThrottle then
				autoThrottle = tbl7.S and not tbl7.W and -1 or 0
			end

			v6.autoThrottle = autoThrottle
		end

		if v2.IS_MOBILE then
			local flag15 = state.controllerActive and state.activeVehicle ~= nil

			if arg2 == "W" or arg2 == "S" then
				flag15 = flag15 and not tbl3.isTractor(state.activeVehicle)
			else
				local flag16 = arg2 == "A" or arg2 == "D"
				local flag17 = false

				if flag16 then
					flag15 = flag15 and tbl8 and tbl8.fn ~= nil
				else
					flag15 = flag17
				end
			end

			if not flag15 and v2.touchHold and v2.mobileVehicleButtons then
				local v6 = v2.mobileVehicleButtons()
				local v7 = v6 and v6[tbl10[arg2]]

				if v7 then
					v2.touchHold(v7, arg3)
				end
			end

			return
		end

		if (arg2 == "A" or arg2 == "D") and tbl8 and tbl8.conn and tbl9 and tbl9.v then
			if arg3 then
				tbl8.force = arg2 == "A" and 1 or -1
			elseif tbl8.force == (arg2 == "A" and 1 or -1) then
				tbl8.force = nil
			end

			return
		end

		if v2.markSyntheticKey then
			v2.markSyntheticKey(Enum.KeyCode[arg2])
		end

		pcall(function()
			VirtualInputManager:SendKeyEvent(arg3, Enum.KeyCode[arg2], false, game)
		end)
	end

	do
		local flag15 = false
		tbl9 = { v = nil, on = nil, sent = 0, sentAt = 0 }

		local function fn41(on)
			if tbl9.on == on and tbl9.v and tbl9.v.Parent then
				return tbl9.v
			end
			local config = on and on.Parent and on.Parent:FindFirstChild("Config")
			config = config and config:FindFirstChild("Steer")
			tbl9.v = config and config:IsA("IntValue") and config or nil

			if tbl9.on ~= on then
				local v6 = tbl9
				tbl9.on = on
				v6.sent = 0
			end

			return tbl9.v
		end

		local function fn42(arg2, arg3, arg4)
			local v6 = fn41(arg2)
			if not v6 then
				return false
			end
			local sent = -arg3
			local now = os.clock()

			if (tbl9.sent ~= sent or v6.Value ~= sent) and (arg4 or now - tbl9.sentAt >= 0.2) then
				local v7 = tbl9
				tbl9.sent = sent
				v7.sentAt = now

				pcall(function()
					game:GetService("ReplicatedStorage").Remote.PlayerEvent:FireServer("vehicle", "steer", sent)
				end)
			end

			if v6.Value ~= sent then
				v6.Value = sent
			end

			return true
		end

		tbl8 = {
			want = 0,
			dir = 0,
			find = function(arg2)
				local getconnections_ = getconnections or getgenv and getgenv().getconnections
				local getupvalues_ = debug and debug.getupvalues or getupvalues

				if tbl8.fn and tbl8.on == arg2 then
					local ok, result = pcall(getupvalues_, tbl8.fn)
					ok = ok and type(result) == "table" and type(result[49]) == "number" and type(result[50]) == "number" and result[49] ~= result[50]
					local flag16 = false

					if ok then
						flag16 = true
					end

					local flag17 = not flag16 and getconnections_

					if flag17 then
						flag17 = os.clock() - (tbl8.chkAt or 0) > 3
					end

					if flag17 then
						tbl8.chkAt = os.clock()
						local flag18 = false

						pcall(function()
							for _, v6 in ipairs(getconnections_(RunService.Heartbeat)) do
								if v6.Function == tbl8.fn then
									flag18 = true
									break
								end
							end
						end)

						flag16 = not flag18
					end

					if not flag16 then
						return true
					end
					fn17("steer: driver closure went stale (re-entered), re-finding")
				end

				local v6 = tbl8
				tbl8.fn = nil
				v6.on = nil
				if not (getconnections_ and getupvalues_ and debug and debug.setupvalue and arg2) then
					return false
				end

				pcall(function()
					for _, v7 in ipairs(getconnections_(RunService.Heartbeat)) do
						local function_ = v7.Function
						if type(function_) ~= "function" then
							continue
						end
						local ok, result = pcall(getupvalues_, function_)

						if ok and type(result) == "table" and result[1] == arg2 and type(result[9]) == "number" and type(result[12]) == "number" and type(result[13]) == "number" and result[12] >= -1 and result[12] <= 1 then
							local v8 = tbl8
							local v9 = arg2
							tbl8.fn = function_
							v8.on = v9
							return
						end
					end
				end)

				return tbl8.fn ~= nil
			end,
			off = function()
				if tbl8.conn then
					tbl8.conn:Disconnect()
					tbl8.conn = nil
				end

				if tbl8.fn then
					pcall(debug.setupvalue, tbl8.fn, 12, 0)
					pcall(debug.setupvalue, tbl8.fn, 9, 0)
				end

				if tbl8.on and not fn42(tbl8.on, 0, true) and tbl8.dir ~= 0 then
					fn40(tbl8.dir == 1 and "A" or "D", false)
				end

				local v6 = tbl8
				local v7 = tbl8
				local v8 = tbl8
				tbl8.want = 0
				v6.dir = 0
				v7.lastW = 0
				v8.force = nil
			end,
			set = function(arg2, arg3)
				if not tbl8.find(arg2) then
					return false
				end
				tbl8.want = math.clamp(arg3, -1, 1)

				if not tbl8.conn then
					tbl8.conn = RunService.Heartbeat:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
				function()if not(l[1][4][l[1][7]].fn and l[1][4][l[1][7]].on and l[1][4][l[1][7]].on.Parent)then l[1][4][l[1][7]].off();return;end;local q=l[1][4][l[1][7]].force or l[1][4][l[1][7]].want;pcall(debug.setupvalue,l[1][4][l[1][7]].fn,12,-q);pcall(debug.setupvalue,l[1][4][l[1][7]].fn,13,1);local X=os.clock();local C;if not l[1][4][l[1][7]].force then local n=l[1][4][l[1][7]].on;local N=-n.CFrame:VectorToObjectSpace(n.AssemblyLinearVelocity).Z;if N>6 then local j=n.AssemblyAngularVelocity.Y/N*19;C=if j*q>0 and math.abs(j)>math.abs(q)then j else q;else C=q;end;else C=q;end;local q,n=l[1][4][l[1][7]].dir;if l[1][4][l[1][7]].force then n=(q==0 or q==l[1][4][l[1][7]].force)and l[1][4][l[1][7]].force or 0;n=if n~=0 and q==0 and X<(l[1][4][l[1][7]].endedAt or 0)+0.12 then 0 else n;else n=if q==0 then if(if C>0.12 then 1 else if C<-0.12 then-1 else q)~=0 and X<(l[1][4][l[1][7]].endedAt or 0)+0.12 then 0 else if C>0.12 then 1 else if C<-0.12 then-1 else q else if X-(l[1][4][l[1][7]].dirAt or 0)>=0.5 then if math.abs(C)<0.05 then 0 else if C>0.12 and q==-1 or C<-0.12 and q==1 then 0 else q else q;end;n=if l[2][4][l[2][7]]then 0 else n;if n~=q then if q~=0 then l[1][4][l[1][7]].endedAt=X;end;if n~=0 then l[1][4][l[1][7]].dirAt=X;end;l[1][4][l[1][7]].dir=n;end;if not l[3][4][l[3][7]](l[1][4][l[1][7]].on,n)then l[4][4][l[4][7]]("A",n==1);l[4][4][l[4][7]]("D",n==-1);end;end))
				end

				return true
			end,
		}
	end

	do
		local tbl11 = nil
		local v6 = nil

		local function fn41(arg2)
			if tbl11 and v6 == arg2 then
				return tbl11
			end
			tbl11 = {}
			v6 = arg2
			local model = arg2:FindFirstAncestorOfClass("Model") or arg2.Parent

			if model then
				for _, descendant in ipairs(model:GetDescendants()) do
					if descendant:IsA("BasePart") and descendant:FindFirstChild("WheelWeld") then
						tbl11[#tbl11 + 1] = {
							weld = descendant.WheelWeld,
							size = tonumber(descendant:GetAttribute("WheelSize")) or 2,
							front = descendant.Name:find("Front") ~= nil,
						}
					end
				end
			end

			return tbl11
		end
	end

	track(RunService.Heartbeat:Connect(v2.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(q)local X=l[1].activeChassis;if not((l[1].autoCap~=nil or l[1].autoYaw~=nil)and X and X.Parent)then if l[2][4][l[2][7]]then l[2][4][l[2][7]],l[3][4][l[3][7]],l[4][4][l[4][7]]=false,0,false;for C,C in ipairs(l[5][4][l[5][7]]or{})do if C.weld.Parent then pcall(function()C.weld.C0=CFrame.Angles(l[6][4][l[6][7]]/C.size,0,0);end);end;end;end;return;end;local C=false;if l[7][4][l[7][7]].fn and l[7][4][l[7][7]].on==X then local n,N=pcall(debug and debug.getupvalues or getupvalues,l[7][4][l[7][7]].fn);C=if n and type(N)=="table"and type(N[8])=="number"and N[8]>0.5 then true else C;end;C=if not l[8].IS_MOBILE then true else C;if not C then local n=X.Parent and(X.Parent:FindFirstChild("Config"));local N=n and(n:FindFirstChild("On"));C=if N and N.Value==true then true else C;end;if if not C and l[8].IS_MOBILE and l[9].W then if not(l[1].controllerActive and l[1].activeVehicle~=nil)or(l[10].isTractor(l[1].activeVehicle))then true else C else C then if l[2][4][l[2][7]]then l[2][4][l[2][7]],l[3][4][l[3][7]],l[4][4][l[4][7]]=false,0,false;end;return;end;l[2][4][l[2][7]],l[4][4][l[4][7]]=true,true;C=X.AssemblyLinearVelocity.Magnitude;l[6][4][l[6][7]]+=(if(l[1].autoThrottle or 0)<0 then-C else C)*(q or 0.016666666666666666);local q=l[1].autoYaw or 0;C=-math.clamp((if math.abs(q)<0.04 then 0 else q)/0.6,-1,1)*l[11];l[3][4][l[3][7]]+=(C-l[3][4][l[3][7]])*0.3;for q,q in ipairs(l[12][4][l[12][7]](X))do if q.weld.Parent then local X=CFrame.Angles(l[6][4][l[6][7]]/q.size,0,0);if q.front then X*=CFrame.Angles(0,l[3][4][l[3][7]],0);end;pcall(function()q.weld.C0=X;end);end;end;end)))

	local fn41

	fn41 = function()
		state.autoCap = nil
		state.autoYaw = nil
		tbl8.off()

		for _, v6 in ipairs({ "W", "A", "S", "D" }) do
			fn40(v6, false)
		end

		state.autoThrottle = 0

		if v2.IS_MOBILE and v2.releaseAllTouch then
			pcall(v2.releaseAllTouch)
		end
	end

	local fn42

	fn42 = function()
		return state.controllerActive and state.activeVehicle ~= nil and (v2.IS_MOBILE or not tbl3.isTractor(state.activeVehicle))
	end

	local fn43

	fn43 = function()
		n6 += 1

		if tbl5.farmCtrl then
			tbl5.returnCtrl(true)
			tbl5.farmCtrl = false
		end

		if v2.hudHide then
			pcall(v2.hudHide)
		end

		if fn22 then
			fn22()
		end

		fn41()

		pcall(function()
			local v6 = fn14()
			local v7 = fn13()

			if v6 and v7 then
				v6:MoveTo(v7.Position)
			end
		end)
	end

	local fn44

	fn44 = function()
		local v6 = fn38()
		return v6 and v6:FindFirstChild("_Chassis")
	end

	local fn45

	fn45 = function()
		local now = os.clock()

		while os.clock() - now < 2.5 do
			local v6 = fn44()

			if v6 then
				if not (v6.AssemblyLinearVelocity.Magnitude < 6) then
					fn40("W", false)
					fn40("A", false)
					fn40("D", false)
					fn40("S", true)
					task.wait(0.06)
					continue
				end
			end

			break
		end

		fn41()
	end

	local fn46

	fn46 = function(arg2)
		if not fn26() then
			return
		end

		if not fn44() then
			fn40("S", false)
			return
		end
		fn40("W", false)
		fn40("A", false)
		fn40("D", false)
		local now = os.clock()
		arg2 = arg2 or 0.7

		while os.clock() - now < arg2 do
			if fn10() then
				local v6 = fn44()

				if v6 then
					if not (v6.AssemblyLinearVelocity.Magnitude < 4) then
						fn40("S", true)
						task.wait(0.08)
						continue
					end
				end
			end

			break
		end

		fn40("S", false)
	end

	local tbl11
	tbl11 = { DRIVE = 46, RMIN = 20, WMAX = 1.3, R_MIN = 49, R_SLOW = 35 }
	local fn47, fn48, fn49, fn50, n, tbl12, fn51, tbl13, fn52, n12
	local fn53, fn54

	do
		local tbl14 = { c = nil, at = 0 }
		local v6 = nil
		local tbl15

		tbl15 = {
			list = {},
			at = 0,
			models = function(arg2)
				local at = tbl15.at
				if os.clock() - at < 20 then
					return tbl15.list
				end
				tbl15.at = os.clock()
				local list = {}

				if arg2 then
					arg2 = arg2:FindFirstChild("_Chassis") or arg2.PrimaryPart
				end

				arg2 = arg2 and arg2.Position

				if arg2 then
					for _, descendant in ipairs(workspace:GetDescendants()) do
						if descendant:IsA("Model") and descendant.Name:lower():find("fence", 1, true) then
							local position = descendant:GetPivot().Position

							if Vector3.new(position.X - arg2.X, 0, position.Z - arg2.Z).Magnitude < 900 then
								list[#list + 1] = descendant
							end
						end
					end
				end

				tbl15.list = list
				return list
			end,
		}

		fn47 = function()
			local c = tbl14.c

			if c then
				local at = tbl14.at
				c = os.clock() - at < 1
			end

			if c then
				return tbl14.c
			end
			local filterDescendantsInstances = { localPlayer.Character }
			local v7 = fn38(true) or fn38()

			if v7 then
				filterDescendantsInstances[#filterDescendantsInstances + 1] = v7
				local trailer = v7:FindFirstChild("Config") and v7.Config:FindFirstChild("Trailer")

				if trailer and trailer.Value then
					filterDescendantsInstances[#filterDescendantsInstances + 1] = trailer.Value
				end

				for _, v8 in ipairs(tbl15.models(v7)) do
					filterDescendantsInstances[#filterDescendantsInstances + 1] = v8
				end
			end

			local raycastParams = RaycastParams.new()
			raycastParams.FilterType = Enum.RaycastFilterType.Exclude
			raycastParams.FilterDescendantsInstances = filterDescendantsInstances
			raycastParams.RespectCanCollide = true
			raycastParams.IgnoreWater = false
			local v8 = tbl14
			local v9 = tbl14
			local now = os.clock()
			v8.c = raycastParams
			v9.at = now
			return raycastParams
		end

		local obj = setmetatable({}, { __mode = "k" })
		local fn55 = nil

		fn48 = function(arg2)
			local v7 = fn55(arg2)

			if state.controllerActive and type(state.maxSpeed) == "number" then
				v7.vmax = math.clamp(state.maxSpeed, 20, 220)
			else
				v7.vmax = v7.cfgMax or v7.vmax
			end

			return v7
		end

		fn55 = function(arg2)
			local parent = arg2 and arg2.Parent
			if not (parent and parent:IsA("Model")) then
				return { halfW = 5, halfL = 8, height = 7, step = 0.8, agentR = 7, vmax = 46 }
			end
			local v7 = obj[parent]
			if v7 then
				return v7
			end

			local ok, result, result2 = pcall(function()
				return parent:GetBoundingBox()
			end)

			local v8 = ok and result2
			local n13 = 5
			local n14 = 7
			local n15 = 8

			if v8 then
				n13 = math.min(result2.X, result2.Z) / 2
				n15 = math.max(result2.X, result2.Z) / 2
				n14 = result2.Y
			end

			local n16 = 1.2

			for _, descendant in ipairs(parent:GetDescendants()) do
				if descendant:IsA("BasePart") and descendant.Name == "WheelCollision" then
					n16 = math.max(n16, math.max(descendant.Size.Y, descendant.Size.Z) / 2)
				end
			end

			local config = parent:FindFirstChild("Config")
			local isModuleScript = config and config:IsA("ModuleScript")
			local n17 = 46

			if isModuleScript then
				local ok2, result3 = pcall(require, config)

				if fn20 then
					fn20()
				end

				if ok2 and type(result3) == "table" and type(result3.MAX_SPEED) == "number" then
					n17 = math.clamp(result3.MAX_SPEED / 0.7 * 0.92, 20, 100)
				end
			end

			local tbl16 = {
				halfW = n13,
				halfL = n15,
				height = n14,
				step = math.clamp(n16 * 0.4, 0.55, 1.5),
				climb = n16 >= 2.5 and 1.6 or 2.8,
				agentR = math.clamp(n13 + 1.5, 6, 18),
				vmax = n17,
				cfgMax = n17,
			}

			obj[parent] = tbl16
			return tbl16
		end

		local n13 = 3
		local tbl16 = {}

		fn49 = function()
			table.clear(tbl16)
		end

		fn50 = function(arg2, arg3, arg4)
			local n14 = math.floor(arg2 / n13 + 0.5)
			local n15 = math.floor(arg3 / n13 + 0.5)
			local n16 = (n14 * 200003 + n15) * 64 + math.floor((arg4 or 0) / 24) % 64
			local v7 = tbl16[n16]
			if v7 ~= nil then
				return v7
			end
			local n17 = n14 * n13
			local n18 = n15 * n13
			local v8 = fn47()
			local n19 = arg4 or 0
			local hit = workspace:Raycast(Vector3.new(n17, n19 + 9, n18), Vector3.new(0, -70, 0), v8)

			if not hit then
				hit = workspace:Raycast(Vector3.new(n17, n19 + 45, n18), Vector3.new(0, -260, 0), v8)
			end

			local tbl17

			if hit and hit.Material ~= Enum.Material.Water then
				local instance = hit.Instance
				local flag15 = instance ~= workspace.Terrain and instance:IsA("BasePart") and hit.Normal.Y < 0.97 and hit.Normal.Y > 0.5
				local flag16 = false

				if flag15 then
					local size = instance.Size
					flag16 = math.min(size.X, size.Y, size.Z) < 1.5
				end

				tbl17 = { y = hit.Position.Y, ny = hit.Normal.Y, mat = hit.Material, sheet = flag16 }
			else
				tbl17 = false
			end

			tbl16[n16] = tbl17
			return tbl17
		end

		n = 0.78

		tbl12 = {
			[Enum.Material.Concrete] = true,
			[Enum.Material.Asphalt] = true,
			[Enum.Material.Pavement] = true,
			[Enum.Material.Cobblestone] = true,
			[Enum.Material.SmoothPlastic] = true,
			[Enum.Material.Plastic] = true,
			[Enum.Material.Brick] = true,
			[Enum.Material.Marble] = true,
			[Enum.Material.Metal] = true,
		}

		local function fn56(arg2)
			if tbl12[arg2] then
				return 1
			end

			if arg2 == Enum.Material.Sand or arg2 == Enum.Material.Mud or arg2 == Enum.Material.Snow then
				return 1.35
			end
			return 1.15
		end

		fn51 = function(arg2, arg3, arg4, arg5)
			local n14 = arg3.X - arg2.X
			local n15 = arg3.Z - arg2.Z
			local v7 = math.sqrt(n14 * n14 + n15 * n15)
			if v7 < 0.5 then
				return true
			end
			local n16 = n14 / v7
			local n17 = n15 / v7
			local n18 = -n17
			local n19 = arg5 or math.max(2, arg4.halfW - 1)
			local tbl17 = { -n19, -n19 / 2, 0, n19 / 2, n19 }
			local tbl18 = {}

			for i = 1, 5 do
				local v8 = tbl17[i]
				local v9 = fn50(arg2.X + n18 * v8, arg2.Z + n16 * v8, arg2.Y)
				if not v9 then
					return false
				end
				tbl18[i] = v9.y
			end

			local v8 = tbl18[3]
			local n20 = math.max(1, math.ceil(v7 / 3))
			local climb = arg4.climb or arg4.step

			for i = 1, n20 do
				local n21 = i / n20
				local n22 = arg2.X + n14 * n21
				local n23 = arg2.Z + n15 * n21

				for i2 = 1, 5 do
					local v9 = tbl17[i2]
					local v10 = fn50(n22 + n18 * v9, n23 + n16 * v9, tbl18[i2])
					if not v10 then
						return false
					end
					local n24 = v10.y - tbl18[i2]
					if n24 > climb and v10.ny > 0.995 then
						return false
					end
					local flag15 = n24 > math.max(2.4, climb)

					if not flag15 then
						flag15 = n24 < -((arg4.climb or 0) > 2 and 5.2 or 3.4)
					end

					if flag15 then
						return false
					end

					if v10.ny < n then
						return false
					end

					if v10.sheet then
						return false
					end
					tbl18[i2] = v10.y
				end
			end

			local v9 = tbl18[3]
			local v10 = fn47()
			local vector = Vector3.new(n18, 0, n16)
			local n21 = math.max(4, (arg4.height or 7) - 1.5)
			local vector2 = Vector3.new((arg2.X + arg3.X) / 2, (v8 + v9) / 2 + climb + n21 / 2, (arg2.Z + arg3.Z) / 2)
			local cframe = CFrame.lookAt(vector2, vector2 + Vector3.new(n16, 0, n17))
			local v11 = v6

			if not v6 then
				local overlapParams = OverlapParams.new()
				overlapParams.FilterType = Enum.RaycastFilterType.Exclude
				overlapParams.RespectCanCollide = true
				v6 = overlapParams
				v11 = overlapParams
			end

			v11.FilterDescendantsInstances = v10.FilterDescendantsInstances
			local partBoundsInBox = workspace:GetPartBoundsInBox(cframe, Vector3.new(n19 * 2 + 2, n21, v7 + 2), v11)
			if #partBoundsInBox == 0 then
				return true
			end
			local n22 = math.max(v8, v9)
			local n23 = (arg4.climb or climb) + 0.3

			for _, v12 in ipairs(partBoundsInBox) do
				local n24 = math.abs(v12.CFrame.UpVector.Y)

				if n24 > 0.95 or n24 < 0.7 or n24 >= 0.7 and n24 <= 0.95 and v12.Size.Y < 1.5 then
					local n25 = n24 > 0.95 and v12.Size.Y / 2

					if not n25 then
						local y = v12.Size.Y
						local x = v12.Size.X
						local n26 = math.abs(v12.CFrame.UpVector.Y) * y / 2 + math.abs(v12.CFrame.RightVector.Y) * x / 2
						local z = v12.Size.Z
						n25 = n26 + math.abs(v12.CFrame.LookVector.Y) * z / 2
					end

					local n26 = v12.Position.Y + n25 - n22
					if v12.Position.Y - n25 - n22 < n21 and (n26 > n23 or math.min(v12.Size.X, v12.Size.Z) < 1.5 and v12.Size.Y >= 2 and n26 > 1.2) then
						return false
					end
				end
			end

			for _, v12 in ipairs({ 1, climb + 0.35, 1.6, 2.6, 3.4, n21 * 0.6, n21 - 1.6, n21 }) do
				local vector3 = Vector3.new(arg2.X, v8 + v12, arg2.Z)
				local n24 = Vector3.new(arg3.X, v9 + v12, arg3.Z) - vector3

				for i = 1, 5 do
					local hit = workspace:Raycast(vector3 + vector * tbl17[i], n24, v10)
					if hit and hit.Normal.Y < 0.75 then
						return false
					end
				end
			end

			return true
		end

		local function fn57(arg2, arg3, arg4)
			local n14 = #arg2 + 1
			arg2[n14] = { f = arg3, k = arg4 }

			while n14 > 1 do
				local n15 = math.floor(n14 / 2)

				if not (arg2[n15].f <= arg2[n14].f) then
					local v7 = arg2[n15]
					arg2[n15] = arg2[n14]
					arg2[n14] = v7
					n14 = n15
					continue
				end

				break
			end
		end

		local function fn58(arg2)
			local v7 = arg2[1]
			local n14 = #arg2
			arg2[1] = arg2[n14]
			arg2[n14] = nil
			local n15 = n14 - 1
			local n16 = 1

			while true do
				local n17 = n16 * 2
				local n18 = n16 * 2 + 1

				if not (n17 <= n15 and arg2[n17].f < arg2[n16].f) then
					n17 = n16
				end

				if not (n18 <= n15 and arg2[n18].f < arg2[n17].f) then
					n18 = n17
				end

				if n18 ~= n16 then
					local v8 = arg2[n18]
					arg2[n18] = arg2[n16]
					arg2[n16] = v8
					n16 = n18
					continue
				end

				break
			end

			return v7
		end

		tbl13 = {}

		fn52 = function(arg2)
			tbl13[#tbl13 + 1] = { p = arg2, t = os.clock() }

			if #tbl13 > 14 then
				table.remove(tbl13, 1)
			end
		end

		local function fn59(arg2, arg3)
			local n14 = 0

			for _, v7 in ipairs(tbl13) do
				local t = v7.t
				if not (os.clock() - t < 240) then
					continue
				end
				local n15 = v7.p.X - arg2
				local n16 = v7.p.Z - arg3
				local v8 = math.sqrt(n15 * n15 + n16 * n16)
				if v8 < 9 then
					return math.huge
				end

				if v8 < 22 then
					n14 += (22 - v8) * 2
				end
			end

			return n14
		end

		n12 = 10

		local tbl17 = {
			{ 1, 0, 10 },
			{ -1, 0, 10 },
			{ 0, 1, 10 },
			{ 0, -1, 10 },
			{ 1, 1, 14.14 },
			{ 1, -1, 14.14 },
			{ -1, 1, 14.14 },
			{ -1, -1, 14.14 },
		}

		fn53 = function(arg2, arg3)
			return arg2 * 200003 + arg3
		end

		fn54 = function(arg2, arg3, arg4, arg5, arg6, arg7, arg8)
			arg6 = arg6 or 800
			local n14 = math.floor(arg2.X / n12 + 0.5)
			local n15 = math.floor(arg2.Z / n12 + 0.5)
			local v7 = fn50(arg2.X, arg2.Z, arg2.Y)
			local tbl18 = { gx = n14, gz = n15, pos = Vector3.new(arg2.X, v7 and v7.y or arg2.Y, arg2.Z), g = 0 }
			local tbl19 = { [fn53(n14, n15)] = tbl18 }
			local tbl20 = {}
			local tbl21 = {}
			fn57(tbl20, arg5(tbl18.pos), fn53(n14, n15))
			local v8 = arg5(tbl18.pos)

			local function fn60(arg9)
				local tbl22 = {}

				while arg9 do
					table.insert(tbl22, 1, arg9.pos)
					arg9 = arg9.parent
				end

				return tbl22
			end

			local n16 = 0
			local v9 = tbl18

			while #tbl20 > 0 do
				local v10 = fn58(tbl20)

				if not tbl21[v10.k] then
					tbl21[v10.k] = true
					local v11 = tbl19[v10.k]
					if arg4(v11.gx, v11.gz, v11.pos) then
						local v12 = fn60(v11)
						return v12, v12, 0
					end
					n16 += 1
					if n16 > arg6 then
						break
					end

					if not arg8 and n16 % 25 == 0 then
						task.wait()
					end

					for _, v12 in ipairs(tbl17) do
						local n17 = v11.gx + v12[1]
						local n18 = v11.gz + v12[2]
						local v13 = fn53(n17, n18)

						if not tbl21[v13] then
							local n19 = n17 * n12
							local n20 = n18 * n12
							local v14 = fn50(n19, n20, v11.pos.Y)

							if v14 and v14.ny >= n then
								local v15 = fn59(n19, n20)

								if v15 < math.huge then
									local vector = Vector3.new(n19, v14.y, n20)

									if fn51(v11.pos, vector, arg3) then
										local n21 = v12[3] * fn56(v14.mat) + v15

										if v11 == tbl18 and arg7 then
											local vector2 = Vector3.new(n19 - v11.pos.X, 0, n20 - v11.pos.Z)

											if vector2.Magnitude > 0.1 then
												n21 += (1 - vector2.Unit:Dot(arg7)) * 15
											end
										end

										local g = v11.g + n21
										local tbl22 = tbl19[v13]

										if not tbl22 or g < tbl22.g then
											if not tbl22 then
												tbl22 = { gx = n17, gz = n18, pos = vector }
												tbl19[v13] = tbl22
											end

											tbl22.g = g
											tbl22.parent = v11
											local v16 = arg5(vector)
											fn57(tbl20, g + v16, v13)

											if v16 < v8 then
												v8 = v16
												v9 = tbl22
											end
										end
									end
								end
							end
						end
					end
				end
			end

			if v9 ~= tbl18 then
				return nil, fn60(v9), v8
			end
			return nil, nil, v8
		end
	end

	local fn55

	fn55 = function(arg2, arg3)
		if not arg2 or #arg2 < 3 then
			return arg2
		end
		local tbl14 = { arg2[1] }
		local n13 = 1

		while n13 < #arg2 do
			local n14 = math.min(#arg2, n13 + 6)

			while n13 + 1 < n14 do
				if not fn51(arg2[n13], arg2[n14], arg3, arg3.halfW + 0.5) then
					n14 -= 1
					continue
				end
				break
			end

			tbl14[#tbl14 + 1] = arg2[n14]
			n13 = n14
		end

		return tbl14
	end

	local fn56

	fn56 = function(arg2, arg3, arg4)
		if not arg2 then
			return true
		end
		arg4 = arg4 or arg2.CFrame.LookVector
		local hit = workspace:Raycast(arg2.Position + arg4 * arg3 + Vector3.new(0, 40, 0), Vector3.new(0, -160, 0), fn47())
		if not hit then
			return false
		end

		if hit.Material == Enum.Material.Water then
			return false
		end
		local n13 = arg2.Position.Y - hit.Position.Y

		if n13 > 18 then
			if n13 > arg3 * 0.58 then
				return false
			end
			local hit2 = workspace:Raycast(arg2.Position + arg4 * arg3 * 0.5 + Vector3.new(0, 40, 0), Vector3.new(0, -160, 0), fn47())
			if not hit2 or hit2.Material == Enum.Material.Water then
				return false
			end

			if arg2.Position.Y - hit2.Position.Y < n13 * 0.3 then
				return false
			end
		end

		return true
	end

	tbl5.groundFan = function(arg2, arg3, arg4)
		if not fn56(arg2, arg3) then
			return false
		end
		local lookVector = arg2.CFrame.LookVector
		local tbl14 = {}
		local assemblyLinearVelocity = arg2.AssemblyLinearVelocity
		local vector = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)

		if vector.Magnitude > 8 then
			tbl14[#tbl14 + 1] = vector.Unit
		end

		local n13 = math.clamp(math.abs(tonumber(arg4) or 0), 0, 1)

		if n13 > 0.15 then
			for _, v6 in ipairs({ 1, -1 }) do
				local n14 = n13 * 0.35 * v6
				local v7 = math.cos(n14)
				local v8 = math.sin(n14)
				tbl14[#tbl14 + 1] = Vector3.new(lookVector.X * v7 - lookVector.Z * v8, 0, lookVector.X * v8 + lookVector.Z * v7)
			end
		end

		for _, v6 in ipairs(tbl14) do
			if not fn56(arg2, arg3, v6) then
				return false
			end
		end

		return true
	end

	local fn57, fn58

	do
		local function fn59(arg2, arg3, arg4, arg5, arg6)
			if arg3 < 20 then
				arg3 = 20
			end

			local v6 = fn47()
			local lookVector = arg2.CFrame.LookVector
			local vector = Vector3.new(lookVector.X, 0, lookVector.Z)
			if vector.Magnitude < 0.01 then
				return 0
			end
			local unit = vector.Unit
			local vector2 = Vector3.new(-unit.Z, 0, unit.X)
			local v7 = fn48(arg2)
			local n13 = v7.halfW + 2
			local n14 = arg2.Position + unit * v7.halfL * 0.5 + Vector3.new(0, 1.5, 0)
			local n15 = math.max(24, math.min(arg3 * 0.55, arg2.AssemblyLinearVelocity.Magnitude * 0.6 + 24))
			local magnitude = arg2.AssemblyLinearVelocity.Magnitude

			local function fn60(arg7, arg8, arg9)
				arg7 = arg7 and arg7:FindFirstAncestorOfClass("Model")
				local gameplay = workspace:FindFirstChild("Gameplay")
				gameplay = gameplay and gameplay:FindFirstChild("Vehicles")
				if not (arg7 and arg7.Parent and gameplay and arg7:IsDescendantOf(gameplay)) then
					return false
				end
				local chassis = arg7:FindFirstChild("_Chassis") or arg7.PrimaryPart
				if not chassis then
					return false
				end
				local assemblyLinearVelocity = chassis.AssemblyLinearVelocity
				if assemblyLinearVelocity.Magnitude < 8 then
					return false
				end
				local n16 = magnitude - assemblyLinearVelocity:Dot(unit)
				if n16 < 10 then
					return true
				end
				local n17 = math.max(18, n16 * 1.6)
				return not (math.abs(arg9) <= n13 and arg8 < n17)
			end

			local function fn61(arg7, arg8)
				local hit = workspace:Raycast(n14 + vector2 * arg7, arg8 * arg3, v6)
				if not hit then
					return false
				end

				if hit.Normal.Y > 0.75 then
					return false
				end

				if fn60(hit.Instance, hit.Distance, arg7) then
					return false
				end

				if math.abs(arg7) > 1.2 and hit.Distance > n15 then
					return false
				end

				if math.abs(arg7) > 1.2 and hit.Normal.Y < 0.25 and tbl12[hit.Instance.Material] and hit.Instance.Size.Y <= 3.5 then
					return false
				end

				if arg6 and not arg6(hit.Position) then
					return false
				end

				if arg4 and hit.Distance >= arg4 - 15 then
					return false
				end
				local model = hit.Instance:FindFirstAncestorOfClass("Model")
				tbl8.lastHit = ("%s/%s d=%.0f off=%+.0f n.y=%.2f"):format(model and model.Name or "-", hit.Instance.Name, hit.Distance, arg7, hit.Normal.Y)
				return true
			end

			local n16 = math.max(4, (v7.height or 7) - 1.5) - 1.5
			local n17 = arg5 and -1.2 or -n13
			local n18 = arg5 and 1.2 or n13
			local flag15 = false
			local flag16 = false
			local flag17 = false

			while n17 <= n18 + 0.01 do
				if fn61(n17, lookVector) then
					if n17 < -1.2 then
						flag15 = true
					elseif n17 > 1.2 then
						flag16 = true
					else
						flag17 = true
					end
				else
					local hit = workspace:Raycast(n14 + vector2 * n17 + Vector3.new(0, n16, 0), lookVector * arg3, v6)
					local flag18 = hit and hit.Normal.Y < 0.75
					local flag19

					if flag18 then
						flag19 = not (arg4 and hit.Distance >= arg4 - 15)
					else
						flag19 = flag18
					end

					flag19 = flag19 and (math.abs(n17) <= 1.2 or hit.Distance <= n15) and (not arg6 or arg6(hit.Position)) and not fn60(hit.Instance, hit.Distance, n17)

					if flag19 then
						if n17 < -1.2 then
							flag15 = true
						elseif n17 > 1.2 then
							flag16 = true
						else
							flag17 = true
						end
					end
				end

				n17 += 2.5
			end

			if not (flag17 or flag15 or flag16) then
				local v8 = fn50(n14.X, n14.Z, arg2.Position.Y)

				if v8 then
					local v9 = ipairs
					local tbl14 = arg5 and { 0 } or { -n13 + 1, 0, n13 - 1 }

					for k, v10 in v9(tbl14) do
						local y = v8.y

						for _, v11 in ipairs({ 5, 10, 15 }) do
							local n19 = n14 + unit * v11 + vector2 * v10
							local v12 = fn50(n19.X, n19.Z, y)

							if v12 then
								local n20 = v12.y - y

								if (n20 > (v7.climb or v7.step) and v12.ny > 0.995 or n20 > 3.9) and (not arg6 or arg6(n19)) then
									if arg5 then
										flag17 = true
									elseif k == 1 then
										flag15 = true
									elseif k == 3 then
										flag16 = true
									else
										flag17 = true
									end

									break
								else
									y = v12.y
									continue
								end
							end

							break
						end
					end
				end

				if not (flag17 or flag15 or flag16) then
					return 0
				end
			end

			if flag15 and flag16 then
				if flag17 then
					return 2
				end
				return 3
			end

			local flag18

			if flag15 and not flag16 then
				flag18 = true
			elseif flag16 and not flag15 then
				flag18 = false
			else
				local flag19 = not fn61(-n13, (lookVector - vector2 * 0.5).Unit)
				local flag20 = not fn61(n13, (lookVector + vector2 * 0.5).Unit)

				if flag20 and not flag19 then
					flag18 = true
				elseif flag19 and not flag20 then
					flag18 = false
				else
					if not (flag19 and flag20) then
						return 2
					end
					flag18 = true
				end
			end

			return flag18 and 1 or -1
		end

		local tbl14 = { hold = nil, av = 0, phase = 0 }

		local function fn60(arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
			local position = arg2.Position
			local n13

			if arg7 and arg7 > 0 then
				local assemblyLinearVelocity = arg2.AssemblyLinearVelocity
				n13 = position + Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z) * arg7
			else
				n13 = position
			end

			local vector = Vector3.new(arg3.X - n13.X, 0, arg3.Z - n13.Z)
			local lookVector = arg2.CFrame.LookVector
			local vector2 = Vector3.new(lookVector.X, 0, lookVector.Z)
			local unit = vector2.Magnitude > 0.01 and vector2.Unit or Vector3.new(0, 0, 1)
			local unit2 = vector.Magnitude > 0.01 and vector.Unit or unit
			local y = unit:Cross(unit2).Y
			local v6 = unit:Dot(unit2)
			local v7 = fn48(arg2)
			arg4 = arg4 or v7.vmax
			local flag15 = (v7.cfgMax or v7.vmax or 46) <= 50
			local n14

			if v6 < 0.4 then
				local min = math.min
				flag15 = flag15 and 22 or flag11 and 24 or 14
				n14 = min(arg4, flag15)
			elseif not (v6 < 0.8) then
				n14 = arg4
			else
				n14 = math.min(arg4, flag15 and 30 or flag11 and 40 or 28)
			end

			local magnitude = arg2.AssemblyLinearVelocity.Magnitude
			local v8 = tbl5.groundFan(arg2, math.max(30, magnitude * (magnitude > 50 and 1.8 or 1.4)), y)
			local v9 = fn42() or tbl8.find(arg2)
			local n15 = 0.15
			local n16 = 0.05

			if v9 then
				n15 = 0.02
				n16 = 0.01
			end

			local hold

			if v6 < 0 then
				hold = y >= 0
			elseif n15 < math.abs(y) then
				hold = y > 0
			elseif n16 < math.abs(y) then
				hold = tbl14.hold
			else
				hold = nil
			end

			local n17 = arg8 and math.max(28, magnitude * 1.6) or math.max(52, magnitude * 1.9)

			if arg10 then
				n17 = math.min(n17, math.max(20, arg10))
			end

			local v10

			if arg8 then
				local v11 = fn59
				arg5 = arg5 and math.huge or vector.Magnitude
				v10 = v11(arg2, n17, arg5, true, arg9)
			else
				v10 = fn59(arg2, n17, arg5 and math.huge or vector.Magnitude, false, arg9)
			end

			if v10 == 2 then
				fn40("W", false)
				fn40("A", false)
				fn40("D", false)
				fn40("S", magnitude > 5)
				tbl14.hold = nil
				return y, true
			end

			local autoCap

			if v10 == 3 then
				autoCap = math.min(n14, 20)
				tbl14.av = 0
			elseif v10 ~= 0 then
				hold = v10 < 0
				tbl14.av = os.clock() + 0.45
				autoCap = math.min(n14, 26)
			elseif os.clock() < (tbl14.av or 0) and tbl14.hold ~= nil then
				hold = tbl14.hold
				autoCap = math.min(n14, 30)
			else
				autoCap = n14
			end

			tbl14.hold = hold

			if state.autoCap and autoCap > state.autoCap then
				state.autoCap = math.min(autoCap, state.autoCap + 6)
			elseif state.autoCap and autoCap < state.autoCap and v8 and v10 == 0 then
				state.autoCap = math.max(autoCap, state.autoCap - 3.2)
			else
				state.autoCap = autoCap
			end

			local flag16

			if fn42() then
				flag16 = magnitude < autoCap + 12
			elseif tbl7.W then
				flag16 = magnitude < autoCap + 3
			else
				flag16 = magnitude < autoCap - 2
			end

			fn40("W", v8 and flag16)
			local v11 = fn40
			local flag17 = not v8 and magnitude > 5

			if not flag17 then
				flag17 = magnitude > autoCap + (flag11 and 14 or fn42() and 18 or 12)
			end

			v11("S", flag17)
			local n18 = math.min(1.38, magnitude / 19 + 0.12)
			local v12 = math.atan2(y, v6)
			local n19 = math.max(vector.Magnitude, 12)
			local n20 = 2 * math.max(magnitude, 6) * math.sin(v12) / n19

			if v6 < 0 then
				n20 = (y >= 0 and 1 or -1) * n18
			end

			if hold == nil then
				n20 = 0
			end

			local flag18 = hold ~= nil

			if flag18 then
				flag18 = v10 ~= 0

				if not flag18 then
					flag18 = os.clock() < (tbl14.av or 0)
				end
			end

			if flag18 then
				n20 += (hold and 1 or -1) * math.min(n18, 0.55 * math.clamp(45 / math.max(magnitude, 1), 0.3, 1))
			end

			local n21 = math.clamp(n20, -n18, n18)

			if arg6 ~= nil and v10 == 0 and hold == nil then
				local n22 = arg6 and 1 or -1

				if n21 * n22 >= 0 then
					local min = math.min
					n21 = n22 * math.max(math.abs(n21), min(n18, 0.35))
				end
			end

			local lastW = tbl8.lastW or 0
			local lastW2 = lastW + math.clamp(n21 - lastW, -0.45, 0.45)
			tbl8.lastW = lastW2

			if fn42() then
				state.autoYaw = lastW2

				if tbl8.find(arg2) then
					tbl8.set(arg2, lastW2 / math.max(n18, 0.3))
				else
					fn40("A", false)
					fn40("D", false)
				end
			elseif tbl8.find(arg2) then
				state.autoYaw = nil
				local n22 = (lastW2 + 0.5 * (lastW2 - arg2.AssemblyAngularVelocity.Y)) / math.max(n18, 0.3)

				if lastW2 == 0 then
					n22 = 0
				end

				tbl8.set(arg2, n22)
				tbl14.phase = 0
			else
				state.autoYaw = nil
				local n22 = lastW2 - arg2.AssemblyAngularVelocity.Y
				local n23 = 0.1 + 0.04 * math.abs(lastW2)

				if n22 > n23 then
					fn40("A", true)
					fn40("D", false)
				elseif n22 < -n23 then
					fn40("D", true)
					fn40("A", false)
				else
					fn40("A", false)
					fn40("D", false)
				end

				tbl14.phase = 0
			end

			return y, false
		end

		local function fn61(arg2, arg3)
			if not arg2 then
				return false
			end
			local lookVector = arg2.CFrame.LookVector
			local vector = Vector3.new(lookVector.X, 0, lookVector.Z)
			if vector.Magnitude < 0.01 then
				return false
			end
			local unit = vector.Unit
			local n13 = math.abs(lookVector.Y) > 0.4 and -unit or -lookVector
			local vector2 = Vector3.new(-unit.Z, 0, unit.X)
			local v6 = fn47()
			local n14 = arg2.Position + Vector3.new(0, 1.5, 0)

			for _, v7 in ipairs({ -6, 0, 6 }) do
				local hit = workspace:Raycast(n14 + vector2 * v7, n13 * arg3, v6)
				if hit and hit.Normal.Y < 0.75 then
					return false
				end
			end

			local n15 = -unit
			local y = arg2.Position.Y
			local tbl15 = { y, y, y }
			local n16 = math.max(1, math.ceil(arg3 / 4))

			for i = 1, n16 do
				local n17 = arg2.Position + n15 * i * arg3 / n16

				for i2, v7 in ipairs({ -3, 0, 3 }) do
					local hit = workspace:Raycast(n17 + vector2 * v7 + Vector3.new(0, 6, 0), Vector3.new(0, -20, 0), v6)
					if not hit or hit.Material == Enum.Material.Water then
						return false
					end

					if hit.Normal.Y < 0.85 then
						return false
					end

					if i > 1 and math.abs(hit.Position.Y - tbl15[i2]) > 2.5 then
						return false
					end
					tbl15[i2] = hit.Position.Y
				end
			end

			return true
		end

		local function fn62(arg2)
			local v6 = fn44()
			if not v6 then
				fn41()
				return false
			end
			local position = v6.Position
			local flag15 = v6.CFrame.LookVector.Y > 0.35
			local n13 = fn61(v6, 30) and 30 or fn61(v6, 14) and 14 or fn61(v6, 7) and 7 or 0

			if not flag15 and n13 == 0 then
				fn17("drive: nothing behind either, nudging forward instead")
				fn40("S", false)
				fn40("W", true)

				if arg2 >= 0 then
					fn40("A", true)
					fn40("D", false)
				else
					fn40("D", true)
					fn40("A", false)
				end

				task.wait(0.8)
				fn41()
				return false
			end

			state.autoCap = 12
			fn40("W", false)
			fn40("S", true)
			fn40("A", false)
			fn40("D", false)
			local now = os.clock()
			local n14 = n13 >= 30 and 2.2 or n13 >= 14 and 1.2 or 0.6

			while os.clock() - now < n14 do
				if not fn10() then
					fn41()
					return false
				end
				task.wait(0.1)
			end

			local v7 = fn59(v6, 30)
			local flag16

			if v7 == 1 then
				fn40("A", true)
				fn40("D", false)
				flag16 = false
			elseif v7 == -1 then
				fn40("D", true)
				fn40("A", false)
				flag16 = true
			elseif arg2 >= 0 then
				fn40("D", true)
				fn40("A", false)
				flag16 = true
			else
				fn40("A", true)
				fn40("D", false)
				flag16 = false
			end

			if fn42() then
				state.autoYaw = flag16 and 0.8 or -0.8
			end

			local flag17

			while true do
				flag17 = false

				if os.clock() - now < 5.2 then
					if not fn10() then
						fn41()
						return false
					end
					local v8 = fn44()
					if not v8 then
						fn41()
						return false
					end

					if not fn61(v8, 9) then
						break
					end
					local magnitude = (v8.Position - position).Magnitude
					if magnitude > 22 or magnitude > 12 and fn59(v8, 24) == 0 then
						flag17 = true
						break
					end

					if os.clock() - now > 2.8 and magnitude < 1 then
						break
					end
					task.wait(0.1)
				else
					break
				end
			end

			fn40("S", false)
			fn40("A", false)
			fn40("D", false)
			state.autoYaw = nil
			local v8 = fn44()
			fn17(string.format("drive: backed out %.0f studs, escaped=%s", v8 and (v8.Position - position).Magnitude or 0, tostring(flag17)))
			fn41()
			return flag17
		end

		local function fn63(arg2, arg3)
			local vector = Vector3.new(arg3.X - arg2.X, 0, arg3.Z - arg2.Z)
			local magnitude = vector.Magnitude
			if magnitude < 1 then
				return true
			end
			local unit = vector.Unit
			local vector2 = Vector3.new(-unit.Z, 0, unit.X)
			local v6 = fn47()
			local n13 = arg2 + Vector3.new(0, 1.5, 0)

			for _, v7 in ipairs({ -6, 0, 6 }) do
				if workspace:Raycast(n13 + vector2 * v7, unit * magnitude, v6) then
					return false
				end
			end

			return true
		end

		local function fn64(arg2, arg3)
			local vector = Vector3.new(arg3.X - arg2.X, 0, arg3.Z - arg2.Z)
			local magnitude = vector.Magnitude
			if magnitude < 1 then
				return true
			end
			local unit = vector.Unit
			local v6 = fn47()

			local function fn65(arg4)
				local hit = workspace:Raycast(arg4 + Vector3.new(0, 60, 0), Vector3.new(0, -300, 0), v6)
				if not hit then
					return nil
				end

				if hit.Material == Enum.Material.Water then
					return nil, true
				end
				return hit.Position.Y
			end

			local flag15 = fn65(arg2)
			local n13 = math.min(flag15 or arg2.Y, fn65(arg3) or arg3.Y)

			for i = 9, magnitude, 9 do
				local v7, v8 = fn65(arg2 + unit * i)
				if v8 then
					return false
				end

				if not v7 then
					return false
				end

				if v7 < n13 - 12 then
					return false
				end
				flag15 = flag15 and math.abs(v7 - flag15) > 14
				if flag15 then
					return false
				end
				flag15 = v7
			end

			return true
		end

		tbl5.borrowCtrl = function()
			if not v2.IS_MOBILE or state.controllerActive then
				return false
			end
			local speedController = v2.configReg and v2.configReg.speedController
			if not (speedController and speedController.set) then
				return false
			end
			pcall(speedController.set, true)
			fn17("drive: phone, Speed Controller borrowed for this drive")
			return true
		end

		tbl5.returnCtrl = function(arg2)
			if not arg2 then
				return
			end
			local speedController = v2.configReg and v2.configReg.speedController

			if speedController and speedController.set then
				pcall(speedController.set, false)
			end
		end

		tbl5.newWatch = function(arg2)
			return { goal = arg2, bestD = math.huge, bestAt = os.clock() }
		end

		tbl5.tick = function(arg2, arg3)
			if not (arg2 and arg3 and typeof(arg2.goal) == "Vector3") then
				return false
			end
			local magnitude = Vector3.new(arg2.goal.X - arg3.X, 0, arg2.goal.Z - arg3.Z).Magnitude

			if magnitude < arg2.bestD - 4 then
				arg2.bestD = magnitude
				arg2.bestAt = os.clock()
			end

			local bestAt = arg2.bestAt

			if os.clock() - bestAt > 25 then
				arg2.bestD = magnitude
				arg2.bestAt = os.clock()
				return true
			end

			return false
		end

		tbl5.roomy = function(arg2, arg3, arg4)
			local n13 = (fn48(fn44()).halfL or 8) + 5
			local v6 = fn47()

			for _, v7 in ipairs({ 3.5, 8 }) do
				local vector = Vector3.new(arg2, arg3 + v7, arg4)

				for i = 0, 7 do
					local n14 = i * 3.1415926535897931 / 4
					local v8 = workspace
					local sin = math.sin
					if v8:Raycast(vector, Vector3.new(math.cos(n14), 0, sin(n14)) * n13, v6) then
						return false
					end
				end
			end

			return true
		end

		tbl5.landing = function(arg2, arg3)
			local hit = workspace:Raycast(Vector3.new(arg2.X, arg3 + 25, arg2.Z), Vector3.new(0, -120, 0), fn47())
			if not hit or hit.Material == Enum.Material.Water then
				return nil
			end

			if math.abs(hit.Position.Y - arg3) > 9 then
				return nil
			end

			if workspace:Raycast(hit.Position + Vector3.new(0, 3, 0), Vector3.new(0, 14, 0), fn47()) then
				return nil
			end

			if not tbl5.roomy(arg2.X, hit.Position.Y, arg2.Z) then
				return nil
			end
			return Vector3.new(arg2.X, hit.Position.Y + 4, arg2.Z)
		end

		tbl5.escape = function(arg2)
			local v6 = fn38()
			local v7 = fn44()
			if not (v6 and v7) then
				return false
			end
			local position = v7.Position
			local vector = typeof(arg2) == "Vector3" and Vector3.new(arg2.X - position.X, 0, arg2.Z - position.Z) or Vector3.zero

			if vector.Magnitude < 1 then
				vector = Vector3.new(v7.CFrame.LookVector.X, 0, v7.CFrame.LookVector.Z)
			end

			if vector.Magnitude < 0.01 then
				vector = Vector3.new(0, 0, 1)
			end

			local unit = vector.Unit
			local tbl15 = {}

			for _, v8 in ipairs({ 34, 50 }) do
				tbl15[#tbl15 + 1] = position + unit * v8
			end

			for _, v8 in ipairs({ 34, 50, 70 }) do
				for i = 0, 11 do
					local n13 = i * 3.1415926535897931 / 6
					local n14 = #tbl15 + 1
					local sin = math.sin
					tbl15[n14] = position + Vector3.new(math.cos(n13), 0, sin(n13)) * v8
				end
			end

			if typeof(arg2) == "Vector3" then
				table.sort(tbl15, function(arg3, arg4)
					return (arg3 - arg2).Magnitude < (arg4 - arg2).Magnitude
				end)
			end

			local n13 = nil

			for _, v8 in ipairs(tbl15) do
				n13 = tbl5.landing(v8, position.Y)
				if not n13 then
					continue
				end
				break
			end

			if not n13 then
				local v8 = nil
				local v9 = nil

				pcall(function()
					for _, child in ipairs(replicatedStorage.Gameplay.NavigationPoints:GetChildren()) do
						if child:IsA("BasePart") then
							local magnitude = (child.Position - position).Magnitude

							if not v9 or magnitude < v9 then
								v8 = child
								v9 = magnitude
							end
						end
					end
				end)

				if v8 then
					n13 = v8.Position + Vector3.new(0, 4, 0)
				end
			end

			if not n13 then
				fn17("escape: no landing anywhere")
				return false
			end

			local ok = pcall(function()
				local pivot = v6:GetPivot()
				local n14 = n13 - pivot.Position
				local n15 = pivot - pivot.Position
				v6:PivotTo(CFrame.new(n13) * n15)
				local trailer = v6:FindFirstChild("Config") and v6.Config:FindFirstChild("Trailer")
				trailer = trailer and trailer.Value

				if trailer and trailer:IsA("Model") then
					trailer:PivotTo(trailer:GetPivot() + n14)
				end

				for _, v8 in ipairs({ v6, trailer }) do
					if v8 then
						for _, descendant in ipairs(v8:GetDescendants()) do
							if descendant:IsA("BasePart") then
								descendant.AssemblyLinearVelocity = Vector3.zero
								descendant.AssemblyAngularVelocity = Vector3.zero
							end
						end
					end
				end
			end)

			fn17(("escape: no progress for 25s, moved the tractor %.0f studs"):format((n13 - position).Magnitude))
			fn15("Getting unstuck", "info")
			return ok
		end

		tbl5.tpTractor = function(arg2, arg3)
			local v6 = fn38()
			local v7 = fn44()
			if not (v6 and v7) then
				return false
			end

			local function fn65()
				local v8 = fn44()
				return v8 and (v8.Position - arg2).Magnitude or 1e9
			end

			if fn65() <= arg3 then
				return true
			end

			local function fn66(arg4)
				local v8 = fn47()
				local v9, v10 = tbl3.groundUnder(arg4.X, arg4.Z, arg4.Y + 60, v8)
				if not v9 or v10 then
					return nil
				end

				if workspace:Raycast(Vector3.new(arg4.X, v9 + 3, arg4.Z), Vector3.new(0, 22, 0), v8) then
					return nil
				end

				if not tbl5.roomy(arg4.X, v9, arg4.Z) then
					return nil
				end
				return Vector3.new(arg4.X, v9 + 4, arg4.Z)
			end

			local pivot = v6:GetPivot()
			local v8 = fn66(arg2)

			if not v8 then
				local n13 = pivot.Position - arg2
				local vector = Vector3.new(n13.X, 0, n13.Z)
				local n14 = vector.Magnitude > 1 and math.atan2(vector.Z, vector.X) or 0

				for _, v9 in ipairs({ 16, 26, 36, 46, 58, 72, 90 }) do
					for _, v10 in ipairs({ 0, 1, -1, 2, -2, 3, -3, 4, -4, 5, -5, 6 }) do
						local n15 = n14 + v10 * 3.1415926535897931 / 6
						local sin = math.sin
						v8 = fn66(arg2 + Vector3.new(math.cos(n15), 0, sin(n15)) * v9)
						if not v8 then
							continue
						end
						break
					end

					if not v8 then
						continue
					end
					break
				end
			end

			if not v8 then
				fn17("tp: no open spot near the target, driving instead")
				return false
			end

			if pcall(function()
				local pivot2 = v6:GetPivot()
				local n13 = v8 - pivot2.Position
				local trailer = v6:FindFirstChild("Config") and v6.Config:FindFirstChild("Trailer")
				local value = trailer and trailer.Value

				local function fn67(arg4)
					if not arg4 then
						return
					end

					for _, descendant in ipairs(arg4:GetDescendants()) do
						if descendant:IsA("BasePart") then
							descendant.AssemblyLinearVelocity = Vector3.zero
							descendant.AssemblyAngularVelocity = Vector3.zero
						end
					end
				end

				fn67(v6)
				fn67(value)
				local n14 = pivot2 - pivot2.Position
				v6:PivotTo(CFrame.new(v8) * n14)

				if value and value:IsA("Model") then
					local v9 = nil

					for _, descendant in ipairs(value:GetDescendants()) do
						if descendant:IsA("BallSocketConstraint") then
							v9 = descendant
							break
						else
							v9 = nil
						end
					end

					local attachment1 = v9 and v9.Attachment0 and v9.Attachment1
					local flag15 = false

					if attachment1 then
						local attachment0 = v9.Attachment0
						local attachment12 = v9.Attachment1
						local v10 = attachment0:IsDescendantOf(value) and attachment0 or attachment12
						attachment12 = v10 == attachment0 and attachment12 or attachment0

						if v10 and attachment12 then
							local n15 = attachment12.WorldPosition - v10.WorldPosition
							value:PivotTo(value:GetPivot() + n15)
							flag15 = true
						end
					end

					if not flag15 then
						value:PivotTo(value:GetPivot() + n13)
					end
				end

				fn67(v6)
				fn67(value)
			end) then
				task.wait(0.4)

				if fn65() <= arg3 + 15 then
					if not fn26() then
						fn39()
					end

					fn41()
					local v9 = fn17
					local format = ("tp: moved the tractor %.0f studs").format
					local v10 = fn65()
					v9(format("tp: moved the tractor %.0f studs", v10))
					return true
				end

				local v9 = fn17
				local format = ("tp: landed %.0f off the target (open ground), driving the rest").format
				local v10 = fn65()
				v9(format("tp: landed %.0f off the target (open ground), driving the rest", v10))
			end

			return false
		end

		fn57 = function(arg2, arg3, arg4, arg5)
			arg3 = arg3 or 30
			arg4 = arg4 or 9
			arg5 = arg5 or tbl11.DRIVE
			local v6 = fn44()
			if not v6 then
				return false
			end

			if flag12 and not tbl4 and not flag13 and tbl5.tpTractor(arg2, arg3) then
				return true
			end
			fn17(("driveTo: -> (%.0f,%.0f) reach %d maxT %d from (%.0f,%.0f)"):format(arg2.X, arg2.Z, arg3, arg4, v6.Position.X, v6.Position.Z))
			local now = os.clock()
			local position = v6.Position
			local now2 = os.clock()
			local v7 = tbl5.newWatch(arg2)
			local n13 = 0
			local n14 = 0

			while fn10() and os.clock() - now < arg4 do
				local v8 = fn44()
				if not v8 then
					fn41()
					return false
				end

				if not fn26() then
					fn41()
					return false
				end
				local position2 = v8.Position

				if Vector3.new(arg2.X - position2.X, 0, arg2.Z - position2.Z).Magnitude <= arg3 then
					if not flag11 then
						fn45()
					end

					return true
				end

				if not fn56(v8, 26) and not fn64(position2, arg2) then
					fn41()
					fn17("drive: no ground ahead, stopping")
					fn15("Stopped at the edge, finding another way", "warn")
					return false
				end

				local v9 = fn60(v8, arg2, arg5)
				local magnitude = v8.AssemblyLinearVelocity.Magnitude

				if (position2 - position).Magnitude > 3 then
					now2 = os.clock()
					position = position2
				end

				if flag9 and tbl5.tick(v7, position2) then
					tbl5.escape(arg2)
					position = fn44()
					position = position and position.Position or position2
					now2 = os.clock()
					n13 = 0
				end

				local n15 = os.clock() - now2

				if magnitude < 2 then
					n14 += 0.1
				else
					n14 = 0
				end

				if v8.CFrame.LookVector.Y > 0.35 then
					n14 += 0.25
				end

				if n14 > 1.6 or n15 > 6 then
					n13 += 1
					fn17("drive: wedged, backing out (" .. n13 .. ")")

					if n13 == 2 then
						fn15("Getting unstuck", "info")
					end

					tbl3.fstat("getting unstuck")
					local v10 = fn62(v9)
					local v11 = fn44()

					if not v10 and v11 then
						local lookVector = v11.CFrame.LookVector
						local vector = Vector3.new(lookVector.X, 0, lookVector.Z)

						if vector.Magnitude > 0.01 then
							local unit = vector.Unit
							fn52(v11.Position + unit * (fn48(v11).halfL + 4))
							local n16 = fn59(v11, 30) == 1 and 1 or -1
							local unit2 = (Vector3.new(-unit.Z, 0, unit.X) * n16 - unit * 0.5).Unit
							local now3 = os.clock()

							while true do
								if fn10() and os.clock() - now3 < 3.5 then
									local v12 = fn44()

									if v12 then
										local lookVector2 = v12.CFrame.LookVector
										local vector2 = Vector3.new(lookVector2.X, 0, lookVector2.Z)

										if not (vector2.Magnitude < 0.01 or vector2.Unit:Dot(unit2) > 0.45) then
											if fn61(v12, 12) then
												state.autoCap = 12
												local y = vector2.Unit:Cross(unit2).Y
												fn40("W", false)
												fn40("S", true)

												if y > 0 then
													fn40("D", true)
													fn40("A", false)
												else
													fn40("A", true)
													fn40("D", false)
												end

												if fn42() then
													state.autoYaw = y > 0 and 0.9 or -0.9
												end

												task.wait(0.1)
												continue
											end
										end
									end
								end

								break
							end

							fn41()
						end
					end

					now2 = os.clock()
					position = v11 and v11.Position or position
					n14 = 0
					if n13 >= 3 then
						fn41()
						return false
					end
				end

				task.wait(0.1)
			end

			fn41()
			local v8 = fn44()
			return v8 ~= nil and Vector3.new(arg2.X - v8.Position.X, 0, arg2.Z - v8.Position.Z).Magnitude <= arg3 + 6
		end

		fn58 = function()
			local gameplay = workspace:FindFirstChild("Gameplay")
			gameplay = gameplay and gameplay:FindFirstChild("Entities")
			if not gameplay then
				return nil
			end

			for _, descendant in ipairs(gameplay:GetDescendants()) do
				if descendant.Name == "CropToolInteraction" then
					if descendant:IsA("BasePart") or descendant:IsA("Attachment") or descendant:FindFirstChildWhichIsA("BasePart", true) then
						return descendant
					end
					fn17("harvester container present but no parts streamed yet")
					return nil
				end
			end

			return nil
		end

		local function fn65(arg2, arg3)
			local flag15 = false

			if not flag14 then
				flag15 = arg3
			end

			if not flag15 then
				return false
			end
			local v6 = fn38()
			local v7 = fn44()
			if not (v6 and v7 and arg2) then
				return false
			end
			local vector = Vector3.new(arg2.X - v7.Position.X, 0, arg2.Z - v7.Position.Z)
			if vector.Magnitude < 1 then
				return false
			end
			local n13 = v7.Position + vector.Unit * (arg3 and 34 or 24)
			local v8, v9 = tbl3.groundUnder(n13.X, n13.Z, n13.Y + 40, fn47())
			if not v8 or v9 then
				return false
			end
			local vector2 = Vector3.new(n13.X, v8 + 4, n13.Z)

			if pcall(function()
				local pivot = v6:GetPivot()
				local n14 = pivot - pivot.Position
				v6:PivotTo(CFrame.new(vector2) * n14)
			end) then
				fn17("unstick: tp-nudged 24 studs past the wedge")
				return true
			end

			return false
		end

		local v6 = nil
		local v7 = nil
		local tbl15 = nil

		local function fn66()
			if tbl15 then
				return tbl15
			end
			tbl15 = {}

			pcall(function()
				for _, child in ipairs(replicatedStorage.Gameplay.NavigationPoints:GetChildren()) do
					if child:IsA("BasePart") then
						tbl15[#tbl15 + 1] = child
					end
				end
			end)

			return tbl15
		end

		local function fn67(arg2, arg3)
			if not v6 then
				local ok, result = pcall(function()
					return atLowIdentity and atLowIdentity(function()
						return require(replicatedStorage.Modules.NavigationSystem)
					end) or require(replicatedStorage.Modules.NavigationSystem)
				end)

				if fn20 then
					fn20()
				end

				if not (ok and type(result) == "table" and result.create) then
					return nil
				end
				v6 = result
			end

			if not v7 then
				v7 = v6.create(true, true)
			end

			local part = Instance.new("Part")
			part.Anchored = true
			part.CanCollide = false
			part.Transparency = 1
			part.Size = Vector3.one
			part.CFrame = CFrame.new(arg3)
			part.Parent = workspace

			local ok = pcall(function()
				v7.update(arg2, part)
			end)

			part:Destroy()
			if not ok then
				return nil
			end
			local pathPoints = v7.pathPoints
			if not (pathPoints and #pathPoints >= 1) then
				return nil
			end
			return pathPoints
		end

		local function fn68(arg2)
			local v8 = fn47()
			local n13 = 420
			local y = nil

			for i = 1, 5 do
				local hit = workspace:Raycast(Vector3.new(arg2.X, n13, arg2.Z), Vector3.new(0, -(n13 + 480), 0), v8)

				if hit then
					if hit.Material ~= Enum.Material.Water then
						y = hit.Position.Y
					end

					n13 = hit.Position.Y - 0.6
					if not (n13 < -400) then
						continue
					end
				end

				break
			end

			if y then
				return Vector3.new(arg2.X, y, arg2.Z)
			end
			return arg2
		end

		local function fn69(arg2, arg3, arg4)
			local n13 = arg4.X - arg3.X
			local n14 = arg4.Z - arg3.Z
			local n15 = arg2.X - arg3.X
			local n16 = arg2.Z - arg3.Z
			local n17 = n13 * n13 + n14 * n14
			local n18 = n17 > 0 and math.clamp((n15 * n13 + n16 * n14) / n17, 0, 1) or 0
			local n19 = arg3.X + n13 * n18 - arg2.X
			local n20 = arg3.Z + n14 * n18 - arg2.Z
			return math.sqrt(n19 * n19 + n20 * n20)
		end

		local function fn70(arg2, arg3)
			return function(arg4, arg5, arg6)
				return Vector3.new(arg6.X - arg2.X, 0, arg6.Z - arg2.Z).Magnitude <= arg3
			end, function(arg4)
				return Vector3.new(arg4.X - arg2.X, 0, arg4.Z - arg2.Z).Magnitude
			end
		end

		local function fn71(arg2, arg3, arg4)
			if not arg2 or #arg2 == 0 then
				return {}, {}
			end
			local n13 = 0

			for i = 2, #arg2 do
				n13 += (arg2[i] - arg2[i - 1]).Magnitude
			end

			local n14 = math.max(arg4 or 12, n13 / 900)
			local tbl16 = { arg2[1] }
			local tbl17 = { arg3 and arg3[1] or 1 }

			for i = 2, #arg2 do
				local v8 = arg2[i - 1]
				local v9 = arg2[i]
				local magnitude = (v9 - v8).Magnitude

				if magnitude > 0.1 then
					local n15 = math.max(1, math.floor(magnitude / n14 + 0.5))

					for i2 = 1, n15 do
						tbl16[#tbl16 + 1] = v8:Lerp(v9, i2 / n15)
						tbl17[#tbl17 + 1] = arg3 and arg3[i] or 1
					end
				end
			end

			return tbl16, tbl17
		end

		local function fn72(arg2, arg3, arg4, arg5)
			arg4 = arg4 or 80
			local tbl16 = {}
			local tbl17 = {}

			if arg5 then
				tbl17[1] = 0

				for i = 2, #arg5 do
					tbl17[i] = tbl17[i - 1] + (arg5[i] - arg5[i - 1]).Magnitude
				end
			end

			local function fn73(arg6)
				if not arg5 or #arg5 == 0 then
					return nil, 0, 0
				end
				local n13 = #arg5
				local huge = math.huge

				for i = 1, #arg5 do
					local magnitude = Vector3.new(arg5[i].X - arg6.X, 0, arg5[i].Z - arg6.Z).Magnitude

					if magnitude < huge then
						huge = magnitude
						n13 = i
					end
				end

				return n13, huge, tbl17[#arg5] - tbl17[n13]
			end

			fn47()
			local vehicles = workspace:FindFirstChild("Gameplay") and workspace.Gameplay:FindFirstChild("Vehicles")
			local v8 = fn38(true) or fn38()

			local function fn74(arg6, arg7)
				local partBoundsInBox = workspace:GetPartBoundsInBox(CFrame.lookAt(arg6 + Vector3.new(0, 3, 0), arg6 + arg7 + Vector3.new(0, 3, 0)), Vector3.new(7, 5, 15))

				for _, v9 in ipairs(partBoundsInBox) do
					if v9.CanCollide and v9 ~= workspace.Terrain then
						local model = v9:FindFirstAncestorOfClass("Model")
						local flag15 = vehicles and v9:IsDescendantOf(vehicles)

						if flag15 then
							flag15 = not (v8 and v9:IsDescendantOf(v8))
						end

						if flag15 then
							return true
						end

						if model and model:FindFirstChildOfClass("Humanoid") then
							return true
						end
					end
				end

				return false
			end

			for _, descendant in ipairs(workspace:GetDescendants()) do
				if descendant:IsA("Model") and descendant.Name == "Parking" and (descendant:GetPivot().Position - arg2).Magnitude < arg4 + 60 then
					local tbl18 = {}

					for _, child in ipairs(descendant:GetChildren()) do
						if child:IsA("BasePart") and child.Size.X < 0.6 and child.Size.Y < 0.6 and child.Size.Z >= 12 and child.Size.Z <= 28 then
							tbl18[#tbl18 + 1] = child
						end
					end

					if #tbl18 >= 2 then
						local lookVector = tbl18[1].CFrame.LookVector
						local vector = Vector3.new(lookVector.X, 0, lookVector.Z)

						if vector.Magnitude > 0.1 then
							local unit = vector.Unit
							local vector2 = Vector3.new(-unit.Z, 0, unit.X)
							local tbl19 = {}

							for _, v9 in ipairs(tbl18) do
								local lookVector2 = v9.CFrame.LookVector
								local vector3 = Vector3.new(lookVector2.X, 0, lookVector2.Z)

								if vector3.Magnitude > 0.1 and math.abs(vector3.Unit:Dot(unit)) > 0.9 then
									tbl19[#tbl19 + 1] = v9
								end
							end

							table.sort(tbl19, function(arg6, arg7)
								local position = arg7.Position
								return arg6.Position:Dot(vector2) < position:Dot(vector2)
							end)

							for i = 1, #tbl19 - 1 do
								local v9 = tbl19[i]
								local v10 = tbl19[i + 1]
								local v11 = (v10.Position - v9.Position):Dot(vector2)
								local n13 = math.abs((v10.Position - v9.Position):Dot(unit))

								if v11 >= 7 and v11 <= 15 and n13 < 8 then
									local n14 = (v9.Position + v10.Position) / 2
									local n15 = v9.Size.Z / 2
									local tbl20 = {}
									local v12 = fn50(n14.X, n14.Z, n14.Y)

									for _, v13 in ipairs({ 1, -1 }) do
										local n16 = unit * v13
										local flag15 = v12 ~= nil

										for _, v14 in ipairs({ 6, 12, 18 }) do
											local n17 = n14 + n16 * (n15 + v14)
											local v15 = fn50(n17.X, n17.Z, n14.Y)
											if not v15 or not tbl12[v15.mat] or math.abs(v15.y - v12.y) > 0.65 then
												flag15 = false
												break
											end
										end

										if flag15 then
											tbl20[#tbl20 + 1] = n16
										end
									end

									local v13 = tbl20[1]
									local magnitude = Vector3.new(n14.X - arg2.X, 0, n14.Z - arg2.Z).Magnitude
									local v14, v15, v16 = fn73(n14)
									local v17 = v14 and arg5[v14] or nil

									if #tbl20 == 2 and v17 then
										if (n14 + tbl20[2] * (n15 + 20) - v17).Magnitude < (n14 + tbl20[1] * (n15 + 20) - v17).Magnitude then
											v13 = tbl20[2]
										end
									end

									if v13 and magnitude <= arg4 and not fn74(n14, v13) then
										tbl16[#tbl16 + 1] = {
											center = Vector3.new(n14.X, (fn50(n14.X, n14.Z, n14.Y) or { y = n14.Y }).y + 1, n14.Z),
											open = v13,
											half = n15,
											j = v14,
											walk = magnitude,
											score = math.max(0, magnitude - 35) + v15 * 1.2 - v16 * 1.2,
										}
									end
								end
							end
						end
					end
				end
			end

			table.sort(tbl16, function(arg6, arg7)
				return arg6.score < arg7.score
			end)

			return tbl16
		end

		local function fn73(arg2, arg3, arg4)
			local bay = arg2.bay

			if not bay then
				bay = not (tbl4 and tbl4.park)
			end

			if bay then
				return
			end
			local tgt = arg2.tgt
			local pts = not arg4 and arg2.pts or nil
			local exitLeg = arg2.exitLeg and #arg2.exitLeg >= 2 and arg2.exitLeg or nil
			local tbl16 = {}

			if pts then
				for _, v8 in ipairs(pts) do
					tbl16[#tbl16 + 1] = v8
				end
			end

			local n13 = #tbl16

			if exitLeg then
				local n14 = pts and 2 or 1

				for i = n14, #exitLeg do
					tbl16[#tbl16 + 1] = exitLeg[i]
				end
			end

			if not pts and not exitLeg then
				tbl16 = arg2.pts
				n13 = #tbl16
			end

			if #tbl16 == 0 then
				return
			end
			local v8 = fn72(tgt, arg3, 100, tbl16)

			for i, v9 in ipairs(v8) do
				local n14 = math.max(2, math.min(v9.j or #tbl16, #tbl16))
				local v10 = tbl16[n14]
				local vector = Vector3.new(-v9.open.Z, 0, v9.open.X)

				if (v10 - v9.center):Dot(vector) < 0 then
					vector = -vector
				end

				local half = v9.half
				local y = v9.center.Y
				local n15 = v9.center + v9.open * (half + 2 + 15)

				local function fn74(arg5)
					local v11 = fn50(arg5.X, arg5.Z, y)
					return v11 and Vector3.new(arg5.X, v11.y + 1, arg5.Z) or nil
				end

				local v11 = fn74(v9.center + v9.open * (half + 2))
				local v12 = nil
				local v13 = nil
				local flag15 = false

				if v11 then
					v12 = nil
					v13 = nil

					for _, v14 in ipairs({ 1, -1 }) do
						local n16 = vector * v14

						for _, v15 in ipairs({ 30, 16 }) do
							local v16 = fn74(n15 + n16 * (15 + v15))
							local v17 = fn74(n15 + n16 * 15)

							if v16 and v17 and fn51(v16, v17, arg3, arg3.halfW - 1) and fn51(v17, v11, arg3, arg3.halfW - 1.5) then
								flag15 = true
								v12 = v16
								v13 = v17
								vector = n16
								break
							end
						end

						if not flag15 then
							continue
						end
						break
					end
				end

				local flag16 = flag15 and n14 >= 2
				local flag17 = false

				if flag16 then
					local n16 = tbl16[n14] - tbl16[n14 - 1]
					local vector2 = Vector3.new(n16.X, 0, n16.Z)

					if vector2.Magnitude > 0.5 then
						local unit = vector2.Unit
						local n17 = -v9.open
						local vector3 = Vector3.new(-unit.Z, 0, unit.X)
						local n18 = math.abs((v11 - tbl16[n14]):Dot(vector3))
						local v14 = (v11 - tbl16[n14]):Dot(unit)

						if unit:Dot(n17) > 0.86 and n18 < 6 and v14 > 4 and v14 < 90 and fn51(tbl16[n14], v11, arg3, arg3.halfW - 1) then
							flag17 = true
						end
					end
				end

				if flag15 and not flag17 then
					local huge = math.huge

					for i2 = 2, n14 do
						local magnitude = Vector3.new(tbl16[i2].X - v12.X, 0, tbl16[i2].Z - v12.Z).Magnitude

						if magnitude < huge then
							huge = magnitude
							n14 = i2
						end
					end

					v10 = tbl16[n14]
				end

				local tbl17

				if flag15 and flag17 then
					tbl17 = {}
				else
					tbl17 = nil

					if flag15 then
						if fn51(v10, v12, arg3, arg3.halfW + 0.5) then
							tbl17 = {}
						else
							local v14, v15 = fn70(v12, 6)
							local ok, result = pcall(fn54, v10, arg3, v14, v15, 600, nil, true)
							ok = ok and result
							tbl17 = nil

							if ok then
								tbl17 = fn55(result, arg3)
								table.remove(tbl17, 1)

								if #tbl17 > 0 and (tbl17[#tbl17] - v12).Magnitude < 8 then
									tbl17[#tbl17] = nil
								end
							end
						end
					end
				end

				if flag15 and tbl17 then
					if n14 <= n13 and pts then
						for i2 = #pts, n14 + 1, -1 do
							pts[i2] = nil

							if arg2.cls then
								arg2.cls[i2] = nil
							end
						end

						arg2.exitLeg = nil
					elseif exitLeg then
						local n16 = n14 - n13
						pts = pts and 1 or 0

						for i2 = #exitLeg, n16 + pts + 1, -1 do
							exitLeg[i2] = nil
						end

						pts = exitLeg
					else
						for i2 = #tbl16, n14 + 1, -1 do
							tbl16[i2] = nil
						end

						pts = tbl16
					end

					if flag17 then
						pts[#pts + 1] = v11
						v9.direct = true
					else
						for _, v14 in ipairs(tbl17) do
							pts[#pts + 1] = v14
						end

						pts[#pts + 1] = v12
						pts[#pts + 1] = v13
						v11 = v13
					end

					v9.p2 = v11
					v9.travel = flag17 and -v9.open or -vector
					v9.R = 15
					v9.stop = v9.center + v9.open * math.max(0.8, arg3.halfL + 1.2 - half)

					if pts == arg2.pts and arg2.cls then
						for i2 = #arg2.cls + 1, #arg2.pts do
							arg2.cls[i2] = 1
						end
					end

					arg2.arriveAt = v9.center
					arg2.bay = v9
					local n16 = 0

					for i2 = n14 + 1, #tbl16 do
						n16 += (tbl16[i2] - tbl16[i2 - 1]).Magnitude
					end

					fn17(("plan: parking bay %.0f from the marker, %s%s%s"):format(v9.walk, n16 > 5 and ("cuts the route %.0f short"):format(n16) or "at the end", flag17 and ", straight in" or "", i > 1 and (" (%d better-placed bays had no clear way in)"):format(i - 1) or ""))
					return
				end
			end
		end

		local function fn74(arg2, arg3, arg4, arg5)
			if not arg5 then
				return nil
			end
			arg5.altTried = arg5.altTried or {}

			local function fn75(arg6)
				local vector = Vector3.new(arg2.X - arg6.X, 0, arg2.Z - arg6.Z)
				local unit = vector.Unit
				local y = arg6.Y
				local n13 = 0
				local n14 = 0

				for i = 1, math.max(1, math.floor(vector.Magnitude / 6)) do
					local n15 = arg6 + unit * i * 6
					local v8 = fn50(n15.X, n15.Z, y)

					if not v8 then
						n13 += 1
					else
						if math.abs(v8.y - y) > 7 then
							n14 += 1
						end

						y = v8.y
					end
				end

				return (n13 > 0 and 400 or 0) + (n14 > 0 and 200 or 0)
			end

			local tbl16 = {}

			for _, v8 in ipairs(fn66()) do
				local position = v8.Position
				local magnitude = Vector3.new(position.X - arg2.X, 0, position.Z - arg2.Z).Magnitude

				if magnitude < 700 and Vector3.new(position.X - arg4.X, 0, position.Z - arg4.Z).Magnitude > 25 and fn50(position.X, position.Z, position.Y) then
					tbl16[#tbl16 + 1] = { d = magnitude + fn75(position), p = position }
				end
			end

			table.sort(tbl16, function(arg6, arg7)
				return arg6.d < arg7.d
			end)

			local v8, v9 = fn70(arg2, 9)
			local n13 = 0

			for _, v10 in ipairs(tbl16) do
				if n13 >= 10 then
					break
				end
				local floor = math.floor
				local n14 = v10.p.Z / 8
				local str4 = ("%d,%d"):format(math.floor(v10.p.X / 8), floor(n14))

				if not arg5.altTried[str4] and fn50(v10.p.X, v10.p.Z, v10.p.Y) then
					arg5.altTried[str4] = true
					n13 += 1
					local ok, result = pcall(fn54, v10.p, arg3, v8, v9, 3000)
					if tbl4 ~= arg5 then
						return nil
					end

					if ok and result then
						return v10.p, result
					end
				end
			end

			return nil
		end

		local function fn75(arg2, arg3)
			arg2.exitDone = true
			local v8 = arg2.pts[arg2.roadEnd]
			local tgt = arg2.tgt
			local magnitude = Vector3.new(tgt.X - v8.X, 0, tgt.Z - v8.Z).Magnitude
			if magnitude <= 12 then
				arg2.arriveAt = tgt
				return nil
			end
			local v9, v10 = fn70(tgt, 9)
			local v11, v12, v13 = fn54(v8, arg3, v9, v10, tbl4 and tbl4.via and 3000 or 1500)
			local flag15 = not v11 and tbl4 and not tbl4.via and not tbl4.altJob

			if flag15 then
				tbl4.altJob = true

				task.spawn(function()
					local ok, via = pcall(fn74, tgt, arg3, v8, flag15)
					if not ok then
						fn17("plan: alt search error " .. tostring(via))
						return
					end

					if via and tbl4 == flag15 then
						flag15.via = via
						arg2.reroute = true
						fn17(("plan: marker unreachable from this road end, another road %.0f from it reaches: re-routing"):format(Vector3.new(via.X - tgt.X, 0, via.Z - tgt.Z).Magnitude))
					elseif tbl4 == flag15 then
						fn17("plan: no other road end reaches the marker either")
					end
				end)
			end

			if v11 then
				arg2.arriveAt = tgt
				v12 = v11
			elseif v12 and v13 < magnitude - 8 then
				arg2.arriveAt = v12[#v12]
			else
				arg2.arriveAt = v8
				v12 = nil
			end

			if v12 then
				local v14 = fn55(v12, arg3)

				if v11 then
					v14[#v14 + 1] = tgt
					v12 = v14
				else
					v12 = v14
				end
			end

			fn17(("plan: exit leg %s (%d pts), stops %.0f from the marker"):format(v11 and "reaches it" or v12 and "gets closer" or "none", v12 and #v12 or 0, Vector3.new(arg2.arriveAt.X - tgt.X, 0, arg2.arriveAt.Z - tgt.Z).Magnitude))
			return v12
		end

		local function fn76(arg2, arg3, arg4)
			local position = arg2.Position
			local v8 = fn68(arg3)
			local n13 = v8.X - position.X
			local n14 = v8.Z - position.Z
			local v9 = math.sqrt(n13 * n13 + n14 * n14)
			local lookVector = arg2.CFrame.LookVector
			local vector = Vector3.new(lookVector.X, 0, lookVector.Z)
			local unit = vector.Magnitude > 0.01 and vector.Unit or nil
			local flag15 = (arg4.climb or 2.8) <= 2

			if flag11 then
				flag15 = true
			end

			if v9 <= (flag15 and 650 or 300) then
				local v10, v11 = fn70(v8, 9)
				local v12, v13, v14 = fn54(position, arg4, v10, v11, flag15 and 1600 or 700, unit)

				if v12 then
					local v15 = fn55(v12, arg4)
					v15[#v15 + 1] = v8
					local tbl16 = {}

					for i = 1, #v15 do
						tbl16[i] = 1
					end

					fn17(("plan: direct grid route, %d pts for %.0f studs"):format(#v15, v9))

					return {
						pts = v15,
						cls = tbl16,
						arriveAt = v8,
						tgt = v8,
						roadEnd = #v15,
						exitDone = true,
						kind = "direct",
					}
				end

				if v9 <= (flag15 and 650 or 120) and v13 and v14 and v14 <= 45 then
					local v15 = fn55(v13, arg4)
					local tbl16 = {}

					for i = 1, #v15 do
						tbl16[i] = 1
					end

					fn17(("plan: close, stopping %.0f from the marker (no way closer)"):format(v14))

					return {
						pts = v15,
						cls = tbl16,
						arriveAt = v15[#v15],
						tgt = v8,
						roadEnd = #v15,
						exitDone = true,
						kind = "direct",
					}
				end
			end

			if v9 > 1000 and not fn50(v8.X, v8.Z, v8.Y) then
				task.spawn(function()
					pcall(function()
						localPlayer:RequestStreamAroundAsync(v8, 3)
					end)
				end)

				task.wait(0.6)
				fn49()
			end

			local v10 = fn67(arg2, tbl4 and tbl4.via or v8)

			if not (v10 and #v10 >= 1) then
				local v11, v12 = fn70(v8, 9)
				local v13, v14 = fn54(position, arg4, v11, v12, 900, unit)
				v14 = v13 or v14
				if not v14 then
					return nil
				end
				local v15 = fn55(v14, arg4)

				if v13 then
					v15[#v15 + 1] = v8
				end

				local tbl16 = {}

				for i = 1, #v15 do
					tbl16[i] = 1
				end

				fn17(("plan: no road graph, grid %s, %d pts"):format(v13 and "route" or "closest", #v15))

				return {
					pts = v15,
					cls = tbl16,
					arriveAt = v15[#v15],
					tgt = v8,
					roadEnd = #v15,
					exitDone = true,
					kind = "grid",
				}
			end

			local tbl16 = {}

			for i, v11 in ipairs(v10) do
				tbl16[i] = v11.position
			end

			local tbl17 = {}
			local tbl18 = {}
			local n15 = 1

			if Vector3.new(tbl16[1].X - position.X, 0, tbl16[1].Z - position.Z).Magnitude > 14 then
				local tbl19 = {}
				local n16 = 1

				local function fn77(arg5, arg6)
					local floor = math.floor
					local n17 = arg5.Z / n12 + 0.5
					local v11 = fn53(math.floor(arg5.X / n12 + 0.5), floor(n17))

					if not tbl19[v11] then
						tbl19[v11] = arg6
					end
				end

				fn77(tbl16[1], 1)
				local n17 = 0

				for i = 1, #tbl16 - 1 do
					local v11 = tbl16[i]
					local v12 = tbl16[i + 1]
					local magnitude = (v12 - v11).Magnitude
					local n18 = math.max(1, math.ceil(magnitude / 5))

					for i2 = 1, n18 do
						fn77(v11:Lerp(v12, i2 / n18), i + 1)
					end

					n16 = i + 1
					n17 += magnitude
					if not (n17 > 360) then
						continue
					end
					break
				end

				local function fn78(arg5, arg6)
					return tbl19[fn53(arg5, arg6)] ~= nil
				end

				local function fn79(arg5)
					if n16 == 1 then
						return Vector3.new(tbl16[1].X - arg5.X, 0, tbl16[1].Z - arg5.Z).Magnitude
					end
					local huge = math.huge

					for i = 1, n16 - 1 do
						local v11 = fn69(arg5, tbl16[i], tbl16[i + 1])

						if v11 < huge then
							huge = v11
						end
					end

					return huge
				end

				local v11 = fn50(position.X, position.Z, position.Y)
				local v12 = v11 and tbl12[v11.mat]
				local flag16 = false

				if v12 then
					local n18 = 350
					local n19 = nil
					local v13 = nil

					for i = 1, math.max(1, n16 - 1) do
						local v14 = tbl16[i]
						local v15 = tbl16[math.min(#tbl16, i + 1)]
						local vector2 = Vector3.new(v15.X - v14.X, 0, v15.Z - v14.Z)
						local n20 = 0

						if vector2.Magnitude > 0.5 then
							n20 = math.clamp(Vector3.new(position.X - v14.X, 0, position.Z - v14.Z):Dot(vector2) / vector2.Magnitude ^ 2, 0, 1)
						end

						local v16 = v14:Lerp(v15, n20)
						local magnitude = Vector3.new(v16.X - position.X, 0, v16.Z - position.Z).Magnitude

						if magnitude < n18 and magnitude >= 6 then
							local unit2 = Vector3.new(v16.X - position.X, 0, v16.Z - position.Z).Unit
							local y = v11.y
							local flag17 = true

							for i2 = 1, math.max(1, math.floor(magnitude / 6)) do
								local n21 = position + unit2 * i2 * 6
								local v17 = fn50(n21.X, n21.Z, y)

								if not v17 or not tbl12[v17.mat] or math.abs(v17.y - y) > 2.5 then
									flag17 = false
									break
								else
									y = v17.y
								end
							end

							if flag17 then
								n19 = n20 > 0.5 and math.min(#tbl16, i + 1)

								if n19 then
									n18 = magnitude
									v13 = v16
								else
									n18 = magnitude
									n19 = i
									v13 = v16
								end
							end
						end
					end

					if n19 then
						local v14 = fn50(v13.X, v13.Z, v13.Y)
						tbl17[#tbl17 + 1] = Vector3.new(v13.X, (v14 and v14.y or v13.Y) + 1, v13.Z)
						tbl18[#tbl18 + 1] = 0
						n15 = n19
						fn17(("plan: on tarmac already, straight onto the route %.0f ahead (node %d/%d)"):format(n18, n15, #tbl16))
						flag16 = true
					end
				end

				local flag17 = not flag16 and fn54(position, arg4, fn78, fn79, 1000, unit) or nil

				if flag17 then
					local v13 = flag17[#flag17]
					n15 = tbl19[fn53(math.floor(v13.X / n12 + 0.5), math.floor(v13.Z / n12 + 0.5))] or 1

					for _, v14 in ipairs(fn55(flag17, arg4)) do
						tbl17[#tbl17 + 1] = v14
						tbl18[#tbl18 + 1] = 1
					end

					fn17(("plan: entry leg %d pts, joins the road at node %d/%d"):format(#flag17, n15, #tbl16))
					flag16 = true
				elseif not flag16 then
					local tbl20 = {}

					for _, v13 in ipairs(fn66()) do
						local magnitude = Vector3.new(v13.Position.X - position.X, 0, v13.Position.Z - position.Z).Magnitude

						if magnitude < 700 then
							tbl20[#tbl20 + 1] = { d = magnitude, n = v13 }
						end
					end

					table.sort(tbl20, function(arg5, arg6)
						return arg5.d < arg6.d
					end)

					local tbl21 = {}

					for _, v13 in ipairs(tbl20) do
						local floor = math.floor
						local n18 = v13.n.Position.Z / n12 + 0.5
						tbl21[fn53(math.floor(v13.n.Position.X / n12 + 0.5), floor(n18))] = v13.n
					end

					local function fn80(arg5, arg6)
						return tbl21[fn53(arg5, arg6)] ~= nil
					end

					local function fn81(arg5)
						local huge = math.huge

						for i = 1, math.min(25, #tbl20) do
							local position2 = tbl20[i].n.Position
							local magnitude = Vector3.new(position2.X - arg5.X, 0, position2.Z - arg5.Z).Magnitude

							if magnitude < huge then
								huge = magnitude
							end
						end

						return huge
					end

					local flag18 = #tbl20 > 0 and fn54(position, arg4, fn80, fn81, 3000, unit) or nil

					if flag18 then
						local v13 = flag18[#flag18]
						local floor = math.floor
						local n18 = v13.Z / n12 + 0.5
						local v14 = tbl21[fn53(math.floor(v13.X / n12 + 0.5), floor(n18))]
						local part = Instance.new("Part")
						part.Anchored = true
						part.CanCollide = false
						part.Transparency = 1
						part.Size = Vector3.one
						part.CFrame = CFrame.new(v14 and v14.Position or v13)
						part.Parent = workspace
						local v15 = fn67(part, v8)
						part:Destroy()

						if v15 and #v15 >= 1 then
							v10 = v15
							tbl16 = {}

							for i, v16 in ipairs(v10) do
								tbl16[i] = v16.position
							end
						end

						n15 = 1

						for _, v16 in ipairs(fn55(flag18, arg4)) do
							tbl17[#tbl17 + 1] = v16
							tbl18[#tbl18 + 1] = 1
						end

						fn17(("plan: entry via any road: %d pts to node c%s, %d road nodes from there"):format(#flag18, v14 and v14.Name or "?", #tbl16))
						flag16 = true
					end
				end

				if not flag16 then
					local flag18 = false
					local v13

					for i = 1, math.min(6, #tbl16) do
						local exitTo = nil

						for _, v14 in ipairs({ arg4.agentR, math.max(4, arg4.agentR - 3) }) do
							v13 = PathfindingService:CreatePath({ AgentRadius = v14, AgentHeight = 6, AgentCanJump = false, WaypointSpacing = 12 })

							if pcall(function()
								v13:ComputeAsync(position + Vector3.new(0, 2, 0), tbl16[i])
							end) and v13.Status == Enum.PathStatus.Success then
								exitTo = 1
								break
							end
						end

						if exitTo == 1 then
							for _, v14 in ipairs(v13:GetWaypoints()) do
								tbl17[#tbl17 + 1] = v14.Position
								tbl18[#tbl18 + 1] = 1
							end

							n15 = i
							flag18 = true
						end

						if not flag18 then
							continue
						end
						break
					end

					if not flag18 then
						fn17("plan: no drivable way onto a road from here")
						return nil, "noentry"
					end
					fn17(("plan: entry via navmesh to node %d"):format(n15))
				end
			end

			local tbl19 = {}

			for i = n15, #tbl16 do
				tbl19[#tbl19 + 1] = tbl16[i]
			end

			local function fn77(arg5)
				local weight = v10[n15 + arg5 - 1].weight
				return type(weight) == "number" and weight >= 200 and 1 or 0
			end

			if #tbl19 < 3 then
				for i = 1, #tbl19 do
					tbl17[#tbl17 + 1] = tbl19[i]
					tbl18[#tbl18 + 1] = fn77(i)
				end
			else
				tbl17[#tbl17 + 1] = tbl19[1]
				tbl18[#tbl18 + 1] = fn77(1)

				for i = 1, #tbl19 - 1 do
					local v11 = tbl19[math.max(1, i - 1)]
					local v12 = tbl19[i]
					local v13 = tbl19[i + 1]
					local v14 = tbl19[math.min(#tbl19, i + 2)]
					local n16 = math.max(1, math.floor((v13 - v12).Magnitude / 10 + 0.5))

					for i2 = 1, n16 do
						local n17 = i2 / n16
						tbl17[#tbl17 + 1] = 0.5 * (2 * v12 + (-v11 + v13) * n17 + (2 * v11 - 5 * v12 + 4 * v13 - v14) * n17 * n17 + (-v11 + 3 * v12 - 3 * v13 + v14) * n17 * n17 * n17)
						tbl18[#tbl18 + 1] = fn77(i + 1)
					end
				end
			end

			local n16 = 0

			for i = 2, #tbl17 do
				n16 += (tbl17[i] - tbl17[i - 1]).Magnitude
			end

			local n17 = n16 + Vector3.new(v8.X - tbl16[#tbl16].X, 0, v8.Z - tbl16[#tbl16].Z).Magnitude

			if tbl4 and tbl4.offroad and v9 <= 900 and n17 > v9 * 1.7 + 30 then
				local v11 = n
				n = math.max(v11, 0.85)
				local v12, v13 = fn70(v8, 9)
				local ok, result = pcall(fn54, position, arg4, v12, v13, 3500, unit)
				ok = ok and result and fn55(result, arg4) or nil
				n = v11

				if ok then
					local n18 = 0

					for i = 2, #ok do
						n18 += (ok[i] - ok[i - 1]).Magnitude
					end

					if n18 * 1.7 < n17 then
						ok[#ok + 1] = v8
						local tbl20 = {}

						for i = 1, #ok do
							tbl20[i] = 1
						end

						fn17(("plan: off-road shortcut %.0f studs beats %.0f by road"):format(n18, n17))

						return {
							pts = ok,
							cls = tbl20,
							arriveAt = v8,
							tgt = v8,
							roadEnd = #ok,
							exitDone = true,
							kind = "offroad",
						}
					end

					fn17(("plan: off-road %.0f studs not worth it vs %.0f by road"):format(n18, n17))
				end
			end

			local tbl20 = {
				pts = tbl17,
				cls = tbl18,
				arriveAt = tbl16[#tbl16],
				tgt = v8,
				roadEnd = #tbl17,
				exitDone = false,
				kind = "road",
			}

			local v11 = tbl16[#tbl16]

			if fn50(v8.X, v8.Z, v8.Y) and fn50(v11.X, v11.Z, v11.Y) then
				tbl20.exitLeg = fn75(tbl20, arg4)
			end

			fn17(("plan: road route %d nodes, %.0f straight"):format(#tbl16, v9))
			return tbl20
		end

		local function fn77(arg2, arg3, arg4, arg5, arg6, arg7)
			local v8 = arg2[arg3]
			local v9 = arg2[math.max(1, arg3 - 1)]
			local v10 = arg2[math.min(#arg2, arg3 + 1)]
			local vector = Vector3.new(v10.X - v9.X, 0, v10.Z - v9.Z)
			if vector.Magnitude < 0.5 then
				return v8, arg5, true
			end
			local unit = vector.Unit
			local vector2 = Vector3.new(-unit.Z, 0, unit.X)
			local v11 = fn50(v8.X, v8.Z, v8.Y)
			local tbl16 = {}

			for i = -18, 18, 2 do
				tbl16[i] = fn50(v8.X + vector2.X * i, v8.Z + vector2.Z * i, v11 and v11.y or v8.Y)
			end

			local n13 = arg5 or 0
			local n14 = math.clamp(math.floor(n13 / 2 + 0.5) * 2, -18, 18)
			local v12 = tbl16[n14] or v11 or tbl16[0]
			if not v12 then
				return v8, arg5, nil
			end
			local flag15 = tbl12[v12.mat] == true

			if not flag15 then
				local v13 = nil

				for i = -18, 18, 2 do
					local v14 = tbl16[i]

					if v14 and tbl12[v14.mat] and v14.ny >= 0.8 and math.abs(v14.y - v12.y) < 6 and (not v13 or math.abs(i - n14) < math.abs(v13 - n14)) then
						v13 = i
					end
				end

				if v13 then
					v12 = tbl16[v13]
					flag15 = true
					n14 = v13
				end
			end

			local y = v12.y

			for i = -18, 18, 2 do
				local v13 = tbl16[i]

				if v13 and v13.y < y and v13.y >= v12.y - 1.2 and (not flag15 or tbl12[v13.mat]) then
					y = v13.y
				end
			end

			local function fn78(arg8)
				local v13 = tbl16[arg8]
				if not v13 or v13.ny < 0.8 or v13.y > y + arg4.step + 0.1 or v13.y < y - 3 then
					return 0
				end

				if flag15 and not tbl12[v13.mat] then
					return 0
				end

				if y + 0.2 < v13.y then
					return 1
				end
				return 2
			end

			if fn78(n14) ~= 2 then
				local v13 = nil

				for i = -18, 18, 2 do
					if fn78(i) == 2 and (not v13 or math.abs(i - n14) < math.abs(v13 - n14)) then
						v13 = i
					end
				end

				if not v13 then
					return v8, arg5, false
				end
				n14 = v13
			end

			local v13 = n14

			while v13 > -18 and fn78(v13 - 2) == 2 do
				v13 -= 2
			end

			while n14 < 18 and fn78(n14 + 2) == 2 do
				n14 += 2
			end

			local n15 = math.max(2, arg4.halfW - 0.5)
			local n16 = 2 * n15

			if n14 - v13 < n16 then
				while v13 > -18 and fn78(v13 - 2) >= 1 and n14 - v13 < n16 + 4 do
					v13 -= 2
				end

				while n14 < 18 and fn78(n14 + 2) >= 1 and n14 - v13 < n16 + 4 do
					n14 += 2
				end
			end

			local n17 = v13 + n15
			local n18 = n14 - n15

			if n18 < n17 then
				n17 = (v13 + n14) / 2
				n18 = (v13 + n14) / 2
			end

			local n19 = math.clamp(arg6 and n18 - 0.5 or arg7 and 0 or 6, n17, n18)
			local v14

			if not arg6 and n13 >= n17 and n13 <= n18 and math.abs(n19 - n13) < 4 then
				v14 = n13
			else
				v14 = n19
			end

			local n20 = math.clamp(n13 + math.clamp(v14 - n13, -2, 2), n17, n18)
			local v15 = fn47()
			local v16 = arg2[math.min(#arg2, arg3 + 1)]
			local vector3 = Vector3.new(v16.X - v8.X, 0, v16.Z - v8.Z)
			local unit2 = vector3.Magnitude > 0.5 and vector3.Unit or unit
			local n21 = 9

			local function fn79(arg8)
				local vector4 = Vector3.new(v8.X + vector2.X * arg8, y, v8.Z + vector2.Z * arg8)
				local v17 = fn50(v8.X + vector2.X * arg8 + unit2.X * n21, v8.Z + vector2.Z * arg8 + unit2.Z * n21, y)
				local n22 = unit2 * n21 + Vector3.new(0, (v17 and v17.y or y) - y, 0)
				local v18 = ipairs
				local tbl17 = {}
				local n23 = arg4.step + 0.35
				local max = math.max
				local height = arg4.height or 7
				local v19 = table.pack(max(4, height - 1.5))
				tbl17[1] = n23
				tbl17[2] = 2.6

				do
					local values = table.pack(table.unpack(v19, 1, v19.n))
					table.move(values, 1, values.n, 3, tbl17)
				end

				for _, v20 in v18(tbl17) do
					for _, v21 in ipairs({ -n15, -n15 / 2, 0, n15 / 2, n15 }) do
						local hit = workspace:Raycast(vector4 + vector2 * v21 + Vector3.new(0, v20, 0), n22, v15)

						if hit and hit.Normal.Y < 0.75 then
							local n24 = v21 < 0 and -1
							local n25

							if n24 then
								n25 = n24
							else
								n25 = v21 > 0 and 1 or 0
							end

							return false, n25
						end
					end
				end

				return true, 0
			end

			local v17, v18 = fn79(n20)
			local v19

			if not v17 then
				local n22 = v18 == 0 and (n18 - n20 >= n20 - n17 and 1 or -1) or -v18

				for i = 1, 4 do
					local n23 = math.clamp(n20 + n22 * 3 * i, n17, n18)

					if n23 ~= n20 then
						v17 = fn79(n23)

						if v17 then
							n20 = n23
							break
						else
							continue
						end
					end

					break
				end

				if not v17 then
					local n23 = (v13 + n14) / 2

					if arg4.halfW * 2 - 1.2 <= n14 - v13 + 2 then
						local v20 = fn47()
						local vector4 = Vector3.new(v8.X + vector2.X * n23, y, v8.Z + vector2.Z * n23)
						local v21 = fn50(v8.X + vector2.X * n23 + unit2.X * n21, v8.Z + vector2.Z * n23 + unit2.Z * n21, y)
						local n24 = unit2 * n21 + Vector3.new(0, (v21 and v21.y or y) - y, 0)
						local v22 = ipairs
						local tbl17 = {}
						local n25 = arg4.step + 0.35
						local max = math.max
						local height = arg4.height or 7
						local v23 = table.pack(max(4, height - 1.5))
						tbl17[1] = n25
						tbl17[2] = 2.6

						do
							local values = table.pack(table.unpack(v23, 1, v23.n))
							table.move(values, 1, values.n, 3, tbl17)
						end

						local flag16 = true

						for _, v24 in v22(tbl17) do
							for _, v25 in ipairs({ -(arg4.halfW - 1.5), 0, arg4.halfW - 1.5 }) do
								local hit = workspace:Raycast(vector4 + vector2 * v25 + Vector3.new(0, v24, 0), n24, v20)
								if hit and hit.Normal.Y < 0.75 then
									flag16 = false
									break
								end
							end

							if flag16 then
								continue
							end
							break
						end

						if flag16 then
							return Vector3.new(v8.X + vector2.X * n23, (tbl16[math.clamp(math.floor(n23 / 2 + 0.5) * 2, -18, 18)] or v12).y + 1, v8.Z + vector2.Z * n23), n23, true, true
						end
					end

					return v8, arg5, false
				end

				v19 = n20
			else
				v19 = n20
			end

			return Vector3.new(v8.X + vector2.X * v19, (tbl16[math.clamp(math.floor(v19 / 2 + 0.5) * 2, -18, 18)] or v12).y + 1, v8.Z + vector2.Z * v19), v19, true
		end

		local function fn78(arg2, arg3)
			local v8 = fn44()
			if not v8 then
				return false
			end
			local now = os.clock()

			while os.clock() - now < (arg3 or 4) do
				if not fn10() then
					break
				end
				v8 = fn44()
				if not v8 then
					break
				end
				local lookVector = v8.CFrame.LookVector
				local vector = Vector3.new(lookVector.X, 0, lookVector.Z)
				if vector.Magnitude < 0.01 then
					break
				end
				local unit = vector.Unit
				if unit:Dot(arg2) > 0.45 then
					break
				end

				if not fn61(v8, 14) then
					break
				end
				state.autoCap = 12
				local y = unit:Cross(arg2).Y
				fn40("W", false)
				fn40("S", true)

				if y > 0 then
					fn40("D", true)
					fn40("A", false)
				else
					fn40("A", true)
					fn40("D", false)
				end

				if fn42() then
					state.autoYaw = y > 0 and 0.9 or -0.9
				end

				task.wait(0.1)
			end

			fn41()
			return true
		end

		local n13 = 0

		fn28 = function(arg2, arg3, arg4, arg5)
			arg3 = arg3 or 40
			arg4 = arg4 or 75
			arg5 = arg5 or 0

			if arg5 == 0 then
				n13 = 0
				fn49()
				table.clear(tbl13)
			end

			local v8 = fn44()
			if not v8 then
				return false
			end
			local v9 = fn48(v8)
			n = v9.step >= 1.2 and 0.78 or 0.82
			local now = os.clock()

			local function fn79()
				local v10 = fn44()
				return v10 and v10.Position
			end

			local function fn80()
				local v10 = fn79()
				if not v10 then
					return 1e9
				end
				return Vector3.new(arg2.X - v10.X, 0, arg2.Z - v10.Z).Magnitude
			end

			local function fn81()
				local v10 = fn44()
				if not v10 then
					return nil
				end
				local lookVector = v10.CFrame.LookVector
				local vector = Vector3.new(lookVector.X, 0, lookVector.Z)
				return vector.Magnitude > 0.01 and vector.Unit or nil
			end

			if fn80() <= arg3 then
				return true
			end

			if tbl4 and tbl4.forceDirect then
				return fn57(arg2, arg3, arg4)
			end

			if flag12 and not tbl4 and not flag13 and tbl5.tpTractor(arg2, arg3) then
				return true
			end

			if fn80() <= (flag11 and 320 or 200) and fn51(v8.Position, arg2, v9, v9.halfW + 0.5) then
				local v10 = fn17
				local format = ("drive: straight line is clear, %.0f studs").format
				local v11 = fn80()
				v10(format("drive: straight line is clear, %.0f studs", v11))
				if fn57(arg2, arg3, math.min(arg4, math.max(20, fn80() / 8))) or fn80() <= arg3 then
					return true
				end
				v8 = fn44()
				if not v8 then
					return false
				end
			end

			local v10 = nil
			local ok, result, result2 = pcall(fn76, v8, arg2, v9)

			if ok then
				v10 = result
			else
				fn17("plan: error " .. tostring(result))
			end

			if ok and not result and result2 == "noentry" then
				if (v9.climb or 2.8) <= 2 and fn80() <= 650 then
					local v11 = fn81()

					if v11 and not fn51(v8.Position, v8.Position + v11 * 14, v9) and fn61(v8, 16) then
						fn17("drive: boxed in at the start, backing out before planning")
						local now2 = os.clock()

						while fn10() and os.clock() - now2 < 2.2 do
							state.autoCap = 10
							fn40("S", true)
							task.wait(0.05)
						end

						fn40("S", false)
						fn41()
						task.wait(0.2)
						v8 = fn44()
						if not v8 then
							return false
						end
					end

					local v12, v13 = fn70(arg2, math.max(9, arg3))
					local v14 = pcall
					local v15 = fn54
					local position = v8.Position
					local v16 = fn81()
					local v17, v18 = v14(v15, position, v9, v12, v13, 2500, v16)

					if v17 and v18 and #v18 >= 2 then
						local v19 = fn55(v18, v9)
						fn17(("drive: no road route, grid path of %d legs for the tractor"):format(#v19))

						for i = 2, #v19 do
							if not fn10() then
								return false
							end
							local flag15 = i == #v19
							if not fn57(v19[i], flag15 and arg3 or 12, 30) and not flag15 then
								break
							end
						end

						if fn80() <= arg3 + 6 then
							return true
						end
					end

					local v19 = fn17
					local format = ("drive: no route from here, tractor hop of %.0f on feelers instead").format
					local v20 = fn80()
					v19(format("drive: no route from here, tractor hop of %.0f on feelers instead", v20))
					return fn57(arg2, arg3, math.min(arg4, math.clamp(fn80() / 4 + 8, 12, 45)))
				end

				fn41()
				fn15("No drivable way onto a road from here", "warn")

				if tbl4 then
					tbl4.reason = "no drivable way onto a road from here (cliffs?)"
				end

				return false
			end

			if not v10 then
				fn17("drive: no route, short hop then re-routing")
				local v11 = fn79()

				if v11 then
					local vector = Vector3.new(arg2.X - v11.X, 0, arg2.Z - v11.Z)

					if vector.Magnitude > 1 then
						fn57(v11 + vector.Unit * math.min(45, vector.Magnitude), 20, 12)
					end
				end

				if fn80() <= arg3 then
					return true
				end

				if arg5 < 4 and os.clock() - now < arg4 and fn10() then
					return fn28(arg2, arg3, arg4 - os.clock() - now, arg5 + 1)
				end
				return false
			end

			if v10.reroute and arg5 < 4 and fn10() then
				return fn28(arg2, arg3, arg4 - os.clock() - now, arg5 + 1)
			end

			if v10.exitDone then
				pcall(fn73, v10, v9)
			end

			local v11, v12 = fn71(v10.pts, v10.cls, 12)
			local v13 = table.clone(v11)
			local n14 = #v11

			if v10.exitLeg and #v10.exitLeg >= 2 then
				local v14 = fn71(v10.exitLeg, nil, 12)

				for i = 2, #v14 do
					v11[#v11 + 1] = v14[i]
					v12[#v12 + 1] = 1
					v13[#v13 + 1] = v14[i]
				end
			end

			local arriveAt = v10.arriveAt
			local tbl16 = {}
			local tbl17 = {}
			local tbl18 = {}
			local n15 = 34

			local function fn82()
				tbl16[1] = 0

				for i = 2, #v11 do
					tbl16[i] = tbl16[i - 1] + (v11[i] - v11[i - 1]).Magnitude
				end

				local n16 = #v11

				for i = 1, n16 do
					tbl17[i] = v9.vmax
					tbl18[i] = nil
				end

				local n17 = 1

				for i = 2, n16 - 1 do
					while n17 < i - 1 and tbl16[i] - tbl16[n17 + 1] >= 12 do
						n17 += 1
					end

					local n18 = i + 1

					while n18 < n16 and tbl16[n18] - tbl16[i] < 12 do
						n18 += 1
					end

					local v14 = v13[i] or v11[i]
					local v15 = v13[n17] or v11[n17]
					local v16 = v13[n18] or v11[n18]
					local vector = Vector3.new(v14.X - v15.X, 0, v14.Z - v15.Z)
					local vector2 = Vector3.new(v16.X - v14.X, 0, v16.Z - v14.Z)

					if vector.Magnitude > 0.5 and vector2.Magnitude > 0.5 then
						local v17 = math.acos(math.clamp(vector.Unit:Dot(vector2.Unit), -1, 1))

						if v17 > 0.06 then
							local n19 = (vector.Magnitude + vector2.Magnitude) / 2 / v17 * 0.9
							tbl17[i] = n19 < tbl11.RMIN and 22 or math.clamp(n19 * tbl11.WMAX, 22, v9.vmax)
							tbl17[i] = math.max(22, math.min(tbl17[i], math.sqrt(60 * n19)))

							if v17 > 0.25 then
								tbl18[i] = vector.Unit:Cross(vector2.Unit).Y > 0
							end
						end
					end
				end

				if tbl4 then
					for i = n16, 1, -1 do
						local n18 = tbl16[n16] - tbl16[i]

						if not (n18 > 60) then
							local n19 = n18 <= 25 and 10 or 22

							if tbl17[i] > n19 then
								tbl17[i] = n19
							end

							continue
						end

						break
					end
				end

				for i = n16 - 1, 1, -1 do
					local v14 = math.sqrt(tbl17[i + 1] * tbl17[i + 1] + 2 * n15 * (tbl16[i + 1] - tbl16[i]))

					if v14 < tbl17[i] then
						tbl17[i] = v14
					end
				end
			end

			fn82()
			local n16 = tbl16[#v11] or 0
			local kind = v10.kind
			fn17(("drive: routed %d points, %.0f studs of path for %.0f straight (%s)"):format(#v11, n16, fn80(), kind))
			fn17("steer: " .. (fn42() and "controller" or tbl8.find(v8) and "wheel" or "keys (driver closure not found)"))
			local n17

			if arg5 == 0 then
				n17 = math.max(arg4, math.clamp(n16 / 20 + 40, 60, 360))
			else
				n17 = arg4
			end

			local n18 = 1
			local n19 = 1
			local now2 = os.clock()
			local drive = tbl11.DRIVE
			local tbl19 = {}
			local tbl20 = {}
			local tbl21 = {}
			local tbl22 = {}
			local v14 = nil
			local now3 = os.clock()
			local v15 = tbl5.newWatch(arg2)
			local tbl23 = nil

			local function fn83(arg6)
				local v16 = n18
				local flag15 = false

				while v16 <= #v11 and arg6 > 0 and tbl16[v16] - tbl16[n18] < 230 do
					if not tbl19[v16] and v12[v16] == 1 then
						local n20 = tbl20[v16 - 1] or v14 or 0
						local flag16 = math.abs(n20) > 2.5

						if flag16 then
							flag16 = n20 - 2.5 * (n20 > 0 and 1 or -1)
						end

						flag16 = flag16 or 0

						if flag16 ~= 0 then
							local v17 = v11[v16]
							local n21 = v11[math.min(#v11, v16 + 1)] - v17
							local vector = Vector3.new(n21.X, 0, n21.Z)

							if vector.Magnitude > 0.5 then
								local unit = vector.Unit
								v11[v16] = v11[v16] + Vector3.new(-unit.Z, 0, unit.X) * flag16
								flag15 = true
							end
						end

						tbl19[v16] = true
						tbl20[v16] = flag16
						v14 = flag16
					elseif not tbl19[v16] then
						local vector, v17, v18, v19 = fn77(v11, v16, v9, tbl20[v16 - 1] or tbl20[v16 - 2] or v14, tbl16[#v11] - tbl16[v16] < 45, v12[v16] == 1)
						arg6 -= 1

						if v18 ~= nil then
							local v20 = tbl20[v16 - 1] or tbl20[v16 - 2] or v14

							if v18 and v20 and v17 and math.abs(v17 - v20) > 3.5 then
								local n20 = v20 + 3.5 * (v17 > v20 and 1 or -1)
								local v21 = v13[v16] or v11[v16]
								local n21 = (v13[math.min(#v11, v16 + 1)] or v11[math.min(#v11, v16 + 1)]) - v21
								local vector2 = Vector3.new(n21.X, 0, n21.Z)

								if vector2.Magnitude > 0.5 then
									local unit = vector2.Unit
									local vector3 = Vector3.new(-unit.Z, 0, unit.X)
									vector = Vector3.new(v21.X + vector3.X * n20, vector.Y, v21.Z + vector3.Z * n20)
									v17 = n20
								end
							end

							tbl19[v16] = true
							tbl20[v16] = v17
							tbl22[v16] = v19 or nil
							v14 = v17

							if v18 then
								v11[v16] = vector
								flag15 = true
							else
								tbl21[v16] = true
								local v21 = fn50(v11[v16].X, v11[v16].Z, v11[v16].Y)
								fn17(("lane: point %d (%.0f,%.0f) blocked, ground=%s vlim=%.0f"):format(v16, v11[v16].X, v11[v16].Z, tostring(v21 and v21.mat), tbl17[v16] or -1))
							end
						end
					end

					v16 += 1
				end

				if flag15 then
					fn82()
				end
			end

			local function fn84(arg6, arg7, arg8)
				local tbl24 = {}
				local tbl25 = {}
				local tbl26 = {}

				for i = 1, arg6 - 1 do
					tbl24[i] = v11[i]
					tbl25[i] = v12[i]
					tbl26[i] = v13[i] or v11[i]
				end

				for _, v16 in ipairs(arg8) do
					tbl24[#tbl24 + 1] = v16
					tbl25[#tbl25 + 1] = 1
					tbl26[#tbl26 + 1] = v16
				end

				for i = arg7 + 1, #v11 do
					tbl24[#tbl24 + 1] = v11[i]
					tbl25[#tbl25 + 1] = v12[i]
					tbl26[#tbl26 + 1] = v13[i] or v11[i]
				end

				if arg7 < n14 then
					n14 += #arg8 - arg7 - arg6 + 1
				elseif arg6 <= n14 then
					n14 = arg6 + #arg8 - 1
				end

				v11 = tbl24
				v12 = tbl25
				v13 = tbl26

				for k in pairs(tbl19) do
					if arg6 <= k then
						tbl19[k] = nil
					end
				end

				for k in pairs(tbl20) do
					if arg6 <= k then
						tbl20[k] = nil
					end
				end

				for k in pairs(tbl21) do
					if k >= arg6 then
						tbl21[k] = nil
					end
				end

				for k in pairs(tbl22) do
					if arg6 <= k then
						tbl22[k] = nil
					end
				end

				fn82()
			end

			local function fn85(arg6, arg7, arg8)
				local n20 = 0
				local v16 = arg7

				while v16 < #v11 and (n20 < arg8 or tbl21[v16]) do
					v16 += 1
					n20 += (v11[v16] - v11[v16 - 1]).Magnitude
				end

				if tbl21[v16] then
					return false
				end
				local v17, v18 = fn70(v11[v16], 8)
				local v19 = fn54(arg6, v9, v17, v18, 260, fn81(), true)
				if not v19 then
					return false
				end

				if v12[arg7] == 0 then
					for _, v20 in ipairs(v19) do
						local v21 = fn50(v20.X, v20.Z, v20.Y)
						if not (v21 and tbl12[v21.mat]) then
							return false
						end
					end
				end

				local v20 = fn71(fn55(v19, v9), nil, 12)
				fn84(arg7, v16 - 1, v20)
				n18 = arg7
				n19 = n18
				now2 = os.clock()
				local unit = nil

				if #v20 >= 2 then
					local vector = Vector3.new(v20[2].X - v20[1].X, 0, v20[2].Z - v20[1].Z)
					unit = vector.Magnitude > 0.1 and vector.Unit or nil
				end

				return true, unit
			end

			local function fn86(arg6)
				local n20 = 0

				while n18 < #v11 and Vector3.new(v11[n18].X - arg6.X, 0, v11[n18].Z - arg6.Z).Magnitude < 40 and not fn63(arg6, v11[n18]) do
					n18 += 1
					n20 += 1
				end

				if n20 == 0 and n18 < #v11 then
					n18 += 1
					n20 = 1
				end

				return n20
			end

			fn83(8)
			task.wait()
			fn83(8)
			local v16 = fn79()
			local v17 = fn81()

			if v16 and v17 then
				local v18 = v11[math.min(#v11, 3)]
				local vector = Vector3.new(v18.X - v16.X, 0, v18.Z - v16.Z)

				if vector.Magnitude > 4 and v17:Dot(vector.Unit) < -0.15 then
					local flag15 = fn59(v8, 42, math.huge) == 0 and fn51(v16, v16 + v17 * 30, v9)

					if v12[1] == 1 and v17:Dot(vector.Unit) < -0.5 then
						flag15 = false
					end

					if not flag15 then
						fn17("drive: route starts behind us with no room ahead, backing round first")
						fn78(vector.Unit, 4)
					end
				end
			end

			local v18 = nil
			local n20 = 0
			local flag15 = false
			local flag16 = false
			local n21 = 0
			local n22 = 0
			local n23 = 0
			local n24 = 0
			local n25 = 0
			local n26 = 0
			local n27 = 0
			local n28 = 0
			local n29 = 0
			local now4 = nil
			local n30 = 0
			local now5 = nil
			local v19

			while fn10() and os.clock() - now < n17 do
				local v20 = fn44()

				if not (v20 and fn26()) then
					local now6 = v18 or os.clock()

					if os.clock() - now6 > 1.5 or not v20 then
						fn17("drive: seat lost, stopping")

						if tbl4 then
							tbl4.reason = "left the vehicle"
						end

						fn41()
						return false
					end

					task.wait(0.1)
					v18 = now6
					continue
				end

				local position = v20.Position

				if v10.reroute then
					fn41()
					if arg5 < 4 and fn10() then
						return fn28(arg2, arg3, n17 - os.clock() - now, arg5 + 1)
					end
					return false
				end

				if fn80() <= arg3 and not v10.bay then
					if not flag11 then
						fn45()
					end

					return true
				end

				if v10.bay and v10.bay.p2 and not v10.bay.turning then
					local bay = v10.bay
					local vector = Vector3.new(bay.p2.X - position.X, 0, bay.p2.Z - position.Z)

					if bay.p2Idx == nil or bay.p2N ~= #v11 then
						bay.p2Idx = nil
						bay.p2N = #v11
						local n31 = 4

						for i = 1, #v11 do
							local magnitude = Vector3.new(v11[i].X - bay.p2.X, 0, v11[i].Z - bay.p2.Z).Magnitude

							if magnitude < n31 then
								bay.p2Idx = i
								n31 = magnitude
							end
						end
					end

					if (bay.p2Idx and n18 >= bay.p2Idx - 1 or n18 >= #v11 - 1 or vector.Magnitude < 30) and vector.Magnitude < 32 then
						bay.turning = true
						local n31 = -bay.open
						local n32 = n31:Cross(fn81() or bay.travel).Y > 0 and -1 or 1
						fn17("park: lining up")

						local function fn87()
							local v21 = fn44()
							if not v21 then
								return nil
							end
							local lookVector = v21.CFrame.LookVector
							local vector2 = Vector3.new(lookVector.X, 0, lookVector.Z)
							return vector2.Magnitude > 0.01 and vector2.Unit or nil
						end

						local function fn88(arg6)
							local now6 = os.clock()

							while true do
								if fn10() and os.clock() - now6 < arg6 then
									local v21 = fn44()

									if v21 then
										local position2 = v21.Position

										if not (Vector3.new(bay.p2.X - position2.X, 0, bay.p2.Z - position2.Z):Dot(bay.travel) <= 0.5) then
											fn60(v21, bay.p2 + bay.travel * 30, 11 + 3 * math.clamp(Vector3.new(bay.p2.X - position2.X, 0, bay.p2.Z - position2.Z).Magnitude / 20, 0, 1), false, nil, 0, true, nil, 30)
											task.wait(0.05)
											continue
										end
									end
								end

								break
							end
						end

						local now6 = os.clock()

						for i = 1, 3 do
							if i > 1 and os.clock() - now6 > 14 then
								fn17("park: out of time, leaving it here")
								break
							else
								if i == 1 then
									if not bay.direct then
										fn88(4)
									end
								else
									local v21 = fn87()

									if v21 and v21:Dot(bay.travel) < 0.6 then
										fn78(bay.travel, 2.6)
									end

									fn88(2.5)
								end

								if i == 1 then
									fn17("park: turning in")
								end

								local now7 = os.clock()

								while true do
									if fn10() and os.clock() - now7 < 5 then
										local v21 = fn44()
										local v22 = fn87()

										if v21 and v22 then
											if not ((bay.direct and i == 1 and 0.9 or 0.985) < v22:Dot(n31)) then
												state.autoCap = 11
												fn40("W", fn42() or v21.AssemblyLinearVelocity.Magnitude < 11)
												fn40("S", false)

												if fn42() then
													state.autoYaw = n32 * 1.3

													if tbl8.find(v21) then
														tbl8.set(v21, n32)
													end
												elseif tbl8.find(v21) then
													tbl8.set(v21, n32)
												else
													fn40("A", n32 > 0)
													fn40("D", n32 < 0)
												end

												task.wait(0.05)
												continue
											end
										end
									end

									break
								end

								local v21 = fn87()

								if fn44() and v21 and v21:Dot(n31) > 0.9 then
									local now8 = os.clock()
									local stop = bay.stop or bay.center
									local vector2 = Vector3.new(-n31.Z, 0, n31.X)

									local function fn89()
										local v22 = fn44()
										if not v22 then
											return 99, 0
										end
										local lookVector = v22.CFrame.LookVector
										local vector3 = Vector3.new(lookVector.X, 0, lookVector.Z)
										return math.abs((stop - v22.Position):Dot(vector2)), vector3.Magnitude > 0.01 and vector3.Unit:Dot(n31) or 0
									end

									while true do
										if fn10() and os.clock() - now8 < 6 then
											local v22 = fn44()

											if v22 then
												local position2 = v22.Position
												local v23 = (stop - position2):Dot(n31)
												local magnitude = v22.AssemblyLinearVelocity.Magnitude
												math.abs((stop - position2):Dot(vector2))

												if not (v23 <= 0.8 or magnitude < 1 and v23 < 3) then
													local n33 = math.clamp(4 + v23 * 0.7, 4, 12)

													if v23 < (fn42() and 1.6 or magnitude * 0.45 + 1.5) then
														fn40("W", false)
														fn40("S", true)
														state.autoYaw = 0

														if tbl8.find(v22) then
															tbl8.set(v22, 0)
														end
													else
														fn40("S", false)
														fn60(v22, stop + n31 * 25 - vector2 * math.clamp((position2 - stop):Dot(vector2) * 1.5, -6, 6), n33, false, nil, 0, true, nil, 30)
													end

													task.wait(0.05)
													continue
												end
											end
										end

										break
									end

									fn40("S", false)
									local v22, v23 = fn89()

									if not (v22 < 6 and v23 > 0.85 or i >= 3) then
										fn17(("park: in but crooked (off %.1f, %.0fdeg), backing out to retry"):format(v22, math.deg(math.acos(math.clamp(v23, -1, 1)))))
										fn40("W", false)
										fn40("A", false)
										fn40("D", false)
										state.autoYaw = 0

										if tbl8.find(fn44()) then
											tbl8.set(fn44(), 0)
										end

										continue
									end
								else
									fn17("park: missed the mouth, backing out to retry")
									fn40("W", false)
									fn40("A", false)
									fn40("D", false)
									state.autoYaw = 0

									if tbl8.find(fn44()) then
										tbl8.set(fn44(), 0)
									end

									continue
								end
							end

							break
						end

						fn45()

						pcall(function()
							local v21 = fn44()
							if not v21 then
								return
							end
							local lookVector = v21.CFrame.LookVector
							local unit = Vector3.new(lookVector.X, 0, lookVector.Z).Unit
							local v22 = n31
							local n33 = n31

							if unit:Dot(n31) < 0 then
								n33 = -v22
							end

							local stop = bay.stop or bay.center
							local deg = math.deg
							local v23 = table.pack(math.acos(math.clamp(unit:Dot(n33), -1, 1)))
							fn17(("park: final pose %.0fdeg off, %.1f from the spot"):format(deg(table.unpack(v23, 1, v23.n)), Vector3.new(v21.Position.X - stop.X, 0, v21.Position.Z - stop.Z).Magnitude))
						end)

						fn17("drive: parked")
						return true
					end
				end

				if v10.bay and n18 >= #v11 - 2 and Vector3.new(v10.bay.center.X - position.X, 0, v10.bay.center.Z - position.Z).Magnitude <= 5 then
					fn45()
					fn17("drive: parked")
					return true
				end

				if os.clock() - now3 > 8 then
					fn49()
					now3 = os.clock()
				end

				if not v2.IS_MOBILE and os.clock() - n20 > 0.5 then
					n20 = os.clock()
					local v21 = tbl8.conn and tbl9.v
					local v22 = ipairs
					local tbl24 = v21 and { "W", "S" } or { "W", "A", "S", "D" }

					for _, v23 in v22(tbl24) do
						if v2.markSyntheticKey then
							v2.markSyntheticKey(Enum.KeyCode[v23])
						end

						pcall(function()
							VirtualInputManager:SendKeyEvent(tbl7[v23] and true or false, Enum.KeyCode[v23], false, game)
						end)
					end
				end

				fn83(2)

				if not v10.exitDone and not flag15 and tbl16[#v11] - tbl16[math.min(n18, #v11)] < 320 then
					local tgt = v10.tgt

					if fn50(tgt.X, tgt.Z, tgt.Y) or tbl16[#v11] - tbl16[math.min(n18, #v11)] < 60 then
						task.spawn(function()
							local ok2, result3 = pcall(fn75, v10, v9)
							tbl23 = { leg = ok2 and result3 or nil }
						end)

						flag15 = true
					end
				end

				if tbl23 then
					local leg = tbl23.leg
					tbl23 = nil
					arriveAt = v10.arriveAt

					if v10.reroute then
						fn41()
						if arg5 < 4 and fn10() then
							return fn28(arg2, arg3, n17 - os.clock() - now, arg5 + 1)
						end
						return false
					end

					if leg and #leg >= 2 then
						v10.exitLeg = leg
						pcall(fn73, v10, v9, true)
						local exitLeg = v10.exitLeg
						arriveAt = v10.arriveAt

						for i = #v11, n14 + 1, -1 do
							v11[i] = nil
							v12[i] = nil
							v13[i] = nil
							tbl19[i] = nil
							tbl20[i] = nil
							tbl21[i] = nil
							tbl22[i] = nil
						end

						local v21 = fn71(exitLeg, nil, 12)

						for i = 2, #v21 do
							v11[#v11 + 1] = v21[i]
							v12[#v12 + 1] = 1
							v13[#v13 + 1] = v21[i]
						end

						fn82()
					end
				end

				local magnitude = v20.AssemblyLinearVelocity.Magnitude
				local v21 = n18
				local n31 = math.max(90, magnitude * 2.5)
				local n32 = 0
				local huge = math.huge

				for i = n18, #v11 do
					local magnitude2

					if not (n18 < i) then
						magnitude2 = Vector3.new(v11[i].X - position.X, 0, v11[i].Z - position.Z).Magnitude

						if magnitude2 < huge then
							huge = magnitude2
							v21 = i
						end

						continue
					else
						n32 += (v11[i] - v11[i - 1]).Magnitude

						if not (n31 < n32) then
							magnitude2 = Vector3.new(v11[i].X - position.X, 0, v11[i].Z - position.Z).Magnitude

							if magnitude2 < huge then
								huge = magnitude2
								v21 = i
							end

							continue
						end
					end

					break
				end

				n18 = v21

				if huge < 30 then
					flag16 = true
				end

				if n19 < n18 then
					n19 = n18
					now2 = os.clock()
				end

				if flag9 and tbl5.tick(v15, position) then
					tbl5.escape(v11[math.min(n18 + 2, #v11)] or arg2)
					now2 = os.clock()
					n21 = 0
					n22 = 0
				end

				if n18 >= #v11 - 1 and not v10.bay and Vector3.new(arriveAt.X - position.X, 0, arriveAt.Z - position.Z).Magnitude <= math.max(arg3, 40) then
					if not flag11 then
						fn45()
					end

					local v22 = fn17
					local format = ("drive: reached end of route, %.0f from target").format
					local v23 = fn80()
					v22(format("drive: reached end of route, %.0f from target", v23))
					return true
				end

				local flag17 = flag16 and huge > 120

				if flag17 then
					flag17 = os.clock() - (n13 or 0) > 8
				end

				if flag17 then
					fn41()

					if arg5 < 4 and fn10() then
						n13 = os.clock()
						fn17(("drive: %.0f off route, re-planning"):format(huge))
						return fn28(arg2, arg3, n17 - os.clock() - now, arg5 + 1)
					end

					return false
				end

				if os.clock() - n23 > 4 then
					local v22 = n18
					local n33 = 0

					while v22 < #v11 and n33 < 110 and not tbl21[v22] do
						v22 += 1
						n33 += (v11[v22] - v11[v22 - 1]).Magnitude
					end

					local flag18 = tbl21[v22]

					if flag18 then
						flag18 = (tbl17[v22] or 99) <= 22
					end

					if flag18 then
						fn17(("drive: blocked point %d sits in a bend, taking it slowly instead of detouring"):format(v22))
						tbl21[v22] = nil
						tbl19[v22] = true
						n24 = os.clock() + 4
						n23 = os.clock()
						drive = 24
					elseif tbl21[v22] then
						n23 = os.clock()
						fn17(("drive: route blocked %.0f ahead, planning round it"):format(n33))

						if not fn85(position, n18, n33 + 30) then
							if n33 < 40 and n25 < 1 then
								n25 += 1
								n26 = os.clock() + 2.5
								tbl21[v22] = nil
								tbl19[v22] = nil
								fn17("drive: no way round, brief wait in case it is moving traffic")
							else
								fn17(("drive: no way round found, slowing to the feelers for the next %.0f"):format(n33 + 30))
								tbl21[v22] = nil
								local v23 = v22

								while v23 < #v11 and tbl16[v23] - tbl16[v22] < 30 do
									v23 += 1
								end

								for i = n18, v23 do
									if (tbl17[i] or v9.vmax) > 34 then
										tbl17[i] = 34
									end
								end

								for i = v23 - 1, math.max(1, n18), -1 do
									local v24 = math.sqrt(tbl17[i + 1] * tbl17[i + 1] + 2 * n15 * (tbl16[i + 1] - tbl16[i]))

									if v24 < (tbl17[i] or v9.vmax) then
										tbl17[i] = v24
									end
								end
							end
						end
					end
				end

				local n33 = math.clamp(magnitude * 1.05, 34, 115)

				if v10.bay and tbl16[#v11] - tbl16[n18] < 70 then
					n33 = 14
				end

				if v12[n18] == 1 and not v10.bay then
					local n34 = math.clamp(magnitude * 1.15, 20, 70)

					if tbl22[n18] or tbl22[math.min(#v11, n18 + 1)] or tbl22[math.min(#v11, n18 + 2)] then
						n34 = 16
					end

					if not ((v9.climb or 2.8) <= 2) then
						n33 = n34
					else
						n33 = math.max(n34, 45)
					end
				end

				local v22 = v11[n18]
				local v23 = n18
				local n34 = 0

				while v23 < #v11 and n34 < n33 do
					n34 += (v11[v23 + 1] - v11[v23]).Magnitude
					v23 += 1
					v22 = v11[v23]
				end

				if n18 < #v11 and huge > 2 and huge < 30 and magnitude > 12 then
					local v24 = v11[n18]
					local n35 = v11[math.min(#v11, n18 + 1)] - v24
					local vector = Vector3.new(n35.X, 0, n35.Z)

					if vector.Magnitude > 0.5 then
						local unit = vector.Unit
						local vector2 = Vector3.new(-unit.Z, 0, unit.X)
						local v25 = (position - v11[n18]):Dot(vector2)
						local n36 = math.abs(v25) - 2

						if n36 > 0 then
							v22 += vector2 * math.min(n36 * 0.9 * math.clamp(30 / math.max(magnitude, 1), 0.35, 1), 8) * (v25 > 0 and -1 or 1)
						end
					end
				end

				local vmax = v9.vmax
				local n35 = math.min(tbl17[n18] or vmax, tbl17[math.min(#v11, n18 + 1)] or vmax, vmax)
				local v24 = n18

				while true do
					local flag18 = v24 < #v11 and tbl16[v24] - tbl16[n18] < magnitude * 1.3 + 12
					v19 = nil

					if flag18 then
						if tbl18[v24] ~= nil then
							v19 = tbl18[v24]
							break
						else
							v24 += 1
							continue
						end
					end

					break
				end

				if v12[n18] == 1 or v12[v23] == 1 then
					local v25 = fn50(position.X, position.Z, position.Y)
					local v26 = fn50(v22.X, v22.Z, v22.Y)
					n35 = math.min(n35, v25 and tbl12[v25.mat] and v26 and tbl12[v26.mat] and 70 or 65)
				end

				local n36 = math.min(n35 * (flag11 and 1.15 or 1.08), vmax)

				if n36 < vmax then
					n24 = os.clock() + 0.3
					drive = n36
				end

				local n37

				if os.clock() < n24 then
					n37 = math.min(n36, drive)
				else
					n37 = n36
				end

				local v25 = fn81()
				local vector = Vector3.new(v22.X - position.X, 0, v22.Z - position.Z)

				if v25 and vector.Magnitude > 4 and v25:Dot(vector.Unit) < -0.2 and huge > 10 and magnitude < 9 and os.clock() - n27 > 5 then
					n27 = os.clock()
					fn17("drive: overshot, aim is behind us, backing round")
					fn78(vector.Unit, 3.5)
					now2 = os.clock()
				end

				if v25 and magnitude < 22 and magnitude > 3 and huge > 18 and os.clock() - n27 > 6 then
					if huge > n28 + 0.3 and math.abs(n29) > 0.85 then
						now4 = now4 or os.clock()

						if os.clock() - now4 > 3 then
							n27 = os.clock()
							fn17(("drive: circling at full lock (%.0f off the line), backing round instead"):format(huge))

							if vector.Magnitude > 1 then
								fn78(vector.Unit, 4)
							end

							now2 = os.clock()
							now4 = nil
						end
					else
						now4 = nil
					end
				else
					now4 = nil
				end

				if os.clock() < n26 then
					fn40("W", false)
					fn40("A", false)
					fn40("D", false)
					fn40("S", magnitude > 3)

					if not tbl21[n18] and not tbl21[n18 + 1] and not tbl21[n18 + 2] then
						local flag18 = true

						for i = n18, math.min(#v11, n18 + 6) do
							if tbl21[i] then
								flag18 = false
								break
							end
						end

						if flag18 and tbl19[n18 + 2] then
							n26 = 0
						end
					end

					now2 = os.clock()
					task.wait(0.1)
					v18 = nil
					n28 = huge
					continue
				end

				if tbl22[n18] or tbl22[v23] or tbl22[math.min(#v11, n18 + 2)] then
					n37 = math.min(n37, 20)
				end

				local n38

				if v10.bay and tbl16[#v11] - tbl16[n18] < 70 then
					n38 = math.min(n37, 15)
				else
					n38 = n37
				end

				local flag18 = huge < 8 and tbl19[n18] and not tbl21[n18] and not tbl21[n18 + 1]
				local n39 = v9.halfW + 2

				local function fn87(arg6)
					local n40 = math.min(#v11 - 1, n18 + math.max(9, math.ceil(magnitude * 1.9 / 12) + 1))

					for i = math.max(1, n18 - 1), n40 do
						if fn69(arg6, v11[i], v11[i + 1]) <= n39 then
							return true
						end
					end

					return false
				end

				local v26 = fn81()
				local n40 = nil

				if v26 then
					local v27 = n18

					while true do
						if v27 < #v11 and tbl16[v27] - tbl16[n18] < 90 then
							local vector2 = Vector3.new(v11[v27 + 1].X - v11[v27].X, 0, v11[v27 + 1].Z - v11[v27].Z)
							if not (vector2.Magnitude > 0.5 and v26:Dot(vector2.Unit) < 0.82) then
								v27 += 1
								continue
							end
						end

						break
					end

					n40 = tbl16[v27] - tbl16[n18] + v9.halfL + 6
				end

				local v27 = fn60(v20, v22, n38, true, v19, 0.45, flag18, fn87, n40)
				n29 = v27 or 0

				if os.clock() - (n30 or 0) > 0.5 then
					n30 = os.clock()

					if tbl4 and v2.driveHudUpdate then
						local str4

						if os.clock() < n26 then
							str4 = "Waiting for a gap"
						elseif tbl22[n18] or tbl22[math.min(#v11, n18 + 2)] then
							str4 = "Squeezing through"
						elseif v10.bay and tbl16[#v11] - tbl16[n18] < 60 then
							str4 = "Parking"
						elseif v12[n18] == 1 then
							str4 = "Off road"
						elseif magnitude < 8 and n38 >= 30 then
							str4 = "Setting off"
						else
							str4 = "Following road"

							if n38 < vmax - 8 then
								str4 = "Slowing for a bend"
							end
						end

						pcall(v2.driveHudUpdate, tbl4.name, tbl16[#v11] - tbl16[n18], n16, magnitude, str4)
					end

					local v28 = fn59(v20, math.max(40, magnitude), math.huge)
					local y = v20.CFrame.LookVector.Y

					if math.abs(y) > 0.1 then
						fn17(("slope: pitch=%.2f cross=%.2f avoid=%d hit=%s lo=%s off=%.0f"):format(y, v27 or 0, v28, tostring(tbl8.lastHit), tostring(tbl20[n18]), huge))
					end

					local function fn88(arg6)
						local v29 = fn50(arg6.X, arg6.Z, arg6.Y)
						if not v29 then
							return "VOID"
						end
						return tostring(v29.mat):gsub("Enum.Material.", "")
					end

					local n41 = v22 - position
					local vector2 = Vector3.new(n41.X, 0, n41.Z)

					local function fn89()
						local config = v20.Parent and v20.Parent:FindFirstChild("Config")
						config = config and config:FindFirstChild("Steer")
						return config and config.Value or -99
					end

					local v29 = fn89()
					fn17(("dbg (%.0f,%.0f) spd=%.0f gap=%.0f aimD=%.0f off=%.0f cross=%.2f avoid=%d tr=%s cap=%d w=%d i=%d/%d lo=%s sa=%s k=%s%s%s%s yaw=%s/%.2f wh=%s in=%s%s st=%d bst=%s eng=%s here=%s aim=%s"):format(position.X, position.Z, magnitude, fn80(), vector2.Magnitude, huge, v27, v28, huge < 8 and tbl19[n18] and "1" or "0", n38, n21, n18, #v11, tostring(tbl20[n18]), fn56(v20, math.max(30, magnitude * 1.4)) and "1" or "0", tbl7.W and "W" or "-", tbl7.S and "S" or "-", tbl7.A and "A" or "-", tbl7.D and "D" or "-", state.autoYaw and ("%.2f"):format(state.autoYaw) or "nil", v20.AssemblyAngularVelocity.Y, tbl8.fn and ("%.2f"):format(tbl8.want) or "-", state.wHeld and "W" or "-", state.sHeld and "S" or "-", v29, tostring(state.boost and state.boost.Enabled), tostring(state.activeVehicle ~= nil), fn88(position), fn88(v22)))
				end

				if v20.CFrame.LookVector.Y > 0.35 then
					now5 = now5 or os.clock()
				else
					now5 = nil
				end

				if magnitude < 2.5 and os.clock() - now2 > 1.7 or now5 and os.clock() - now5 > 0.6 then
					if now5 and os.clock() - now5 > 0.6 then
						fn17("drive: nose up, climbing something: treating as wedged")
						now5 = nil
					end

					if v20.CFrame.LookVector.Y <= 0.25 and Vector3.new(arriveAt.X - position.X, 0, arriveAt.Z - position.Z).Magnitude <= math.max(arg3, 45) then
						if not flag11 then
							fn45()
						end

						fn17("drive: as close as it can drive")
						return true
					end

					n21 += 1
					fn52(position + (fn81() or Vector3.new(0, 0, 1)) * v9.halfL)
					fn17(("drive: stuck at (%.0f,%.0f), backing out (%d)"):format(position.X, position.Z, n21))

					if tbl4 and v2.driveHudUpdate then
						pcall(v2.driveHudUpdate, tbl4.name, tbl16[#v11] - tbl16[n18], n16, 0, "Backing out")
					end

					fn62(v27)
					local v28 = fn79() or position

					if (v28 - position).Magnitude < 2 then
						n22 += 1
					else
						n22 = 0
					end

					local flag19 = false

					pcall(function()
						local config = v20.Parent and v20.Parent:FindFirstChild("Config")
						local on = config and config:FindFirstChild("On")
						config = config and config:FindFirstChild("Fuel")

						if on and on.Value == false or config and config.Value <= 0 or v20.Parent:GetAttribute("Totaled") then
							flag19 = true
						end
					end)

					if n22 >= 2 and (flag19 or n22 >= 4) then
						fn41()
						fn17("drive: not moving in either direction, no drive power. stopping")
						fn15("Stopped: the vehicle isn't moving (damaged or no fuel?)", "warn")

						if tbl4 then
							tbl4.reason = "the vehicle isn't moving (damaged or no fuel?)"
						end

						return false
					end

					local v29, v30 = fn85(v28, n18, 55)

					if v29 then
						fn17("drive: detour round the jam spliced in")
						local v31 = fn81()

						if v30 and v31 and v31:Dot(v30) < 0.7 then
							fn78(v30, 3)
						end
					else
						fn86(v28)
					end

					now2 = os.clock()

					if n21 >= 3 then
						if not fn65(v22, n22 >= 2) then
							fn41()
							if arg5 < 4 and fn10() then
								fn17("drive: wedged 3x, re-planning the route")
								return fn28(arg2, arg3, n17 - os.clock() - now, arg5 + 1)
							end
							return false
						end

						now2 = os.clock()
						n21 = 0
						n22 = 0
					end
				end

				task.wait(0.1)
				v18 = nil
				n28 = huge
			end

			if fn80() <= arg3 then
				return true
			end
			return fn57(arg2, arg3, math.max(10, n17 - os.clock() - now))
		end

		local function fn79(arg2, arg3, arg4, arg5, arg6)
			local n14 = arg3 > arg2 and 1 or -1
			local v8 = fn44()
			if not v8 then
				return false
			end
			fn17(("row: %.0f -> %.0f at z %.0f, from (%.0f,%.0f)"):format(arg2, arg3, arg4, v8.Position.X, v8.Position.Z))
			local now = os.clock()
			local now2 = os.clock()
			local huge = math.huge

			while true do
				local flag15 = fn10()

				if flag15 then
					flag15 = os.clock() - now < (arg6 or 20)
				end

				if flag15 then
					local v9 = fn44()
					if not v9 then
						fn41()
						return false
					end

					if not fn26() then
						fn41()
						return false
					end
					local position = v9.Position
					local n15 = (arg3 - position.X) * n14

					if n15 <= 0 then
						fn41()
						fn46()
						return true
					end

					if n15 < huge - 1 then
						now2 = os.clock()
						huge = n15
					end

					if os.clock() - now2 > 2 and v9.AssemblyLinearVelocity.Magnitude < 1.5 and n15 < 40 then
						fn17(("crops: row blocked %.0f short of its end, calling it"):format(n15))
						fn41()
						return true
					end

					if os.clock() - now2 > 6 then
						fn41()
						return false
					end
					local n16 = math.clamp(-(position.Z - arg4) * 1.2, -10, 10)
					fn60(v9, Vector3.new(position.X + n14 * math.min(n15, 22), arg5, arg4 + n16), 12)
					task.wait(0.1)
					continue
				end

				break
			end

			fn41()
			return false
		end

		local function fn80(arg2)
			local v8 = fn38(arg2)
			local trailer = v8 and v8:FindFirstChild("Config") and v8.Config:FindFirstChild("Trailer")
			return trailer and trailer.Value ~= nil and true or false
		end

		local function fn81()
			if fn80() then
				fn17("attach: already on")
				return true
			end
			fn15("Getting the harvester", "info")
			tbl3.fstat("fetching the harvester")

			local function fn82(arg2)
				if not arg2 then
					return nil
				end
				local interact = arg2:FindFirstChild("Interact")
				if interact and interact:IsA("ProximityPrompt") then
					return interact
				end

				for _, descendant in ipairs(arg2:GetDescendants()) do
					if descendant:IsA("ProximityPrompt") then
						return descendant
					end
				end

				return nil
			end

			local n14 = 0

			for i = 1, 6 do
				if fn80() then
					break
				end

				if not fn10() then
					return false
				end
				local v8 = fn58()
				if not v8 then
					fn17("attach: no harvester in world")
					return false
				end
				local maxActivationDistance = fn82(v8)
				local worldPosition = fn33(maxActivationDistance and maxActivationDistance.Parent or v8)
				if not worldPosition then
					fn17("attach: harvester has no position")
					return false
				end
				local v9 = fn44()
				local magnitude = v9 and worldPosition and (v9.Position - worldPosition).Magnitude or 999

				if fn13() and worldPosition then
				end

				if magnitude > 72 then
					fn17(string.format("attach: tractor is %.0f away, bringing it over", magnitude))

					if fn39() then
						local v10 = fn48(fn44())
						local position = fn44() and fn44().Position or worldPosition
						local vector = nil
						local huge = math.huge

						for i2 = 0, 35 do
							if not (vector and i2 % 12 == 0) then
								local n15 = i2 % 12 * 3.1415926535897931 / 6
								local sin = math.sin
								local vector2 = Vector3.new(math.cos(n15), 0, sin(n15))
								local n16 = worldPosition + vector2 * ({ 58, 75, 95 })[math.floor(i2 / 12) + 1]
								local v11 = fn50(n16.X, n16.Z, worldPosition.Y)
								local flag15

								if v11 then
									local y = v11.y
									flag15 = tbl5.landing(Vector3.new(n16.X, v11.y, n16.Z), y) ~= nil
								else
									flag15 = v11
								end

								if flag15 then
									for i3 = 0, 7 do
										local n17 = i3 * 3.1415926535897931 / 4
										local v12 = workspace
										local vector3 = Vector3.new
										local sin2 = math.sin
										if v12:Raycast(Vector3.new(n16.X, v11.y + 3, n16.Z), vector3(math.cos(n17), 0, sin2(n17)) * 12, fn47()) then
											flag15 = false
											break
										end
									end
								end

								flag15 = v11 and flag15

								if flag15 then
									local halfW = v10.halfW
									flag15 = fn51(worldPosition + vector2 * 10, Vector3.new(n16.X, v11.y + 1, n16.Z), v10, halfW)
								end

								if flag15 then
									local magnitude2 = Vector3.new(n16.X - position.X, 0, n16.Z - position.Z).Magnitude

									if magnitude2 < huge then
										vector = Vector3.new(n16.X, v11.y + 1, n16.Z)
										huge = magnitude2
									end
								end

								continue
							end

							break
						end

						vector = vector or worldPosition
						local v11 = fn48(fn44())
						local n15 = vector == worldPosition and 26 or 8
						local flag15 = fn44()
						local flag16 = magnitude <= 150

						if flag15 then
							if flag16 then
								flag15 = flag16
							else
								flag15 = magnitude <= 400 and fn51(flag15.Position, vector, v11, v11.halfW + 0.5)
							end
						end

						local v12

						if flag15 then
							v12 = fn57(vector, n15, math.clamp(magnitude / 5 + 6, 10, 60))

							if not v12 and flag16 then
								local v13 = fn44()

								if not (v13 and (v13.Position - worldPosition).Magnitude <= 72) then
									v12 = fn57(vector, n15, math.clamp(magnitude / 5 + 6, 10, 40))
								end
							end
						else
							v12 = fn28(vector, n15, math.clamp(magnitude / 8, 20, 90))
						end

						if not v12 and not flag16 then
							local v13 = fn44()

							if not (v13 and (v13.Position - worldPosition).Magnitude <= 72) then
								fn28(vector, n15, math.clamp(magnitude / 8, 20, 90))
							end
						end
					end

					local v10 = fn44()
					local magnitude2 = v10 and worldPosition and (v10.Position - worldPosition).Magnitude or 999

					if magnitude2 > 76 then
						n14 += 1
						fn17(string.format("attach: still %.0f short, re-routing (%d)", magnitude2, n14))

						if n14 >= 2 then
							tbl5.escape(worldPosition)
							n14 = 0
						end

						task.wait(0.5)
						continue
					end
				end

				fn27()
				local parent = maxActivationDistance and maxActivationDistance.Parent and fn33(maxActivationDistance.Parent) or worldPosition
				maxActivationDistance = maxActivationDistance and maxActivationDistance.MaxActivationDistance or 10
				local v10 = tbl5.toolSpot(parent, v8, maxActivationDistance)
				local flag15

				if v10 then
					local v11 = tbl3.algorithms()

					if flag12 and v11 and type(v11.charPivotTo) == "function" then
						local vector = Vector3.new(parent.X, v10.Y, parent.Z)

						pcall(function()
							local cframe = CFrame.lookAt
							v11.charPivotTo(fn12(), cframe(v10, vector))
						end)

						if fn20 then
							fn20()
						end

						task.wait(0.5)
					else
						tbl5.getDown(worldPosition.Y, v10)
						fn25(v10, 2, 25)
					end

					local v12 = fn13()
					flag15 = v12 ~= nil and (v12.Position - parent).Magnitude <= math.max(3, maxActivationDistance - 3)
					fn17(("attach: stand spot %s, %.0f from the prompt"):format(flag15 and "reached" or "missed", v12 and (v12.Position - parent).Magnitude or -1))
				else
					fn17("attach: no clear stand spot by the prompt, old walk-in")
					flag15 = false
				end

				if not flag15 then
					tbl5.getDown(worldPosition.Y, worldPosition)
					local v11 = fn14()
					local v12 = tbl5.openSides(worldPosition, 14, 2.5, v8)
					fn17(("attach: %d open sides to the tool"):format(#v12))
					local v13, v14, v15 = ipairs(v12)
					local n15 = 0
					local flag16 = false

					for _, v16 in v13, v14, v15 do
						n15 += 1

						if not (n15 > 4) then
							fn32(v16.point, 3)
							local now = os.clock()
							local now2 = os.clock()
							local position = nil

							while true do
								if v11 and os.clock() - now < 6 then
									local v17 = fn13()

									if v17 then
										if (v17.Position - worldPosition).Magnitude <= 6 then
											flag16 = true
											break
										else
											if position and (v17.Position - position).Magnitude > 1.5 then
												position = v17.Position
												now2 = os.clock()
											else
												position = position or v17.Position
											end

											if os.clock() - now2 > 2 then
												fn17("attach: wedged on this side, trying the next")
												break
											else
												v11:MoveTo(worldPosition)
												task.wait(0.1)
												continue
											end
										end
									end
								end

								break
							end

							if not flag16 then
								continue
							end
						end

						break
					end

					if fn13() and (fn13().Position - worldPosition).Magnitude > 8 then
						fn32(worldPosition, 7)
					end
				end

				local v11 = fn58()
				local v12 = fn82(v11)
				local maxActivationDistance2 = v12 and v12.MaxActivationDistance or 10

				if v12 and v12.Parent then
					if v12.Parent:IsA("Attachment") then
						worldPosition = v12.Parent.WorldPosition
					elseif v12.Parent:IsA("BasePart") then
						worldPosition = v12.Parent.Position
					end
				end

				local n15 = math.max(3, maxActivationDistance2 - 3)
				local v13 = fn14()
				local now = os.clock()

				while true do
					if v13 and os.clock() - now < 2.5 then
						local v14 = fn13()

						if v14 then
							if not ((v14.Position - worldPosition).Magnitude <= n15) then
								v13:MoveTo(worldPosition)
								task.wait(0.1)
								continue
							end
						end
					end

					break
				end

				local v14 = fn13()
				local magnitude2 = v14 and (v14.Position - worldPosition).Magnitude or 999
				fn17(string.format("attach try %d: onFoot charDist=%.0f need<=%d (max %d) prompt=%s", i, magnitude2, n15, maxActivationDistance2, tostring(v12 ~= nil)))

				if v12 and magnitude2 <= n15 then
					fn34(v12, (v12.HoldDuration or 3) + 0.8)
					task.wait(1.5)
					if fn80() then
						fn17("attach: hooked")
						break
					end
					fn17("attach: hold did not take")
				end
			end

			if not fn80() then
				fn17("attach: gave up")
				return false
			end

			if not fn39() then
				fn17("attach: hooked but could not get back in")
				return false
			end
			return true
		end

		local function fn82()
			local ok, result = pcall(fn81)
			if not ok then
				fn17("attach: errored: " .. tostring(result))
				return fn80()
			end
			return result
		end

		tbl3.seasonFarm = function()
			local world = workspace:FindFirstChild("World")
			world = world and world:FindFirstChild("Season")
			if not world then
				return nil
			end

			for _, child in ipairs(world:GetChildren()) do
				local important = child:FindFirstChild("Important")
				local farm = important and important:FindFirstChild("Farm")
				if farm and #farm:GetChildren() > 0 then
					return farm
				end
			end

			return nil
		end

		local tbl16 = { wheat = "Wheat", corn = "Corn", canola = "Canola", blueberr = "Blueberries" }
		local obj = setmetatable({}, { __mode = "k" })
		local flag15 = false
		local tbl17 = { guess = nil, ambig = nil }

		tbl3.fieldFromMission = function()
			local v8 = tbl3.myMission()
			if not v8 then
				return nil
			end
			local str4 = tostring(v8.Name):lower()
			local v9 = nil

			for k, v10 in pairs(tbl16) do
				if str4:find(k, 1, true) then
					v9 = v10
					break
				else
					v9 = nil
				end
			end

			if not v9 then
				return nil
			end
			local v10 = tbl3.seasonFarm()
			if not v10 then
				return nil
			end
			local v11 = fn29()
			local location = v11 and typeof(v11.location) == "Vector3" and v11.location or nil
			local v12 = fn13()
			local v13 = nil
			local v14 = nil
			local v15 = nil

			for _, child in ipairs(v10:GetChildren()) do
				local flag16 = child:IsA("Model") and child.Name:sub(1, #v9) == v9

				if flag16 then
					local flag17 = obj[child]

					if flag17 then
						local v16 = obj[child]
						flag17 = os.clock() - v16 < 90
					end

					flag16 = not flag17
				end

				if flag16 then
					local ok, result = pcall(function()
						return child:GetPivot()
					end)

					local position = location or v12 and v12.Position
					ok = ok and position and Vector3.new(result.Position.X - position.X, 0, result.Position.Z - position.Z).Magnitude or 1e9

					if not v13 or ok < v13 then
						v14 = child
						v13 = ok
						v15 = ok
					end
				end
			end

			if v14 then
				fn17(string.format("field: %s (%.0f studs from %s)", v14.Name, v15 or -1, location and "the job spot" or "us"))
			end

			return v14
		end

		local v8 = nil
		local v9 = nil
		local v10 = nil
		local n14 = 0

		tbl3.fieldWithProgress = function(arg2)
			local v11 = tbl3.seasonFarm()
			if not v11 then
				return nil
			end
			local n15 = 0
			local v12 = nil

			for _, child in ipairs(v11:GetChildren()) do
				local isModel = child:IsA("Model")

				if isModel then
					isModel = not arg2

					if not isModel then
						isModel = tostring(child.Name):lower():find(arg2, 1, true)
					end
				end

				if isModel then
					local n16 = 0
					local n17 = 0

					for _, child2 in ipairs(child:GetChildren()) do
						if child2:IsA("BasePart") then
							n16 += 1

							if child2.Transparency >= 1 then
								n17 += 1
							end
						end
					end

					if n16 > 0 and n17 > n15 and n17 < n16 then
						n15 = n17
						v12 = child
					end
				end
			end

			return v12, n15
		end

		fn29 = function()
			local ok, result = pcall(function()
				return v2.jobTables and v2.jobTables()
			end)

			fn20()
			if not (ok and result) then
				return nil
			end

			for _, v11 in ipairs(result) do
				for _, v12 in pairs(v11) do
					if type(v12) == "table" and v12.joined then
						local location = typeof(v12.location) == "Vector3" and v12.location or typeof(v12.infoJobPos) == "Vector3" and v12.infoJobPos or nil

						if location then
							return {
								location = location,
								infoDescription = v12.infoDescription,
								jobName = v12.jobName,
								joined = true,
							}
						end
					end
				end
			end

			for _, v11 in ipairs(result) do
				for _, v12 in pairs(v11) do
					if type(v12) == "table" and typeof(v12.location) == "Vector3" then
						local str4 = tostring(v12.jobName or ""):lower()
						if str4:find("harvest", 1, true) or str4:find("collect", 1, true) then
							return v12
						end
					end
				end
			end

			return nil
		end

		tbl3.fieldAt = function(arg2, arg3)
			local v11 = tbl3.seasonFarm()
			if not (v11 and arg2) then
				return nil
			end
			local v12 = nil
			local v13 = nil

			for _, child in ipairs(v11:GetChildren()) do
				if child:IsA("Model") then
					local n15 = 0
					local huge = math.huge
					local n16 = -math.huge
					local huge2 = math.huge
					local n17 = -math.huge

					for _, child2 in ipairs(child:GetChildren()) do
						if child2:IsA("BasePart") then
							n15 += 1
							local position = child2.Position

							if position.X < huge then
								huge = position.X
							end

							if n16 < position.X then
								n16 = position.X
							end

							if position.Z < huge2 then
								huge2 = position.Z
							end

							if position.Z > n17 then
								n17 = position.Z
							end
						end
					end

					if n15 > 0 then
						local n18 = math.max(huge - arg2.X, 0, arg2.X - n16)
						local n19 = math.max(huge2 - arg2.Z, 0, arg2.Z - n17)
						local v14 = math.sqrt(n18 * n18 + n19 * n19)

						if arg3 and n15 ~= arg3 then
							v14 += 5000
						end

						if not v12 or v14 < v12 then
							v12 = v14
							v13 = child
						end
					end
				end
			end

			return v13, v12
		end

		tbl3.cropField = function()
			if not tbl3.hasActiveJob() then
				v8 = nil
				tbl17.ambig = nil
				tbl17.guess = nil
				return nil
			end

			if v8 and v8.Parent then
				return v8
			end
			local v11 = tbl3.algorithms()

			if type(v) == "table" and v.cropsReference and v11 and v11.getInstanceReference then
				local ok, result = pcall(function()
					return v11.getInstanceReference(v.cropsReference)
				end)

				if ok and typeof(result) == "Instance" then
					fn17("field: " .. result.Name .. " from the job's own reference")
					v8 = result
					flag15 = true
					return result
				end
			end

			local v12 = fn29()
			local jobWaypointPos = (not v12 or typeof(v12.location) ~= "Vector3") and v2.jobWaypointPos and v2.jobWaypointPos() or nil

			if jobWaypointPos then
				local v13, v14 = tbl3.fieldAt(jobWaypointPos, nil)

				if v13 and v14 and v14 <= 40 then
					fn17(("field: %s from the job waypoint (%.0f from it)"):format(v13.Name, v14))
					v8 = v13
					flag15 = true
					return v13
				end

				fn17(("field: job waypoint is %.0f from the nearest field (harvester step), waiting"):format(v14 or -1))
				tbl17.ambig = tbl17.ambig or os.clock()
				return nil
			end

			if v12 then
				local num = tonumber(tostring(v12.infoDescription or ""):match("(%d+)"))
				local v13, v14 = tbl3.fieldAt(v12.location, num)

				if v13 and v14 and v14 < 4000 then
					local v15 = tbl3.seasonFarm()
					local v16 = num and v15
					local n15 = 0

					if v16 then
						for _, child in ipairs(v15:GetChildren()) do
							if child:IsA("Model") then
								local n16 = 0

								for _, child2 in ipairs(child:GetChildren()) do
									if child2:IsA("BasePart") then
										n16 += 1
									end
								end

								if n16 == num then
									n15 += 1
								end
							end
						end
					end

					local flag16 = v14 <= 40 or n15 <= 1
					tbl17.guess = tbl17.guess or os.clock()
					local flag17 = not flag16

					if flag17 then
						local guess = tbl17.guess
						flag17 = os.clock() - guess < 120
					end

					if flag17 then
						fn17(("field: %s would be a guess (%.0f from the job spot, %d fields that size), waiting for the harvest step"):format(v13.Name, v14, n15))
						return nil
					end
					fn17(("field: %s from the job location (%s crops, %.0f from it, %d fields that size) %s"):format(v13.Name, tostring(num), v14, n15, flag16 and "" or "as a GUESS"))
					v8 = v13
					flag15 = flag16
					return v13
				end
			end

			local v13 = tbl3.myMission()
			local v14 = nil

			if v13 then
				local str4 = tostring(v13.Name):lower()
				local v15 = nil

				for _, v16 in ipairs({ "wheat", "corn", "canola", "blueberr" }) do
					if str4:find(v16, 1, true) then
						v15 = v16
						break
					else
						v15 = nil
					end
				end

				v14 = v15
			end

			local v15, v16 = tbl3.fieldWithProgress(v14)

			if v15 then
				fn17(("field: %s picked from live progress (%d cut)"):format(v15.Name, v16))
				v8 = v15
				flag15 = true
				return v15
			end

			local v17 = tbl3.seasonFarm()
			local v18 = v14 and v17
			local n15 = 0

			if v18 then
				for _, child in ipairs(v17:GetChildren()) do
					local isModel = child:IsA("Model")

					if isModel then
						isModel = tostring(child.Name):lower():find(v14, 1, true)
					end

					if isModel then
						n15 += 1
					end
				end
			end

			if n15 > 1 then
				tbl17.ambig = tbl17.ambig or os.clock()
				local ambig = tbl17.ambig
				if os.clock() - ambig < 60 then
					fn17(("field: %d %s fields and no job location yet, waiting for it"):format(n15, tostring(v14)))
					return nil
				end
				fn17("field: waited for a job location, using the distance guess as last resort")
			end

			tbl17.ambig = nil
			flag15 = false
			return (tbl3.fieldFromMission())
		end

		tbl3.fieldBounds = function(arg2)
			local n15 = 1e9
			local n16 = -1e9
			local n17 = 1e9
			local n18 = -1e9
			local n19 = 1

			for _, child in ipairs(arg2:GetChildren()) do
				if child:IsA("BasePart") then
					local position = child.Position
					n19 = position.Y
					n15 = math.min(n15, position.X)
					n16 = math.max(n16, position.X)
					n17 = math.min(n17, position.Z)
					n18 = math.max(n18, position.Z)
				end
			end

			return n15 + 4, n16 - 4, n17 + 4, n18 - 4, n19
		end

		tbl3.harvestedCount = function(arg2)
			local tbl18 = {}
			local n15 = 0

			for _, child in ipairs(arg2:GetChildren()) do
				if child:IsA("BasePart") then
					if child.Transparency >= 1 then
						n15 += 1
					else
						tbl18[#tbl18 + 1] = child
					end
				end
			end

			return n15, tbl18
		end

		local function fn83()
			flag13 = false
			local v11 = tbl3.cropField()

			if not v11 then
				if not fn80() and fn58() then
					tbl3.fstat("getting the harvester")

					if fn39() then
						fn82()
					end

					v11 = tbl3.cropField()
				end

				if not v11 then
					local v12 = fn29()
					local location = v12 and typeof(v12.location) == "Vector3" and v12.location or v2.jobWaypointPos and v2.jobWaypointPos() or nil
					local v13 = fn13()
					local magnitude = v13 and location and (v13.Position - location).Magnitude or -1
					local v14 = tbl3.seasonFarm()
					local n15 = 0
					local n16 = 0

					if v14 then
						for _, child in ipairs(v14:GetChildren()) do
							if child:IsA("Model") then
								n16 += 1
								n15 += #child:GetChildren()
							end
						end
					end

					fn17(("crops: no field ref (fields=%d parts=%d loc=%s far=%.0f)"):format(n16, n15, tostring(location), magnitude))

					if location and magnitude > 80 then
						tbl3.fstat("heading to the field")

						if fn26() or fn39() then
							fn28(location, 40, math.clamp(magnitude / 12, 20, 90))
						else
							fn32(location, 30)
						end

						task.wait(1)
						return
					end

					fn15("Waiting for the crop field", "info")
					task.wait(1.5)
					return
				end
			end

			fn17("crops: field=" .. v11.Name .. " seated=" .. tostring(fn26()) .. " harvester=" .. tostring(fn80()))
			fn15("Doing the wheat job", "ok")

			if not fn80() then
				if not fn58() then
					local v12 = fn29()

					if v12 and typeof(v12.location) == "Vector3" then
						local magnitude = fn13()
						magnitude = magnitude and (magnitude.Position - v12.location).Magnitude or 0

						if magnitude > 60 then
							tbl3.fstat("going to get the harvester")
							fn17(("attach: tool not streamed in, driving %.0f studs to the job spot"):format(magnitude))

							if fn26() or fn39() then
								fn28(v12.location, 30, math.clamp(magnitude / 12, 15, 70))
							else
								fn32(v12.location, 20)
							end
						end
					end

					local n15 = 0
					local exitTo = nil

					while true do
						if not (n15 < 8) then
							exitTo = 1
							break
						else
							if fn10() then
								if fn58() or fn80() then
									exitTo = 1
									break
								else
									tbl3.fstat(("looking for the harvester   %ds"):format(8 - n15))
									task.wait(1)
									n15 += 1
									continue
								end
							end

							break
						end
					end

					if exitTo ~= 1 then
						return
					end

					if not (fn58() or fn80()) then
						v8 = nil
						fn17("crops: harvester still in use after 45s, taking another job")
						fn15("Someone else has the harvester, taking another job", "warn")
						tbl3.cancelActiveJob()
						v = nil
						task.wait(2)
						return
					end

					fn15("Harvester is free", "ok")
				end

				if not fn39() then
					fn15("Could not get in the tractor", "warn")
					fn17("crops: enter failed")
					task.wait(2)
					return
				end

				if not fn82() then
					n14 += 1
					fn15("Could not grab the harvester", "warn")
					fn17("crops: attach failed x" .. n14)

					if n14 >= 2 then
						n14 = 0
						v8 = nil
						fn15("Trying a different job", "info")
						tbl3.cancelActiveJob()
						v = nil
					end

					task.wait(2)
					return
				end

				n14 = 0
			elseif not fn26() then
				if not fn39() then
					fn15("Could not get in the tractor", "warn")
					fn17("crops: enter failed (had harvester)")
					task.wait(2)
					return
				end
			end

			fn15("Harvesting the field", "info")
			local n15 = 0

			for _, child in ipairs(v11:GetChildren()) do
				if child:IsA("BasePart") then
					n15 += 1
				end
			end

			local flag16 = false
			local v12 = tbl3.myMission()
			local id = v12 and v12:FindFirstChild("ID")
			local str4 = id and tostring(id.Value) or nil

			if v12 then
				flag16 = true
			end

			local function fn84()
				local v13 = tbl3.myMission()
				if not v13 then
					return false
				end

				if str4 then
					local id2 = v13:FindFirstChild("ID")
					if id2 and tostring(id2.Value) ~= str4 then
						return false
					end
				end

				flag16 = true
				return true
			end

			if v9 ~= str4 or not v10 then
				local now = os.clock()
				v9 = str4
				v10 = now
			end

			local v13, v14, v15, v16, v17 = tbl3.fieldBounds(v11)

			if v14 < v13 then
				local v18 = fn29()
				local location = v18 and typeof(v18.location) == "Vector3" and v18.location or v2.jobWaypointPos and v2.jobWaypointPos() or nil
				local v19 = fn44()
				local v20 = fn13()
				local position = v19 and v19.Position or v20 and v20.Position
				local magnitude = position and location and (position - location).Magnitude or -1
				fn17(("crops: field %s has no parts streamed, loc=%s far=%.0f"):format(v11.Name, tostring(location), magnitude))

				if location and magnitude > 80 then
					fn15("Heading to the field", "info")
					tbl3.fstat("driving to the field")

					if fn26() or fn39() then
						fn28(location, 40, math.clamp(magnitude / 12, 20, 90))
					else
						fn32(location, 30)
					end
				else
					tbl3.fstat("waiting for the field to load")
					task.wait(2)
				end

				return
			end

			local v18 = fn80

			local function fn85(arg2)
				local v19 = fn44()
				if not v19 then
					return false
				end
				local position = v19.Position
				arg2 = arg2 or 32
				return position.X > v13 - arg2 and position.X < v14 + arg2 and position.Z > v15 - arg2 and position.Z < v16 + arg2 and position.Y > -5
			end

			local str5 = nil

			local function fn86()
				if not (flag9 and fn26()) then
					str5 = "not driving"
					return false
				end

				if not v18() then
					str5 = "harvester came off"
					return false
				end
				return true
			end

			local flag17 = false
			local n16 = 0
			local n17 = 0

			local function fn87()
				if flag17 then
					return true
				end

				if n16 >= 3 then
					return false
				end

				if os.clock() - n17 < 15 then
					return false
				end
				n17 = os.clock()
				n16 += 1
				local v19 = tbl3.myMission()
				local id2 = v19 and v19:FindFirstChild("ID")
				if not id2 then
					fn17("report: couldn't find our job id")
					return false
				end
				local n18 = 100

				pcall(function()
					local GameRules = atLowIdentity and atLowIdentity(function()
						return require(replicatedStorage.Modules.GameRules)
					end) or require(replicatedStorage.Modules.GameRules)

					if type(GameRules.percentageOfCropsRequiredToFinishJob) == "number" then
						n18 = GameRules.percentageOfCropsRequiredToFinishJob
					end
				end)

				local tbl18 = {}
				local n19 = math.max(1, math.ceil(n15 * n18 / 100))
				tbl18[1] = n15
				tbl18[2] = n19
				tbl18[3] = n15
				local v20 = tbl18[n16] or n15

				local ok, result = pcall(function()
					return replicatedStorage.Remote.PlayerFunc:InvokeServer("talkToMission", tostring(id2.Value) .. "harvested", v20)
				end)

				fn17("report: try " .. n16 .. " sent " .. v20 .. " -> ok=" .. tostring(ok) .. " res=" .. tostring(result))
				if ok and result then
					flag17 = true
					return true
				end
				task.wait(2)
				local v21 = tbl3.myMission()

				if not (v21 and v21 == v19 and v19.Parent) then
					fn17("report: job closed out, treating as done")
					flag17 = true
					return true
				end

				return false
			end

			local now = os.clock()
			local n18 = math.clamp(n15 * 0.12, 25, 90)
			local v19 = tbl3.harvestedCount(v11)
			os.clock()
			local n19 = 7

			local function fn88()
				local tbl18 = {}

				for _, child in ipairs(v11:GetChildren()) do
					if child:IsA("BasePart") and child.Transparency < 1 then
						local n20 = math.floor((child.Position.Z - v15) / n19)
						local tbl19 = tbl18[n20]

						if not tbl19 then
							tbl19 = { lo = child.Position.X, hi = child.Position.X, n = 0 }
							tbl18[n20] = tbl19
						end

						if child.Position.X < tbl19.lo then
							tbl19.lo = child.Position.X
						end

						if child.Position.X > tbl19.hi then
							tbl19.hi = child.Position.X
						end

						tbl19.n = tbl19.n + 1
					end
				end

				return tbl18
			end

			local n20 = (v13 + v14) / 2
			local n21 = (v15 + v16) / 2
			local v20 = fn44()

			if v20 and Vector3.new(n20 - v20.Position.X, 0, n21 - v20.Position.Z).Magnitude > 80 then
				fn17("crops: driving out to the field")
				fn15("Heading to the field", "info")
				tbl3.fstat("driving to the field")
				fn28(Vector3.new(n20, v17, n21), 30, 75)
			end

			local now2 = os.clock()
			fn16("Auto Farmer  ·  harvesting", math.max(1, n18 - os.clock() - v10))

			while true do
				if fn86() and fn84() and os.clock() - now < 900 then
					local n22 = math.max(0, math.ceil(n18 - os.clock() - v10))
					local value = select(1, tbl3.harvestedCount(v11))

					if n22 > 0 then
						tbl3.fbarText(("Auto Farmer  ·  harvesting   %d/%d   %ds"):format(value, n15, n22))
					else
						tbl3.fbarText(("Auto Farmer  ·  harvesting   %d/%d"):format(value, n15))
					end

					local v21 = fn88()
					local tbl18 = {}

					for k in pairs(v21) do
						tbl18[#tbl18 + 1] = k
					end

					if #tbl18 ~= 0 then
						table.sort(tbl18)
						local z = fn44()
						z = z and z.Position.Z or v15
						local n23 = v15 + tbl18[1] * n19
						local v22

						if math.abs(z - v15 + tbl18[#tbl18] * n19) < math.abs(z - n23) then
							local tbl19 = {}

							for i = #tbl18, 1, -1 do
								tbl19[#tbl19 + 1] = tbl18[i]
							end

							v22 = tbl19
						else
							v22 = tbl18
						end

						local n24 = math.max(2, math.ceil(70 / n19))
						local tbl19 = {}

						for i = 1, math.min(n24, #v22) do
							local tbl20 = {}
							local v23 = i

							while v23 <= #v22 do
								tbl20[#tbl20 + 1] = v22[v23]
								v23 += n24
							end

							if i % 2 == 0 then
								for i2 = #tbl20, 1, -1 do
									tbl19[#tbl19 + 1] = tbl20[i2]
								end
							else
								for i2 = 1, #tbl20 do
									tbl19[#tbl19 + 1] = tbl20[i2]
								end
							end
						end

						local flag18 = fn44()
						flag18 = flag18 and math.abs(flag18.Position.X - v21[tbl19[1]].hi) < math.abs(flag18.Position.X - v21[tbl19[1]].lo) or false
						flag13 = true
						local flag19 = false

						for _, v23 in ipairs(tbl19) do
							if fn86() and fn84() then
								if not (os.clock() - now > 900) then
									local v24 = v21[v23]
									local n25 = v15 + v23 * n19 + n19 / 2
									local tbl20 = { s = v24.hi - 15 + 4, e = v24.lo - 15 - 4 }
									local tbl21 = { s = v24.lo + 15 - 4, e = v24.hi + 15 + 4 }
									flag18 = flag18 and tbl20
									local v25 = flag18 or tbl21
									local vector = Vector3.new(v25.s, v17, n25)
									fn17(("row: headland turn toward (%.0f,%.0f)"):format(vector.X, vector.Z))

									for i = 1, 3 do
										local v26 = fn44()

										if v26 then
											local lookVector = v26.CFrame.LookVector
											local vector2 = Vector3.new(lookVector.X, 0, lookVector.Z)
											local vector3 = Vector3.new(vector.X - v26.Position.X, 0, vector.Z - v26.Position.Z)

											if not (vector2.Magnitude < 0.01 or vector3.Magnitude < 12) then
												if not (vector2.Unit:Dot(vector3.Unit) > 0.6) then
													fn78(vector3.Unit, 4)
													local v27 = fn44()

													if v27 then
														local lookVector2 = v27.CFrame.LookVector
														local vector4 = Vector3.new(lookVector2.X, 0, lookVector2.Z)
														local vector5 = Vector3.new(vector.X - v27.Position.X, 0, vector.Z - v27.Position.Z)
														if not (vector4.Magnitude > 0.01 and vector5.Magnitude > 1 and vector4.Unit:Dot(vector5.Unit) > 0.6) then
															fn57(v27.Position + (vector5.Magnitude > 1 and vector5.Unit or vector4.Unit) * 14, 6, 2.5, 14)
															continue
														end
													end
												end
											end
										end

										break
									end

									fn57(Vector3.new(v25.s, v17, n25), 20, 22, 16)
									local x = fn44()
									x = x and x.Position.X or v25.s
									local flag20 = math.abs(x - tbl21.s) < math.abs(x - tbl20.s) and tbl21 or tbl20
									flag18 = flag20 == tbl21
									local v26 = fn48(fn44())
									local n26 = flag20.e > flag20.s and 1 or -1

									for i = 0, 21, 3 do
										local e = flag20.e - n26 * i

										if fn51(Vector3.new(e - n26 * 8, v17, n25), Vector3.new(e, v17, n25), v26, 3) then
											if i > 0 then
												fn17(("crops: row end pulled back %d, something at the edge"):format(i))
												flag20.e = e
											end

											break
										end
									end

									fn79(flag20.s, flag20.e, n25, v17, 26)

									if not fn85(14) then
										local v27 = fn44()
										fn17(("crops: off field, steering back (at %.0f,%.0f; field x %.0f..%.0f z %.0f..%.0f)"):format(v27 and v27.Position.X or 0, v27 and v27.Position.Z or 0, v13, v14, v15, v16))
										fn28(Vector3.new((v13 + v14) / 2, v17, (v15 + v16) / 2), 15, 40)
									end

									local v27 = tbl3.harvestedCount(v11)

									if v19 < v27 then
										now2 = os.clock()
										flag19 = true
										v19 = v27
									end

									fn15("Cutting wheat, " .. v27 .. " of " .. n15, "info")

									if not (os.clock() - v10 > n18 and fn87()) then
										if os.clock() - now2 > (flag15 and 75 or 20) then
											fn17("crops: no progress")
											break
										else
											continue
										end
									end
								end
							end

							break
						end

						flag13 = false

						if not flag17 then
							if not (os.clock() - v10 > n18 and fn87()) then
								if (flag15 and 75 or 20) < os.clock() - now2 then
									if not flag15 and v11 then
										obj[v11] = os.clock()
										fn17("crops: guess " .. v11.Name .. " cut nothing, marking failed + re-checking")
									end

									if not fn87() then
										str5 = "stopped making progress"
									end

									break
								elseif not flag19 then
									local v23, v24 = tbl3.harvestedCount(v11)

									if #v24 ~= 0 then
										local v25 = fn44()
										local lookVector = v25 and v25.CFrame.LookVector
										lookVector = lookVector and Vector3.new(lookVector.X, 0, lookVector.Z) or Vector3.new(0, 0, 1)
										local unit = lookVector.Magnitude > 0.01 and lookVector.Unit or Vector3.new(0, 0, 1)
										local v26 = nil
										local v27 = nil

										for _, v28 in ipairs(v24) do
											local vector = v25 and Vector3.new(v28.Position.X - v25.Position.X, 0, v28.Position.Z - v25.Position.Z)
											local magnitude = vector and vector.Magnitude or 0

											if vector and magnitude > 0.5 then
												local n25 = magnitude + math.acos(math.clamp(unit:Dot(vector.Unit), -1, 1)) * 55

												if not v26 or n25 < v26 then
													v26 = n25
													v27 = v28
												end
											end
										end

										if v27 then
											local v28 = fn44()
											local vector = v28 and Vector3.new(v27.Position.X - v28.Position.X, 0, v27.Position.Z - v28.Position.Z)
											local unit2

											if vector and vector.Magnitude > 1 then
												unit2 = vector.Unit
											else
												unit2 = Vector3.new(0, 0, 1)
											end

											fn57(v27.Position + unit2 * 20, 6, 10)
										end

										local v28 = tbl3.harvestedCount(v11)

										if v28 > v19 then
											now2 = os.clock()
											v19 = v28
										end

										continue
									end
								else
									continue
								end
							end
						end
					end
				end

				break
			end

			fn41()
			tbl3.fbarHide()
			v8 = nil
			fn17("crops: ended cut=" .. tbl3.harvestedCount(v11) .. "/" .. n15 .. " why=" .. tostring(str5 or "job ended"))

			if flag16 and not fn84() then
				fn15("Wheat job done", "ok")
			elseif flag9 then
				fn15("Stopped, wheat not finished", "warn")
			end
		end

		local function fn84()
			tbl3.ensureFarmHook()
			n6 += 1
			local v11 = n6
			n8 = v11

			while fn10() and n6 == v11 do
				n9 = os.clock()

				local ok, result = pcall(function()
					if not tbl3.onFarmerTeam() then
						if os.clock() - n7 > 8 then
							n7 = os.clock()
							str2 = ""
							fn15("Auto Farmer: switch to the Farmer team to start", "info")
						end

						tbl3.fstat("join the Farmer team")
						task.wait(2)
						v = nil
					elseif tbl3.currentMission() == "Animals" then
						local ok, result = pcall(fn36)

						if not ok then
							fn17("animals ERROR: " .. tostring(result))
						end

						fn46()
						v = nil
						task.wait(1.5)
					elseif tbl3.currentMission() == "Crops" then
						local ok, result = pcall(fn83)

						if not ok then
							fn17("crops ERROR: " .. tostring(result))
						end

						fn46()
						v = nil
						task.wait(1.5)
					elseif tbl3.hasActiveJob() then
						tbl3.ensureJobApp()
						local v12 = tbl3.myMission()
						fn17("waiting on job details: " .. tostring(v12 and v12.Name or "?"))
						task.wait(2)
					elseif not fn35() then
						if str3 then
							if str3 == "spawn your tractor" and fn38() then
								tbl3.fstat("tractor's out, waiting for the server to see it")
							else
								tbl3.fstat(str3)
							end
						else
							tbl3.fstat("waiting for a job")
							fn15("Waiting for a job", "info")
						end

						task.wait(3)
					else
						str3 = nil
						task.wait(2)
					end
				end)

				if not ok then
					fn17("loop ERROR: " .. tostring(result))
					task.wait(2)
				end
			end

			fn41()
		end

		local flag16 = false

		tbl3.startStatus = function()
			if flag16 then
				return
			end
			flag16 = true

			v2.spawnS(function()
				while state.running do
					if flag9 then
						if not pcall(function()
							if not tbl3.onFarmerTeam() then
								tbl3.fstat("join the Farmer team")
								return
							end
							local v11 = tbl3.currentMission()

							if v11 == "Crops" then
								if not fn80(true) then
									tbl3.fstat("getting the harvester")
								else
									local v12 = v8
									local parent = v8

									if v12 then
										parent = v12.Parent
									end

									if parent then
										local v13, v14 = tbl3.harvestedCount(v12)
										tbl3.fstat(("harvesting  %d/%d"):format(v13, v13 + #v14))
									else
										tbl3.fstat("heading to the field")
									end
								end
							elseif v11 == "Animals" then
								tbl3.fstat("animal job")
							elseif tbl3.hasActiveJob() then
								tbl3.fstat("starting the job")
							else
								tbl3.fstat(str3 or "waiting for a job")
							end
						end) then
							tbl3.fstat("working")
						end
					end

					task.wait(1)
				end
			end)
		end

		local flag17 = false

		tbl3.startFarm = function()
			tbl5.farmCtrl = tbl5.borrowCtrl() or tbl5.farmCtrl
			n9 = os.clock()
			tbl3.startStatus()
			v2.spawnS(fn84)
			if flag17 then
				return
			end
			flag17 = true

			v2.spawnS(function()
				while state.running do
					task.wait(10)

					if flag9 and os.clock() - n9 > 60 then
						fn17("watchdog: loop stalled, restarting it")
						fn41()
						n9 = os.clock()
						v2.spawnS(fn84)
					end
				end
			end)
		end
	end

	do
		local Frame = nil
		local tbl14 = nil
		v2.driveHudOn = true

		local function fn59(arg2)
			if not arg2 then
				if Frame then
					Frame.Visible = false
				end

				return
			end

			if not v2.driveHudOn then
				return
			end

			if Frame then
				Frame.Visible = true
				return Frame
			end

			Frame = make("Frame", {
				Parent = v2.ScreenGui,
				Name = "DriveHud",
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, -16, 0, v2.IS_MOBILE and 52 or 64),
				Size = UDim2.fromOffset(300, 74),
				BackgroundColor3 = c2.SURFACE or Color3.fromRGB(18, 18, 24),
				BackgroundTransparency = 0.12,
				BorderSizePixel = 0,
			})

			make("UICorner", { CornerRadius = UDim.new(0, 12), Parent = Frame })
			make("UIStroke", { Parent = Frame, Color = c2.ACCENT, Transparency = 0.55, Thickness = 1 })

			make("TextLabel", {
				Parent = Frame,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(14, 8),
				Size = UDim2.new(1, -28, 0, 16),
				Font = Enum.Font.GothamBold,
				TextSize = 12,
				TextColor3 = c2.ACCENT,
				TextXAlignment = Enum.TextXAlignment.Left,
				Text = "AUTO DRIVE",
			})

			local TextLabel = make("TextLabel", {
				Parent = Frame,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(104, 8),
				Size = UDim2.new(1, -168, 0, 16),
				Font = Enum.Font.Gotham,
				TextSize = 12,
				TextColor3 = c2.TEXT,
				TextXAlignment = Enum.TextXAlignment.Right,
				TextTruncate = Enum.TextTruncate.AtEnd,
				Text = "",
			})

			local TextLabel2 = make("TextLabel", {
				Parent = Frame,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(14, 28),
				Size = UDim2.new(1, -156, 0, 16),
				Font = Enum.Font.Gotham,
				TextSize = 12,
				TextColor3 = c2.SUBTEXT or c2.TEXT,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				Text = "",
			})

			local TextLabel3 = make("TextLabel", {
				Parent = Frame,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, -14, 0, 28),
				Size = UDim2.fromOffset(124, 16),
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				TextColor3 = c2.TEXT,
				TextXAlignment = Enum.TextXAlignment.Right,
				TextTruncate = Enum.TextTruncate.AtEnd,
				Text = "",
			})

			local Frame2 = make("Frame", {
				Parent = Frame,
				Position = UDim2.new(0, 14, 1, -18),
				Size = UDim2.new(1, -28, 0, 5),
				BackgroundColor3 = c2.OFF or Color3.fromRGB(50, 50, 60),
				BorderSizePixel = 0,
			})

			make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Frame2 })
			local Frame3 = make("Frame", { Parent = Frame2, Size = UDim2.new(0, 0, 1, 0), BackgroundColor3 = c2.ACCENT, BorderSizePixel = 0 })
			make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Frame3 })

			local TextButton = make("TextButton", {
				Parent = Frame,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, -10, 0, 6),
				Size = UDim2.fromOffset(44, 18),
				BackgroundColor3 = c2.RED or Color3.fromRGB(200, 60, 60),
				BackgroundTransparency = 0.25,
				BorderSizePixel = 0,
				Font = Enum.Font.GothamBold,
				TextSize = 10,
				TextColor3 = Color3.new(1, 1, 1),
				Text = "STOP",
				AutoButtonColor = true,
			})

			make("UICorner", { CornerRadius = UDim.new(0, 6), Parent = TextButton })

			TextButton.MouseButton1Click:Connect(function()
				if v2.isFollowing and v2.isFollowing() and v2.stopFollow then
					v2.stopFollow()
				end

				if v2.autoDriveStop then
					v2.autoDriveStop()
				end

				if v2.walkStop then
					v2.walkStop()
				end

				if notify then
					notify("Stopped", "off")
				end

				Frame.Visible = false
			end)

			tbl14 = { dest = TextLabel, line = TextLabel2, state = TextLabel3, bar = Frame3 }
			return Frame
		end

		v2.driveHudUpdate = function(text, arg2, arg3, arg4, text2)
			if not ((tbl4 or state.walkCtx) and v2.driveHudOn) then
				return
			end

			if not fn59(true) then
				return
			end
			tbl14.dest.Text = text or ""
			local n13 = arg4 > 4 and math.floor(arg2 / math.max(arg4, 8)) or math.floor(arg2 / 25)
			tbl14.line.Text = ("%s studs  ·  ~%ds  ·  %d mph"):format(arg2 >= 1000 and ("%.1fk"):format(arg2 / 1000) or tostring(math.floor(arg2)), n13, math.floor(arg4 * 0.7))
			tbl14.state.Text = text2 or ""
			local n14 = arg3 and arg3 > 0 and math.clamp(1 - arg2 / arg3, 0, 1) or 0

			pcall(function()
				game:GetService("TweenService"):Create(tbl14.bar, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(n14, 0, 1, 0) }):Play()
			end)
		end

		v2.driveHudPin = function(text, text2)
			v2.driveHudPinned = true
			if not fn59(true) then
				return
			end

			if tbl14 then
				tbl14.dest.Text = text or ""
				tbl14.state.Text = text2 or "Following"
				tbl14.line.Text = ""
			end
		end

		v2.driveHudUnpin = function()
			v2.driveHudPinned = false

			if not tbl4 then
				fn59(false)
			end
		end

		local n13 = 0
		local n14 = 0

		v2.driveLineClear = function(arg2, arg3)
			local v6 = fn44()
			if not (v6 and arg2 and arg3) then
				return false
			end
			local v7 = fn48(v6)
			return fn51(arg2, arg3, v7, v7.halfW + 0.5) and true or false
		end

		v2.driveBrake = function()
			pcall(fn45)
		end

		v2.autoDriveTo = function(arg2, arg3)
			local tbl15 = arg3 or {}

			if typeof(arg2) == "Instance" then
				arg2 = arg2:IsA("BasePart") and arg2.Position or arg2.Position
			end

			if typeof(arg2) ~= "Vector3" then
				return false, "no target"
			end

			if flag9 then
				local autoFarmer = v2.configReg and v2.configReg.autoFarmer

				if autoFarmer and autoFarmer.set then
					pcall(autoFarmer.set, false)
				else
					flag9 = false
					fn43()
				end

				if v2.notify then
					pcall(v2.notify, "Auto Farmer switched off for " .. tostring(tbl15.name or "this drive"), "info")
				end

				fn17("drive: auto farmer switched off for " .. tostring(tbl15.name))
				task.wait(0.3)
				if flag9 then
					return false, "auto farmer is on"
				end
			end

			if tbl4 then
				if tbl15.preempt == false then
					return false, "already auto-driving"
				end
				local v6 = tostring
				local name = tbl15.name
				fn17(("drive: %s pre-empted by %s"):format(tostring(tbl4.name), v6(name)))
				n13 += 1
				n14 = os.clock()
				tbl4 = nil
				fn41()
				task.wait(0.15)
			end

			local vehicle = tbl15.vehicle
			local getCurrentVehicle

			if vehicle then
				getCurrentVehicle = vehicle
			else
				getCurrentVehicle = v2.getCurrentVehicle and v2.getCurrentVehicle()
			end

			if not (getCurrentVehicle and getCurrentVehicle:FindFirstChild("_Chassis")) then
				return false, "not in a vehicle"
			end
			n13 += 1
			local v6 = n13
			local v7 = tbl5.borrowCtrl()

			tbl4 = {
				thread = coroutine.running(),
				vehicle = getCurrentVehicle,
				name = tbl15.name,
				owner = tbl15.owner or "drive",
				offroad = tbl15.offroad and true or false,
				forceDirect = tbl15.forceDirect and true or false,
				park = tbl15.park ~= false,
				alive = function()
					if v6 ~= n13 or not state.running then
						return false
					end

					if getCurrentVehicle.Parent == nil or fn37() == nil then
						return false
					end

					if tbl15.alive and not tbl15.alive() then
						return false
					end
					return true
				end,
			}

			local flag15 = false
			local now = os.clock()
			flag11 = tbl15.chase and true or false

			local ok, result = pcall(function()
				flag15 = fn28(arg2, tbl15.reach or 22, tbl15.maxT or 90, 0)

				if flag15 and tbl15.closeUp then
					local v8 = fn44()

					if v8 then
						local magnitude = Vector3.new(arg2.X - v8.Position.X, 0, arg2.Z - v8.Position.Z).Magnitude
						local closeUp = tbl15.closeUp

						if magnitude > closeUp and magnitude <= 120 then
							local v9 = fn48(v8)

							if fn51(v8.Position, arg2, v9, v9.halfW + 0.5) then
								fn57(arg2, closeUp, math.clamp(magnitude / 6, 4, 16))
							end
						end
					end
				end
			end)

			local flag16 = v6 == n13

			if not ok then
				fn17("drive ERROR: " .. tostring(result))

				if flag16 and tbl4 then
					tbl4.reason = "error: " .. tostring(result):sub(1, 80)
				end
			end

			local flag17 = fn37() ~= nil

			if flag16 and tbl4 and not tbl4.reason and not flag15 and not flag17 then
				tbl4.reason = "left the vehicle"
			end

			local reason = flag16 and tbl4 and tbl4.reason or os.clock() - n14 < 2 and "cancelled by you" or nil
			fn17(("drive: ended ok=%s after %.0fs reason=%s inCar=%s%s"):format(tostring(flag15), os.clock() - now, tostring(reason), tostring(flag17), flag16 and "" or " (superseded)"))
			local v8 = flag11
			flag11 = false

			if v7 and not v8 then
				tbl5.returnCtrl(true)
			end

			if flag16 then
				if v8 and (flag15 or reason == nil) then
					state.autoCap = nil
					state.autoYaw = nil
				else
					fn41()
				end

				if flag15 and v2.driveHudUpdate then
					pcall(v2.driveHudUpdate, tbl15.name, 0, 1, 0, "Arrived")
				end

				task.delay(2.5, v2.safe(function()
					if not tbl4 and not v2.driveHudPinned then
						fn59(false)
					end
				end))

				tbl4 = nil
			end

			if flag15 then
				return true
			end
			return false, reason or "couldn't reach it (blocked or off-road)"
		end

		v2.walkStop = function()
			if state.walkCtx then
				state.walkCtx.alive = function()
					return false
				end
			end
		end

		v2.autoDriveStop = function()
			n13 += 1
			n14 = os.clock()
			tbl4 = nil
			fn41()
			v2.walkStop()
		end

		v2.autoDriveActive = function()
			return tbl4 ~= nil
		end

		v2.autoDriveOwner = function()
			return tbl4 and tbl4.owner or nil
		end

		v2.walkTo = function(arg2, arg3, arg4, arg5)
			if state.walkCtx then
				return false
			end
			state.walkCtx = { alive = arg5, thread = coroutine.running() }
			local ok, result = pcall(fn25, arg2, arg3, arg4)
			state.walkCtx = nil

			pcall(function()
				local v6 = fn14()
				local v7 = fn13()

				if v6 and v7 then
					v6:MoveTo(v7.Position)
				end

				if fn22 then
					fn22()
				end
			end)

			return ok and result or false
		end

		v2.followOnFoot = function(arg2, arg3)
			if state.walkCtx then
				return false
			end
			arg3 = arg3 or {}
			state.walkCtx = { alive = arg3.alive, thread = coroutine.running() }
			local gap = arg3.gap or 8
			local name = arg3.name or "Following"
			local v6 = nil
			local n15 = 1
			local v7 = nil
			local n16 = 0
			os.clock()
			local raycastParams = RaycastParams.new()
			raycastParams.FilterType = Enum.RaycastFilterType.Exclude
			local now = nil
			local n17 = 0
			local unit = nil

			RunService:BindToRenderStep("vxfollow", Enum.RenderPriority.Input.Value + 5, --[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
			function()pcall(function()local q=l[1][4][l[1][7]]();if not q then return;end;local X=l[2][4][l[2][7]];q:Move(if typeof(X)~="Vector3"or X.X~=X.X then(Vector3.new(0.0,0.0,0.0))else X,false);end);end)

			local flag15 = false

			local function fn60(arg4)
				if arg4 == flag15 then
					return
				end
				flag15 = arg4
				local Character = fn30("Character")

				if Character and Character.lockHumanoidState then
					pcall(function()
						Character.lockHumanoidState("vxfollow", arg4 and 3 or nil)
					end)

					if fn20 then
						fn20()
					end
				elseif arg4 then
					fn21()
				else
					fn22()
				end
			end

			local function fn61(arg4, arg5)
				local v8 = PathfindingService:CreatePath({
					AgentRadius = 2.5,
					AgentHeight = 5,
					AgentCanJump = true,
					AgentJumpHeight = 7,
					AgentMaxSlope = 50,
					WaypointSpacing = 5,
				})

				if not (pcall(function()
					v8:ComputeAsync(arg4, arg5)
				end) and v8.Status == Enum.PathStatus.Success) then
					return nil
				end
				local tbl15 = {}

				for _, v9 in ipairs(v8:GetWaypoints()) do
					local n18 = #tbl15

					if n18 == 0 or fn23(v9.Position, tbl15[n18]) > 1 then
						tbl15[n18 + 1] = v9.Position
					end
				end

				return tbl15
			end

			local function fn62(arg4, arg5)
				local v8 = fn61(arg4, arg5)
				if v8 then
					return v8, arg5
				end
				local vector = Vector3.new(arg5.X - arg4.X, 0, arg5.Z - arg4.Z)
				if vector.Magnitude < 1 then
					return nil
				end
				local unit2 = vector.Unit

				for _, v9 in ipairs({ 0, 35, -35, 70, -70, 110, -110 }) do
					local v10 = math.rad(v9 + n17 * 20)
					local vector2 = Vector3.new
					local z = unit2.Z
					local n18 = unit2.X * math.cos(v10) - z * math.sin(v10)
					local z2 = unit2.Z
					local v11 = vector2(n18, 0, unit2.X * math.sin(v10) + z2 * math.cos(v10))

					for _, v12 in ipairs({ 150, 80 }) do
						local hit = workspace:Raycast(arg4 + v11 * v12 + Vector3.new(0, 40, 0), Vector3.new(0, -120, 0), raycastParams)

						if hit then
							local position = hit.Position
							local v13 = fn61(arg4, position)
							if v13 then
								return v13, position
							end
						end
					end
				end

				return nil
			end

			local ok, result = pcall(function()
				while fn10() do
					local v8 = fn14()
					local v9 = fn13()

					if v8 and v9 then
						local v10 = arg2()

						if v10 then
							local position = v9.Position
							local v11 = fn23(position, v10)
							local magnitude = v9.AssemblyLinearVelocity.Magnitude
							local str4

							if v11 <= gap then
								unit = nil
								fn60(false)
								v6 = nil
								str4 = "With them"
							else
								fn18()
								local v12 = workspace
								local findFirstChild = v12.FindFirstChild
								raycastParams.FilterDescendantsInstances = { fn12(), findFirstChild(v12, "Characters") }

								if magnitude < 1.5 then
									local v13 = now
									local now2

									if now then
										now2 = v13
									else
										now2 = os.clock()
									end

									now = now2

									if os.clock() - now > 1.5 then
										v8.Jump = true
										n17 += 1
										v6 = nil
										now = os.clock()
									end
								else
									now = nil
								end

								local n18

								if v11 < 90 and fn24(position, v10) then
									v6 = nil
									n18 = v10 - Vector3.new(v10.X - position.X, 0, v10.Z - position.Z).Unit * math.max(gap - 3, 2)
									str4 = "Walking"
								else
									if not v6 or v6 and n15 >= #v6 - 1 or v7 and fn23(v7, v10) > 25 and v11 < 150 or os.clock() - n16 > 6 then
										local v13, v14 = fn62(position, v10)
										n16 = os.clock()
										v7 = v10

										if v13 then
											v6 = v13
											n15 = 1

											if v14 == v10 then
												v6[#v6 + 1] = v10
											end
										else
											v6 = nil
										end
									end

									if v6 then
										while n15 < #v6 do
											local v13 = v6[n15]
											local v14 = v6[n15 + 1]
											local vector = Vector3.new(v14.X - v13.X, 0, v14.Z - v13.Z)
											local vector2 = Vector3.new(position.X - v13.X, 0, position.Z - v13.Z)
											local flag16 = vector.Magnitude < 0.5

											if not flag16 then
												local magnitude2 = vector.Magnitude
												local n19 = vector.Magnitude - 1
												flag16 = vector2:Dot(vector) / magnitude2 >= n19
											end

											if flag16 then
												n15 += 1
												continue
											end
											break
										end

										local v13 = n15
										n18 = v6[math.min(#v6, n15 + 1)]
										local n19 = 0

										while v13 < #v6 and n19 < 12 do
											n19 += fn23(v6[v13], v6[v13 + 1])
											v13 += 1
											n18 = v6[v13]
										end

										str4 = "Walking"
									else
										str4 = "No path from here"
										n18 = position
									end
								end

								local vector = Vector3.new(n18.X - position.X, 0, n18.Z - position.Z)

								if vector.Magnitude > 0.5 then
									local unit2 = vector.Unit
									local hit = workspace:Raycast(position + Vector3.new(0, 0.8, 0), unit2 * 6, raycastParams) or workspace:Raycast(position + Vector3.new(0, 2.6, 0), unit2 * 6, raycastParams)

									if hit and hit.Instance.CanCollide and hit.Normal.Y < 0.7 then
										local vector2 = Vector3.new(-unit2.Z, 0, unit2.X)
										local hit2 = workspace:Raycast(position + Vector3.new(0, 1.5, 0), (unit2 - vector2).Unit * 7, raycastParams)
										n18 = position + unit2 * 3 + vector2 * (workspace:Raycast(position + Vector3.new(0, 1.5, 0), (unit2 + vector2).Unit * 7, raycastParams) and not hit2 and -1 or 1) * 5
										str4 = "Stepping round"
									end
								end

								local vector2 = Vector3.new(n18.X - position.X, 0, n18.Z - position.Z)
								unit = vector2.Magnitude > 0.3 and vector2.Unit or nil
								local flag16 = v11 > gap * 2.5
								local v13 = fn31()

								if flag15 and (not flag16 or v13 < 15) then
									fn60(false)
								elseif not flag15 and flag16 and v13 > 35 then
									fn60(true)
								end

								if flag15 and str4 == "Walking" then
									str4 = "Running"
								end
							end

							if v2.driveHudUpdate then
								pcall(v2.driveHudUpdate, name, v11, math.max(v11, 1), magnitude, str4)
							end

							task.wait(0.12)
							continue
						end
					end

					break
				end
			end)

			state.walkCtx = nil

			pcall(function()
				RunService:UnbindFromRenderStep("vxfollow")
			end)

			pcall(function()
				fn60(false)
				local v8 = fn14()

				if v8 then
					v8:Move(Vector3.zero, false)
				end
			end)

			task.delay(2.5, v2.safe(function()
				if not (tbl4 or state.walkCtx) then
					fn59(false)
				end
			end))

			if not ok then
				fn17("walkfollow ERROR: " .. tostring(result))
			end

			return ok
		end
	end

	v2._setFarm = makeToggleRow(cheats, "footprints", "Auto Farmer", "Farmer team. Picks jobs for you and does them. Animals and wheat.", 63, false, function(arg2)
		flag9 = arg2

		if arg2 then
			v2.soloJob("farmer")
			tbl3.ensureFarmHook()
			tbl3.startFarm()
		else
			fn43()
			str2 = ""
		end
	end, "autoFarmer", function(arg2)
		makeToggleRow(arg2, "zap", "Farmer Teleport", "Teleport you and the tractor straight to each spot. Much faster but obvious.", 1, false, function(arg3)
			flag12 = arg3
		end, "autoFarmerTp")
	end)

	v2.autoJobs.farmer = function()
		if v2._setFarm then
			v2._setFarm(false)
		end
	end

	table.insert(v2.cleanups, function()
		flag9 = false
		fn43()
	end)

	v2.spawnS(function()
		for i = 1, 15 do
			tbl3.ensureFarmHook()
			if not flag10 then
				task.wait(1)
				continue
			end
			break
		end
	end)
end
