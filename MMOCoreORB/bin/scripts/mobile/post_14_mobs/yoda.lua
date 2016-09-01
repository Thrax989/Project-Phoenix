yoda = Creature:new {
	--objectName = "@mob/creature_names:yoda",
	customName = "Master_Yoda",
	socialGroup = "",
	pvpFaction = "",
	faction = "",
<<<<<<< HEAD
	level = 300,
	chanceHit = 92.5,
	damageMin = 3100,
	damageMax = 4200,
	baseXp = 19884,
	baseHAM = 100000,
	baseHAMmax = 208000,
	armor = 3,
=======
	level = 200,
	chanceHit = 92.5,
	damageMin = 2800,
	damageMax = 4580,
	baseXp = 16884,
	baseHAM = 96000,
	baseHAMmax = 178000,
	armor = 2,
>>>>>>> origin/master
	resists = {130,145,155,155,145,30,30,30,-1},
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
	creatureBitmask = KILLER + STALKER,
	optionsBitmask = 128,
	diet = HERBIVORE,

	templates = {"object/mobile/yoda.iff"},
	lootGroups = {
	    {
			groups = {
				{group = "holocron_dark", chance = 600000},
				{group = "holocron_light", chance = 600000},
				{group = "crystals_premium", chance = 1900000},
				{group = "pistols", chance = 1300000},
				{group = "g_yoda_house_loot_deed", chance = 1300000},
				{group = "armor_attachments", chance = 1100000},
				{group = "clothing_attachments", chance = 1100000},
				{group = "carbines", chance = 1300000},
				{group = "wearables_scarce", chance = 800000}				
			},
			lootChance = 8500000
		}
	},
	weapons = {"yoda_weapons"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster,forcepowermaster)
}

CreatureTemplates:addCreatureTemplate(yoda, "yoda")
