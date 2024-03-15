-- Leader_Ellis
-- Author: wldcmzy
-- DateCreated: 2/29/2024 8:40:11 PM
--------------------------------------------------------------

function Leader_Stellaris_Ellis_Loyalty_Changing()
	local citiesNumLimit = 4
	local AI_population_add_Turns = 18

	local AlivePlayerList = PlayerManager.GetAlive()

	for each in pairs(AlivePlayerList) do
		local iplayer = each - 1
		local pPlayerConfig = PlayerConfigurations[iplayer]
		local CivilizationName =  pPlayerConfig:GetCivilizationTypeName()
		local LeaderName = pPlayerConfig:GetLeaderTypeName()

		if (CivilizationName == 'CIVILIZATION_ORIGINALSTELLARIS' and LeaderName == 'LEADER_STELLARIS_ELLIS_5') then
			local pPlayer = Players[iplayer]
			local pPlayerCities = pPlayer:GetCities()
			local citiesNum =  pPlayerCities:GetCount()
			
			if(not pPlayer:IsHuman()) then
				pPlayer:GetUnits():SetBuildDisabled(GameInfo.Units["UNIT_SETTLER"].Index, citiesNum >= citiesNumLimit)
				print('AI playerID = '.. iplayer ..' SetBuildDisabled = ' .. ((citiesNum >= citiesNumLimit) and "true" or "false"))
				for i, pCity in pPlayerCities:Members() do
					if (i > citiesNumLimit) then
						pPlayer:GetCities():Destroy(pCity)
						print('Distroied City, CityIndex = '.. i ..' cityID = ' .. pCity:GetID() .. ' cityName = ' .. pCity:GetName())
						break
					end
				end
			end

			citiesNum =  pPlayerCities:GetCount()
			-- 如果占领原始首都无法摧毁，AI会buff吃到寄？ 所以不让AI吃这个效果了。
			if ((citiesNum > citiesNumLimit) and (not pPlayer:IsHuman())) then
				print('Player' .. iplayer .. ', LEADER_STELLARIS_ELLIS_5,  has ' .. citiesNum .. ' cities > citiesNumLimit ' .. citiesNumLimit)
				local delta = citiesNum - citiesNumLimit;
				local curTurn = Game.GetCurrentGameTurn();
				local value = delta;
				local money = 200 * delta
				local loyal = 33 * delta

				print('sub popu: ' .. value .. 'sub loyal: ' .. loyal)
				for i, pCity in pPlayerCities:Members() do
					pCity:ChangePopulation(- value)
					pCity:ChangeLoyalty(- loyal)
				end

				print('sub money: ' .. money)
				pPlayer:GetTreasury():ChangeGoldBalance(- money)
			end
		end
	end
end

Events.TurnEnd.Add(Leader_Stellaris_Ellis_Loyalty_Changing);



--[[
function Origin_Stellaris_Leader_Ellis_5_City_Built(playerID, cityID, iX, iY)
	local citiesNumLimit = 4


	local pPlayer = Players[playerID]
	local pPlayerConfig = PlayerConfigurations[playerID]
	local CivilizationName =  pPlayerConfig:GetCivilizationTypeName()
	local LeaderName = pPlayerConfig:GetLeaderTypeName()
	if (not pPlayer:IsHuman()) then
		if (CivilizationName == 'CIVILIZATION_ORIGINALSTELLARIS' and LeaderName == 'LEADER_STELLARIS_ELLIS_5') then
			print('Leader_Ellis_5 is not Human, playerID = ' .. playerID)
			local citiesNum = pPlayer:GetCities():GetCount()
			if (citiesNum > citiesNumLimit) then
				local pCity = pPlayer:GetCities():FindID(cityID)
				pPlayer:GetCities():Destroy(pCity)
				--CityManager.DestroyCity(pcity)
				print('Leader_Ellis_5 is not Human, playerID = ' .. playerID)
				print('Destroy Leader_Ellis_5\'s city, playerID = ' .. playerID .. 'cityID = ' .. cityID)
			
			end
		end
	end
end
GameEvents.CityBuilt.Add(Origin_Stellaris_Leader_Ellis_5_City_Built);
]]
