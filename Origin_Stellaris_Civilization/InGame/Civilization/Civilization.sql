-- Civilizaton
-- Author: wldcmzy
-- DateCreated: 2/24/2024 11:20:59 PM
--------------------------------------------------------------
INSERT INTO Types	
(Type,									Kind)
VALUES
('CIVILIZATION_ORIGINALSTELLARIS',		'KIND_CIVILIZATION'),
('TRAIT_CIVILIZATION_ORIGINALSTELLARIS',	'KIND_TRAIT'),
('PROJECT_ONE_VOICE_RULES',				'KIND_PROJECT'),
('PROJECT_LOSSUS_PROJECT',				'KIND_PROJECT'),
('PROJECT_BECOME_THE_CRISIS',			'KIND_PROJECT'),
('ABILITY_THE_CRISIS_STRENGTH',			'KIND_ABILITY');

INSERT INTO TypeTags
(Type,									Tag)
VALUES 
('ABILITY_THE_CRISIS_STRENGTH',			'CLASS_ALL_COMBAT_UNITS');

INSERT INTO Traits
(TraitType,									Name,												Description)
VALUES
('TRAIT_CIVILIZATION_ORIGINALSTELLARIS',		'LOC_TRAIT_CIVILIZATION_ORIGINALSTELLARIS_NAME',		'LOC_TRAIT_CIVILIZATION_ORIGINALSTELLARIS_DESCRIPTION');


INSERT INTO Civilizations	
(CivilizationType,					Name,										Description,										Adjective,											StartingCivilizationLevelType,		RandomCityNameDepth,	Ethnicity)
VALUES
('CIVILIZATION_ORIGINALSTELLARIS',	'LOC_CIVILIZATION_ORIGINALSTELLARIS_NAME',	'LOC_CIVILIZATION_ORIGINALSTELLARIS_DESCRIPTION',	'LOC_CIVILIZATION_ORIGINALSTELLARIS_ADJECTIVE',		'CIVILIZATION_LEVEL_FULL_CIV',		150,					'ETHNICITY_MEDIT');


INSERT INTO CivilizationLeaders
(LeaderType, 					CivilizationType,					CapitalName)
VALUES 
('LEADER_STELLARIS_ZOEY_3',		'CIVILIZATION_ORIGINALSTELLARIS',	'LOC_CITY_SOL'),
('LEADER_STELLARIS_ELLIS_5',	'CIVILIZATION_ORIGINALSTELLARIS',	'LOC_CITY_CPU'),
('LEADER_STELLARIS_WITCH_6',	'CIVILIZATION_ORIGINALSTELLARIS',	'LOC_CITY_BETA_HYDRI'),
('LEADER_STELLARIS_GREY',		'CIVILIZATION_ORIGINALSTELLARIS',	'LOC_CITY_L');


INSERT INTO CivilizationTraits
(CivilizationType,						TraitType)
VALUES
('CIVILIZATION_ORIGINALSTELLARIS',		'TRAIT_CIVILIZATION_ORIGINALSTELLARIS');

--INSERT INTO Projects
--(ProjectType,					Name,									ShortName,										Description,									Cost,		CostProgressionModel,		CostProgressionParam1,	PrereqTech,				PrereqCivic,		MaxPlayerInstances,		WMD,	UnlocksFromEffect) 
--VALUES
--('PROJECT_BECOME_THE_CRISIS',	'LOC_PROJECT_BECOME_THE_CRISIS_NAME',	'LOC_PROJECT_BECOME_THE_CRISIS_SHORT_NAME',		'LOC_PROJECT_BECOME_THE_CRISIS_DESCRIPTION',	'1500',		'NO_PROGRESSION_MODEL',		'0',					'TECH_NUCLEAR_FUSION',	NULL,				'1',					'1',	'1');
--('PROJECT_LOSSUS_PROJECT',		'LOC_PROJECT_LOSSUS_PROJECT_NAME',		'LOC_PROJECT_LOSSUS_PROJECT_SHORT_NAME',		'LOC_PROJECT_LOSSUS_PROJECT_DESCRIPTION',		'900',		'NO_PROGRESSION_MODEL',		'0',					'TECH_COMBINED_ARMS',	NULL,				'1',					'1',	'1'),
--('PROJECT_ONE_VOICE_RULES',		'LOC_PROJECT_ONE_VOICE_RULES_NAME',		'LOC_PROJECT_ONE_VOICE_RULES_SHORT_NAME',		'LOC_PROJECT_ONE_VOICE_RULES_DESCRIPTION',		'900',		'NO_PROGRESSION_MODEL',		'0',					NULL,					'CIVIC_COLD_WAR',	'1',					'1',	'1');

INSERT INTO Projects
(ProjectType,					Name,									ShortName,										Description,									Cost,		CostProgressionModel,		CostProgressionParam1,	MaxPlayerInstances,		WMD,	UnlocksFromEffect) 
VALUES
('PROJECT_BECOME_THE_CRISIS',	'LOC_PROJECT_BECOME_THE_CRISIS_NAME',	'LOC_PROJECT_BECOME_THE_CRISIS_SHORT_NAME',		'LOC_PROJECT_BECOME_THE_CRISIS_DESCRIPTION',	'1500',		'NO_PROGRESSION_MODEL',		'0',					'1',					'1',	'1'),
('PROJECT_LOSSUS_PROJECT',		'LOC_PROJECT_LOSSUS_PROJECT_NAME',		'LOC_PROJECT_LOSSUS_PROJECT_SHORT_NAME',		'LOC_PROJECT_LOSSUS_PROJECT_DESCRIPTION',		'900',		'NO_PROGRESSION_MODEL',		'0',					'1',					'1',	'1'),
('PROJECT_ONE_VOICE_RULES',		'LOC_PROJECT_ONE_VOICE_RULES_NAME',		'LOC_PROJECT_ONE_VOICE_RULES_SHORT_NAME',		'LOC_PROJECT_ONE_VOICE_RULES_DESCRIPTION',		'900',		'NO_PROGRESSION_MODEL',		'0',					'1',					'1',	'1');


INSERT INTO UnitAbilities
(UnitAbilityType,					Name,										Description,										Inactive)
VALUES
('ABILITY_THE_CRISIS_STRENGTH',		'LOC_ABILITY_THE_CRISIS_STRENGTH_NAME',		'LOC_ABILITY_THE_CRISIS_STRENGTH_DESCRIPTION',		'1');


INSERT INTO UnitAbilityModifiers 
(UnitAbilityType,					ModifierId) 
VALUES 
('ABILITY_THE_CRISIS_STRENGTH',		'MODIFIER_ABILITY_THE_CRISIS_STRENGTH');


INSERT INTO TraitModifiers 
(TraitType,									ModifierId) 
VALUES 
('TRAIT_CIVILIZATION_ORIGINALSTELLARIS',		'MODIFIER_TRAIT_CIVILIZATION_ORIGINALSTELLARIS_PROJECT_BECOME_THE_CRISIS'),
('TRAIT_LEADER_MAJOR_CIV',					'MODIFIER_TRAIT_CIVILIZATION_ORIGINALSTELLARIS_LEADER_MAJOR_CIV_HEAT_THE_CRISIS'),
('TRAIT_CIVILIZATION_ORIGINALSTELLARIS',		'MODIFIER_TRAIT_CIVILIZATION_ORIGINALSTELLARIS_PROJECT_LOSSUS_PROJECT'),
('TRAIT_CIVILIZATION_ORIGINALSTELLARIS',		'MODIFIER_TRAIT_CIVILIZATION_ORIGINALSTELLARIS_PROJECT_ONE_VOICE_RULES');


INSERT INTO ProjectCompletionModifiers 
(ProjectType,						ModifierId) 
VALUES
('PROJECT_BECOME_THE_CRISIS',		'MODIFIER_PROJECT_BECOME_THE_CRISIS_URANIUM'),
('PROJECT_BECOME_THE_CRISIS',		'MODIFIER_PROJECT_BECOME_THE_CRISIS_YIELD_GOLD'),
('PROJECT_BECOME_THE_CRISIS',		'MODIFIER_PROJECT_BECOME_THE_CRISIS_YIELD_PRODUCTION'),
('PROJECT_BECOME_THE_CRISIS',		'MODIFIER_PROJECT_BECOME_THE_CRISIS_GRANT_ABILITY_STRENGTH'),
('PROJECT_LOSSUS_PROJECT',			'MODIFIER_PROJECT_LOSSUS_PROJECT_URANIUM'),
('PROJECT_LOSSUS_PROJECT',			'MODIFIER_PROJECT_LOSSUS_PROJECT_GUNDUM'),
('PROJECT_ONE_VOICE_RULES',			'MODIFIER_PROJECT_ONE_VOICE_RULES_FAVOR');



-- modifierType MODIFIERTYPE_PLAYER_CITY_ADJUST_CITY_YIELD_STELLARIS defined at Leader_Grey.sql
INSERT INTO Modifiers 
(ModifierId,																						ModifierType,												RunOnce,	Permanent,	NewOnly,	OwnerRequirementSetId,					SubjectRequirementSetId) 
VALUES 
('MODIFIER_PROJECT_BECOME_THE_CRISIS_URANIUM',														'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_EXTRACTION',			0,			0,			0,			NULL,									NULL),
('MODIFIER_PROJECT_BECOME_THE_CRISIS_YIELD_GOLD',													'MODIFIERTYPE_PLAYER_CITY_ADJUST_CITY_YIELD_STELLARIS',		0,			0,			0,			NULL,									NULL),
('MODIFIER_PROJECT_BECOME_THE_CRISIS_YIELD_PRODUCTION',												'MODIFIERTYPE_PLAYER_CITY_ADJUST_CITY_YIELD_STELLARIS',		0,			0,			0,			NULL,									NULL),
('MODIFIER_TRAIT_CIVILIZATION_ORIGINALSTELLARIS_PROJECT_BECOME_THE_CRISIS',							'MODIFIER_PLAYER_ALLOW_PROJECT_CHINA',						0,			0,			0,			NULL,									'REQSET_HAS_TECH_NUCLEAR_FUSION_NO_MATRIX'),
('MODIFIER_TRAIT_CIVILIZATION_ORIGINALSTELLARIS_LEADER_MAJOR_CIV_HEAT_THE_CRISIS',					'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',				0,			0,			0,			'REQSET_STELLARIS_ISNT_THE_CRISIS',		'REQSET_STELLARIS_IS_THE_CRISIS'),
('MODIFIER_ABILITY_THE_CRISIS_STRENGTH',															'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',						0,			0,			0,			NULL,									NULL),
('MODIFIER_PROJECT_BECOME_THE_CRISIS_GRANT_ABILITY_STRENGTH',										'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',						0,			0,			0,			NULL,									NULL),
('MODIFIER_PROJECT_LOSSUS_PROJECT_URANIUM',															'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_EXTRACTION',			0,			0,			0,			NULL,									NULL),
('MODIFIER_PROJECT_LOSSUS_PROJECT_GUNDUM',															'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL',					0,			0,			0,			NULL,									NULL),
('MODIFIER_TRAIT_CIVILIZATION_ORIGINALSTELLARIS_PROJECT_LOSSUS_PROJECT',							'MODIFIER_PLAYER_ALLOW_PROJECT_CHINA',						0,			0,			0,			NULL,									'REQSET_HAS_TECH_NUCLEAR_FUSION'),
('MODIFIER_PROJECT_ONE_VOICE_RULES_FAVOR',															'MODIFIER_PLAYER_ADJUST_EXTRA_FAVOR_PER_TURN',				0,			0,			0,			NULL,									NULL),
('MODIFIER_TRAIT_CIVILIZATION_ORIGINALSTELLARIS_PROJECT_ONE_VOICE_RULES',							'MODIFIER_PLAYER_ALLOW_PROJECT_CHINA',						0,			0,			0,			NULL,									'REQSET_HAS_TECH_NUCLEAR_FUSION_NO_DEVOURING');



INSERT INTO ModifierArguments 
(ModifierId,																		Name,							Value) 
VALUES 
('MODIFIER_PROJECT_BECOME_THE_CRISIS_URANIUM',										'Amount',						'15'), 
('MODIFIER_PROJECT_BECOME_THE_CRISIS_URANIUM',										'ResourceType',					'RESOURCE_URANIUM'),
('MODIFIER_PROJECT_BECOME_THE_CRISIS_YIELD_GOLD',									'Amount',						'50'), 
('MODIFIER_PROJECT_BECOME_THE_CRISIS_YIELD_GOLD',									'YieldType',					'YIELD_GOLD'),
('MODIFIER_PROJECT_BECOME_THE_CRISIS_YIELD_PRODUCTION',								'Amount',						'100'), 
('MODIFIER_PROJECT_BECOME_THE_CRISIS_YIELD_PRODUCTION',								'YieldType',					'YIELD_PRODUCTION'),
('MODIFIER_TRAIT_CIVILIZATION_ORIGINALSTELLARIS_PROJECT_BECOME_THE_CRISIS',			'ProjectType',					'PROJECT_BECOME_THE_CRISIS'),
('MODIFIER_TRAIT_CIVILIZATION_ORIGINALSTELLARIS_LEADER_MAJOR_CIV_HEAT_THE_CRISIS',	'InitialValue',					'-1000'), 
('MODIFIER_TRAIT_CIVILIZATION_ORIGINALSTELLARIS_LEADER_MAJOR_CIV_HEAT_THE_CRISIS',	'SimpleModifierDescription',	'MODIFIER_TRAIT_LEADER_MAJOR_CIV_HEAT_THE_CRISIS_DES'), 
('MODIFIER_TRAIT_CIVILIZATION_ORIGINALSTELLARIS_LEADER_MAJOR_CIV_HEAT_THE_CRISIS',	'StatementKey',					'MODIFIER_TRAIT_LEADER_MAJOR_CIV_HEAT_THE_CRISIS_KEY'),
('MODIFIER_ABILITY_THE_CRISIS_STRENGTH',											'Amount',						'10'),
('MODIFIER_PROJECT_BECOME_THE_CRISIS_GRANT_ABILITY_STRENGTH',						'AbilityType',					'ABILITY_THE_CRISIS_STRENGTH'),
('MODIFIER_PROJECT_LOSSUS_PROJECT_URANIUM',											'Amount',						'3'), 
('MODIFIER_PROJECT_LOSSUS_PROJECT_URANIUM',											'ResourceType',					'RESOURCE_URANIUM'),
('MODIFIER_PROJECT_LOSSUS_PROJECT_GUNDUM',											'Amount',						'1'), 
('MODIFIER_PROJECT_LOSSUS_PROJECT_GUNDUM',											'UnitType',						'UNIT_GIANT_DEATH_ROBOT'),
('MODIFIER_TRAIT_CIVILIZATION_ORIGINALSTELLARIS_PROJECT_LOSSUS_PROJECT',				'ProjectType',					'PROJECT_LOSSUS_PROJECT'),
('MODIFIER_PROJECT_ONE_VOICE_RULES_FAVOR',											'Amount',						'300'),
('MODIFIER_TRAIT_CIVILIZATION_ORIGINALSTELLARIS_PROJECT_ONE_VOICE_RULES',			'ProjectType',					'PROJECT_ONE_VOICE_RULES');



INSERT INTO ModifierStrings
(ModifierId,								Context,		Text)
VALUES
('MODIFIER_ABILITY_THE_CRISIS_STRENGTH',	'Preview',		'LOC_ABILITY_THE_CRISIS_STRENGTH_DESCRIPTION');
INSERT INTO ModifierStrings
(ModifierId,																		Context,	Text)   
VALUES
('MODIFIER_TRAIT_CIVILIZATION_ORIGINALSTELLARIS_LEADER_MAJOR_CIV_HEAT_THE_CRISIS',	'Sample',	'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL');




INSERT INTO RequirementSets 
(RequirementSetId,								RequirementSetType) 
VALUES 
('REQSET_HAS_TECH_NUCLEAR_FUSION',				'REQUIREMENTSET_TEST_ALL'),
('REQSET_HAS_TECH_NUCLEAR_FUSION_NO_MATRIX',	'REQUIREMENTSET_TEST_ALL'),
('REQSET_HAS_TECH_NUCLEAR_FUSION_NO_DEVOURING',	'REQUIREMENTSET_TEST_ALL'),
('REQSET_STELLARIS_ISNT_THE_CRISIS',			'REQUIREMENTSET_TEST_ALL'), 
('REQSET_STELLARIS_IS_THE_CRISIS',				'REQUIREMENTSET_TEST_ALL');



INSERT INTO RequirementSetRequirements 
(RequirementSetId,								RequirementId) 
VALUES 
('REQSET_HAS_TECH_NUCLEAR_FUSION',				'REQ_HAS_TECH_NUCLEAR_FUSION'),
('REQSET_HAS_TECH_NUCLEAR_FUSION_NO_MATRIX',	'REQ_HAS_TECH_NUCLEAR_FUSION'), 
('REQSET_HAS_TECH_NUCLEAR_FUSION_NO_MATRIX',	'REQ_PLAYER_ISNT_MATRIX'),
('REQSET_HAS_TECH_NUCLEAR_FUSION_NO_DEVOURING',	'REQ_HAS_TECH_NUCLEAR_FUSION'), 
('REQSET_HAS_TECH_NUCLEAR_FUSION_NO_DEVOURING',	'REQ_PLAYER_ISNT_DEVOURING'),
('REQSET_STELLARIS_ISNT_THE_CRISIS',			'REQ_PLAYER_HAS_NOT_COMPLETED_PROJECT_BECOME_THE_CRISIS'), 
('REQSET_STELLARIS_IS_THE_CRISIS',				'REQ_PLAYER_HAS_COMPLETED_PROJECT_BECOME_THE_CRISIS');

INSERT INTO Requirements 
(RequirementId,												RequirementType,								Inverse) 
VALUES 
('REQ_HAS_TECH_NUCLEAR_FUSION',								'REQUIREMENT_PLAYER_HAS_TECHNOLOGY',			0), 
('REQ_PLAYER_ISNT_MATRIX',									'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES',		1),
('REQ_PLAYER_ISNT_DEVOURING',								'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES',		1),
('REQ_PLAYER_HAS_NOT_COMPLETED_PROJECT_BECOME_THE_CRISIS',	'REQUIREMENT_PLAYER_HAS_COMPLETED_PROJECT',		1), 
('REQ_PLAYER_HAS_COMPLETED_PROJECT_BECOME_THE_CRISIS',		'REQUIREMENT_PLAYER_HAS_COMPLETED_PROJECT',		0);


INSERT INTO RequirementArguments 
(RequirementId,													Name,					Value) 
VALUES 
('REQ_HAS_TECH_NUCLEAR_FUSION',									'TechnologyType',		'TECH_NUCLEAR_FUSION'), 
('REQ_PLAYER_ISNT_MATRIX',										'LeaderType',			'LEADER_STELLARIS_ELLIS_5'),
('REQ_PLAYER_ISNT_DEVOURING',									'LeaderType',			'LEADER_STELLARIS_WITCH_6'),
('REQ_PLAYER_HAS_NOT_COMPLETED_PROJECT_BECOME_THE_CRISIS',		'MinimumCompletions',	'1'), 
('REQ_PLAYER_HAS_NOT_COMPLETED_PROJECT_BECOME_THE_CRISIS',		'ProjectType',			'PROJECT_BECOME_THE_CRISIS'), 
('REQ_PLAYER_HAS_COMPLETED_PROJECT_BECOME_THE_CRISIS',			'MinimumCompletions',	'1'), 
('REQ_PLAYER_HAS_COMPLETED_PROJECT_BECOME_THE_CRISIS',			'ProjectType',			'PROJECT_BECOME_THE_CRISIS');


