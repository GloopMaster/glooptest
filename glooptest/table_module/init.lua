glooptest.table_module = {}
glooptest.debug("MESSAGE","Loading Table Module Now!")

--dofile(minetest.get_modpath("glooptest").."/table_module/api.lua")

local fixed = {
    { -8/16, -8/16, -8/16, 8/16, -4/16, 8/16 }, -- base
    { -8/16, 3/16, -8/16, 8/16, 8/16, 8/16 }, -- top
    { 3/16, -7/16, 3/16, 7/16, 7/16, 7/16 },
    { 3/16, -7/16, -7/16, 7/16, 7/16, -3/16 },
    { -7/16, -7/16, 3/16, -3/16, 7/16, 7/16 },
    { -7/16, -7/16, -7/16, -3/16, 7/16, -3/16 },
}

-- {used item, produced node}
glooptest.table_module.table_changers = {
	{},
}

function glooptest.table_module.register_table(used_item, produced_node)
	if minetest.registered_items[used_item] ~= nil and minetest.registered_items[produced_node] ~= nil then
		table.insert(glooptest.table_module.table_changers, {used_item, produced_node})
	end
end

minetest.register_alias("glooptest:table", "glooptest:wooden_table")
minetest.register_node("glooptest:wooden_table", {
    description = "Wooden Table",
    drawtype = "nodebox",
	tiles = {"glooptest_table_tb.png","glooptest_table_tb.png","glooptest_table_side.png"},
	paramtype = "light",
	groups = {choppy=3, snappy=3},
    node_box = {
        type = "fixed",
        fixed = fixed,
    },
})

minetest.register_craft({
	output = "glooptest:table",
	recipe = {
		{"group:wood","group:wood","group:wood"},
		{"default:stick","","default:stick"},
		{"group:wood","","group:wood"},
	}
})

minetest.register_craftitem("glooptest:upgrade_core", {
	description = "Upgrade Core",
	inventory_image = "glooptest_upgrade_core.png",
})

minetest.register_craft({
	output = "glooptest:upgrade_core",
	recipe = {
		{"", "glooptest:akalin_ingot", ""},
		{"glooptest:akalin_ingot", "default:mese_crystal_fragment", "glooptest:akalin_ingot"},
		{"", "glooptest:akalin_ingot", ""},
	},
})

if LOAD_ORE_MODULE == true then
	minetest.register_craftitem("glooptest:encrusting_upgrade", {
		description = "Encrusting Upgrade",
		inventory_image = "glooptest_encrusting_upgrade.png",
	})
	
	minetest.register_craft({
		output = "glooptest:encrusting_upgrade",
		recipe = {
			{"group:glooptest_gem", "group:glooptest_gem", "group:glooptest_gem"},
			{"glooptest:hammer_steel", "glooptest:upgrade_core", "glooptest:handsaw_steel"},
			{"group:glooptest_gem", "group:glooptest_gem", "group:glooptest_gem"},
		},
	})
end
