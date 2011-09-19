-- Freya Unstable sun beam Unstable energy
DELETE FROM `spelldifficulty_dbc` WHERE `spellid0` = 62217;
INSERT INTO `spelldifficulty_dbc` VALUES
(3266,62217,62922,0,0);
DELETE FROM `spell_script_names` WHERE `spell_id` IN (62217,62922);
INSERT INTO `spell_script_names` VALUES
(62217,'spell_unstable_energy'),
(62922,'spell_unstable_energy');