-- For each existing surface, set it to night and freeze time.
-- V2, uses actual night rather than daytime-night due to 2.0.48 adding new solar options.
for _, surface in pairs(game.surfaces) do
	surface.freeze_daytime = true
	surface.daytime = 0.5
end