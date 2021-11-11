local Start_Here = require(script:GetCustomProperty("Start_Here_API"))

local root = script.parent.parent

local yellow_cube = script:GetCustomProperty("yellow_cube"):WaitForObject()
local red_sphere = script:GetCustomProperty("red_sphere"):WaitForObject()
local blue_cylinder = script:GetCustomProperty("blue_cylinder"):WaitForObject()

local step1_ui = script:GetCustomProperty("step1_ui"):WaitForObject()
local step2_ui = script:GetCustomProperty("step2_ui"):WaitForObject()
local step3_ui = script:GetCustomProperty("step3_ui"):WaitForObject()
local step4_ui = script:GetCustomProperty("step4_ui"):WaitForObject()

local success = 0

Start_Here.show_tick(step4_ui)

local yellow_scale = yellow_cube:GetWorldScale()

if(yellow_scale.x == 1 and yellow_scale.y == 2 and yellow_scale.z == 1) then
	success = success + 1
	Start_Here.show_tick(step1_ui)
end

local sphere_scale = red_sphere:GetWorldScale()

if(sphere_scale.x >= 2.25 and sphere_scale.x <= 2.35 and sphere_scale.y >= 2.25 and sphere_scale.y <= 2.35 and sphere_scale.z >= 2.25 and sphere_scale.z <= 2.35) then
	success = success + 1
	Start_Here.show_tick(step2_ui)
end

local cylinder = blue_cylinder:GetWorldScale()

if(cylinder.z >= 2.4 and cylinder.z <= 2.6) then
	success = success + 1
	Start_Here.show_tick(step3_ui)
end

if(success == 3 and root.visibility ~= Visibility.FORCE_OFF) then
	Events.Broadcast("show_success", "Scale", "Material")
end

if(root.visibility ~= Visibility.FORCE_OFF) then
	Events.BroadcastToServer("spawn", "Scale")
end