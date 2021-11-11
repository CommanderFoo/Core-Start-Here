local Start_Here = require(script:GetCustomProperty("Start_Here_API"))

local root = script.parent.parent

local step1_ui = script:GetCustomProperty("step1_ui"):WaitForObject()
local step2_ui = script:GetCustomProperty("step2_ui"):WaitForObject()
local step3_ui = script:GetCustomProperty("step3_ui"):WaitForObject()
local step4_ui = script:GetCustomProperty("step4_ui"):WaitForObject()

local chest = script:GetCustomProperty("chest"):WaitForObject()
local fox = script:GetCustomProperty("fox"):WaitForObject()

local success = 0

Start_Here.show_tick(step4_ui)

if(chest:GetWorldRotation().z > 85 and chest:GetWorldRotation().z < 95) then
	Start_Here.show_tick(step1_ui)
	success = success + 1
end

if(fox:GetWorldRotation().z < -115 and fox:GetWorldRotation().z > -155) then
	Start_Here.show_tick(step2_ui)
	success = success + 1
end

Events.Connect("rotation_task_3_complete", function()
	Start_Here.show_tick(step3_ui)
	success = success + 1

	if(success == 3 and root.visibility ~= Visibility.FORCE_OFF) then
		Events.Broadcast("show_success", "Rotation", "Scale")
	end
end)

if(root.visibility ~= Visibility.FORCE_OFF) then
	Events.BroadcastToServer("spawn", "Rotation")
end