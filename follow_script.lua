# Create a script in 'ServerScriptService'
# Add a part in 'ServerStorage' and name it 'Ebba'


local Ebba = game:GetService("ServerStorage").Ebba

local function FollowScript(player)
	local char = player.Character
	local root = char.HumanoidRootPart
	local Ebba1 = Ebba:Clone()
	Ebba1.Parent = char
	
	local bodyPos = Instance.new("BodyPosition", Ebba1)
	bodyPos.MaxForce = Vector3.new(4000, 4000, 4000)
local bodyGyro = Instance.new("BodyGyro", Ebba1)
bodyGyro.MaxTorque = Vector3.new(4000, 4000, 4000)
while true do
		wait()
		bodyPos.Position = root.Position + Vector3.new(3, 0.1, 3)
		bodyGyro.CFrame = root.CFrame
	end
	
end

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(char)
		FollowScript(player)
	end)
end)
