Events.ConnectForPlayer("spawn", function(player, where)
	player:SetWorldPosition(script.parent:FindChildByName(where):GetWorldPosition())
	player:SetWorldRotation(script.parent:FindChildByName(where):GetWorldRotation())
end)