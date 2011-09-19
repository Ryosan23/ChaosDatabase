UPDATE item_template SET sheath = 0 WHERE entry = 49706;
UPDATE item_template SET InventoryType = 17 WHERE entry = 50840;
UPDATE item_template SET sheath = 0 WHERE entry = 50840;
UPDATE item_template SET BuyCount = 1 WHERE entry = 49706;
DELETE FROM creature WHERE guid = 1002997;
DELETE FROM creature WHERE guid = 1002996;
DELETE FROM creature WHERE guid = 1003010;
DELETE FROM creature WHERE guid = 1003005;
DELETE FROM creature WHERE guid = 1003006;
DELETE FROM creature WHERE guid = 1003007;
DELETE FROM creature WHERE guid = 1003000;
DELETE FROM creature WHERE guid = 1003001;
DELETE FROM creature WHERE guid = 1003002;
DELETE FROM creature_addon WHERE guid = 136093;
DELETE FROM creature_addon WHERE guid = 136094;
DELETE FROM creature_addon WHERE guid = 136533;
DELETE FROM creature_addon WHERE guid = 136534;
DELETE FROM creature_addon WHERE guid = 137561;


