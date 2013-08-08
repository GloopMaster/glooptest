glooptest.biome_module = {}
glooptest.debug("MESSAGE","Loading Biome Module Now!")

<<<<<<< HEAD
=======
local stone_sounds = default.node_sound_stone_defaults()

minetest.register_node("glooptest:slate", {
	description = "Slate",
	tiles = {"glooptest_slate.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1},
	sounds = stone_sounds,
})

>>>>>>> *boop*
minetest.register_biome({
	name           = "glooptest_flatlands",
	height_min     = 1,
	height_max     = 3,
	heat_point     = 40.0,
	humidity_point = 40.0,
})

minetest.register_biome({
	name           = "glooptest_wetlands",
	height_min     = -4,
	height_max     = 5,
	heat_point     = 40.0,
	humidity_point = 70.0,
})

minetest.register_biome({
	name           = "glooptest_wasteland",
	height_min     = 3,
	height_max     = 20,
	node_top       = "default:sand",
	depth_top      = 1,
	node_filler    = "default:desert_sand",
	depth_filler   = 1,
	heat_point     = 40.0,
	humidity_point = 10.0,
})

minetest.register_biome({
<<<<<<< HEAD
	name           = "glooptest_mountains",
	height_min     = 1,
	height_max     = 200,
	node_top       = "default:stone",
	depth_top      = 1,
	node_filler    = "default:stone",
	depth_filler   = 1,
	heat_point     = 30.0,
	humidity_point = 40.0,
})
=======
	name           = "glooptest_plateau",
	height_min     = 190,
	height_max     = 200,
	node_top       = "glooptest:slate",
	depth_top      = 100,
	node_filler    = "glooptest:slate",
	depth_filler   = 100,
	heat_point     = 30.0,
	humidity_point = 40.0,
})
>>>>>>> *boop*
