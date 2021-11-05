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

if(yellow_cube.visibility == Visibility.INHERIT) then
	Start_Here.show_tick(step1_ui)
	success = success + 1
end

if(red_sphere.visibility == Visibility.FORCE_OFF) then
	Start_Here.show_tick(step2_ui)
	success = success + 1
end

if(blue_cylinder.visibility == Visibility.INHERIT) then
	Start_Here.show_tick(step3_ui)
	success = success + 1
end

if(success == 3 and root.visibility ~= Visibility.FORCE_OFF) then
	Events.Broadcast("show_success", "Visibility", "Translation")
end