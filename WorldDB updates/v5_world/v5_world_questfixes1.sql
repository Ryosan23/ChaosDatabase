-- Orgrimmar: Hidden Enemies (5727)
SET @Gossip=21272;

DELETE FROM `gossip_menu` WHERE `text_id` IN (4513,4533,4534,4535,4536);
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(3701,4513), -- 1st
(@Gossip+0,4533), -- 2nd
(@Gossip+1,4534), -- 3rd
(@Gossip+2,4535), -- 4th
(@Gossip+3,4536); -- last
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (3701,@Gossip+0,@Gossip+1,@Gossip+2,@Gossip+3);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(3701,0,0, 'You may speak frankly, Neeru...' ,1,1,@Gossip+0,0,0,0,NULL),
(@Gossip+0,0,0, 'It is good to see the Burning Blade is taking over where the Shadow Council once failed.' ,1,1,@Gossip+1,0,0,0,NULL),
(@Gossip+1,0,0, 'So the Searing Blade is expendable?' ,1,1,@Gossip+2,0,0,0,NULL),
(@Gossip+2,0,0, 'If there is anything you would have of me...' ,1,1,@Gossip+3,0,0,0,NULL); -- Must Link to Final Action Menu as well
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=3216; -- Neeru Fireblade
DELETE FROM `smart_scripts` WHERE `entryorguid`=3216 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(3216, 0, 0, 0, 62, 0, 100, 0, @Gossip+2, 0, 0, 0, 15, 5727, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Neeru Fireblade - On gossip select give Hidden Enemies quest completed');

UPDATE `quest_template` SET `SpecialFlags`=`SpecialFlags`|2 WHERE `entry`=5727; -- Hidden Enemies (quest completable by external event)
-- Conditions so gossips don't show up if the player doesn't have the item
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=3701;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=14 AND `SourceGroup` BETWEEN @Gossip+0 AND @Gossip+3;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,3701,0,0,2,14544,1,0,0,'', 'Neeru Fireblade: Quest Hidden Enemies gossip option - requires item Lieutenant''s Insignia'),
(14,@Gossip+0,4533,0,2,14544,1,0,0, '', 'Neeru Fireblade: Quest Hidden Enemies gossip 1 - requires item Lieutenant''s Insignia'),
(14,@Gossip+1,4534,0,2,14544,1,0,0, '', 'Neeru Fireblade: Quest Hidden Enemies gossip 2 - requires item Lieutenant''s Insignia'),
(14,@Gossip+2,4535,0,2,14544,1,0,0, '', 'Neeru Fireblade: Quest Hidden Enemies gossip 3 - requires item Lieutenant''s Insignia'),
(14,@Gossip+3,4536,0,2,14544,1,0,0, '', 'Neeru Fireblade: Quest Hidden Enemies gossip 4 - requires item Lieutenant''s Insignia');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=66512;
INSERT INTO `spell_linked_spell` VALUES
(66512, 66510, 0, 'Summon Deep Jormungar on Pound Drum');
 
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=0 AND `SourceEntry`=66512;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 0, 66512, 0, 18, 0, 195308, 0, 0, '', 'Pound Drum: Target Mysterious Snow Mound'),
(13, 0, 66512, 0, 18, 0, 195309, 0, 0, '', 'Pound Drum: Target Mysterious Snow Mound');

-- Morbent Fel SAI
SET @ENTRY := 1200;
SET @SPELL_SACRED_CLEANSING := 8913;
SET @SPELL_TOUCH_OF_DEATH := 3108;
SET @SPELL_PRESENCE_OF_DEATH := 3109;
SET @SPELL_UNHOLY_SHIELD := 8909;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,0,0,11,@SPELL_UNHOLY_SHIELD,0,0,0,0,0,1,0,0,0,0,0,0,0,"Morbent Fel - Out Of Combat - Cast Unholy Shield"),
(@ENTRY,0,1,0,8,0,100,0,@SPELL_SACRED_CLEANSING,0,0,0,36,24782,0,0,0,0,0,1,0,0,0,0,0,0,0,"Morbent Fel - On Spellhit - Update Template"),
(@ENTRY,0,2,0,0,0,100,0,0,0,24000,24000,11,@SPELL_TOUCH_OF_DEATH,0,0,0,0,0,2,0,0,0,0,0,0,0,"Morbent Fel - In Combat - Cast Touch of Death"),
(@ENTRY,0,3,0,0,0,100,0,0,0,3700,13300,11,@SPELL_PRESENCE_OF_DEATH,0,0,0,0,0,2,0,0,0,0,0,0,0,"Morbent Fel - In Combat - Cast Presence of Death"),
(@ENTRY,0,4,0,2,0,100,1,0,15,0,0,28,@SPELL_UNHOLY_SHIELD,1,0,0,0,0,1,0,0,0,0,0,0,0,"Morbent Fel - At 15% HP - Remove Unholy Shield");

SET @Gossip=21276;
SET @Azuregos=15481; -- Spirit of Azuregos
SET @Item=20949; -- Magical Ledger
UPDATE `creature_template` SET `gossip_menu_id`=@Gossip, `AIName`='SmartAI' WHERE `entry`=@Azuregos;

DELETE FROM `gossip_menu` WHERE (`entry` BETWEEN @Gossip AND @Gossip+12) AND `text_id` IN (7881,7901,7885,7886,7887,7888,7889,7890,7891,7892,7893,7894,7895,7896,7897);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(@Gossip+00, 7881), -- gossip if no quest nor item
(@Gossip+00, 7901), -- gossip if item
(@Gossip+00, 7885), -- 01
(@Gossip+01, 7886), -- 02
(@Gossip+02, 7887), -- 03
(@Gossip+03, 7888), -- 04
(@Gossip+04, 7889), -- 05
(@Gossip+05, 7890), -- 06
(@Gossip+06, 7891), -- 07
(@Gossip+07, 7892), -- 08
(@Gossip+08, 7893), -- 09
(@Gossip+09, 7894), -- 10
(@Gossip+10, 7895), -- 11
(@Gossip+11, 7896), -- 12
(@Gossip+12, 7897); -- 13

DELETE FROM `gossip_menu_option` WHERE `menu_id` BETWEEN @Gossip AND @Gossip + 14;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`) VALUES
(@Gossip+00,0,'How did you know? I mean, yes... Yes I am looking for that shard. Do you have it?',1,1,@Gossip+01),
(@Gossip+01,0,'Alright. Where?',1,1,@Gossip+02),
(@Gossip+02,0,'By Bronzebeard''s... um, beard! What are you talking about?',1,1,@Gossip+03),
(@Gossip+03,0,'Fish? You gave a piece of what could be the key to saving all life on Kalimdor to a fish?',1,1,@Gossip+04),
(@Gossip+04,0,'A minnow? The oceans are filled with minnows! There could be a hundred million million minnows out there!',1,1,@Gossip+05),
(@Gossip+05,0,'...',1,1,@Gossip+06),
(@Gossip+06,0,'You put the piece on a minnow and placed the minnow somewhere in the waters of the sea between here and the Eastern Kingdoms? And this minnow has special powers?',1,1,@Gossip+07),
(@Gossip+07,0,'You''re insane.',1,1,@Gossip+08),
(@Gossip+08,0,'I''m all ears.',1,1,@Gossip+09),
(@Gossip+09,0,'Come again.',1,1,@Gossip+10),
(@Gossip+10,0,'Ok, let me get this straight. You put the scepter entrusted to your Flight by Anachronos  on a minnow of your own making and now you expect me to build an... an arcanite buoy or something... to force your minnow out of hiding? AND potentially incur the wrath of an Elemental Lord? Did I miss anything? Perhaps I am to do this without any clothes on, during a solar eclipse, on a leap year?',1,1,@Gossip+11),
(@Gossip+11,0,'FINE! And how, dare I ask, am I supposed to acquire an arcanite buoy?',1,1,@Gossip+12),
(@Gossip+12,0,'But...',1,1,0);

DELETE FROM `creature_text` WHERE `entry`=@Azuregos;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@Azuregos, 0, 0, 'I SAID GOOD BYE!', 12, 0, 100, 1, 0, 0, 'Spirit of Azuregos');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` BETWEEN @Gossip+0 AND @Gossip+2;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(14,@Gossip+0,7901,0,2,@Item,1, 'Spirit of Azuregos - show gossip 7901 if player has item Magical Ledger'),
(14,@Gossip+0,7885,0,14,8575,0, 'Spirit of Azuregos - show gossip 7885 if player does not have quest Azuregos''s Magical Ledger'),
(14,@Gossip+0,7885,0,8,8555,0, 'Spirit of Azuregos - show gossip 7885 if player has quest The Charge of the Dragonflights rewarded'),
(14,@Gossip+0,7881,0,14,8555,0, 'Spirit of Azuregos - show gossip 7881 if player does not have quest The Charge of the Dragonflights'),
(15,@Gossip+0,0,0,26,@Item,1, 'Spirit of Azuregos - show gossip option if player does not have item Magical Ledger'),
(15,@Gossip+0,0,0,14,8575,0, 'Spirit of Azuregos - show gossip option if player does not have quest Azuregos''s Magical Ledger'),
(15,@Gossip+0,0,0,8,8555,0, 'Spirit of Azuregos - show gossip option if player has quest The Charge of the Dragonflights rewarded');

DELETE FROM `smart_scripts` WHERE `entryorguid`=@Azuregos AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@Azuregos, 0, 0, 0, 62, 0, 100, 0, @Gossip+11, 0, 0, 0, 56, @Item, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Spirit of Azuregos - On gossip select 11 give item'),
(@Azuregos, 0, 1, 2, 62, 0, 100, 0, @Gossip+12, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Spirit of Azuregos - On gossip select 12 close gossip'),
(@Azuregos, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Spirit of Azuregos - Link 2 say');

DELETE FROM `smart_scripts` WHERE `entryorguid`=160445 AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(160445, 1, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 12, 9136, 1, 60*1000, 0, 0, 0, 8, 0, 0, 0, -7917.378906, -2610.533936, 221.123123, 5.040257, 'Sha''ni Proudtusk''s Remains - On gossip hello summon Sha''ni Proudtusk');
-- Need a way to prevent spamming this action.