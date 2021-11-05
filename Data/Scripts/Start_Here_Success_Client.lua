local success = script:GetCustomProperty("success"):WaitForObject()
local current = script:GetCustomProperty("current"):WaitForObject()
local next = script:GetCustomProperty("next"):WaitForObject()

Events.Connect("show_success", function(current_text, next_text)
	success.visibility = Visibility.FORCE_ON
	current.text = "Challenge - " .. current_text
	next.text = "Challenge - " .. next_text
end)