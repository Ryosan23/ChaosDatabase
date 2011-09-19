UPDATE `quest_template` SET `PrevQuestId`=0 WHERE `entry` IN
-- Paths
(24827,24834,24835,24823,24828,24829,25239,25240,25242,24826,24832,24833,24825,24830,24831,
-- A Change of Heart
24819,24820,24821,24822,24836,24837,24838,24839,24840,24841,24842,24843,24844,24845,24846,24847,25246,25247,25248,25249);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceEntry` IN
-- Paths
(24827,24834,24835,24823,24828,24829,25239,25240,25242,24826,24832,24833,24825,24830,24831,
-- A Change of Heart
24819,24820,24821,24822,24836,24837,24838,24839,24840,24841,24842,24843,24844,24845,24846,24847,25246,25247,25248,25249);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`Comment`) VALUES
-- Path of Courage
(19,0,24827,0,2,50375,1,0,'Path of Courage 1'),
(19,0,24834,0,2,50388,1,0,'Path of Courage 2'),
(19,0,24835,0,2,50403,1,0,'Path of Courage 3'),
-- Path of Destruction
(19,0,24823,0,2,50384,1,0,'Path of Destruction 1'),
(19,0,24828,0,2,50377,1,0,'Path of Destruction 2'),
(19,0,24829,0,2,50397,1,0,'Path of Destruction 3'),
-- Path of Might
(19,0,25239,0,2,52569,1,0,'Path of Might 1'),
(19,0,25240,0,2,52570,1,0,'Path of Might 2'),
(19,0,25242,0,2,52571,1,0,'Path of Might 3'),
-- Path of Vengeance
(19,0,24826,0,2,50376,1,0,'Path of Vengeance 1'),
(19,0,24832,0,2,50387,1,0,'Path of Vengeance 2'),
(19,0,24833,0,2,50401,1,0,'Path of Vengeance 3'),
-- Path of Wisdom
(19,0,24825,0,2,50378,1,0,'Path of Wisdom 1'),
(19,0,24830,0,2,50386,1,0,'Path of Wisdom 2'),
(19,0,24831,0,2,50399,1,0,'Path of Wisdom 3'),
-- A Change of Heart
(19,0,24819,0,2,50377,1,0,'A Change of Heart'),
(19,0,24820,0,2,50376,1,0,'A Change of Heart'),
(19,0,24821,0,2,50375,1,0,'A Change of Heart'),
(19,0,24822,0,2,50378,1,0,'A Change of Heart'),
(19,0,24836,0,2,50384,1,0,'A Change of Heart'),
(19,0,24837,0,2,50386,1,0,'A Change of Heart'),
(19,0,24838,0,2,50387,1,0,'A Change of Heart'),
(19,0,24839,0,2,50388,1,0,'A Change of Heart'),
(19,0,24840,0,2,50397,1,0,'A Change of Heart'),
(19,0,24841,0,2,50399,1,0,'A Change of Heart'),
(19,0,24842,0,2,50401,1,0,'A Change of Heart'),
(19,0,24843,0,2,50403,1,0,'A Change of Heart'),
(19,0,24844,0,2,50398,1,0,'A Change of Heart'),
(19,0,24845,0,2,50400,1,0,'A Change of Heart'),
(19,0,24846,0,2,50402,1,0,'A Change of Heart'),
(19,0,24847,0,2,50404,1,0,'A Change of Heart'),
(19,0,25246,0,2,52572,1,0,'A Change of Heart'),
(19,0,25247,0,2,52569,1,0,'A Change of Heart'),
(19,0,25248,0,2,52570,1,0,'A Change of Heart'),
(19,0,25249,0,2,52571,1,0,'A Change of Heart');
