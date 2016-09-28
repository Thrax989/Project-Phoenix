enraged_bull_rancor = Creature:new {
	objectName = "@mob/creature_names:enraged_bull_rancor",
	socialGroup = "rancor",
	faction = "",
	level = 85,
	chanceHit = 2.85,
	damageMin = 770,
	damageMax = 1050,
	baseXp = 10500,
	baseHAM = 15000,
	baseHAMmax = 18000,
	armor = 1,
	resists = {180,180,180,180,180,180,180,180,130},
	meatType = "meat_carnivore",
	meatAmount = 880,
	hideType = "hide_leathery",
	hideAmount = 750,
	boneType = "bone_mammal",
	boneAmount = 670,
	milk = 0,
	tamingChance = 0.25,
	ferocity = 15,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/bull_rancor.iff"},
	scale = 1.2,
	lootGroups = {
		{
			groups = {
				{group = "rancor_common", chance = 4000000},
				{group = "armor_all", chance = 2000000},
				{group = "weapons_all", chance = 2500000},
				{group = "wearables_all", chance = 1500000}
			},
			lootChance = 10000000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"knockdownattack",""},
		{"creatureareaknockdown",""}
	}
}

CreatureTemplates:addCreatureTemplate(enraged_bull_rancor, "enraged_bull_rancor")
