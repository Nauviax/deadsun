-- When a platform changes state, enable solar if at station. Otherwise, disable solar.
script.on_event(defines.events.on_space_platform_changed_state, function(event)
	if event.platform.surface then -- Check platform exists first
		event.platform.surface.solar_power_multiplier = (event.platform.space_location ~= nil) and 1 or 0
	end
end)
-- Currently, if a platform arives at a station while paused, (Due to gravity normally), conduits will not turn back on.
-- Fixed manually by turning automatic back on. No need to leave orbit, and can be paused again afterwards if wanted.