game.Players.PlayerAdded:Connect(function(player) 
    player.CharacterAdded:Connect(function(chr) 
      
      local Humanoid = chr:WaitForChild("Humanoid")
      local Desc = Humanoid:GetAppliedDescription()
      Desc.RightLeg = 139607718
      
    end
  end)
end)
