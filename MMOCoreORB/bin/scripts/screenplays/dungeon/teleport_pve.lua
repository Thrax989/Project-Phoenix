--[[NEUTRAL CORVETTE
Spawning scene objects which will include active areas, elevators
spawning mobiles to include droids, and possibly more
will work on getting a simple quest involed
also going to put a timer on the duration of which one will be in the vet

basic waypoint -20, 0, 0, 4336197]]

teleport_pveScreenPlay = ScreenPlay:new {
	numberOfActs = 1,

}

registerScreenPlay("teleport_pveScreenPlay", true)

function teleport_pveScreenPlay:start()
	if (isZoneEnabled("tatooine")) then
		self:spawnMobiles()
		self:spawnSceneObjects() 
	end
end

--TODO: use a pointer on a mobile.

function teleport_pveScreenPlay:spawnSceneObjects()

end

function teleport_pveScreenPlay:spawnMobiles()

	local pCollector1 = spawnMobile("tatooine", "droidekaport", 120, 3483.1, 5.0, -4838, 119, 0)
	local collector1 = LuaCreatureObject(pCollector1)
	collector1:setOptionsBitmask(264)
	collector1:setCustomObjectName("\\#FF0000Travel To Test")
	createObserver(OBJECTRADIALUSED, "teleport_pveScreenPlay", "teleportCor", pCollector1)
	if (pCollecter1~= nil) then 
		return
	end
end
function teleport_pveScreenPlay:teleportCor(pCollector, pPlayer)--current
	local player = LuaSceneObject(pPlayer)
	player:switchZone("tatooine", 3526, 5, -4803, 0)
	return 0
end
