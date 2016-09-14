krayt_be = Creature:new {
	customName = "Krayt Dragon",
	socialGroup = "Krayt",
	faction = "",
	level = 85,
	chanceHit = 0.5,
	damageMin = 2200,
	damageMax = 2600,
	baseXp = 40000,
	baseHAM = 450000,
	baseHAMmax = 550000,
	armor = 0,
	resists = {90,90,90,90,90,90,90,90,25},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + HERD,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/krayt_dragon.iff"},
	lootGroups = {},
	weapons = {"creature_spit_small_red"},
	conversationTemplate = "",
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(krayt_be, "krayt_be")