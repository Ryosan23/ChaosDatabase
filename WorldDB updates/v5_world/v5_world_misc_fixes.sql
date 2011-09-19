-- Drak'tharon keep misc fixes
-- Drakkari guardian corpses on the beginning of heroic difficulty
UPDATE `creature_template` SET `unit_flags` = 570556486 WHERE `entry` = 31339;
-- Drakkari cosmetic bat
UPDATE `creature_template` SET `unit_flags` = 33685890 WHERE `entry` = 27490;

-- SotA Battleground demolishers lvl 80 entry immune_masks
UPDATE `creature_template` SET `mechanic_immune_mask` = 377830266 WHERE `entry` = 32796;