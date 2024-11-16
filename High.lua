local player = game.Players.LocalPlayer
local highlightPlayer = game.Players:FindFirstChild("PlayerName") -- Replace "PlayerName" with the actual player's name you want to highlight
local RunService = game:GetService("RunService")

local highlight
local billboardGui
local textLabel

local function createHighlightAndGui()
    if highlightPlayer and highlightPlayer.Character then
        -- Create Highlight
        highlight = Instance.new("Highlight")
        highlight.Adornee = highlightPlayer.Character
        highlight.FillColor = Color3.new(1, 0, 0) -- Red color
        highlight.FillTransparency = 0.5
        highlight.OutlineColor = Color3.new(1, 1, 0) -- Yellow outline
        highlight.OutlineTransparency = 0
        highlight.Parent = highlightPlayer.Character

        -- Create BillboardGui
        billboardGui = Instance.new("BillboardGui")
        billboardGui.Adornee = highlightPlayer.Character:WaitForChild("Head")
        billboardGui.Size = UDim2.new(0, 100, 0, 50)
        billboardGui.StudsOffset = Vector3.new(0, 3, 0)
        billboardGui.Parent = highlightPlayer.Character.Head

        -- Create TextLabel
        textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = highlightPlayer.Name
        textLabel.TextColor3 = Color3.new(1, 1, 1) -- White text
        textLabel.TextScaled = true
        textLabel.Parent = billboardGui
    end
end

local function calculateDistance()
    while true do
        if highlightPlayer and highlightPlayer.Character and highlightPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local playerPosition = player.Character.HumanoidRootPart.Position
            local targetPosition = highlightPlayer.Character.HumanoidRootPart.Position
            local distance = (playerPosition - targetPosition).magnitude
            
            -- Optional: Print the distance to the output
            print("Distance to " .. highlightPlayer.Name .. ": " .. distance)
        end
        wait(0.01) -- Wait for 10 milliseconds
    end
end

-- Monitor player joining
game.Players.PlayerAdded:Connect(function(newPlayer)
    if newPlayer.Name == "PlayerName" then -- Replace "PlayerName" with the actual player's name you want to highlight
        highlightPlayer = newPlayer
        createHighlightAndGui()
    end
end)

-- Initial creation
createHighlightAndGui()

-- Start calculating distance
calculateDistance()
