krayt_dragon_ancient_elder = Creature:new {
 	objectName = "@mob/creature_names:",
 	customName = "krayt dragon ancient elder",
 	socialGroup = "krayt",
 	faction = "",
 	level = 300,
 	chanceHit = 30.0,
 	damageMin = 2270,
 	damageMax = 4250,
 	baseXp = 285490,
 	baseHAM = 410000,
 	baseHAMmax = 501000,
 	armor = 3,
 	resists = {75,75,75,75,75,75,75,75,25},
 	meatType = "meat_carnivore",
 	meatAmount = 1000,
 	hideType = "hide_bristley",
 	hideAmount = 950,
 	boneType = "bone_mammal",
 	boneAmount = 905,
 	milk = 0,
 	tamingChance = 0.25,
 	ferocity = 30,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
 	optionsBitmask = AIENABLED,
 	diet = CARNIVORE,
 	scale = 1.5,
 
 	templates = {"object/mobile/krayt_dragon.iff"},
	lootGroups = {
		{
			groups = {
					{group = "krayt_tissue_rare", chance = 3000000},
					{group = "krayt_dragon_common2", chance = 3000000},
					{group = "pearls_flawless", chance = 3000000},
					{group = "clothing_attachments", chance = 1000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "pearls_flawless", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "clothing_attachments", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "armor_attachments", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "krayt_tissue_rare", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "krayt_tissue_rare", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "saberhand24", chance = 10000000}
			},
			lootChance = 1000000
		},
		{
			groups = {
				{group = "saberhand25", chance = 10000000}
			},
			lootChance = 1000000
		},
		{
			groups = {
				{group = "saberhand26", chance = 10000000}
			},
			lootChance = 1000000
		},
	}, 
 	weapons = {},
 	conversationTemplate = "",
 	attacks = {
 		{"creatureareacombo","stateAccuracyBonus=100"},
 		{"creatureareaknockdown","stateAccuracyBonus=100"}
 	}
 }
 
 CreatureTemplates:addCreatureTemplate(krayt_dragon_ancient_elder, "krayt_dragon_ancient_elder")
