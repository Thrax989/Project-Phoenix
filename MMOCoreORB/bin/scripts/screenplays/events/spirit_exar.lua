spirit_exarScreenplay = ScreenPlay:new {
	numberOfActs = 1,

	spawnPoints = {
		{x= 1,y= 1,radius= 4000 },
		{x= -2500,y= 2500,radius= 2000},
		{x= 2500,y= 2500,radius= 2000},
		{x= 2500,y= -2500,radius= 2000},
		{x= -2500,y= -2500,radius= 2000},
		{x= 10,y= -3000,radius= 1500},
		{x= 10,y= 3000,radius= 1500}
	}
}
registerScreenPlay("spirit_exarScreenplay", true)

function spirit_exarScreenplay:start()
	if (isZoneEnabled("yavin4")) then
		self:spawnMobiles(self.spawnPoints)
	end
end

function spirit_exarScreenplay:spawnMobiles(spawnList)
	for k,v in ipairs(spawnList) do 
		local pBoss = spawnMobile("yavin4", "spirit_exar", -1, math.random(v.radius) + v.x, 0, math.random(v.radius) + v.y, math.random(360), 0)
		local creature = CreatureObject(pBoss)
		creature:setScreenPlayState(k, "spirit_exarScreenplay")
		createObserver(OBJECTDESTRUCTION, "spirit_exarScreenplay", "bossDead", pBoss)
	end
end

function spirit_exarScreenplay:bossDead(pBoss)
	print("Exar Killed")
	local creature = CreatureObject(pBoss)
	local listNum = creature:getScreenPlayState("spirit_exarScreenplay")
	local v = self.spawnPoints[listNum]
	
	createEvent(120*1000,"spirit_exarScreenplay","KillBoss",pBoss)

	local pBoss = spawnMobile("yavin4", "spirit_exar", -1, math.random(v.radius) + v.x, 0, math.random(v.radius) + v.y, math.random(360), 0)
	local creature = CreatureObject(pBoss)

	creature:setScreenPlayState(listNum, "spirit_exarScreenplay")
	createObserver(OBJECTDESTRUCTION, "spirit_exarScreenplay", "bossDead", pBoss)

	return 0
end


function spirit_exarScreenplay:KillBoss(pBoss)
	dropObserver(pBoss, OBJECTDESTRUCTION)
	if SceneObject(pBoss) then
		print("Unlooted Exar Destroyed")
		SceneObject(pBoss):destroyObjectFromWorld()
		SceneObject(pBoss):destroyObjectFromDatabase()
	end
	return 0
end