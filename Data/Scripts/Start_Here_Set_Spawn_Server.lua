Events.ConnectForPlayer("spawn", function(player, where)
	player:SetWorldPosition(script.parent:FindChildByName(where):GetWorldPosition())
	player:SetWorldRotation(script.parent:FindChildByName(where):GetWorldRotation())
end)

--[[
	Finish start here
	Make start here a challenge
	Do material 4 (find)
	Update all images
	Publish unlisted
]]