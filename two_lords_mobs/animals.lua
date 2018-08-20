minetest.log("action", "animalstart")

-- Intllib
local S = two_lords_mobs.intllib

-- Animals

--mobs:register_mob("two_lords_mobs:dirty_sheep", {
--	type = "animal",
--	hp_min = 5,
--	hp_max = 10,
--	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
--	textures = "two_lords_sheep_dirty.png",
--	visual = "mesh",
--	mesh = "two_lords_sheep.b3d",
--	makes_footstep_sound = true,
--	walk_velocity = 1,
--	armor = 200,
--	drops = {
--		{name = "two_lords_mobs:lamb_raw",
--		chance = 1,
--		min = 2,
--		max = 3,},
--	},
--	drawtype = "front",
--	water_damage = 1,
--	lava_damage = 5,
--	light_damage = 0,
--	sounds = {
--		random = "mobs_sheep",
--	},
--	animation = {
--		speed_normal = 15,
--		stand_start = 0,
--		stand_end = 80,
--		walk_start = 81,
--		walk_end = 100,
--	},
--	follow = "farming:wheat",
--	view_range = 6,
--	
--	on_rightclick = function(self, clicker)
--		local item = clicker:get_wielded_item()
--		if item:get_name() == "farming:wheat" then
--			if not self.tamed then
--				if not minetest.setting_getbool("creative_mode") then
--					item:take_item()
--					clicker:set_wielded_item(item)
--				end
--				self.tamed = true
--			elseif self.naked then
--				if not minetest.setting_getbool("creative_mode") then
--					item:take_item()
--					clicker:set_wielded_item(item)
--				end
--				self.food = (self.food or 0) + 1
--				if self.food >= 8 then
--					self.food = 0
--					self.naked = false
--					self.object:set_properties({
--						textures = {"two_lords_sheep_dirty.png"},
--						mesh = "two_lords_sheep.b3d",
--					})
--				end
--			end
--			if self.milked then
--				self.regain_milk = (self.regain_milk or 0) + 1
--				if self.regain_milk >= 8 then
--					self.regain_milk = 0
--					self.milked = false
--				end
--			end
--			return
--		end
--		if clicker:get_inventory() and not self.naked and not item:get_name() == "bucket:bucket_empty" then
--			self.naked = true
--			if minetest.registered_items["two_lords_mobs:wool_dirty"] then
--				clicker:get_inventory():add_item("main", ItemStack("two_lords_mobs:wool_dirty "..math.random(1,3)))
--			end
--			self.object:set_properties({
--				textures = "two_lords_sheep_dirty_shaved.png",
--				mesh = "two_lords_sheep_shaved.x",
--			})
--		end
--		if item:get_name() == "bucket:bucket_empty" and not self.milked then
--			self.milked = true
--			if minetest.registered_items["two_lords_mobs:bucket_milk"] then
--				clicker:get_inventory():add_item("main", "two_lords_mobs:bucket_milk")
--			end
--		end
--	end,
--})


mobs:register_mob("two_lords_mobs:dirty_sheep", {
	type = "animal",
	passive = true,
	hp_min = 8,
	hp_max = 10,
	armor = 200,
	collisionbox = {-0.5, -1, -0.5, 0.5, 0.3, 0.5},
	visual = "mesh",
	mesh = "two_lords_sheep.b3d",
	textures = {
		{"two_lords_sheep_dirty.png"},
	},
	gotten_texture = {"two_lords_sheep_dirty_shaved.png"},
	gotten_mesh = "two_lords_sheep_shaved.b3d",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_sheep",
	},
	walk_velocity = 1,
	run_velocity = 2,
	runaway = true,
	jump = true,
	drops = {
		{name = "two_lords_mobs:lamb_raw",
		chance = 1,
		min = 1,
		max = 3},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 80,
		walk_start = 81,
		walk_end = 100,
	},
	follow = {"farming:wheat", "default:grass_5"},
	view_range = 8,
	replace_rate = 10,
	replace_what = {"default:grass_3", "default:grass_4", "default:grass_5", "farming:wheat_8"},
	replace_with = "air",
	replace_offset = -1,
	fear_height = 3,

	on_rightclick = function(self, clicker)

		--are we feeding?
		if mobs:feed_tame(self, clicker, 8, true, true) then

			--if full grow fuzz
			if self.gotten == false then

				self.object:set_properties({
					textures = {"two_lords_sheep_dirty.png"},
					mesh = "two_lords_sheep.b3d",
				})
			end
			
			if self.milked then
				self.regain_milk = (self.regain_milk or 0) + 1
				if self.regain_milk >= 8 then
					self.regain_milk = 0
					self.milked = false
				end
			end

			return
		end

		local item = clicker:get_wielded_item()
		local itemname = item:get_name()

		--are we giving a haircut>
		if clicker:get_inventory() and not self.gotten then

			if self.gotten ~= false
			or self.child ~= false
			or not minetest.get_modpath("wool") then
				return
			end

			self.gotten = true -- shaved

			if minetest.registered_items["two_lords_mobs:wool_dirty"] then
				clicker:get_inventory():add_item("main", ItemStack("two_lords_mobs:wool_dirty "..math.random(1,3)))
			end

			if obj then

				obj:setvelocity({
					x = math.random(-1, 1),
					y = 5,
					z = math.random(-1, 1)
				})
			end

			self.object:set_properties({
				textures = {"two_lords_sheep_dirty_shaved.png"},
				mesh = "two_lords_sheep_shaved.b3d",
			})

			return
		end
		
		if itemname == "bucket:bucket_empty" and not self.milked then
			self.milked = true
			if minetest.registered_items["two_lords_mobs:bucket_sheep_milk"] then
				clicker:get_inventory():add_item("main", "two_lords_mobs:bucket_sheep_milk")
				clicker:get_inventory():remove_item("main", "bucket:bucket_empty")
			end
		end
	end
})

mobs:spawn({
	name = "two_lords_mobs:dirty_sheep",
	nodes = "default:dirt_with_grass",
	chance = 10000,
	active_object_count = 3,
	y_max = 31000,
})

mobs:register_egg("two_lords_mobs:dirty_sheep", S("Dirty Sheep"), "two_lords_wool_dirty.png", 1)

-- Sheep

minetest.log("action", "animalend")
