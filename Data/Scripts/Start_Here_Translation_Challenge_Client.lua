local Start_Here = require(script:GetCustomProperty("Start_Here_API"))

local root = script:GetCustomProperty("root"):WaitForObject()

local yellow_trigger = script:GetCustomProperty("yellow_trigger"):WaitForObject()
local yellow_cube = script:GetCustomProperty("yellow_cube"):WaitForObject()

local red_sphere = script:GetCustomProperty("red_sphere"):WaitForObject()
local red_trigger = script:GetCustomProperty("red_trigger"):WaitForObject()

local blue_cylinder = script:GetCustomProperty("blue_cylinder"):WaitForObject()
local blue_trigger = script:GetCustomProperty("blue_trigger"):WaitForObject()

local step1_ui = script:GetCustomProperty("step1_ui"):WaitForObject()
local step2_ui = script:GetCustomProperty("step2_ui"):WaitForObject()
local step3_ui = script:GetCustomProperty("step3_ui"):WaitForObject()
local step4_ui = script:GetCustomProperty("step4_ui"):WaitForObject()

local success = 0

Start_Here.show_tick(step4_ui)

for i, o in ipairs(yellow_trigger:GetOverlappingObjects()) do
	if(o == yellow_cube) then
		Start_Here.show_tick(step1_ui)
		success = success + 1
		break
	end
end

for i, o in ipairs(red_trigger:GetOverlappingObjects()) do
	if(o == red_sphere) then
		Start_Here.show_tick(step2_ui)
		success = success + 1
		break
	end
end

for i, o in ipairs(blue_trigger:GetOverlappingObjects()) do
	if(o == blue_cylinder) then
		Start_Here.show_tick(step3_ui)
		success = success + 1
		break
	end
end

if(success == 3 and root.visibility ~= Visibility.FORCE_OFF) then
	Events.Broadcast("show_success", "Translation", "Rotation")
end