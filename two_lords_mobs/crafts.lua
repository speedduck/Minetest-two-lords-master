
-- Register Items

minetest.register_craftitem("two_lords_mobs:elf_contract", {
    description = "An Elven Contract(Right-click elf to pickup)",
    inventory_image = "two_lords_contract.png",
	stack_max = 200,
})

minetest.register_craftitem("two_lords_mobs:dwarf_contract", {
    description = "A Dwarven Contract(Right-click dwarf to pickup)",
    inventory_image = "two_lords_contract.png",
	stack_max = 200,
})

minetest.register_craftitem("two_lords_mobs:orc_contract", {
    description = "An Orc Contract(Right-click orc to pickup)",
    inventory_image = "two_lords_contract.png",
	stack_max = 200,
})

minetest.register_craftitem("two_lords_mobs:goblin_contract", {
    description = "A Goblin Contract(Right-click goblin to pickup)",
    inventory_image = "two_lords_contract.png",
	stack_max = 200,
})

minetest.register_craftitem("two_lords_mobs:parchment", {
    description = "Parchment(Used for contracts)",
    inventory_image = "two_lords_parchment.png",
	stack_max = 200,
})

minetest.register_craftitem("two_lords_mobs:wooden_bowl", {
    description = "A Simple Wooden Bowl",
    inventory_image = "two_lords_wooden_bowl.png",
	stack_max = 99,
})

minetest.register_craftitem("two_lords_mobs:lembas_bread", {
    description = "Lembas Bread",
    inventory_image = "two_lords_lembas_bread.png",
    on_use = minetest.item_eat(12),
})

minetest.register_craftitem("two_lords_mobs:orcish_medicine", {
    description = "Foul Orcish Medicine",
    inventory_image = "two_lords_orcish_medicine.png",
    on_use = minetest.item_eat(10),
})

minetest.register_craftitem("two_lords_mobs:bucket_sheep_milk", {
    description = "A Bucket of Sheep's Milk",
    inventory_image = "two_lords_bucket_milk.png",
	stack_max = 1,
    on_use = minetest.item_eat(5)
})

minetest.register_craftitem("two_lords_mobs:lamb_raw", {
    description = "Raw Lamb Meat",
    inventory_image = "two_lords_lamb_raw.png",
    on_use = minetest.item_eat(-2),
})

minetest.register_craftitem("two_lords_mobs:lamb_cooked", {
    description = "Cooked Lamb Meat",
    inventory_image = "two_lords_lamb_cooked.png",
    on_use = minetest.item_eat(4),
})

minetest.register_craftitem("two_lords_mobs:lamb_stew", {
    description = "Delicious Lamb Stew",
    inventory_image = "two_lords_lamb_stew.png",
	stack_max = 1,
    on_use = minetest.item_eat(10),
})

minetest.register_node("two_lords_mobs:wool_dirty", {
	description = "Dirty Wool",
	tiles = {"two_lords_wool_dirty.png"},
	drop = "two_lords_mobs:wool_dirty",
	is_ground_content = false,
	groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3,
			flammable = 3, wool = 1},
	sounds = default.node_sound_defaults(),
})

-- Register Crafts

minetest.register_craft({
	output = 'two_lords_mobs:lamb_stew',
	recipe = {
		{'two_lords_mobs:lamb_cooked','two_lords_mobs:wooden_bowl','farming:flour'},
	}
})

local wood = {
	wood = 'wood',
	junglewood = 'junglewood',
	pinewood = 'pine_wood',
	acaciawood = 'acacia_wood',
	aspenwood = 'aspen_wood'
}

for k, v in pairs(wood) do
	minetest.register_craft({
		output = 'two_lords_mobs:wooden_bowl',
		recipe = {
			{'default:' .. v,'','default:' .. v},
			{'','default:' .. v,''},
		}
	})
end

local contracts = {
	elf = 'tree 5',
	dwarf = 'steel_ingot 2',
	orc = 'sword_steel',
	goblin = 'stone 3'
}

for k, v in pairs(contracts) do
	minetest.register_craft({
		output = 'two_lords_mobs:' .. k .. '_contract 2',
		recipe = {
			{'default:' .. v,'default:' .. v,'default:' .. v},
			{'two_lords_mobs:parchment','default:diamond','two_lords_mobs:parchment'},
		}
	})
end

minetest.register_craft({
	output = "two_lords_mobs:parchment 4",
	recipe = {
		{"default:paper", "default:paper"},
		{"default:paper", "default:paper"},
	}
})

minetest.register_craft({
	output = "wool:white 8",
	recipe = {
		{'bucket:bucket_water', "two_lords_mobs:wool_dirty", "two_lords_mobs:wool_dirty"},
		{"two_lords_mobs:wool_dirty", "two_lords_mobs:wool_dirty", "two_lords_mobs:wool_dirty"},
	}
})
	
minetest.register_craft({
	output = "wool:white 8",
	recipe = {
		{'bucket:bucket_river_water', "two_lords_mobs:wool_dirty", "two_lords_mobs:wool_dirty"},
		{"two_lords_mobs:wool_dirty", "two_lords_mobs:wool_dirty", "two_lords_mobs:wool_dirty"},
		{"two_lords_mobs:wool_dirty", "two_lords_mobs:wool_dirty", "two_lords_mobs:wool_dirty"},
	}
})

-- Register Cooking Recipes

minetest.register_craft({
	type = "cooking",
	output = "two_lords_mobs:lamb_cooked",
	recipe = "two_lords_mobs:lamb_raw",
	cooktime = 5,
})
