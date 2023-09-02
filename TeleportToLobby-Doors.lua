local GameId = "6516141723" -- Change this ID to the games ID which you want players to teleport to

function (Player)
    local FromChar = game.Players:GetPlayerFromCharacter(Player.Parent)
    if FromChar then
        local TeleService = game:GetService("TeleportService")
        TeleService:Teleport(GameId,FromChar)
    end
end
