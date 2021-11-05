local Start_Here = {}

function Start_Here.show_tick(obj)
	obj:FindDescendantByName("Tick").visibility = Visibility.FORCE_ON
end

return Start_Here