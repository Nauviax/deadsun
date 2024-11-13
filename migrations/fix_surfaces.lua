-- For each existing surface, set it to night and freeze time.
for _, surface in pairs(game.surfaces) do
	surface.freeze_daytime = true
	if surface.name == "fulgora" then
		surface.daytime = 0.5 -- Fulgora requires night for lightning.
	else
		surface.daytime = 0.15 -- Stil day technically. Just dark.
	end
end