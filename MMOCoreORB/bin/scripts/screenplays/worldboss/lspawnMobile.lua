lspawnMobile=function(zoneName, spawnList, respawnTimer, x, z, y, heading, parentID, spawnRange, spawnCount)
	print("lspawn start")	
	local ID = ""	
	local listCount = table.getn(spawnList) --get size of<spawnList> store in<listCount>
	local loops = 0
	repeat
		loops = loops + 1
		local selected = math.random(1,listCount) --using<listcount> get random mobile<selected>
		local spawn = spawnList[selected]
		--(zoneName, mobileTemplate, respawnTimer, x, z, y, heading, parentID, spawnRange)
		print("lspawn -passing rspawn the info")
		print("zoneName", "mobile", "timer", "x", "z", "y", "heading", "parentID", "spawnRange")
		print(zoneName, spawn, 0, x, z, y, heading, parentID, spawnRange)
		ID = rspawnMobile(zoneName, spawn, respawnTimer, x, z, y, heading, parentID, spawnRange)
	until loops == spawnCount --loop until specified<spawnCount> is reached
	print("lspawn -end")
	return ID
end
