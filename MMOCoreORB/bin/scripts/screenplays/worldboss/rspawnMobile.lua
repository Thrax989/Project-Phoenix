rspawnMobile = function(zone, mobile, respawn, x, z, y, heading, parentID, spawnRange)
	print("rspawnMobile started:")
	print("spawnRange is :",spawnRange)
	print(zone, mobile, respawn, x, z, y, heading, parentID, spawnRange)
	local doubleRange = spawnRange * 2 --get 2x givenNumber for range to be used
	local rolledX = getRandomNumber(1,doubleRange) --using range get random number
	local rolledY = getRandomNumber(1,doubleRange) --using range get random number
	local changeX = spawnRange - rolledX --subract rolled from given-number<spawnRange> to get change in x
	local changeY = spawnRange - rolledY --subract rolled from given-number<spawnRange> to get change in y

	--assigns the adjusted spawn locations and prints it to console
	local newx = x + changeX
	local newy = y + changeY
	
	print("\n Spawning @:")
	print(zone, mobile, respawn, newx, z, newy, heading, parentID)
	--spawn object and store its object id in variable<ID>
	local ID = spawnMobile(zone, mobile, respawn, newx, z, newy, heading, parentID)
	print("rspawnMobile ended")
	return ID --return the spawned Mobile object ID.
end