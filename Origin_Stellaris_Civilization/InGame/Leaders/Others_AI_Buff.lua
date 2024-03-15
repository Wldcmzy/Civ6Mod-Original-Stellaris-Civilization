-- AI_BUFF_Ellis_Zoey_Grey 
-- Author: wldcmzy
-- DateCreated: 3/6/2024 9:14:16 AM
--------------------------------------------------------------

function Origin_Stellaris_Leaders_AI_Buff_Ellis_5(pPlayer, cityID)
	local citiesNum = pPlayer:GetCities():GetCount()
	local pCity = pPlayer:GetCities():FindID(cityID)
	if (citiesNum == 1) then
		pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_ELLIS_5_AI_BUFF')
	end
	pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_ZOEY_3_CAPITAL_CITY_GRANT_WALLS')
end

function Origin_Stellaris_Leaders_AI_Buff_Grey(pPlayer, cityID)
	local citiesNum = pPlayer:GetCities():GetCount()
	local pCity = pPlayer:GetCities():FindID(cityID)
	if (citiesNum == 1) then
		pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_GREY_AI_BUFF')
		pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_GREY_AI_BUFF2')
	end
end

function Origin_Stellaris_Leaders_AI_Buff_Others(playerID, cityID, iX, iY)

	local pPlayer = Players[playerID]
	local pPlayerConfig = PlayerConfigurations[playerID]
	local CivilizationName =  pPlayerConfig:GetCivilizationTypeName()
	if  (CivilizationName == 'CIVILIZATION_ORIGINALSTELLARIS' and (not pPlayer:IsHuman())) then 
		local LeaderName = pPlayerConfig:GetLeaderTypeName()
		if (LeaderName == 'LEADER_STELLARIS_ELLIS_5') then
			Origin_Stellaris_Leaders_AI_Buff_Ellis_5(pPlayer, cityID)
		elseif (LeaderName == 'LEADER_STELLARIS_GREY') then
			Origin_Stellaris_Leaders_AI_Buff_Grey(pPlayer, cityID)
		end
	end
end

GameEvents.CityBuilt.Add(Origin_Stellaris_Leaders_AI_Buff_Others);



function Origin_Stellaris_Leaders_AI_Buff_Witch_6_Buildings_Army(playerID, cityID, buildingID, plotID, bOriginalConstruction)
	--local amount = 1
	--local wonderAmount = 3

	local pPlayer = Players[playerID]
	local pPlayerConfig = PlayerConfigurations[playerID]
	local CivilizationName =  pPlayerConfig:GetCivilizationTypeName()
	local LeaderName = pPlayerConfig:GetLeaderTypeName()
	if (CivilizationName == 'CIVILIZATION_ORIGINALSTELLARIS' and LeaderName == 'LEADER_STELLARIS_WITCH_6' and (not pPlayer:IsHuman())) then 
		local pBuilding = GameInfo.Buildings[buildingID]
		if (not (pBuilding['BuildingType'] == 'BUILDING_OFFSPRING_NEST')) then
			local pCity = pPlayer:GetCities():FindID(cityID)
			local isWonder = pBuilding['IsWonder']
			local prereq = pBuilding['PrereqDistrict']
			local hasTechWheel = pPlayer:GetTechs():HasTech(GameInfo.Technologies['TECH_THE_WHEEL'].Index)
			local hasTechEngineering = pPlayer:GetTechs():HasTech(GameInfo.Technologies['TECH_ENGINEERING'].Index)
			local currentEra = Game.GetEras():GetCurrentEra()
			if (isWonder) then
				if (hasTechEngineering) then
					pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_AI_BUFF_ARMY2')
					pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_AI_BUFF_ARMY')
					pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_AI_BUFF_ARMY')
				elseif (hasTechWheel) then
					pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_AI_BUFF_ARMY4')
					pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_AI_BUFF_ARMY3')
					pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_AI_BUFF_ARMY')
				else
					pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_AI_BUFF_ARMY4')
					pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_AI_BUFF_ARMY3')
				end
				if (currentEra > 0) then
					pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_AI_BUFF_ARMY4')
				end
				if (currentEra > 1) then
					pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_AI_BUFF_ARMY3')
				end
			elseif (prereq == 'DISTRICT_CITY_CENTER') then
				if (hasTechWheel) then
					pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_AI_BUFF_ARMY')
				else
					pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_AI_BUFF_ARMY3')
				end
				if (currentEra > 0) then
					pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_AI_BUFF_ARMY2')
				end
			end
		else
			local pCity = pPlayer:GetCities():FindID(cityID)
			pCity:AttachModifierByID('MODIFIER_TRAIT_LEADER_STELLARIS_WITCH_6_AI_BUFF_ARMY5')
		end
	end
end

GameEvents.BuildingConstructed.Add(Origin_Stellaris_Leaders_AI_Buff_Witch_6_Buildings_Army)