ARMOR_MOD_NAME = minetest.get_current_modname()
dofile(minetest.get_modpath(ARMOR_MOD_NAME).."/armor.lua")

-- Register Head Armor

minetest.register_tool("two_lords_armor:helmet_goblin", {
	description = "Goblin Helmet",
	inventory_image = "two_lords_armor_inv_helmet_goblin.png",
	groups = {armor_head=8, armor_heal=7, armor_use=25},
	wear = 0,
})

minetest.register_tool("two_lords_armor:helmet_morgul", {
	description = "Morgul Helmet",
	inventory_image = "two_lords_armor_inv_helmet_morgul.png",
	groups = {armor_head=20, armor_heal=12, armor_use=100},
	wear = 0,
})

minetest.register_tool("two_lords_armor:helmet_gundabad", {
	description = "Gundabad Helmet",
	inventory_image = "two_lords_armor_inv_helmet_gundabad.png",
	groups = {armor_head=12, armor_heal=12, armor_use=50},
	wear = 0,
})

minetest.register_tool("two_lords_armor:helmet_orc", {
	description = "Orc Helmet",
	inventory_image = "two_lords_armor_inv_helmet_orc.png",
	groups = {armor_head=12, armor_heal=10, armor_use=50},
	wear = 0,
})

minetest.register_tool("two_lords_armor:helmet_khazad_dum", {
	description = "Khazad-dûm Helmet",
	inventory_image = "two_lords_armor_inv_helmet_khazad_dum.png",
	groups = {armor_head=14, armor_heal=10, armor_use=75},
	wear = 0,
})

minetest.register_tool("two_lords_armor:helmet_lorien", {
	description = "Lorien Helmet",
	inventory_image = "two_lords_armor_inv_helmet_lorien.png",
	groups = {armor_head=15, armor_heal=20, armor_use=75},
	wear = 0,
})

minetest.register_tool("two_lords_armor:helmet_forest", {
	description = "Forest Helmet",
	inventory_image = "two_lords_armor_inv_helmet_forest.png",
	groups = {armor_head=10, armor_heal=15, armor_use=50},
	wear = 0,
})

minetest.register_tool("two_lords_armor:helmet_rivendell", {
	description = "Rivendell Helmet",
	inventory_image = "two_lords_armor_inv_helmet_rivendell.png",
	groups = {armor_head=20, armor_heal=12, armor_use=75},
	wear = 0,
})

-- Register Torso Armor

minetest.register_tool("two_lords_armor:chestplate_morgul", {
	description = "Morgul Chestplate",
	inventory_image = "two_lords_armor_inv_chestplate_morgul.png",
	groups = {armor_torso=22, armor_heal=12, armor_use=100},
	wear = 0,
})

minetest.register_tool("two_lords_armor:chestplate_gundabad", {
	description = "Gundabad Chestplate",
	inventory_image = "two_lords_armor_inv_chestplate_gundabad.png",
	groups = {armor_torso=19, armor_heal=12, armor_use=50},
	wear = 0,
})

minetest.register_tool("two_lords_armor:chestplate_orc", {
	description = "Orc Shirt",
	inventory_image = "two_lords_armor_inv_chestplate_orc.png",
	groups = {armor_torso=3, armor_heal=20, armor_use=25},
	wear = 0,
})

minetest.register_tool("two_lords_armor:chestplate_khazad_dum", {
	description = "Khazad-dûm Chestplate",
	inventory_image = "two_lords_armor_inv_chestplate_khazad_dum.png",
	groups = {armor_torso=19, armor_heal=10, armor_use=75},
	wear = 0,
})

minetest.register_tool("two_lords_armor:chestplate_lorien", {
	description = "Lorien Chestplate",
	inventory_image = "two_lords_armor_inv_chestplate_lorien.png",
	groups = {armor_torso=20, armor_heal=20, armor_use=75},
	wear = 0,
})

minetest.register_tool("two_lords_armor:chestplate_forest", {
	description = "Forest Shirt",
	inventory_image = "two_lords_armor_inv_chestplate_forest.png",
	groups = {armor_torso=3, armor_heal=20, armor_use=25},
	wear = 0,
})

minetest.register_tool("two_lords_armor:chestplate_rivendell", {
	description = "Rivendell Chestplate",
	inventory_image = "two_lords_armor_inv_chestplate_rivendell.png",
	groups = {armor_torso=25, armor_heal=12, armor_use=75},
	wear = 0,
})

-- Register Leg Armor

minetest.register_tool("two_lords_armor:leggings_morgul", {
	description = "Morgul Leggings",
	inventory_image = "two_lords_armor_inv_leggings_morgul.png",
	groups = {armor_legs=22, armor_heal=12, armor_use=100},
	wear = 0,
})

minetest.register_tool("two_lords_armor:leggings_gundabad", {
	description = "Gundabad Leggings",
	inventory_image = "two_lords_armor_inv_leggings_gundabad.png",
	groups = {armor_legs=19, armor_heal=12, armor_use=50},
	wear = 0,
})

minetest.register_tool("two_lords_armor:leggings_orc", {
	description = "Orc Leggings",
	inventory_image = "two_lords_armor_inv_leggings_orc.png",
	groups = {armor_legs=2, armor_heal=10, armor_use=25},
	wear = 0,
})

minetest.register_tool("two_lords_armor:leggings_khazad_dum", {
	description = "Khazad-dûm Leggings",
	inventory_image = "two_lords_armor_inv_leggings_khazad_dum.png",
	groups = {armor_legs=19, armor_heal=10, armor_use=75},
	wear = 0,
})

minetest.register_tool("two_lords_armor:leggings_lorien", {
	description = "Lorien Leggings",
	inventory_image = "two_lords_armor_inv_leggings_lorien.png",
	groups = {armor_legs=20, armor_heal=20, armor_use=75},
	wear = 0,
})

minetest.register_tool("two_lords_armor:leggings_forest", {
	description = "Forest Leggings",
	inventory_image = "two_lords_armor_inv_leggings_forest.png",
	groups = {armor_legs=2, armor_heal=10, armor_use=25},
	wear = 0,
})

minetest.register_tool("two_lords_armor:leggings_rivendell", {
	description = "Rivendell Leggings",
	inventory_image = "two_lords_armor_inv_leggings_rivendell.png",
	groups = {armor_legs=25, armor_heal=12, armor_use=75},
	wear = 0,
})

-- Register Boots

minetest.register_tool("two_lords_armor:boots_morgul", {
	description = "Morgul Boots",
	inventory_image = "two_lords_armor_inv_boots_morgul.png",
	groups = {armor_feet=22, armor_heal=12, armor_use=100},
	wear = 0,
})

minetest.register_tool("two_lords_armor:boots_gundabad", {
	description = "Gundabad Boots",
	inventory_image = "two_lords_armor_inv_boots_gundabad.png",
	groups = {armor_feet=15, armor_heal=12, armor_use=50},
	wear = 0,
})

minetest.register_tool("two_lords_armor:boots_orc", {
	description = "Orc Boots",
	inventory_image = "two_lords_armor_inv_boots_orc.png",
	groups = {armor_feet=1.5, armor_heal=7.5, armor_use=15},
	wear = 0,
})

minetest.register_tool("two_lords_armor:boots_khazad_dum", {
	description = "Khazad-dûm Boots",
	inventory_image = "two_lords_armor_inv_boots_khazad_dum.png",
	groups = {armor_feet=14, armor_heal=10, armor_use=75},
	wear = 0,
})

minetest.register_tool("two_lords_armor:boots_lorien", {
	description = "Lorien Boots",
	inventory_image = "two_lords_armor_inv_boots_lorien.png",
	groups = {armor_feet=15, armor_heal=20, armor_use=75},
	wear = 0,
})

minetest.register_tool("two_lords_armor:boots_forest", {
	description = "Forest Boots",
	inventory_image = "two_lords_armor_inv_boots_forest.png",
	groups = {armor_feet=1.5, armor_heal=7.5, armor_use=15},
	wear = 0,
})

minetest.register_tool("two_lords_armor:boots_rivendell", {
	description = "Rivendell Boots",
	inventory_image = "two_lords_armor_inv_boots_rivendell.png",
	groups = {armor_feet=20, armor_heal=12, armor_use=75},
	wear = 0,
})

-- Register Crafting Recipes

local craft_ingreds = {
	gundabad = "two_lords_ore:gundabad_ingot",
	morgul = "two_lords_ore:morgul_ingot",
	khazad_dum = "two_lords_ore:khazad_dum_ingot",
	lorien = "two_lords_ore:lorien_ingot",
	rivendell = "two_lords_ore:rivendell_ingot",
}

for k, v in pairs(craft_ingreds) do
	minetest.register_craft({
		output = "two_lords_armor:helmet_"..k,
		recipe = {
			{v, v, v},
			{v, "", v},
			{"", "", ""},
		},
	})
	minetest.register_craft({
		output = "two_lords_armor:chestplate_"..k,
		recipe = {
			{v, "", v},
			{v, v, v},
			{v, v, v},
		},
	})
	minetest.register_craft({
		output = "two_lords_armor:leggings_"..k,
		recipe = {
			{v, v, v},
			{v, "", v},
			{v, "", v},
		},
	})
	minetest.register_craft({
		output = "two_lords_armor:boots_"..k,
		recipe = {
			{v, "", v},
			{v, "", v},
		},
	})
end

minetest.register_craft({
		output = "two_lords_armor:helmet_goblin",
		recipe = {
		{"", "two_lords_ore:gundabad_ingot", ""},
		{"two_lords_ore:gundabad_ingot", "", "two_lords_ore:gundabad_ingot"},
		}
})
