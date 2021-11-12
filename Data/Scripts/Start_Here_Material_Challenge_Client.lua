local Start_Here = require(script:GetCustomProperty("Start_Here_API"))

local root = script.parent.parent

local step1_ui = script:GetCustomProperty("step1_ui"):WaitForObject()
local step2_ui = script:GetCustomProperty("step2_ui"):WaitForObject()
local step3_ui = script:GetCustomProperty("step3_ui"):WaitForObject()
local step4_ui = script:GetCustomProperty("step4_ui"):WaitForObject()
local step5_ui = script:GetCustomProperty("step5_ui"):WaitForObject()

local yellow_cube = script:GetCustomProperty("yellow_cube"):WaitForObject()
local red_sphere = script:GetCustomProperty("red_sphere"):WaitForObject()
local bottle = script:GetCustomProperty("bottle"):WaitForObject()
local white_sphere = script:GetCustomProperty("white_sphere"):WaitForObject()

local success = 0

Start_Here.show_tick(step5_ui)

local cube_material = yellow_cube:GetMaterialSlots()[1]
local cube_color = cube_material:GetColor()

if(cube_color ~= Color.YELLOW) then
	success = success + 1
	Start_Here.show_tick(step1_ui)
end

local sphere_material = red_sphere:GetMaterialSlots()[1]

if(sphere_material.materialAssetName ~= "Basic Material") then
	success = success + 1
	Start_Here.show_tick(step2_ui)
end

local bottle_material = bottle:GetMaterialSlots()[2]

if(bottle_material:GetColor() ~= Color.WHITE) then
	success = success + 1
	Start_Here.show_tick(step3_ui)
end

local white_sphere_material = white_sphere:GetMaterialSlots()[1]

if(white_sphere_material.materialAssetName == "Asphalt 01") then
	success = success + 1
	Start_Here.show_tick(step4_ui)
end

if(success == 4 and root.visibility ~= Visibility.FORCE_OFF) then
	Events.Broadcast("complete")
end

if(root.visibility ~= Visibility.FORCE_OFF) then
	Events.BroadcastToServer("spawn", "Material")
end