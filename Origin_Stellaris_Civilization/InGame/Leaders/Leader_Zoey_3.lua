-- Leader_Zoey_3
-- Author: wldcmzy
-- DateCreated: 2/25/2024 2:38:56 PM
--------------------------------------------------------------


function Origin_Stellaris_Leader_Zoey_3_First_City_Built(playerID, cityID, iX, iY)

	local add_population_num = 1
	local add_money = 50

	local pPlayer = Players[playerID]
	local pPlayerConfig = PlayerConfigurations[playerID]
	local CivilizationName =  pPlayerConfig:GetCivilizationTypeName()
	local LeaderName = pPlayerConfig:GetLeaderTypeName()

	if (CivilizationName == 'CIVILIZATION_ORIGINALSTELLARIS' and LeaderName == 'LEADER_STELLARIS_ZOEY_3') then  
		local citiesNum = pPlayer:GetCities():GetCount()
		if (citiesNum == 1) then
			pPlayer:GetUnits():Create(GameInfo.Units['UNIT_BUILDER'].Index, iX, iY)
			pPlayer:GetUnits():Create(GameInfo.Units['UNIT_SCOUT'].Index, iX, iY)
			--pPlayer:GetUnits():Create(GameInfo.Units['UNIT_TRADER'].Index, iX, iY)
			print('grant Builder and Scout to Leader_Zoey_3, playerID = ' .. playerID)
			
			local pCity = pPlayer:GetCities():FindID(cityID)
			pCity:ChangePopulation(add_population_num)
			print('add population to Leader_Zoey_3\'s city, playerID = ' .. playerID .. 'cityID = ' .. cityID)

			pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_ZOEY_3_CAPITAL_CITY_GRANT_MONUMENT')
			pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_ZOEY_3_CAPITAL_CITY_GRANT_WALLS')
			print('grant Monument and Ancient Wall to Leader_Zoey_3\'s city, playerID = ' .. playerID .. 'cityID = ' .. cityID)
			
			local multiplier = GameInfo.GameSpeeds[GameConfiguration.GetGameSpeedType()].CostMultiplier
			add_money = (add_money * multiplier) / 100
			pPlayer:GetTreasury():ChangeGoldBalance(add_money)
			print('give Leader_Zoey_3 money, playerID = ' .. playerID .. 'value = ' .. add_money)

			if (not pPlayer:IsHuman()) then
				pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_ZOEY_3_AI_BUFF')
			end

		elseif (not pPlayer:IsHuman()) then
			local pCity = pPlayer:GetCities():FindID(cityID)
			pPlayer:GetUnits():Create(GameInfo.Units['UNIT_BUILDER'].Index, iX, iY)
			pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_ZOEY_3_CAPITAL_CITY_GRANT_MONUMENT')
		end
	end
end

GameEvents.CityBuilt.Add(Origin_Stellaris_Leader_Zoey_3_First_City_Built);