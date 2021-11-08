local ACTIVITY_HANDLER = script.parent
local root = script:GetCustomProperty("root"):WaitForObject()
local bullet = script:GetCustomProperty("bullet")
local bullet_pos = script:GetCustomProperty("bullet_pos"):WaitForObject()
local npc = script:GetCustomProperty("npc"):WaitForObject()

local task = nil
local has_hit = false

local function on_impact(projectile, obj, hit)
	if(Object.IsValid(obj) and obj == npc and not has_hit) then
		has_hit = true
		Events.Broadcast("rotation_task_3_complete")
	end
end

local function shoot()
	local start_pos = bullet_pos:GetWorldPosition()

	local direction = ACTIVITY_HANDLER:GetWorldRotation() * Vector3.FORWARD
	local proj = Projectile.Spawn(bullet, start_pos, direction)

	proj.speed = 160
	proj.shouldDieOnImpact = false
	proj.lifeSpan = 2
	proj.gravityScale = 0

	proj.impactEvent:Connect(on_impact)
end

if(root.visibility ~= Visibility.FORCE_OFF) then
	task = Task.Spawn(shoot)

	task.repeatInterval = 1
	task.repeatCount = -1
end