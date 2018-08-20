two_lords_mobs = {}
two_lords_mobs_min_alignment = -50
two_lords_mobs_max_alignment = 50

attributes = {}

--function two_lords_mobs.set_player_attribute(player, attribute, value)
--	local metadata = player:get_metadata()
--	if metadata == nil then
--		local meta = {}
--	else
--	    local meta = minetest.parse_json(metadata)
--	end
--	metadata = minetest.write_json({attribute{value}})
--	player:set_metadata(metadata)
--end

--function two_lords_mobs.get_player_attribute(player, attribute)
--	local metadata = player:get_metadata()
--	if metadata == nil then
--		local meta = {}
--	else
--		local meta = minetest.parse_json(metadata)
--	end
--	result = meta[attribute]
--	return result
--end

function two_lords_mobs.set_player_alignment(player, alignment)
--	local attr = two_lords_mobs.get_player_attribute(player, "two_lords_mobs")
--	attr.alignment = alignment
--	if attr.alignment > two_lords_mobs_max_alignment then
--		attr.alignment = two_lords_mobs_max_alignment
--	elseif attr.alignment < two_lords_mobs_min_alignment then
--		attr.alignment = two_lords_mobs_min_alignment
--	end
--	two_lords_mobs.set_player_attribute(player, "two_lords_mobs",attr)
end

minetest.register_chatcommand("change_alignment", {
	params = "",
	description = "Change alignment: Changes player's alignment",
	func = function(player)
--			local attr = two_lords_mobs.get_player_attribute(player, "two_lords_mobs")
--			attr.alignment = attr.alignment + math.random(-2, 2)
--			if attr.alignment > 50 then
--				attr.alignment = 50
--			elseif attr.alignment < -50 then
--				attr.alignment = -50
--			end
--			two_lords_mobs.set_player_attribute(player, "two_lords_mobs",attr)
--			minetest.chat_send_player(player, attr.alignment)
--			return true
	end,
})

minetest.register_chatcommand("get_alignment", {
	params = "",
	description = "Get alignment: Shows player's alignment(as a value)",
	func = function(player)
--			local attr = two_lords_mobs.get_player_attribute(player, "two_lords_mobs")
--			minetest.chat_send_player(player, attr.alignment)
--			return true
	end,
})

minetest.register_chatcommand("align", {
	params = "",
	description = "Align: Shows player's alignment(ranging from demonic to neutral to heroic)",
	func = function(player)
--			local attr = two_lords_mobs.get_player_attribute(player, "two_lords_mobs")
--			if attr.alignment == 0 then
--				minetest.chat_send_player(player, "Alignment: Neutral")
--			elseif attr.alignment > 0 and attr.alignment <= 45 then
---				minetest.chat_send_player(player, "Alignment: Good")
--			elseif attr.alignment > 45 and attr.alignment <= 50 then
--				minetest.chat_send_player(player, "Alignment: Heroic")
--			elseif attr.alignment < 0 and attr.alignment >= -45 then
--				minetest.chat_send_player(player, "Alignment: Evil")
--			elseif attr.alignment < -45 and attr.alignment >= -50 then
--				minetest.chat_send_player(player, "Alignment: Demonic")
--			end
			return true
	end,
})

function two_lords_mobs.change_player_alignment(player, change)
--	local attr = two_lords_mobs.get_player_attribute(player, "two_lords_mobs")
--	attr.alignment = attr.alignment + change
--	if attr.alignment > two_lords_mobs_max_alignment then
--		attr.alignment = two_lords_mobs_max_alignment
--	elseif attr.alignment < two_lords_mobs_min_alignment then
--		attr.alignment = two_lords_mobs_min_alignment
--	end
--	two_lords_mobs.set_player_attribute(player, "two_lords_mobs",attr)
end

function two_lords_mobs.get_player_alignment(player)
--	return two_lords_mobs.get_player_attribute(player, "two_lords_mobs").alignment
end

-- Set player alignment when player joins game

minetest.register_on_joinplayer(function(player)
--	local attr = two_lords_mobs.get_player_attribute(player, "two_lords_mobs")
--	if attr == nil then
--		two_lords_mobs.set_player_attribute(player, "two_lords_mobs",{alignment=0})
--	end
--	player.alignment = 0
	
end)
