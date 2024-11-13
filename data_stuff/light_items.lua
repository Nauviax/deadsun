-- Bonfire (woo)
local bonfire_fire = util.table.deepcopy(data.raw["fire"]["fire-flame"]);
bonfire_fire.name = "ds-bonfire"
bonfire_fire.damage_per_tick = {amount = 0, type = "fire"} -- No damage sadly, too easy to cheese biters.
bonfire_fire.initial_lifetime = 18000 -- 5 minutes
bonfire_fire.maximum_lifetime = 18000
bonfire_fire.light = {intensity = 0.5, size = 35}
data:extend({bonfire_fire})
data:extend({
	{
		type = "item",
		name = "ds-bonfire",
		icon = "__deadsun__/graphics/icons/bonfire.png",
		icon_size = 32,
		subgroup = "circuit-network",
		order = "a[light]-a[bonfire]",
		place_result = "ds-bonfire",
		stack_size = 10,
		fuel_category = "chemical",
		fuel_value = "2MJ" -- Same as a single piece of wood, so less than just burning two wood.
	},
	{
		type = "recipe",
		name = "ds-bonfire",
		enabled = true,
		ingredients = {{type="item", name="wood", amount=2}},
		results = {{type="item", name="ds-bonfire", amount=1}}
	}
})


-- New follower bot that slowly follows player and emits light. (THIS TOOK SO LONG TO FIGURE OUT AAAAA)

-- Clone basic follower robot
local lamp_bot = util.table.deepcopy(data.raw["combat-robot"]["defender"])
lamp_bot.name = "ds-lamp-bot"
lamp_bot.order = "l[lamp_bot]"
lamp_bot.icon = "__deadsun__/graphics/icons/lamp_bot.png"
lamp_bot.icon_size = 32
lamp_bot.attack_parameters = {
	type = "beam",
	range = 0,
	cooldown = 100000,
	ammo_category = "melee",
	ammo_type = {} -- We don't do shooting here
}
lamp_bot.light = {intensity = 0.5, size = 150}
lamp_bot.time_to_live = 54000 -- 15 minutes
lamp_bot.speed = 0.01
lamp_bot.max_speed = 0.03
data:extend({lamp_bot})

-- Clone basic follower robot projectile
local lamp_bot_projectile = util.table.deepcopy(data.raw["projectile"]["defender-capsule"])
lamp_bot_projectile.name = "ds-lamp-bot-projectile"
lamp_bot_projectile.action.action_delivery.target_effects = {
	type = "create-entity",
	entity_name = "ds-lamp-bot",
	show_in_tooltip = true
}
data:extend({lamp_bot_projectile})

-- Clone basic follower robot item capsule thing
local lamp_bot_capsule = util.table.deepcopy(data.raw["capsule"]["defender-capsule"])
lamp_bot_capsule.name = "ds-lamp-bot"
lamp_bot_capsule.icon = "__deadsun__/graphics/icons/lamp_bot.png"
lamp_bot_capsule.icon_size = 32
lamp_bot_capsule.subgroup = "capsule"
lamp_bot_capsule.order = "l[lamp_bot]"
lamp_bot_capsule.capsule_action.attack_parameters.cooldown = 30
lamp_bot_capsule.capsule_action.attack_parameters.ammo_type.action[1].action_delivery.projectile = "ds-lamp-bot-projectile"
data:extend({lamp_bot_capsule})

-- Clone basic follower robot recipe
local lamp_bot_recipe = util.table.deepcopy(data.raw["recipe"]["defender-capsule"])
lamp_bot_recipe.name = "ds-lamp-bot"
lamp_bot_recipe.ingredients = {
	{type="item", name="electronic-circuit", amount=2},
	{type="item", name="iron-gear-wheel", amount=2},
	{type="item", name="small-lamp", amount=1}
}
lamp_bot_recipe.results = {{type="item", name="ds-lamp-bot", amount=1}}
lamp_bot_recipe.enabled = false
data:extend({lamp_bot_recipe})

-- Add lamp bot to lamp technology unlocks
table.insert(data.raw["technology"]["lamp"].effects, {type = "unlock-recipe", recipe = "ds-lamp-bot"})
