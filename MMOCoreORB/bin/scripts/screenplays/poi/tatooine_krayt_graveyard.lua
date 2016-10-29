KraytGraveyardScreenPlay = ScreenPlay:new {
	numberOfActs = 1,

}

registerScreenPlay("KraytGraveyardScreenPlay", true)

function KraytGraveyardScreenPlay:start()
	if (isZoneEnabled("tatooine")) then
		self:spawnMobiles()
	end
end

function KraytGraveyardScreenPlay:spawnMobiles()
	spawnMobile("tatooine", "canyon_krayt_dragon", 300, 7227.5, 33.2, 4495.8, -116, 0)
	spawnMobile("tatooine", "juvenile_canyon_krayt_dragon", 300, 7233.2, 30.1, 4487.1, -116, 0)
	spawnMobile("tatooine", "canyon_krayt_dragon", 300, 7178, 24.5, 4429.9, -100, 0)
	spawnMobile("tatooine", "juvenile_canyon_krayt_dragon", 300, 7172.0, 22.5, 4441.0, -100, 0)
	spawnMobile("tatooine", "canyon_krayt_dragon", 300, 7035.7, 22.8, 4337.2, -55, 0)
	spawnMobile("tatooine", "juvenile_canyon_krayt_dragon", 300, 7043.2, 22.2, 4344.3, -55, 0)
	spawnMobile("tatooine", "canyon_krayt_dragon", 300, 6872.9, 41.7, 4246.9, -99, 0)
	spawnMobile("tatooine", "juvenile_canyon_krayt_dragon", 300, 6877.9, 45.5, 4237.0, -99, 0)
	spawnMobile("tatooine", "canyon_krayt_dragon", 300, 6564.1, 87.7, 4484.8, 133, 0)
	spawnMobile("tatooine", "juvenile_canyon_krayt_dragon", 300, 6575.9, 92.5, 4487.7, 133, 0)
	spawnMobile("tatooine", "canyon_krayt_dragon", 300, 7523.5, 4.5, 4655.5, -163, 0)
	spawnMobile("tatooine", "juvenile_canyon_krayt_dragon", 300, 7513.0, 4.1, 4656.1, -163, 0)

	spawnMobile("tatooine", "giant_canyon_krayt_dragon", 300, 7515.6, 8.7, 4556.5, -35, 0)
	spawnMobile("tatooine", "giant_canyon_krayt_dragon", 300, 7417.3, 7.7, 4597.9, -128, 0)
	spawnMobile("tatooine", "giant_canyon_krayt_dragon", 300, 7300.1, 23.3, 4461.9, -156,0)
	spawnMobile("tatooine", "giant_canyon_krayt_dragon", 300, 7140.4, 57, 4322.5, -86, 0)

	spawnMobile("tatooine", "krayt_dragon_grand", 300, 7555.4, 15.1, 4488.8, -90, 0)
	spawnMobile("tatooine", "krayt_king", 300, 7429.9, 7.1, 4477.3, 0, 0)

	spawnMobile("tatooine", "krayt_dragon_ancient", 300, 6836.7, 25.4, 4321.8, -150, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient", 300, 7491.3, 8.4, 4484.8, -150, 0)

	spawnMobile("tatooine", "krayt_dragon_adolescent", 300, 7525.1, 28.3, 4387.5, -74, 0)
	spawnMobile("tatooine", "krayt_dragon_adolescent", 300, 7269.8, 62.4, 4352.7, -77,0)
	spawnMobile("tatooine", "krayt_dragon_adolescent", 300, 7077.4, 20.0, 4447.3, -123, 0)
	spawnMobile("tatooine", "krayt_dragon_adolescent", 300, 7003.0, 86.3, 4200.4, 10, 0)
	spawnMobile("tatooine", "krayt_dragon_adolescent", 300, 6726.8, 19.5, 4288.6, -91, 0)

	spawnMobile("tatooine", "krayt_dragon_ancient", 300, 4978.2, 29.2097, 4251.56, -91, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient", 300, 6138.01, 48.9556, 4146.06, -91, 0)
	
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, -4709, 35.4978, -4420.17, -91, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, -4597.69, 40.2448, -4451.34, -91, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, -4738.21, 51.6275, -4316.59, -91, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, -4738.21, 51.6275, -4316.59, -91, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, -4819.88, 49.3037, -4360.02, -91, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, -4819.88, 49.3037, -4360.02, -91, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, -4637.9, 42.0042, -4324.44, -91, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, -4637.64, 41.535, -4322.89, -91, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, -4681.08, 49.0909, -4352.04, -91, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, -4619.27, 32.7882, -4274.45, -91, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, -4760.66, 26.6838, -4513.16, -91, 0)
   	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300,math.random(300) + -4619.27, 32.7882,math.random(300) + -4274.45, math.random(360), 0)
end
