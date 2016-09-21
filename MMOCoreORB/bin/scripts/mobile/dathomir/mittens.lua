  	mittens = Creature:new {
	objectName = "@mob/creature_names:",
	customName = "mittens",
	socialGroup = "vir_vur",
	faction = "",
	level = 100,
	chanceHit = 55,
	damageMin = 2525,
	damageMax = 3815,
	baseXp = 385000,
	baseHAM = 275000,
	baseHAMmax = 285000,
	armor = 3,
	resists = {95,95,95,95,95,95,95,95,95},
	meatType = "meat_avian",
	meatAmount = 5000,
	hideType = "hide_wooly",
	hideAmount = 5000,
	boneType = "bone_mammal",
	boneAmount = 5000,
	milkType = "milk_domesticated",
	milk = 2500,
	tamingChance = 0,
	ferocity = 10,
	pvpBitmask = ATTACKABLE + ENEMY,
	creatureBitmask = PACK + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/vir_vur.iff"},
	scale = 1.75;
	lootGroups = {
		{
			groups = {
				{group = "armor_all", chance = 5000000},
				{group = "weapons_all", chance = 5000000}
			},
			lootChance = 10000000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
 		{"creatureareacombo","stateAccuracyBonus=50"},
 		{"creatureareaknockdown","stateAccuracyBonus=50"},
		{"creatureareaknockdown","KnockdownChance=50"},
		{"dizzyattack","DizzyChance=50"},
		{"intimidationattack","IntimidationChance=50"},
		{"creatureareapoison","PoisonChance=50"},
		{"strongpoison","PoisonChance=50"},
		{"strongDisease","DiseaseChance=50"}
 	}
}

CreatureTemplates:addCreatureTemplate(mittens, "mittens")
