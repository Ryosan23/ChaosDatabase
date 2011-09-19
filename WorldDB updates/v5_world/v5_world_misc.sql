-- Wretched husk damage fix
UPDATE `creature_template` SET `attackpower` = 0, `mindmg` = 10, `maxdmg` = 10, `dmg_multiplier` = 1 WHERE `entry` IN (24690,25576);