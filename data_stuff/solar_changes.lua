-- Half the power of personal solar due to running all the time. Still overall less J per "day".
-- Clone existing item, change power AND TYPE, save to generator-equipment, and remove old item.
local solar_panel_equipment = util.table.deepcopy(data.raw["solar-panel-equipment"]["solar-panel-equipment"])
solar_panel_equipment.power = "15kW"
solar_panel_equipment.type = "generator-equipment"
data.raw["solar-panel-equipment"]["solar-panel-equipment"] = nil
data:extend{solar_panel_equipment} -- Now in generator-equipment, so it doesn't depend on solar anymore.
-- Locale is edited to reflect this

-- Also change it to have a new recipe, that doesn't require solar panels.
data.raw["recipe"]["solar-panel-equipment"].ingredients = {
	{type="item", name="steel-plate", amount=5},
	{type="item", name="advanced-circuit", amount=5},
	{type="item", name="engine-unit", amount=5},
}
-- And change the recycling recipe to match.
data.raw["recipe"]["solar-panel-equipment-recycling"].results = {
	{type="item", name="steel-plate", amount=1, extra_count_fraction=0.25},
	{type="item", name="advanced-circuit", amount=1, extra_count_fraction=0.25},
	{type="item", name="engine-unit", amount=1, extra_count_fraction=0.25},
}

-- Adjust equipment tech to not require solar energy.
data.raw["technology"]["solar-panel-equipment"].prerequisites = {"modular-armor"}


-- Conduit power! (Secretly just a solar panel)
-- Set solar generation
data.raw["solar-panel"]["solar-panel"].production = "1MW"
data.raw["solar-panel"]["solar-panel"].performance_at_night = 1 -- Full power at night.

-- Set each location's solar. Individually. Locale changes to solar text as well.
data.raw["planet"]["vulcanus"].surface_properties["solar-power"] = 1.2
data.raw["planet"]["vulcanus"].solar_power_in_space = 120
data.raw["planet"]["nauvis"].surface_properties["solar-power"] = 1
data.raw["planet"]["nauvis"].solar_power_in_space = 100
data.raw["planet"]["gleba"].surface_properties["solar-power"] = 0.8
data.raw["planet"]["gleba"].solar_power_in_space = 80
data.raw["planet"]["fulgora"].surface_properties["solar-power"] = 0.6
data.raw["planet"]["fulgora"].solar_power_in_space = 60
data.raw["planet"]["aquilo"].surface_properties["solar-power"] = 0.1
data.raw["planet"]["aquilo"].solar_power_in_space = 1
data.raw["space-location"]["solar-system-edge"].solar_power_in_space = 0
data.raw["space-location"]["shattered-planet"].solar_power_in_space = 0

-- Change solar panel recipe to be more expensive, stone and processing units, with some steel for the frame.
data.raw["recipe"]["solar-panel"].ingredients = {
	{type="item", name="stone", amount=1000},
	{type="item", name="processing-unit", amount=80},
	{type="item", name="steel-plate", amount=80}
}
data.raw["recipe"]["solar-panel"].energy_required = 120
-- aaand the recycling recipe. Self recycle, to avoid people using this as dense stone storage.
data.raw["recipe"]["solar-panel-recycling"].results = {
	{type="item", name="solar-panel", amount=1, probability=0.25, ignored_by_stats=1},
}
-- Ensure weight is set, as otherwise too heavy!
data.raw["item"]["solar-panel"].weight = 200000 -- 5 per rocket, should be plenty
data.raw["item"]["solar-panel"].stack_size = 5

-- Adjust tech prerequisites, putting solar between processing units and the silo.
data.raw["technology"]["solar-energy"].prerequisites = {"processing-unit"}
data.raw["technology"]["solar-energy"].unit = { -- The same as processing units.
	count = 300,
	ingredients =
	{
	  {"automation-science-pack", 1},
	  {"logistic-science-pack", 1},
	  {"chemical-science-pack", 1}
	},
	time = 60
}
table.insert(data.raw["technology"]["rocket-silo"].prerequisites, "solar-energy")

-- Texture and animation stuff
data.raw["item"]["solar-panel"].icon = "__deadsun__/graphics/icons/conduit-icon.png"
data.raw["item"]["solar-panel"].icon_size = 93
data.raw["technology"]["solar-energy"].icon = "__deadsun__/graphics/icons/conduit-icon-hr.png"
data.raw["technology"]["solar-energy"].icon_size = 292
data.raw["solar-panel"]["solar-panel"].icon = "__deadsun__/graphics/icons/conduit-icon.png"
data.raw["solar-panel"]["solar-panel"].icon_size = 93
data.raw["solar-panel"]["solar-panel"].stateless_visualisation = {
	{
		animation = {
			filename = "__deadsun__/graphics/entity/conduit/conduit-hr-animation.png",
			priority = "high",
			width = 200,
			height = 290,
			shift = {0, -0.5},
			scale = 0.45,
			frame_count = 60,
			line_length = 8,
			animation_speed = 1.0,
		},
		shadow = {
			filename = "__deadsun__/graphics/entity/conduit/conduit-hr-shadow.png",
			priority = "high",
			width = 600,
			height = 400,
			shift = {0, -0.5},
			scale = 0.45,
			draw_as_shadow = true,
		}
	},
	{
		animation = {
			filename = "__deadsun__/graphics/entity/conduit/conduit-hr-emission.png",
			priority = "high",
			width = 200,
			height = 290,
			shift = {0, -0.5},
			scale = 0.45,
			draw_as_light = true,
			frame_count = 60,
			line_length = 8,
			animation_speed = 1.0,
		}
	}
	
}
data.raw["solar-panel"]["solar-panel"].drawing_box_vertical_extension = 0.65 -- Lower sprite in gui so top can be seen
data.raw["solar-panel"]["solar-panel"].picture = { -- Show *something* for when built as ghost.
	filename = "__deadsun__/graphics/entity/conduit/conduit-hr-animation.png",
	priority = "high",
	width = 200,
	height = 290,
	shift = {0, -0.5},
	scale = 0.45
}
data.raw["solar-panel"]["solar-panel"].overlay = nil -- Get outa here
