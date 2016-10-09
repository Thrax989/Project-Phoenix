BlueleafTempleScreenPlay = ScreenPlay:new {
	numberOfActs = 1,
	
	screenplayName = "BlueleafTempleScreenPlay",

	lootContainers = {
		9145383,
		9145384,
		9765486,		
		9765485
	},
	
	lootLevel = 26,	

	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 3100000},
				{group = "junk", chance = 3500000},
				{group = "heavy_weapons_consumable", chance = 600000},
				{group = "rifles", chance = 600000},
				{group = "carbines", chance = 600000},
				{group = "pistols", chance = 600000},
				{group = "clothing_attachments", chance = 500000},
				{group = "armor_attachments", chance = 500000}
			},
			lootChance = 8000000
		}					
	},
	
	lootContainerRespawn = 1800 -- 30 minutes
}

registerScreenPlay("BlueleafTempleScreenPlay", true)

function BlueleafTempleScreenPlay:start()
	if (isZoneEnabled("yavin4")) then
		self:spawnMobiles()
		self:initializeLootContainers()
	end
end

function BlueleafTempleScreenPlay:spawnMobiles()
	-- Outside Temple	
	spawnMobile("yavin4", "elliot",180,-895.6,84.8,-2059,-139,0)
	
	-- Inside Temple
	spawnMobile("yavin4", "Mihpisto",180,-9,-37.3,-9,48,468319)
	spawnMobile("yavin4", "marvolo",180,-0.6,-37.3,-28.3,-19,468319)
	spawnMobile("yavin4", "mittens",180,-24,-1.3,10.3,93,468319)
	spawnMobile("yavin4", "Zamidirin",180,12.4,-1.3,32.4,-93,468318)
end
