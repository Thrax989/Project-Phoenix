singing_mountain_clan_councilwoman = Creature:new {
	objectName = "@mob/creature_names:singing_mtn_clan_councilwoman",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "nightsister",
	faction = "",
	chanceHit = 65.00,
	damageMin = 1500,
	damageMax = 2500,
	baseXp = 27849000,
	baseHAM = 300000,
	baseHAMmax = 3500000,	
	armor = 3,
	resists = {35,35,35,35,35,35,35,35,35},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + HEALER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_dathomir_sing_mt_clan_councilwoman.iff"},
	lootGroups = {
		{
			groups = {
				{group = "pearls_flawless", chance = 5000000},
				{group = "armor_attachments", chance = 2500000},
				{group = "clothing_attachments", chance = 2500000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "pearls_flawless", chance = 5000000},
				{group = "g_pistol_heroic_exar", chance = 2500000},
				{group = "clothing_attachments", chance = 2500000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "halloweenevent1", chance = 5000000},
				{group = "halloweenevent2", chance = 2500000},
				{group = "halloweenevent3", chance = 2500000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "halloweenevent4", chance = 5000000},
				{group = "halloweenevent5", chance = 2500000},
				{group = "halloweenevent6", chance = 2500000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "halloweenevent7", chance = 5000000},
				{group = "halloweenevent8", chance = 2500000},
				{group = "halloweenevent9", chance = 2500000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "halloweenevent10", chance = 5000000},
				{group = "halloweenevent11", chance = 2500000},
				{group = "halloweenevent12", chance = 2500000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "halloweenevent13", chance = 5000000},
				{group = "halloweenevent14", chance = 2500000},
				{group = "halloweenevent15", chance = 2500000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "pearls_flawless", chance = 5000000},
				{group = "armor_attachments", chance = 2500000},
				{group = "clothing_attachments", chance = 2500000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "pearls_flawless", chance = 5000000},
				{group = "armor_attachments", chance = 2500000},
				{group = "clothing_attachments", chance = 2500000}
			},
			lootChance = 10000000
		},
		  {
			groups = {
				{group = "nyms_rare", chance = 3000000},
				{group = "g_pistol_heroic_exar", chance = 2000000},
				{group = "g_named_crystals", chance = 1000000},
				{group = "saberhand20", chance = 4000000}
		},
			lootChance = 10000000
		  },
		  {
			groups = {
				{group = "saberhand18", chance = 3000000},
				{group = "saberhand19", chance = 2000000},
				{group = "g_named_crystals", chance = 1000000},
				{group = "weapons_all", chance = 4000000}
		},
			lootChance = 10000000
		  },
		  {
			groups = {
				{group = "g_pistol_heroic_exar", chance = 3000000},
				{group = "aakuan_common", chance = 2000000},
				{group = "g_named_crystals", chance = 1000000},
				{group = "weapons_all", chance = 4000000}
		},
			lootChance = 10000000
		  },
		  {
			groups = {
				{group = "g_pistol_heroic_sd", chance = 3000000},
				{group = "g_pistol_heroic_exar", chance = 2000000},
				{group = "g_sword_pvp_bf_01", chance = 1000000},
				{group = "g_pvp_bf_knuckler", chance = 4000000}
		},
			lootChance = 10000000
		  },
		  {
			groups = {
				{group = "g_carbine_heroic_sd", chance = 3000000},
				{group = "g_carbine_kun_massassi", chance = 2000000},
				{group = "g_named_crystals", chance = 1000000},
				{group = "g_polearm_heroic_sd", chance = 4000000}
		},
			lootChance = 10000000
		  },
		  {
			groups = {
				{group = "g_carbine_heroic_sd", chance = 500000},
				{group = "g_carbine_kun_massassi", chance = 500000},
				{group = "g_polearm_heroic_sd", chance = 500000},
				{group = "g_pvp_bf_knuckler", chance = 500000},
				{group = "g_sword_pvp_bf_01", chance = 500000},
				{group = "g_pistol_heroic_exar", chance = 500000},
				{group = "g_pistol_heroic_sd", chance = 500000},
				{group = "g_som_2h_sword_obsidian", chance = 500000},
				{group = "g_som_2h_sword_tulrus", chance = 500000},
				{group = "g_som_sword_obsidian", chance = 500000},
				{group = "saberhand17", chance = 4300000},
				{group = "g_ep3_chiss_poacher_backpack", chance = 200000},
				{group = "g_ep3_loot_necrosis", chance = 500000}
			},
			lootChance = 10000000
		},
		  {
			groups = {
				{group = "g_ep3_chiss_poacher_backpack", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "g_ep3_loot_necrosis", chance = 5000000},
				{group = "armor_attachments", chance = 2500000},
				{group = "g_som_2h_sword_tulrus", chance = 2500000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "pearls_flawless", chance = 5000000},
				{group = "armor_attachments", chance = 2500000},
				{group = "g_som_sword_obsidian", chance = 2500000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "pearls_flawless", chance = 5000000},
				{group = "armor_attachments", chance = 2500000},
				{group = "clothing_attachments", chance = 2500000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "pearls_flawless", chance = 5000000},
				{group = "armor_attachments", chance = 2500000},
				{group = "g_som_sword_obsidian", chance = 2500000}
			},
			lootChance = 10000000
		},
		  {
			groups = {
				{group = "saberhand15", chance = 3000000},
				{group = "saberhand16", chance = 2000000},
				{group = "g_named_crystals", chance = 1000000},
				{group = "g_ep3_loot_necrosis", chance = 4000000}
		},
			lootChance = 10000000
		  },
		  {
			groups = {
				{group = "saberhand14", chance = 3000000},
				{group = "g_som_2h_sword_tulrus", chance = 2000000},
				{group = "g_named_crystals", chance = 1000000},
				{group = "weapons_all", chance = 4000000}
		},
			lootChance = 10000000
		  },
		  {
			groups = {
				{group = "saberhand13", chance = 3000000},
				{group = "saberhand12", chance = 2000000},
				{group = "g_named_crystals", chance = 1000000},
				{group = "weapons_all", chance = 4000000}
		},
			lootChance = 10000000
		  },
		  {
			groups = {
				{group = "nyms_rare", chance = 3000000},
				{group = "aakuan_common", chance = 2000000},
				{group = "g_named_crystals", chance = 1000000},
				{group = "weapons_all", chance = 4000000}
		},
			lootChance = 10000000
		  },
		  {
			groups = {
				{group = "nyms_rare", chance = 3000000},
				{group = "aakuan_common", chance = 2000000},
				{group = "g_named_crystals", chance = 1000000},
				{group = "g_ep3_loot_necrosis", chance = 4000000}
		},
			lootChance = 10000000
		  },
		  {
			groups = {
				{group = "g_carbine_heroic_sd", chance = 500000},
				{group = "g_carbine_kun_massassi", chance = 500000},
				{group = "g_polearm_heroic_sd", chance = 500000},
				{group = "g_pvp_bf_knuckler", chance = 500000},
				{group = "g_sword_pvp_bf_01", chance = 500000},
				{group = "g_pistol_heroic_exar", chance = 500000},
				{group = "g_pistol_heroic_sd", chance = 500000},
				{group = "g_som_2h_sword_obsidian", chance = 500000},
				{group = "g_som_2h_sword_tulrus", chance = 500000},
				{group = "g_som_sword_obsidian", chance = 500000},
				{group = "weapons_all", chance = 4300000},
				{group = "g_ep3_chiss_poacher_backpack", chance = 200000},
				{group = "g_ep3_loot_necrosis", chance = 500000}
			},
			lootChance = 10000000
		},
		  {
			groups = {
				{group = "saberhand14", chance = 10000000}
			},
			lootChance = 10000000
		},
		},
	weapons = {"mixed_force_weapons"},
	reactionStf = "@npc_reaction/slang",
	attacks = merge(brawlermaster,pikemanmaster)
}

CreatureTemplates:addCreatureTemplate(singing_mountain_clan_councilwoman, "singing_mountain_clan_councilwoman")
