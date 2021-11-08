local success = script:GetCustomProperty("success"):WaitForObject()
local current = script:GetCustomProperty("current"):WaitForObject()
local next = script:GetCustomProperty("next"):WaitForObject()
local complete = script:GetCustomProperty("complete"):WaitForObject()

Events.Connect("show_success", function(current_text, next_text)
	success.visibility = Visibility.FORCE_ON
	current.text = "Challenge - " .. current_text
	next.text = "Challenge - " .. next_text
end)

Events.Connect("complete", function()
	complete.visibility = Visibility.FORCE_ON
end)