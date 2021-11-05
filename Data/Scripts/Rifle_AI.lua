local ACTIVITY_HANDLER = script.parent

local bullet = script:GetCustomProperty("bullet")
local bullet_pos = script:GetCustomProperty("bullet_pos"):WaitForObject()


local function OnImpact(projectile, obj, hit)
	if Object.IsValid(obj) then
		print(hit.other.name)
	end
end

local function shoot()
	local start_pos = bullet_pos:GetWorldPosition()

	local direction = ACTIVITY_HANDLER:GetWorldRotation() * Vector3.FORWARD
	local proj = Projectile.Spawn(bullet, start_pos, direction)

	proj.speed = 80
	proj.shouldDieOnImpact = true
	proj.lifeSpan = 6
	proj.gravityScale = 0

	proj.impactEvent:Connect(OnImpact)
end

local t = Task.Spawn(shoot)

t.repeatInterval = 1
t.repeatCount = -1