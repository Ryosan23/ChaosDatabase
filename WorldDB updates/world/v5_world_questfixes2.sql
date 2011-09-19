-- [Q] In the Name of Loken
-- Gavrock SAI
SET @ENTRY := 26420;
SET @QUEST := 12204;
SET @GOSSIP := 9485;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,@GOSSIP,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gavrock - On Gossip Select - Run Script"),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Gavrock - On Script - Close Gossip"),
(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gavrock - On Script - Remove Gossip & Quest Flags"),
(@ENTRY*100,9,2,0,0,0,100,0,5000,5000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gavrock - On Script - Say Text 0"),
(@ENTRY*100,9,3,0,0,0,100,0,10000,10000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gavrock - On Script - Say Text 1"),
(@ENTRY*100,9,4,0,0,0,100,0,15000,15000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gavrock - On Script - Say Text 2"),
(@ENTRY*100,9,5,0,0,0,100,0,0,0,0,0,33,@ENTRY,0,0,0,0,0,7,0,0,0,0,0,0,0,"Gavrock - On Script - Quest Credit"),
(@ENTRY*100,9,6,0,0,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gavrock - On Script - Add Gossip & Quest Flags");

-- NPC talk text insert from sniff
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Ah, yes. Loken is well known to me.",12,0,100,0,0,0,"Gavrock"),
(@ENTRY,1,0,"It is he who commands the sons of iron in their war against us.",12,0,100,0,0,0,"Gavrock"),
(@ENTRY,2,0,"From his hiding place, he oversees their preparations for war with the goal of exterminating the stone giants!",12,0,100,0,0,0,"Gavrock");

-- Add gossip_menu_option condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`) VALUES
(15,@GOSSIP,0,9,@QUEST);

-- Hugh Glass SAI
SET @ENTRY := 26484;
SET @QUEST := 12204;
SET @GOSSIP := 9484;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,@GOSSIP,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hugh Glass - On Gossip Select - Run Script"),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Hugh Glass - On Script - Close Gossip"),
(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hugh Glass - On Script - Remove Gossip & Quest Flags"),
(@ENTRY*100,9,2,0,0,0,100,0,5000,5000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hugh Glass - On Script - Say Text 0"),
(@ENTRY*100,9,3,0,0,0,100,0,10000,10000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hugh Glass - On Script - Say Text 1"),
(@ENTRY*100,9,5,0,0,0,100,0,0,0,0,0,33,@ENTRY,0,0,0,0,0,7,0,0,0,0,0,0,0,"Hugh Glass - On Script - Quest Credit"),
(@ENTRY*100,9,6,0,0,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hugh Glass - On Script - Add Gossip & Quest Flags");

DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=0;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(@GOSSIP, 0, 0, 'Calm down, I want to ask you about the Iron Dwarves and Loken.', 1, 1, 0, 0, 0, 0, NULL);

-- NPC talk text insert from sniff
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`TEXT`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"He's out to get me, too! I'd be careful around here if I was you, traveler. You never know which tree he's hiding behind!",12,0,100,0,0,0,"Hugh Glass"),
(@ENTRY,1,0,"That's not something Limpy Joe would ask! But yeah, I know Loken.",12,0,100,0,0,0,"Hugh Glass");

-- Add gossip_menu_option condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`) VALUES
(15,@GOSSIP,0,9,@QUEST);


-- Sundered Rumbler SAI
SET @ENTRY := 18881;
SET @SPELL_SUMMON_SUNDERED_SHARD := 35310;
SET @SPELL_CREATE_ELEMENTAL_POWER := 34525;
SET @SPELL_ELEMENTAL_POWERDER_EXTRACTOR := 34520;
UPDATE `creature_template` SET `AIName`='SmartAI',`dmgschool`=3 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,1,@SPELL_ELEMENTAL_POWERDER_EXTRACTOR,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sundered Rumbler - On Spellhit - Set Phase 1"),
(@ENTRY,0,1,0,6,1,100,0,0,0,0,0,11,@SPELL_CREATE_ELEMENTAL_POWER,2,0,0,0,0,1,0,0,0,0,0,0,0,"Sundered Rumbler - On Death - Cast Create Elemental Power"),
(@ENTRY,0,2,0,2,0,100,1,0,10,0,0,11,@SPELL_SUMMON_SUNDERED_SHARD,1,0,0,0,0,1,0,0,0,0,0,0,0,"Sundered Rumbler - At 10% HP - Cast Summon Sundered Shard");

-- Warp Aberration SAI
SET @ENTRY := 18865;
SET @SPELL_WARP_STORM := 36577;
SET @SPELL_ARCANE_SHIELD := 36640;
SET @SPELL_CREATE_ELEMENTAL_POWER := 34525;
SET @SPELL_ELEMENTAL_POWERDER_EXTRACTOR := 34520;
UPDATE `creature_template` SET `AIName`='SmartAI',`dmgschool`=6 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,@SPELL_ARCANE_SHIELD,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warp Aberration - On Aggro - Cast Arcane Shield"),
(@ENTRY,0,1,0,8,0,100,1,@SPELL_ELEMENTAL_POWERDER_EXTRACTOR,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warp Aberration - On Spellhit - Set Phase 1"),
(@ENTRY,0,2,0,6,1,100,0,0,0,0,0,11,@SPELL_CREATE_ELEMENTAL_POWER,2,0,0,0,0,1,0,0,0,0,0,0,0,"Warp Aberration - On Death - Cast Create Elemental Power"),
(@ENTRY,0,3,0,0,0,100,0,2500,5000,30000,35000,11,@SPELL_WARP_STORM,0,0,0,0,0,2,0,0,0,0,0,0,0,"Warp Aberration - In Combat - Cast Warp Storm");

-- Warp Storm SAI
SET @ENTRY := 21322;
SET @SPELL_WARP_STORM := 36580;
UPDATE `creature_template` SET `AIName`='SmartAI',`modelid1`=18402,`unit_flags`=33554822 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,1,1000,1000,1000,1000,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warp Storm - On Just Summoned - Prevent Combat Movement"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warp Storm - On Aggro - Stop Auto Attack"),
(@ENTRY,0,2,0,0,0,100,0,1000,2000,3000,5000,11,@SPELL_WARP_STORM,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warp Storm - In Combat - Cast Warp Storm");

-- Conditions for quest item
DELETE FROM `conditions` WHERE `SourceEntry` IN (28547) AND `ConditionValue2` IN (18881,18865);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(18,0,28547,0,24,1,18881,0,0,"","Item Elemental Power Extractor can only be used if target is Sundered Rumbler"),
(18,0,28547,0,24,1,18865,0,0,"","Item Elemental Power Extractor can only be used if target is Warp Aberration");

-- Ethereum Relay SAI
SET @ENTRY := 20619;
SET @SPELL_SHADOWFORM := 16592;
SET @SPELL_ETHEREUM_RELAY := 39596;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,1,0,100,1,0,0,0,0,11,@SPELL_SHADOWFORM,1,0,0,0,0,1,0,0,0,0,0,0,0,"Ethereum Relay - Out of Combat - Cast Shadowform"),
(@ENTRY,0,1,0,1,0,100,1,0,0,0,0,11,@SPELL_ETHEREUM_RELAY,1,0,0,0,0,1,0,0,0,0,0,0,0,"Ethereum Relay - Out of Combat - Cast Ethereum Relay");