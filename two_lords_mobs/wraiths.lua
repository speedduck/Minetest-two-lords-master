minetest.log("action", "wraithstart")

-- Intllib
local S = two_lords_mobs.intllib

-- Wraiths

function two_lords_mobs.register_nazgul(n, hpmin, hpmax, collisionbox, textures, vx, vy, vr, wv, rv, damg, fh, arm, drops, atcktp, arrow, shtint, follow, rch, immunity, step, spnnodes, spnchance, eggdes, eggimg)
	mobs:register_mob("two_lords_mobs:" .. n,{
		type = "monster",
		hp_min = hpmin,
		hp_max = hpmax,
		collisionbox = collisionbox,
		visual = "mesh",
		mesh = "character.x",
		textures = textures,
		visual_size = {x=vx, y=vy},
		makes_footstep_sound = true,
		view_range = vr,
		walk_velocity = wv,
		run_velocity = rv,
		damage = damg,
		fear_height = fh,
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
		jump = true,
		reach = rch,
		attacks_monsters = true,
		group_attack = true,
		peaceful = true,
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
		step = step,
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

local nazgul_immunity = {
	{"two_lords_ore:sword_morgul", 0}, -- no damage
	{"two_lords_ore:sword_gundabad", 0}, -- no damage
	{"default:gold_lump", -1}, -- heals by 1 points
	{"default:cobblestone", -5}, -- heals by 5 points
	{"default:obsidian", -10}, -- heals by 10 points
	{"two_lords_mobs:lava_bucket", -20}, -- heals by 20 points
}

-- Nazgul
local textures1 = {
	{"two_lords_nazgul.png"},
	{"two_lords_nazgul.png^two_lords_armor_helmet_morgul.png^two_lords_armor_chestplate_morgul.png^two_lords_armor_leggings_morgul.png^two_lords_armor_boots_morgul.png"},
}

local drops1 = {
	{name = "rings_of_power:evil_essence",
	chance = 1000,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:helmet_morgul",
	chance = 450,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:chestplate_morgul",
	chance = 700,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:leggings_morgul",
	chance = 550,
	min = 1,
	max = 1,},
	{name = "two_lords_armor:boots_morgul",
	chance = 350,
	min = 1,
	max = 1,},
	{name = "two_lords_ore:sword_morgul",
	chance = 350,
	min = 1,
	max = 1,}
}

two_lords_mobs.register_nazgul("nazgul", 100, 120, {-0.3, -1.0, -0.3, 0.3, 0.8, 0.3}, textures1, 1, 1, 15, 1.5, 3, 12, 4, 30, drops1, "dogfight", nil, nil, "rings_of_power:evil_ring", 3, nazgul_immunity, 1, "default:dirt_with_grass", 2000000, "Nazgul", "default_obsidian.png")

-- Sauron
local textures2 = {
	{"two_lords_sauron.png"},
}

local drops2 = {
	{name = "rings_of_power:evil_essence",
	chance = 10,
	min = 1,
	max = 1,},
}

local spawn_nodes1 = {
	{"default:dirt_with_grass"},
	{"default:stone"},
}

two_lords_mobs.register_nazgul("sauron", 10000, 12000, {-0.6, -2.0, -0.6, 0.6, 1.6, 0.6}, textures2, 2, 2, 20, 1, 2, 100, 10, 20, drops2, "dogfight", nil, nil, nil, 4, nazgul_immunity, 3, "default:dirt_with_grass", 1000000000000, "Sauron", "default_obsidian.png")

minetest.log("action", "wraithend")
