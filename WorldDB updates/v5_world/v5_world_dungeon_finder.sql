-- Correct instance credit for dungeon finder
-- Culling of Stratholme
UPDATE instance_encounters SET creditType='0', creditEntry='26533' WHERE entry IN (296,300);
-- Drak'Tharon Keep
UPDATE instance_encounters SET creditType ='0', creditEntry ='26632' WHERE entry IN (376,375);