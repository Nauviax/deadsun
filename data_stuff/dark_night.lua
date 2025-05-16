-- Remove night vision and it's tech. Also disable the item's ability to turn on, in case someone somehow gets it.
data.raw.technology["night-vision-equipment"] = nil
data.raw.recipe["night-vision-equipment"] = nil
data.raw.item["night-vision-equipment"].hidden = true
data.raw["night-vision-equipment"]["night-vision-equipment"].hidden = true
data.raw["night-vision-equipment"]["night-vision-equipment"].darkness_to_turn_on = 1

-- Remove/overwrite character flashlight, but leave the aoe light, slightly larger. Permanently on.
data.raw["character"]["character"].light = {intensity = 0.4, size = 40}

-- Make vanilla small-lamp a bit brighter, and permanently on.
data.raw["lamp"]["small-lamp"].light = {intensity = 0.9, size = 70} -- Defaults are 0.9 and 40 I think?
data.raw["lamp"]["small-lamp"].always_on = true

-- Add free light to space platform hubs
data.raw["space-platform-hub"]["space-platform-hub"].stateless_visualisation = { -- 2.0 new feature pretty sure. Glad for it.
	light = {intensity = 0.5, size = 50, color = {r=1, g=0, b=0}} -- Emergency red light, for before other lamps are built
}

-- Add area lights to vehichles, and make them permanently on.
local car = data.raw["car"]["car"]
table.insert(car.light, {intensity = 0.4, size = 40}) -- Add area light to match player.
local tank = data.raw["car"]["tank"]
table.insert(tank.light, {intensity = 0.4, size = 40}) -- Add area light to match player.
local spidertron = data.raw["spider-vehicle"]["spidertron"]
spidertron.graphics_set.light[1] = {intensity = 0.4, size = 40} -- Adjust area light to match player. (Always on, so *appears* to dim on enter)
spidertron.graphics_set.light_positions = {} -- Remove eye lights, they look weird in this system.


-- I'd like to change editor cursor light, but unsure how to do so. Prototype seems to only have a bool, not a minimum_darkness.


-- Make night pitch black
-- Create color lookup. Dark for basically whole game. (And effectively whole game, because frozen daytime.)
local colorLookup = {
	{0, "identity"},
	{0.1, "__deadsun__/graphics/color_luts/black-lut.png"},
	{0.9, "__deadsun__/graphics/color_luts/black-lut.png"}
}
-- Player view
data.raw["utility-constants"]["default"].daytime_color_lookup = colorLookup
-- Map view
data.raw["utility-constants"]["default"].zoom_to_world_daytime_color_lookup = colorLookup

-- New planets have a different color lookup, of course they do.
local fulgora_lookup = { -- Leaving a few out here
	{0, "__space-age__/graphics/lut/fulgora-1-noon.png"},
	{0.1, "__deadsun__/graphics/color_luts/black-lut.png"},
	{0.9, "__deadsun__/graphics/color_luts/black-lut.png"}
}
data.raw["planet"]["fulgora"].surface_render_parameters.day_night_cycle_color_lookup = fulgora_lookup
local gleba_lookup = {
	{0, "__space-age__/graphics/lut/gleba-1-noon.png"},
	{0.1, "__deadsun__/graphics/color_luts/black-lut.png"},
	{0.9, "__deadsun__/graphics/color_luts/black-lut.png"}
}
data.raw["planet"]["gleba"].surface_render_parameters.day_night_cycle_color_lookup = gleba_lookup
local vulcanus_lookup = {
	{0, "__space-age__/graphics/lut/vulcanus-1-day.png"},
	{0.1, "__deadsun__/graphics/color_luts/black-lut.png"},
	{0.9, "__deadsun__/graphics/color_luts/black-lut.png"}
}
data.raw["planet"]["vulcanus"].surface_render_parameters.day_night_cycle_color_lookup = vulcanus_lookup
-- Aquilo doesn't have it's own, which is nice.