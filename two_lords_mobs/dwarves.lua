minetest.log("action", "dwarfstart")

-- Intllib
local S = two_lords_mobs.intllib

-- Dwarves

function two_lords_mobs.register_dwarf(n, hpmin, hpmax, textures, vr, wv, rv, damg, arm, drops, atcktp, arrow, shtint, follow, rch, immunity, spnnodes, spnchance, eggdes, eggimg, pitem)
	mobs:register_mob("two_lords_mobs:" .. n,{
		type = "npc",
		hp_min = hpmin,
		hp_max = hpmax,
		collisionbox = {-0.3, -1.0, -0.3, 0.3, 0.8, 0.3},
		visual = "mesh",
		mesh = "character.x",
		textures = textures,
		visual_size = {x=0.9, y=0.7},
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

local pickup_item = "two_lords_mobs:dwarf_contract"

local dwarf_immunity = {
	{"default:sword_gold", 0}, -- no damage
	{"default:sword_diamond", 0}, -- no damage
	{"default:stone", -1}, -- heals by 1 points
	{"default:coal", -5}, -- heals by 5 points
	{"default:wheat", -10}, -- heals by 10 points
	{"default:gold_ingot", -20}, -- heals by 20 points
}

-- Basic Dwarf

local textures1 = {
	{"two_lords_dwarf1.png"},
	{"two_lords_dwarf2.png"},
	{"two_lords_dwarf3.png"},
}

local drops1 = {
	{name = "rings_of_power:good_essence",
	chance = 1000,
	min = 1,
	max = 1,},
}

two_lords_mobs.register_dwarf("dwarf", 70, 90, textures1, 8, 1, 3, 3, 200, drops1, "dogfight", nil, nil, "rings_of_power:good_ring", 1, dwarf_immunity, "default:stone", 5000, "Dwarf", "default_stone.png", pickup_item)

-- Dwarf Guards

local textures2 = {
	{"two_lords_dwarf1.png^two_lords_armor_helmet_khazad_dum.png^two_lords_armor_chestplate_khazad_dum.png^two_lords_armor_leggings_khazad_dum.png^two_lords_armor_boots_khazad_dum.png"},
	{"two_lords_dwarf2.png^two_lords_armor_helmet_khazad_dum.png^two_lords_armor_chestplate_khazad_dum.png^two_lords_armor_leggings_khazad_dum.png^two_lords_armor_boots_khazad_dum.png"},
	{"two_lords_dwarf3.png^two_lords_armor_helmet_khazad_dum.png^two_lords_armor_chestplate_khazad_dum.png^two_lords_armor_leggings_khazad_dum.png^two_lords_armor_boots_khazad_dum.png"},
}

local drops2 = {
	{name = "rings_of_power:good_essence",
	chance = 1000,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:helmet_khazad_dum",
	chance = 500,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:chestplate_khazad_dum",
	chance = 750,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:leggings_khazad_dum",
	chance = 600,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:boots_khazad_dum",
	chance = 400,
	min = 1,
	max = 1,},
	{name = "two_lords_ore:sword_diamond",
	chance = 550,
	min = 1,
	max = 1,}
}

two_lords_mobs.register_dwarf("dwarf_guard", 90, 110, textures2, 10, 1, 2, 8, 60, drops2, "dogfight", nil, nil, "rings_of_power:good_ring", 2.5, dwarf_immunity, "default:stone", 20000, "Dwarf Guard", "default_iron_lump.png", pickup_item)

minetest.log("action", "dwarfend")
