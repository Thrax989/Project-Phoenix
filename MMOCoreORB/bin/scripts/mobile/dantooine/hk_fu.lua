hk_fu = Creature:new {
	objectName = "@mob/creature_names:",
	customName = "hk_fu (Meatbag Popper)",
	socialGroup = "self",
	pvpFaction = "",
	faction = "",
	level = 300,
	chanceHit = 75,
	damageMin = 7900,
	damageMax = 8100,
	baseXp = 435409,
	baseHAM = 25000000,
	baseHAMmax = 26000000,
	armor = 3,
	resists = {90,90,90,90,90,90,90,90,90},
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
	creatureBitmask = PACK + STALKER,
	optionsBitmask = AIENABLED + INTERESTING,
	diet = HERBIVORE,

templates = {"object/mobile/som/hk47.iff"},

	lootGroups = {
		{
			groups = {
				{group = "g_carbine_alliance_needler", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "g_carbine_bounty_ee3", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "g_carbine_charric", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "g_carbine_geo", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "g_carbine_mandalorian", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "g_carbine_proton", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "g_pistol_deathhammer", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "g_pistol_flechette", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "g_pistol_heroic_exar", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "g_pistol_intimidator", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "g_pistol_mandalorian", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "g_rifle_bowcaster_master", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "g_rifle_deathtroopers", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "g_rifle_eweb", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "g_rifle_geo_drill", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "g_rifle_mandalorian", chance = 10000000}
			},
			lootChance = 10000000
		},
		 {
			groups = {
				{group = "barc_speeder_deed_group", chance = 10000000}
			},
			lootChance = 1000000
		},
		{
			groups = {
				{group = "g_som_rifle_mustafar_disruptor", chance = 10000000}
			},
			lootChance = 10000000
		 },
			{
			groups = {
				{group = "g_rifle_proton", chance = 10000000}
			},
			lootChance = 10000000
		 },
		{
			groups = {
				{group = "g_ep3_loot_retaliation", chance = 10000000}
			},
			lootChance = 10000000
		 },
		{
			groups = {
				{group = "g_ep3_loot_retribution", chance = 10000000}
			},
			lootChance = 10000000
		 },
		},	
	reactionStf = "@npc_reaction/slang",
	defaultWeapon = "object/weapon/ranged/droid/droid_droideka_ranged.iff",
	defaultAttack = "creaturerangedattack"
}

CreatureTemplates:addCreatureTemplate(hk_fu, "hk_fu")
