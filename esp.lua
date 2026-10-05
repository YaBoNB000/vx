-- Why do i love gpt 5.6 sol high the reason is below.
-- dsc.gg/oxyenv 

return function(arg)
	local make = arg.make
	local c = arg.C
	local track = arg.track
	local state = arg.state
	local players = arg.Players
	local localPlayer = arg.LocalPlayer
	local runService = arg.RunService
	local makeToggleRow = arg.makeToggleRow
	local makeSlider = arg.makeSlider
	local sectionLabel = arg.sectionLabel
	game:GetService("GuiService")
	local esp = arg.pages.esp
	local flag = false
	local flag2 = false
	local flag3 = false
	local flag4 = false
	local flag5 = false
	local flag6 = true
	local flag7 = false
	local flag8 = false
	local flag9 = false
	local n2 = 1000
	local color = Color3.fromRGB(60, 220, 90)
	Color3.fromRGB(255, 60, 60)

	local ScreenGui = make("ScreenGui", {
		Name = "VXSANS_ESP",
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = 998,
		IgnoreGuiInset = false,
	})

	local protectGui = syn and syn.protect_gui or protect_gui

	if protectGui then
		pcall(protectGui, ScreenGui)
	end

	ScreenGui.Parent = arg.CoreGui or arg.uiHost()

	local Frame = make("Frame", {
		Parent = ScreenGui,
		AnchorPoint = Vector2.new(0.5, 1),
		Size = UDim2.fromOffset(190, 46),
		BackgroundColor3 = c.GLASS,
		BackgroundTransparency = 0.05,
		BorderSizePixel = 0,
		Visible = false,
		ZIndex = 15,
	})

	make("UICorner", { CornerRadius = UDim.new(0, 8), Parent = Frame })
	make("UIStroke", { Color = c.ACCENT, Thickness = 1.4, Transparency = 0.3, Parent = Frame })

	make("TextLabel", {
		Parent = Frame,
		Size = UDim2.new(1, -16, 0, 18),
		Position = UDim2.fromOffset(8, 6),
		BackgroundTransparency = 1,
		Text = "",
		Font = Enum.Font.GothamBold,
		TextSize = 12,
		TextColor3 = c.TEXT,
		TextXAlignment = Enum.TextXAlignment.Center,
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 16,
	})

	make("TextLabel", {
		Parent = Frame,
		Size = UDim2.new(1, -16, 0, 14),
		Position = UDim2.fromOffset(8, 24),
		BackgroundTransparency = 1,
		Text = "",
		Font = Enum.Font.Gotham,
		TextSize = 10,
		TextColor3 = c.SUBTEXT,
		TextXAlignment = Enum.TextXAlignment.Center,
		ZIndex = 16,
	})

	local function fn()
		local lockTarget = state.keybinds and state.keybinds.lockTarget
		return lockTarget and lockTarget.Name or nil
	end

	local tbl = {}
	local n3 = 0

	local function fn2(arg2)
		if tbl[arg2] then
			return
		end

		local Frame2 = make("Frame", {
			Parent = ScreenGui,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromOffset(0, 2),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderSizePixel = 0,
			Visible = false,
			ZIndex = 1,
		})

		local Frame3 = make("Frame", {
			Parent = ScreenGui,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromOffset(9, 9),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderSizePixel = 0,
			Visible = false,
			ZIndex = 3,
		})

		make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Frame3 })
		make("UIStroke", { Color = Color3.fromRGB(0, 0, 0), Thickness = 1, Transparency = 0.3, Parent = Frame3 })

		local TextLabel = make("TextLabel", {
			Parent = ScreenGui,
			AnchorPoint = Vector2.new(0.5, 1),
			Size = UDim2.fromOffset(220, 46),
			BackgroundTransparency = 1,
			RichText = true,
			Text = "",
			Font = Enum.Font.GothamBold,
			TextSize = 12,
			TextColor3 = c.TEXT,
			TextYAlignment = Enum.TextYAlignment.Bottom,
			TextXAlignment = Enum.TextXAlignment.Center,
			Visible = false,
			ZIndex = 2,
		})

		make("UIStroke", { Color = Color3.fromRGB(0, 0, 0), Thickness = 1.4, Transparency = 0.35, Parent = TextLabel })

		local Frame4 = make("Frame", {
			Parent = ScreenGui,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromOffset(4, 44),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 0.35,
			BorderSizePixel = 0,
			Visible = false,
			ZIndex = 1,
		})

		make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Frame4 })

		local Frame5 = make("Frame", {
			Parent = Frame4,
			AnchorPoint = Vector2.new(0.5, 1),
			Position = UDim2.new(0.5, 0, 1, 0),
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = color,
			BorderSizePixel = 0,
			ZIndex = 1,
		})

		make("UICorner", { CornerRadius = UDim.new(1, 0), Parent = Frame5 })

		local TextButton = make("TextButton", {
			Parent = ScreenGui,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromOffset(44, 44),
			BackgroundTransparency = 1,
			Text = "",
			Visible = false,
			ZIndex = 4,
			AutoButtonColor = false,
		})

		local connection = TextButton.MouseButton1Click:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
		function()if j[1].getSelectedTarget and j[1].getSelectedTarget()==j[2]then if j[1].selectTarget then j[1].selectTarget(nil);end;elseif j[1].selectTarget then j[1].selectTarget(j[2]);end;end))

		n3 += 1
		tbl[arg2] = { tracer = Frame2, dot = Frame3, label = TextLabel, hpBg = Frame4, hpFill = Frame5, hit = TextButton, conn = connection, shard = n3 % 2 }
	end

	local function fn3(arg2)
		local v = tbl[arg2]

		if v then
			if v.conn then
				pcall(function()
					v.conn:Disconnect()
				end)
			end

			for _, v2 in ipairs({ "tracer", "dot", "label", "hpBg", "hpFill", "hit" }) do
				local v3 = v[v2]

				if v3 then
					pcall(function()
						v3:Destroy()
					end)
				end
			end

			tbl[arg2] = nil
		end

		if arg.getSelectedTarget and arg.getSelectedTarget() == arg2 and arg.selectTarget then
			arg.selectTarget(nil)
		end
	end

	local flag10 = false

	local function fn4()
		if flag10 then
			return
		end
		flag10 = true

		for _, player in ipairs(players:GetPlayers()) do
			if player ~= localPlayer then
				fn2(player)
			end
		end
	end

	track(players.PlayerAdded:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function(f)if f~=j[1]and j[2][7][j[2][6]]then j[3][7][j[3][6]](f);end;end)))

	track(players.PlayerRemoving:Connect(arg.safe(fn3)))

	track(runService.RenderStepped:Connect(arg.safe(--[[ VM helper function (reads VM upvalues, emitted verbatim) ]]
	function()if not(j[1][7][j[1][6]]or j[2][7][j[2][6]]or j[3][7][j[3][6]]or j[4][7][j[4][6]])then if j[5][7][j[5][6]]then for f,f in pairs(j[6])do j[7](f);end;j[8].Visible=false;j[5][7][j[5][6]]=false;end;return;end;if not j[9][7][j[9][6]]then j[10][7][j[10][6]]();end;j[5][7][j[5][6]]=true;j[11][7][j[11][6]]+=1;local f=j[12].fastMode;local R=if f then 3 else j[13].IS_MOBILE and 2 or 1;if R>1 and j[11][7][j[11][6]]%R~=0 then return;end;R=j[14]();local q=R.ViewportSize;local a=j[15]:GetGuiInset();local e=q.X/2;local W=q.Y;local D=j[16]();local Z=j[13].getSelectedTarget and(j[13].getSelectedTarget())or nil;local P=j[13].getForcedTarget and j[13].getForcedTarget()~=nil or false;local T=j[11][7][j[11][6]]%2;local V,u=j[17]and not f,os.clock();local N=u-j[18][7][j[18][6]]>=(f and 0.3 or 0.1);if N then j[18][7][j[18][6]]=u;end;f,u=j[19]:FindFirstChild(j[13].charsFolderName or"Characters"),false;for v,L in pairs(j[6])do repeat if V and v~=Z and L.shard~=T then break;end;local T=L.cModel;if not(T and T.Parent)then T=f and(f:FindFirstChild(v.Name))or v.Character;L.cModel=T;L.cRoot=nil;L.cHead=nil;L.cHum=nil;end;local f=L.cRoot;if not(f and f.Parent)then f=T and(T:FindFirstChild("HumanoidRootPart"));L.cRoot=f;end;local V=L.cHead;if not(V and V.Parent)then V=T and(T:FindFirstChild("Head")or f);L.cHead=V;end;local o=L.cHum;if not(o and o.Parent)then o=T and(T:FindFirstChildOfClass("Humanoid"));L.cHum=o;end;local y,n=j[20](v,f);local H=y~=nil;H=if(if(if H and j[21][7][j[21][6]]and(j[22](o,T))then false else H)and j[23][7][j[23][6]]and not j[24](v)then false else if H and j[21][7][j[21][6]]and(j[22](o,T))then false else H)and j[25][7][j[25][6]]and j[26](v)<=0 then false else if(if H and j[21][7][j[21][6]]and(j[22](o,T))then false else H)and j[23][7][j[23][6]]and not j[24](v)then false else if H and j[21][7][j[21][6]]and(j[22](o,T))then false else H;f=0;if H then f=(y-D).Magnitude;H=if f>j[27][7][j[27][6]]then false else H;end;if not n then V,o=nil,nil;end;if not H then j[7](L);else if N or L.col==nil then L.col=j[28](v);end;local D,H,B=L.col,R:WorldToViewportPoint(y);T,n=R:WorldToViewportPoint((V and V.Position or y)+Vector3.new(0,2.2,0));local R,V=math.floor(T.X-a.X+0.5),math.floor(T.Y-a.Y+0.5);if j[1][7][j[1][6]]then local T=nil;local y=nil;local S=nil;if B then T,y,S=H.X-a.X,H.Y-a.Y,true;elseif j[29][7][j[29][6]]then local J,k=H.X-a.X,H.Y-a.Y;if H.Z<0 then J,k=q.X-J,q.Y-k;end;T,y,S=(math.clamp(J,8,q.X-8)),(math.clamp(k,8,q.Y-8)),true;end;if S then local q,S=T-e,y-W;j[30](L,L.tracer,"trCol",D);local J=math.floor(math.sqrt(q*q+S*S)+0.5);if L.trLen~=J then L.tracer.Size=UDim2.fromOffset(J,2);L.trLen=J;end;j[31](L,L.tracer,"tr",math.floor((e+T)/2+0.5),math.floor((W+y)/2+0.5));J=math.deg(math.atan2(S,q));if L.trRot~=J then L.tracer.Rotation=J;L.trRot=J;end;L.tracer.Visible=true;else L.tracer.Visible=false;end;else L.tracer.Visible=false;end;if j[2][7][j[2][6]]and n then j[30](L,L.dot,"dotCol",D);j[31](L,L.dot,"dot",R,V);L.dot.Visible=true;else L.dot.Visible=false;end;if(j[3][7][j[3][6]]or j[32][7][j[32][6]]and j[26](v)>0)and n then if N or L.label.Text==""then L.label.Text=j[33](v,f,o);end;j[31](L,L.label,"lbl",R,V-8);L.label.Visible=true;else L.label.Visible=false;end;if j[4][7][j[4][6]]and o and n then B,D=H.X-a.X,H.Y-a.Y;local f=math.abs(V-D);local q,a=math.clamp(f*1.15,26,80),(V+D)/2;f=math.clamp(q*0.16,6,40);local e,W=math.floor(B-f-6+0.5),math.floor(q+0.5);j[31](L,L.hpBg,"hp",e,math.floor(a+0.5));if L.hpH~=W then L.hpBg.Size=UDim2.fromOffset(4,W);L.hpH=W;end;e=math.clamp(o.Health/math.max(o.MaxHealth,1),0,1);if L.hpFrac~=e then L.hpFill.Size=UDim2.new(1,0,e,0);L.hpFill.BackgroundColor3=j[34]:Lerp(j[35],e);L.hpFrac=e;end;L.hpBg.Visible=true;else L.hpBg.Visible=false;end;if(j[2][7][j[2][6]]or j[3][7][j[3][6]])and n and not P then j[31](L,L.hit,"hit",R,V);L.hit.Visible=true;else L.hit.Visible=false;end;if v==Z and n then j[36].Text=v.DisplayName;B,H=j[37][7][j[37][6]](),j[13].getForcedTarget and j[13].getForcedTarget()==v;local f=H and j[13].lockStatus and(j[13].lockStatus())or nil;if f=="stream"then j[38].Text="Locked, too far to hit yet";j[38].TextColor3=j[39].AMBER;elseif f=="far"then j[38].Text="Locked, out of range";j[38].TextColor3=j[39].AMBER;elseif H then j[38].Text=B and"Locked. ["..B.."] to unlock"or"Locked";j[38].TextColor3=j[39].GREEN;elseif B then j[38].Text="Press ["..B.."] to lock";j[38].TextColor3=j[39].SUBTEXT;elseif j[13].IS_MOBILE then j[38].Text="Tap the lock button to lock";j[38].TextColor3=j[39].SUBTEXT;else j[38].Text="Bind a Lock Target key";j[38].TextColor3=j[39].SUBTEXT;end;j[8].Position=UDim2.fromOffset(R,V-20);j[8].Visible=true;u=true;end;end;until true;end;if not u then j[8].Visible=false;end;end)))

	sectionLabel(esp, "Visuals", 1)

	local v = makeToggleRow(esp, "spline", "Tracers", "Lines to players, team-coloured", 2, false, function(arg2)
		flag = arg2
	end, "espLines")

	makeToggleRow(esp, "radar", "Off-screen Tracers", "Point to players off-screen too", 3, false, function(arg2)
		flag2 = arg2
	end, "espOffscreen")

	local v2 = makeToggleRow(esp, "circle-dot", "Head Dots", "Team-colour dot over each head", 4, false, function(arg2)
		flag3 = arg2
	end, "espDots")

	local v3 = makeToggleRow(esp, "tag", "Details", "Display name, distance & HP", 5, false, function(arg2)
		flag4 = arg2
	end, "espDetails")

	local v4 = makeToggleRow(esp, "heart", "Health Bar", "Vertical HP bar beside each player", 6, false, function(arg2)
		flag5 = arg2
	end, "espHealth")

	local tbl2 = nil

	arg.espMaster = {
		get = function()
			return flag or flag3 or flag4 or flag5
		end,
		set = function(arg2)
			if arg2 then
				local tbl3 = tbl2 or { details = true, health = true, dots = true }
				v3(tbl3.details or false)
				v4(tbl3.health or false)
				v2(tbl3.dots or false)
				v(tbl3.lines or false)
			else
				tbl2 = { lines = flag, dots = flag3, details = flag4, health = flag5 }
				v(false)
				v2(false)
				v3(false)
				v4(false)
			end
		end,
	}

	makeToggleRow(esp, "badge-alert", "Wanted", "Show wanted players in blue", 7, false, function(arg2)
		flag8 = arg2
	end, "espWanted")

	sectionLabel(esp, "Filter", 8)

	makeToggleRow(esp, "skull", "Hide Dead", "Skip players who are down or dead", 9, true, function(arg2)
		flag6 = arg2
	end, "espHideDead")

	makeToggleRow(esp, "siren", "Police Only", "Only show players on the Police team", 10, false, function(arg2)
		flag7 = arg2
	end, "espPoliceOnly")

	makeToggleRow(esp, "target", "Wanted Only", "Only show wanted players", 11, false, function(arg2)
		flag9 = arg2
	end, "espWantedOnly")

	sectionLabel(esp, "Range", 12)

	makeSlider(esp, "Max Distance", 13, 100, 5000, n2, function(arg2)
		n2 = arg2
	end, true, "espRange")

	table.insert(arg.cleanups, function()
		if arg.nukeGui then
			arg.nukeGui(ScreenGui)
		else
			pcall(function()
				ScreenGui:Destroy()
			end)
		end
	end)
end
