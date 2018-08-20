two_lords_mobs = {}

-- Intllib
local S
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s) return s end
end
two_lords_mobs.intllib = S

local path = minetest.get_modpath("two_lords_mobs")

-- Load files

-- Alignment
--dofile(path .. "/alignment.lua")

-- Elves
dofile(path .. "/elves.lua")

-- Dwarves
dofile(path .. "/dwarves.lua")

-- Wraiths
dofile(path .. "/wraiths.lua")

-- Orcs
dofile(path .. "/orcs.lua")

-- Goblins
dofile(path .. "/goblins.lua")

-- Animals
dofile(path .. "/animals.lua")

-- Mob Items
dofile(path .. "/crafts.lua")

minetest.log("action", "[MOD] Two Lords Mobs loaded")
