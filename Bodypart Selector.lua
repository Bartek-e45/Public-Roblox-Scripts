for i, bodypart in char:GetChildren() do
	local sel_box = Instance.new("SelectionBox")
	sel_box.Color3 = Color3.fromRGB(25, 255, 33)
	sel_box.LineThickness = 0.05
	sel_box.Adornee = bodypart
	sel_box.Parent = bodypart
	sel_box.Visible = false
end

local mouse = player:GetMouse()

local raycastParams = RaycastParams.new()
raycastParams.FilterDescendantsInstances = {char}
raycastParams.FilterType = Enum.RaycastFilterType.Include

mouse.Move:Connect(function()
	local raycastResult = workspace:Raycast(mouse.UnitRay.Origin, mouse.UnitRay.Direction * 250, raycastParams)

	if raycastResult then
		local raycastHit = raycastResult.Instance
		if raycastHit then
			local raycastModel = raycastHit:FindFirstAncestorOfClass("Model")
			if raycastModel.Name == player.Name and raycastHit.Name ~= "Handle" and "HumanoidRootPart" then

				for i, bodypart in char:GetChildren() do
					if bodypart:FindFirstChild("SelectionBox") then
						bodypart:FindFirstChild("SelectionBox").Visible = false
					end
				end

				if raycastHit:FindFirstChild("SelectionBox") then
					raycastHit:FindFirstChild("SelectionBox").Visible = true
				end

			end
		end
	end
end)

mouse.Button1Up:Connect(function()
	local raycastResult = workspace:Raycast(mouse.UnitRay.Origin, mouse.UnitRay.Direction * 250, raycastParams)

	if raycastResult then
		local raycastHit = raycastResult.Instance
		if raycastHit then
			local raycastModel = raycastHit:FindFirstAncestorOfClass("Model")
			if raycastModel.Name == player.Name and raycastHit.Name ~= "Handle" and "HumanoidRootPart" then
				print(raycastResult.Instance)
			end
		end
	end
end)
