glooptest.biome_module = {}
glooptest.debug("MESSAGE","Loading Biome Module Now!")

local stone_sounds = default.node_sound_stone_defaults()

dofile(minetest.get_modpath("glooptest").."/biome_module/biomes.cfg")

minetest.register_node("glooptest:gray_dirt", {
	description = "Hardened Dirt",
	tiles = {"glooptest_slate.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = stone_sounds,
})

minetest.register_biome({
	name           = "Flatlands",
	height_min     = 1,
	height_max     = 3,
	heat_point     = 40.0,
	humidity_point = 40.0,
})

minetest.register_biome({
	name           = "Wetlands",
	height_min     = -20,
	height_max     = 5,
	heat_point     = 40.0,
	humidity_point = 70.0,
})

minetest.register_biome({
	name           = "Wasteland",
	height_min     = 1,
	height_max     = 20,
	node_top       = "glooptest:gray_dirt",
	depth_top      = 3,
	node_filler    = "default:desert_stone",
	depth_filler   = 15,
	heat_point     = 40.0,
	humidity_point = 10.0,
})

if DEFAULTISH_BIOMES == true then
minetest.register_biome({
	name           = "Ocean",
	node_top       = "default:sand",
	depth_top      = 3,
	node_filler    = "default:stone",
	depth_filler   = 0,
	height_min     = -31000,
	height_max     = 0,
	heat_point     = 40.0,
	humidity_point = 40.0
})
 
minetest.register_biome({
	name           = "Gravel Ocean",
	node_top       = "default:gravel",
	depth_top      = 3,
	node_filler    = "default:stone",
	depth_filler   = 0,
	node_dust_water = "default:ice",
	height_min     = -31000,
	height_max     = 0,
	heat_point     = -10.0,
	humidity_point = 60.0
})
 
minetest.register_biome({
	name           = "Beach",
	node_top       = "default:sand",
	depth_top      = 3,
	node_filler    = "default:sandstone",
	depth_filler   = 3,
	height_min     = 1,
	height_max     = 3,
	heat_point     = 50.0,
	humidity_point = 10.0
})
 
minetest.register_biome({
	name           = "Gravel Beach",
	node_top       = "default:gravel",
	depth_top      = 2,
	node_filler    = "default:stone",
	depth_filler   = 0,
	node_dust      = "default:snow",
	node_dust_water = "default:ice",
	height_min     = 1,
	height_max     = 3,
	heat_point     = -10.0,
	humidity_point = 60.0
})
 
 
minetest.register_biome({
	name           = "Snow Plains",
	node_dust      = "default:snow",
	node_dust_water = "default:ice",
	height_min     = 1,
	height_max     = 20,
	heat_point     = -10.0,
	humidity_point = 50.0
})
 
minetest.register_biome({
	name           = "Plains",
	height_min     = 1,
	height_max     = 20,
	heat_point     = 40.0,
	humidity_point = 50.0
})
 
minetest.register_biome({
	name           = "Hills",
	height_min     = 21,
	height_max     = 40,
	heat_point     = 40.0,
	humidity_point = 50.0
})
 
minetest.register_biome({
	name           = "Snow Hills",
	node_dust      = "default:snow",
	node_dust_water = "default:ice",
	height_min     = 21,
	height_max     = 300,
	heat_point     = -10.0,
	humidity_point = 50.0
})
 
minetest.register_biome({
	name           = "Extreme Hills",
	height_min     = 41,
	height_max     = 300,
	heat_point     = 40.0,
	humidity_point = 50.0
})
 
minetest.register_biome({
	name           = "Desert",
	node_top       = "default:desert_sand",
	depth_top      = 3,
	node_filler    = "default:desert_stone",
	depth_filler   = 10,
	height_min     = 3,
	height_max     = 15,
	heat_point     = 90.0,
	humidity_point = 0.0
})
end

if GENERATE_TREES == true then
-- All biomes registered here rely on the existance of trees to make sense.

minetest.register_biome({
	name           = "Swamp",
	height_min     = -20,
	height_max     = 5,
	heat_point     = 55.0,
	humidity_point = 80.0,
})

if DEFAULTISH_BIOMES == true then
minetest.register_biome({
	name           = "Forest",
	height_min     = 1,
	height_max     = 20,
	heat_point     = 45.0,
	humidity_point = 50.0
})

minetest.register_biome({
	name           = "Snow Forest",
	node_dust      = "default:snow",
	node_dust_water = "default:ice",
	height_min     = 1,
	height_max     = 20,
	heat_point     = -10.0,
	humidity_point = 55.0
})
end

-- Credit to PilzAdam for this schematic.
--trees
minetest.register_decoration({
	deco_type = "schematic",
	place_on  = "default:dirt_with_grass",
	sidelen   = 8,
	schematic = minetest.get_modpath("glooptest").."/schematics/treeschem.mts",
	replacements = {{"base:leaves", "default:leaves"}, {"base:tree", "default:tree"}, {"base:dirt", "default:dirt"}},
	flags     = "place_center_x, place_center_z",
	rotation = "random",
	noise_params = {
		offset  = 1/120,
		scale   = 0.04,
		spread  = {x=125, y=125, z=125},
		seed    = 2,
		octaves = 4,
		persist = 0.66
	}
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on  = "default:dirt_with_grass",
	sidelen   = 8,
	schematic = minetest.get_modpath("glooptest").."/schematics/treeschem.mts",
	replacements = {{"base:leaves", "default:leaves"}, {"base:tree", "default:tree"}, {"base:dirt", "default:dirt"}},
	flags     = "place_center_x, place_center_z",
	rotation = "random",
    biomes = {"Forest", "Snow Forest", "Swamp"},
	noise_params = {
		offset  = 1/100,
		scale   = 0.08,
		spread  = {x=90, y=90, z=90},
		seed    = 2,
		octaves = 4,
		persist = 0.66
	}
})
end
