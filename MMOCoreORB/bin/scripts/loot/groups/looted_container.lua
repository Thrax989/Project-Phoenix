looted_container = {
	description = "",
	minimumLevel = 0,
	maximumLevel = 0,
	lootItems = {
		-- Junk/Misc Items (25% chance)
		-- Common
		{itemTemplate = "attachment_clothing", weight = 87719},
		{itemTemplate = "color_crystals", weight = 87719},
		{itemTemplate = "blacksunhelm1", weight = 87719},
		{itemTemplate = "crystals_all", weight = 87719},
		{itemTemplate = "holocron_dark", weight = 87719},
		{itemTemplate = "holocron_light", weight = 87719},
		{itemTemplate = "cyborggroup6", weight = 87719},
		{itemTemplate = "cyborggroup5", weight = 87719},
		{itemTemplate = "cyborggroup4", weight = 87719},
		{itemTemplate = "cyborggroup3", weight = 87719},
		{itemTemplate = "cyborggroup2", weight = 87719},
		{itemTemplate = "cyborggroup1", weight = 87719},
		{itemTemplate = "nightsister1", weight = 87719},
		{itemTemplate = "nightsister2", weight = 87719},
		{itemTemplate = "nightsister3", weight = 87719},
		{itemTemplate = "nightsister4", weight = 87719},
		{itemTemplate = "nightsister5", weight = 87719},
		{itemTemplate = "nightsister6", weight = 87719},
		{itemTemplate = "locked_container", weight = 87719},
		{itemTemplate = "photographic_image", weight = 87719},
		{itemTemplate = "locked_container", weight = 87719},
		{itemTemplate = "recording_rod", weight = 87719},
		{itemTemplate = "locked_container", weight = 87719},
		{itemTemplate = "used_ticket", weight = 87719},
		{itemTemplate = "locked_container", weight = 87719},

		-- Uncommon
		{itemTemplate = "force_color_crystal", weight = 43861},
		{itemTemplate = "force_crystal_poor", weight = 43861},
		{itemTemplate = "force_crystal_okay", weight = 43861},
		{itemTemplate = "jedi_holocron_dark", weight = 43861},
		{itemTemplate = "jedi_holocron_light", weight = 43861},
		{itemTemplate = "attachment_clothing", weight = 43860},
		{itemTemplate = "attachment_armor", weight = 43860},

		-- Weapons (25% chance)
		{groupTemplate = "weapons_all", weight = 2500000},

		-- Armors (25% chance)
		{groupTemplate = "armor_all", weight = 2500000},

		-- Clothing (25% chance)
		{groupTemplate = "wearables_all", weight = 2500000},
	}
}

addLootGroupTemplate("looted_container", looted_container)
