-- Leader_Witch_6
-- Author: wldcmzy
-- DateCreated: 2/26/2024 2:26:15 PM
--------------------------------------------------------------

function Origin_Stellaris_Leader_Witch_6_Devour(newPlayerID, oldPlayerID, newCityID, iCityX, iCityY)
	local delta = 0.334

	local pPlayer = Players[newPlayerID]
	local pPlayerConfig = PlayerConfigurations[newPlayerID]
	local CivilizationName =  pPlayerConfig:GetCivilizationTypeName()
	local LeaderName = pPlayerConfig:GetLeaderTypeName()

	if (CivilizationName == 'CIVILIZATION_ORIGINALSTELLARIS' and LeaderName == 'LEADER_STELLARIS_WITCH_6') then  
		local pCity = pPlayer:GetCities():FindID(newCityID)
		local devourNum = pCity:GetPopulation()
		pCity:ChangePopulation(1 - devourNum)
		print('Leader_Witch_6 Devour Population (number, CityID) = (' .. devourNum .. ', ' .. newCityID .. ')')

		local EraCivicMap = {
			[0] = 'CIVIC_STATE_WORKFORCE',
			[1] = 'CIVIC_RECORDED_HISTORY',
			[2] = 'CIVIC_GUILDS',
			[3] = 'CIVIC_MERCANTILISM',
			[4] = 'CIVIC_SCORCHED_EARTH',
			[5] = 'CIVIC_TOTALITARIANISM',
			[6] = 'CIVIC_SPACE_RACE',
			[7] = 'CIVIC_NEAR_FUTURE_GOVERNANCE',
			[8] = 'CIVIC_FUTURE_CIVIC'
		}
		local currentEra = Game.GetEras():GetCurrentEra()
		local civic = GameInfo.Civics[EraCivicMap[currentEra]]
		local cost = civic['Cost']
		local multiplier = GameInfo.GameSpeeds[GameConfiguration.GetGameSpeedType()].CostMultiplier
		cost = (cost * multiplier) / 100
		local gainCulture = cost * devourNum * delta
		pPlayer:GetCulture():ChangeCurrentCulturalProgress(gainCulture)
		print('Leader_Witch_6 Devoured People and Gain Culture (value, CityID) = (' .. gainCulture .. ', ' .. newCityID .. ')')
	end
end


function Origin_Stellaris_Leader_Witch_6_First_City_Built(playerID, cityID, iX, iY)

	local pPlayer = Players[playerID]
	local pPlayerConfig = PlayerConfigurations[playerID]
	local CivilizationName =  pPlayerConfig:GetCivilizationTypeName()
	local LeaderName = pPlayerConfig:GetLeaderTypeName()
	if (CivilizationName == 'CIVILIZATION_ORIGINALSTELLARIS' and LeaderName == 'LEADER_STELLARIS_WITCH_6') then  
		local citiesNum = pPlayer:GetCities():GetCount()
		if (citiesNum == 1) then
			local pCity = pPlayer:GetCities():FindID(cityID)
			pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_CAPITAL_CITY_GRANT_OFFSPRING_NEST')
			print('grant Offspring Nest to Leader_Witch_6\'s city, playerID = ' .. playerID .. 'cityID = ' .. cityID)
			
			if(not pPlayer:IsHuman()) then
				 pPlayer:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_UNIT_MAINTENANCE_DISCOUNT')
				 pPlayer:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_UNIT_MAINTENANCE_DISCOUNT')
				 pPlayer:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_UNIT_MAINTENANCE_DISCOUNT')
				 pPlayer:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_UNIT_MAINTENANCE_DISCOUNT')
				 pPlayer:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_UNIT_MAINTENANCE_DISCOUNT')
				 pPlayer:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_AI_BUFF')
				 pPlayer:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_AI_BUFF2')
				 --pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_AI_BUFF_ARMY3')
				 --pPlayer:GetUnits():Create(GameInfo.Units['UNIT_WARRIOR'].Index, iX, iY)
				 --pPlayer:GetUnits():Create(GameInfo.Units['UNIT_WARRIOR'].Index, iX, iY)
				 pPlayer:GetUnits():Create(GameInfo.Units['UNIT_SCOUT'].Index, iX, iY)
				 pPlayer:GetUnits():Create(GameInfo.Units['UNIT_SCOUT'].Index, iX, iY)
			end
		elseif (not pPlayer:IsHuman()) then
			local pCity = pPlayer:GetCities():FindID(cityID)
			pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_CAPITAL_CITY_GRANT_OFFSPRING_NEST')
			--pPlayer:GetUnits():Create(GameInfo.Units['UNIT_WARRIOR'].Index, iX, iY)
		end
	end
end


GameEvents.CityConquered.Add(Origin_Stellaris_Leader_Witch_6_Devour);
GameEvents.CityBuilt.Add(Origin_Stellaris_Leader_Witch_6_First_City_Built);