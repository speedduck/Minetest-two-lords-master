minetest.log("action", "goblinstart")

-- Intllib
local S = two_lords_mobs.intllib

-- 3d Armor
local use_3darmor = minetest.get_modpath("3d_armor")

-- Goblins

function two_lords_mobs.register_goblin(n, hpmin, hpmax, textures, vr, wv, rv, damg, arm, drops, atcktp, arrow, shtint, follow, rch, immunity, spnnodes, spnchance, eggdes, eggimg, pitem)
	mobs:register_mob("two_lords_mobs:" .. n,{
		type = "monster",
		hp_min = hpmin,
		hp_max = hpmax,
		collisionbox = {-0.3, -1.0, -0.3, 0.3, 0.8, 0.3},
		visual = "mesh",
		mesh = "character.x",
		textures = textures,
		visual_size = {x=0.925, y=0.75},
		makes_footstep_sound = true,
		view_range = vr,
		walk_velocity = wv,
		run_velocity = rv,
		damage = damg,
		fear_height = 8,
		drops = drops,
		armor = arm,
		drawtype = "front",
		light_resistant = true,
		water_damage = 0,
		lava_damage = 4,
		light_damage = 0,
		attack_type = atcktp,
		arrow = arrow,
		shoot_interval = shtint,
    	follow = follow,
		animation = {
			stand_start = 0,
			stand_end = 23,
			walk_start = 24,
			walk_end = 36,
			run_start = 37,
			run_end = 49,
			punch_start = 37,
			punch_end = 49,
			speed_normal = 15,
			speed_run = 15,
		},
--		sounds = {
--			random = "two_lords_elf",
--			attack = "fight_sound",
--		},
		attacks_monsters = false,
		group_attack = true,
		peaceful = false,
		jump = true,
		reach = rch,
		immune_to = immunity,
		on_click = function(self, clicker)
	--		self.peaceful = false
	--		if clicker.alignment > 0 then
	--			two_lords_mobs.change_player_alignment(clicker, -5)
	--		
	--		elseif clicker.alignment < 0 then
	--			two_lords_mobs.change_player_alignment(clicker, -1)
	--		end
		end,
		on_rightclick = function(self, clicker)
			tool = clicker:get_wielded_item():get_name()
			if tool == pitem then
				clicker:get_inventory():remove_item("main", pitem)
				clicker:get_inventory():add_item("main", "two_lords_mobs:" .. n)
				self.object:remove()
			end
		end,
		step = 1,
	})
	mobs:spawn({
		name = "two_lords_mobs:" .. n,
		nodes = spnnodes,
		chance = spnchance,
		active_object_count = 3,
		y_max = 31000,
	})
	mobs:register_egg("two_lords_mobs:" .. n, S(eggdes), eggimg, 1)
end

local pickup_item = "two_lords_mobs:goblin_contract"

local goblin_immunity = {
	{"two_lords_ore:sword_steel", 0}, -- no damage
	{"default:gold_lump", -1}, -- heals by 1 points
	{"two_lords_mobs:orcish_medicine", -20}, -- heals by 20 points
}

-- Basic Goblin

local textures1 = {
	{"two_lords_goblin.png"},
}

local drops1 = {
	{name = "rings_of_power:evil_essence",
	chance = 100,
	min = 1,
	max = 1,},
	{name = "two_lords_mobs:orcish_medicine",
	chance = 30,
	min = 1,
	max = 2,},
}

local spawn_nodes1 = {
	{"default:dirt_with_grass"},
	{"default:desert_sand"},
}

two_lords_mobs.register_goblin("goblin", 30, 40, textures1, 7, 1.25, 3, 2, 300, drops1, "dogfight", nil, nil, "rings_of_power:evil_ring", 1, goblin_immunity, "default:stone", 2500, "Goblin", "default_stone.png", pickup_item)

-- Goblin Guard

local textures2 = {
	{"two_lords_goblin.png^two_lords_armor_helmet_goblin.png^two_lords_armor_chestplate_gundabad.png^two_lords_armor_leggings_gundabad.png^two_lords_armor_boots_gundabad.png"},
}

local drops2 = {
	{name = "rings_of_power:evil_essence",
	chance = 1000,
	min = 1,
	max = 1,},
	{name = "two_lords_mobs:orcish_medicine",
	chance = 250,
	min = 1,
	max = 2,},
	{name = "two_lords_armor:helmet_gundabad",
	chance = 500,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:helmet_goblin",
	chance = 75,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:chestplate_gundabad",
	chance = 700,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:leggings_gundabad",
	chance = 550,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:boots_gundabad",
	chance = 350,
	min = 1,
	max = 1,},
	{name = "two_lords_ore:sword_steel",
	chance = 150,
	min = 1,
	max = 1,}
}

if use_3darmor then
	local drops2 = {
		{name = "rings_of_power:evil_essence",
		chance = 1000,
		min = 1,
		max = 1,},
		{name = "two_lords_mobs:orcish_medicine",
		chance = 250,
		min = 1,
		max = 2,},
		{name = "3d_armor:helmet_diamond",
		chance = 800,
		min = 1,
		max = 1,},
		{name = "3d_armor:chestplate_diamond",
		chance = 1300,
		min = 1,
		max = 1,},
		{name = "3d_armor:leggings_diamond",
		chance = 1000,
		min = 1,
		max = 1,},
		{name = "3d_armor:boots_diamond",
		chance = 600,
		min = 1,
		max = 1,},
		{name = "default:sword_diamond",
		chance = 900,
		min = 1,
		max = 1,},
		{name = "two_lords_armor:helmet_goblin",
		chance = 75,
		min = 1,
		max = 1,},
		{name = "two_lords_armor:helmet_gundabad",
		chance = 450,
		min = 1,
		max = 1,},
		{name = "two_lords_armor:chestplate_gundabad",
		chance = 700,
		min = 1,
		max = 1,},
		{name = "two_lords_armor:leggings_gundabad",
		chance = 550,
		min = 1,
		max = 1,},
		{name = "two_lords_armor:boots_gundabad",
		chance = 350,
		min = 1,
		max = 1,},
		{name = "two_lords_ore:sword_gundabad",
		chance = 350,
		min = 1,
		max = 1,},
		{name = "3d_armor:helmet_steel",
		chance = 225,
		min = 1,
		max = 1,},
		{name = "3d_armor:chestplate_steel",
		chance = 350,
		min = 1,
		max = 1,},
		{name = "3d_armor:leggings_steel",
		chance = 275,
		min = 1,
		max = 1,},
		{name = "3d_armor:boots_steel",
		chance = 175,
		min = 1,
		max = 1,},
		{name = "default:sword_steel",
		chance = 175,
		min = 1,
		max = 1,}
	}
end

local spawn_nodes2 = {
	{"default:dirt_with_grass"},
	{"default:stone"},
	{"default:desert_sand"},
}

two_lords_mobs.register_goblin("goblin_guard", 60, 80, textures2, 10, 1, 2, 6, 100, drops2, "dogfight", nil, nil, "rings_of_power:evil_ring", 2, goblin_immunity, "default:stone", 5000, "Goblin Guard", "default_iron_lump.png", pickup_item)

-- Goblin Archer

local textures3 = {
	{"two_lords_goblin.png^two_lords_quiver.png^two_lords_armor_helmet_goblin.png^two_lords_armor_boots_gundabad.png"},
}

local drops3 = {
	{name = "rings_of_power:evil_essence",
	chance = 1000,
	min = 1,
	max = 1,},
	{name = "two_lords_mobs:orcish_medicine",
	chance = 250,
	min = 1,
	max = 2,},
	{name = "two_lords_armor:helmet_gundabad",
	chance = 500,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:helmet_goblin",
	chance = 75,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:chestplate_gundabad",
	chance = 700,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:leggings_gundabad",
	chance = 550,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:boots_gundabad",
	chance = 350,
	min = 1,
	max = 1,},
	{name = "two_lords_ore:sword_steel",
	chance = 150,
	min = 1,
	max = 1,}
}

if use_3darmor then
	local drops3 = {
		{name = "rings_of_power:evil_essence",
		chance = 1000,
		min = 1,
		max = 1,},
		{name = "two_lords_mobs:orcish_medicine",
		chance = 250,
		min = 1,
		max = 2,},
		{name = "3d_armor:helmet_diamond",
		chance = 800,
		min = 1,
		max = 1,},
		{name = "3d_armor:chestplate_diamond",
		chance = 1300,
		min = 1,
		max = 1,},
		{name = "3d_armor:leggings_diamond",
		chance = 1000,
		min = 1,
		max = 1,},
		{name = "3d_armor:boots_diamond",
		chance = 600,
		min = 1,
		max = 1,},
		{name = "default:sword_diamond",
		chance = 900,
		min = 1,
		max = 1,},
		{name = "two_lords_armor:helmet_goblin",
		chance = 75,
		min = 1,
		max = 1,},
		{name = "two_lords_armor:helmet_gundabad",
		chance = 450,
		min = 1,
		max = 1,},
		{name = "two_lords_armor:chestplate_gundabad",
		chance = 700,
		min = 1,
		max = 1,},
		{name = "two_lords_armor:leggings_gundabad",
		chance = 550,
		min = 1,
		max = 1,},
		{name = "two_lords_armor:boots_gundabad",
		chance = 350,
		min = 1,
		max = 1,},
		{name = "two_lords_ore:sword_gundabad",
		chance = 350,
		min = 1,
		max = 1,},
		{name = "3d_armor:helmet_steel",
		chance = 225,
		min = 1,
		max = 1,},
		{name = "3d_armor:chestplate_steel",
		chance = 350,
		min = 1,
		max = 1,},
		{name = "3d_armor:leggings_steel",
		chance = 275,
		min = 1,
		max = 1,},
		{name = "3d_armor:boots_steel",
		chance = 175,
		min = 1,
		max = 1,},
		{name = "default:sword_steel",
		chance = 175,
		min = 1,
		max = 1,}
	}
end

local spawn_nodes3 = {
	node1 = "default:dirt_with_grass",
	node2 = "default:stone",
	node3 = "default:desert_sand",
}

two_lords_mobs.register_goblin("goblin_archer", 40, 50, textures3, 11, 1.25, 3, 4, 325, drops3, "dogshoot", "two_lords_mobs:orcarrow", 3, "rings_of_power:evil_ring", 1, goblin_immunity, "default:stone", 10000, "Goblin Archer", "default_stone.png", pickup_item)

minetest.log("action", "goblinend")
