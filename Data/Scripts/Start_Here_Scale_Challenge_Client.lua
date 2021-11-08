local Start_Here = require(script:GetCustomProperty("Start_Here_API"))

local root = script:GetCustomProperty("root"):WaitForObject()

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

if(sphere_scale.x >= 2.9 and sphere_scale.x <= 3.1 and sphere_scale.y >= 2.9 and sphere_scale.y <= 3.1 and sphere_scale.z >= 2.9 and sphere_scale.z <= 3.1) then
	success = success + 1
	Start_Here.show_tick(step2_ui)
end

local cylinder = blue_cylinder:GetWorldScale()

if(sphere_scale.z >= 2.4 and cylinder.z < 2.6) then
	success = success + 1
	Start_Here.show_tick(step3_ui)
end

if(success == 3 and root.visibility ~= Visibility.FORCE_OFF) then
	Events.Broadcast("show_success", "Scale", "Material")
end