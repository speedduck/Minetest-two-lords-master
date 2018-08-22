
-- Register Ore

minetest.register_craftitem("two_lords_ore:mordore_lump", {
	description = "Mordore Lump",
	inventory_image = "two_lords_ore_mordore_lump.png",
})

minetest.register_node("two_lords_ore:stone_with_mordore", {
	description = "Mordor Ore",
	tiles = {"default_stone.png^two_lords_ore_mineral_mordore.png"},
	groups = {cracky = 1},
	drop = "two_lords_ore:mordore_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "two_lords_ore:stone_with_mordore",
	wherein        = "default:stone",
	clust_scarcity = 10 * 10 * 10,
	clust_num_ores = 8,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -261,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "two_lords_ore:stone_with_mordore",
	wherein        = "default:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 8,
	clust_size     = 3,
	y_min     = -260,
	y_max     = 0,
})

minetest.register_craftitem("two_lords_ore:khazad_dum_lump", {
	description = "Khazad-dûm Lump",
	inventory_image = "two_lords_ore_khazad_dum_lump.png",
})

minetest.register_node("two_lords_ore:stone_with_khazad_dum", {
	description = "Khazad-dûm Ore",
	tiles = {"default_stone.png^two_lords_ore_mineral_khazad_dum.png"},
	groups = {cracky = 1},
	drop = "two_lords_ore:khazad_dum_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "two_lords_ore:stone_with_khazad_dum",
	wherein        = "default:stone",
	clust_scarcity = 10 * 10 * 10,
	clust_num_ores = 8,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -261,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "two_lords_ore:stone_with_khazad_dum",
	wherein        = "default:stone",
	clust_scarcity = 13 * 13 * 13,
	clust_num_ores = 8,
	clust_size     = 3,
	y_min     = -260,
	y_max     = 0,
})

-- Register Ingots

minetest.register_craftitem("two_lords_ore:mordore_ingot", {
	description = "Mordore Ingot",
	inventory_image = "two_lords_ore_mordore_ingot.png",
})

minetest.register_craftitem("two_lords_ore:gundabad_ingot", {
	description = "Gundabad Ingot",
	inventory_image = "two_lords_ore_gundabad_ingot.png",
})

minetest.register_craftitem("two_lords_ore:gundabad_lump", {
	description = "Gundabad Lump",
	inventory_image = "two_lords_ore_gundabad_lump.png",
})

minetest.register_craftitem("two_lords_ore:morgul_ingot", {
	description = "Morgul Ingot",
	inventory_image = "two_lords_ore_morgul_ingot.png",
})

minetest.register_craftitem("two_lords_ore:khazad_dum_ingot", {
	description = "Khazad-dûm Ingot",
	inventory_image = "two_lords_ore_khazad_dum_ingot.png",
})

minetest.register_craftitem("two_lords_ore:lorien_ingot", {
	description = "Lorien Ingot",
	inventory_image = "two_lords_ore_lorien_ingot.png",
})

minetest.register_craftitem("two_lords_ore:rivendell_ingot", {
	description = "Rivendell Ingot",
	inventory_image = "two_lords_ore_rivendell_ingot.png",
})

-- Register Nodes

minetest.register_node("two_lords_ore:mordore_block", {
	description = "Mordore Block",
	tiles = {"two_lords_ore_mordore_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("two_lords_ore:morgul_block", {
	description = "Morgul Block",
	tiles = {"two_lords_ore_morgul_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("two_lords_ore:gundabad_block", {
	description = "Gundabad Block",
	tiles = {"two_lords_ore_gundabad_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("two_lords_ore:khazad_dum_block", {
	description = "Khazad-dûm Block",
	tiles = {"two_lords_ore_khazad_dum_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("two_lords_ore:lorien_block", {
	description = "Lorien Block",
	tiles = {"two_lords_ore_lorien_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("two_lords_ore:rivendell_block", {
	description = "Rivendell Block",
	tiles = {"two_lords_ore_rivendell_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})

-- Register Tools

minetest.register_tool("two_lords_ore:sword_gundabad", {
	description = "Gundabad Sword",
	inventory_image = "two_lords_ore_gundabad_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=45, maxlevel=3},
		},
		damage_groups = {fleshy=12},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("two_lords_ore:sword_morgul", {
	description = "Morgul Sword",
	inventory_image = "two_lords_ore_morgul_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=45, maxlevel=3},
		},
		damage_groups = {fleshy=10},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("two_lords_ore:sword_rivendell", {
	description = "Rivendell Sword",
	inventory_image = "two_lords_ore_rivendell_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=55, maxlevel=3},
		},
		damage_groups = {fleshy=9},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("two_lords_ore:sword_lorien", {
	description = "Lorien Sword",
	inventory_image = "two_lords_ore_lorien_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=55, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_tool_breaks"},
})

-- Register Crafting Recipes

minetest.register_craft({
	output = 'two_lords_ore:mordore_block',
	recipe = {
		{'two_lords_ore:mordore_ingot', 'two_lords_ore:mordore_ingot', 'two_lords_ore:mordore_ingot'},
		{'two_lords_ore:mordore_ingot', 'two_lords_ore:mordore_ingot', 'two_lords_ore:mordore_ingot'},
		{'two_lords_ore:mordore_ingot', 'two_lords_ore:mordore_ingot', 'two_lords_ore:mordore_ingot'},
	}
})

minetest.register_craft({
	output = 'two_lords_ore:gundabad_block',
	recipe = {
		{'two_lords_ore:gundabad_ingot', 'two_lords_ore:gundabad_ingot', 'two_lords_ore:gundabad_ingot'},
		{'two_lords_ore:gundabad_ingot', 'two_lords_ore:gundabad_ingot', 'two_lords_ore:gundabad_ingot'},
		{'two_lords_ore:gundabad_ingot', 'two_lords_ore:gundabad_ingot', 'two_lords_ore:gundabad_ingot'},
	}
})

minetest.register_craft({
	output = 'two_lords_ore:morgul_block',
	recipe = {
		{'two_lords_ore:morgul_ingot', 'two_lords_ore:morgul_ingot', 'two_lords_ore:morgul_ingot'},
		{'two_lords_ore:morgul_ingot', 'two_lords_ore:morgul_ingot', 'two_lords_ore:morgul_ingot'},
		{'two_lords_ore:morgul_ingot', 'two_lords_ore:morgul_ingot', 'two_lords_ore:morgul_ingot'},
	}
})

minetest.register_craft({
	output = 'two_lords_ore:khazad_dum_block',
	recipe = {
		{'two_lords_ore:khazad_dum_ingot', 'two_lords_ore:khazad_dum_ingot', 'two_lords_ore:khazad_dum_ingot'},
		{'two_lords_ore:khazad_dum_ingot', 'two_lords_ore:khazad_dum_ingot', 'two_lords_ore:khazad_dum_ingot'},
		{'two_lords_ore:khazad_dum_ingot', 'two_lords_ore:khazad_dum_ingot', 'two_lords_ore:khazad_dum_ingot'},
	}
})

minetest.register_craft({
	output = 'two_lords_ore:lorien_block',
	recipe = {
		{'two_lords_ore:lorien_ingot', 'two_lords_ore:lorien_ingot', 'two_lords_ore:lorien_ingot'},
		{'two_lords_ore:lorien_ingot', 'two_lords_ore:lorien_ingot', 'two_lords_ore:lorien_ingot'},
		{'two_lords_ore:lorien_ingot', 'two_lords_ore:lorien_ingot', 'two_lords_ore:lorien_ingot'},
	}
})

minetest.register_craft({
	output = 'two_lords_ore:rivendell_block',
	recipe = {
		{'two_lords_ore:rivendell_ingot', 'two_lords_ore:rivendell_ingot', 'two_lords_ore:rivendell_ingot'},
		{'two_lords_ore:rivendell_ingot', 'two_lords_ore:rivendell_ingot', 'two_lords_ore:rivendell_ingot'},
		{'two_lords_ore:rivendell_ingot', 'two_lords_ore:rivendell_ingot', 'two_lords_ore:rivendell_ingot'},
	}
})

minetest.register_craft({
	output = 'two_lords_ore:mordore_ingot 9',
	recipe = {
		{'two_lords_ore:mordore_block'},
	}
})

minetest.register_craft({
	output = 'two_lords_ore:gundabad_ingot 9',
	recipe = {
		{'two_lords_ore:gundabad_block'},
	}
})

minetest.register_craft({
	output = 'two_lords_ore:morgul_ingot 9',
	recipe = {
		{'two_lords_ore:morgul_block'},
	}
})

minetest.register_craft({
	output = 'two_lords_ore:khazad_dum_ingot 9',
	recipe = {
		{'two_lords_ore:khazad_dum_block'},
	}
})

minetest.register_craft({
	output = 'two_lords_ore:lorien_ingot 9',
	recipe = {
		{'two_lords_ore:lorien_block'},
	}
})

minetest.register_craft({
	output = 'two_lords_ore:rivendell_ingot 9',
	recipe = {
		{'two_lords_ore:rivendell_block'},
	}
})

minetest.register_craft({
	output = 'two_lords_ore:morgul_ingot 2',
	recipe = {
		{'two_lords_ore:mordore_ingot', 'default:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'two_lords_ore:gundabad_lump',
	recipe = {
		{'two_lords_ore:mordore_lump', 'default:coal_lump'},
	}
})

minetest.register_craft({
	output = 'two_lords_ore:lorien_ingot 2',
	recipe = {
		{'two_lords_ore:khazad_dum_ingot', 'default:mese_crystal'},
	}
})

minetest.register_craft({
	output = 'two_lords_ore:rivendell_ingot 2',
	recipe = {
		{'two_lords_ore:khazad_dum_ingot', 'default:diamond'},
	}
})

minetest.register_craft({
	output = 'two_lords_ore:sword_gundabad',
	recipe = {
		{'two_lords_ore:gundabad_ingot'},
		{'two_lords_ore:gundabad_ingot'},
		{'default:stick'},
	}
})

minetest.register_craft({
	output = 'two_lords_ore:sword_morgul',
	recipe = {
		{'two_lords_ore:morgul_ingot'},
		{'two_lords_ore:morgul_ingot'},
		{'default:stick'},
	}
})

minetest.register_craft({
	output = 'two_lords_ore:sword_rivendell',
	recipe = {
		{'two_lords_ore:rivendell_ingot'},
		{'two_lords_ore:rivendell_ingot'},
		{'default:stick'},
	}
})

minetest.register_craft({
	output = 'two_lords_ore:sword_lorien',
	recipe = {
		{'two_lords_ore:lorien_ingot'},
		{'two_lords_ore:lorien_ingot'},
		{'default:stick'},
	}
})

-- Cooking Recipes

minetest.register_craft({
	type = "cooking",
	output = "two_lords_ore:mordore_ingot",
	recipe = "two_lords_ore:mordore_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "two_lords_ore:khazad_dum_ingot",
	recipe = "two_lords_ore:khazad_dum_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "two_lords_ore:gundabad_ingot",
	recipe = "two_lords_ore:gundabad_lump",
})
