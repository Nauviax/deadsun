-- KILL THE SUN (finally). File is exactly the same as old one, just colour changes.
data.raw["utility-sprites"]["default"].starmap_star.filename = "__deadsun__/graphics/starmap/starmap-star-dead.png"

-- Make night pitch black. Small lamp buffs, free red lamp on platform hubs.
require("data_stuff/dark_night.lua")

-- Changes to do with solar power, and conduit power.
require("data_stuff/solar_changes.lua")

-- Fulgora changes, lightning mainly. (Night is a buff, so these are mostly big nerfs. Free power is pooey)
require("data_stuff/fulgora_changes.lua")