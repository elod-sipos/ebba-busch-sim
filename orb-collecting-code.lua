-- Define variables
local player = game.Players.LocalPlayer
local orbsCollected = 0
local maxOrbs = 10 -- Set the maximum number of orbs to spawn
local orbModel = game.ServerStorage.OrbModel -- Set the model of the orb to spawn

-- Create a loop to spawn the orbs
for i = 1, maxOrbs do
    local orb = orbModel:Clone()
    orb.Parent = game.Workspace
    orb.Position = Vector3.new(math.random(-50, 50), 5, math.random(-50, 50)) -- Set the random position of the orb
end

-- Create a function to handle orb collection
local function onOrbCollected(orb)
    orbsCollected = orbsCollected + 1 -- Increment the orb counter
    orb:Destroy() -- Destroy the collected orb
    game:GetService("ReplicatedStorage").OrbsCollected:FireClient(player, orbsCollected) -- Update the client with the new orb count
end

-- Create a loop to check for orb collection
while true do
    wait() -- Wait for the script to avoid excessive server load
    for _, orb in pairs(game.Workspace:GetChildren()) do
        if orb.Name == "Orb" and (orb.Position - player.Character.HumanoidRootPart.Position).magnitude <= 3 then -- Check if the player is close to an orb
            onOrbCollected(orb) -- Call the function to handle orb collection
        end
    end
end
