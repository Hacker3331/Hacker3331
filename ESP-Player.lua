local Players = game:GetService("Players"):GetChildren()
local RunService = game:GetService("RunService")
local highlight = Instance.new = "Highlight"
highlight.Name = "Highlight"

local function getCharacter(player)
    return
    workspace.FindFirstChild(player, Name)
end

for i,v in pairs(Players) do
    repeat wait() until getCharacter(v)
    if not getCharacter(v):FindFirstChild("HumanoidRootPart") then
        local highlightClone = highlight:Clone()
        highlightClone.Adornee = getCharacter(v)
        highlightClone.Parent = getCharacter(v):FindFirstChild("HumanoidRootPart")
        highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlightClone.Name = "Highlight"
    end
end

game.Players.PlayerAdded:Connect(function (player))
    repeat wait() until getCharacter(v)
    if not getCharacter(v):FindFirstChild("HumanoidRootPart") then
        local highlightClone = highlight:Clone()
        highlightClone.Adornee = getCharacter(v)
        highlightClone.Parent = getCharacter(v):FindFirstChild("HumanoidRootPart")
        highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlightClone.Name = "Highlight"
    end
end

game.Players.PlayerRemoving:Connect(function(playerRemoved)
    playerRemoved.Charater:FindFirstChild("HumanoidRootPart").Highlight:Destroy()
end)

RunService.Heartbeat:Connect(function()
    for i,v in pairs(Players) do
        repeat wait() until getCharacter(v)
        if not getCharacter(v):FindFirstChild("HumanoidRootPart") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = getCharacter(v)
            highlightClone.Parent = getCharacter(v):FindFirstChild("HumanoidRootPart")
            highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlightClone.Name = "Highlight"
            task.wait()
        end
    end
end)
