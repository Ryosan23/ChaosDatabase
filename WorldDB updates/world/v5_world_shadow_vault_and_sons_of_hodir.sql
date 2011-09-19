-- Shadow vault chain quest fix
-- General Lightsbane
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` = 29851;

-- Sons of hodir chain quest fixes
-- Missing Lok'lira the Crone spawn
DELETE FROM `creature` WHERE `id`=29975;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(1002995, 29975, 571, 1, 1, 0, 0, 6927.69, -1542.16, 833.994, 1.46508, 300, 0, 0, 12175, 0, 0, 0, 0, 0);


-- COLD HEARTED quest
-- Template updates for creature 29708 (Captive Proto-Drake)
UPDATE `creature_template` SET `speed_run`=1.4285714285714,`vehicleid`=198 WHERE `entry`=29708; -- Captive Proto-Drake
-- Model data 26739 (creature 29708 (Captive Proto-Drake))
UPDATE `creature_model_info` SET `bounding_radius`=0.39,`combat_reach`=6.5,`gender`=0 WHERE `modelid`=26739;
-- Captive Proto-Drake -- Addon data for creature 29708 (Captive Proto-Drake)
DELETE FROM `creature_template_addon` WHERE `entry`=29708;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(29708,0,50331648,1,0, NULL); -- Captive Proto-Drake

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=29708;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(29708,55028,12856,1,12856,1,0,0,0); -- Summon Freed Proto Drake.

-- Template updates for creature 29709 (Freed Proto-Drake)
UPDATE `creature_template` SET `spell1`=55046,`faction_A`=35,`faction_H`=35,`unit_flags`=`unit_flags`|8,`speed_run`=4.2857142857143,`vehicleid`=194, `InhabitType`=4 WHERE `entry`=29709; -- Freed Proto-Drake
-- Model data 26710 (creature 29709 (Freed Proto-Drake))
UPDATE `creature_model_info` SET `bounding_radius`=0.3,`combat_reach`=5,`gender`=0 WHERE `modelid`=26710; -- Freed Proto-Drake
-- Addon data for creature 29709 (Freed Proto-Drake)
DELETE FROM `creature_template_addon` WHERE `entry`=29709;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(29709,0,50331648,1,0, NULL); -- Freed Proto-Drake

-- Quest: Warm Up (12996)
-- SAI for Kirgaraak
SET @entry :=29352;
UPDATE creature_template SET AIName='SmartAI' WHERE entry=@entry;
DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@entry;
DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=@entry*100;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
(@entry,0,0,0,2,0,100,0,0,5,0,0,80,@entry*100,0,2,0,0,0,1,0,0,0,0,0,0,0, 'Kirgaraak - 5% - Start Script'),
(@entry*100,9,0,0,0,0,100,0,0,0,0,0,33,30221,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Kirgaraak - Quest Credit'),
(@entry*100,9,1,0,0,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Kirgaraak - Make Friendly'),
(@entry*100,9,2,0,0,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Kirgaraak - Evade'),
(@entry*100,9,3,0,0,0,100,0,10000,10000,0,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Kirgaraak - Reset Faction');

-- Quest: The Drakkensryd (12886)
-- Quest workaround
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 29694 WHERE `entry` = 12886;

-- Quest: The Refiner's fire
-- Missing anvil spawn
DELETE FROM `gameobject` WHERE `id`=192060;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(2711281, 192060, 571, 1, 1, 7226.25, -3653.62, 823.35, 2.6468, 0, 0, 0.969553, 0.244882, 300, 0, 1);
