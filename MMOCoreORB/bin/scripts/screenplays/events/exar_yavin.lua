exar_yavinScreenplay = ScreenPlay:new {
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
registerScreenPlay("exar_yavinScreenplay", true)

function exar_yavinScreenplay:start()
	if (isZoneEnabled("yavin4")) then
		self:spawnMobiles(self.spawnPoints)
	end
end

function exar_yavinScreenplay:spawnMobiles(spawnList)
	for k,v in ipairs(spawnList)
		local pBoss = spawnMobile("yavin4", "spirit_exar", -1, math.random(v.radius) + v.x, 0, math.random(v.radius) + v.y, math.random(360), 0)
		local creature = CreatureObject(pBoss)
		creature:setScreenPlayState(k, "exar_yavinScreenplay")
		createObserver(OBJECTDESTRUCTION, "exar_yavinScreenplay", "bossDead", pBoss)
	end
end

function exar_yavinScreenplay:bossDead(pBoss)
	print("Exar Killed")
	local creature = CreatureObject(pBoss)
	local listNum = creature:getScreenPlayState("exar_yavinScreenplay")
	local v = self.spawnPoints[listNum]
	
	createEvent(120*1000,"exar_yavinScreenplay","KillBoss",pBoss)

	local pBoss = spawnMobile("yavin4", "spirit_exar", -1, math.random(v.radius) + v.x, 0, math.random(v.radius) + v.y, math.random(360), 0)
	local creature = CreatureObject(pBoss)

	creature:setScreenPlayState(listNum, "exar_yavinScreenplay")
	createObserver(OBJECTDESTRUCTION, "exar_yavinScreenplay", "bossDead", pBoss)

	return 0
end


function exar_yavinScreenplay:KillBoss(pBoss)
	dropObserver(pBoss, OBJECTDESTRUCTION)
	if SceneObject(pBoss) then
		print("Unlooted Exar Destroyed")
		SceneObject(pBoss):destroyObjectFromWorld()
		SceneObject(pBoss):destroyObjectFromDatabase()
	end
	return 0
end
