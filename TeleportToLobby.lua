local GameId = "1234567890" -- Change this ID of games of the lobby..

function (Player)
    local FromChar = game.Players:GetPlayerFromCharacter(Player.Parent)
    if FromChar then
        local TeleService = game:GetService("TeleportService")
        TeleService:Teleport(GameId,FromChar)
    end
end
