local Start_Here = require(script:GetCustomProperty("Start_Here_API"))

local root = script.parent.parent

local step1_ui = script:GetCustomProperty("step1_ui"):WaitForObject()

Start_Here.show_tick(step1_ui)

if(root.visibility ~= Visibility.FORCE_OFF) then
	Events.Broadcast("show_success", "Start Here", "Visibility")
	Events.BroadcastToServer("spawn", "Start Here")
end