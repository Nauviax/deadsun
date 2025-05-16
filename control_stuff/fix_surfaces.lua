-- Freeze surfaces at night as they get generated.

-- Nauvis already exists, so we change it immediately.
-- We can't use on_init() because the game apparently sets the daytime after on_init() is called.
script.on_event(defines.events.on_player_created, function()
	local nauvis_surface = game.surfaces[1]
	nauvis_surface.freeze_daytime = true
	nauvis_surface.daytime = 0.5 -- Midnight
end)

-- Other planets will call on_surface_created(), so we change it there.
script.on_event(defines.events.on_surface_created, function(event)
	local surface = game.surfaces[event.surface_index]
	surface.freeze_daytime = true
	surface.daytime = 0.5
end)