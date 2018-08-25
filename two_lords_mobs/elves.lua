minetest.log("action", "elfstart")

-- Intllib
local S = two_lords_mobs.intllib

-- 3d Armor
local use_3darmor = minetest.get_modpath("3d_armor")

-- Elves

function two_lords_mobs.register_elf(n, hpmin, hpmax, textures, vr, wv, rv, damg, arm, drops, atcktp, arrow, shtint, follow, rch, immunity, spnnodes, spnchance, eggdes, eggimg, pitem)
	mobs:register_mob("two_lords_mobs:" .. n,{
		type = "npc",
		hp_min = hpmin,
		hp_max = hpmax,
		collisionbox = {-0.3, -1.1, -0.3, 0.3, 0.91, 0.3},
		visual = "mesh",
		mesh = "character.x",
		textures = textures,
		visual_size = {x=0.95, y=1.2},
		makes_footstep_sound = true,
		view_range = vr,
		walk_velocity = wv,
		run_velocity = rv,
		damage = damg,
		fear_height = 4,
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
		attacks_monsters = true,
		group_attack = true,
		peaceful = true,
		jump = true,
		reach = rch,
		immune_to = immunity,
		on_click = function(self, clicker)
			self.peaceful = false
			self.type = "monster"
			if clicker:get_hp() <= 0 then
				self.peaceful = true
				self.type = "npc"
			end
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
		height_max = 31000,
	})
	mobs:register_egg("two_lords_mobs:" .. n, S(eggdes), eggimg, 1)
end

-- Arrows

mobs:register_arrow("two_lords_mobs:elfarrow", {
	visual = "sprite",
	visual_size = {x=1, y=1},
	textures = {"two_lords_elfarrow.png"},
	velocity = 7,
	hit_player = function(self, player)
		local s = self.object:getpos()
		local p = player:getpos()
		local vec = {x=s.x-p.x, y=s.y-p.y, z=s.z-p.z}
		player:punch(self.object, 1.0,  {
			full_punch_interval=1.0,
			damage_groups = {fleshy=5},
		}, vec)
	end,
	hit_node = nil
})

local pickup_item = "two_lords_mobs:elf_contract"

local elf_immunity = {
	{"two_lords_ore:sword_rivendell", 0}, -- no damage
	{"two_lords_ore:sword_lorien", 0}, -- no damage
	{"default:leaves", -1}, -- heals by 1 points
	{"default:tree", -5}, -- heals by 5 points
	{"default:wheat", -10}, -- heals by 10 points
	{"two_lords_mobs:lembas_bread", -20}, -- heals by 20 points
}

-- Basic Elf

local textures_basic_elf = {
	{"two_lords_forest_elf.png"},
	{"two_lords_rivendell_elf.png"},
	{"two_lords_lorien_elf.png"},
}

local drops_basic_elf = {
	{name = "rings_of_power:good_essence",
	chance = 1000,
	min = 1,
	max = 1,},
	{name = "two_lords_mobs:lembas_bread",
	chance = 40,
	min = 1,
	max = 3,}
}

two_lords_mobs.register_elf("elf", 40, 60, textures_basic_elf, 20, 2.5, 5, 5, 250, drops_basic_elf, "dogfight", nil, nil, "rings_of_power:good_ring", 1, elf_immunity, "default:dirt_with_grass", 100000, "Elf", "default_tree.png", pickup_item)

-- Elf Guards

local textures_guard_elf_1 = {
	{"two_lords_rivendell_elf.png^two_lords_armor_helmet_rivendell.png^two_lords_armor_chestplate_rivendell.png^two_lords_armor_leggings_rivendell.png^two_lords_armor_boots_rivendell.png"},
}

local textures_guard_elf_2 = {
	{"two_lords_lorien_elf.png^two_lords_armor_helmet_lorien.png^two_lords_armor_chestplate_lorien.png^two_lords_armor_leggings_lorien.png^two_lords_armor_boots_lorien.png"},
}

local textures_guard_elf_3 = {
	{"two_lords_forest_elf.png^two_lords_armor_helmet_forest.png^two_lords_armor_chestplate_rivendell.png^two_lords_armor_leggings_rivendell.png^two_lords_armor_boots_rivendell.png"},
}

local drops_rivendell_elf = {
	{name = "rings_of_power:good_essence",
	chance = 1000,
	min = 1,
	max = 1,},
	{name = "two_lords_mobs:lembas_bread",
	chance = 300,
	min = 1,
	max = 3,},
	{name = "two_lords_armor:helmet_rivendell",
	chance = 450,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:chestplate_rivendell",
	chance = 700,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:leggings_rivendell",
	chance = 550,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:boots_rivendell",
	chance = 350,
	min = 1,
	max = 1,},
	{name = "two_lords_ore:sword_rivendell",
	chance = 350,
	min = 1,
	max = 1,}
}

local drops_lorien_elf = {
	{name = "rings_of_power:good_essence",
	chance = 1000,
	min = 1,
	max = 1,},
	{name = "two_lords_mobs:lembas_bread",
	chance = 200,
	min = 1,
	max = 3,},
	{name = "two_lords_armor:helmet_lorien",
	chance = 450,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:chestplate_lorien",
	chance = 700,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:leggings_lorien",
	chance = 560,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:boots_lorien",
	chance = 350,
	min = 1,
	max = 1,},
	{name = "two_lords_ore:sword_lorien",
	chance = 350,
	min = 1,
	max = 1,}
}

local drops_forest_elf = {
	{name = "rings_of_power:good_essence",
	chance = 1000,
	min = 1,
	max = 1,},
	{name = "two_lords_mobs:lembas_bread",
	chance = 50,
	min = 1,
	max = 3,},
	{name = "default:sword_steel",
	chance = 175,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:helmet_forest",
	chance = 150,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:chestplate_forest",
	chance = 400,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:leggings_forest",
	chance = 250,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:boots_forest",
	chance = 50,
	min = 1,
	max = 1,}
}

if use_3darmor then
	local drops_rivendell_elf = {
		{name = "rings_of_power:good_essence",
		chance = 1000,
		min = 1,
		max = 1,},
		{name = "two_lords_mobs:lembas_bread",
		chance = 300,
		min = 1,
		max = 3,},
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
		{name = "two_lords_armor:helmet_rivendell",
		chance = 450,
		min = 1,
		max = 1,},
		{name = "two_lords_armor:chestplate_rivendell",
		chance = 700,
		min = 1,
		max = 1,},
		{name = "two_lords_armor:leggings_rivendell",
		chance = 550,
		min = 1,
		max = 1,},
		{name = "two_lords_armor:boots_rivendell",
		chance = 350,
		min = 1,
		max = 1,},
		{name = "two_lords_ore:sword_rivendell",
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
		chance = 280,
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

	local drops_lorien_elf = {
		{name = "rings_of_power:good_essence",
		chance = 1000,
		min = 1,
		max = 1,},
		{name = "two_lords_mobs:lembas_bread",
		chance = 200,
		min = 1,
		max = 3,},
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
		{name = "two_lords_armor:helmet_lorien",
		chance = 450,
		min = 1,
		max = 1,},
		{name = "two_lords_armor:chestplate_lorien",
		chance = 700,
		min = 1,
		max = 1,},
		{name = "two_lords_armor:leggings_lorien",
		chance = 560,
		min = 1,
		max = 1,},
		{name = "two_lords_armor:boots_lorien",
		chance = 350,
		min = 1,
		max = 1,},
		{name = "two_lords_ore:sword_lorien",
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
		chance = 280,
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

	local drops_forest_elf = {
		{name = "rings_of_power:good_essence",
		chance = 1000,
		min = 1,
		max = 1,},
		{name = "two_lords_mobs:lembas_bread",
		chance = 50,
		min = 1,
		max = 3,},
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
		{name = "3d_armor:helmet_steel",
		chance = 225,
		min = 1,
		max = 1,},
		{name = "3d_armor:chestplate_steel",
		chance = 350,
		min = 1,
		max = 1,},
		{name = "3d_armor:leggings_steel",
		chance = 280,
		min = 1,
		max = 1,},
		{name = "3d_armor:boots_steel",
		chance = 175,
		min = 1,
		max = 1,},
		{name = "default:sword_steel",
		chance = 175,
		min = 1,
		max = 1,},
		{name = "two_lords_armor:helmet_forest",
		chance = 150,
		min = 1,
		max = 1,},
		{name = "two_lords_armor:chestplate_forest",
		chance = 400,
		min = 1,
		max = 1,},
		{name = "two_lords_armor:leggings_forest",
		chance = 250,
		min = 1,
		max = 1,},
		{name = "two_lords_armor:boots_forest",
		chance = 50,
		min = 1,
		max = 1,}
	}
end

two_lords_mobs.register_elf("rivendell_guard", 70, 90, textures_guard_elf_1, 21, 2.125, 4.25, 10, 70, drops_rivendell_elf, "dogfight", nil, nil, "rings_of_power:good_ring", 2.5, elf_immunity, "default:dirt_with_grass", 400000, "Rivendell Guard", "default_steel_ingot.png", pickup_item)
two_lords_mobs.register_elf("lorien_guard", 60, 80, textures_guard_elf_2, 21, 2.125, 4.25, 12.5, 65, drops_lorien_elf, "dogfight", nil, nil, "rings_of_power:good_ring", 1.5, elf_immunity, "default:dirt_with_grass", 400000, "Lorien Guard", "default_steel_ingot.png", pickup_item)
two_lords_mobs.register_elf("forest_guard", 50, 70, textures_guard_elf_3, 21, 2.125, 4.25, 15, 60, drops_forest_elf, "dogfight", nil, nil, "rings_of_power:good_ring", 1, elf_immunity, "default:dirt_with_grass", 400000, "Forest Guard", "default_steel_ingot.png", pickup_item)

-- Elf Archers

local textures_archer_elf_1 = {
	{"two_lords_rivendell_elf.png^two_lords_quiver.png^two_lords_headband.png^two_lords_armor_boots_rivendell.png"},
}

local textures_archer_elf_2 = {
	{"two_lords_lorien_elf.png^two_lords_quiver.png^two_lords_headband.png^two_lords_armor_boots_lorien.png"},
}

local textures_archer_elf_3 = {
	{"two_lords_forest_elf.png^two_lords_quiver.png^two_lords_headband.png^two_lords_armor_boots_rivendell.png"},
}

two_lords_mobs.register_elf("rivendell_archer", 35, 55, textures_archer_elf_1, 25, 2.5, 5, 7.5, 200, drops_rivendell_elf, "dogshoot", "two_lords_mobs:elfarrow", 1, "rings_of_power:good_ring", 2.5, elf_immunity, "default:dirt_with_grass", 200000, "Rivendell Archer", "default_leaves.png", pickup_item)
two_lords_mobs.register_elf("lorien_archer", 40, 60, textures_archer_elf_2, 25, 2.5, 5, 5, 225, drops_lorien_elf, "dogshoot", "two_lords_mobs:elfarrow", 1, "rings_of_power:good_ring", 3, elf_immunity, "default:dirt_with_grass", 200000, "Lorien Archer", "default_leaves.png", pickup_item)
two_lords_mobs.register_elf("forest_archer", 45, 65, textures_archer_elf_3, 25, 2.5, 5, 10, 250, drops_forest_elf, "dogshoot", "two_lords_mobs:elfarrow", 1, "rings_of_power:good_ring", 2, elf_immunity, "default:dirt_with_grass", 200000, "Forest Archer", "default_leaves.png", pickup_item)

minetest.log("action", "elfend")
