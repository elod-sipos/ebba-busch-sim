# Create a LocalScript in the player's PlayerGui folder


-- Define variables
local player = game.Players.LocalPlayer
local gui = script.Parent
local orbCountLabel = gui.OrbCountLabel

-- Listen for the OrbsCollected event from the server and update the orb counter label
game:GetService("ReplicatedStorage").OrbsCollected.OnClientEvent:Connect(function(count)
    orbCountLabel.Text = "Orbs Collected: " .. count
end)
