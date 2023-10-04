game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        local head = character:WaitForChild("Head")
        head.Transparency = 1

        for _, item in head:GetChildren() do
            if string.find(string.lower(item.Name), "face") Then
                item:Destroy()
end)
