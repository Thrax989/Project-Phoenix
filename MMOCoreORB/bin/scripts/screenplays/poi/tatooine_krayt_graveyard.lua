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
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 7226.6, 33, 4495.6, -116, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 7231.8, 30.1, 4487.3, -116, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 7177.7, 24.5, 4430.0, -100, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 7169.5, 22.0, 4445.0, -100, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 7035.5, 22.8, 4337.3, -55, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 7045.3, 19.9, 4350.9, -55, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 6872.4, 41.9, 4246.0, -99, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 6876.6, 47.6, 4231.6, -99, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 6563.3, 87.7, 4485.7, 133, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 6588.5, 98.6, 4488.2, 133, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 7523.5, 4.4, 4654.6, -163, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 7507.0, 4.74, 4655.3, -163, 0)

	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 7515.1, 8.7, 4557.4, -35, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 7417.5, 7.7, 4598.6, -128, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 7300.2, 23.5, 4460.6, -156,0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 7141.0, 56.9, 4322.8, -86, 0)

	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 7555.6, 15.1, 4487.6, -90, 0)
	spawnMobile("tatooine", "krayt_king", 300, 7429.9, 7.1, 4477.3, 0, 0)

	spawnMobile("tatooine", "krayt_dragon_ancient", 300, 6836.7, 25.4, 4321.8, -150, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 7491.1, 8.5, 4481.3, -150, 0)

	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 7525.1, 28.4, 4387.0, -74, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 7269.9, 62.5, 4351.4, -77,0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 7078.4, 19.7, 4447.1, -123, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 7003.3, 86.6, 4199.7, 10, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, 6723.1, 19.7, 4287.5, -91, 0)

	spawnMobile("tatooine", "krayt_dragon_ancient", 300, 4978.2, 29.2097, 4251.56, -91, 0)
	spawnMobile("tatooine", "krayt_dragon_ancient", 300, 6138.01, 48.9556, 4146.06, -91, 0)
	
	spawnMobile("tatooine", "krayt_dragon_ancient_elder", 300, -4661.97, 44.1355, -4411.18, -91, 0)
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
end
