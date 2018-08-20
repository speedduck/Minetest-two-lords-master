
-- Create craftitems

minetest.register_craftitem("rings_of_power:evil_essence", {
	description = "A powerful evil essence",
	inventory_image = "evil_essence.png",
})

minetest.register_craftitem("rings_of_power:good_essence", {
	description = "A powerful good essence",
	inventory_image = "good_essence.png",
})

minetest.register_craftitem("rings_of_power:magical_evil_essence", {
	description = "A powerful magical evil essence",
	tiles = {"magical_evil_essence.png"},
	inventory_image = "magical_evil_essence.png",
})

minetest.register_craftitem("rings_of_power:magical_good_essence", {
	description = "A powerful magical good essence",
	tiles = {"magical_good_essence.png"},
	inventory_image = "magical_good_essence.png",
})

minetest.register_craftitem("rings_of_power:uncooked_gold_ring", {
	description = "A piece of uncooked gold used to make a ring",
	inventory_image = "uncooked_gold.png",
})

minetest.register_craftitem("rings_of_power:uncooked_evil_magical_gold_ring", {
	description = "A piece of uncooked gold used to make a ring infused with magical evil essence",
	inventory_image = "uncooked_gold.png",
})

minetest.register_craftitem("rings_of_power:uncooked_good_magical_gold_ring", {
	description = "A piece of uncooked gold used to make a ring infused with magical good essence",
	inventory_image = "uncooked_gold.png",
})

-- Create nodes

minetest.register_node("rings_of_power:evil_essence_block", {
	description = "A powerful magical evil essence",
	tiles = {"magical_evil_essence.png"},
	inventory_image = "magical_evil_essence.png",
	drop = "rings_of_power:magical_evil_essence",
	groups = {cracky=1,snappy=1,crumbly=1,choppy=1,level=1},
})

minetest.register_node("rings_of_power:good_essence_block", {
	description = "A powerful magical good essence",
	tiles = {"magical_good_essence.png"},
	inventory_image = "magical_good_essence.png",
	drop = "rings_of_power:magical_evil_essence",
	groups = {cracky=1,snappy=1,crumbly=1,choppy=1,level=1},
})

-- Create crafting recipes

minetest.register_craft({
	output = 'rings_of_power:evil_essence',
	recipe = {
		{'bucket:bucket_lava','bucket:bucket_lava','bucket:bucket_lava'},
		{'','default:obsidian',''},
		{'bucket:bucket_lava','bucket:bucket_lava','bucket:bucket_lava'},
	}
})

minetest.register_craft({
	output = 'rings_of_power:good_essence',
	recipe = {
		{'bucket:bucket_water','bucket:bucket_water','bucket:bucket_water'},
		{'default:tree','default:tree','default:tree'},
		{'bucket:bucket_water','bucket:bucket_water','bucket:bucket_water'},
	}
})

minetest.register_craft({
	output = 'rings_of_power:magical_evil_essence',
	recipe = {
		{'default:steel_ingot','default:diamond','default:steel_ingot'},
		{'default:mese_crystal','rings_of_power:evil_essence','default:mese_crystal'},
		{'default:steel_ingot','default:diamond','default:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'rings_of_power:magical_good_essence',
	recipe = {
		{'default:steel_ingot','default:diamond','default:steel_ingot'},
		{'default:mese_crystal','rings_of_power:good_essence','default:mese_crystal'},
		{'default:steel_ingot','default:diamond','default:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'rings_of_power:uncooked_gold_ring',
	recipe = {
		{'default:gold_lump','default:gold_lump','default:gold_lump'},
		{'default:gold_lump','default:gold_lump','default:gold_lump'},
		{'default:gold_lump','default:gold_lump','default:gold_lump'},
	}
})

minetest.register_craft({
	output = 'rings_of_power:uncooked_evil_magical_gold_ring',
	recipe = {
		{'rings_of_power:uncooked_gold_ring','rings_of_power:magical_evil_essence'},
	}
})

minetest.register_craft({
	output = 'rings_of_power:uncooked_good_magical_gold_ring',
	recipe = {
		{'rings_of_power:uncooked_gold_ring','rings_of_power:magical_good_essence'},
	}
})

-- Create tools

minetest.register_tool("rings_of_power:evil_ring", {
	description = "An evil ring of power",
	inventory_image = "ring.png",
--	on_use = minetest.item_eat(2, "rings_of_power:evil_ring"),
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=90, maxlevel=2},
            crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=120, maxlevel=2},
            choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=90, maxlevel=2},
            snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=120, maxlevel=3},
		},
		damage_groups = {fleshy=16},
	}
})

minetest.register_tool("rings_of_power:good_ring", {
	description = "A good ring of power",
	inventory_image = "ring.png",
--	on_use = minetest.item_eat(6, "rings_of_power:good_ring"),
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=90, maxlevel=2},
            crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=120, maxlevel=2},
            choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=90, maxlevel=2},
            snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=120, maxlevel=3},
		},
		damage_groups = {fleshy=12},
	}
})

-- Create tool capabilities

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
	
	local puncher_name = puncher:get_player_name()
	local mypos = minetest.pos_to_string(pos) -- Sets variable to (X,Y,Z.. where Y is up) 
	
	local punch_time = 0
	now_time = os.clock()
--	minetest.chat_send_all(now_time .. ": punch time:" .. punch_time)
	
	if punch_time == nil or punch_time + 5 < now_time then

--		minetest.sound_play("the_hobbit") -- Plays sound from the Hobbit
		punch_time = now_time

	end

	if puncher:get_wielded_item():get_name() == "rings_of_power:good_ring" then
		hp = puncher:get_hp()+1
		if hp > 20 then
			hp = 20
		end
		puncher:set_hp(hp)
		
		minetest.chat_send_all(puncher_name .. " is wielding a good ring of power at " .. mypos .. ". Send aid immediately!!")
	end
	
	if puncher:get_wielded_item():get_name() == "rings_of_power:evil_ring" then
		minetest.chat_send_all(puncher_name .. " is wielding an evil ring of power at " .. mypos .. ". Destroy" .. puncher_name .. " immediately!!")
	end
end)

--minetest.register_on_player_hpchange(function(player, hp_change)
--	result = hp_change
--	if player:get_wielded_item():get_name() == "rings_of_power:good_ring" then
--		result = result + 1
--	elseif player:get_wielded_item():get_name() == "rings_of_power:evil_ring" then
--	result = result + 2
--	end
--	return result
--end, true)

-- Create cooking craft recipes

minetest.register_craft({
	type = "cooking",
	output = "rings_of_power:evil_ring",
	recipe = "rings_of_power:uncooked_evil_magical_gold_ring",
})

minetest.register_craft({
	type = "cooking",
	output = "rings_of_power:good_ring",
	recipe = "rings_of_power:uncooked_good_magical_gold_ring",
})

-- Create spawning blocks

--minetest.register_abm{
--	nodenames = {"group:lava"},
--	interval = 1000,
--	chance = 1000,
--	action = function(pos)
--		pos.y = pos.y + 2
--		minetest.set_node(pos, {name = "rings_of_power:evil_essence_block"})
--	end,
--}

--minetest.register_abm{
--	nodenames = {"group:water"},
--	interval = 1000,
--	chance = 1000000000,
--	action = function(pos)
--		pos.y = pos.y + 2
--		minetest.set_node(pos, {name = "rings_of_power:good_essence_block"})
--	end,
--}
