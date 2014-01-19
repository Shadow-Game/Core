UPDATE `version` SET `db_version`='TDB 335.51', `cache_id`=51 LIMIT 1;
SET @NPC_DRAKE  := 29709;

DELETE FROM `waypoint_data` WHERE `id`=@NPC_DRAKE;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@NPC_DRAKE,1,7294.96,-2418.733,823.869,0,0,0,0,100,0),
(@NPC_DRAKE,2,7315.984,-2331.46,826.3972,0,0,0,0,100,0),
(@NPC_DRAKE,3,7271.826,-2271.479,833.5917,0,0,0,0,100,0),
(@NPC_DRAKE,4,7186.253,-2218.475,847.5632,0,0,0,0,100,0),
(@NPC_DRAKE,5,7113.195,-2164.288,850.2301,0,0,0,0,100,0),
(@NPC_DRAKE,6,7078.018,-2063.106,854.7581,0,0,0,0,100,0),
(@NPC_DRAKE,7,7073.221,-1983.382,861.9246,0,0,0,0,100,0),
(@NPC_DRAKE,8,7061.455,-1885.899,865.119,0,0,0,0,100,0),
(@NPC_DRAKE,9,7033.32,-1826.775,876.2578,0,0,0,0,100,0),
(@NPC_DRAKE,10,6999.902,-1784.012,897.4521,0,0,0,0,100,0),
(@NPC_DRAKE,11,6954.913,-1747.043,897.4521,0,0,0,0,100,0),
(@NPC_DRAKE,12,6933.856,-1720.698,882.2022,0,0,0,0,100,0),
(@NPC_DRAKE,13,6932.729,-1687.306,866.1189,0,0,0,0,100,0),
(@NPC_DRAKE,14,6952.458,-1663.802,849.8133,0,0,0,0,100,0),
(@NPC_DRAKE,15,7002.819,-1651.681,831.397,0,0,0,0,100,0),
(@NPC_DRAKE,16,7026.531,-1649.239,828.8406,0,0,0,0,100,0);
UPDATE `creature_template` SET `Armor_mod`=0 WHERE `entry`=29747;
DELETE FROM `spell_target_position` WHERE `id` IN (64014,64024,64025,64028,64029,64030,64031,64032,65042);
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
(64014, 603, -705.9705, -92.55729, 430.8192, 0),
(64024, 603, 2086.224, -24.05382, 422.2889, 0),
(64025, 603, 2518.131, 2569.342, 412.6822, 0),
(64028, 603, 553.243, -12.30903, 410.5428, 0),
(64029, 603, 1859.563, -24.83773, 449.1945, 6.230825),
(64030, 603, 1497.989, -24.16162, 421.6254, 0.03490658),
(64031, 603, 926.2917, -11.44444, 418.9779, 0.01745329),
(64032, 603, 131.1389, -35.36806, 410.187, 0),
(65042, 603, 1855.073, -11.48785, 334.559, 5.532694);
-- Lurgglbr
DELETE FROM `creature_text` WHERE `entry`=25208;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES 
(25208,0,0, 'You can''t hold me against my will! You''ve all been brainwashed!', 12,0,100,0,0,0, 'Lurgglbr'),
(25208,1,0, 'Together we will fight our way out of here. Are you ready?', 12,0,100,0,0,0, 'Lurgglbr'),
(25208,2,0, 'This is far enough. I can make it on my own from here.', 12,0,100,0,0,0, 'Lurgglbr'),
(25208,3,0, 'Thank you for rescuing me, $r. Please tell the king that I am back.', 12,0,100,0,0,0, 'Lurgglbr');

-- quest fix cuergo's gold (q2882)
SET @ENTRY :=7898;
UPDATE `creature_template` SET `AIName`= 'SmartAI', `ScriptName`='' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND`entryorguid`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND`entryorguid`=@ENTRY*100;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,63,0,100,0,0,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Trigger - on respawn - run script'),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,300000,300000,11,11463,0,0,0,0,0,1,0,0,0,0,0,0,0,'Timed Actionscript - spawn pirate1'),
(@ENTRY*100,9,1,0,0,0,100,0,0,0,300000,300000,11,11463,0,0,0,0,0,1,0,0,0,0,0,0,0,'Timed Actionscript - spawn pirate2'),
(@ENTRY*100,9,2,0,0,0,100,0,0,0,300000,300000,11,11485,0,0,0,0,0,1,0,0,0,0,0,0,0,'Timed Actionscript - spawn buccaneer1'),
(@ENTRY*100,9,3,0,0,0,100,0,0,0,300000,300000,11,11485,0,0,0,0,0,1,0,0,0,0,0,0,0,'Timed Actionscript - spawn buccaneer2'),
(@ENTRY*100,9,4,0,0,0,100,0,0,0,300000,300000,11,11487,0,0,0,0,0,1,0,0,0,0,0,0,0,'Timed Actionscript - spawn swashbuckler'),
(@ENTRY*100,9,5,0,0,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Timed Actionscript - despawn trigger');
-- Remove Zulian Mudskunk from Zulian Crocolisk's loot template
DELETE FROM `creature_loot_template` WHERE `entry`=15043 and `item`=19975;
-- Add Vicious Oil (Item) into loot template of Vicious Oil (NPC)
DELETE FROM `creature_loot_template` WHERE `entry`=30325 and `item`=42640;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) values
(30325,42640,-100,1,0,1,1);
-- Previous quest should be The Defense of Warsong Hold not To Conquest Hold, But Be Careful!
UPDATE `quest_template` SET `PrevQuestId`=11596 WHERE  `Id`=12486;
-- Change grouping so Alliance and Horde quests are no longer in 1 group
UPDATE `quest_template` SET `ExclusiveGroup`=-12222 WHERE  `Id` IN(12222,12223);
-- Hellscreams Champion requires some conditions to start the quest
UPDATE `quest_template` SET `ExclusiveGroup`=0,`NextQuestId`=0 WHERE  `Id` IN(11652,11705,11722);
UPDATE `quest_template` SET `NextQuestId`=11709 WHERE `Id`=11705;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry`=11916;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES 
(20,0,11916,0,0,8,0,11652,0,0,0,0, '', 'Player must have completed The Plains of Nasam before been able to accept Hellscream''s Champion'),
(19,0,11916,0,0,8,0,11652,0,0,0,0, '', 'Player must have completed The Plains of Nasam before been able to accept Hellscream''s Champion'),
(20,0,11916,0,0,8,0,11705,0,0,0,0, '', 'Player must have completed The Foolish Endeavors before been able to accept Hellscream''s Champion'),
(19,0,11916,0,0,8,0,11705,0,0,0,0, '', 'Player must have completed The Foolish Endeavors before been able to accept Hellscream''s Champion'),
(20,0,11916,0,0,8,0,11722,0,0,0,0, '', 'Player must have completed The Trophies of Gammoth before been able to accept Hellscream''s Champion'),
(19,0,11916,0,0,8,0,11722,0,0,0,0, '', 'Player must have completed The Trophies of Gammoth before been able to accept Hellscream''s Champion');
-- Fix SAI issue for Hugh Glass (wrong npcflag was set)
UPDATE `smart_scripts` SET `action_param1`=643 WHERE  `entryorguid`=2648400 AND `source_type`=9 AND `id`=6;
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sindragosa_frost_breath';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_item_unsated_craving';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(69649,'spell_sindragosa_frost_breath'),
(71056,'spell_sindragosa_frost_breath'),
(71057,'spell_sindragosa_frost_breath'),
(71058,'spell_sindragosa_frost_breath'),
(73061,'spell_sindragosa_frost_breath'),
(73062,'spell_sindragosa_frost_breath'),
(73063,'spell_sindragosa_frost_breath'),
(73064,'spell_sindragosa_frost_breath'),
(71168,'spell_item_unsated_craving');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=71952;
-- creature_template.equipment_id deleted
-- creature_equip_template.entry == creature_template.entry
-- id field added to creature_equip_template -> PK(entry, id)
-- id field in creature_equip_template starts at 1
-- creature.equipment_id references id of creature_equip_template
-- creature.equipment_id = 0 means no equipment at all (default 1)
-- creature.equipment_id = -1 means pick a random equipment from creature_equip_template

-- Diff_entries should use the same template of the normal entry
UPDATE `creature_template` SET `equipment_id` = 0 WHERE `name` LIKE '%(1)' OR `name` LIKE '%(2)' OR `name` LIKE '%(3)' OR `name` LIKE '%(4)';

-- Delete unused templates
DROP TABLE IF EXISTS `temp_c_e`;
CREATE TABLE IF NOT EXISTS `temp_c_e` (`entry` mediumint(8));
ALTER TABLE `temp_c_e` ADD INDEX `ind` (`entry`);
INSERT INTO `temp_c_e` SELECT `equipment_id` FROM `creature_template` WHERE `equipment_id` != 0 UNION
                       SELECT `equipment_id` FROM `creature` WHERE `equipment_id` != 0 UNION
                       SELECT `equipment_id` FROM `game_event_model_equip` WHERE `equipment_id` != 0;
DELETE FROM `creature_equip_template` WHERE `entry` NOT IN (SELECT `entry` FROM `temp_c_e`);
DROP TABLE `temp_c_e`;

-- Create temporary table to hold the values of creature_equip_template with converted entry
DROP TABLE IF EXISTS `creature_equip_template2`;
CREATE TABLE IF NOT EXISTS `creature_equip_template2` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `itemEntry1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `itemEntry2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `itemEntry3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`, `id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `creature_equip_template2` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`)
    SELECT `creature_template`.`entry`, 1, `itemEntry1`, `itemEntry2`, `itemEntry3`
    FROM `creature_template`
    JOIN `creature_equip_template` ON `creature_equip_template`.`entry` = `equipment_id`
    WHERE `equipment_id` != 0;

INSERT IGNORE INTO `creature_equip_template2` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`)
    SELECT `creature`.`id`, 2, `itemEntry1`, `itemEntry2`, `itemEntry3`
    FROM `creature`
    JOIN `creature_equip_template` ON `creature_equip_template`.`entry` = `equipment_id`
    WHERE `equipment_id` != 0;

DROP TABLE `creature_equip_template`;
RENAME TABLE `creature_equip_template2` TO `creature_equip_template`;

UPDATE `creature` SET `equipment_id` = 2 WHERE `equipment_id` != 0;
UPDATE `creature` SET `equipment_id` = 1 WHERE `equipment_id` = 0;

-- From game_event_model_equip
UPDATE `creature` SET `equipment_id` = 1 WHERE `guid` IN (12088, 12093, 12095, 79670, 79675, 79676, 79690, 79792, 79807, 79814);
UPDATE `game_event_model_equip` SET `equipment_id` = 2 WHERE `guid` IN (12088, 12093, 12095, 79670, 79675, 79676, 79690, 79792, 79807, 79814);
DELETE FROM `creature_equip_template` WHERE `entry` IN (1976, 23585, 424) AND `id`=2;
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(1976, 2, 2715, 143, 0),
(23585, 2, 2715, 143, 0),
(424, 2, 2715, 143, 0);

-- ALTER TABLE `creature_equip_template` CHANGE `entry` `entry` mediumint(8) unsigned NOT NULL;
-- ALTER TABLE `creature_equip_template` ADD `id` tinyint(3) unsigned NOT NULL DEFAULT '1' AFTER `entry`;
-- ALTER TABLE `creature_equip_template` DROP INDEX `PRIMARY`, ADD PRIMARY KEY (`entry`, `id`);
ALTER TABLE `creature_template` DROP `equipment_id`;
ALTER TABLE `creature` CHANGE `equipment_id` `equipment_id` tinyint(3) unsigned NOT NULL DEFAULT '1';
ALTER TABLE `game_event_model_equip` CHANGE `equipment_id` `equipment_id` tinyint(3) unsigned NOT NULL DEFAULT '1';

-- Conversion from SAI
UPDATE `smart_scripts` SET `action_param1` = 1 WHERE `entryorguid` = 2523901 AND `source_type` = 9 AND `id` = 3;
UPDATE `smart_scripts` SET `action_param1` = 0 WHERE `entryorguid` = 2523900 AND `source_type` = 9 AND `id` = 2;
UPDATE `smart_scripts` SET `action_param1` = 2 WHERE `entryorguid` = 32720   AND `source_type` = 0 AND `id` = 0;
DELETE FROM `creature_equip_template` WHERE `entry` = 25239 AND `id`=1;
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES 
(25239, 1, 6829, 0, 0);
DELETE FROM `trinity_string` WHERE `entry` = 5036;
INSERT INTO `trinity_string` (`entry`, `content_default`) VALUES 
(5036, 'EquipmentId: %u (Original: %u).');
-- Creature Gossip_menu_option Update from sniff
UPDATE `gossip_menu_option` SET `menu_id`=9528 WHERE `menu_id`=21250;
UPDATE `gossip_menu_option` SET `action_menu_id`=9527 WHERE `action_menu_id`=50423;
UPDATE `gossip_menu_option` SET `action_menu_id`=9521 WHERE `action_menu_id`=50424;
UPDATE `gossip_menu_option` SET `action_menu_id`=9526 WHERE `action_menu_id`=50425;
UPDATE `gossip_menu_option` SET `action_menu_id`=9525 WHERE `action_menu_id`=50426;
UPDATE `gossip_menu_option` SET `action_menu_id`=9681 WHERE `menu_id`=9680;
UPDATE `gossip_menu_option` SET `action_menu_id`=9696 WHERE `menu_id`=9695;
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9302,9303,9304,9305,9422,9461,9462,9474,9501,9532,9536,9568,9586,9594,9595,9610,9611,9612,9653,9696) AND `id`=0;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(9302,0,0, 'Worry no more, taunka. The Horde will save and protect you and your people, but first you must swear allegiance to the Warchief by taking the blood oath of the Horde.',1,1,9305,0,0,0, ''),
(9303,0,0, 'For the Horde!\r\n\r\nArm yourself from the crates that surround us and report to Agmar''s Hammer, east of here. Your first trial as a member of the Horde is to survive the journey.\r\n\r\nLok''tar ogar!',1,1,0,0,0,0, ''),
(9304,0,0, 'Then repeat after me: "Lok''tar ogar! Victory or death - it is these words that bind me to the Horde. For they are the most sacred and fundamental of truths to any warrior of the Horde.\r\n\r\nI give my flesh and blood freely to the Warchief. I am the instrument of my Warchief''s desire. I am a weapon of my Warchief''s command.\r\n\r\nFrom this moment until the end of days I live and die - For the Horde!"',1,1,9303,0,0,0, ''),
(9305,0,0, 'Yes, taunka. Retribution is a given right of all members of the Horde.',1,1,9304,0,0,0, ''),
(9422,0,0, 'I seem to have misplaced your Shredder Control Device... might you have another?',1,1,0,0,0,0, ''),
(9461,0,0, 'Greetings High Chief. Would you do me the honor of accepting my invitation to join the Horde as an official member and leader of the Taunka?',1,1,9462,0,0,0, ''),
(9462,0,0, 'It is you who honor me, High Chief. Please read from this scroll. It is the oath of allegiance.',1,1,0,0,0,0, ''),
(9474,0,1, 'Let me browse your goods.',3,128,0,0,0,0, ''),
(9501,0,0, 'Agent Skully, I need you to use the banshee''s magic mirror on me again!',1,1,9538,0,0,0, ''),
(9532,0,0, 'Your eminence, may I have a word in private?',1,1,9536,0,0,0, ''),
(9536,0,0, 'I am ready, your grace. <kiss the ring>',1,1,9535,0,0,0, ''),
(9568,0,0, 'We need to get into the fight. Are you ready?',1,1,9569,0,0,0, ''),
(9586,0,0, 'Why have I been sent back to this particular place and time?',1,1,9594,0,0,0, ''),
(9594,0,0, 'What was this decision?',1,1,9595,0,0,0, ''),
(9595,0,0, 'So how does the Infinite Dragonflight plan to interfere?',1,1,9596,0,0,0, ''),
(9610,0,0, 'What do you think they''re up to?',1,1,9611,0,0,0, ''),
(9611,0,0, 'You want me to do what?',1,1,9612,0,0,0, ''),
(9612,0,0, 'Very well, Chromie.',1,1,9613,0,0,0, ''),
(9653,0,0, 'Yes, my Prince. We are ready.',1,1,0,0,0,0, ''),
(9696,0,0, 'For Lordaeron!',1,1,0,0,0,0, '');

UPDATE `gossip_menu` SET `entry`=9350 WHERE `entry`=21238;
UPDATE `gossip_menu` SET `entry`=9136 WHERE `entry`=21243;
UPDATE `gossip_menu` SET `entry`=9151 WHERE `entry`=21244;
UPDATE `gossip_menu` SET `entry`=9474 WHERE `entry`=21245;
UPDATE `gossip_menu` SET `entry`=9528 WHERE `entry`=21250;
UPDATE `gossip_menu` SET `entry`=9527 WHERE `entry`=50423;
UPDATE `gossip_menu` SET `entry`=9521 WHERE `entry`=50424;
UPDATE `gossip_menu` SET `entry`=9526 WHERE `entry`=50425;
UPDATE `gossip_menu` SET `entry`=9525 WHERE `entry`=50426;
-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=9302 AND `text_id`=12611;
DELETE FROM `gossip_menu` WHERE `entry`=9303 AND `text_id`=12620;
DELETE FROM `gossip_menu` WHERE `entry`=9304 AND `text_id`=12619;
DELETE FROM `gossip_menu` WHERE `entry`=9305 AND `text_id`=12618;
DELETE FROM `gossip_menu` WHERE `entry`=9461 AND `text_id`=12721;
DELETE FROM `gossip_menu` WHERE `entry`=9462 AND `text_id`=12722;
DELETE FROM `gossip_menu` WHERE `entry`=9532 AND `text_id`=12846;
DELETE FROM `gossip_menu` WHERE `entry`=9535 AND `text_id`=12849;
DELETE FROM `gossip_menu` WHERE `entry`=9536 AND `text_id`=12848;
DELETE FROM `gossip_menu` WHERE `entry`=9538 AND `text_id`=12851;
DELETE FROM `gossip_menu` WHERE `entry`=9568 AND `text_id`=12899;
DELETE FROM `gossip_menu` WHERE `entry`=9569 AND `text_id`=12900;
DELETE FROM `gossip_menu` WHERE `entry`=9586 AND `text_id`=13471;
DELETE FROM `gossip_menu` WHERE `entry`=9653 AND `text_id`=13076;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(9302,12611),
(9303,12620),
(9304,12619),
(9305,12618),
(9461,12721),
(9462,12722),
(9532,12846),
(9535,12849),
(9536,12848),
(9538,12851),
(9568,12899),
(9569,12900),
(9586,13471),
(9653,13076);

-- Creature Gossip_menu_id Update from sniff
UPDATE `creature_template` SET `gossip_menu_id`=9136 WHERE `entry`=25197; -- King Mrgl-Mrgl <D.E.H.T.A.>
UPDATE `creature_template` SET `gossip_menu_id`=9151 WHERE `entry`=25326; -- Overlord Bor'gorok
UPDATE `creature_template` SET `gossip_menu_id`=9474 WHERE `entry`=25736; -- Supply Master Taz'ishi <Poison & Reagents>
UPDATE `creature_template` SET `gossip_menu_id`=9302, `npcflag`=`npcflag`|1, `AIName`='SmartAI' WHERE `entry`=26179; -- Taunka''le Refugee
UPDATE `creature_template` SET `gossip_menu_id`=9302, `npcflag`=`npcflag`|1, `AIName`='SmartAI' WHERE `entry`=26184; -- Taunka''le Refugee
UPDATE `creature_template` SET `gossip_menu_id`=9350 WHERE `entry`=26538; -- Nargo Screwbore <Durotar Zeppelin Master>
UPDATE `creature_template` SET `gossip_menu_id`=9461 WHERE `entry`=26810; -- Roanauk Icemist
UPDATE `creature_template` SET `gossip_menu_id`=9821 WHERE `entry`=27056; -- Sentinel Sweetspring <Stable Master>
UPDATE `creature_template` SET `gossip_menu_id`=9532 WHERE `entry`=27245; -- High Abbot Landgren
UPDATE `creature_template` SET `gossip_menu_id`=9528 WHERE `entry`=27425; -- Darrok
UPDATE `creature_template` SET `gossip_menu_id`=9610 WHERE `entry`=27915; -- Chromie
UPDATE `creature_template` SET `gossip_menu_id`=9656 WHERE `entry`=28126; -- Don Carlos

DELETE FROM `creature_text` WHERE `entry` IN (26179,26184);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(26179,0,0,'Victory or death! For the Horde!',14,1,100,15,0,0,'Taunka''le Refugee'),
(26184,0,0,'Victory or death! For the Horde!',14,1,100,15,0,0,'Taunka''le Refugee');

-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=14 AND `SourceGroup`=9568 AND `SourceEntry`=12899;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=14 AND `SourceGroup`=9586 AND `SourceEntry`=13471;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=9302 AND `SourceEntry`=0;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=9422 AND `SourceEntry`=0;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=9461 AND `SourceEntry`=0;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=9501 AND `SourceEntry`=0;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=9568 AND `SourceEntry`=0;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=9586 AND `SourceEntry`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,9568,12899,0,0,9,0,12372,0,0,0,0,'','Wyrmrest Defender - Show different gossip if player has taken quest Defending Wyrmrest Temple'),
(14,9586,13471,0,0,2,0,37888,1,0,0,0,'','Chromie - Show different gossip if player has item Arcane Disruptor'),
(15,9302,0,0,0,9,0,11983,0,0,0,0,'','Taunka''le Refugee - Show gossip option only if player has taken quest Blood Oath of the Horde'),
(15,9422,0,0,0,9,0,12050,0,0,0,0,'','Xink - Show gossip option only if player has taken quest Lumber Hack'),
(15,9422,0,0,0,2,0,36734,1,0,1,0,'','Xink - Show gossip option only if player has no item Xink''s Shredder Control Device'),
(15,9422,0,0,1,9,0,12052,0,0,0,0,'','Xink - Show gossip option only if player has taken quest Harp on This!'),
(15,9422,0,0,1,2,0,36734,1,0,1,0,'','Xink - Show gossip option only if player has no item Xink''s Shredder Control Device'),
(15,9461,0,0,0,9,0,12140,0,0,0,0,'','Roanauk Icemist - Show gossip option only if player has taken quest All Hail Roanauk!'),
(15,9501,0,0,0,9,0,12274,0,0,0,0,'','Agent Skully - Show gossip option only if player has taken quest A Fall From Grace'),
(15,9501,0,0,0,1,0,48761,0,0,1,0,'','Agent Skully - Show gossip option only if player has no aura Scarlet Raven Priest Image'),
(15,9501,0,0,0,1,0,48763,0,0,1,0,'','Agent Skully - Show gossip option only if player has no aura Scarlet Raven Priest Image'),
(15,9568,0,0,0,9,0,12372,0,0,0,0,'','Wyrmrest Defender - Show gossip option only if player has taken quest Defending Wyrmrest Temple'),
(15,9586,0,0,0,2,0,37888,1,0,1,0,'','Chromie - Show gossip option only if player has no item Arcane Disruptor');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (26660,27350);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (26179,26184,26660,27350) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=26179*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26179,0,0,1,62,0,100,0,9303,0,0,0,11,47029,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Taunka''le Refugee - On gossip option select - Spellcast Taunka Sworn In'),
(26179,0,1,2,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Taunka''le Refugee - On gossip option select - Close gossip'),
(26179,0,2,3,61,0,100,0,0,0,0,0,33,26179,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Taunka''le Refugee - On gossip option select - Quest credit'),
(26179,0,3,4,61,0,100,0,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Taunka''le Refugee - On gossip option select - Remove npcflag gossip'),
(26179,0,4,5,61,0,100,0,0,0,0,0,69,1,0,0,0,0,0,20,188252,20,0,0,0,0,0, 'Taunka''le Refugee - On gossip option select - Move to Recovered Horde Armaments'),
(26179,0,5,6,61,0,100,0,0,0,0,0,69,1,0,0,0,0,0,20,188253,20,0,0,0,0,0, 'Taunka''le Refugee - On gossip option select - Move to Recovered Horde Armaments'),
(26179,0,6,0,61,0,100,0,0,0,0,0,69,1,0,0,0,0,0,20,188254,20,0,0,0,0,0, 'Taunka''le Refugee - On gossip option select - Move to Recovered Horde Armaments'),
(26179,0,7,0,34,0,100,0,0,1,0,0,80,26179*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Taunka''le Refugee - On movement inform - Run script'),
(26179,0,8,9,34,0,100,0,0,2,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Taunka''le Refugee - On movement inform - Despawn'),
(26179,0,9,0,61,0,100,0,0,0,0,0,82,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Taunka''le Refugee - On gossip option select - Add npcflag gossip'),
(26184,0,0,1,62,0,100,0,9303,0,0,0,11,47029,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Taunka''le Refugee - On gossip option select - Spellcast Taunka Sworn In'),
(26184,0,1,2,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Taunka''le Refugee - On gossip option select - Close gossip'),
(26184,0,2,3,61,0,100,0,0,0,0,0,33,26179,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Taunka''le Refugee - On gossip option select - Quest credit'),
(26184,0,3,4,61,0,100,0,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Taunka''le Refugee - On gossip option select - Remove npcflag gossip'),
(26184,0,4,5,61,0,100,0,0,0,0,0,69,1,0,0,0,0,0,20,188252,20,0,0,0,0,0, 'Taunka''le Refugee - On gossip option select - Move to Recovered Horde Armaments'),
(26184,0,5,6,61,0,100,0,0,0,0,0,69,1,0,0,0,0,0,20,188253,20,0,0,0,0,0, 'Taunka''le Refugee - On gossip option select - Move to Recovered Horde Armaments'),
(26184,0,6,0,61,0,100,0,0,0,0,0,69,1,0,0,0,0,0,20,188254,20,0,0,0,0,0, 'Taunka''le Refugee - On gossip option select - Move to Recovered Horde Armaments'),
(26184,0,7,0,34,0,100,0,0,1,0,0,80,26179*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Taunka''le Refugee - On movement inform - Run script'),
(26184,0,8,9,34,0,100,0,0,2,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Taunka''le Refugee - On movement inform - Despawn'),
(26184,0,9,0,61,0,100,0,0,0,0,0,82,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Taunka''le Refugee - On gossip option select - Add npcflag gossip'),
(26660,0,0,1,62,0,100,0,9422,0,0,0,11,52872,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Xink - On gossip option select - Spellcast Forceitem Xink''s Shredder'),
(26660,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Xink - On gossip option select - Close gossip'),
(27350,0,0,0,62,0,100,0,9501,0,0,0,11,48762,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Agent Skully - On gossip option select - Spellcast A Fall from Grace: Scarlet Raven Priest Image - Master'),

(26179*100,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,20,188252,20,0,0,0,0,0, 'Taunka''le Refugee script - Turn to Recovered Horde Armaments'),
(26179*100,9,1,0,0,0,100,0,1100,1100,0,0,5,381,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Taunka''le Refugee script - Play emote'),
(26179*100,9,2,0,0,0,100,0,2500,2500,0,0,5,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Taunka''le Refugee script - Cancel emote'),
(26179*100,9,3,0,0,0,100,0,0,0,0,0,11,47024,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Taunka''le Refugee script - Spellcast Taunka Transform'),
(26179*100,9,4,0,0,0,100,0,2200,2200,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Taunka''le Refugee script - Say line'),
(26179*100,9,5,0,0,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Taunka''le Refugee script - Set run'),
(26179*100,9,6,0,0,0,100,0,4700,4700,0,0,69,2,0,0,0,0,0,8,0,0,0,3680.874,2875.829,91.52616,0, 'Taunka''le Refugee script - Move to position');
DELETE FROM `spell_area` WHERE `spell`=68132 AND `area`=4741;
INSERT INTO `spell_area` (`spell`, `area`, `autocast`) VALUES
(68132, 4741, 1);
-- Issue 8590: Damage Boss ICC
-- Lord Marrowgar
UPDATE `creature_template` SET `dmg_multiplier`=55 WHERE `entry`=36612;
UPDATE `creature_template` SET `dmg_multiplier`=85 WHERE `entry`=37957;
UPDATE `creature_template` SET `dmg_multiplier`=75 WHERE `entry`=37958;
UPDATE `creature_template` SET `dmg_multiplier`=110 WHERE `entry`=37959;
-- Lady Deathwhisper
UPDATE `creature_template` SET `dmg_multiplier`=70 WHERE `entry`=36855;
UPDATE `creature_template` SET `dmg_multiplier`=100 WHERE `entry`=38106;
UPDATE `creature_template` SET `dmg_multiplier`=90 WHERE `entry`=38296;
UPDATE `creature_template` SET `dmg_multiplier`=140 WHERE `entry`=38297;
-- Deathbringer Saurfang
UPDATE `creature_template` SET `dmg_multiplier`=60 WHERE `entry`=37813;
UPDATE `creature_template` SET `dmg_multiplier`=90 WHERE `entry`=38402;
UPDATE `creature_template` SET `dmg_multiplier`=85 WHERE `entry`=38582;
UPDATE `creature_template` SET `dmg_multiplier`=120 WHERE `entry`=38583;
-- Festergut
UPDATE `creature_template` SET `dmg_multiplier`=75 WHERE `entry`=36626;
UPDATE `creature_template` SET `dmg_multiplier`=115 WHERE `entry`=37504;
UPDATE `creature_template` SET `dmg_multiplier`=100 WHERE `entry`=37505;
UPDATE `creature_template` SET `dmg_multiplier`=150 WHERE `entry`=37506;
-- Rotface
UPDATE `creature_template` SET `dmg_multiplier`=70 WHERE `entry`=36627;
UPDATE `creature_template` SET `dmg_multiplier`=100 WHERE `entry`=38390;
UPDATE `creature_template` SET `dmg_multiplier`=90 WHERE `entry`=38549;
UPDATE `creature_template` SET `dmg_multiplier`=140 WHERE `entry`=38550;
-- Professor Putricide
UPDATE `creature_template` SET `dmg_multiplier`=60 WHERE `entry`=36678;
UPDATE `creature_template` SET `dmg_multiplier`=90 WHERE `entry`=38431;
UPDATE `creature_template` SET `dmg_multiplier`=80 WHERE `entry`=38585;
UPDATE `creature_template` SET `dmg_multiplier`=120 WHERE `entry`=38586;
-- Blood Prince Council except Keleseth who is a caster
UPDATE `creature_template` SET `dmg_multiplier`=65 WHERE `entry` IN (37970,37973);
UPDATE `creature_template` SET `dmg_multiplier`=95 WHERE `entry` IN (38401,38400);
UPDATE `creature_template` SET `dmg_multiplier`=85 WHERE `entry` IN (38784,38771);
UPDATE `creature_template` SET `dmg_multiplier`=130 WHERE `entry` IN (38785,38772);
-- Blood Queen Lana'thel
UPDATE `creature_template` SET `dmg_multiplier`=60 WHERE `entry`=37955;
UPDATE `creature_template` SET `dmg_multiplier`=90 WHERE `entry`=38434;
UPDATE `creature_template` SET `dmg_multiplier`=80 WHERE `entry`=38435;
UPDATE `creature_template` SET `dmg_multiplier`=120 WHERE `entry`=38436;
-- Sindragosa (and damage for Sindragosa 10 who hits only 1)
UPDATE `creature_template` SET `dmg_multiplier`=60, mindmg=509, maxdmg=683, attackpower=805 WHERE `entry`=36853;
UPDATE `creature_template` SET `dmg_multiplier`=90 WHERE `entry`=38265;
UPDATE `creature_template` SET `dmg_multiplier`=80 WHERE `entry`=38266;
UPDATE `creature_template` SET `dmg_multiplier`=120 WHERE `entry`=38267;
-- Flags 128+2: creature is trigger-NPC (invisible to players only) + creature does not aggro (ignore faction/reputation hostility)
UPDATE `creature_template` SET `flags_extra` = (`flags_extra`|2|128) WHERE `entry` IN (32195,32196,32197,32199);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=23 AND `SourceGroup`=12944 AND `SourceEntry` IN (20761,17051,17022,17018,17023,19444);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=23 AND `SourceGroup`=12944 AND `SourceEntry` IN (19219,17017,17025,19330,19448,17059,17060,17049,19206);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=23 AND `SourceGroup`=12944 AND `SourceEntry` IN (19220,19332,19333,19331,19449,19209,19208,19207,17053,17052);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=23 AND `SourceGroup`=12944 AND `SourceEntry` IN (19211,19210,19212,20040);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
-- Conditon rep Friendly
(23,12944,20761,0,0,5,0,59,16,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Friendly with Thorium Brotherhood'),
(23,12944,17051,0,0,5,0,59,16,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Friendly with Thorium Brotherhood'),
(23,12944,17022,0,0,5,0,59,16,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Friendly with Thorium Brotherhood'),
(23,12944,17018,0,0,5,0,59,16,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Friendly with Thorium Brotherhood'),
(23,12944,17023,0,0,5,0,59,16,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Friendly with Thorium Brotherhood'),
(23,12944,19444,0,0,5,0,59,16,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Friendly with Thorium Brotherhood'),
-- Conditon rep Honored
(23,12944,19219,0,0,5,0,59,32,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Honored with Thorium Brotherhood'),
(23,12944,17017,0,0,5,0,59,32,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Honored with Thorium Brotherhood'),
(23,12944,17025,0,0,5,0,59,32,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Honored with Thorium Brotherhood'),
(23,12944,19330,0,0,5,0,59,32,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Honored with Thorium Brotherhood'),
(23,12944,19448,0,0,5,0,59,32,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Honored with Thorium Brotherhood'),
(23,12944,17059,0,0,5,0,59,32,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Honored with Thorium Brotherhood'),
(23,12944,17060,0,0,5,0,59,32,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Honored with Thorium Brotherhood'),
(23,12944,17049,0,0,5,0,59,32,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Honored with Thorium Brotherhood'),
(23,12944,19206,0,0,5,0,59,32,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Honored with Thorium Brotherhood'),
-- Conditon rep Revered
(23,12944,19220,0,0,5,0,59,64,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Revered with Thorium Brotherhood'),
(23,12944,19332,0,0,5,0,59,64,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Revered with Thorium Brotherhood'),
(23,12944,19333,0,0,5,0,59,64,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Revered with Thorium Brotherhood'),
(23,12944,19331,0,0,5,0,59,64,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Revered with Thorium Brotherhood'),
(23,12944,19449,0,0,5,0,59,64,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Revered with Thorium Brotherhood'),
(23,12944,19209,0,0,5,0,59,64,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Revered with Thorium Brotherhood'),
(23,12944,19208,0,0,5,0,59,64,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Revered with Thorium Brotherhood'),
(23,12944,19207,0,0,5,0,59,64,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Revered with Thorium Brotherhood'),
(23,12944,17053,0,0,5,0,59,64,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Revered with Thorium Brotherhood'),
(23,12944,17052,0,0,5,0,59,64,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Revered with Thorium Brotherhood'),
-- Conditon rep Exalted 
(23,12944,19211,0,0,5,0,59,128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Exalted with Thorium Brotherhood'),
(23,12944,19210,0,0,5,0,59,128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Exalted with Thorium Brotherhood'),
(23,12944,19212,0,0,5,0,59,128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Exalted with Thorium Brotherhood'),
(23,12944,20040,0,0,5,0,59,128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Exalted with Thorium Brotherhood');
-- Fix quest: Gather the Orbs http://www.wowhead.com/quest=10859
-- ID indexes
-- Almost all is based on Untaught script, just corrected some stuff with sniff
SET @OrbCollectingTotem := 22333;
SET @LightOrb           := 20635;
SET @Script :=   @LightOrb * 100;
SET @BanishedState :=      32566;
SET @ArcaneExplosion :=    35426; -- such spells need delay to execute properly, that is why I made actionlist
-- Update templates
UPDATE `creature_template` SET `unit_flags`=unit_flags|0x02000000 WHERE `entry`=@LightOrb; -- sniff
-- Add SAI support for Light Orbs and Totem
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@LightOrb;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@LightOrb,@OrbCollectingTotem);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@LightOrb,@OrbCollectingTotem) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@Script AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@OrbCollectingTotem,0,0,1,54,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,@LightOrb,20,0,0,0,0,0, 'Orb collecting totem - On spawned - Set Data 0 1'),
(@OrbCollectingTotem,0,1,2,61,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Orb collecting totem - Linked with previous event - Store invoker'),
(@OrbCollectingTotem,0,2,0,61,0,100,0,0,0,0,0,100,1,0,0,0,0,0,19,@LightOrb,20,0,0,0,0,0, 'Orb collecting totem - Linked with previous event - Send stored target list 1'),
(@LightOrb,0,0,0,25,0,100,1,0,0,0,0,11,@BanishedState,0,0,0,0,0,1,0,0,0,0,0,0,0, 'On spawn/reset - Cast Purple Banish State'),
(@LightOrb,0,1,0,38,0,100,0,0,1,30000,30000,69,1,0,0,0,0,0,19,@OrbCollectingTotem,20,0,0,0,0,0, 'Light Orb - On Data Set 0 1 - Move to totem'),
(@LightOrb,0,2,3,34,0,100,1,8,1,0,0,11,@ArcaneExplosion,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Light Orb - On point 1 reached - Cast arcane explosion'),
(@LightOrb,0,3,4,61,0,100,0,0,0,0,0,33,21929,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Light Orb - Linkedw with previous event - Call kill credit'),
(@LightOrb,0,4,0,61,0,100,0,0,0,0,0,80,@Script,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Light Orb - Linkedw with previous event - Start action list to display arcase explosion'),
(@Script,9,0,0,0,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Light Orb - Action 0 - Set unseen'),
(@Script,9,1,0,0,0,100,0,0,0,0,0,41,100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Light Orb - Action 1 - Despawn in 100 ms');
-- Remove deprecated required spell cast that was blocking the credit, on top of that it had some nosense spell that has nothing to do with quest?!
UPDATE `quest_template` SET `requiredspellcast1`=0 WHERE `id`=10859;
ALTER TABLE `creature` CHANGE `equipment_id` `equipment_id` tinyint(3) signed NOT NULL DEFAULT '0';
ALTER TABLE `creature_equip_template` CHANGE `id` `id` tinyint(3) unsigned NOT NULL DEFAULT '0';
ALTER TABLE `game_event_model_equip` CHANGE `equipment_id` `equipment_id` tinyint(3) unsigned NOT NULL DEFAULT '0';

UPDATE `creature` SET `equipment_id`=0 WHERE `id` NOT IN (SELECT `entry` FROM `creature_equip_template`);

-- content
DELETE FROM `creature_equip_template` WHERE `entry` IN (25317, 2110, 26797, 25239) AND `id`=1;
DELETE FROM `creature_equip_template` WHERE `entry` IN (32720) AND `id`=2;
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(25317, 1, 2178, 143, 0),
(2110, 1, 24324, 24324, 24319),
(26797, 1, 19970, 0, 0),
(25239, 1, 6829, 0, 0),
(32720, 2, 31308, 0, 0);

UPDATE `creature` SET `equipment_id`=0 WHERE `guid` IN (200908,200918,200968,200971,200980,200998,201004,201035,201050,201052,201068,201094,201103,201112,201113,201135,201149,201150,201192,201203,201206,201363,201438,201449,201486,201685,201710,201722,201740,201752,201756,201773,201782,201788,201814,201864,201908,201916,202023,202043,202146,202164,39317,39318,39319,39320,39321,39322,39323,39324,39325,39326,39327,39328,39329,39330,39331,39332,39333,40170,40171,40227,40563,40564,41319,41322,41323,41324,41325,41326,41327,41328,41669,41726,42616,42641,42668,42669,42680,42686,44193,44194,46975,47413,47414,47415,47416,47417,47418,47419,47420,47421,47422,47423,47424,47425,47426,47427,47428,47429,47430,47431,47445,47632,48383,49987,51458,51751,51982,51983,52926,52927,52928,52929,53166,53651,53844,53845,53846,53847,53848,53849,53850,53851,53951,57315,68749,68750,68751,68752,68753,76521,79676,79725,79758,79759,79760,79761,79762,79763,79764,117784,117785,117788,117789,117790,117796,117797,117798,117799,117800,117801,117802,112352,112353,112354,112355,112356,112357,112358,112359,112360,112361,112362,112363,112364,112365,112366,112367,112368,112371,112372);

-- 25317
UPDATE `creature` SET `equipment_id`=1 WHERE `guid` IN (117794);

-- 2110
UPDATE `creature` SET `equipment_id`=1 WHERE `guid` IN (102345,102347,102348,125999,126000,126001,126002,126003,126004,126005,126006,126007,126008,126009,126010,126011,126012,126013,126014,126015,126016,126095,126096,126097,126098,126099,126100,126101,126724,126725,126726,126727,126729,126730,126731,127489,127490,127491,127492,131859,131860,131861,131862,131863,13354,13355,13356,13357,16230,16231,16232,16233,16234,16235,16236,18316,18392,28779,28781,28782,31778,31779,31965,31973,32010,32011,4212,4214,4215,4227,42676,42683,42708,42714,42726,4274,42793,4286,4310,4313,4352,4358,4408,45397,45398,45399,45403,46795,46796,46799,46810,46860,46861,47175,47182,47184,47980,47981,47988,48220,48263,48265,48909,4939,5031,5191,52670,53043,53116,53119,53181,6007,6049,6050,6051,6056,6057,6058,6076,86393,86394,87158,87161,87163,87164,87165,87168,87225,87234,87236,87252);

-- 26797
UPDATE `creature` SET `equipment_id`=1 WHERE `guid` IN (112351, 112369, 112370);

UPDATE `smart_scripts` SET `action_param1` = 1 WHERE `entryorguid` = 2523900 AND `source_type` = 9 AND `id` = 2;
UPDATE `smart_scripts` SET `action_param1` = 0 WHERE `entryorguid` = 2523901 AND `source_type` = 9 AND `id` = 3;
UPDATE `smart_scripts` SET `action_param1` = 2 WHERE `entryorguid` = 32720   AND `source_type` = 0 AND `id` = 0;
DELETE FROM `gameobject` WHERE `guid`=61090;
DELETE FROM `areatrigger_teleport` WHERE `id`=5148;
INSERT INTO `areatrigger_teleport` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `name`) VALUES
(5148, 1, -8756.6, -4457.02, -200.481, 1.39626, 'CoT Stratholme - Exit Target');
DROP TABLE IF EXISTS `creature_summon_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creature_summon_groups` (
  `summonerId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `summonerType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `groupId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `summonType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `summonTime` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DELETE FROM `areatrigger_scripts` WHERE `entry`=5173;
INSERT INTO `areatrigger_scripts`(`entry`,`ScriptName`) VALUE
(5173,'at_frostgrips_hollow');
DELETE FROM `smart_scripts` WHERE `entryorguid`=29861 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`source_type`,`event_type`,`action_type`,`action_param1`,`action_param2`,`target_type`,`comment`) VALUES
(29861,0,54,80,2986100,2,1,'Stormforged Eradictor - Just summoned - Call timed actionlist 2986100');

DELETE FROM `smart_scripts` WHERE `entryorguid`=2986100 AND `source_type`=9;
INSERT INTO `smart_scripts`(`entryorguid`,`source_type`,`id`,`event_param1`,`event_param2`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`target_type`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUE
(2986100,9,0,10000,10000,12,29729,4,10000,8,6972.13,14.24,805.79,3.349,'Stormforged Eradictor - Timed actionlist - Summon Frostborn Axemaster');
DELETE FROM `waypoint_data` WHERE `id`=2986200;
INSERT INTO `waypoint_data`(`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(2986200,0,6963.95,45.65,818.71),
(2986200,1,6965.09,39.67,820.15),
(2986200,2,6963.56,21.14,805.79);

DELETE FROM `waypoint_data` WHERE `id`=2986100;
INSERT INTO `waypoint_data`(`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(2986100,0,6983.18,7.150,806.33),
(2986100,1,6975.37,16.73,804.98),
(2986100,2,6967.15,13.27,806.56);
UPDATE `creature_template` SET `faction_A`=1954,`faction_H`=1954,`AIName`='SmartAI' WHERE `entry`=29861;
UPDATE `creature_template` SET `faction_A`=1954,`faction_H`=1954 WHERE `entry`=29862;
DELETE FROM `command` WHERE `name` = 'reload creature_summon_groups';
INSERT INTO `command` (`name`,`security`,`help`) VALUES
('reload creature_summon_groups',3,'Syntax: .reload creature_summon_groups
Reload creature_summon_groups table.');
DELETE FROM `smart_scripts` WHERE `entryorguid`=29861 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`source_type`,`id`,`event_type`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`target_type`,`comment`) VALUES
(29861,0,0,54,0,0,0,0,80,2986100,2,1,'Stormforged Eradictor - Just summoned - Call timed actionlist 2986100'),
(29861,0,1,0,3000,7000,14000,18000,11,56352,0,2,'Stormforged Eradictor - Cast Storm Punch'),
(29861,0,2,0,9000,12000,13000,18000,11,15588,0,0,'Stormforged Eradictor - Cast Thunderclap');
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=29861;
UPDATE `areatrigger_teleport` SET `target_position_x`=728.055,`target_position_y`= 1329.03,`target_position_z`=275,`target_orientation`=5.51524 WHERE `id`=5290; -- The Eye of Eternity (entrance)
DELETE FROM `command` WHERE `name` = 'reload rbac';
INSERT INTO `command` (`name`,`security`,`help`) VALUES
('reload rbac',3,'Syntax: .reload rbac\nReload rbac system.');
-- Add spell script names
DELETE FROM `spell_script_names` WHERE `spell_id` IN (56046,56047,61693,61694,57459,56438,61210,56397,58842,59084,59099,56070,56072,60936,60939,61028,61023);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(56046, 'spell_malygos_portal_beam'),
(56047, 'spell_malygos_random_portal'),
(61693, 'spell_malygos_arcane_storm'), -- Phase I /10/
(61694, 'spell_malygos_arcane_storm'), -- Phase I /25/
(57459, 'spell_malygos_arcane_storm'), -- Phase III
(56438, 'spell_arcane_overload'),
(61210, 'spell_nexus_lord_align_disk_aggro'),
(56397, 'spell_scion_of_eternity_arcane_barrage'),
(58842, 'spell_malygos_destroy_platform_channel'),
(59084, 'spell_alexstrasza_bunny_destroy_platform_boom_visual'),
(59099, 'spell_alexstrasza_bunny_destroy_platform_event'),
(56070, 'spell_wyrmrest_skytalon_summon_red_dragon_buddy'),
(56072, 'spell_wyrmrest_skytalon_ride_red_dragon_buddy_trigger'),
(60936, 'spell_malygos_surge_of_power_25'),
(60939, 'spell_malygos_surge_of_power_warning_selector_25'),
(61028, 'spell_alexstrasza_gift_beam'),
(61023, 'spell_alexstrasza_gift_beam_visual');

-- Add spell difficulties
DELETE FROM `spelldifficulty_dbc` WHERE `id` IN (61693,56272,57058);
INSERT INTO `spelldifficulty_dbc` (`id`,`spellid0`,`spellid1`,`spellid2`,`spellid3`) VALUES
(61693,61693,61694,0,0), -- Arcane Storm - Phase I
(56272,56272,60072,0,0), -- Arcane Breath
(57058,57058,60073,0,0); -- Arcane Shock (Nexus Lord)

-- Insert missing creature template addon
DELETE FROM `creature_template_addon` WHERE `entry` IN (28859,30234,30248,32295,30592,31748,31749);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(28859,0,0,0x1000000|0x2000000,0x1,0, ''), -- Malygos
(30234,0,0,0x1000000|0x2000000,0x1,0, '43775'), -- Hover Disk (Nexus Lord), add aura "Flight"
(30248,0,0,0x1000000|0x2000000,0x1,0, '43775'), -- Hover Disk (Scion of Eternity), add aura "Flight"
(31748,0,0,0x1000000|0x2000000,0x1,0, '43775'), -- Hover Disk Difficulty (Nexus Lord), add aura "Flight"
(31749,0,0,0x1000000|0x2000000,0x1,0, '43775'), -- Hover Disk Difficulty (Scion of Eternity), add aura "Flight"
(32295,0,0,0x1000000|0x2000000,0x1,0, ''), -- Alexstrasza
(30592,0,0,0x1000000|0x2000000,0x1,0, '57428'); -- Static Field bunny

-- Add, restructure and update missing texts and sounds
DELETE FROM `creature_text` WHERE `entry` IN (28859,32295);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(28859,0,0, 'Lesser beings, intruding here! A shame that your excess courage does not compensate for your stupidity!',14,0,100,0,10000,14512,'Malygos - Intro'),
(28859,0,1, 'None but the blue dragonflight are welcome here. Perhaps this is the work of Alexstrasza? Well, then, she has sent you to your deaths!',14,0,100,0,11000,14513,'Malygos - Intro'),
(28859,0,2, 'What could you hope to accomplish? To storm brazenly into my domain... to employ magic... against ME?',14,0,100,0,13000,14514,'Malygos - Intro'),
(28859,0,3, 'I am without limits here. The rules of your cherished reality do not apply. In this realm, I am in control!',14,0,100,0,10000,14515,'Malygos - Intro'),
(28859,0,4, 'I give you one chance. Pledge fealty to me, and perhaps I will not slaughter you for your insolence.',14,0,100,0,7000,14516,'Malygos - Intro'),
(28859,1,0, 'My patience has reached its limit, I will be rid of you!',14,0,100,0,4000,14517,'Malygos - Start phase 1'),
(28859,2,0, 'You will not succeed while I draw breath!',14,0,100,0,3000,14518,'Malygos - Begin to cast Deep Breath'),
(28859,3,0, 'Your stupidity has finally caught up to you!',14,0,100,0,3250,14519,'Malygos - Killed Player (Phase 1)'),
(28859,3,1, 'More artifacts to confiscate...',14,0,100,0,2800,14520,'Malygos - Killed Player (Phase 1)'),
(28859,3,2, 'How very naive.',14,0,100,0,4800,14521,'Malygos - Killed Player (Phase 1)'),
(28859,4,0, 'I had hoped to end your lives quickly, but you have proven more... resilient than I anticipated. Nonetheless, your efforts are in vain. It is you reckless, careless mortals who are to blame for this war. I do what I must, and if it means your extinction.... then SO BE IT!!',14,0,100,0,22900,14522,'Malygos - End Phase One'),
(28859,5,0, 'Few have experienced the pain I will now inflict upon you!',14,0,100,0,5500,14523,'Malygos - Start phase 2'), -- Unused by Blizzard for some reason
(28859,6,0, 'I will teach you IGNORANT children just how little you know of magic...',14,0,100,0,7000,14524,'Malygos - Anti-Magic Shell'),
(28859,7,0, 'Watch helplessly as your hopes are swept away...',14,0,100,0,4000,14525,'Malygos - Magic Blast'),
(28859,8,0, 'Your energy will be put to good use!',14,0,100,0,2000,14526,'Malygos - Killed Player (Phase 2)'),
(28859,8,1, 'I am the spell-weaver! My power is infinite!',14,0,100,0,5200,14527,'Malygos - Killed Player (Phase 2)'),
(28859,8,2, 'Your spirit will linger here forever!',14,0,100,0,3800,14528,'Malygos - Killed Player (Phase 2)'),
(28859,9,0, 'ENOUGH! If you intend to reclaim Azeroth''s magic, then you shall have it...',14,0,100,0,7000,14529,'Malygos - End Phase 2'),
(28859,10,0, 'Now your benefactors make their appearance... But they are too late. The powers contained here are sufficient to destroy the world ten times over! What do you think they will do to you?',14,0,100,0,13000,14530,'Intro Phase 3'),
(28859,11,0, 'SUBMIT!',14,0,100,0,1000,14531,'Malygos - Start phase 3'), -- Unused by Blizzard for some reason
(28859,12,0, 'Malygos takes a deep breath.',41,0,100,0,10000,0,'Malygos - Surge of Power warning (Phase 2)'),
(28859,13,0, 'The powers at work here exceed anything you could possibly imagine!',14,0,100,0,5000,14532,'Malygos - Surge of Power'),
(28859,14,0, 'I AM UNSTOPPABLE!',14,0,100,0,2000,14533,'Malygos - Buffed by a spark'),
(28859,15,0, 'Alexstrasza! Another of your brood falls!',14,0,100,0,3600,14534,'Malygos - Killed Player (Phase 3)'),
(28859,15,1, 'Little more then gnats!',14,0,100,0,2650,14535,'Malygos - Killed Player (Phase 3)'),
(28859,15,2, 'Your red allies will share your fate...',14,0,100,0,3000,14536,'Malygos - Killed Player (Phase 3)'),
(28859,16,0, 'Still standing? Not for long...',14,0,100,0,3600,14537,'Malygos - Spell Casting 1(Phase 3)'),
(28859,16,1, 'Your cause is lost!',14,0,100,0,2000,14538,'Malygos - Spell Casting 2 (Phase 3)'),
(28859,16,2, 'Your fragile mind will be shattered!',14,0,100,0,4000,14539,'Malygos - Spell Casting 3 (Phase 3)'),
(28859,17,0, 'Unthinkable! The mortals will destroy... everything! My sister, what have you...',14,0,100,0,8500,14540,'Malygos - Death'),
(28859,18,0, '%s fixes his eyes on you!',42,0,100,0,3000,0,'Malygos - Surge of Power warning (Phase 3)'),
(28859,19,0, '%s goes into a berserker rage!',41,0,100,0,10000,0,'Malygos - Hit berserk timer (Any phase)'),
(32295,0,0, 'I did what I had to, brother. You gave me no alternative.',14,0,100,0,4000,14406,'Alexstrasza - Yell text 1'),
(32295,1,0, 'And so ends the Nexus War.',14,0,100,0,4000,14407,'Alexstrasza - Yell text 2'),
(32295,2,0, 'This resolution pains me deeply, but the destruction, the monumental loss of life had to end. Regardless of Malygos''s recent transgressions, I will mourn his loss. He was once a guardian, a protector. This day, one of the world''s mightiest has fallen.',14,0,100,0,24000,14408,'Alexstrasza - Yell text 3'),
(32295,3,0, 'The red dragonflight will take on the burden of mending the devastation wrought on Azeroth. Return home to your people and rest. Tomorrow will bring you new challenges, and you must be ready to face them. Life... goes on.',14,0,100,0,22000,14409,'Alexstrasza - Yell text 4');
-- Update wrong sound and add duration for Power Sparks warning
UPDATE `creature_text` SET `duration`=10000,`sound`=0 WHERE `entry`=30084 AND `groupid`=0 AND`id`=0;

-- Add conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (56047,58846,61028,56429,56505,59099,61714,61715,57432,57429,61210,56548,56431,56438);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,56047,0,0,31,0,3,30118,0,0,0,0,'', 'Random Portal can implicitly hit only Portal (Malygos)'),
(13,1,56047,0,0,29,0,28859,30,0,1,0,0,'', 'Random Portal can implicitly hit only target that is not in 30 yards near Malygos'),
(13,1,58846,0,0,32,0,0x0010,0,0,0,0,0,'', 'Summon Red Dragon Buddy force cast can implicitly hit only players'),
(13,1,61028,0,0,31,0,3,32448,0,0,0,0,'', 'Alexstrasza''s Gift Beam can hit only Alexstrasza''s Gift'),
(13,1,56429,0,0,31,0,3,31253,0,0,0,0,'', 'Summon Arcane Bomb can hit only Alexstrasza the Life-Binder (bunny)'),
(13,1,56505,0,0,31,0,3,30334,0,0,0,0,'', 'Surge of Power (phase II) can hit only Surge of Power'),
(13,1,56548,0,0,31,0,3,30234,0,1,0,0,'', 'Surge of Power triggered damage spell (phase II) can''t hit melee Hover Disk'),
(13,3,56431,0,0,31,0,3,30234,0,1,0,0,'', 'Arcane Overload damage and knockback spell can''t hit melee Hover Disk'),
(13,1,56438,0,0,1,0,1,56438,0,1,0,0,'', 'Arcane Overload damage reduce aura can''t apply to target that already is affected by such'),
(13,6,59099,0,0,32,0,0x0010,0,0,0,0,0,'', 'Destroy Platform Event effect 1 and 2 can hit only players'),
(13,7,61714,0,0,31,0,3,30245,0,0,0,0,'', 'Berserk (spell 2) can hit Nexus Lord'),
(13,7,61714,0,1,31,0,3,30249,0,0,0,0,'', 'Berserk (spell 2) can hit Scion of Eternity'),
(13,7,61715,0,0,31,0,3,30592,0,0,0,0,'', 'Berserk (spell 3) can hit Static Field bunny'),
(13,1,57432,0,0,31,0,3,30161,0,0,0,0,'', 'Arcane Pulse can hit only drakes'),
(13,3,57429,0,0,31,0,3,30161,0,0,0,0,'', 'Static Field can hit only drakes'),
(13,1,61210,0,0,33,1,0,4,0,0,0,0,'', 'Align Disk Aggro can only hit the vehicle of the passenger caster');

-- Add missing equipment
DELETE FROM `creature_equip_template` WHERE `entry` IN (30245,31750,30249,31751);
INSERT INTO `creature_equip_template` (`entry`,`id`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES
(30245,1,30714,0,0), -- Nexus Lord
(31750,1,30714,0,0), -- Nexus Lord (Difficulty)
(30249,1,29107,0,0), -- Scion of Eternity
(31751,1,29107,0,0); -- Scion of Eternity (Difficulty)

-- Update accessories of hover disks to die with the vehicle and have lower despawn time. They should fall from hover disks,
-- and despawn after 5 sec, but for some reason they keep staying standing while dead. This needs to be fixed coreside.
UPDATE `vehicle_template_accessory` SET `minion`=1,`summontype`=6,`summontimer`=1000 WHERE `entry`=30234 AND `seat_id`=0;
UPDATE `vehicle_template_accessory` SET `minion`=1,`summontype`=6,`summontimer`=1000 WHERE `entry`=30248 AND `seat_id`=0;

-- Add flag GO not selectable for both and extra condition for Heart of Magic
UPDATE `gameobject_template` SET `flags`=16 WHERE `entry`=193967; -- Alexstrasza Gift
UPDATE `gameobject_template` SET `flags`=20 WHERE `entry`=194159; -- Heart of Magic

-- Add some gameobject data update
UPDATE `gameobject` SET `animprogress`=255,`spawntimesecs`=300 WHERE `guid` IN (151791,193960); -- that spawn time has no influence, but having different values doesn't look correct

-- Delete static GO spawns of Alexstrasza's Gift Boxes, they are dynamic (10/25)
DELETE FROM `gameobject` WHERE `guid` IN (151792,151793);

-- Add map difficulty checks for achievement "Denyin the Scion"
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (7573,7574) AND `type`=12;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`) VALUES
(7573,12,0), -- 10 mode
(7574,12,1); -- 25 mode

-- Delete Nexus Lords SAI script, because of incapacity to handle the combat spell mechanic of Arcane Shock correctly
-- Delete Scions of Eternity SAI script, because of incapacity to handle non reactive AI when being attacked in a way it won't bug other encounter mechanics.
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (30245,30249) AND `source_type`=0;

-- Add SAI support for Alexstrasza since is only short timed event after boss mechanic ends
SET @NPC_ALEXSTRASZA  := 32295;
SET @ACTIONLIST       := @NPC_ALEXSTRASZA * 100;
SET @SPELL_GIFT_BEAM  := 61028;

UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=@NPC_ALEXSTRASZA;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@NPC_ALEXSTRASZA AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ACTIONLIST AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_ALEXSTRASZA,0,0,0,54,0,100,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,788.07,1276.09,246.9,0,'Alexstrasza - On just summoned - Move to pos'),
(@NPC_ALEXSTRASZA,0,1,0,34,0,100,0,8,1,0,0,80,@ACTIONLIST,2,0,0,0,0,1,0,0,0,0,0,0,0,'Alexstrasza - On point 1 reached - Start actionlist'),
(@ACTIONLIST,9,0,0,0,0,100,0,0,0,0,0,11,@SPELL_GIFT_BEAM,0,0,0,0,0,1,0,0,0,0,0,0,0,'Alexstrasza - Action 0 - Cast Gift Beam'),
(@ACTIONLIST,9,1,0,0,0,100,0,4000,4000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Alexstrasza - Action 1 - Yell 0'),
(@ACTIONLIST,9,2,0,0,0,100,0,6000,6000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Alexstrasza - Action 2 - Yell 1'),
(@ACTIONLIST,9,3,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Alexstrasza - Action 3 - Yell 2'),
(@ACTIONLIST,9,4,0,0,0,100,0,24000,24000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Alexstrasza - Action 4 - Yell 3');

-- Add areatrigger script for the improvised platform that is killing/rooting falling players
DELETE FROM `areatrigger_scripts` WHERE `entry`=5342;
INSERT INTO `areatrigger_scripts` (`entry`,`ScriptName`) VALUES
(5342, 'at_eye_of_eternity_improvised_floor');

-- /////////////// Various misc in creature, creature template and creature addon ///////////////
-- Update some guids spawn positions
UPDATE `creature` SET `position_x`=754.362,`position_y`=1301.61,`position_z`=266.171,`orientation`=4.24115 WHERE `guid`=132302; -- Alexstrasza the Life-Binder (Bunny)
UPDATE `creature` SET `position_x`=747.61,`position_y`=1393.43,`position_z`=295.9722,`orientation`=3.03832 WHERE `guid`=132313; -- Malygos

-- Update some creature guids to be have static MovementType and spawn dist to 0 accordingly
UPDATE `creature` SET `spawndist`=0,`MovementType`=0 WHERE `guid` IN
(132313, -- Malygos
132314, -- Alexstrasza''s Gift Bunny
132302); -- Alexstrasza the Life-Binder (Bunny)

-- Update template to InhabitType "Air" for various creatures
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` IN (28859,31734,30245,31750,30249,31751,32295,32448);

-- Clear scripts names for Alexstrasza the Life-Binder (Bunny)
UPDATE `creature_template` SET `AIName`='',`ScriptName`='' WHERE `entry`=31253;

--  Update Portal (Malygos) initial flags before the encounter starts
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|0x00000100|0x02000000,`flags_extra`=128 WHERE `entry`=30118; -- Immunity to Players + Not selectable

-- Update flags extra to trigger & civilian for Static Field and add script name
UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_static_field',`flags_extra`=130 WHERE `entry`=30592;

-- Update flags extra to extra trigger & extra civilian for Alexstrasza Bunny
UPDATE `creature_template` SET `flags_extra`=130, `ScriptName`='' WHERE `entry`=31253;

-- Remove uneeded creature_addon data
DELETE FROM `creature_addon` WHERE `guid` IN
(30592, -- The spawn for Static Field is dynamique, so not fixed guid.
132313); -- Malygos is boss so is unique and needs only the template addon.

-- Update templates for both types of hover disks
UPDATE `creature_template` SET `faction_A`=14,`faction_H`=14,`VehicleId`=223,`InhabitType`=4 WHERE `entry` IN (30248,31749); -- Hover disk for Scions
UPDATE `creature_template` SET `ScriptName`='npc_caster_hover_disk' WHERE `entry`=30248;
UPDATE `creature_template` SET `faction_A`=14,`faction_H`=14,`InhabitType`=4 WHERE `entry` IN (30234,31748); -- Hover disk for Nexus Lords
UPDATE `creature_template` SET `ScriptName`='npc_melee_hover_disk' WHERE `entry`=30234;
UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_nexus_lord' WHERE `entry`=30245; -- Nexus Lord
UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_scion_of_eternity' WHERE `entry`=30249; -- Scion of Eternity

-- Fix model display for Vortex Triggers (in creature handling).
-- Remove extra trigger flag because for some reason it was bugging model displaying as always visible,
-- since it has the invisible one for triggers first and other as second, this is the only nonhacky way (don't try to change it unless core side != c++ hack in instance script)
UPDATE `creature_template` SET `flags_extra`=flags_extra &~ 0x00000080 WHERE `entry`=30090;
UPDATE `creature` SET `modelid`=11686 WHERE `guid` BETWEEN 132304 AND 132308;
-- Add missing generic spell for opening chests for most of Blood Elf's classes
-- (was preventing them to loot Eye of Eternity Alexstrasza's Gift Box, Heart of Magic and maybe more.)
DELETE FROM `playercreateinfo_spell` WHERE `race`=10 AND `Spell`=61437;
INSERT INTO `playercreateinfo_spell` (`race`,`class`,`Spell`,`Note`) VALUES
(10,2,61437, 'Opening'),
(10,3,61437, 'Opening'),
(10,4,61437, 'Opening'),
(10,5,61437, 'Opening'),
(10,6,61437, 'Opening'),
(10,8,61437, 'Opening'),
(10,9,61437, 'Opening');
SET @ELM_BUNNY        :=23837;
SET @SHADOW_CULTIST   :=30835;
SET @VARDMADRA        :=30836;
SET @LK_EYE           :=192861;
SET @CREDIT           :=57884;
SET @SUMMON_CULTIST   :=57885;
SET @GOSSIP_CAST      :=57888;
SET @LK_EYE_CAST      :=57889;
SET @SUMMON_VARDMADRA :=57891;

DELETE FROM `creature_text` WHERE `entry` IN (@ELM_BUNNY,@VARDMADRA,@SHADOW_CULTIST);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@ELM_BUNNY, 0, 0, 'Scrying upon many insignificant situations within Icecrown, you stumble upon something interesting...', 42, 0, 100, 0, 0, 0, 'Eye of Lich King Ambient'),
(@SHADOW_CULTIST, 0, 0, 'My lady.', 12, 0, 100, 0, 0, 0, 'Shadow Cultist'),
(@SHADOW_CULTIST, 1, 0, 'There is word from Jotunheim. The sleep-watchers there believe that they have found someone of significance.', 12, 0, 100, 0, 0, 0, 'Shadow Cultist'),
(@SHADOW_CULTIST, 2, 0, 'The cultist practically sputters.', 16, 0, 100, 0, 0, 0, 'Shadow Cultist'),
(@SHADOW_CULTIST, 3, 0, 'Look like, my lady? A vrykul, I suppose. They did not actually show him to me. Ever since The Shadow Vault....', 12, 0, 100, 0, 0, 0, 'Shadow Cultist'),
(@SHADOW_CULTIST, 4, 0, 'A name? Oh, yes, the name! I believe it was Iskalder.', 12, 0, 100, 0, 0, 0, 'Shadow Cultist'),
(@SHADOW_CULTIST, 5, 0, 'Right away, my lady.', 12, 0, 100, 2, 0, 0, 'Shadow Cultist'),
(@VARDMADRA, 0, 0, 'Report.', 12, 0, 100, 1, 0, 0, 'Vardmadra'),
(@VARDMADRA, 1, 0, 'Describe this vrykul. What does he look like?', 12, 0, 100, 1, 0, 0, 'Vardmadra'),
(@VARDMADRA, 2, 0, 'I am not interested in excuses. Perhaps they gave you a name?', 12, 0, 100, 1, 0, 0, 'Vardmadra'),
(@VARDMADRA, 3, 0, 'Iskalder?! You fool! Have you no idea who that is? He''s only the greatest vrykul warrior who ever lived!', 12, 0, 100, 1, 0, 0, 'Vardmadra'),
(@VARDMADRA, 4, 0, 'Return to Jotunheim and tell them to keep him asleep until I arrive. I will judge this vrykul with my own eyes.', 12, 0, 100, 1, 0, 0, 'Vardmadra');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=57889;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(57889,57891,0,'On spellcast Using the Eye of the Lich King cast Through the Eye: Summon Image of Vardmadra'),
(57889,57885,0,'On spellcast Using the Eye of the Lich King cast Through the Eye: Summon Image of a Shadow Cultist');

DELETE FROM `spell_scripts` WHERE `id`=57884;
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(57884,1,0,14,57889,0,0,0,0,0,0);

UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=@LK_EYE;
DELETE FROM `smart_scripts` WHERE `source_type`=1 AND `entryorguid`=@LK_EYE;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@LK_EYE, 1, 0, 1, 62, 0, 100, 0, 10005, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Eye of the Lich King - On gossip select - Close gossip'),
(@LK_EYE, 1, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 85, @GOSSIP_CAST, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Eye of the Lich King - On gossip select - Invoker Spellcast Through the Eye: Eye of the Lich King Gossip Force Cast'),
(@LK_EYE, 1, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 19, @ELM_BUNNY, 10, 0, 0, 0, 0, 0, 'Eye of the Lich King - On gossip select - Set data 0 1 Elm General Purpose Bunny');

UPDATE `creature_template` SET `AIName`='SmartAI',`minlevel`=80,`maxlevel`=80,`exp`=2,`faction_A`=1610,`faction_H`=1610,`unit_flags`=33544, `HoverHeight`=6 WHERE `entry`=@VARDMADRA;
UPDATE `creature_template` SET `AIName`='SmartAI',`minlevel`=80,`maxlevel`=80,`exp`=2,`faction_A`=1610,`faction_H`=1610,`unit_flags`=33544 WHERE `entry`=@SHADOW_CULTIST;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (-121192,@VARDMADRA,@SHADOW_CULTIST);
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@SHADOW_CULTIST*100;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(-121192, 0, 0, 0, 38, 0, 100, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 21, 20, 0, 0, 0, 0, 0, 0, 'Elm General Purpose Bunny - On data set 0 1 - Say line'),
(@SHADOW_CULTIST, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6828.99, 3814.678, 621.0696, 0, 'Shadow Cultist - Just summoned - Move to position'),
(@SHADOW_CULTIST, 0, 1, 2, 34, 0, 100, 0, 0, 1, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, @VARDMADRA, 10, 0, 0, 0, 0, 0, 'Shadow Cultist - On movement inform - Turn to Image of Vardmadra'),
(@SHADOW_CULTIST, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @SHADOW_CULTIST*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shadow Cultist - On movement inform - Run script'),
(@VARDMADRA, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, @SHADOW_CULTIST, 30, 0, 0, 0, 0, 0, 'Image of Vardmadra - Just summoned - Turn to Shadow Cultist'),
(@VARDMADRA, 0, 1, 0, 38, 0, 100, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Image of Vardmadra - On data set 0 1 - Say line'),
(@VARDMADRA, 0, 2, 0, 38, 0, 100, 0, 0, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Image of Vardmadra - On data set 0 2 - Say line'),
(@VARDMADRA, 0, 3, 0, 38, 0, 100, 0, 0, 3, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Image of Vardmadra - On data set 0 3 - Say line'),
(@VARDMADRA, 0, 4, 0, 38, 0, 100, 0, 0, 4, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Image of Vardmadra - On data set 0 4 - Say line'),
(@VARDMADRA, 0, 5, 0, 38, 0, 100, 0, 0, 5, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Image of Vardmadra - On data set 0 5 - Say line'),
(@VARDMADRA, 0, 6, 7, 38, 0, 100, 0, 0, 6, 0, 0, 11, 57884, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Image of Vardmadra - On data set 0 6 - Spellcast Through the Eye: Kill Credit to Master'),
(@VARDMADRA, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Image of Vardmadra - On data set 0 6 - Despawn after 1 second'),

(@SHADOW_CULTIST*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shadow Cultist script - Set unit_field_bytes1 (kneel)'),
(@SHADOW_CULTIST*100, 9, 1, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shadow Cultist script - Say line'),
(@SHADOW_CULTIST*100, 9, 2, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 45, 0, 1, 0, 0, 0, 0, 19, @VARDMADRA, 10, 0, 0, 0, 0, 0, 'Shadow Cultist script - Set data 0 1 Image of Vardmadra'),
(@SHADOW_CULTIST*100, 9, 3, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shadow Cultist script - Say line'),
(@SHADOW_CULTIST*100, 9, 4, 0, 0, 0, 100, 0, 6500, 6500, 0, 0, 45, 0, 2, 0, 0, 0, 0, 19, @VARDMADRA, 10, 0, 0, 0, 0, 0, 'Shadow Cultist script - Set data 0 2 Image of Vardmadra'),
(@SHADOW_CULTIST*100, 9, 5, 0, 0, 0, 100, 0, 500, 500, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shadow Cultist script - Say line'),
(@SHADOW_CULTIST*100, 9, 6, 0, 0, 0, 100, 0, 3500, 3500, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shadow Cultist script - Say line'),
(@SHADOW_CULTIST*100, 9, 7, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 45, 0, 3, 0, 0, 0, 0, 19, @VARDMADRA, 10, 0, 0, 0, 0, 0, 'Shadow Cultist script - Set data 0 3 Image of Vardmadra'),
(@SHADOW_CULTIST*100, 9, 8, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shadow Cultist script - Say line'),
(@SHADOW_CULTIST*100, 9, 9, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 45, 0, 4, 0, 0, 0, 0, 19, @VARDMADRA, 10, 0, 0, 0, 0, 0, 'Shadow Cultist script - Set data 0 4 Image of Vardmadra'),
(@SHADOW_CULTIST*100, 9,10, 0, 0, 0, 100, 0, 8000, 8000, 0, 0, 45, 0, 5, 0, 0, 0, 0, 19, @VARDMADRA, 10, 0, 0, 0, 0, 0, 'Shadow Cultist script - Set data 0 5 Image of Vardmadra'),
(@SHADOW_CULTIST*100, 9,11, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 91, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shadow Cultist script - Remove unit_field_bytes1 (kneel)'),
(@SHADOW_CULTIST*100, 9,12, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shadow Cultist script - Say line'),
(@SHADOW_CULTIST*100, 9,13, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6816.328, 3801.11, 621.153, 0, 'Shadow Cultist script - Move to position'),
(@SHADOW_CULTIST*100, 9,14, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 45, 0, 6, 0, 0, 0, 0, 19, @VARDMADRA, 30, 0, 0, 0, 0, 0, 'Shadow Cultist script - Set data 0 6 Image of Vardmadra'),
(@SHADOW_CULTIST*100, 9,15, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shadow Cultist script - Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (@SUMMON_VARDMADRA,@SUMMON_CULTIST);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=10005;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,@SUMMON_VARDMADRA,0,0,30,0,@LK_EYE,10,0,1,0,0,'','Spell Through the Eye: Summon Image of Vardmadra will be casted only if target is not within 10y of Eye of the Lichking'),
(13,1,@SUMMON_VARDMADRA,0,0,31,0,3,@ELM_BUNNY,0,0,0,0,'','Spell Through the Eye: Summon Image of Vardmadra targets Elm General Purpose Bunny'),
(13,1,@SUMMON_CULTIST,0,0,31,0,3,@ELM_BUNNY,0,0,0,0,'','Spell Through the Eye: Summon Image of a Shadow Cultist targets Elm General Purpose Bunny'),
(15,10005,0,0,0,9,0,13121,0,0,0,0,0,'','Show gossip option only if player has taken quest Through the Eye'),
(15,10005,0,0,0,1,0,@LK_EYE_CAST,0,0,1,0,0,'','Hide gossip option when aura Using the Eye of the Lich King is present');
SET @RAZUUN            := 21502; -- Image of Warbringer Razuun
SET @JOVAAN            := 21633; -- Deathbringer Jovaan
SET @TRIGGER           := 4548;  -- Smart Trigger
SET @DEVICE            := 184833;-- Legion Communication Device
SET @GO_INFERNAL       := 184834;-- Gobject that needs to be despawned during the script
SET @GO_INFERNAL2      := 184835;-- Gobject that needs to be despawned during the script

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@RAZUUN,@JOVAAN);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@JOVAAN,@RAZUUN) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@JOVAAN*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@RAZUUN,0,0,0,38,0,100,0,0,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Image of Warbringer Razuun - On data 0 1 set - Say line'),
(@RAZUUN,0,1,0,38,0,100,0,0,2,0,0,1,1,2000,0,0,0,0,1,0,0,0,0,0,0,0,'Image of Warbringer Razuun - On data 0 2 set - Say line'),
(@RAZUUN,0,2,0,52,0,100,0,1,@RAZUUN,0,0,5,25,0,0,0,0,0,1,0,0,0,0,0,0,0,'Image of Warbringer Razuun - On text over - Play emote'),
(@RAZUUN,0,3,0,38,0,100,0,0,3,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Image of Warbringer Razuun - On data 0 3 set - Say line'),
(@RAZUUN,0,4,0,38,0,100,0,0,4,0,0,1,3,1500,0,0,0,0,1,0,0,0,0,0,0,0,'Image of Warbringer Razuun - On data 0 4 set - Say line'),
(@RAZUUN,0,5,0,52,0,100,0,3,@RAZUUN,0,0,5,25,0,0,0,0,0,1,0,0,0,0,0,0,0,'Image of Warbringer Razuun - On text over - Play emote'),
(@JOVAAN,0,0,1,11,0,100,0,0,0,0,0,11,34427,0,0,0,0,0,1,0,0,0,0,0,0,0,'Deathbringer Jovaan - Just summoned - Spellcast Etheral Teleport'),
(@JOVAAN,0,1,0,61,0,100,0,0,0,0,0,53,0,@JOVAAN,0,0,0,0,1,0,0,0,0,0,0,0,'Deathbringer Jovaan - Just summoned - Start WP movement'),
(@JOVAAN,0,2,3,40,0,100,0,4,@JOVAAN,0,0,54,45000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Deathbringer Jovaan - On WP 4 reached - Pause 45 seconds'),
(@JOVAAN,0,3,0,61,0,100,0,0,0,0,0,80,@JOVAAN*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Deathbringer Jovaan - On WP 4 reached - Run Script'),

(@JOVAAN*100,9,0,0,0,0,100,0,500,500,0,0,66,0,0,0,0,0,0,14,25736,@DEVICE,0,0,0,0,0,'Deathbringer Jovaan script - Turn to Legion Communication Device'),
(@JOVAAN*100,9,1,0,0,0,100,0,2500,2500,0,0,5,25,0,0,0,0,0,1,0,0,0,0,0,0,0,'Deathbringer Jovaan script - Play emote'),
(@JOVAAN*100,9,2,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Deathbringer Jovaan script - Say line'),
(@JOVAAN*100,9,3,0,0,0,100,0,100,100,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Deathbringer Jovaan script - Set unit_field_bytes1 (kneel)'),
(@JOVAAN*100,9,4,0,0,0,100,0,100,100,0,0,12,@RAZUUN,1,37500,0,0,0,8,0,0,0,-3300.087,2927.053,173.3354,2.199115,'Deathbringer Jovaan script - Summon Image of Warbringer Razuun'),
(@JOVAAN*100,9,5,0,0,0,100,0,800,800,0,0,45,0,1,0,0,0,0,19,@RAZUUN,10,0,0,0,0,0,'Deathbringer Jovaan script - Set data 0 1 Image of Warbringer Razuun'),
(@JOVAAN*100,9,6,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Deathbringer Jovaan script - Say line'),
(@JOVAAN*100,9,7,0,0,0,100,0,5000,5000,0,0,45,0,2,0,0,0,0,19,@RAZUUN,10,0,0,0,0,0,'Deathbringer Jovaan script - Set data 0 2 Image of Warbringer Razuun'),
(@JOVAAN*100,9,8,0,0,0,100,0,7000,7000,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Deathbringer Jovaan script - Remove unit_field_bytes1 (kneel)'),
(@JOVAAN*100,9,9,0,0,0,100,0,1000,1000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Deathbringer Jovaan script - Say line'),
(@JOVAAN*100,9,10,0,0,0,100,0,6000,6000,0,0,45,0,3,0,0,0,0,19,@RAZUUN,10,0,0,0,0,0,'Deathbringer Jovaan script - Set data 0 3 Image of Warbringer Razuun'),
(@JOVAAN*100,9,11,0,0,0,100,0,4000,4000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Deathbringer Jovaan script - Say line'),
(@JOVAAN*100,9,12,0,0,0,100,0,4000,4000,0,0,45,0,4,0,0,0,0,19,@RAZUUN,10,0,0,0,0,0,'Deathbringer Jovaan script - Set data 0 4 Image of Warbringer Razuun'),
(@JOVAAN*100,9,13,0,0,0,100,0,3500,3500,0,0,33,@RAZUUN,0,0,0,0,0,21,20,0,0,0,0,0,0,'Deathbringer Jovaan script - Give Quest Credit'),
(@JOVAAN*100,9,14,0,0,0,100,0,0,0,0,0,5,66,0,0,0,0,0,1,0,0,0,0,0,0,0,'Deathbringer Jovaan script - Play emote');

DELETE FROM `creature_text` WHERE `entry` IN (@RAZUUN,@JOVAAN);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@RAZUUN,0,0,'Doom Lord Kazzak will be pleased. You are to increase the pace of your attacks. Destroy the orcish and dwarven strongholds with all haste.',12,0,100,1,0,0,'Razuun'),
(@RAZUUN,1,0,'Don''t worry about that. I''ve increased production at the Deathforge. You''ll have all the infernals you need to carry out your orders. Don''t fail, Jovaan.',12,0,100,1,0,0,'Razuun'),
(@RAZUUN,2,0,'Yes?',12,0,100,6,0,0,'Razuun'),
(@RAZUUN,3,0,'Crate? I didn''t send you a crate, Jovaan. Don''t you have more important things to worry about? Go see to them!',12,0,100,274,0,0,'Razuun'),
(@JOVAAN,0,0,'Everything is in readiness, warbringer.',12,0,100,0,0,0,'Jovaan'),
(@JOVAAN,1,0,'Warbringer, that will require the use of all the hold''s infernals. It may leave us vulnerable to a counterattack.',12,0,100,0,0,0,'Jovaan'),
(@JOVAAN,2,0,'It shall be as you say, warbringer. One last question, if I may...',12,0,100,6,0,0,'Jovaan'),
(@JOVAAN,3,0,'What''s in the crate?',12,0,100,6,0,0,'Jovaan');

DELETE FROM `waypoints` WHERE `entry`=@JOVAAN;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@JOVAAN, 1, -3310.995, 2951.892, 171.2171, 'Deathbrinder Jovaan'),
(@JOVAAN, 2, -3307.998, 2942.022, 171.1127, 'Deathbrinder Jovaan'),
(@JOVAAN, 3, -3306.255, 2935.729, 171.0294, 'Deathbrinder Jovaan'),
(@JOVAAN, 4, -3304.257, 2930.78, 170.9866, 'Deathbrinder Jovaan'),
(@JOVAAN, 5, -3307.609, 2936.385, 170.9919, 'Deathbrinder Jovaan'),
(@JOVAAN, 6, -3309.415, 2942.621, 171.119, 'Deathbrinder Jovaan');

DELETE FROM `areatrigger_scripts` WHERE `entry`=@TRIGGER;
INSERT INTO `areatrigger_scripts` VALUES (@TRIGGER,'SmartTrigger');

DELETE FROM `smart_scripts` WHERE `entryorguid`=@TRIGGER AND `source_type`=2;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@TRIGGER,2,0,1,46,0,100,0,@TRIGGER,0,0,0,45,0,0,0,0,0,0,14,25736,@DEVICE,0,0,0,0,0,'Smart Trigger - On Trigger - Set Data to GO'),
(@TRIGGER,2,1,2,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,14,25737,@GO_INFERNAL,0,0,0,0,0,'Smart Trigger - On Link - Set Data GO'),
(@TRIGGER,2,2,0,61,0,100,0,0,0,0,0,45,0,2,0,0,0,0,14,25738,@GO_INFERNAL2,0,0,0,0,0,'Smart Trigger - On Link - Set Data GO');

UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry` IN (@DEVICE,@GO_INFERNAL,@GO_INFERNAL2);
DELETE FROM `smart_scripts` WHERE `source_type`=1 AND `entryorguid` IN (@DEVICE,@GO_INFERNAL,@GO_INFERNAL2);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@DEVICE,1,0,0,38,0,100,0,0,0,0,0,12,@JOVAAN,1,57000,0,0,0,8,0,0,0,-3310.995, 2951.892, 171.2171, 5.5355,'Legion Communicator - On Data Set - Summon Jovaan'),
(@GO_INFERNAL,1,0,0,38,0,100,0,0,1,0,0,99,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Infernal  - On Data Set- Change State'),
(@GO_INFERNAL,1,1,0,70,0,100,0,2,0,0,0,70,50,0,0,0,0,0,1,0,0,0,0,0,0,0,'Infernal - On Data Set- Despawn GO'),
(@GO_INFERNAL2,1,0,0,38,0,100,0,0,2,0,0,99,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Infernal 2 - On Data Set- Change State'),
(@GO_INFERNAL2,1,1,0,70,0,100,0,2,0,0,0,70,50,0,0,0,0,0,1,0,0,0,0,0,0,0,'Infernal 2 - On Data Set - Despawn GO');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry` IN (@TRIGGER,@DEVICE);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(22,1,@TRIGGER,2,0,1,0,37097,0,0,0,0,'','SAI areatrigger 4548 triggers only if player has aura Crate Disguise'),
(22,1,@TRIGGER,2,0,29,0,@JOVAAN,50,0,1,0,'','SAI areatrigger 4548 triggers only if there is no Deathbringer Jovaan present'),
(22,1,@DEVICE,2,0,1,0,37097,0,0,0,0,'','SAI Legion Communication Device triggers only if player has aura Crate Disguise');
-- Add conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=56438;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,56438,0,0,1,0,56438,0,0,1,0,0,'', 'Arcane Overload damage reduce aura can''t apply to target that already is affected by such');
-- Delete wrongly inserted spell linked spell of Scion of Eternity - "Arcane Barrage".
-- It should be handled in the original caster spell with spellscript effect.
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=56397 AND `spell_effect`=63934 AND`type`=1;

-- Update flags in creature for Malygos since differ from these in creature_template
UPDATE `creature` SET `unit_flags`=320,`dynamicflags`=8 WHERE `id`=28859;
-- Issue 9311
-- Add Missing Sunreaver Guardian Mage inside Sunreaver Tavern (Thx Aokromes) 
SET @CGUID := 40267; -- Set by TDB Team
DELETE FROM `creature` WHERE `guid`=@CGUID;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`MovementType`) VALUES
(@CGUID,29255,571,1,1,5900.299,505.75,641.6531,4.171337,120,0,0);

-- Issue 9322: 
-- fix SAI to make the quest Mission: The Abyssal Shelf (10162) Horde completable (thx Kirkhammett) 
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=19273;
DELETE FROM `smart_scripts` WHERE `entryorguid`=19273;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(19273,0,0,0,19, 0,100,0,10162,0,0,0,15,10162,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Commander To''arch - On Quest Accept - Call Areaexplored');
-- Issue 9250
-- A Worthy Weapon (thx Durotar)
UPDATE `creature_template` SET `InhabitType`=4, `hoverheight`=1065353216, `AIName`='SmartAI', `ScriptName`='' WHERE `entry`=33273;
-- Set visual effect: sitting
DELETE FROM `creature_template_addon` WHERE `entry`=33273;
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`,`emote`) VALUES (33273,1,1,0);
-- Winter Hyacinth (item 45000) Send Script Event (20990) by right-click
DELETE FROM `event_scripts` WHERE `id`=20990;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `x`, `y`, `z`, `o`) VALUES
(20990, 0, 10, 33273, 42000, 4602.977, -1600.141, 156.7834, 0.7504916);
-- TEMP Drak'Mar Offering Ring
SET @ObjectGuid := 6068; -- set by TDB staff
DELETE FROM `gameobject` WHERE `id`=300009;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@ObjectGuid+0,300009,571,1,1, 4606.72, -1606.91, 156.659, 1.62734,0.0,0.0, 0.726811, 0.686837,300,0,1),
(@ObjectGuid+1,300009,571,1,1, 4596.78, -1606.69, 156.659, 1.5488,0.0,0.0, 0.699286, 0.714842,300,0,1),
(@ObjectGuid+2,300009,571,1,1, 4597.1, -1594.08, 156.658, 1.53702,0.0,0.0, 0.695063, 0.718949,300,0,1),
(@ObjectGuid+3,300009,571,1,1, 4608.33, -1592.98, 156.658, 0.162569,0.0,0.0, 0.0811951, 0.996698,300,0,1),
(@ObjectGuid+4,300009,571,1,1, 4602.78, -1600.05, 156.658, 4.08564,0.0,0.0, 0.890651, -0.454688,300,0,1);
-- creature_text
DELETE FROM `creature_text` WHERE `entry`=33273 AND `groupid` BETWEEN 0 AND 3;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(33273,0,0, 'Are those winter hyacinths? For me?',12,0,100,6,0,0, 'Maiden of Drak''Mar'),
(33273,1,0, 'It''s been so long since a traveler has come here bearing flowers.',12,0,100,1,0,0, 'Maiden of Drak''Mar'),
(33273,2,0, 'The lake has been too lonely these past years. The travelers stopped coming and evil came to these waters.',12,0,100,1,0,0, 'Maiden of Drak''Mar'),
(33273,3,0, 'Your gift is a rare kindness, traveler. Please take this blade with my gratitude. Long ago, another traveler left it here, but I have little use for it.',12,0,100,1,0,0, 'Maiden of Drak''Mar');
-- SAI
DELETE FROM `smart_scripts` WHERE `entryorguid`=33273 AND `source_type`=0 AND `id`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33273*100 AND `source_type`=9 AND `id` BETWEEN 0 AND 6;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(33273,0,0,0,54,0,100,0,0,0,0,0,80,33273*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Maiden of DrakMar - On spawn - Run script'),
(33273*100,9,0,0,0,0,100,0,0,0,0,0,50,194239,42000,0,0,0,0,8,0,0,0,4602.977,-1600.141,156.7834,0, 'Maiden of DrakMar - On script - Summon GO DrakMar Lily Pad'),
(33273*100,9,1,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Maiden of DrakMar - On script - Say 0'),
(33273*100,9,2,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Maiden of DrakMar - On script - Say 1'),
(33273*100,9,3,0,0,0,100,0,6000,6000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Maiden of DrakMar - On script - Say 2'),
(33273*100,9,4,0,0,0,100,0,7000,7000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Maiden of DrakMar - On script - Say 3'),
(33273*100,9,5,0,0,0,100,0,0,0,0,0,50,194238,20000,0,0,0,0,8,0,0,0,4603.351,-1599.288,156.8822,2.234018, 'Maiden of DrakMar - On script - Summon GO Blade of DrakMar');
SET @GUID := 40470;
SET @PATH := @GUID*10;
DELETE FROM `creature` where `id`=18686;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES 
(@GUID,18686,530,1,1,0,0,-2847.327,3195.10722,7.4167,.0910940,300,0,0,9144,13525,2,0,0,0);
-- Pathing Data
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`) VALUES 
(@PATH,1,-2843.86,3205.97,5.45323,0,0,0,0,100),
(@PATH,2,-2829.24,3218.81,9.59048,0,0,0,0,100),
(@PATH,3,-2814.12,3235.72,10.1736,0,0,0,0,100),
(@PATH,4,-2792.54,3259.91,5.91885,0,0,0,0,100),
(@PATH,5,-2774.46,3280.17,2.8828,0,0,0,0,100),
(@PATH,6,-2751.21,3306.24,0.199384,0,0,0,0,100),
(@PATH,7,-2728.55,3318.21,-0.833018,0,0,0,0,100),
(@PATH,8,-2719.59,3331.35,-1.04936,0,0,0,0,100),
(@PATH,9,-2708.94,3349.74,-0.819842,0,0,0,0,100),
(@PATH,10,-2694.72,3374.29,-0.156626,0,0,0,0,100),
(@PATH,11,-2685.08,3390.93,0.328583,0,0,0,0,100),
(@PATH,12,-2675.69,3407.16,0.474826,0,0,0,0,100),
(@PATH,13,-2669.68,3416.29,0.743526,0,0,0,0,100),
(@PATH,14,-2660.96,3425.20,0.805554,0,0,0,0,100),
(@PATH,15,-2654.25,3430.82,0.77502,0,0,0,0,100),
(@PATH,16,-2645.46,3437.83,1.28666,0,0,0,0,100),
(@PATH,17,-2639.59,3442.50,3.25542,0,0,0,0,100),
(@PATH,18,-2630.71,3449.41,1.86245,0,0,0,0,100),
(@PATH,19,-2621.54,3456.21,0.653284,0,0,0,0,100),
(@PATH,20,-2617.41,3460.51,0.593326,0,0,0,0,100),
(@PATH,21,-2611.50,3471.52,0.520041,0,0,0,0,100),
(@PATH,22,-2610.04,3475.69,0.53993,0,0,0,0,100),
(@PATH,23,-2606.90,3480.85,0.492544,0,0,0,0,100),
(@PATH,24,-2590.41,3502.84,0.225892,0,0,0,0,100),
(@PATH,25,-2582.03,3512.00,0.101641,0,0,0,0,100),
(@PATH,26,-2566.36,3522.06,0.189451,0,0,0,0,100),
(@PATH,27,-2534.38,3523.07,1.3404,0,0,0,0,100),
(@PATH,28,-2523.33,3527.83,1.66667,0,0,0,0,100),
(@PATH,29,-2516.31,3533.95,1.65006,0,0,0,0,100),
(@PATH,30,-2507.47,3544.67,1.56155,0,0,0,0,100),
(@PATH,31,-2491.83,3549.68,1.43199,0,0,0,0,100),
(@PATH,32,-2471.56,3551.98,1.23732,0,0,0,0,100),
(@PATH,33,-2463.14,3555.66,1.03546,0,0,0,0,100),
(@PATH,34,-2456.30,3555.25,0.942503,0,0,0,0,100),
(@PATH,35,-2452.53,3537.02,0.402467,0,0,0,0,100),
(@PATH,36,-2446.32,3528.59,-0.236494,0,0,0,0,100),
(@PATH,37,-2462.93,3549.41,1.08819,0,0,0,0,100),
(@PATH,38,-2460.92,3557.50,1.00403,0,0,0,0,100),
(@PATH,39,-2425.49,3596.20,0.274173,0,0,0,0,100),
(@PATH,40,-2405.20,3613.88,0.217946,0,0,0,0,100),
(@PATH,41,-2391.31,3632.83,0.792431,0,0,0,0,100),
(@PATH,42,-2383.97,3658.54,0.99065,0,0,0,0,100),
(@PATH,43,-2351.54,3700.72,0.420721,0,0,0,0,100),
(@PATH,44,-2314.59,3729.83,0.0297019,0,0,0,0,100),
(@PATH,45,-2296.57,3749.89,0.363868,0,0,0,0,100),
(@PATH,46,-2285.44,3767.70,0.291327,0,0,0,0,100),
(@PATH,47,-2279.30,3787.95,0.314858,0,0,0,0,100),
(@PATH,48,-2276.30,3799.32,0.521091,0,0,0,0,100),
(@PATH,49,-2254.61,3831.13,2.70024,0,0,0,0,100),
(@PATH,50,-2251.75,3848.92,5.15061,0,0,0,0,100),
(@PATH,51,-2249.52,3869.55,2.39354,0,0,0,0,100),
(@PATH,52,-2244.66,3893.46,1.58335,0,0,0,0,100),
(@PATH,53,-2239.88,3904.19,1.10899,0,0,0,0,100),
(@PATH,54,-2224.28,3927.45,0.706091,0,0,0,0,100),
(@PATH,55,-2187.45,3958.22,0.921813,0,0,0,0,100),
(@PATH,56,-2175.09,3978.98,0.929392,0,0,0,0,100),
(@PATH,57,-2171.14,4011.04,0.450247,0,0,0,0,100),
(@PATH,58,-2175.93,4027.88,0.519539,0,0,0,0,100),
(@PATH,59,-2187.96,4064.43,1.42810,0,0,0,0,100),
(@PATH,60,-2166.44,4102.49,4.27243,0,0,0,0,100), -- Had guid as action_id
(@PATH,61,-1700.15,3993.57,55.6859,0,0,0,0,100),
(@PATH,62,-1710.59,4034.97,60.6101,0,0,0,0,100),
(@PATH,63,-1719.95,4059.83,62.7452,0,0,0,0,100),
(@PATH,64,-1718.67,4104.32,64.3796,0,0,0,0,100),
(@PATH,65,-1743.77,4151.60,62.3929,0,0,0,0,100),
(@PATH,66,-1754.61,4173.29,58.3691,0,0,0,0,100),
(@PATH,67,-1788.41,4206.51,44.1839,0,0,0,0,100),
(@PATH,68,-1818.93,4214.12,33.1137,0,0,0,0,100),
(@PATH,69,-1841.51,4228.10,22.0741,0,0,0,0,100),
(@PATH,70,-1871.54,4263.50,8.22153,0,0,0,0,100),
(@PATH,71,-1891.00,4295.91,3.23019,0,0,0,0,100),
(@PATH,72,-1911.96,4351.49,1.66825,0,0,0,0,100),
(@PATH,73,-1910.12,4389.42,1.77078,0,0,0,0,100),
(@PATH,74,-1907.67,4417.31,2.99456,0,0,0,0,100),
(@PATH,75,-1917.63,4452.07,6.27493,0,0,0,0,100),
(@PATH,76,-1929.40,4473.47,8.90937,0,0,0,0,100),
(@PATH,77,-1942.74,4489.67,11.1029,0,0,0,0,100),
(@PATH,78,-1958.47,4508.45,12.7432,0,0,0,0,100),
(@PATH,79,-1975.36,4519.94,13.1616,0,0,0,0,100),
(@PATH,80,-1982.19,4524.49,13.0993,0,0,0,0,100),
(@PATH,81,-1983.38,4507.03,12.7591,0,0,0,0,100),
(@PATH,82,-1984.02,4496.55,11.9535,0,0,0,0,100),
(@PATH,83,-1984.87,4482.57,11.1499,0,0,0,0,100),
(@PATH,84,-1978.92,4509.87,12.6695,0,0,0,0,100),
(@PATH,85,-1978.12,4527.35,13.36,0,0,0,0,100),
(@PATH,86,-1967.33,4546.79,12.8741,0,0,0,0,100),
(@PATH,87,-1953.04,4566.47,10.1123,0,0,0,0,100),
(@PATH,88,-1946.50,4582.91,7.44598,0,0,0,0,100),
(@PATH,89,-1948.30,4599.58,4.61956,0,0,0,0,100),
(@PATH,90,-1955.08,4637.48,-0.0588505,0,0,0,0,100),
(@PATH,91,-1943.63,4685.04,-2.18987,0,0,0,0,100),
(@PATH,92,-1941.99,4705.25,-2.67768,0,0,0,0,100),
(@PATH,93,-1945.22,4727.47,-3.22917,0,0,0,0,100),
(@PATH,94,-1951.89,4748.79,-2.9388,0,0,0,0,100),
(@PATH,95,-1957.77,4773.70,-1.42409,0,0,0,0,100),
(@PATH,96,-1957.36,4798.11,-0.0807409,0,0,0,0,100),
(@PATH,97,-1944.66,4829.17,0.67,0,0,0,0,100),
(@PATH,98,-1929.68,4851.09,1.64973,0,0,0,0,100),
(@PATH,99,-1918.23,4883.89,2.11937,0,0,0,0,100),
(@PATH,100,-1901.18,4906.49,-1.12705,0,0,0,0,100),
(@PATH,101,-1881.87,4926.69,-9.60835,0,0,0,0,100),
(@PATH,102,-1870.05,4946.21,-17.0149,0,0,0,0,100),
(@PATH,103,-1866.49,4960.25,-20.2899,0,0,0,0,100),
(@PATH,104,-1860.94,5033.3,-26.0991,0,0,0,0,100),
(@PATH,105,-1869.80,4962.46,-20.3781,0,0,0,0,100),
(@PATH,106,-1884.86,4924.67,-8.30171,0,0,0,0,100),
(@PATH,107,-1904.83,4905.16,-0.202733,0,0,0,0,100),
(@PATH,108,-1922.67,4912.5,6.06643,0,0,0,0,100),
(@PATH,109,-1937.46,4934.99,14.8054,0,0,0,0,100),
(@PATH,110,-1953.22,4961.69,24.7149,0,0,0,0,100),
(@PATH,111,-1958.07,4992.99,30.1767,0,0,0,0,100),
(@PATH,112,-1958.74,5013.42,32.4293,0,0,0,0,100),
(@PATH,113,-1947.03,5042.52,25.2899,0,0,0,0,100),
(@PATH,114,-1942.58,5058.03,19.5292,0,0,0,0,100),
(@PATH,115,-1963.32,5083.08,11.1075,0,0,0,0,100),
(@PATH,116,-1984.50,5100.08,7.82778,0,0,0,0,100),
(@PATH,117,-2004.59,5114.07,8.26657,0,0,0,0,100),
(@PATH,118,-2029.48,5123.26,8.48839,0,0,0,0,100),
(@PATH,119,-2055.94,5125.38,7.48301,0,0,0,0,100),
(@PATH,120,-2089.33,5115.44,3.14184,0,0,0,0,100),
(@PATH,121,-2112.53,5107.32,-2.40737,0,0,0,0,100),
(@PATH,122,-2137.40,5108.51,-11.5709,0,0,0,0,100),
(@PATH,123,-2155.69,5115.97,-18.1534,0,0,0,0,100),
(@PATH,124,-2170.60,5125.13,-21.2824,0,0,0,0,100),
(@PATH,125,-2182.81,5131.87,-21.667,0,0,0,0,100),
(@PATH,126,-2198.88,5138.77,-21.2323,0,0,0,0,100),
(@PATH,127,-2219.62,5144.57,-19.6848,0,0,0,0,100),
(@PATH,128,-2238.57,5146.29,-17.4706,0,0,0,0,100),
(@PATH,129,-2266.45,5144.26,-13.0598,0,0,0,0,100),
(@PATH,130,-2290.86,5142.23,-9.17377,0,0,0,0,100),
(@PATH,131,-2308.35,5142.09,-7.11532,0,0,0,0,100),
(@PATH,132,-2333.72,5149.44,-5.0165,0,0,0,0,100),
(@PATH,133,-2365.45,5157.88,-2.8501,0,0,0,0,100),
(@PATH,134,-2390.26,5158.22,-1.19618,0,0,0,0,100),
(@PATH,135,-2417.84,5153.35,0.775549,0,0,0,0,100),
(@PATH,136,-2442.28,5142.04,3.53141,0,0,0,0,100),
(@PATH,137,-2469.81,5120.56,6.76948,0,0,0,0,100),
(@PATH,138,-2498.06,5115.06,7.87731,0,0,0,0,100),
(@PATH,139,-2532.85,5118.89,7.54034,0,0,0,0,100),
(@PATH,140,-2555.60,5120.59,7.69492,0,0,0,0,100), -- GUID+1 as action_id
(@PATH,141,-2843.86,3205.97,5.45323,0,0,0,0,100);
-- Assign Path
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES 
(@GUID,@PATH);
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE `Id`=8345;
UPDATE `quest_template` SET `NextQuestId`=0 WHERE `Id`=8330;
-- The Admiral Revealed (12852) - http://www.wowhead.com/quest=12852
-- http://www.youtube.com/watch?v=I9doc1BVmA8
SET @WHIRLWIND       := 49807; -- Admiral's Whirlwind, AoE, used in phase 1
SET @STRIKE          := 57846; -- Admiral's Heroic Strike, cast on tank, used in phase 1
SET @CLEAVE          := 15284; -- Admiral's Cleave, cast in cone, used in phase 1
SET @TOUCH           := 60501; -- Selfcast on Mal'Ganis, heals him, used in phase 2
SET @SLEEP           := 53045; -- Mal'Ganis Sleep,Cast on random group member, used in phase 2
SET @BLAST           := 60500; -- Mal'Ganis Mind Blast, Cast on random group member, used in phase 2
SET @CARRION         := 60502; -- Mal'Ganis Carrion Swarm, Cast in cone, used in phase 2
SET @SHIELD          := 50161; -- Cast when Admiral on 50 %
SET @ITEMSPELL       := 31699; -- Spell to disable shield
SET @ADMIRAL         := 29621; -- Grand Admiral Westwind
SET @MALGANIS        := 29620; -- Dreadlord Mal'Ganis
SET @PORTAL          := 27731; -- Portal visual
SET @LEGION_TELEPORT := 35502; -- Mal'Ganis Legion Portal visual
SET @CREDIT_BUNNY    := 29627; -- Cute little flaming bunny
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry` IN (@CREDIT_BUNNY);
DELETE FROM `smart_scripts` WHERE `entryorguid`=@CREDIT_BUNNY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`, `target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@CREDIT_BUNNY, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 75, @PORTAL, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Credit Bunny - Just Summoned - Cast Portal');
-- SAI for Grand Admiral Westwind
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry` IN (@ADMIRAL,@MALGANIS,@ADMIRAL*100);
DELETE FROM `smart_scripts` WHERE `entryorguid`IN (@ADMIRAL,@ADMIRAL*100) AND `source_type` IN (0,9);
DELETE FROM `smart_scripts` WHERE `entryorguid`=@MALGANIS AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`, `target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ADMIRAL, 0, 0, 1, 4, 0, 100, 0, 0, 0, 0, 0, 42, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - On aggro - Set invicibility at 1 HP'),
(@ADMIRAL, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - On Link - Say line 0'),
(@ADMIRAL, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - On Link - Set phase 1'),
(@ADMIRAL, 0, 3, 4, 2, 0, 100, 1, 0, 50, 0, 0, 11, @SHIELD, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - At 50% HP - Cast Protection Sphere'),
(@ADMIRAL, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - Link - Say line 1'),
(@ADMIRAL, 0, 5, 6, 8, 0, 100, 0, @ITEMSPELL, 0, 0, 0, 28, @SHIELD, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - On spell hit - Remove aura'),
(@ADMIRAL, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - Link - Say line 2'),
(@ADMIRAL, 0, 7, 8, 2, 0, 100, 1, 0, 30, 0, 0, 3, @MALGANIS, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - At 30% HP - Morph to Dreadlord Mal''Ganis'),
(@ADMIRAL, 0, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - On Link - Set phase 2'),
(@ADMIRAL, 0, 9,10, 61, 0, 100, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - Link - Say line 3'),
(@ADMIRAL, 0, 10, 0, 61, 0, 100, 0, 0, 0, 0, 0, 40, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,'Grand Admiral Westwind - Link - Sheath'),
(@ADMIRAL, 0, 11, 0, 2, 0, 100, 1, 0, 15, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - At 15% HP - Say line 4'),
(@ADMIRAL, 0, 12, 0, 1, 0, 100, 0, 0, 0, 0, 0, 3, @ADMIRAL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - On evade - Restore model'),
(@ADMIRAL, 0, 13, 14, 2, 0, 100, 1, 1, 1, 0, 0, 18, 33554434, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - On 1 hp - Set unit_flags'),
(@ADMIRAL, 0, 14, 15, 61, 0, 100, 1, 0, 0, 0, 0, 12, @CREDIT_BUNNY, 1, 19000, 0, 0, 0, 8, 0, 0, 0, 7494.893066, 4871.533203, -12.655286, 1.376, 'Grand Admiral Westwind - On Link - Summon Npc'),
(@ADMIRAL, 0, 15, 16, 61, 0, 100, 1, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - On Link - Stop Combat/Attack Attack State'),
(@ADMIRAL, 0, 16, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @ADMIRAL*100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - On Link - Start timed script'),
(@ADMIRAL*100, 9, 0, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 22, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - On script - Set phase 3'),
(@ADMIRAL*100, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 7494.788, 4872.567, -12.72154, 0, 'Grand Admiral Westwind - On Script - Move to Pos'),
(@ADMIRAL*100, 9, 2, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - On Script - Say line 6'),
(@ADMIRAL*100, 9, 3, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 11, @LEGION_TELEPORT, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - On Script - Cast spell on self'),
(@ADMIRAL*100, 9, 4, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 33, @CREDIT_BUNNY, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - On Script - Give quest credit'),
(@ADMIRAL*100, 9, 5, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 41, 3500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - On Script - Despawn'),
(@ADMIRAL, 0, 17, 0, 11, 0, 100, 0, 0, 0, 0, 0, 19, 33554434, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - On Respawn - Unset unit_flags'),
(@ADMIRAL, 0, 18, 0, 0, 1, 100, 0, 15000, 16000, 16000, 16000, 11, @WHIRLWIND, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - In combat Phase 1 - Cast Whirlwind'),
(@ADMIRAL, 0, 19, 0, 0, 1, 100, 0, 6000, 7000, 6000, 7000, 11, @STRIKE, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - In combat Phase 1 - Cast Heroic Strike'),
(@ADMIRAL, 0, 20, 0, 0, 2, 100, 0, 15000, 16000, 15000, 16000, 11, @SLEEP, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - In combat Phase 2 - Cast Sleep'),
(@ADMIRAL, 0, 21, 0, 0, 2, 100, 0, 6000, 7000, 6000, 7000, 11, @TOUCH, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - In combat Phase 2- Cast Vampiric Touch'),
(@ADMIRAL, 0, 22, 0, 0, 1, 100, 0, 13000, 13500, 13000, 13500, 11, @CLEAVE, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - In combat Phase 1 - Cast Cleave'),
(@ADMIRAL, 0, 23, 0, 0, 2, 100, 0, 8000, 9000, 8000, 9000, 11, @CARRION, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - In combat Phase 2 - Cast Carrion Swarm'),
(@ADMIRAL, 0, 24, 0, 0, 2, 100, 0, 18000, 19000, 18000, 19000, 11, @BLAST, 1, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - In combat Phase 2 - Cast Mind Blast'),
(@ADMIRAL, 0, 25, 0, 25, 0, 100, 0, 0, 0, 0, 0, 20, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grand Admiral Westwind - On Reset - Allow Attack State');
/*
Sound ID's
14429 Final speech - When he uses portal
14428 2% HP - When he becomes immune
14427 15 % - When he rages
14426 30% HP - When he morphs
14207 Sphere removed - When Item spell is used on him
14205 Sphere cast - When he casts sphere on self
14201 Beginning of combat - When he aggros
*/
-- Sniffed text with sounds
DELETE FROM `creature_text` WHERE `entry` IN (@ADMIRAL,@MALGANIS);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ADMIRAL,0,0, 'How did you find me? Did Landgren tell?',12,0,100,0,0,14201, 'Grand Admiral Westwind'),
(@ADMIRAL,1,0, 'You thought I would just let you kill me?',12,0,100,0,0,14205, 'Grand Admiral Westwind'),
(@ADMIRAL,2,0, 'WHAT?! No matter. Even without my sphere, I will crush you! Behold my true identity and despair!',14,0,100,0,0,14207, 'Grand Admiral Westwind'),
(@ADMIRAL,3,0, 'Gah! I spent too much time in that weak little shell.',14,0,100,0,0,14426, 'Grand Admiral Westwind'),
(@ADMIRAL,4,0, 'Kirel narak! I am Mal''Ganis. I AM ETERNAL!',14,0,100,0,0,14427, 'Grand Admiral Westwind'),
(@ADMIRAL,5,0, 'ENOUGH! I waste my time here. I must gather my strength on the homeworld.',14,0,100,0,0,14428, 'Grand Admiral Westwind'),
(@ADMIRAL,6,0, 'You''ll never defeat the Lich King without my forces. I''ll have my revenge... on him AND you!',14,0,100,0,0,14429, 'Grand Admiral Westwind');
-- ----------------------------
-- Table structure for `player_factionchange_quests`
-- ----------------------------
DROP TABLE IF EXISTS `player_factionchange_quests`;
CREATE TABLE `player_factionchange_quests` (
  `alliance_id` int(10) unsigned NOT NULL,
  `horde_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`),
  UNIQUE INDEX `alliance_uniq` (`alliance_id`),
  UNIQUE INDEX `horde_uniq` (`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DELETE FROM `player_factionchange_quests` WHERE `alliance_id` IN (9524, 8114, 7168, 7169, 7170, 7171, 7172, 8115, 8311, 8960, 8860, 8997, 9520, 9522, 9587, 9869, 9933, 9938, 9940, 9982, 9994, 9996, 10005, 10014, 10033, 10035, 10038, 10040, 10042, 10048, 10051, 10053, 10054, 10055, 10056, 10057, 10076, 10078, 10080, 10083, 10084, 10115, 10116, 10140, 10141, 10122, 10142, 10126, 10145, 10128, 10146, 10130, 10131, 10147, 10148, 10137, 10138, 10139, 10163, 10394, 10397, 10395, 10443, 10444, 10476, 10562, 10563, 10564, 10572, 10582, 10583, 10585, 10586, 10589, 10606, 10612, 10621, 10626, 10662, 10680, 10744, 10772, 10773, 10754, 10762, 10763, 10764, 10759, 10774, 10766, 10775, 10776, 10863, 10869, 10962, 11002, 11117, 11122, 11123, 11150, 11185, 11242, 11302, 11346, 11348, 11349, 11355, 11358, 11359, 11321, 11131, 12135, 11400, 11486, 11502, 11657, 11713, 11704, 11731, 11882, 11921, 11924, 11986, 11993, 12022, 12105, 12129, 12130, 12131, 12133, 12138, 12142, 12143, 12146, 12153, 12161, 12183, 12184, 12185, 12219, 12220, 12222, 12223, 12246, 12247, 12249, 12248, 12250, 12255, 12278, 12464, 12323, 12416, 12417, 12418, 12460, 12479, 12491, 12854, 12858, 12860, 12862, 12870, 12872, 12885, 13186, 13222, 13188, 13226, 13395, 13387, 13388, 13389, 13390, 13391, 13392, 13284, 13393, 13394, 13332, 13334, 13309, 13337, 13338, 13339, 13335, 13336, 13341, 13396, 13397, 13398, 13399, 13400, 13401, 13402, 13403, 13380, 13381, 13382, 13383, 13408, 13410, 13415, 13418, 13480, 13484, 13633, 13625, 13671, 13672, 13679, 13686, 13828, 13835, 13837, 14022, 14023, 14024, 14028, 14030, 14033, 14035, 14048, 14051, 14053, 14054, 14055, 14096, 14111, 20438, 20439, 24498, 24499, 24500, 24510, 24535, 24656, 24657, 24683, 24710, 24711, 24655, 24804, 24848, 25055, 25180, 25253, 25282, 25290, 25414);
INSERT INTO `player_factionchange_quests` (`alliance_id`, `horde_id`) VALUES
(9524, 9525),
(8114, 8121),
(7168, 7163),
(7169, 7164),
(7170, 7165),
(7171, 7166),
(7172, 7167),
(8115, 8122),
(8311, 8312),
(8960, 9032),
(8860, 8861),
(8997, 8998),
(9520, 9535),
(9522, 9536),
(9587, 9588),
(9869, 9870),
(9933, 9934),
(9938, 9937),
(9940, 9939),
(9982, 9983),
(9994, 9995),
(9996, 9997),
(10005, 10006),
(10014, 10015),
(10033, 10034),
(10035, 10036),
(10038, 10039),
(10040, 10041),
(10042, 10043),
(10048, 10049),
(10051, 10052),
(10053, 10059),
(10054, 10060),
(10055, 10086),
(10056, 10158),
(10057, 10062),
(10076, 10074),
(10078, 10087),
(10080, 10089),
(10083, 10090),
(10084, 10092),
(10115, 10118),
(10116, 10117),
(10140, 10120),
(10141, 10121),
(10122, 10150),
(10142, 10123),
(10126, 10151),
(10145, 10127),
(10128, 10153),
(10146, 10129),
(10130, 10152),
(10131, 10154),
(10147, 10133),
(10148, 10135),
(10137, 10155),
(10138, 10156),
(10139, 10157),
(10163, 10162),
(10394, 10390),
(10397, 10392),
(10395, 10393),
(10443, 10442),
(10444, 10448),
(10476, 10479),
(10562, 10595),
(10563, 10596),
(10564, 10598),
(10572, 10597),
(10582, 10600),
(10583, 10601),
(10585, 10602),
(10586, 10603),
(10589, 10604),
(10606, 10611),
(10612, 10613),
(10621, 10623),
(10626, 10627),
(10662, 10663),
(10680, 10681),
(10744, 10745),
(10772, 10750),
(10773, 10751),
(10754, 10755),
(10762, 10756),
(10763, 10757),
(10764, 10758),
(10759, 10761),
(10774, 10765),
(10766, 10767),
(10775, 10768),
(10776, 10769),
(10863, 10862),
(10869, 10868),
(10962, 10963),
(11002, 11003),
(11117, 11431),
(11122, 11412),
(11123, 11124),
(11150, 11205),
(11185, 11186),
(11242, 11403),
(11302, 11312),
(11346, 11350),
(11348, 11352),
(11349, 11351),
(11355, 11365),
(11358, 11366),
(11359, 11367),
(11321, 11413),
(11131, 11219),
(12135, 12139),
(11400, 11419),
(11486, 11487),
(11502, 11503),
(11657, 11923),
(11713, 11684),
(11704, 11702),
(11731, 11922),
(11882, 11915),
(11921, 11926),
(11924, 11925),
(11986, 12026),
(11993, 12058),
(12022, 12191),
(12105, 12423),
(12129, 12165),
(12130, 12196),
(12131, 12197),
(12133, 12155),
(12138, 12198),
(12142, 12144),
(12143, 12145),
(12146, 12147),
(12153, 12199),
(12161, 12425),
(12183, 12201),
(12184, 12202),
(12185, 12203),
(12219, 12207),
(12220, 12213),
(12222, 12256),
(12223, 12257),
(12246, 12229),
(12247, 12231),
(12249, 12236),
(12248, 12241),
(12250, 12242),
(12255, 12259),
(12278, 12306),
(12464, 12285),
(12323, 12324),
(12416, 12448),
(12417, 12449),
(12418, 12450),
(12460, 12461),
(12479, 12480),
(12491, 12492),
(12854, 12895),
(12858, 12926),
(12860, 12927),
(12862, 13060),
(12870, 12882),
(12872, 12928),
(12885, 12929),
(13186, 13185),
(13222, 13223),
(13188, 13189),
(13226, 13227),
(13395, 13236),
(13387, 13259),
(13388, 13262),
(13389, 13263),
(13390, 13271),
(13391, 13275),
(13392, 13282),
(13284, 13301),
(13393, 13304),
(13394, 13305),
(13332, 13306),
(13334, 13307),
(13309, 13310),
(13337, 13312),
(13338, 13316),
(13339, 13328),
(13335, 13329),
(13336, 13330),
(13341, 13340),
(13396, 13348),
(13397, 13349),
(13398, 13359),
(13399, 13360),
(13400, 13361),
(13401, 13362),
(13402, 13363),
(13403, 13364),
(13380, 13373),
(13381, 13374),
(13382, 13376),
(13383, 13379),
(13408, 13409),
(13410, 13411),
(13415, 13416),
(13418, 13419),
(13480, 13479),
(13484, 13483),
(13633, 13634),
(13625, 13677),
(13671, 13676),
(13672, 13678),
(13679, 13680),
(13686, 13687),
(13828, 13829),
(13835, 13838),
(13837, 13839),
(14022, 14036),
(14023, 14037),
(14024, 14040),
(14028, 14041),
(14030, 14044),
(14033, 14043),
(14035, 14047),
(14048, 14061),
(14051, 14062),
(14053, 14059),
(14054, 14060),
(14055, 14058),
(14096, 14142),
(14111, 14100),
(20438, 24556),
(20439, 24451),
(24498, 24507),
(24499, 24511),
(24500, 24802),
(24510, 24506),
(24535, 24563),
(24656, 24541),
(24657, 24576),
(24683, 24682),
(24710, 24712),
(24711, 24713),
(24655, 24536),
(24804, 24805),
(24848, 24850),
(25055, 25092),
(25180, 25181),
(25253, 25228),
(25282, 25254),
(25290, 25288),
(25414, 25293);
-- Delete condition that can cause some damage reduction "spikes" leading to leaking damage,
-- or in simple language some delay can cause not applying.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=56438;
-- Delete condition that is already covered by spell attribute
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=58846;
SET @CGUID := 86429;
SET @OGUID := 24440;

UPDATE `gameobject` SET `spawntimesecs`=120, `animprogress`=255 WHERE `id`=188464;
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+21;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID+00, 188464, 571, 1, 1, 4781.308, -4865.809, 26.53011, 0.8377575, 0, 0, 0.4067364, 0.9135455, 120, 255, 1),
(@OGUID+01, 188464, 571, 1, 1, 4753.355, -4830.314, 26.04058, 5.532695, 0, 0, -0.3665009, 0.9304177, 120, 255, 1),
(@OGUID+02, 188464, 571, 1, 1, 4758.613, -4824.151, 25.96103, 5.550147, 0, 0, -0.3583679, 0.9335805, 120, 255, 1),
(@OGUID+03, 188464, 571, 1, 1, 4764.173, -4818.161, 25.88273, 5.550147, 0, 0, -0.3583679, 0.9335805, 120, 255, 1),
(@OGUID+04, 188464, 571, 1, 1, 4785.614, -4793.256, 26.12138, 5.550147, 0, 0, -0.3583679, 0.9335805, 120, 255, 1),
(@OGUID+05, 188464, 571, 1, 1, 4848.127, -4827.709, 25.96146, 2.408554, 0, 0, 0.9335804, 0.358368, 120, 255, 1),
(@OGUID+06, 188464, 571, 1, 1, 4790.917, -4787.033, 26.19655, 5.550147, 0, 0, -0.3583679, 0.9335805, 120, 255, 1),
(@OGUID+07, 188464, 571, 1, 1, 4796.205, -4780.994, 26.19833, 5.567601, 0, 0, -0.3502073, 0.9366722, 120, 255, 1),
(@OGUID+08, 188464, 571, 1, 1, 4829.167, -4799.646, 25.96292, 3.961899, 0, 0, -0.9170599, 0.3987495, 120, 255, 1),
(@OGUID+09, 188464, 571, 1, 1, 4775.307, -4860.43, 26.52502, 0.8377575, 0, 0,  0.4067364, 0.9135455, 120, 255, 1),
(@OGUID+10, 188499, 571, 1, 1, 4783.06, -4870.042, 26.63436, 5.567601, 0, 0, -0.3502073, 0.9366722, 300, 255, 1),
(@OGUID+11, 188499, 571, 1, 1, 4776.997, -4864.7, 26.76528, 5.67232, 0, 0, -0.3007059, 0.9537169, 300, 255, 1),
(@OGUID+12, 188499, 571, 1, 1, 4804.492, -4880.459, 25.95016, 0.9250238, 0, 0, 0.4461975, 0.8949345, 300, 255, 1),
(@OGUID+13, 188499, 571, 1, 1, 4754.443, -4825.909, 26.1786, 4.01426, 0, 0, -0.9063072, 0.4226195, 300, 255, 1),
(@OGUID+14, 188499, 571, 1, 1, 4797.431, -4776.76, 26.2836, 3.979355, 0, 0, -0.9135447, 0.4067384, 300, 255, 1),
(@OGUID+15, 188499, 571, 1, 1, 4792.048, -4782.723, 26.41635, 4.049168, 0, 0, -0.8987932, 0.4383728, 300, 255, 1),
(@OGUID+16, 188499, 571, 1, 1, 4806.47, -4775.945, 26.30708, 2.373644, 0, 0,  0.9271832, 0.3746083, 300, 255, 1),
(@OGUID+17, 188499, 571, 1, 1, 4809.335, -4874.765, 26.06562, 0.8377575, 0, 0, 0.4067364, 0.9135455, 300, 255, 1),
(@OGUID+18, 188499, 571, 1, 1, 4819.935, -4862.525, 26.05573, 0.8203033, 0, 0,  0.3987484, 0.9170604, 300, 255, 1),
(@OGUID+19, 188499, 571, 1, 1, 4786.889, -4788.973, 26.3336, 4.049168, 0, 0, -0.8987932, 0.4383728, 300, 255, 1),
(@OGUID+20, 188499, 571, 1, 1, 4852.343, -4826.055, 26.06636, 0.8552105, 0, 0, 0.4146929, 0.9099615, 300, 255, 1),
(@OGUID+21, 188499, 571, 1, 1, 4845.617, -4811.589, 26.17898, 2.391098, 0, 0, 0.9304171, 0.3665025, 300, 255, 1);

DELETE FROM `creature` WHERE `id` IN (26811,26812);
DELETE FROM `creature` WHERE `guid` IN (113208,113209);
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+00 AND @CGUID+14;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+00, 26811, 571, 1, 1, 4733.245, -4857.637, 26.4931, 2.617994, 300, 5, 1),
(@CGUID+01, 26812, 571, 1, 1, 4796.549, -4846.317, 25.50747, 4.249843, 300, 5, 1),
(@CGUID+02, 26811, 571, 1, 1, 4766.232, -4820.333, 25.69218, 2.329675, 300, 5, 1),
(@CGUID+03, 26811, 571, 1, 1, 4823.353, -4839.751, 25.7641, 1.145746, 300, 5, 1),
(@CGUID+04, 26812, 571, 1, 1, 4797.967, -4783.413, 25.99624, 4.269053, 300, 5, 1),
(@CGUID+05, 26812, 571, 1, 1, 4759.746, -4835.385, 25.90628, 3.535823, 300, 5, 1),
(@CGUID+06, 26812, 571, 1, 1, 4782.295, -4858.29, 26.10907, 4.433136, 300, 5, 1),
(@CGUID+07, 26811, 571, 1, 1, 4795.084, -4869.773, 25.85341, 3.63068, 300, 5, 1),
(@CGUID+08, 26812, 571, 1, 1, 4758.876, -4857.517, 25.89942, 3.830702, 300, 5, 1),
(@CGUID+09, 26811, 571, 1, 1, 4809.717, -4858.999, 25.77467, 4.760717, 300, 5, 1),
(@CGUID+10, 26811, 571, 1, 1, 4801.294, -4802.357, 25.66738, 5.655887, 300, 5, 1),
(@CGUID+11, 26812, 571, 1, 1, 4831.968, -4810.053, 25.6752, 4.12599, 300, 5, 1),
(@CGUID+12, 26811, 571, 1, 1, 4845.415, -4821.253, 25.65237, 4.234284, 300, 5, 1),
(@CGUID+13, 26806, 571, 1, 1, 4668.349, -4849.098, 35.56351, 3.106686, 300, 0, 0),
(@CGUID+14, 26806, 571, 1, 1, 4669.264, -4869.123, 35.5635, 3.263766, 300, 0, 0);

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (26591,26811,26812);
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=188464;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (26591,26811,26812) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=188464 AND `source_type`=1;
DELETE FROM `smart_scripts` WHERE `entryorguid`=26812*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26591,0,0,0,38,0,100,0,0,1,0,0,11,47798,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Pacer Bunny - Drak Theron Exterior - On data set 0 1 - Spellcast Summon Mummy Remnants'),
(26811,0,0,1,8,0,100,0,47778,0,0,0,11,47795,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Warmonger - On spellhit Blow Snow - Spellcast Cold Cleanse'),
(26811,0,1,2,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Warmonger - On spellhit Blow Snow - Set event phase 1'),
(26811,0,2,3,61,0,100,0,0,0,0,0,18,33555200,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Warmonger - On spellhit Blow Snow - Set unit_flags IMMUNE_TO_PC, IMMUNE_TO_NPC, NOT_SELECTABLE'),
(26811,0,3,4,61,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Warmonger - On spellhit Blow Snow - Set run'),
(26811,0,4,0,61,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Warmonger - On spellhit Blow Snow - Stop combat movement'),
(26811,0,5,6,23,1,100,1,47795,0,0,0,69,1,0,0,0,0,0,20,188464,40,0,0,0,0,0, 'Ancient Drakkari Warmonger - On spellfade Cold Cleanse - Move to position Ancient Troll Mummy'),
(26811,0,6,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Warmonger - On spellfade Cold Cleanse - Say line'),
(26811,0,7,0,34,0,100,0,0,1,0,0,80,26812*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Warmonger - On movement inform - Run script'),
(26811,0,8,0,11,0,100,0,0,0,0,0,91,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Warmonger - On spawn - Remove unit_field_bytes1 (sleep)'),
(26812,0,0,1,8,0,100,0,47778,0,0,0,11,47795,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Soothsayer - On spellhit Blow Snow - Spellcast Cold Cleanse'),
(26812,0,1,2,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Soothsayer - On spellhit Blow Snow - Set event phase 1'),
(26812,0,2,3,61,0,100,0,0,0,0,0,18,33555200,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Soothsayer - On spellhit Blow Snow - Set unit_flags IMMUNE_TO_PC, IMMUNE_TO_NPC, NOT_SELECTABLE'),
(26812,0,3,4,61,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Soothsayer - On spellhit Blow Snow - Set run'),
(26812,0,4,0,61,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Soothsayer - On spellhit Blow Snow - Stop combat movement'),
(26812,0,5,6,23,1,100,1,47795,0,0,0,69,1,0,0,0,0,0,20,188464,40,0,0,0,0,0, 'Ancient Drakkari Soothsayer - On spellfade Cold Cleanse - Move to position Ancient Troll Mummy'),
(26812,0,6,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Soothsayer - On spellfade Cold Cleanse - Say line'),
(26812,0,7,0,34,0,100,0,0,1,0,0,80,26812*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Soothsayer - On movement inform - Run script'),
(26812,0,8,0,11,0,100,0,0,0,0,0,91,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Soothsayer - On spawn - Remove unit_field_bytes1 (sleep)'),

(188464,1,0,0,38,0,100,0,0,1,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Troll Mummy - On data set 0 1 - Change state (deactivated)'),
(188464,1,1,0,70,0,100,0,2,0,0,0,70,120,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Troll Mummy - On state changed - Despawn'),

(26812*100,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,19,26591,5,0,0,0,0,0, 'Ancient Drakkari script - Turn to Pacer Bunny - Drak Theron Exterior'),
(26812*100,9,1,0,0,0,100,0,50,50,0,0,90,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari script - Set unit_field_bytes1 (sleep)'),
(26812*100,9,2,0,0,0,100,0,2000,2000,0,0,19,33555200,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari script - Remove unit_flags IMMUNE_TO_PC, IMMUNE_TO_NPC, NOT_SELECTABLE'),
(26812*100,9,3,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,26591,5,0,0,0,0,0, 'Ancient Drakkari script - Set data 0 1 Pacer Bunny - Drak Theron Exterior'),
(26812*100,9,4,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,20,188464,5,0,0,0,0,0, 'Ancient Drakkari script - Set data 0 1 Ancient Troll Mummy'),
(26812*100,9,5,0,0,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari script - Despawn');

DELETE FROM `creature_text` WHERE `entry` IN (26811,26812);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(26811,0,0,'I could sleep forever, mon....',12,0,100,0,0,0,'Ancient Drakkari Warmonger'),
(26811,0,1,'Finally, I can be restin''...',12,0,100,0,0,0,'Ancient Drakkari Warmonger'),
(26811,0,2,'Free at last, mon.',12,0,100,0,0,0,'Ancient Drakkari Warmonger'),
(26811,0,3,'Where''s mah mummy?',12,0,100,0,0,0,'Ancient Drakkari Warmonger'),
(26812,0,0,'I could sleep forever, mon....',12,0,100,0,0,0,'Ancient Drakkari Soothsayer'),
(26812,0,1,'Finally, I can be restin''...',12,0,100,0,0,0,'Ancient Drakkari Soothsayer'),
(26812,0,2,'Free at last, mon.',12,0,100,0,0,0,'Ancient Drakkari Soothsayer'),
(26812,0,3,'Where''s mah mummy?',12,0,100,0,0,0,'Ancient Drakkari Soothsayer');
-- Fix quests Borrowed Technology, The Solution Solution /Daily/, Volatility, Volatility /Daily/
-- thanks to genjush for corrections on wrong quest ids
SET @Skytalon := 31583; -- Frostbrood Skytalon
SET @Decoy := 31578; -- Armored Decoy
SET @QuestCredit := 59329; -- Fake Soldier Kill Credit
SET @Stun := 59292; -- Freeze animation to look like Decoy
SET @Explosion := 59335; -- The spell that should kill Skytalon and Decoy
SET @Summon := 59303; -- Summon Skyatalon
SET @Immolation := 54690; -- Skytalon burning animation spell
SET @Grab := 59318;
SET @Bunny := 31630;
SET @PingBunny := 59375; -- Skytalon cast on accessory bunny to tell it to explode after 6 seconds
SET @Script := @Bunny * 100; -- Explosion bunny timed action list

-- Set inhabit type only 4 to Explosion Bunny that is a vehicle accessory of the Skytalon, otherwise it falls and add "Smart_AI"
UPDATE `creature_template` SET `InhabitType`=4,`AIName`='SmartAI',`flags_extra`=flags_extra|128 WHERE `entry`=@Bunny;
UPDATE `creature_template` SET `unit_flags`=unit_flags|0x00000100|0x00008000,`faction_A`=974,`faction_H`=974,`vehicleId`=279,`InhabitType`=4,`AIName`='',`ScriptName`='npc_frostbrood_skytalon',`HoverHeight`=5 WHERE `entry`=@Skytalon;
UPDATE `creature_template` SET `unit_flags`=unit_flags|0x00000100|0x00008000,`faction_A`=190,`faction_H`=190,`AIName`='SmartAI' WHERE `entry`=@Decoy;

-- Add missing equipment
DELETE FROM `creature_equip_template` WHERE `entry`=@Decoy;
INSERT INTO `creature_equip_template` (`entry`,`id`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES
(@Decoy,1,21573,0,0); -- Armored Decoy -> Monster - Sword, 1H Alliance PvP

-- Add creature_addon data
DELETE FROM `creature_template_addon` WHERE `entry`=@Skytalon;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(@Skytalon,0,0,50331648,1,0, '60534');

-- Insert spell_script names
DELETE FROM `spell_script_names` WHERE `spell_id` IN (@Grab,@Summon);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(@Grab, 'spell_q13291_q13292_q13239_q13261_frostbrood_skytalon_grab_decoy'),
(@Summon, 'spell_q13291_q13292_q13239_q13261_armored_decoy_summon_skytalon');

-- Quests relations
UPDATE `quest_template` SET `PrevQuestId`=13290,`NextQuestId`=13383 WHERE `id`=13291; -- Borrowed Technology
UPDATE `quest_template` SET `PrevQuestId`=13291,`NextQuestId`=0 WHERE `id`=13292; -- The Solution Solution /Daily/
UPDATE `quest_template` SET `PrevQuestId`=13238,`NextQuestId`=13379 WHERE `id`=13239; -- Volatility
UPDATE `quest_template` SET `PrevQuestId`=13329,`NextQuestId`=0 WHERE `id`=13261; -- Volatiliy /Daily/

-- Add SAI support for Explosion bunny and Decoy
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (@Bunny,@Decoy);
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@Script;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@Bunny,0,0,0,8,0,100,0,@PingBunny,0,0,0,80,@Script,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Explosion Bunny - On hit by ping bunny - Start timed action list'),
(@Script,9,0,0,0,0,100,0,6000,6000,0,0,11,@Explosion,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Explosion Bunny - Action 0 - Cast explosion on self'),
(@Decoy,0,0,1,54,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Armored Decoy - On just summoned - Store invoker /since target summoner fails/'),
(@Decoy,0,1,2,61,0,100,0,0,0,0,0,11,@Stun,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Armored Decoy - Linked - Cast Freeze animation on self'),
(@Decoy,0,2,0,61,0,100,0,0,0,0,0,11,@Summon,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Armored Decoy - Linked - Cast summon Skytalon behind'),
(@Decoy,0,3,0,8,0,100,0,@Explosion,0,0,0,11,@QuestCredit,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Armored Decoy - On hit by explosion - Cast kill credit to stored target');

-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (@Explosion,@PingBunny);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,@Explosion,0,0,31,0,3,@Decoy,0,0,0,0,'', 'Explosion Bunny can hit Armored Decoy'),
(13,1,@Explosion,0,1,31,0,3,@Skytalon,0,0,0,0,'', 'Explosion Bunny can hit Skytalon'),
(13,1,@PingBunny,0,0,31,0,3,@Bunny,0,0,0,0,'', 'Ping Bunny can hit only Explosion Bunny');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (26811,26812);
DELETE FROM `pool_creature` WHERE `pool_entry`=1077;
DELETE FROM `pool_template` WHERE `entry`=1077;
-- Update some gameobject data that is correct in WDB, but parsed wrong for some reason
UPDATE `gameobject_template` SET `faction`=35,`data17`=1,`data18`=0 WHERE `entry`=193908;
DELETE FROM `command` WHERE `name` IN
("deserter instance add",
"deserter instance remove",
"deserter bg add",
"deserter bg remove");

INSERT INTO `command` (`name`, `security`, `help`) VALUES
("deserter instance add", 3, "Syntax: .deserter instance add $time \n\n Adds the instance deserter debuff to your target with $time duration."),
("deserter instance remove", 3, "Syntax: .deserter instance remove \n\n Removes the instance deserter debuff from your target."),
("deserter bg add", 3, "Syntax: .deserter bg add $time \n\n Adds the bg deserter debuff to your target with $time duration."),
("deserter bg remove", 3, "Syntax: .deserter bg remove \n\n Removes the bg deserter debuff from your target.");
UPDATE `trinity_string` SET `content_default`='Map: %u (%s) Zone: %u (%s) Area: %u (%s) Phase: %u
X: %f Y: %f Z: %f Orientation: %f
grid[%u,%u]cell[%u,%u] InstanceID: %u
 ZoneX: %f ZoneY: %f
GroundZ: %f FloorZ: %f Have height data (Map: %u VMap: %u MMap: %u)' WHERE `entry`=101;
UPDATE `trinity_string` SET `content_default`='Unit Flags: %u.
Unit Flags 2: %u.
Dynamic Flags: %u.
Faction Template: %u.' WHERE `entry`=542;
SET @ADARRAH := 24405;
SET @WARMONGER := 26811;
SET @SOOTHSAYER := 26812;
SET @HARRISON := 26814;
SET @TECAHUNA := 26865;
SET @MUMMY_BUNNY := 26867;

DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@TECAHUNA;
DELETE FROM `creature_equip_template` WHERE `entry`=@HARRISON;

UPDATE `gameobject` SET `state`=1 WHERE `id`=188465;
UPDATE `gameobject` SET `state`=0 WHERE `id`=188480;

UPDATE `creature` SET `equipment_id`=0 WHERE `id`=@HARRISON;
DELETE FROM `creature` WHERE `guid`=86444;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(86444, @ADARRAH, 571, 1, 1, 4912.768, -4797.917, 32.68771, 3.595378, 300, 0, 0);

DELETE FROM `creature_template_addon` WHERE `entry` IN (@WARMONGER,@SOOTHSAYER,@MUMMY_BUNNY);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES
(@WARMONGER,'17327'),
(@SOOTHSAYER,'17327'),
(@MUMMY_BUNNY,'48150');

UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=@ADARRAH;
UPDATE `creature_template` SET `dmg_multiplier`=5 WHERE `entry`=@HARRISON;
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14, `unit_flags`=768, `dmg_multiplier`=6, `AIName`='SmartAI' WHERE `entry`=@TECAHUNA;
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14 WHERE `entry`=26871;
UPDATE `creature_template` SET `unit_flags`=33554688, `flags_extra`=128 WHERE `entry`=@MUMMY_BUNNY;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@ADARRAH,@HARRISON,@MUMMY_BUNNY);
UPDATE `gameobject_template` SET `flags`=2 WHERE `entry` IN (188472,188487);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ADARRAH,@HARRISON,@TECAHUNA,@MUMMY_BUNNY) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@WARMONGER AND `source_type`=0 AND `id`=9;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SOOTHSAYER AND `source_type`=0 AND `id` BETWEEN 9 AND 18;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ADARRAH*100,@HARRISON*100,@HARRISON*100+1,@HARRISON*100+2,@HARRISON*100+3,@HARRISON*100+4,@TECAHUNA*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ADARRAH,0,0,0,38,0,100,0,0,1,0,0,80,@ADARRAH*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Adarrah - On data set 0 1 - Run script'),
(@ADARRAH,0,1,0,40,0,100,0,6,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Adarrah - On WP reached - Despawn'),

(@WARMONGER,0,9,0,0,0,100,0,5000,7000,8000,12000,11,50370,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Ancient Drakkari Warmonger - On update IC - Spellcast Sunder Armor'),
(@SOOTHSAYER,0,9,10,4,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Soothsayer - On aggro - Set event phase 2'),
(@SOOTHSAYER,0,10,0,61,0,100,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Soothsayer - On aggro - Stop combat movement'),
(@SOOTHSAYER,0,11,0,0,2,100,0,0,0,3400,4800,11,9734,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Ancient Drakkari Soothsayer - On update IC (phase 2) - Spellcast Holy Smite'),
(@SOOTHSAYER,0,12,13,9,2,100,0,35,80,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Soothsayer - On target range 35y and more - Set event phase 3'),
(@SOOTHSAYER,0,13,0,61,0,100,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Soothsayer - On target range 40y and more - Start combat movement'),
(@SOOTHSAYER,0,14,10,9,0,100,0,5,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Soothsayer - On target range below 15y - Set event phase 2'),
(@SOOTHSAYER,0,15,13,9,0,100,0,0,5,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Soothsayer - On target range below 15y - Set event phase 2'),
(@SOOTHSAYER,0,16,13,3,0,100,0,0,7,0,0,22,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Soothsayer - On mana below 7% - Set event phase 4'),
(@SOOTHSAYER,0,17,13,3,8,100,0,15,100,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Soothsayer - On mana over 15% (phase 4) - Set event phase 2'),
(@SOOTHSAYER,0,18,0,7,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Ancient Drakkari Soothsayer - On evade - Set event phase 0'),

(@HARRISON,0,0,1,11,0,100,0,0,0,0,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On spawn - Reset faction'),
(@HARRISON,0,1,2,61,0,100,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On spawn - Set invincibility 1HP'),
(@HARRISON,0,2,0,61,0,100,0,0,0,0,0,71,0,3,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On spawn - Remove equip'),
(@HARRISON,0,3,4,19,0,100,0,12082,0,0,0,80,@HARRISON*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On quest accept - Run script 0'),
(@HARRISON,0,4,0,61,0,100,0,0,0,0,0,64,1,0,0,0,0,0,16,0,0,0,0,0,0,0, 'Harrison Jones - On quest accept - Store target list'),
(@HARRISON,0,5,6,40,0,100,0,7,@HARRISON,0,0,54,8500,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On WP 7 reached - Pause WP movement 8.5 seconds'),
(@HARRISON,0,6,0,61,0,100,0,0,0,0,0,1,1,6000,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On WP 7 reached - Say line'),
(@HARRISON,0,7,0,52,0,100,0,1,@HARRISON,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On text over - Say line'),
(@HARRISON,0,8,9,40,0,100,0,9,@HARRISON,0,0,54,12000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On WP 9 reached - Pause WP movement 12 seconds'),
(@HARRISON,0,9,0,61,0,100,0,0,0,0,0,80,@HARRISON*100+1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On WP 9 reached - Run script 1'),
(@HARRISON,0,10,11,40,0,100,0,11,@HARRISON,0,0,54,18000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On WP 11 reached - Pause WP movement 18 seconds'),
(@HARRISON,0,11,0,61,0,100,0,0,0,0,0,80,@HARRISON*100+2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On WP 11 reached - Run script 2'),
(@HARRISON,0,12,13,40,0,100,0,13,@HARRISON,0,0,54,4600,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On WP 13 reached - Pause WP movement 4.5 seconds'),
(@HARRISON,0,13,0,61,0,100,0,0,0,0,0,1,4,4600,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On WP 13 reached - Say line'),
(@HARRISON,0,14,0,52,0,100,0,4,@HARRISON,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On text over - Say line'),
(@HARRISON,0,15,0,40,0,100,0,16,@HARRISON,0,0,9,0,0,0,0,0,0,20,188480,50,0,0,0,0,0, 'Harrison Jones - On WP 16 reached - Activate Grizzly Hills - FireDoor01'),
(@HARRISON,0,16,17,40,0,100,0,17,@HARRISON,0,0,54,500,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On WP 17 reached - Say line'),
(@HARRISON,0,17,0,61,0,100,0,0,0,0,0,12,@TECAHUNA,2,300000,0,0,0,8,0,0,0,4906.587,-4818.92,32.63929,2.530727, 'Harrison Jones - On WP 17 reached - Summon Tecahuna'),
(@HARRISON,0,18,0,40,0,100,0,18,@HARRISON,0,0,80,@HARRISON*100+3,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On WP 18 reached - Run script'),
(@HARRISON,0,19,20,2,0,100,1,0,0.0014,0,0,32,0,0,0,0,0,0,20,188480,50,0,0,0,0,0, 'Harrison Jones - On health below 0.0014% - Activate Grizzly Hills - FireDoor01'),
(@HARRISON,0,20,21,61,0,100,0,0,0,0,0,6,12082,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Harrison Jones - On health below 0.0014% - Fail quest'),
(@HARRISON,0,21,0,61,0,100,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On health below 0.0014% - Die'),
(@HARRISON,0,22,23,56,0,100,0,17,@HARRISON,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On WP 17 resumed - Say line'),
(@HARRISON,0,23,0,61,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On WP 17 resumed - Set run'),
(@HARRISON,0,24,0,38,0,100,0,0,1,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On data set 0 1 - Set event phase 1'),
(@HARRISON,0,25,0,7,1,100,0,0,0,0,0,80,@HARRISON*100+4,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On homeposition (phase 1) - Run script'),
(@HARRISON,0,26,27,40,0,100,0,21,@HARRISON*10,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On WP 21 reached - Pause WP movement 6 seconds'),
(@HARRISON,0,27,0,61,0,100,0,0,0,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On WP 21 reached - Say line'),
(@HARRISON,0,28,29,56,0,100,0,21,@HARRISON*10,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On WP 21 resumed - Set run'),
(@HARRISON,0,29,0,61,0,100,0,0,0,0,0,15,12082,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Harrison Jones - On WP 21 resumed - Quest credit'),
(@HARRISON,0,30,0,40,0,100,0,25,@HARRISON*10,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On WP 25 reached - Despawn'),
(@HARRISON,0,31,0,4,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones - On aggro - Set reaction hostile'),

(@TECAHUNA,0,0,1,54,0,100,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tecahuna - Just summoned - Set invincibility 1HP'),
(@TECAHUNA,0,1,2,61,0,100,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tecahuna - Just summoned - Root'),
(@TECAHUNA,0,2,3,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tecahuna - Just summoned - Set event phase 1'),
(@TECAHUNA,0,3,0,61,0,100,0,0,0,0,0,80,@TECAHUNA*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Tecahuna - Just summoned - Run script'),
(@TECAHUNA,0,4,5,0,0,100,0,20000,25000,20000,30000,11,47601,0,0,0,0,0,19,@MUMMY_BUNNY,60,0,0,0,0,0, 'Tecahuna - On update IC - Spellcast Cosmetic - Tecahuna Spirit Beam'),
(@TECAHUNA,0,5,0,61,0,100,0,0,0,0,0,11,47601,0,0,0,0,0,19,@MUMMY_BUNNY,60,0,0,0,0,0, 'Tecahuna - On update IC - Spellcast Cosmetic - Tecahuna Spirit Beam'),
(@TECAHUNA,0,6,7,2,0,100,1,0,0.002,0,0,9,0,0,0,0,0,0,20,188480,50,0,0,0,0,0, 'Tecahuna - On health below 0.002% - Activate Grizzly Hills - FireDoor01'),
(@TECAHUNA,0,7,8,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,@HARRISON,50,0,0,0,0,0, 'Tecahuna - On health below 0.002% - Set data 0 1 Harrison Jones'),
(@TECAHUNA,0,8,9,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,11,@MUMMY_BUNNY,50,0,0,0,0,0, 'Tecahuna - On health below 0.002% - Set data 0 1 Mummy Effect Bunny'),
(@TECAHUNA,0,9,0,61,0,100,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tecahuna - On health below 0.002% - Die'),
(@TECAHUNA,0,10,0,7,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tecahuna - On evade - Set event phase 1'),
(@TECAHUNA,0,11,0,0,3,100,0,0,0,8000,9000,11,47629,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Tecahuna - On update IC (phase 1+2) - Spellcast Tecahuna Venom Spit'),
(@TECAHUNA,0,12,14,9,1,100,0,40,80,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tecahuna - On target range more than 40y (phase 1) - Unroot'),
(@TECAHUNA,0,13,14,9,0,100,0,0,5,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tecahuna - On target range below 5y - Unroot'),
(@TECAHUNA,0,14,0,61,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tecahuna - Linked - Set event phase 2'),
(@TECAHUNA,0,15,16,3,0,100,0,0,7,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tecahuna - On mana below 7% (phase 1) - Unroot'),
(@TECAHUNA,0,16,0,61,0,100,0,0,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tecahuna - Linked - Set event phase 3'),
(@TECAHUNA,0,17,19,9,0,100,0,5,15,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tecahuna - On target range below 15y - Root'),
(@TECAHUNA,0,18,19,3,4,100,0,15,100,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tecahuna - On mana 15% (phase 3) - Unroot'),
(@TECAHUNA,0,19,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tecahuna - Linked - Set event phase 1'),

(@MUMMY_BUNNY,0,0,0,8,0,100,0,47601,0,0,0,11,47602,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Mummy Effect Bunny - On spellhit Cosmetic - Tecahuna Spirit Beam - Spellcast Summon Ancient Drakkari King'),
(@MUMMY_BUNNY,0,1,0,38,0,100,0,0,1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Mummy Effect Bunny - On spellhit Cosmetic - On data set 0 1 - Despawn'),

(@ADARRAH*100,9,0,0,0,0,100,0,2000,2000,0,0,5,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Adarrah script - Play emote'),
(@ADARRAH*100,9,1,0,0,0,100,0,1900,1900,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Adarrah script - Say line'),
(@ADARRAH*100,9,2,0,0,0,100,0,1000,1000,0,0,53,1,@ADARRAH,0,0,0,0,1,0,0,0,0,0,0,0, 'Adarrah script - Start WP movement'),

(@HARRISON*100,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 0 - Say line'),
(@HARRISON*100,9,1,0,0,0,100,0,500,500,0,0,9,0,0,0,0,0,0,20,188465,5,0,0,0,0,0, 'Harrison Jones script 0 - Activate Harrison''s Cage'),
(@HARRISON*100,9,2,0,0,0,100,0,0,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 0 - Set faction'),
(@HARRISON*100,9,3,0,0,0,100,0,0,0,0,0,71,0,2,0,2081,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 0 - Equip'),
(@HARRISON*100,9,4,0,0,0,100,0,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 0 - Remove npcflag gossip'),
(@HARRISON*100,9,5,0,0,0,100,0,2500,2500,0,0,53,0,@HARRISON,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 0 - Start WP movement'),
(@HARRISON*100,9,6,0,0,0,100,0,7000,7000,0,0,9,0,0,0,0,0,0,20,188465,50,0,0,0,0,0, 'Harrison Jones script 0 - Activate Harrison''s Cage'),

(@HARRISON*100+1,9,0,0,0,0,100,0,0,0,0,0,17,133,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 1 - Play emote'),
(@HARRISON*100+1,9,1,0,0,0,100,0,2500,2500,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 1 - Stop emote'),
(@HARRISON*100+1,9,2,0,0,0,100,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 1 - Say line'),
(@HARRISON*100+1,9,3,0,0,0,100,0,0,0,0,0,9,0,0,0,0,0,0,20,188487,5,0,0,0,0,0, 'Harrison Jones script 1 - Activate Adarra''s Cage'),
(@HARRISON*100+1,9,4,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,@ADARRAH,5,0,0,0,0,0, 'Harrison Jones script 1 - Set data 0 1 Adarra''s Cage'),
(@HARRISON*100+1,9,5,0,0,0,100,0,10000,10000,0,0,9,0,0,0,0,0,0,20,188487,5,0,0,0,0,0, 'Harrison Jones script 1 - Activate Adarra''s Cage'),

(@HARRISON*100+2,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,6.143559, 'Harrison Jones script 2 - Set orientation'),
(@HARRISON*100+2,9,1,0,0,0,100,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 2 - Set unit_field_bytes1 (kneel)'),
(@HARRISON*100+2,9,2,0,0,0,100,0,2400,2400,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.677482, 'Harrison Jones script 2 - Set orientation'),
(@HARRISON*100+2,9,3,0,0,0,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 2 - Remove unit_field_bytes1 (kneel)'),
(@HARRISON*100+2,9,4,0,0,0,100,0,0,0,0,0,71,0,1,32246,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 2 - Equip'),
(@HARRISON*100+2,9,5,0,0,0,100,0,2500,2500,0,0,5,36,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 2 - Play emote'),
(@HARRISON*100+2,9,6,0,0,0,100,0,0,0,0,0,4,12827,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 2 - Play sound'),
(@HARRISON*100+2,9,7,0,0,0,100,0,0,0,0,0,11,47533,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 2 - Spellcast Camera Shake'),
(@HARRISON*100+2,9,8,0,0,0,100,0,2500,2500,0,0,5,36,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 2 - Play emote'),
(@HARRISON*100+2,9,9,0,0,0,100,0,0,0,0,0,4,12827,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 2 - Play sound'),
(@HARRISON*100+2,9,10,0,0,0,100,0,0,0,0,0,11,47533,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 2 - Spellcast Camera Shake'),
(@HARRISON*100+2,9,11,0,0,0,100,0,2500,2500,0,0,5,36,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 2 - Play emote'),
(@HARRISON*100+2,9,12,0,0,0,100,0,0,0,0,0,4,12827,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 2 - Play sound'),
(@HARRISON*100+2,9,13,0,0,0,100,0,0,0,0,0,11,47533,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 2 - Spellcast Camera Shake'),
(@HARRISON*100+2,9,14,0,0,0,100,0,2000,2000,0,0,12,@MUMMY_BUNNY,2,300000,0,0,0,8,0,0,0,4902.228,-4827.556,32.61251,2.443461, 'Harrison Jones script 2 - Summon Mummy Effect Bunny'),
(@HARRISON*100+2,9,15,0,0,0,100,0,0,0,0,0,12,@MUMMY_BUNNY,2,300000,0,0,0,8,0,0,0,4876.608,-4805.581,32.58254,6.178465, 'Harrison Jones script 2 - Summon Mummy Effect Bunny'),
(@HARRISON*100+2,9,16,0,0,0,100,0,0,0,0,0,12,@MUMMY_BUNNY,2,300000,0,0,0,8,0,0,0,4877.39,-4815.752,32.58345,0.1570796, 'Harrison Jones script 2 - Summon Mummy Effect Bunny'),
(@HARRISON*100+2,9,17,0,0,0,100,0,0,0,0,0,12,@MUMMY_BUNNY,2,300000,0,0,0,8,0,0,0,4883.104,-4823.975,32.58836,0.8726646, 'Harrison Jones script 2 - Summon Mummy Effect Bunny'),
(@HARRISON*100+2,9,18,0,0,0,100,0,0,0,0,0,12,@MUMMY_BUNNY,2,300000,0,0,0,8,0,0,0,4892.313,-4828.58,32.59582,1.570796, 'Harrison Jones script 2 - Summon Mummy Effect Bunny'),
(@HARRISON*100+2,9,19,0,0,0,100,0,0,0,0,0,12,@MUMMY_BUNNY,2,300000,0,0,0,8,0,0,0,4908.681,-4794.352,32.67061,3.979351, 'Harrison Jones script 2 - Summon Mummy Effect Bunny'),
(@HARRISON*100+2,9,20,0,0,0,100,0,0,0,0,0,12,@MUMMY_BUNNY,2,300000,0,0,0,8,0,0,0,4899.539,-4789.862,32.59812,4.764749, 'Harrison Jones script 2 - Summon Mummy Effect Bunny'),
(@HARRISON*100+2,9,21,0,0,0,100,0,0,0,0,0,12,@MUMMY_BUNNY,2,300000,0,0,0,8,0,0,0,4889.959,-4790.646,32.59848,5.201081, 'Harrison Jones script 2 - Summon Mummy Effect Bunny'),
(@HARRISON*100+2,9,22,0,0,0,100,0,0,0,0,0,12,@MUMMY_BUNNY,2,300000,0,0,0,8,0,0,0,4914.76,-4813.242,32.58661,3.01942, 'Harrison Jones script 2 - Summon Mummy Effect Bunny'),
(@HARRISON*100+2,9,23,0,0,0,100,0,0,0,0,0,12,@MUMMY_BUNNY,2,300000,0,0,0,8,0,0,0,4914.13,-4802.799,32.66964,3.420845, 'Harrison Jones script 2 - Summon Mummy Effect Bunny'),

(@HARRISON*100+3,9,0,0,0,0,100,0,0,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 3 - Say line'),
(@HARRISON*100+3,9,1,0,0,0,100,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 3 - Set homeposition'),
(@HARRISON*100+3,9,2,0,0,0,100,0,7200,7200,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 3 - Say line'),
(@HARRISON*100+3,9,3,0,0,0,100,0,6000,6000,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 3 - Start attack'),

(@HARRISON*100+4,9,0,0,0,0,100,0,1000,1000,0,0,53,1,@HARRISON*10,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 4 - Start WP movement'),
(@HARRISON*100+4,9,1,0,0,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Harrison Jones script 4 - Set event phase 0'),

(@TECAHUNA*100,9,0,0,0,0,100,0,15300,15300,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tecahuna script - Remove unit_flags IMMUNE_TO_PC, IMMUNE_TO_NPC'),
(@TECAHUNA*100,9,1,0,0,0,100,0,0,0,0,0,49,0,0,0,0,0,0,19,@HARRISON,30,0,0,0,0,0, 'Tecahuna script - Start attack');

DELETE FROM `creature_text` WHERE `entry` IN (@ADARRAH,@HARRISON);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ADARRAH,0,0,'Thank you!',12,0,100,17,0,0,'Adarrah'),
(@HARRISON,0,0,'Alright, kid. Stay behind me and you''ll be fine.',12,0,100,60,0,0,'Harrison Jones'),
(@HARRISON,1,0,'Their ceremonial chamber, where I was to be sacrificed...',12,0,100,396,0,0,'Harrison Jones'),
(@HARRISON,2,0,'Time to put an end to all this!',12,0,100,0,0,0,'Harrison Jones'),
(@HARRISON,3,0,'You''re free to go, miss.',12,0,100,0,0,0,'Harrison Jones'),
(@HARRISON,4,0,'Odd. That usually does it.',12,0,100,396,0,0,'Harrison Jones'),
(@HARRISON,5,0,'Just as well, I''ve had enough of this place.',12,0,100,0,0,0,'Harrison Jones'),
(@HARRISON,6,0,'What''s this?',12,0,100,0,0,0,'Harrison Jones'),
(@HARRISON,7,0,'Aww, not a snake!',12,0,100,0,0,0,'Harrison Jones'),
(@HARRISON,8,0,'Listen, kid. I can handle this thing. You just watch my back!',12,0,100,0,0,0,'Harrison Jones'),
(@HARRISON,9,0,'See ya ''round, kid!',12,0,100,0,0,0,'Harrison Jones');

DELETE FROM `waypoints` WHERE `entry` IN (@ADARRAH,@HARRISON,@HARRISON*10);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ADARRAH, 1,4902.543, -4798.52, 31.8586,'Adarrah'),
(@ADARRAH, 2,4893.144, -4795.715, 32.28691,'Adarrah'),
(@ADARRAH, 3,4887.894, -4793.465, 32.53691,'Adarrah'),
(@ADARRAH, 4,4878.785, -4793.664, 32.5359,'Adarrah'),
(@ADARRAH, 5,4863.294, -4785.226, 32.60138,'Adarrah'),
(@ADARRAH, 6,4839.031, -4774.794, 32.58206,'Adarrah'),

(@HARRISON, 1,4904.213, -4758.285, 27.27473,'Harrison Jones'),
(@HARRISON, 2,4896.463, -4755.535, 27.27473,'Harrison Jones'),
(@HARRISON, 3,4893.663, -4754.357, 27.23306,'Harrison Jones'),
(@HARRISON, 4,4886.543, -4762.921, 27.57825,'Harrison Jones'),
(@HARRISON, 5,4880.44, -4770.725, 30.70074,'Harrison Jones'),
(@HARRISON, 6,4876.696, -4790.863, 32.32729,'Harrison Jones'),
(@HARRISON, 7,4878.253, -4793.774, 32.53423,'Harrison Jones'),
(@HARRISON, 8,4882.602, -4795.872, 32.30199,'Harrison Jones'),
(@HARRISON, 9,4909.493, -4798.01, 32.54974,'Harrison Jones'),
(@HARRISON,10,4907.815, -4804.193, 31.78963,'Harrison Jones'),
(@HARRISON,11,4914.756, -4823.07, 32.66446,'Harrison Jones'),
(@HARRISON,12,4913.032, -4822.288, 32.63041,'Harrison Jones'),
(@HARRISON,13,4909.308, -4821.506, 32.59636,'Harrison Jones'),
(@HARRISON,14,4893.949, -4813.76, 31.7795,'Harrison Jones'),
(@HARRISON,15,4887.193, -4808.022, 32.0295,'Harrison Jones'),
(@HARRISON,16,4886.381, -4806.938, 32.29276,'Harrison Jones'),
(@HARRISON,17,4883.646, -4798.885, 32.57867,'Harrison Jones'),
(@HARRISON,18,4899.398, -4806.076, 32.02951,'Harrison Jones'),

(@HARRISON*10, 1,4893.088, -4802.876, 32.0295,'Harrison Jones'),
(@HARRISON*10, 2,4881.008, -4795.617, 32.50804,'Harrison Jones'),
(@HARRISON*10, 3,4857.754, -4778.792, 32.6265,'Harrison Jones'),
(@HARRISON*10, 4,4837.625, -4774.61, 32.5914,'Harrison Jones'),
(@HARRISON*10, 5,4817.824, -4790.486, 25.46436,'Harrison Jones'),
(@HARRISON*10, 6,4826.314, -4827.564, 25.48946,'Harrison Jones'),
(@HARRISON*10, 7,4826.336, -4841.321, 25.48413,'Harrison Jones'),
(@HARRISON*10, 8,4809.195, -4851.308, 25.52775,'Harrison Jones'),
(@HARRISON*10, 9,4781.125, -4849.693, 25.44121,'Harrison Jones'),
(@HARRISON*10,10,4761.496, -4853.984, 25.00991,'Harrison Jones'),
(@HARRISON*10,11,4719.89, -4857.747, 26.13666,'Harrison Jones'),
(@HARRISON*10,12,4693.853, -4858.84, 32.49986,'Harrison Jones'),
(@HARRISON*10,13,4680.416, -4861.247, 35.56741,'Harrison Jones'),
(@HARRISON*10,14,4673.966, -4864.334, 35.56741,'Harrison Jones'),
(@HARRISON*10,15,4662.382, -4882.535, 35.58759,'Harrison Jones'),
(@HARRISON*10,16,4658.195, -4895.924, 36.19548,'Harrison Jones'),
(@HARRISON*10,17,4656.812, -4915.515, 43.78271,'Harrison Jones'),
(@HARRISON*10,18,4659.832, -4928.781, 47.82988,'Harrison Jones'),
(@HARRISON*10,19,4664.121, -4942.443, 48.00279,'Harrison Jones'),
(@HARRISON*10,20,4666.967, -4951.508, 48.10587,'Harrison Jones'),
(@HARRISON*10,21,4675.692, -4970.227, 47.64427,'Harrison Jones'),
(@HARRISON*10,22,4681.637, -4973.975, 46.74993,'Harrison Jones'),
(@HARRISON*10,23,4707.978, -4997.285, 40.70398,'Harrison Jones'),
(@HARRISON*10,24,4712.889, -5002.176, 39.12014,'Harrison Jones'),
(@HARRISON*10,25,4739.859, -5031.481, 31.18226,'Harrison Jones');
SET @SWIFTSPEAR := 30395;
SET @GOSSIP :=9906;

DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=0;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,0,0,'I am sorry to disturb your rest, chieftain, but your brother''s spirit may be in danger. Would you tell me what you remember of him?',1,1,0,0,0,0,'');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,0,0,0,9,0,13037,0,0,0,0,'','Show gossip option only if player has quest Memories of Stormhoof');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@SWIFTSPEAR;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SWIFTSPEAR AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SWIFTSPEAR*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@SWIFTSPEAR,0,0,1,62,0,100,0,@GOSSIP,0,0,0,11,56760,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Chieftain Swiftspear - On gossip select - Spellcast Trigger Swiftspear Signal'),
(@SWIFTSPEAR,0,1,2,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Chieftain Swiftspear - On gossip select - Close gossip'),
(@SWIFTSPEAR,0,2,0,61,0,100,0,0,0,0,0,80,@SWIFTSPEAR*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Chieftain Swiftspear - On gossip select - Run script'),

(@SWIFTSPEAR*100,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chieftain Swiftspear script - Say line'),
(@SWIFTSPEAR*100,9,1,0,0,0,100,0,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chieftain Swiftspear script - Remove npcflag gossip'),
(@SWIFTSPEAR*100,9,2,0,0,0,100,0,6800,6800,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chieftain Swiftspear script - Say line'),
(@SWIFTSPEAR*100,9,3,0,0,0,100,0,6000,6000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chieftain Swiftspear script - Say line'),
(@SWIFTSPEAR*100,9,4,0,0,0,100,0,6000,6000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chieftain Swiftspear script - Say line'),
(@SWIFTSPEAR*100,9,5,0,0,0,100,0,6100,6100,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chieftain Swiftspear script - Say line'),
(@SWIFTSPEAR*100,9,6,0,0,0,100,0,7200,7200,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chieftain Swiftspear script - Say line'),
(@SWIFTSPEAR*100,9,7,0,0,0,100,0,6000,6000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chieftain Swiftspear script - Say line'),
(@SWIFTSPEAR*100,9,8,0,0,0,100,0,3600,3600,0,0,5,25,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chieftain Swiftspear script - Play emote'),
(@SWIFTSPEAR*100,9,9,0,0,0,100,0,2700,2700,0,0,82,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Chieftain Swiftspear script - Add npcflag gossip'),
(@SWIFTSPEAR*100,9,10,0,0,0,100,0,0,0,0,0,33,30381,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Chieftain Swiftspear script - Quest credit');

DELETE FROM `creature_text` WHERE `entry`=@SWIFTSPEAR;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@SWIFTSPEAR,0,0,'My brother, Stormhoof, was a far greater warrior than I. While I trained to be the chieftain of our clan, he prepared for a larger quest.',12,0,100,1,0,0,'Chieftain Swiftspear'),
(@SWIFTSPEAR,1,0,'How could he be in danger? All he wanted was to give us power over the elements that made life harsh for us here.',12,0,100,1,0,0,'Chieftain Swiftspear'),
(@SWIFTSPEAR,2,0,'He sought an artifact... a horn, I think. He left the village on a long journey in search of it.',12,0,100,6,0,0,'Chieftain Swiftspear'),
(@SWIFTSPEAR,3,0,'I know that a terrible enemy pursued him after he won the horn, but I... I don''t recall... what happened... next.',12,0,100,5,0,0,'Chieftain Swiftspear'),
(@SWIFTSPEAR,4,0,'It is as though my memories are shrouded in mist. I cannot even recall what became of my brother. Is this how you mean that he is in danger?',12,0,100,274,0,0,'Chieftain Swiftspear'),
(@SWIFTSPEAR,5,0,'The disturbances in the tomb, they must be involved. Look around you, $N. Do you see them?',12,0,100,25,0,0,'Chieftain Swiftspear'),
(@SWIFTSPEAR,6,0,'Yes, they are at fault, but I am powerless to stop them. Will you warn the people of Tunka''lo, stranger, that their past and their ancestors are in danger?',12,0,100,1,0,0,'Chieftain Swiftspear');
SET @BAT := 23959;
SET @BUNNY := 24230;

UPDATE `creature_template` SET `AIName`='SmartAI', `flags_extra`=`flags_extra`|128 WHERE `entry`=@BUNNY;
UPDATE `creature_template` SET `inhabitType`=4, `AIName`='SmartAI' WHERE `entry`=@BAT;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@BAT,@BUNNY) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@BAT,0,0,0,38,0,100,0,0,1,0,0,69,1,0,0,0,0,0,19,@BUNNY,50,0,0,0,0,0,'Darkclaw Bat - On data set 0 1 - Move to position'),
(@BAT,0,1,0,34,0,100,0,0,1,0,0,45,0,1,0,0,0,0,19,@BUNNY,5,0,0,0,0,0,'Darkclaw Bat - On movement inform - Spellcast Scare the Guano Out of Them!: Cast Spell 1 On Target''s Master'),
(@BUNNY,0,0,1,54,0,100,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Firecracker Bunny - Just summoned - Root'),
(@BUNNY,0,1,0,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,@BAT,50,0,0,0,0,0,'Firecracker Bunny - Just summoned - Set data 0 1 Darkclaw Bat'),
(@BUNNY,0,2,0,38,0,100,0,0,1,0,0,11,62068,0,0,0,0,0,1,0,0,0,0,0,0,0,'Firecracker Bunny - On spellhit Scare the Guano Out of Them!: Cast Spell 1 On Target''s Master - Crosscast owner Scare the Guano Out of Them!: Cast Spell 1 On Target''s Master'),
(@BUNNY,0,3,0,8,0,100,0,62068,0,0,0,86,43307,0,23,0,0,0,0,0,0,0,0,0,0,0,'Firecracker Bunny - On spellhit Scare the Guano Out of Them!: Cast Spell 1 On Target''s Master - Crosscast owner Scare the Guano Out of Them!: Cast Spell 1 On Target''s Master');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=43307;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13,1,43307,0,0,31,0,3,@BUNNY,0,0,0,'','Spell Scare the Guano Out of Them!: Summon Darkclaw Guano targets Firecracker Bunny');
-- playercreateinfo_spell
TRUNCATE TABLE `playercreateinfo_spell`;

ALTER TABLE `playercreateinfo_spell`
  CHANGE `race` `racemask` INT(10) UNSIGNED DEFAULT 0 NOT NULL,
  CHANGE `class` `classmask` INT(10) UNSIGNED DEFAULT 0 NOT NULL;

ALTER TABLE `playercreateinfo_spell_custom`
  CHANGE `race` `racemask` INT(10) UNSIGNED DEFAULT 0 NOT NULL,
  CHANGE `class` `classmask` INT(10) UNSIGNED DEFAULT 0 NOT NULL;

INSERT INTO `playercreateinfo_spell` (`racemask`, `classmask`, `Spell`, `Note`) VALUES
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 78, "Heroic Strike"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 81, "Dodge"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Shaman
(0x6FF, 0x43, 107, "Block"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Hunter, Death Knight
(0x6FF, 0x25, 196, "One-Handed Axes"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Priest, Shaman, Druid
(0x6FF, 0x453, 198, "One-Handed Maces"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Death Knight
(0x6FF, 0x27, 201, "One-Handed Swords"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 203, "Unarmed"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 204, "Defense"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 522, "SPELLDEFENSE (DND)"),
-- Races:   Human, Dwarf, Night elf, Gnome, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x44D, 0x5FF, 668, "Language Common"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 1843, "Disarm"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 2382, "Generic"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 2457, "Battle Stance"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 2479, "Honorless Target"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 3050, "Detect"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 3365, "Opening"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 5301, "Defensive State (DND)"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 6233, "Closing"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 6246, "Closing"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 6247, "Opening"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 6477, "Opening"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 6478, "Opening"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 6603, "Attack"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 7266, "Duel"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 7267, "Grovel"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 7355, "Stuck"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 8386, "Attacking"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Death Knight
(0x6FF, 0x23, 8737, "Mail"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Death Knight, Shaman, Druid
(0x6FF, 0x46F, 9077, "Leather"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 9078, "Cloth"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Shaman
(0x6FF, 0x43, 9116, "Shield"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 9125, "Generic"),
-- Races:   Human
-- Classes: Warrior, Paladin, Rogue, Priest, Death Knight, Mage, Warlock
(0x1, 0x1BB, 20597, "Sword Specialization"),
-- Races:   Human
-- Classes: Warrior, Paladin, Rogue, Priest, Death Knight, Mage, Warlock
(0x1, 0x1BB, 20598, "The Human Spirit"),
-- Races:   Human
-- Classes: Warrior, Paladin, Rogue, Priest, Death Knight, Mage, Warlock
(0x1, 0x1BB, 20599, "Diplomacy"),
-- Races:   Human
-- Classes: Warrior, Paladin, Rogue, Priest, Death Knight, Mage, Warlock
(0x1, 0x1BB, 20864, "Mace Specialization"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 21651, "Opening"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 21652, "Closing"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 22027, "Remove Insignia"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 22810, "Opening - No Text"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 32215, "Victorious State"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 45927, "Summon Friend"),
-- Races:   Human
-- Classes: Warrior, Paladin, Rogue, Priest, Death Knight, Mage, Warlock
(0x1, 0x1BB, 58985, "Perception"),
-- Races:   Human
-- Classes: Warrior, Paladin, Rogue, Priest, Death Knight, Mage, Warlock
(0x1, 0x1BB, 59752, "Every Man for Himself"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5FF, 61437, "Opening"),
-- Races:   Human, Dwarf, Tauren, Dranei
-- Classes: Warrior, Paladin
(0x425, 0x3, 199, "Two-Handed Maces"),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 635, "Holy Light"),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 21084, "Seal of Righteousness"),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27762, "Libram"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Warrior, Hunter, Rogue, Warlock, Druid
(0x2DF, 0x50D, 1180, "Daggers"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 1752, "Sinister Strike"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 2098, "Eviscerate"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Warrior, Rogue
(0x2DF, 0x9, 2567, "Thrown"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Warrior, Rogue
(0x2DF, 0x9, 2764, "Throw"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 16092, "Defensive State (DND)"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 21184, "Rogue Passive (DND)"),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 585, "Smite"),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 2050, "Lesser Heal"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Priest, Mage, Warlock
(0x6DF, 0x190, 5009, "Wands"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Priest, Mage, Warlock
(0x6DF, 0x190, 5019, "Shoot"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Hunter, Death Knight
(0x6FF, 0x25, 197, "Two-Handed Axes"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 200, "Polearms"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Death Knight
(0x6FF, 0x23, 202, "Two-Handed Swords"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Rogue, Death Knight
(0x6FF, 0x28, 674, "Dual Wield"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 750, "Plate Mail"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 3127, "Parry"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 3275, "Linen Bandage"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 3276, "Heavy Linen Bandage"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 3277, "Wool Bandage"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 3278, "Heavy Wool Bandage"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 7928, "Silk Bandage"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 7929, "Heavy Silk Bandage"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 7934, "Anti-Venom"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 10840, "Mageweave Bandage"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 10841, "Heavy Mageweave Bandage"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 10846, "First Aid"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 18629, "Runecloth Bandage"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 18630, "Heavy Runecloth Bandage"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 33391, "Journeyman Riding"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 45462, "Plague Strike"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 45477, "Icy Touch"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 45902, "Blood Strike"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 45903, "Offensive State (DND)"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 47541, "Death Coil"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 48266, "Blood Presence"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 49410, "Forceful Deflection"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 49576, "Death Grip"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 52665, "Sigil"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 59879, "Blood Plague"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 59921, "Frost Fever"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Death Knight
(0x6FF, 0x20, 61455, "Runic Focus"),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 133, "Fireball"),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 168, "Frost Armor"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5D0, 227, "Staves"),
-- Races:   Human, Orc, Undead, Gnome, Blood elf
-- Classes: Warlock
(0x253, 0x100, 686, "Shadow Bolt"),
-- Races:   Human, Orc, Undead, Gnome, Blood elf
-- Classes: Warlock
(0x253, 0x100, 687, "Demon Skin"),
-- Races:   Human, Orc, Undead, Gnome, Blood elf
-- Classes: Warlock
(0x253, 0x100, 58284, "Chaos Bolt Passive"),
-- Races:   Orc, Undead, Tauren, Troll, Blood elf
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Druid
(0x2B2, 0x5FF, 669, "Language Orcish"),
-- Races:   Orc
-- Classes: Warrior, Hunter, Rogue, Death Knight
(0x2, 0x2D, 20572, "Blood Fury"),
-- Races:   Orc
-- Classes: Warrior, Hunter, Rogue, Death Knight, Shaman, Warlock
(0x2, 0x16D, 20573, "Hardiness"),
-- Races:   Orc
-- Classes: Warrior, Hunter, Rogue, Death Knight, Shaman, Warlock
(0x2, 0x16D, 20574, "Axe Specialization"),
-- Races:   Orc
-- Classes: Warrior, Rogue, Shaman
(0x2, 0x49, 21563, "Command"),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 75, "Auto Shot"),
-- Races:   Orc, Night elf, Troll, Blood elf
-- Classes: Hunter
(0x28A, 0x4, 264, "Bows"),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 2973, "Raptor Strike"),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 13358, "Defensive State (DND)"),
-- Races:   Orc
-- Classes: Hunter
(0x2, 0x4, 20576, "Command"),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 24949, "Defensive State 2 (DND)"),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 34082, "Advantaged State (DND)"),
-- Races:   Orc
-- Classes: Death Knight
(0x2, 0x20, 54562, "Command"),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 331, "Healing Wave"),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 403, "Lightning Bolt"),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 27763, "Totem"),
-- Races:   Orc
-- Classes: Shaman
(0x2, 0x40, 33697, "Blood Fury"),
-- Races:   Orc
-- Classes: Warlock
(0x2, 0x100, 20575, "Command"),
-- Races:   Orc
-- Classes: Warlock
(0x2, 0x100, 33702, "Blood Fury"),
-- Races:   Dwarf
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight
(0x4, 0x3F, 672, "Language Dwarven"),
-- Races:   Dwarf
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight
(0x4, 0x3F, 2481, "Find Treasure"),
-- Races:   Dwarf
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight
(0x4, 0x3F, 20594, "Stoneform"),
-- Races:   Dwarf
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight
(0x4, 0x3F, 20595, "Gun Specialization"),
-- Races:   Dwarf
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight
(0x4, 0x3F, 20596, "Frost Resistance"),
-- Races:   Dwarf
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Death Knight
(0x4, 0x3F, 59224, "Mace Specialization"),
-- Races:   Dwarf, Tauren
-- Classes: Hunter
(0x24, 0x4, 266, "Guns"),
-- Races:   Night elf
-- Classes: Warrior, Hunter, Rogue, Priest, Death Knight, Druid
(0x8, 0x43D, 671, "Language Darnassian"),
-- Races:   Night elf
-- Classes: Warrior, Hunter, Rogue, Priest, Death Knight, Druid
(0x8, 0x43D, 20582, "Quickness"),
-- Races:   Night elf
-- Classes: Warrior, Hunter, Rogue, Priest, Death Knight, Druid
(0x8, 0x43D, 20583, "Nature Resistance"),
-- Races:   Night elf
-- Classes: Warrior, Hunter, Rogue, Priest, Death Knight, Druid
(0x8, 0x43D, 20585, "Wisp Spirit"),
-- Races:   Night elf
-- Classes: Warrior, Hunter, Rogue, Priest, Death Knight, Druid
(0x8, 0x43D, 58984, "Shadowmelt"),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 5176, "Wrath"),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 5185, "Healing Touch"),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 27764, "Fetish"),
-- Races:   Undead
-- Classes: Warrior, Rogue, Priest, Death Knight, Mage, Warlock
(0x10, 0x1B9, 5227, "Underwater Breathing"),
-- Races:   Undead
-- Classes: Warrior, Rogue, Priest, Death Knight, Mage, Warlock
(0x10, 0x1B9, 7744, "Will of the Forsaken"),
-- Races:   Undead
-- Classes: Warrior, Rogue, Priest, Death Knight, Mage, Warlock
(0x10, 0x1B9, 17737, "Language Gutterspeak"),
-- Races:   Undead
-- Classes: Warrior, Rogue, Priest, Death Knight, Mage, Warlock
(0x10, 0x1B9, 20577, "Cannibalize"),
-- Races:   Undead
-- Classes: Warrior, Rogue, Priest, Death Knight, Mage, Warlock
(0x10, 0x1B9, 20579, "Shadow Resistance"),
-- Races:   Tauren
-- Classes: Warrior, Hunter, Death Knight, Shaman, Druid
(0x20, 0x465, 670, "Language Taurahe"),
-- Races:   Tauren
-- Classes: Warrior, Hunter, Death Knight, Shaman, Druid
(0x20, 0x465, 20549, "War Stomp"),
-- Races:   Tauren
-- Classes: Warrior, Hunter, Death Knight, Shaman, Druid
(0x20, 0x465, 20550, "Endurance"),
-- Races:   Tauren
-- Classes: Warrior, Hunter, Death Knight, Shaman, Druid
(0x20, 0x465, 20551, "Nature Resistance"),
-- Races:   Tauren
-- Classes: Warrior, Hunter, Death Knight, Shaman, Druid
(0x20, 0x465, 20552, "Cultivation"),
-- Races:   Gnome
-- Classes: Warrior, Rogue, Death Knight, Mage, Warlock
(0x40, 0x1A9, 7340, "Language Gnomish"),
-- Races:   Gnome
-- Classes: Warrior, Rogue, Death Knight, Mage, Warlock
(0x40, 0x1A9, 20589, "Escape Artist"),
-- Races:   Gnome
-- Classes: Warrior, Rogue, Death Knight, Mage, Warlock
(0x40, 0x1A9, 20591, "Expansive Mind"),
-- Races:   Gnome
-- Classes: Warrior, Rogue, Death Knight, Mage, Warlock
(0x40, 0x1A9, 20592, "Arcane Resistance"),
-- Races:   Gnome
-- Classes: Warrior, Rogue, Death Knight, Mage, Warlock
(0x40, 0x1A9, 20593, "Engineering Specialization"),
-- Races:   Troll
-- Classes: Warrior, Hunter, Rogue, Priest, Death Knight, Shaman, Mage
(0x80, 0xFD, 7341, "Language Troll"),
-- Races:   Troll
-- Classes: Warrior, Hunter, Rogue, Priest, Death Knight, Shaman, Mage
(0x80, 0xFD, 20555, "Regeneration"),
-- Races:   Troll
-- Classes: Warrior, Hunter, Rogue, Priest, Death Knight, Shaman, Mage
(0x80, 0xFD, 20557, "Beast Slaying"),
-- Races:   Troll
-- Classes: Warrior, Hunter, Rogue, Priest, Death Knight, Shaman, Mage
(0x80, 0xFD, 20558, "Throwing Specialization"),
-- Races:   Troll
-- Classes: Warrior, Hunter, Rogue, Priest, Death Knight, Shaman, Mage
(0x80, 0xFD, 26290, "Bow Specialization"),
-- Races:   Troll
-- Classes: Warrior, Hunter, Rogue, Priest, Death Knight, Shaman, Mage
(0x80, 0xFD, 26297, "Berserking"),
-- Races:   Troll
-- Classes: Warrior, Hunter, Rogue, Priest, Death Knight, Shaman, Mage
(0x80, 0xFD, 58943, "Da Voodoo Shuffle"),
-- Races:   Blood elf
-- Classes: Paladin, Hunter, Rogue, Priest, Death Knight, Mage, Warlock
(0x200, 0x1BE, 813, "Language Thalassian"),
-- Races:   Blood elf
-- Classes: Paladin, Hunter, Rogue, Priest, Death Knight, Mage, Warlock
(0x200, 0x1BE, 822, "Magic Resistance"),
-- Races:   Blood elf
-- Classes: Paladin, Hunter, Priest, Mage, Warlock
(0x200, 0x196, 28730, "Arcane Torrent"),
-- Races:   Blood elf
-- Classes: Paladin, Hunter, Rogue, Priest, Death Knight, Mage, Warlock
(0x200, 0x1BE, 28877, "Arcane Affinity"),
-- Races:   Blood elf
-- Classes: Rogue
(0x200, 0x8, 25046, "Arcane Torrent"),
-- Races:   Blood elf
-- Classes: Death Knight
(0x200, 0x20, 50613, "Arcane Torrent"),
-- Races:   Dranei
-- Classes: Warrior, Paladin, Hunter, Death Knight
(0x400, 0x27, 6562, "Heroic Presence"),
-- Races:   Dranei
-- Classes: Warrior, Paladin, Hunter, Priest, Death Knight, Shaman, Mage
(0x400, 0xF7, 28875, "Gemcutting"),
-- Races:   Dranei
-- Classes: Warrior
(0x400, 0x1, 28880, "Gift of the Naaru"),
-- Races:   Dranei
-- Classes: Warrior, Paladin, Hunter, Priest, Death Knight, Shaman, Mage
(0x400, 0xF7, 29932, "Language Draenei"),
-- Races:   Dranei
-- Classes: Mage
(0x400, 0x80, 59541, "Shadow Resistance"),
-- Races:   Dranei
-- Classes: Paladin
(0x400, 0x2, 59542, "Gift of the Naaru"),
-- Races:   Dranei
-- Classes: Hunter
(0x400, 0x4, 5011, "Crossbows"),
-- Races:   Dranei
-- Classes: Shaman
(0x400, 0x40, 59540, "Shadow Resistance"),
-- Races:   Dranei
-- Classes: Hunter
(0x400, 0x4, 59543, "Gift of the Naaru"),
-- Races:   Dranei
-- Classes: Priest, Shaman, Mage
(0x400, 0xD0, 28878, "Inspiring Presence"),
-- Races:   Dranei
-- Classes: Death Knight
(0x400, 0x20, 59539, "Shadow Resistance"),
-- Races:   Dranei
-- Classes: Priest
(0x400, 0x10, 59544, "Gift of the Naaru"),
-- Races:   Dranei
-- Classes: Priest
(0x400, 0x10, 59538, "Shadow Resistance"),
-- Races:   Dranei
-- Classes: Hunter
(0x400, 0x4, 59536, "Shadow Resistance"),
-- Races:   Dranei
-- Classes: Death Knight
(0x400, 0x20, 59545, "Gift of the Naaru"),
-- Races:   Dranei
-- Classes: Paladin
(0x400, 0x2, 59535, "Shadow Resistance"),
-- Races:   Dranei
-- Classes: Shaman
(0x400, 0x40, 59547, "Gift of the Naaru"),
-- Races:   Dranei
-- Classes: Warrior
(0x400, 0x1, 59221, "Shadow Resistance"),
-- Races:   Dranei
-- Classes: Mage
(0x400, 0x80, 59548, "Gift of the Naaru"),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 60091, "Judgement Anti-Parry/Dodge Passive"),
-- Races:   All
-- Classes: Death Knight
(0x0, 0x20, 56816, "Rune Strike"),
-- Races:   All
-- Classes: Shaman
(0x0, 0x40, 75461, "Flame Shock Passive"),
-- Races:   All
-- Classes: Warlock
(0x0, 0x100, 75445, "Demonic Immolate");
TRUNCATE TABLE `playercreateinfo_spell_custom`;

INSERT INTO playercreateinfo_spell_custom (racemask, classmask, Spell, Note) VALUES
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 78, "Heroic Strike"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 81, "Dodge"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Shaman
(0x6FF, 0x43, 107, "Block"),
-- Races:   Human, Orc, Dwarf, Tauren, Troll
-- Classes: Warrior, Hunter
(0xA7, 0x5, 196, "One-Handed Axes"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Priest, Shaman, Druid
(0x6FF, 0x453, 198, "One-Handed Maces"),
-- Races:   Human, Orc, Night elf, Undead, Gnome, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter
(0x65B, 0x7, 201, "One-Handed Swords"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 203, "Unarmed"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 204, "Defense"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 522, "SPELLDEFENSE(DND)"),
-- Races:   Human, Dwarf, Night elf, Gnome, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x44D, 0x5DF, 668, "Language Common"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 2382, "Generic"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 2457, "Battle Stance"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 2479, "Honorless Target"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 3050, "Detect"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 3365, "Opening"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 5301, "Defensive State(DND)"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 6233, "Closing"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 6246, "Closing"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 6247, "Opening"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 6477, "Opening"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 6478, "Opening"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 6603, "Attack"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 7266, "Duel"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 7267, "Grovel"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 7355, "Stuck"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 7376, "Defensive Stance Passive"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 7381, "Berserker Stance Passive"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 8386, "Attacking"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Shaman
(0x6FF, 0x47, 8737, "Mail"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Shaman, Druid
(0x6FF, 0x44F, 9077, "Leather"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 9078, "Cloth"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Shaman
(0x6FF, 0x43, 9116, "Shield"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 9125, "Generic"),
-- Races:   Human
-- Classes: Warrior, Paladin, Rogue, Priest, Mage, Warlock
(0x1, 0x19B, 20597, "Sword Specialization"),
-- Races:   Human
-- Classes: Warrior, Paladin, Rogue, Priest, Mage, Warlock
(0x1, 0x19B, 20598, "The Human Spirit"),
-- Races:   Human
-- Classes: Warrior, Paladin, Rogue, Priest, Mage, Warlock
(0x1, 0x19B, 20599, "Diplomacy"),
-- Races:   Human
-- Classes: Warrior, Paladin, Rogue, Priest, Mage, Warlock
(0x1, 0x19B, 20600, "Perception"),
-- Races:   Human
-- Classes: Warrior, Paladin, Rogue, Priest, Mage, Warlock
(0x1, 0x19B, 20864, "Mace Specialization"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 21156, "Battle Stance Passive"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 21651, "Opening"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 21652, "Closing"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 22027, "Remove Insignia"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x6FF, 0x5DF, 22810, "Opening - No Text"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 32215, "Victorious State"),
-- Races:   Human, Dwarf, Tauren, Dranei
-- Classes: Warrior, Paladin
(0x425, 0x3, 199, "Two-Handed Maces"),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 635, "Holy Light"),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 21084, "Seal of Righteousness"),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27762, "Libram"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Warrior, Hunter, Rogue, Warlock, Druid
(0x2DF, 0x50D, 1180, "Daggers"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 1752, "Sinister Strike"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 2098, "Eviscerate"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Warrior, Rogue
(0x2DF, 0x9, 2567, "Thrown"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Warrior, Rogue
(0x2DF, 0x9, 2764, "Throw"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 16092, "Defensive State(DND)"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 21184, "Rogue Passive(DND)"),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 585, "Smite"),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 2050, "Lesser Heal"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Priest, Mage, Warlock
(0x6DF, 0x190, 5009, "Wands"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Priest, Mage, Warlock
(0x6DF, 0x190, 5019, "Shoot"),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 133, "Fireball"),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 168, "Frost Armor"),
-- Races:   Human, Orc, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Shaman, Mage, Druid
(0x6FB, 0x4C0, 227, "Staves"),
-- Races:   Human, Orc, Undead, Gnome, Blood elf
-- Classes: Warlock
(0x253, 0x100, 686, "Shadow Bolt"),
-- Races:   Human, Orc, Undead, Gnome, Blood elf
-- Classes: Warlock
(0x253, 0x100, 687, "Demon Skin"),
-- Races:   Orc, Dwarf
-- Classes: Warrior
(0x6, 0x1, 197, "Two-Handed Axes"),
-- Races:   Orc, Undead, Tauren, Troll, Blood elf
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock, Druid
(0x2B2, 0x5DF, 669, "Language Orcish"),
-- Races:   Orc
-- Classes: Warrior, Hunter, Rogue
(0x2, 0xD, 20572, "Blood Fury"),
-- Races:   Orc
-- Classes: Warrior, Hunter, Rogue, Shaman, Warlock
(0x2, 0x14D, 20573, "Hardiness"),
-- Races:   Orc
-- Classes: Warrior, Hunter, Rogue, Shaman, Warlock
(0x2, 0x14D, 20574, "Axe Specialization"),
-- Races:   Orc
-- Classes: Warrior, Rogue, Shaman
(0x2, 0x49, 21563, "Command"),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 75, "Auto Shot"),
-- Races:   Orc, Night elf, Troll, Blood elf
-- Classes: Hunter
(0x28A, 0x4, 264, "Bows"),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 2973, "Raptor Strike"),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 13358, "Defensive State(DND)"),
-- Races:   Orc
-- Classes: Hunter
(0x2, 0x4, 20576, "Command"),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 24949, "Defensive State 2(DND)"),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 34082, "Advantaged State(DND)"),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 331, "Healing Wave"),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 403, "Lightning Bolt"),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 27763, "Totem"),
-- Races:   Orc
-- Classes: Shaman
(0x2, 0x40, 33697, "Blood Fury"),
-- Races:   Orc
-- Classes: Warlock
(0x2, 0x100, 20575, "Command"),
-- Races:   Orc
-- Classes: Warlock
(0x2, 0x100, 33702, "Blood Fury"),
-- Races:   Dwarf
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest
(0x4, 0x1F, 672, "Language Dwarven"),
-- Races:   Dwarf
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest
(0x4, 0x1F, 2481, "Find Treasure"),
-- Races:   Dwarf
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest
(0x4, 0x1F, 20594, "Stoneform"),
-- Races:   Dwarf
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest
(0x4, 0x1F, 20595, "Gun Specialization"),
-- Races:   Dwarf
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest
(0x4, 0x1F, 20596, "Frost Resistance"),
-- Races:   Dwarf, Tauren
-- Classes: Hunter
(0x24, 0x4, 266, "Guns"),
-- Races:   Night elf
-- Classes: Warrior, Hunter, Rogue, Priest, Druid
(0x8, 0x41D, 671, "Language Darnassian"),
-- Races:   Night elf
-- Classes: Warrior, Hunter, Rogue, Priest, Druid
(0x8, 0x41D, 20580, "Shadowmeld"),
-- Races:   Night elf
-- Classes: Warrior, Hunter, Rogue, Priest, Druid
(0x8, 0x41D, 20582, "Quickness"),
-- Races:   Night elf
-- Classes: Warrior, Hunter, Rogue, Priest, Druid
(0x8, 0x41D, 20583, "Nature Resistance"),
-- Races:   Night elf
-- Classes: Warrior, Hunter, Rogue, Priest, Druid
(0x8, 0x41D, 20585, "Wisp Spirit"),
-- Races:   Night elf
-- Classes: Warrior, Hunter, Rogue, Priest, Druid
(0x8, 0x41D, 21009, "Shadowmeld Passive"),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 1178, "Bear Form(Passive)"),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 3025, "Cat Form(Passive)"),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 5176, "Wrath"),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 5185, "Healing Touch"),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 5419, "Travel Form(Passive)"),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 5420, "Tree of Life"),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 5421, "Aquatic Form(Passive)"),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 9635, "Dire Bear Form(Passive)"),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 21178, "Bear Form(Passive2)"),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 24905, "Moonkin Form(Passive)"),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 27764, "Fetish"),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 33948, "Flight Form(Passive)"),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 34123, "Tree of Life(Passive)"),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 40121, "Swift Flight Form(Passive)"),
-- Races:   Undead, Blood elf, Dranei
-- Classes: Warrior, Paladin
(0x610, 0x3, 202, "Two-Handed Swords"),
-- Races:   Undead
-- Classes: Warrior, Rogue, Priest, Mage, Warlock
(0x10, 0x199, 5227, "Underwater Breathing"),
-- Races:   Undead
-- Classes: Warrior, Rogue, Priest, Mage, Warlock
(0x10, 0x199, 7744, "Will of the Forsaken"),
-- Races:   Undead
-- Classes: Warrior, Rogue, Priest, Mage, Warlock
(0x10, 0x199, 17737, "Language Gutterspeak"),
-- Races:   Undead
-- Classes: Warrior, Rogue, Priest, Mage, Warlock
(0x10, 0x199, 20577, "Cannibalize"),
-- Races:   Undead, Dranei
-- Classes: Warrior, Paladin, Hunter, Rogue, Priest, Shaman, Mage, Warlock
(0x410, 0x1DF, 20579, "Shadow Resistance"),
-- Races:   Tauren
-- Classes: Warrior, Hunter, Shaman, Druid
(0x20, 0x445, 670, "Language Taurahe"),
-- Races:   Tauren
-- Classes: Warrior, Hunter, Shaman, Druid
(0x20, 0x445, 20549, "War Stomp"),
-- Races:   Tauren
-- Classes: Warrior, Hunter, Shaman, Druid
(0x20, 0x445, 20550, "Endurance"),
-- Races:   Tauren
-- Classes: Warrior, Hunter, Shaman, Druid
(0x20, 0x445, 20551, "Nature Resistance"),
-- Races:   Tauren
-- Classes: Warrior, Hunter, Shaman, Druid
(0x20, 0x445, 20552, "Cultivation"),
-- Races:   Gnome
-- Classes: Warrior, Rogue, Mage, Warlock
(0x40, 0x189, 7340, "Language Gnomish"),
-- Races:   Gnome
-- Classes: Warrior, Rogue, Mage, Warlock
(0x40, 0x189, 20589, "Escape Artist"),
-- Races:   Gnome
-- Classes: Warrior, Rogue, Mage, Warlock
(0x40, 0x189, 20591, "Expansive Mind"),
-- Races:   Gnome
-- Classes: Warrior, Rogue, Mage, Warlock
(0x40, 0x189, 20592, "Arcane Resistance"),
-- Races:   Gnome
-- Classes: Warrior, Rogue, Mage, Warlock
(0x40, 0x189, 20593, "Engineering Specialization"),
-- Races:   Troll
-- Classes: Warrior, Hunter, Rogue, Priest, Shaman, Mage
(0x80, 0xDD, 7341, "Language Troll"),
-- Races:   Troll
-- Classes: Warrior, Hunter, Rogue, Priest, Shaman, Mage
(0x80, 0xDD, 20555, "Regeneration"),
-- Races:   Troll
-- Classes: Warrior, Hunter, Rogue, Priest, Shaman, Mage
(0x80, 0xDD, 20557, "Beast Slaying"),
-- Races:   Troll
-- Classes: Warrior, Hunter, Rogue, Priest, Shaman, Mage
(0x80, 0xDD, 20558, "Throwing Specialization"),
-- Races:   Troll
-- Classes: Warrior, Hunter, Rogue, Priest, Shaman, Mage
(0x80, 0xDD, 26290, "Bow Specialization"),
-- Races:   Troll
-- Classes: Warrior
(0x80, 0x1, 26296, "Berserking"),
-- Races:   Troll
-- Classes: Hunter, Priest, Shaman, Mage
(0x80, 0xD4, 20554, "Berserking"),
-- Races:   Troll
-- Classes: Rogue
(0x80, 0x8, 26297, "Berserking"),
-- Races:   Blood elf
-- Classes: Paladin, Hunter, Rogue, Priest, Mage, Warlock
(0x200, 0x19E, 813, "Language Thalassian"),
-- Races:   Blood elf
-- Classes: Paladin, Hunter, Rogue, Priest, Mage, Warlock
(0x200, 0x19E, 822, "Magic Resistance"),
-- Races:   Blood elf
-- Classes: Paladin, Hunter, Priest, Mage, Warlock
(0x200, 0x196, 28730, "Arcane Torrent"),
-- Races:   Blood elf
-- Classes: Paladin, Hunter, Rogue, Priest, Mage, Warlock
(0x200, 0x19E, 28877, "Arcane Affinity"),
-- Races:   Blood elf
-- Classes: Rogue
(0x200, 0x8, 25046, "Arcane Torrent"),
-- Races:   Dranei
-- Classes: Warrior, Paladin, Hunter
(0x400, 0x7, 6562, "Heroic Presence"),
-- Races:   Dranei
-- Classes: Warrior, Paladin, Hunter, Priest, Shaman, Mage
(0x400, 0xD7, 28875, "Gemcutting"),
-- Races:   Dranei
-- Classes: Warrior, Paladin, Hunter, Priest, Shaman, Mage
(0x400, 0xD7, 28880, "Gift of the Naaru"),
-- Races:   Dranei
-- Classes: Warrior, Paladin, Hunter, Priest, Shaman, Mage
(0x400, 0xD7, 29932, "Language Draenei"),
-- Races:   Dranei
-- Classes: Hunter
(0x400, 0x4, 5011, "Crossbows"),
-- Races:   Dranei
-- Classes: Priest, Shaman, Mage
(0x400, 0xD0, 28878, "Inspiring Presence"),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 2048, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 30324, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 11578, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 25208, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 25264, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 2687, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 71, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 25225, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 355, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 11585, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 29704, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 25203, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 30357, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 25266, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 2565, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 676, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 25231, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 20230, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 5246, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 25236, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 1161, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 871, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 2458, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 25275, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 25242, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 18499, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 1680, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 6554, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 1719, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 34428, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 23920, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 469, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 3411, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 27014, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 1494, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 13163, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 27016, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 27019, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 14325, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 5116, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 27044, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 883, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 2641, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 6991, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 982, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 1515, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 19883, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 27020, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 27046, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 14268, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 6197, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 1002, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 14327, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 27023, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 36916, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 27021, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 19884, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 5118, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 27015, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 14311, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 3043, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 1462, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 19885, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 3045, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 19880, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 13809, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 13161, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 5384, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 1543, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 19878, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 27025, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 27018, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 13159, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 19882, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 27022, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 27045, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 19879, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 19801, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 34120, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 34074, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 34026, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 34600, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 34477, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27149, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27136, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27155, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27140, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 20271, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27158, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 10308, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 10278, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27154, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 20773, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27142, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 31789, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27150, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 25780, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 1044, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 33776, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27173, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27138, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27137, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 5502, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 19746, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 31895, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 5627, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 1038, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27151, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 19752, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27160, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27152, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 1020, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27153, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27166, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27144, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 4987, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27180, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27148, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27139, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27141, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 10326, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27143, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 25898, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27145, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 25895, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 32223, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 27169, ""),
-- Races:   Human, Dwarf, Blood elf, Dranei
-- Classes: Paladin
(0x605, 0x2, 31884, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 26865, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 26862, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 1787, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 26863, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 921, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 38764, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 26669, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 11297, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 6774, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 11305, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 38768, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 26866, ""),
-- Races:   Human, Orc, Dwarf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2D7, 0x8, 26884, ""),
-- Races:   Human, Orc, Dwarf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2D7, 0x8, 27448, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 1804, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 27441, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 2842, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 1725, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 26867, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 26889, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 1833, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 1842, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 408, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 2094, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 32684, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 26679, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 31224, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 5938, ""),
-- Races:   Night elf
-- Classes: Rogue
(0x8, 0x8, 426884, ""),
-- Races:   Night elf
-- Classes: Rogue
(0x8, 0x8, 427448, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 27215, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 27209, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 27216, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 30909, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 27222, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 27218, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 6215, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 27230, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 27217, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 27259, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 27226, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 27220, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 5697, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 27238, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 30459, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 27260, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 27212, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 698, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 5500, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 30908, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 11719, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 132, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 18647, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 27213, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 11726, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 27228, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 28610, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 28172, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 27250, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 17928, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 27223, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 27229, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 30545, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 30910, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 18540, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 28189, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 32231, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 29858, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 29893, ""),
-- Races:   Human, Orc, Undead, Gnome, Dranei
-- Classes: Warlock
(0x453, 0x100, 27243, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 26979, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 26990, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 26985, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 26988, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 26982, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 26992, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 26989, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 26998, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 6795, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 26996, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 18960, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 9634, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 768, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 783, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 1066, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 40120, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 5229, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 26980, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 8983, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 8946, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 26997, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 26993, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 18658, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 27000, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 9913, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 26994, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 27008, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 26986, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 27002, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 26995, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 27003, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 2782, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 9846, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 2893, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 33357, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 5209, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 27004, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 26983, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 24248, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 27005, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 5225, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 26999, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 27012, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 27006, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 29166, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 22812, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 26991, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 22570, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 33763, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 33745, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 33786, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 27126, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 27070, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 22018, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 27072, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 22019, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 27079, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 38704, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 28272, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 28271, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 12826, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 27088, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 33944, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 130, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 27082, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 27086, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 33946, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 475, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 1953, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 27085, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 12051, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 27128, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 27131, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 32796, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 27074, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 2139, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 27101, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 27124, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 45438, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 27125, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 27127, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 30482, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 30451, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 30455, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 66, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 43987, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 30449, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 25389, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 25364, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 25368, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 25218, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 25429, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 25222, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 25375, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 25435, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 25431, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 528, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 10890, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 988, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 6346, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 25235, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 25384, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 25596, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 10955, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 10909, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 25380, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 10912, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 25308, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 25433, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 552, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 1706, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 25213, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 25392, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 39374, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 32999, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 32996, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 32546, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 34433, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 33076, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 32375, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25396, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25449, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25485, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25454, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25509, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 2484, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25472, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25525, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25457, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25489, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25533, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25528, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 20777, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25547, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 8012, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 526, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 8143, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25464, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25500, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 2645, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25567, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25420, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 2870, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 8166, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 131, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25560, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 6196, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25552, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25570, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25563, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25557, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 546, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 556, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 8177, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25574, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 36936, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25505, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 421, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25587, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 6495, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25577, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 8170, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25423, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25359, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25908, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 33736, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 3738, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 2062, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 2894, ""),
-- Races:   Orc, Tauren, Troll
-- Classes: Shaman
(0xA2, 0x40, 2825, ""),
-- Races:   Dranei
-- Classes: Shaman
(0x400, 0x40, 32182, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Hunter, Rogue
(0x6FF, 0xD, 674, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Warrior, Paladin
(0x6FF, 0x3, 750, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Blood elf, Dranei
-- Classes: Paladin, Hunter, Rogue
(0x6FF, 0xE, 3127, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 25442, ""),
-- Races:   Orc, Tauren, Troll, Dranei
-- Classes: Shaman
(0x4A2, 0x40, 20608, ""),
-- Races:   Human, Undead, Gnome, Troll, Blood elf, Dranei
-- Classes: Mage
(0x6D1, 0x80, 27087, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 8643, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 25212, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Tauren, Gnome, Troll, Dranei
-- Classes: Warrior
(0x4FF, 0x1, 12678, ""),
-- Races:   Orc, Dwarf, Night elf, Tauren, Troll, Blood elf, Dranei
-- Classes: Hunter
(0x6AE, 0x4, 5149, ""),
-- Races:   Human, Dwarf, Dranei
-- Classes: Paladin
(0x405, 0x2, 23214, ""),
-- Races:   Blood elf
-- Classes: Paladin
(0x200, 0x2, 34767, ""),
-- Races:   Human, Orc, Undead, Gnome, Blood elf, Dranei
-- Classes: Warlock
(0x653, 0x100, 23161, ""),
-- Races:   Human, Orc, Undead, Gnome, Blood elf, Dranei
-- Classes: Warlock
(0x653, 0x100, 688, ""),
-- Races:   Human, Orc, Undead, Gnome, Blood elf, Dranei
-- Classes: Warlock
(0x653, 0x100, 697, ""),
-- Races:   Human, Orc, Undead, Gnome, Blood elf, Dranei
-- Classes: Warlock
(0x653, 0x100, 712, ""),
-- Races:   Human, Orc, Undead, Gnome, Blood elf, Dranei
-- Classes: Warlock
(0x653, 0x100, 691, ""),
-- Races:   Night elf, Tauren
-- Classes: Druid
(0x28, 0x400, 20719, ""),
-- Races:   Human, Orc, Undead, Gnome, Blood elf
-- Classes: Warlock
(0x253, 0x100, 126, ""),
-- Races:   Human, Dwarf, Dranei
-- Classes: Paladin
(0x405, 0x2, 31801, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 3776, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 9186, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 21927, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 22054, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 22055, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 2836, ""),
-- Races:   Human, Orc, Dwarf, Night elf, Undead, Gnome, Troll, Blood elf
-- Classes: Rogue
(0x2DF, 0x8, 1860, ""),
-- Races:   Human
-- Classes: Priest
(0x1, 0x10, 25441, ""),
-- Races:   Human, Dwarf, Night elf, Undead, Troll, Blood elf, Dranei
-- Classes: Priest
(0x69D, 0x10, 25312, ""),
-- Races:   Human, Dwarf
-- Classes: Priest
(0x5, 0x10, 25437, "");
SET @CGUID := 49815;
SET @OGUID := 14972;
SET @SERINAR := 26593;
SET @NECROLYTE := 27356;
SET @BUNNY := 27369;
SET @RUNE := 188695;

UPDATE `creature` SET `MovementType`=0, `spawndist`=0, `unit_flags`=33024 WHERE `guid`=116960;
DELETE FROM `creature` WHERE `guid` IN (117061,117371,117372,117421,117422,117423,117633,117634,117646,117648,117649);
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+3;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(117061, @BUNNY, 571, 1, 1, 13069, 4495.499, 1747.361, 175.1579, 0.6806784, 300, 0, 0),
(117371, @BUNNY, 571, 1, 1, 13069, 4544.45, 1739.195, 167.6779, 0.9075712, 300, 0, 0),
(117372, @BUNNY, 571, 1, 1, 13069, 4573.836, 1708.501, 171.742, 1.466077, 300, 0, 0),
(117421, @BUNNY, 571, 1, 1, 13069, 4604.599, 1727.422, 170.6874, 4.921828, 300, 0, 0),
(117422, @BUNNY, 571, 1, 1, 13069, 4601.996, 1700.385, 171.9938, 1.37881, 300, 0, 0),
(117423, @BUNNY, 571, 1, 1, 13069, 4576.454, 1755.058, 167.8554, 2.164208, 300, 0, 0),
(117633, @BUNNY, 571, 1, 1, 13069, 4625.904, 1754.476, 182.3284, 6.038839, 300, 0, 0),
(117634, @BUNNY, 571, 1, 1, 13069, 4561.219, 1731.186, 166.7194, 3.926991, 300, 0, 0),
(117646, @BUNNY, 571, 1, 1, 13069, 4497.56, 1880.672, 164.3632, 5.61996, 300, 0, 0),
(117648, 27362, 571, 1, 1, 0, 4567.375, 1724.495, 168.1724, 0.6806784, 300, 5, 1),
(117649, 27362, 571, 1, 1, 0, 4608.474, 1721.618, 170.9504, 3.124139, 300, 5, 1),
(@CGUID+0, 27358, 571, 1, 1, 0, 4576.38, 1711.559, 171.3237, 4.018391, 300, 5, 1),
(@CGUID+1, 27358, 571, 1, 1, 0, 4574.408, 1751.613, 167.8838, 1.03504, 300, 5, 1),
(@CGUID+2, 27363, 571, 1, 1, 0, 4570.443, 1678.617, 170.5762, 0.002298846, 300, 5, 1);

DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+8;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`, `orientation`, `rotation0`, `rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@OGUID+0,@RUNE,571,1,1,4495.527,1747.337,175.0751,0.7330382,0,0,0.3583679,0.9335805,300,100,1),
(@OGUID+1,@RUNE,571,1,1,4544.453,1739.186,167.594,-1.151916,0,0,-0.5446386,0.8386708,300,100,1),
(@OGUID+2,@RUNE,571,1,1,4573.879,1708.473,171.6586,-2.268925,0,0,-0.9063072,0.4226195,300,100,1),
(@OGUID+3,@RUNE,571,1,1,4604.577,1727.41,170.6038,-0.1919852,0,0,-0.09584522,0.9953963,300,100,1),
(@OGUID+4,@RUNE,571,1,1,4601.975,1700.365,171.9105,-0.4014249,0,0,-0.1993675,0.9799248,300,100,1),
(@OGUID+5,@RUNE,571,1,1,4576.479,1755.036,167.7747,-0.2792516,0,0,-0.1391726,0.9902682,300,100,1),
(@OGUID+6,@RUNE,571,1,1,4625.864,1754.506,182.2451,-0.7330382,0,0,-0.3583679,0.9335805,300,100,1),
(@OGUID+7,@RUNE,571,1,1,4561.233,1731.201,166.6359,-0.6108635,0,0,-0.300705,0.9537172,300,100,1),
(@OGUID+8,@RUNE,571,1,1,4497.559,1880.615,164.2788,0.8377574,0,0,0.4067364,0.9135455,300,100,1);

DELETE FROM `creature_addon` WHERE `guid`=116960;
INSERT INTO `creature_addon` (`guid`,`auras`) VALUES
(116960,'29266');

DELETE FROM `creature_text` WHERE `entry`=@SERINAR;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@SERINAR,0,0, 'Perfect.  As long as you don''t go hacking and slashing your way through, they''ll never know the difference.',12,0,100,0,0,0, 'Serinar');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=48750;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(48750,48770,2,'Serinar''s Vision is applied while aura Burning Depths Necrolyte Image is active');

UPDATE `quest_template` SET `PrevQuestId`=12447 WHERE `Id` IN (12261,12262);
UPDATE `quest_template` SET `PrevQuestId`=12263 WHERE `Id` IN (12264,12265);

UPDATE `gameobject_template` SET `flags`=4 WHERE `entry`=188695;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@SERINAR;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SERINAR AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SERINAR*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@SERINAR, 0, 0, 1, 19, 0, 100, 0, 12263, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, @NECROLYTE, 20, 0, 0, 0, 0, 0, 'Serinar - On quest accept - Turn to'),
(@SERINAR, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48748, 0, 0, 0, 0, 0, 19, @NECROLYTE, 20, 0, 0, 0, 0, 0, 'Serinar - On quest accept - Spellcast Absorb Image'),
(@SERINAR, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @SERINAR*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Serinar - On quest accept - Run script'),
(@SERINAR, 0, 3, 4, 62, 0, 100, 0, 9537, 0, 0, 0, 11, 48750, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Serinar - On gossip select - Spellcast Burning Depths Necrolyte Image'),
(@SERINAR, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Serinar - On gossip select - Say line'),
(@SERINAR, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Serinar - On gossip select - Close gossip'),

(@SERINAR*100, 9, 0, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Serinar script - Turn to'),
(@SERINAR*100, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 11, 48750, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Serinar script - Spellcast Burning Depths Necrolyte Image'),
(@SERINAR*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Serinar script - Say line'),
(@SERINAR*100, 9, 3, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Serinar script - Turn to');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (48738,48748);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=9537 AND `SourceEntry`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 48738, 0, 0, 31, 0, 4, 0, 0, 0, 0, '', 'Spell Stamp Out Necromantic Rune effect0 targets player'),
(13, 2, 48738, 0, 0, 31, 0, 3, @BUNNY, 0, 0, 0, '', 'Spell Stamp Out Necromantic Rune effect1 targets Necromantic Rune Bunny'),
(13, 1, 48748, 0, 0, 31, 0, 3, @NECROLYTE, 0, 0, 0, '', 'Spell Absorb Image targets Burning Depths Necrolyte'),
(15, 9537, 0, 0, 0, 9, 0, 12263, 0, 0, 0, 0, '', 'Show gossip option only if player has taken quest The Best of Intentions'),
(15, 9537, 0, 0, 0, 1, 0, 48750, 0, 0, 1, 0, '', 'Show gossip option only if player doesn''t have aura Burning Depths Necrolyte Image');
-- wrong lootmode
UPDATE `creature_loot_template` SET `lootmode`=1 WHERE `item` IN(46367,46381,46380);
-- Darkwraith
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=15657 AND `source_type`=0 AND `id`=0 AND `link`=1;
-- Plaguehound
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=8598 AND `source_type`=0 AND `id`=0 AND `link`=1;
-- Amani Berserker
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=15643 AND `source_type`=0 AND `id`=0 AND `link`=1;
-- Enraged Wraith
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=17086 AND `source_type`=0 AND `id`=0 AND `link`=1;
-- Anok'suten
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=16357 AND `source_type`=0 AND `id`=3 AND `link`=0;
-- Bloodscalp Warrior
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=587 AND `source_type`=0 AND `id`=2 AND `link`=3;
-- Bloodscalp Berserker
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=597 AND `source_type`=0 AND `id`=0 AND `link`=1;
-- Commander Aggro'gosh
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=2464 AND `source_type`=0 AND `id`=3 AND `link`=4;
-- Vilebranch Berserker 
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=2643 AND `source_type`=0 AND `id`=0 AND `link`=1;
-- Hungering Wraith
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=1802 AND `source_type`=0 AND `id`=1 AND `link`=2;
-- Dark Strand Enforcer
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=3727 AND `source_type`=0 AND `id`=0 AND `link`=1;
-- Scarlet Myrmidon
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=4295 AND `source_type`=0 AND `id`=0 AND `link`=1;
-- Ymirjar Flesh Hunter
UPDATE `smart_scripts` SET `event_flags`=7 WHERE  `entryorguid`=26670 AND `source_type`=0 AND `id`=27 AND `link`=28;
-- Startup Errors
UPDATE `smart_scripts` SET `event_flags`=0 WHERE  `entryorguid`=22895 AND `source_type`=0 AND `id`=0 AND `link`=0;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=1487 AND `source_type`=0 AND `id`=8 AND `link`=9;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=2245 AND `source_type`=0 AND `id`=14 AND `link`=15;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=2375 AND `source_type`=0 AND `id`=8 AND `link`=9;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=16344 AND `source_type`=0 AND `id`=8 AND `link`=9;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=29174 AND `source_type`=0 AND `id`=2 AND `link`=3;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=29174 AND `source_type`=0 AND `id`=3 AND `link`=4;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=29174 AND `source_type`=0 AND `id`=4 AND `link`=5;
-- Timed action scripts aren't supposed to have links set on them
UPDATE `smart_scripts` SET `link`=0, `event_type`=0 WHERE  `entryorguid`=83600 AND `source_type`=9 AND `id`=1 AND `link`=2;
UPDATE `smart_scripts` SET `link`=0, `event_type`=0 WHERE  `entryorguid`=83600 AND `source_type`=9 AND `id`=2 AND `link`=3;
UPDATE `smart_scripts` SET `event_type`=0 WHERE  `entryorguid`=83600 AND `source_type`=9 AND `id`=3 AND `link`=0;
-- Aforementioned issue about links on timed scripts
UPDATE `smart_scripts` SET `event_type`=0 WHERE  `entryorguid`=83600 AND `source_type`=9 AND `id`=3 AND `link`=0;
UPDATE `smart_scripts` SET `link`=0, `event_type`=0 WHERE  `entryorguid`=305400 AND `source_type`=9 AND `id`=1 AND `link`=2;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=15938 AND `source_type`=0 AND `id`=7 AND `link`=8;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=0 WHERE `Spell`=56816;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=0 WHERE `Spell`=75461;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=0 WHERE `Spell`=75445;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=669;
UPDATE `playercreateinfo_spell` SET `racemask`=223, `classmask`=8 WHERE `Spell`=2567;
UPDATE `playercreateinfo_spell` SET `racemask`=223, `classmask`=8 WHERE `Spell`=2764;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=8 WHERE `Spell`=1180;
UPDATE `playercreateinfo_spell` SET `racemask`=1029, `classmask`=1 WHERE `Spell`=199;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=33 WHERE `Spell`=668;
UPDATE `playercreateinfo_spell` SET `racemask`=529, `classmask`=0 WHERE `Spell`=5009;
UPDATE `playercreateinfo_spell` SET `racemask`=529, `classmask`=0 WHERE `Spell`=5019;
UPDATE `playercreateinfo_spell` SET `racemask`=1029, `classmask`=32 WHERE `Spell`=202;
UPDATE `playercreateinfo_spell` SET `racemask`=1029, `classmask`=32 WHERE `Spell`=8737;
UPDATE `playercreateinfo_spell` SET `racemask`=1198, `classmask`=32 WHERE `Spell`=196;
UPDATE `playercreateinfo_spell` SET `racemask`=1198, `classmask`=32 WHERE `Spell`=197;
UPDATE `playercreateinfo_spell` SET `racemask`=1028, `classmask`=32 WHERE `Spell`=201;
UPDATE `playercreateinfo_spell` SET `racemask`=735, `classmask`=32 WHERE `Spell`=674;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=0 WHERE `Spell`=107;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=0 WHERE `Spell`=9116;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=0 WHERE `Spell`=198;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=9077;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=0 WHERE `Spell`=227;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=81;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=203;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=204;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=522;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=1843;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=2382;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=2479;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=3050;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=3365;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=6233;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=6246;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=6247;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=6477;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=6478;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=6603;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=7266;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=7267;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=7355;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=8386;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=9078;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=9125;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=21651;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=21652;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=22027;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=22810;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=45927;
UPDATE `playercreateinfo_spell` SET `racemask`=0, `classmask`=32 WHERE `Spell`=61437;
UPDATE `playercreateinfo_spell` SET `racemask`=1710, `classmask`=4 WHERE `Spell`=75;
UPDATE `playercreateinfo_spell` SET `racemask`=1279, `classmask`=1 WHERE `Spell`=78;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=81;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=67 WHERE `Spell`=107;
UPDATE `playercreateinfo_spell` SET `racemask`=1745, `classmask`=128 WHERE `Spell`=133;
UPDATE `playercreateinfo_spell` SET `racemask`=1745, `classmask`=128 WHERE `Spell`=168;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=37 WHERE `Spell`=196;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=37 WHERE `Spell`=197;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1107 WHERE `Spell`=198;
UPDATE `playercreateinfo_spell` SET `racemask`=1061, `classmask`=3 WHERE `Spell`=199;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=200;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=39 WHERE `Spell`=201;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=35 WHERE `Spell`=202;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=203;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=204;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1488 WHERE `Spell`=227;
UPDATE `playercreateinfo_spell` SET `racemask`=650, `classmask`=4 WHERE `Spell`=264;
UPDATE `playercreateinfo_spell` SET `racemask`=36, `classmask`=4 WHERE `Spell`=266;
UPDATE `playercreateinfo_spell` SET `racemask`=1186, `classmask`=64 WHERE `Spell`=331;
UPDATE `playercreateinfo_spell` SET `racemask`=1186, `classmask`=64 WHERE `Spell`=403;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=522;
UPDATE `playercreateinfo_spell` SET `racemask`=1693, `classmask`=16 WHERE `Spell`=585;
UPDATE `playercreateinfo_spell` SET `racemask`=1541, `classmask`=2 WHERE `Spell`=635;
UPDATE `playercreateinfo_spell` SET `racemask`=1101, `classmask`=1535 WHERE `Spell`=668;
UPDATE `playercreateinfo_spell` SET `racemask`=690, `classmask`=1535 WHERE `Spell`=669;
UPDATE `playercreateinfo_spell` SET `racemask`=32, `classmask`=1125 WHERE `Spell`=670;
UPDATE `playercreateinfo_spell` SET `racemask`=8, `classmask`=1085 WHERE `Spell`=671;
UPDATE `playercreateinfo_spell` SET `racemask`=4, `classmask`=63 WHERE `Spell`=672;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=40 WHERE `Spell`=674;
UPDATE `playercreateinfo_spell` SET `racemask`=595, `classmask`=256 WHERE `Spell`=686;
UPDATE `playercreateinfo_spell` SET `racemask`=595, `classmask`=256 WHERE `Spell`=687;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=750;
UPDATE `playercreateinfo_spell` SET `racemask`=512, `classmask`=446 WHERE `Spell`=813;
UPDATE `playercreateinfo_spell` SET `racemask`=512, `classmask`=446 WHERE `Spell`=822;
UPDATE `playercreateinfo_spell` SET `racemask`=735, `classmask`=1293 WHERE `Spell`=1180;
UPDATE `playercreateinfo_spell` SET `racemask`=735, `classmask`=8 WHERE `Spell`=1752;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=1843;
UPDATE `playercreateinfo_spell` SET `racemask`=1693, `classmask`=16 WHERE `Spell`=2050;
UPDATE `playercreateinfo_spell` SET `racemask`=735, `classmask`=8 WHERE `Spell`=2098;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=2382;
UPDATE `playercreateinfo_spell` SET `racemask`=1279, `classmask`=1 WHERE `Spell`=2457;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=2479;
UPDATE `playercreateinfo_spell` SET `racemask`=4, `classmask`=63 WHERE `Spell`=2481;
UPDATE `playercreateinfo_spell` SET `racemask`=735, `classmask`=9 WHERE `Spell`=2567;
UPDATE `playercreateinfo_spell` SET `racemask`=735, `classmask`=9 WHERE `Spell`=2764;
UPDATE `playercreateinfo_spell` SET `racemask`=1710, `classmask`=4 WHERE `Spell`=2973;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=3050;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=3127;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=3275;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=3276;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=3277;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=3278;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=3365;
UPDATE `playercreateinfo_spell` SET `racemask`=1759, `classmask`=400 WHERE `Spell`=5009;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=4 WHERE `Spell`=5011;
UPDATE `playercreateinfo_spell` SET `racemask`=1759, `classmask`=400 WHERE `Spell`=5019;
UPDATE `playercreateinfo_spell` SET `racemask`=40, `classmask`=1024 WHERE `Spell`=5176;
UPDATE `playercreateinfo_spell` SET `racemask`=40, `classmask`=1024 WHERE `Spell`=5185;
UPDATE `playercreateinfo_spell` SET `racemask`=16, `classmask`=441 WHERE `Spell`=5227;
UPDATE `playercreateinfo_spell` SET `racemask`=1279, `classmask`=1 WHERE `Spell`=5301;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=6233;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=6246;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=6247;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=6477;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=6478;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=39 WHERE `Spell`=6562;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=6603;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=7266;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=7267;
UPDATE `playercreateinfo_spell` SET `racemask`=64, `classmask`=425 WHERE `Spell`=7340;
UPDATE `playercreateinfo_spell` SET `racemask`=128, `classmask`=253 WHERE `Spell`=7341;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=7355;
UPDATE `playercreateinfo_spell` SET `racemask`=16, `classmask`=441 WHERE `Spell`=7744;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=7928;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=7929;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=7934;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=8386;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=35 WHERE `Spell`=8737;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1135 WHERE `Spell`=9077;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=9078;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=67 WHERE `Spell`=9116;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=9125;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=10840;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=10841;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=10846;
UPDATE `playercreateinfo_spell` SET `racemask`=1710, `classmask`=4 WHERE `Spell`=13358;
UPDATE `playercreateinfo_spell` SET `racemask`=735, `classmask`=8 WHERE `Spell`=16092;
UPDATE `playercreateinfo_spell` SET `racemask`=16, `classmask`=441 WHERE `Spell`=17737;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=18629;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=18630;
UPDATE `playercreateinfo_spell` SET `racemask`=32, `classmask`=1125 WHERE `Spell`=20549;
UPDATE `playercreateinfo_spell` SET `racemask`=32, `classmask`=1125 WHERE `Spell`=20550;
UPDATE `playercreateinfo_spell` SET `racemask`=32, `classmask`=1125 WHERE `Spell`=20551;
UPDATE `playercreateinfo_spell` SET `racemask`=32, `classmask`=1125 WHERE `Spell`=20552;
UPDATE `playercreateinfo_spell` SET `racemask`=128, `classmask`=253 WHERE `Spell`=20555;
UPDATE `playercreateinfo_spell` SET `racemask`=128, `classmask`=253 WHERE `Spell`=20557;
UPDATE `playercreateinfo_spell` SET `racemask`=128, `classmask`=253 WHERE `Spell`=20558;
UPDATE `playercreateinfo_spell` SET `racemask`=2, `classmask`=45 WHERE `Spell`=20572;
UPDATE `playercreateinfo_spell` SET `racemask`=2, `classmask`=365 WHERE `Spell`=20573;
UPDATE `playercreateinfo_spell` SET `racemask`=2, `classmask`=365 WHERE `Spell`=20574;
UPDATE `playercreateinfo_spell` SET `racemask`=2, `classmask`=256 WHERE `Spell`=20575;
UPDATE `playercreateinfo_spell` SET `racemask`=2, `classmask`=4 WHERE `Spell`=20576;
UPDATE `playercreateinfo_spell` SET `racemask`=16, `classmask`=441 WHERE `Spell`=20577;
UPDATE `playercreateinfo_spell` SET `racemask`=16, `classmask`=441 WHERE `Spell`=20579;
UPDATE `playercreateinfo_spell` SET `racemask`=8, `classmask`=1085 WHERE `Spell`=20582;
UPDATE `playercreateinfo_spell` SET `racemask`=8, `classmask`=1085 WHERE `Spell`=20583;
UPDATE `playercreateinfo_spell` SET `racemask`=8, `classmask`=1085 WHERE `Spell`=20585;
UPDATE `playercreateinfo_spell` SET `racemask`=64, `classmask`=425 WHERE `Spell`=20589;
UPDATE `playercreateinfo_spell` SET `racemask`=64, `classmask`=425 WHERE `Spell`=20591;
UPDATE `playercreateinfo_spell` SET `racemask`=64, `classmask`=425 WHERE `Spell`=20592;
UPDATE `playercreateinfo_spell` SET `racemask`=64, `classmask`=425 WHERE `Spell`=20593;
UPDATE `playercreateinfo_spell` SET `racemask`=4, `classmask`=63 WHERE `Spell`=20594;
UPDATE `playercreateinfo_spell` SET `racemask`=4, `classmask`=63 WHERE `Spell`=20595;
UPDATE `playercreateinfo_spell` SET `racemask`=4, `classmask`=63 WHERE `Spell`=20596;
UPDATE `playercreateinfo_spell` SET `racemask`=1, `classmask`=443 WHERE `Spell`=20597;
UPDATE `playercreateinfo_spell` SET `racemask`=1, `classmask`=443 WHERE `Spell`=20598;
UPDATE `playercreateinfo_spell` SET `racemask`=1, `classmask`=443 WHERE `Spell`=20599;
UPDATE `playercreateinfo_spell` SET `racemask`=1, `classmask`=443 WHERE `Spell`=20864;
UPDATE `playercreateinfo_spell` SET `racemask`=1541, `classmask`=2 WHERE `Spell`=21084;
UPDATE `playercreateinfo_spell` SET `racemask`=735, `classmask`=8 WHERE `Spell`=21184;
UPDATE `playercreateinfo_spell` SET `racemask`=2, `classmask`=73 WHERE `Spell`=21563;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=21651;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=21652;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=22027;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=22810;
UPDATE `playercreateinfo_spell` SET `racemask`=1710, `classmask`=4 WHERE `Spell`=24949;
UPDATE `playercreateinfo_spell` SET `racemask`=512, `classmask`=8 WHERE `Spell`=25046;
UPDATE `playercreateinfo_spell` SET `racemask`=128, `classmask`=253 WHERE `Spell`=26290;
UPDATE `playercreateinfo_spell` SET `racemask`=128, `classmask`=253 WHERE `Spell`=26297;
UPDATE `playercreateinfo_spell` SET `racemask`=1541, `classmask`=2 WHERE `Spell`=27762;
UPDATE `playercreateinfo_spell` SET `racemask`=1186, `classmask`=64 WHERE `Spell`=27763;
UPDATE `playercreateinfo_spell` SET `racemask`=40, `classmask`=1024 WHERE `Spell`=27764;
UPDATE `playercreateinfo_spell` SET `racemask`=512, `classmask`=406 WHERE `Spell`=28730;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=247 WHERE `Spell`=28875;
UPDATE `playercreateinfo_spell` SET `racemask`=512, `classmask`=446 WHERE `Spell`=28877;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=208 WHERE `Spell`=28878;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=1 WHERE `Spell`=28880;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=247 WHERE `Spell`=29932;
UPDATE `playercreateinfo_spell` SET `racemask`=1279, `classmask`=1 WHERE `Spell`=32215;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=33391;
UPDATE `playercreateinfo_spell` SET `racemask`=2, `classmask`=64 WHERE `Spell`=33697;
UPDATE `playercreateinfo_spell` SET `racemask`=2, `classmask`=256 WHERE `Spell`=33702;
UPDATE `playercreateinfo_spell` SET `racemask`=1710, `classmask`=4 WHERE `Spell`=34082;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=45462;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=45477;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=45902;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=45903;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=45927;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=47541;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=48266;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=49410;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=49576;
UPDATE `playercreateinfo_spell` SET `racemask`=512, `classmask`=32 WHERE `Spell`=50613;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=52665;
UPDATE `playercreateinfo_spell` SET `racemask`=2, `classmask`=32 WHERE `Spell`=54562;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=56816;
UPDATE `playercreateinfo_spell` SET `racemask`=595, `classmask`=256 WHERE `Spell`=58284;
UPDATE `playercreateinfo_spell` SET `racemask`=128, `classmask`=253 WHERE `Spell`=58943;
UPDATE `playercreateinfo_spell` SET `racemask`=8, `classmask`=1085 WHERE `Spell`=58984;
UPDATE `playercreateinfo_spell` SET `racemask`=1, `classmask`=443 WHERE `Spell`=58985;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=1 WHERE `Spell`=59221;
UPDATE `playercreateinfo_spell` SET `racemask`=4, `classmask`=63 WHERE `Spell`=59224;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=2 WHERE `Spell`=59535;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=4 WHERE `Spell`=59536;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=16 WHERE `Spell`=59538;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=32 WHERE `Spell`=59539;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=64 WHERE `Spell`=59540;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=128 WHERE `Spell`=59541;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=2 WHERE `Spell`=59542;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=4 WHERE `Spell`=59543;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=16 WHERE `Spell`=59544;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=32 WHERE `Spell`=59545;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=64 WHERE `Spell`=59547;
UPDATE `playercreateinfo_spell` SET `racemask`=1024, `classmask`=128 WHERE `Spell`=59548;
UPDATE `playercreateinfo_spell` SET `racemask`=1, `classmask`=443 WHERE `Spell`=59752;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=59879;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=59921;
UPDATE `playercreateinfo_spell` SET `racemask`=1541, `classmask`=2 WHERE `Spell`=60091;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=1535 WHERE `Spell`=61437;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=32 WHERE `Spell`=61455;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=256 WHERE `Spell`=75445;
UPDATE `playercreateinfo_spell` SET `racemask`=1791, `classmask`=64 WHERE `Spell`=75461;
UPDATE `playercreateinfo_spell` SET `racemask`=0 WHERE `racemask`=1791; -- All races
UPDATE `playercreateinfo_spell` SET `classmask`=0 WHERE `classmask`=1535; -- All classes
DELETE FROM `smart_scripts` WHERE `entryorguid`=30407 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`id`,`link`,`event_type`,`event_flags`,`event_phase_mask`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`target_type`,`comment`) VALUES
(30407,0,1,11,0,0,0,0,0,0,11,56726,0,1,'Captured Crusader - On Respawn - Apply Nerubian Webs (56726)'),
(30407,1,0,61,0,0,0,0,0,0,22,1,0,1,'Captured Crusader - Linked to id 0 - Set event phase to 1'),
(30407,2,0, 1,0,1,4000,4000,4000,4000,10,70,22,1,'Captured Crusader - Out of combat - Random emote'),
(30407,3,4, 8,0,1,56683,0,0,0,11,56687,0,7,'Captured Crusader - Spell hit of Grab Captured Crusader (56683) - Cast Ride Vehicle (56687)'),
(30407,4,5,61,0,1,0,0,0,0,1,0,0,1,'Captured Crusader - Linked to id 3 - Talk'),
(30407,5,0,61,0,1,0,0,0,0,22,2,0,1,'Captured Crusader - Linked to id 3 - Set event phase to 2'),
(30407,6,0, 1,0,2,8000,8000,8000,8000,1,1,0,1,'Captured Crusader - Out of combat - Talk'),
(30407,7,8,23,1,2,56687,0,0,0,1,2,0,1,'Captured Crusader - Aura Ride Vehicle (56687) removed - Talk'),
(30407,8,9,61,0,2,0,0,0,0,41,5000,0,1,'Captured Crusader - Linked to id 7 - Despawn'),
(30407,9,0,61,0,2,0,0,0,0,22,0,0,1,'Captured Crusader - Linked to id 7 - Set event phase to 0');
DELETE FROM `trinity_string` WHERE `entry`=363;
INSERT INTO `trinity_string` (`entry`, `content_default`) VALUES
(363, 'Player %s cannot whisper you any longer.');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (48619,48620,52812);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=48738;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,48619,0,0,31,0,3,27377,0,0,'','Spell Flame Breath effect0 targets Thane Torvald Eriksson'),
(13,2,48619,0,0,31,0,3,27377,0,0,'','Spell Flame Breath effect1 targets Thane Torvald Eriksson'),
(13,1,48620,0,0,31,0,3,27377,0,0,'','Spell Wing Buffet targets Thane Torvald Eriksson'),
(13,1,52812,0,0,31,0,3,27377,0,0,'','Spell Molten Fury effect0 targets Thane Torvald Eriksson'),
(13,2,52812,0,0,31,0,3,27377,0,0,'','Spell Molten Fury effect1 targets Thane Torvald Eriksson');

UPDATE `smart_scripts` SET `event_type`=1, `event_flags`=1 WHERE `entryorguid`=21633 AND `source_type`=0 AND `id`=0;
SET @HARPOON := 30066;
SET @HAYSTACK := 30096;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (55896,55934);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=@HAYSTACK;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,4,55896,0,0,31,0,3,@HAYSTACK,0,0,0,'','Spell Explosion effect2 targets Dry Haystack'),
(13,2,55934,0,0,31,0,3,30103,0,0,0,'','Spell Valkyrion Fire effect1 targets Valkyrion Fire Bunny'),
(22,1,@HAYSTACK,0,0,1,1,55934,0,0,1,0,'','SAI Dry Haystack triggers only if Dry Haystack has no aura of spell Valkyrion Fire');

UPDATE `creature_template` SET `npcflag`=16777216, `ScriptName`='' WHERE `entry`=@HARPOON;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@HARPOON,@HAYSTACK);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@HARPOON,@HAYSTACK) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@HARPOON,0,0,0,11,0,100,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Valkyrion Harpoon Gun - On spawn - Root'),

(@HAYSTACK,0,0,1,8,0,100,0,55896,0,0,0,11,55934,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Dry Haystack - On spellhit Explosion - Spellcast Valkyrion Fire'),
(@HAYSTACK,0,1,2,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dry Haystack - Linked - Set event phase 1'),
(@HAYSTACK,0,2,0,61,0,100,0,0,0,0,0,33,@HAYSTACK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Dry Haystack - Linked - Quest credit'),
(@HAYSTACK,0,3,4,23,1,100,0,55934,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dry Haystack - On spellfade Valkyrion Fire (phase 1) - Set event phase 0'),
(@HAYSTACK,0,4,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dry Haystack - Linked - Despawn');
DELETE FROM `creature_template_addon` WHERE `entry`=29570;
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`) VALUES
(29570,50331648,1);
SET @MULE := 23977;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@MULE;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@MULE AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@MULE*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@MULE,0,0,0,22,0,100,0,125,0,0,0,11,43572,0,0,0,0,0,7,0,0,0,0,0,0,0,'Abandoned Pack Mule - On emote receive - Spellcast Send Them Packing: On /Raise Emote Dummy to Player'),
(@MULE,0,1,2,31,0,100,0,43572,0,0,0,11,42721,0,0,0,0,0,7,0,0,0,0,0,0,0,'Abandoned Pack Mule - On target spellhit Send Them Packing: On /Raise Emote Dummy to Player - Spellcast Send Them Packing: On Successful Dummy Spell Kill Credit'),
(@MULE,0,2,0,61,0,100,0,0,0,0,0,80,@MULE*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Abandoned Pack Mule - On target spellhit Send Them Packing: On /Raise Emote Dummy to Player - Run script'),

(@MULE*100,9,0,0,0,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Abandoned Pack Mule script - Stop movement'),
(@MULE*100,9,1,0,0,0,100,0,500,500,0,0,5,35,0,0,0,0,0,1,0,0,0,0,0,0,0,'Abandoned Pack Mule script - Play emote'),
(@MULE*100,9,2,0,0,0,100,0,0,0,0,0,4,727,0,0,0,0,0,1,0,0,0,0,0,0,0,'Abandoned Pack Mule script - Play sound'),
(@MULE*100,9,3,0,0,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Abandoned Pack Mule script - Set run'),
(@MULE*100,9,4,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,1561.824,-3709.441,147.7268,0,'Abandoned Pack Mule script - Move to position'),
(@MULE*100,9,5,0,0,0,100,0,15000,15000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Abandoned Pack Mule script - Despawn');
DELETE FROM `trinity_string` WHERE `entry` IN (1151, 1152, 1153, 1154, 1155, 1156);
INSERT INTO `trinity_string` (`entry`,`content_default`) VALUES
(1151, 'Mail List Info: # of mails: %u, Player: %s(%u)'),
(1152, 'Mail Id: %u Title: \"%s\" Money: %ug%us%uc'),
(1153, 'Sender: %s(%u), Receiver: %s(%u)'),
(1154, 'Time deliver: %s, Time expire: %s'),
(1155, 'Item: %s[Entry:%u Guid:%u Count:%u]'),
(1156, 'Mail List Info: No mail found for this character.');

DELETE FROM `command` WHERE `name` = 'list mail';
INSERT INTO `command` (`name`,`security`,`help`) VALUES
('list mail', 3, 'Syntax: .list mail $character\nList of mails the character received.');
-- Quest 4901 "Guardians of the Altar"

SET @NPC_RANSHALLA       := 10300;
SET @NPC_PRIESTESS_ELUNE := 12116;
SET @NPC_GUARDIAN_ELUNE  := 12140;
SET @NPC_VOICE_ELUNE     := 12152;

SET @GO_ELUNE_ALTAR      := 177404;
SET @GO_ELUNE_GEM        := 177414;
SET @GO_ELUNE_LIGHT      := 177415;
SET @GO_ELUNE_FIRE       := 177417;
SET @GO_GUID             := 9650; -- Need 7 guids

-- script_texts for the quest
DELETE FROM `creature_text` WHERE `entry` IN (@NPC_RANSHALLA, @NPC_PRIESTESS_ELUNE, @NPC_VOICE_ELUNE);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@NPC_RANSHALLA,0,0, 'Remember, I need your help to properly channel. I will ask you to aid me several times in our path, so please be ready.',12,0,100,0,0,0, 'Ranshalla SAY_QUEST_START'),
(@NPC_RANSHALLA,1,0, 'This blue light... It''s strange. What do you think it means?',12,0,100,25,0,0, 'Ranshalla SAY_ENTER_OWL_THICKET'),
(@NPC_RANSHALLA,2,0, 'We''ve found it!',12,0,100,0,0,0, 'Ranshalla SAY_REACH_TORCH_1'),
(@NPC_RANSHALLA,2,1, 'Please, light this while I am channeling',12,0,100,0,0,0, 'Ranshalla SAY_REACH_TORCH_2'),
(@NPC_RANSHALLA,2,2, 'This is the place. Let''s light it.',12,0,100,0,0,0, 'Ranshalla SAY_REACH_TORCH_3'),
(@NPC_RANSHALLA,3,0, 'Let''s find the next one.',12,0,100,0,0,0, 'Ranshalla SAY_AFTER_TORCH_1'),
(@NPC_RANSHALLA,3,1, 'We must continue on now.',12,0,100,0,0,0, 'Ranshalla SAY_AFTER_TORCH_2'),
(@NPC_RANSHALLA,4,0, 'It is time for the final step; we must activate the altar.',12,0,100,0,0,0, 'Ranshalla SAY_REACH_ALTAR_1'),
(@NPC_RANSHALLA,5,0, 'I will read the words carved into the stone, and you must find a way to light it.',12,0,100,0,0,0, 'Ranshalla SAY_REACH_ALTAR_2'),
(@NPC_RANSHALLA,6,0, 'The altar is glowing! We have done it!',12,0,100,0,0,0, 'Ranshalla SAY_RANSHALLA_ALTAR_1'),
(@NPC_RANSHALLA,7,0, 'What is happening? Look!',12,0,100,0,0,0, 'Ranshalla SAY_RANSHALLA_ALTAR_2'),
(@NPC_PRIESTESS_ELUNE,8,0, 'It has been many years...',12,0,100,0,0,0, 'Priestess of Elune SAY_PRIESTESS_ALTAR_3'),
(@NPC_PRIESTESS_ELUNE,9,0, 'Who has disturbed the altar of the goddess?',12,0,100,0,0,0, 'Priestess of Elune SAY_PRIESTESS_ALTAR_4'),
(@NPC_RANSHALLA,10,0, 'Please, priestesses, forgive us for our intrusion. We do not wish any harm here.',12,0,100,0,0,0, 'Ranshalla SAY_RANSHALLA_ALTAR_5'),
(@NPC_RANSHALLA,11,0, 'We only wish to know why the wildkin guard this area...',12,0,100,0,0,0, 'Ranshalla SAY_RANSHALLA_ALTAR_6'),
(@NPC_PRIESTESS_ELUNE,12,0, 'Enu thora''serador. This is a sacred place.',12,0,100,0,0,0, 'Priestess of Elune SAY_PRIESTESS_ALTAR_7'),
(@NPC_PRIESTESS_ELUNE,13,0, 'We will show you...',12,0,100,0,0,0, 'Priestess of Elune SAY_PRIESTESS_ALTAR_8'),
(@NPC_PRIESTESS_ELUNE,14,0, 'Look above you; thara dormil dorah...',12,0,100,0,0,0, 'Priestess of Elune SAY_PRIESTESS_ALTAR_9'),
(@NPC_PRIESTESS_ELUNE,15,0, 'This gem once allowed direct communication with Elune, herself.',12,0,100,0,0,0, 'Priestess of Elune SAY_PRIESTESS_ALTAR_10'),
(@NPC_PRIESTESS_ELUNE,16,0, 'Through the gem, Elune channeled her infinite wisdom...',12,0,100,0,0,0, 'Priestess of Elune SAY_PRIESTESS_ALTAR_11'),
(@NPC_PRIESTESS_ELUNE,17,0, 'Realizing that the gem needed to be protected, we turned to the goddess herself.',12,0,100,0,0,0, 'Priestess of Elune SAY_PRIESTESS_ALTAR_12'),
(@NPC_PRIESTESS_ELUNE,18,0, 'Soon after, we began to have visions of a creature... A creature with the feathers of an owl, but the will and might of a bear...',12,0,100,0,0,0, 'Priestess of Elune SAY_PRIESTESS_ALTAR_13'),
(@NPC_PRIESTESS_ELUNE,19,0, 'It was on that day that the wildkin were given to us. Fierce guardians, the goddess assigned the wildkin to protect all of her sacred places.',12,0,100,0,0,0, 'Priestess of Elune SAY_PRIESTESS_ALTAR_14'),
(@NPC_VOICE_ELUNE,20,0, 'Anu''dorini Talah, Ru shallora enudoril.',12,0,100,0,0,0, 'Voice of Elune SAY_VOICE_ALTAR_15'),
(@NPC_PRIESTESS_ELUNE,21,0, 'But now, many years later, the wildkin have grown more feral, and without the guidance of the goddess, they are confused...',12,0,100,0,0,0, 'Priestess of Elune SAY_PRIESTESS_ALTAR_16'),
(@NPC_PRIESTESS_ELUNE,22,0, 'Without a purpose, they wander... But many find their way back to the sacred areas that they once were sworn to protect.',12,0,100,0,0,0, 'Priestess of Elune SAY_PRIESTESS_ALTAR_17'),
(@NPC_PRIESTESS_ELUNE,23,0, 'Wildkin are inherently magical; this power was bestowed upon them by the goddess.',12,0,100,0,0,0, 'Priestess of Elune SAY_PRIESTESS_ALTAR_18'),
(@NPC_PRIESTESS_ELUNE,24,0, 'Know that wherever you might find them in the world, they are protecting something of importance, as they were entrusted to do so long ago.',12,0,100,0,0,0, 'Priestess of Elune SAY_PRIESTESS_ALTAR_19'),
(@NPC_PRIESTESS_ELUNE,25,0, 'Please, remember what we have shown you...',12,0,100,0,0,0, 'Priestess of Elune SAY_PRIESTESS_ALTAR_20'),
(@NPC_PRIESTESS_ELUNE,26,0, 'Farewell.',12,0,100,0,0,0, 'Priestess of Elune SAY_PRIESTESS_ALTAR_21'),
(@NPC_RANSHALLA,27,0, 'Thank you for you help, $N. I wish you well in your adventures.',12,0,100,0,0,0, 'Ranshalla SAY_RANSHALLA_END_1'),
(@NPC_RANSHALLA,28,0, 'I want to stay here and reflect on what we have seen. Please see Erelas and tell him what we have learned.',12,0,100,0,0,0, 'Ranshalla SAY_RANSHALLA_END_2'),
(@NPC_RANSHALLA,29,0, '%s begins chanting a strange spell...',16,0,100,0,0,0, 'Ranshalla EMOTE_CHANT_SPELL');

-- Waypoints for Ranshalla
DELETE FROM `script_waypoint` WHERE `entry`=@NPC_RANSHALLA;
INSERT INTO `script_waypoint` (`entry`,`pointid`,`location_x`,`location_y`,`location_z`,`waittime`,`point_comment`) VALUES
(@NPC_RANSHALLA, 1, 5720.45, -4798.45, 778.23, 0, ''),
(@NPC_RANSHALLA, 2, 5730.22, -4818.34, 777.11, 0, ''),
(@NPC_RANSHALLA, 3, 5728.12, -4835.76, 778.15, 1000, 'SAY_ENTER_OWL_THICKET'),
(@NPC_RANSHALLA, 4, 5718.85, -4865.62, 787.56, 0, ''),
(@NPC_RANSHALLA, 5, 5697.13, -4909.12, 801.53, 0, ''),
(@NPC_RANSHALLA, 6, 5684.20, -4913.75, 801.60, 0, ''),
(@NPC_RANSHALLA, 7, 5674.67, -4915.78, 802.13, 0, ''),
(@NPC_RANSHALLA, 8, 5665.61, -4919.22, 804.85, 0, ''),
(@NPC_RANSHALLA, 9, 5638.22, -4897.58, 804.97, 0, ''),
(@NPC_RANSHALLA, 10, 5632.67, -4892.05, 805.44, 0, 'Cavern 1 - EMOTE_CHANT_SPELL'),
(@NPC_RANSHALLA, 11, 5664.58, -4921.84, 804.91, 0, ''),
(@NPC_RANSHALLA, 12, 5684.21, -4943.81, 802.80, 0, ''),
(@NPC_RANSHALLA, 13, 5724.92, -4983.69, 808.25, 0, ''),
(@NPC_RANSHALLA, 14, 5753.39, -4990.73, 809.84, 0, ''),
(@NPC_RANSHALLA, 15, 5765.62, -4994.89, 809.42, 0, 'Cavern 2 - EMOTE_CHANT_SPELL'),
(@NPC_RANSHALLA, 16, 5724.94, -4983.58, 808.29, 0, ''),
(@NPC_RANSHALLA, 17, 5699.61, -4989.82, 808.03, 0, ''),
(@NPC_RANSHALLA, 18, 5686.80, -5012.17, 807.27, 0, ''),
(@NPC_RANSHALLA, 19, 5691.43, -5037.43, 807.73, 0, ''),
(@NPC_RANSHALLA, 20, 5694.24, -5054.64, 808.85, 0, 'Cavern 3 - EMOTE_CHANT_SPELL'),
(@NPC_RANSHALLA, 21, 5686.88, -5012.18, 807.23, 0, ''),
(@NPC_RANSHALLA, 22, 5664.94, -5001.12, 807.78, 0, ''),
(@NPC_RANSHALLA, 23, 5647.12, -5002.84, 807.54, 0, ''),
(@NPC_RANSHALLA, 24, 5629.23, -5014.88, 807.94, 0, ''),
(@NPC_RANSHALLA, 25, 5611.26, -5025.62, 808.36, 0, 'Cavern 4 - EMOTE_CHANT_SPELL'),
(@NPC_RANSHALLA, 26, 5647.13, -5002.85, 807.57, 0, ''),
(@NPC_RANSHALLA, 27, 5641.12, -4973.22, 809.39, 0, ''),
(@NPC_RANSHALLA, 28, 5622.97, -4953.58, 811.12, 0, ''),
(@NPC_RANSHALLA, 29, 5601.52, -4939.49, 820.77, 0, ''),
(@NPC_RANSHALLA, 30, 5571.87, -4936.22, 831.35, 0, ''),
(@NPC_RANSHALLA, 31, 5543.23, -4933.67, 838.33, 0, ''),
(@NPC_RANSHALLA, 32, 5520.86, -4942.05, 843.02, 0, ''),
(@NPC_RANSHALLA, 33, 5509.15, -4946.31, 849.36, 0, ''),
(@NPC_RANSHALLA, 34, 5498.45, -4950.08, 849.98, 0, ''),
(@NPC_RANSHALLA, 35, 5485.78, -4963.40, 850.43, 0, ''),
(@NPC_RANSHALLA, 36, 5467.92, -4980.67, 851.89, 0, 'Cavern 5 - EMOTE_CHANT_SPELL'),
(@NPC_RANSHALLA, 37, 5498.68, -4950.45, 849.96, 0, ''),
(@NPC_RANSHALLA, 38, 5518.68, -4921.94, 844.65, 0, ''),
(@NPC_RANSHALLA, 39, 5517.66, -4920.82, 845.12, 0, 'SAY_REACH_ALTAR_1'),
(@NPC_RANSHALLA, 40, 5518.38, -4913.47, 845.57, 0, ''),
(@NPC_RANSHALLA, 41, 5511.31, -4913.82, 847.17, 5000, 'light the spotlights'),
(@NPC_RANSHALLA, 42, 5511.31, -4913.82, 847.17, 0, 'start altar cinematic - SAY_RANSHALLA_ALTAR_2'),
(@NPC_RANSHALLA, 43, 5510.47, -4922.38, 846.07, 0, ''),
(@NPC_RANSHALLA, 44, 5517.66, -4920.82, 845.12, 0, 'escort paused'),
(@NPC_RANSHALLA, 45, 5517.6, -4920.8, 845.12, 0, 'dummy to stop despawn');

-- creature
UPDATE `creature_template` SET `ScriptName`='npc_ranshalla' WHERE `entry`=@NPC_RANSHALLA;
UPDATE `creature_template` SET `unit_flags`=256 WHERE `entry`=@NPC_GUARDIAN_ELUNE; -- make guardian immune to PCs
-- gameobject
UPDATE `gameobject_template` SET `ScriptName`='go_elune_fire' WHERE `entry` IN (@GO_ELUNE_FIRE, @GO_ELUNE_ALTAR);
UPDATE `gameobject_template` SET `flags`=16 WHERE `entry`=@GO_ELUNE_ALTAR; -- stop people from touching altar early
-- Light and Gem Spawns
DELETE FROM `gameobject` WHERE `id` IN (@GO_ELUNE_GEM, @GO_ELUNE_LIGHT);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GO_GUID+0,@GO_ELUNE_LIGHT,1,1,1,5515.71,-4905.82,846.322,4.62478,0,0,0.737392,-0.675466,-600,255,1),
(@GO_GUID+1,@GO_ELUNE_LIGHT,1,1,1,5505.09,-4909.36,848.961,5.63402,0,0,0.318914,-0.947784,-600,255,1),
(@GO_GUID+2,@GO_ELUNE_LIGHT,1,1,1,5501.69,-4920.04,848.791,0.155868,0,0,0.0778553,0.996965,-600,255,1),
(@GO_GUID+3,@GO_ELUNE_LIGHT,1,1,1,5510.28,-4929.31,845.214,1.62064,0,0,0.724507,0.689267,-600,255,1),
(@GO_GUID+4,@GO_ELUNE_LIGHT,1,1,1,5520.35,-4925.22,843.644,2.13507,0,0,0.876015,0.482283,-600,255,1),
(@GO_GUID+5,@GO_ELUNE_LIGHT,1,1,1,5526.7,-4916.41,843.452,3.01865,0,0,0.998111,0.0614331,-600,255,1),
(@GO_GUID+6,@GO_ELUNE_GEM,1,1,1,5514.49,-4917.57,850.538,2.3911,0,0,0.930417,0.366502,-900,100,1);

-- EFFECT1 for 18953
DELETE FROM `spell_dbc` WHERE `id`=18954;
INSERT INTO `spell_dbc` (`id`, `Attributes`, `CastingTimeIndex`, `ProcChance`, `RangeIndex`, `EquippedItemClass`, `Effect1`, `EffectImplicitTargetA1`, `DmgMultiplier1`, `Comment`) VALUES
(18954, 256, 1, 101, 1, -1, 3, 1, 1, 'Ranshalla Despawn');
-- Fix quest 14077: The Light's Mercy
SET @SPELL := 66390; 
SET @NPC := 34852; 
SET @NPC_REWARD := 34852; 
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` = @NPC; 
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC AND `source_type`=0; 
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`,`event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`,`action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@NPC,0,0,1,8,0,100,0x01,@SPELL,0,0,0,33,@NPC_REWARD,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Slain Tualiq Villager - On spell hit - Give kill credit for quest 14077'),
(@NPC,0,1,0,61,0,100,1,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Slain Tualiq Villager - Despawn after 2 seconds'); 
DELETE FROM `smart_scripts` WHERE `entryorguid`=9026 AND `source_type`=0 AND `id`=2;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(9026,0,2,0,6,0,100,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0, "Overmaster Pyron - On Death - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=9026 AND `groupid`=0;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(9026,0,0, "I will be reborn, mortals! Incendius shall raise me from these ashes!",12,0,100,0,0,0,"Overmaster Pyron");
SET @CGUID := 54428; -- set by TDB team (3)
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+2;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, 36656, 571, 1, 1, 5647.669, 2106.526, 798.1375, 4.764749, 120, 0, 0), -- Silver Covenant Sentinel (Area: 4862)
(@CGUID+1, 36656, 571, 1, 1, 5657.819, 2105.712, 798.1375, 4.590216, 120, 0, 0), -- Silver Covenant Sentinel (Area: 4862)
(@CGUID+2, 36624, 571, 1, 1, 5652.733, 2106.208, 798.1375, 4.572762, 120, 0, 0); -- Caladis Brightspear (Area: 4862)
DELETE FROM `creature_addon` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+2;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(@CGUID+0, 0, 0, 0x10000, 0x1, 0, '71311'),
(@CGUID+1, 0, 0, 0x10000, 0x1, 0, '71311'),
(@CGUID+2, 0, 0, 0x10000, 0x1, 0, '71311');
UPDATE `smart_scripts` SET `event_phase_mask`=0 WHERE `entryorguid`=2289 AND `source_type`=1;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry`=1494;
DELETE FROM `smart_scripts` WHERE `entryorguid`=1494;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(1494,0,0,0,1,0,100,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0, 'On Respawn - Say Line - Yell Text on Summon');
-- Add missing creature_text
DELETE FROM `creature_text` WHERE `entry`=1494 AND `groupid`=0;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES 
(1494,0,0, 'Mmmh...I SMELL FOOD!',14,0,100,0,0,0, 'Negolash Yell on Summon');
-- missing objects/mobs on Demon Fall Ridge
SET @OGUID := 6040;
SET @CGUID := 108860;
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID AND @OGUID+3;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@OGUID+0,1622 ,1,1,1,1559.646 ,-2812.193,181.5358 ,0 ,0 ,0 ,0 ,1 ,120,255,1), --  Bruiseweed (Area: Demon Fall Ridge),
(@OGUID+1,1623 ,1,1,1,1599.648 ,-3088.057,89.47401 ,0 ,0 ,0 ,0 ,1 ,120,255,1), --  Wild Steelbloom (Area: Demon Fall Ridge),
(@OGUID+2,1732 ,1,1,1,1619.236 ,-3106.807,90.91071 ,0 ,0 ,0 ,0 ,1 ,120,255,1), --  Tin Vein (Area: Demon Fall Ridge),
(@OGUID+3,176784,1,1,1,1550.686 ,-2862.281,181.7537 ,3.141593 ,0 ,0 ,0 ,1 ,120,255,1); -- Bonfire (Area: Demon Fall Ridge);
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID AND @CGUID+25;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`MovementType`) VALUES
(@CGUID+00,11697,1,1,1,1377.036,-2832.29,108.1152,5.778122,120,10,1), --  Mannoroc Lasher (Area: Demon Fall Ridge) (waypoints or random movement)
(@CGUID+01,11697,1,1,1,1442.845,-2781.555,143.3298,3.407407,120,10,1), --  Mannoroc Lasher (Area: Demon Fall Ridge) (possible waypoints or random movement)
(@CGUID+02,11697,1,1,1,1520.548,-2910.79,128.7899,0.3708913,120,10,1), --  Mannoroc Lasher (Area: Demon Fall Ridge) (possible waypoints or random movement)
(@CGUID+03,11697,1,1,1,1522.825,-2851.57,182.1475,5.156503,120,10,1), --  Mannoroc Lasher (Area: Demon Fall Ridge) (waypoints or random movement)
(@CGUID+04,11697,1,1,1,1538.938,-2878.932,183.4645,1.239184,120,0,0), --  Mannoroc Lasher (Area: Demon Fall Ridge)
(@CGUID+05,11697,1,1,1,1544.031,-2848.745,182.5147,5.044002,120,0,0), --  Mannoroc Lasher (Area: Demon Fall Ridge)
(@CGUID+06,11697,1,1,1,1544.416,-2863.002,112.0556,2.701836,120,10,1), --  Mannoroc Lasher (Area: Demon Fall Ridge) (possible waypoints or random movement)
(@CGUID+07,11697,1,1,1,1563.016,-2859.155,182.2932,4.066617,120,0,0), --  Mannoroc Lasher (Area: Demon Fall Ridge)
(@CGUID+08,11697,1,1,1,1581.573,-2897.424,182.3294,1.43117,120,0,0), --  Mannoroc Lasher (Area: Demon Fall Ridge)
(@CGUID+09,16030,1,1,1,1625.747,-3095.011,89.12293,2.2015,120,10,1), --  Maggot (Area: Demon Fall Ridge)
(@CGUID+10,16030,1,1,1,1636.01,-3052.925,90.07569,4.715363,120,10,1), --  Maggot (Area: Demon Fall Ridge)
(@CGUID+11,16030,1,1,1,1647.72,-3076.708,88.33277,1.016972,120,10,1), --  Maggot (Area: Demon Fall Ridge)
(@CGUID+12,6073,1,1,1,1420.36,-2797,153.2968,4.158457,120,0,0), --  Searing Infernal (Area: Demon Fall Ridge)
(@CGUID+13,6073,1,1,1,1451.373,-2815.769,154.2159,4.385233,120,0,0), --  Searing Infernal (Area: Demon Fall Ridge)
(@CGUID+14,6073,1,1,1,1500.756,-2835.735,111.587,5.95405,120,0,0), --  Searing Infernal (Area: Demon Fall Ridge)
(@CGUID+15,6073,1,1,1,1512.830,-2877.935,111.1157,2.860,120,0,0), --  Searing Infernal (Area: Demon Fall Ridge)
(@CGUID+16,6073,1,1,1,1550.406,-2885.673,132.9547,4.354227,120,0,0), --  Searing Infernal (Area: Demon Fall Ridge)
(@CGUID+17,6073,1,1,1,1555.71,-2901.445,182.4397,3.857178,120,10,1), --  Searing Infernal (Area: Demon Fall Ridge)
(@CGUID+18,6073,1,1,1,1566.779,-2894.126,132.5958,0.1956479,120,0,0), --  Searing Infernal (Area: Demon Fall Ridge)
(@CGUID+19,6073,1,1,1,1537.930,-2823.109,181.6067,5.282221,120,0,0), --  Searing Infernal (Area: Demon Fall Ridge)
(@CGUID+20,6073,1,1,1,1583.341,-2959.558,182.2528,5.410459,120,0,0), --  Searing Infernal (Area: Demon Fall Ridge)
(@CGUID+21,6115,1,1,1,1420.313,-2851.199,133.127,0.9438578,120,10,1), --  Roaming Felguard (Area: Demon Fall Ridge) (waypoints or random movement)
(@CGUID+22,6115,1,1,1,1461.483,-2783.054,154.6106,4.637331,120,10,1), --  Roaming Felguard (Area: Demon Fall Ridge) (waypoints or random movement)
(@CGUID+23,6115,1,1,1,1521.961,-2856.834,111.6264,4.90235,120,10,1), --  Roaming Felguard (Area: Demon Fall Ridge) (waypoints or random movement)
(@CGUID+24,6115,1,1,1,1610.802,-3083.251,89.95774,1.347837,120,10,1), --  Roaming Felguard (Area: Demon Fall Ridge) waypoints or random movement)
(@CGUID+25,6115,1,1,1,1611.121,-2985.179,182.0912,2.853907,120,10,1); -- Roaming Felguard (Area: Demon Fall Ridge) (waypoints or random movement)
-- reposition to avoid position clash with other mob
UPDATE creature SET position_x = 1553.05,position_y = -2844.765,position_z = 129.70,orientation = 0.6726,MovementType = 0,spawndist = 0 WHERE `guid` = 20082;
-- pathing for Felguard #20872 on 
SET @WPID := 208720;
UPDATE `creature` SET `MovementType`=2,`position_x`=1445.667358,`position_y`=-2785.956299,`position_z`=144.079132,`currentwaypoint`=0 WHERE `guid`=20872;
DELETE FROM `creature_addon` WHERE `guid`=20872;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (20872,@WPID);
DELETE FROM `waypoint_data` WHERE `id`=@WPID;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@WPID,0,1445.667358,-2785.956299,144.079132,0,0,0,0,100,0),
(@WPID,1,1450.664429,-2799.601807,144.581528,0,0,0,0,100,0),
(@WPID,2,1457.757935,-2801.675293,145.510452,0,0,0,0,100,0),
(@WPID,3,1467.130493,-2804.867188,147.879959,0,0,0,0,100,0),
(@WPID,4,1476.766113,-2806.016602,149.540283,0,0,0,0,100,0),
(@WPID,5,1478.050537,-2798.385254,149.963150,0,0,0,0,100,0),
(@WPID,6,1473.788696,-2787.377197,152.504379,0,0,0,0,100,0),
(@WPID,7,1468.064453,-2783.520264,154.801208,0,0,0,0,100,0),
(@WPID,8,1460.110718,-2782.338135,154.570343,0,0,0,0,100,0),
(@WPID,9,1466.063477,-2783.569580,155.144333,0,0,0,0,100,0),
(@WPID,10,1473.382202,-2788.681152,152.407547,0,0,0,0,100,0),
(@WPID,11,1477.975464,-2797.371094,150.017349,0,0,0,0,100,0),
(@WPID,12,1473.043457,-2804.988770,149.482895,0,0,0,0,100,0),
(@WPID,13,1465.716309,-2806.197021,147.414398,0,0,0,0,100,0),
(@WPID,14,1457.339355,-2802.397949,145.514069,0,0,0,0,100,0),
(@WPID,15,1450.980835,-2794.119385,144.331573,0,0,0,0,100,0);
-- pathing for Felguard #20874 on 
SET @WPID := 208740;
UPDATE `creature` SET `MovementType`=2,`position_x`=1427.127686,`position_y`=-2794.929199,`position_z`=153.367630,`currentwaypoint`=0 WHERE `guid`=20874;
DELETE FROM `creature_addon` WHERE `guid`=20874;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (20874,@WPID);
DELETE FROM `waypoint_data` WHERE `id`=@WPID;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@WPID,0,1427.127686,-2794.929199,153.367630,0,0,0,0,100,0),
(@WPID,1,1434.866943,-2792.607666,153.983551,0,0,0,0,100,0),
(@WPID,2,1439.881104,-2789.645996,156.961761,0,0,0,0,100,0),
(@WPID,3,1446.391846,-2787.082031,158.247574,0,0,0,0,100,0),
(@WPID,4,1452.749390,-2784.158691,156.516998,0,0,0,0,100,0),
(@WPID,5,1461.059204,-2782.987793,154.608047,0,0,0,0,100,0),
(@WPID,6,1459.080078,-2790.694580,157.111328,0,0,0,0,100,0),
(@WPID,7,1457.619629,-2795.229492,158.473236,0,0,0,0,100,0),
(@WPID,8,1455.797607,-2801.988037,158.055511,0,0,0,0,100,0),
(@WPID,9,1453.832642,-2808.706543,155.066422,0,0,0,0,100,0),
(@WPID,10,1451.864258,-2814.851807,153.940338,0,0,0,0,100,0),
(@WPID,11,1453.883789,-2807.040039,155.886780,0,0,0,0,100,0),
(@WPID,12,1457.238525,-2798.087891,158.691376,0,0,0,0,100,0),
(@WPID,13,1459.887451,-2791.610352,157.409363,0,0,0,0,100,0),
(@WPID,14,1461.216431,-2782.308350,154.564026,0,0,0,0,100,0),
(@WPID,15,1450.710571,-2784.914063,157.356842,0,0,0,0,100,0),
(@WPID,16,1444.170044,-2787.408203,158.144180,0,0,0,0,100,0),
(@WPID,17,1434.528687,-2791.566895,154.061630,0,0,0,0,100,0);
-- pathing for Felguard #20876 on 
SET @WPID := 208760;
UPDATE creature SET `MovementType`=2,`position_x`=1519.061279,`position_y`=-2911.228271,`position_z`=128.724503,`currentwaypoint`=0 WHERE `guid` = 20876;
DELETE FROM `creature_addon` WHERE `guid` = 20876;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (20876,@WPID);
DELETE FROM `waypoint_data` WHERE `id`=@WPID;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@WPID,0,1519.061279,-2911.228271,128.724503,0,0,0,0,100,0),
(@WPID,1,1520.779297,-2904.444336,130.019699,0,0,0,0,100,0),
(@WPID,2,1523.576782,-2894.323975,129.760376,0,0,0,0,100,0),
(@WPID,3,1525.399658,-2887.565674,129.650497,0,0,0,0,100,0),
(@WPID,4,1527.510254,-2880.891602,127.859444,0,0,0,0,100,0),
(@WPID,5,1530.465454,-2871.784424,124.707077,0,0,0,0,100,0),
(@WPID,6,1534.396240,-2865.125244,124.945396,0,0,0,0,100,0),
(@WPID,7,1541.486206,-2857.385254,129.325195,0,0,0,0,100,0),
(@WPID,8,1546.340820,-2852.342285,129.804764,0,0,0,0,100,0),
(@WPID,9,1551.960815,-2845.879395,129.609558,0,0,0,0,100,0),
(@WPID,10,1547.109009,-2851.705322,129.800903,0,0,0,0,100,0),
(@WPID,11,1542.209229,-2856.704590,129.541779,0,0,0,0,100,0),
(@WPID,12,1534.886353,-2864.229248,125.346100,0,0,0,0,100,0),
(@WPID,13,1530.252686,-2871.376953,124.679268,0,0,0,0,100,0),
(@WPID,14,1528.427368,-2877.171631,126.128044,0,0,0,0,100,0),
(@WPID,15,1525.856323,-2887.348633,129.625702,0,0,0,0,100,0),
(@WPID,16,1523.781738,-2894.034180,129.770584,0,0,0,0,100,0),
(@WPID,17,1521.690063,-2900.714355,129.564087,0,0,0,0,100,0);
-- pathing for Lasher CGUID+0
SET @WPID := (@CGUID+0)*10;
UPDATE `creature` SET `MovementType`=2,`position_x`=1377.440918,`position_y`=-2831.153320,`position_z`=108.026917,`currentwaypoint`=0 WHERE `guid` = @CGUID+0;
DELETE FROM `creature_addon` WHERE `guid` = @CGUID+0;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@CGUID+0,@WPID);
DELETE FROM `waypoint_data` WHERE `id`=@WPID;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@WPID,0,1377.440918,-2831.153320,108.026917,0,0,0,0,100,0),
(@WPID,1,1382.229004,-2827.563721,108.826355,0,0,0,0,100,0),
(@WPID,2,1391.730957,-2823.097656,109.964256,0,0,0,0,100,0),
(@WPID,3,1403.629517,-2820.422607,113.992607,0,0,0,0,100,0),
(@WPID,4,1414.020630,-2821.883545,116.552795,0,0,0,0,100,0),
(@WPID,5,1425.679565,-2823.227295,118.282143,0,0,0,0,100,0),
(@WPID,6,1437.257935,-2822.140869,120.388496,0,0,0,0,100,0),
(@WPID,7,1444.380127,-2817.184570,120.541428,0,0,0,0,100,0),
(@WPID,8,1439.560669,-2812.109863,120.442703,0,0,0,0,100,0),
(@WPID,9,1429.911133,-2806.321045,121.627449,0,0,0,0,100,0),
(@WPID,10,1420.165527,-2802.415283,122.528816,0,0,0,0,100,0),
(@WPID,11,1406.437866,-2799.521240,123.336349,0,0,0,0,100,0),
(@WPID,12,1408.145020,-2806.980225,124.640030,0,0,0,0,100,0),
(@WPID,13,1411.558472,-2817.519531,130.557297,0,0,0,0,100,0),
(@WPID,14,1414.248291,-2826.448975,134.029892,0,0,0,0,100,0),
(@WPID,15,1416.987061,-2833.898926,134.158966,0,0,0,0,100,0),
(@WPID,16,1418.680298,-2841.623291,134.089142,0,0,0,0,100,0),
(@WPID,17,1417.675415,-2851.522949,133.205948,0,0,0,0,100,0),
(@WPID,18,1419.567261,-2843.880615,134.064331,0,0,0,0,100,0),
(@WPID,19,1418.282349,-2835.081543,133.903214,0,0,0,0,100,0),
(@WPID,20,1413.755615,-2826.055420,133.871857,0,0,0,0,100,0),
(@WPID,21,1410.707886,-2816.007813,129.677521,0,0,0,0,100,0),
(@WPID,22,1407.735840,-2804.345947,123.423225,0,0,0,0,100,0),
(@WPID,23,1411.128418,-2800.364258,123.362190,0,0,0,0,100,0),
(@WPID,24,1423.222046,-2802.809082,122.215492,0,0,0,0,100,0),
(@WPID,25,1432.720093,-2807.233643,121.249458,0,0,0,0,100,0),
(@WPID,26,1442.866333,-2811.426514,120.474632,0,0,0,0,100,0),
(@WPID,27,1442.986938,-2817.752686,120.496185,0,0,0,0,100,0),
(@WPID,28,1432.807739,-2820.319336,120.214920,0,0,0,0,100,0),
(@WPID,29,1422.910767,-2822.051270,118.090607,0,0,0,0,100,0),
(@WPID,30,1411.085083,-2819.568359,115.681824,0,0,0,0,100,0),
(@WPID,31,1400.672852,-2819.333740,113.069351,0,0,0,0,100,0),
(@WPID,32,1392.437012,-2822.626953,110.105415,0,0,0,0,100,0),
(@WPID,33,1381.681763,-2827.953857,108.544312,0,0,0,0,100,0);
-- pathing for Lasher CGUID+3
SET @WPID := (@CGUID+3)*10;
UPDATE `creature` SET `MovementType`=2,`position_x`=1525.115723,`position_y`=-2850.323975,`position_z`=182.264648,`currentwaypoint`=0 WHERE `guid` = @CGUID+3;
DELETE FROM `creature_addon` WHERE `guid` = @CGUID+3;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@CGUID+3,@WPID);
DELETE FROM `waypoint_data` WHERE `id`=@WPID;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@WPID,0,1525.115723,-2850.323975,182.264648,0,0,0,0,100,0),
(@WPID,1,1531.196411,-2840.045166,182.315933,0,0,0,0,100,0),
(@WPID,2,1540.609741,-2830.145752,182.035614,0,0,0,0,100,0),
(@WPID,3,1550.371094,-2824.623535,181.914169,0,0,0,0,100,0),
(@WPID,4,1560.609863,-2825.602783,181.713562,0,0,0,0,100,0),
(@WPID,5,1573.442139,-2834.195557,181.620041,0,0,0,0,100,0),
(@WPID,6,1573.676636,-2843.122803,182.236511,0,0,0,0,100,0),
(@WPID,7,1575.495605,-2852.658936,183.287399,0,0,0,0,100,0),
(@WPID,8,1573.915161,-2863.642578,182.804459,0,0,0,0,100,0),
(@WPID,9,1568.231201,-2881.090820,183.118271,0,0,0,0,100,0),
(@WPID,10,1558.646729,-2884.779541,183.471115,0,0,0,0,100,0),
(@WPID,11,1549.383301,-2877.014160,182.969772,0,0,0,0,100,0),
(@WPID,12,1541.126465,-2864.694092,182.265366,0,0,0,0,100,0);
-- pathing for Felguard CGUID+21 on 
SET @WPID := (@CGUID+21)*10;
UPDATE `creature` SET `MovementType`=2,`position_x`=1418.673340,`position_y`=-2849.543701,`position_z`=133.128998,`currentwaypoint`=0 WHERE `guid` = @CGUID+21;
DELETE FROM `creature_addon` WHERE `guid` = @CGUID+21;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@CGUID+21,@WPID);
DELETE FROM `waypoint_data` WHERE id=@WPID;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@WPID,0,1418.673340,-2849.543701,133.128998,0,0,0,0,100,0),
(@WPID,1,1419.053223,-2840.867188,133.872528,0,0,0,0,100,0),
(@WPID,2,1416.689941,-2834.154297,134.137970,0,0,0,0,100,0),
(@WPID,3,1414.608398,-2827.471436,134.225082,0,0,0,0,100,0),
(@WPID,4,1412.582764,-2820.770996,132.077194,0,0,0,0,100,0),
(@WPID,5,1409.088867,-2810.655762,126.843498,0,0,0,0,100,0),
(@WPID,6,1411.302002,-2817.291016,130.399963,0,0,0,0,100,0),
(@WPID,7,1413.902222,-2826.605957,134.035446,0,0,0,0,100,0),
(@WPID,8,1416.532471,-2833.090820,134.308105,0,0,0,0,100,0),
(@WPID,9,1418.736084,-2841.765137,134.127487,0,0,0,0,100,0);
-- pathing for Felguard CGUID+22 on 
SET @WPID := (@CGUID+22)*10;
UPDATE `creature` SET `MovementType`=2,`position_x`=1461.952393,`position_y`=-2777.578613,`position_z`=154.923584,`currentwaypoint`=0 WHERE `guid` = @CGUID+22;
DELETE FROM `creature_addon` WHERE `guid` = @CGUID+22;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@CGUID+22,@WPID);
DELETE FROM `waypoint_data` WHERE id=@WPID;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@WPID,0,1461.952393,-2777.578613,154.923584,0,0,0,0,100,0),
(@WPID,1,1465.133545,-2767.573975,154.857132,0,0,0,0,100,0),
(@WPID,2,1472.367310,-2758.643555,156.072708,0,0,0,0,100,0),
(@WPID,3,1482.150879,-2754.233887,156.292877,0,0,0,0,100,0),
(@WPID,4,1493.999512,-2752.110352,158.143372,0,0,0,0,100,0),
(@WPID,5,1497.644165,-2753.630127,159.105545,0,0,0,0,100,0),
(@WPID,6,1500.601318,-2760.660889,160.422638,0,0,0,0,100,0),
(@WPID,7,1501.830933,-2768.006348,160.797318,0,0,0,0,100,0),
(@WPID,8,1503.898804,-2771.084473,161.295364,0,0,0,0,100,0),
(@WPID,9,1509.369507,-2777.201904,163.673080,0,0,0,0,100,0),
(@WPID,10,1512.175049,-2785.971191,165.083893,0,0,0,0,100,0),
(@WPID,11,1513.801514,-2792.097412,165.634216,0,0,0,0,100,0),
(@WPID,12,1518.169800,-2796.058838,165.138840,0,0,0,0,100,0),
(@WPID,13,1524.349854,-2800.773926,167.720108,0,0,0,0,100,0),
(@WPID,14,1525.073975,-2806.124023,169.219666,0,0,0,0,100,0),
(@WPID,15,1522.830933,-2812.213623,170.961700,0,0,0,0,100,0),
(@WPID,16,1511.613159,-2814.369385,174.126556,0,0,0,0,100,0),
(@WPID,17,1510.135620,-2812.832031,174.583145,0,0,0,0,100,0),
(@WPID,18,1507.537842,-2804.130127,177.219849,0,0,0,0,100,0),
(@WPID,19,1510.847778,-2799.395020,178.859070,0,0,0,0,100,0),
(@WPID,20,1516.893555,-2797.346436,180.676239,0,0,0,0,100,0),
(@WPID,21,1522.649170,-2800.572021,182.535858,0,0,0,0,100,0),
(@WPID,22,1524.135986,-2803.739746,183.545761,0,0,0,0,100,0),
(@WPID,23,1525.988403,-2809.307129,183.373550,0,0,0,0,100,0),
(@WPID,24,1531.261963,-2816.573486,183.528900,0,0,0,0,100,0),
(@WPID,25,1525.760620,-2811.326904,183.373657,0,0,0,0,100,0),
(@WPID,26,1524.779297,-2808.985840,183.373657,0,0,0,0,100,0),
(@WPID,27,1523.441772,-2802.632324,183.127411,0,0,0,0,100,0),
(@WPID,28,1517.132202,-2796.257080,180.712280,0,0,0,0,100,0),
(@WPID,29,1513.053223,-2798.000732,179.479279,0,0,0,0,100,0),
(@WPID,30,1507.427002,-2804.455811,177.126724,0,0,0,0,100,0),
(@WPID,31,1508.335205,-2810.697266,175.403000,0,0,0,0,100,0),
(@WPID,32,1511.198853,-2812.709717,174.371857,0,0,0,0,100,0),
(@WPID,33,1517.645874,-2814.697510,172.516037,0,0,0,0,100,0),
(@WPID,34,1522.476196,-2811.204834,170.816132,0,0,0,0,100,0),
(@WPID,35,1524.924316,-2804.578857,168.840012,0,0,0,0,100,0),
(@WPID,36,1522.207397,-2800.135010,167.209824,0,0,0,0,100,0),
(@WPID,37,1515.743164,-2793.846436,165.489563,0,0,0,0,100,0),
(@WPID,38,1513.621826,-2789.284180,165.761047,0,0,0,0,100,0),
(@WPID,39,1511.703735,-2782.553467,165.049728,0,0,0,0,100,0),
(@WPID,40,1509.514526,-2776.442139,163.672668,0,0,0,0,100,0),
(@WPID,41,1504.341187,-2768.239258,160.875214,0,0,0,0,100,0),
(@WPID,42,1499.623779,-2758.871826,160.065994,0,0,0,0,100,0),
(@WPID,43,1492.976929,-2750.636963,158.080460,0,0,0,0,100,0),
(@WPID,44,1487.860107,-2750.589600,157.576538,0,0,0,0,100,0),
(@WPID,45,1478.629761,-2755.590332,155.843948,0,0,0,0,100,0),
(@WPID,46,1469.609863,-2761.452148,155.947708,0,0,0,0,100,0),
(@WPID,47,1465.007324,-2767.513184,154.872833,0,0,0,0,100,0),
(@WPID,48,1462.420410,-2775.385254,155.379456,0,0,0,0,100,0);
-- pathing for Felguard CGUID+23 on 
SET @WPID := (@CGUID+23)*10;
UPDATE `creature` SET `MovementType`=2,`position_x`=1529.591064,`position_y`=-2869.343506,`position_z`=124.593094,`currentwaypoint`=0 WHERE `guid` = @CGUID+23;
DELETE FROM `creature_addon` WHERE `guid` = @CGUID+23;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@CGUID+23,@WPID);
DELETE FROM `waypoint_data` WHERE `id`=@WPID;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@WPID,0,1529.591064,-2869.343506,124.593094,0,0,0,0,100,0),
(@WPID,1,1521.646606,-2867.309082,125.010071,0,0,0,0,100,0),
(@WPID,2,1513.953125,-2865.164551,121.647118,0,0,0,0,100,0),
(@WPID,3,1505.404785,-2862.673584,118.801720,0,0,0,0,100,0),
(@WPID,4,1503.566650,-2868.243408,116.714241,0,0,0,0,100,0),
(@WPID,5,1502.711060,-2874.966064,113.316238,0,0,0,0,100,0),
(@WPID,6,1512.905396,-2877.691650,111.030319,0,0,0,0,100,0),
(@WPID,7,1521.637085,-2882.186279,111.867195,0,0,0,0,100,0),
(@WPID,8,1529.314087,-2885.161865,111.463722,0,0,0,0,100,0),
(@WPID,9,1539.290527,-2881.081299,112.201981,0,0,0,0,100,0),
(@WPID,10,1543.733276,-2870.510986,112.591675,0,0,0,0,100,0),
(@WPID,11,1538.328125,-2855.836182,111.515526,0,0,0,0,100,0),
(@WPID,12,1527.172241,-2852.837158,111.962715,0,0,0,0,100,0),
(@WPID,13,1519.438599,-2860.600342,111.478615,0,0,0,0,100,0),
(@WPID,14,1511.972412,-2870.450684,111.600555,0,0,0,0,100,0),
(@WPID,15,1507.419556,-2876.432617,112.032738,0,0,0,0,100,0),
(@WPID,16,1504.038330,-2877.903809,112.833618,0,0,0,0,100,0),
(@WPID,17,1502.584595,-2873.350342,113.795448,0,0,0,0,100,0),
(@WPID,18,1505.001221,-2866.783203,117.746407,0,0,0,0,100,0),
(@WPID,19,1506.119873,-2863.151855,118.807045,0,0,0,0,100,0),
(@WPID,20,1513.878296,-2865.620605,121.673973,0,0,0,0,100,0),
(@WPID,21,1527.201050,-2868.420166,124.730896,0,0,0,0,100,0);
-- pathing for Felguard CGUID+24 on 
SET @WPID := (@CGUID+24)*10;
UPDATE `creature` SET `MovementType`=2,`position_x`=1682.383301,`position_y`=-3116.470459,`position_z`=89.554993,`currentwaypoint`=0 WHERE `guid` = @CGUID+24;
DELETE FROM `creature_addon` WHERE `guid` = @CGUID+24;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@CGUID+24,@WPID);
DELETE FROM `waypoint_data` WHERE `id`=@WPID;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@WPID,0,1682.383301,-3116.470459,89.554993,0,0,0,0,100,0),
(@WPID,1,1674.620605,-3109.400146,88.976250,0,0,0,0,100,0),
(@WPID,2,1658.956787,-3095.415039,89.265846,0,0,0,0,100,0),
(@WPID,3,1653.566772,-3084.082275,88.686615,0,0,0,0,100,0),
(@WPID,4,1646.295532,-3068.169434,88.805115,0,0,0,0,100,0),
(@WPID,5,1636.780884,-3059.662109,88.973808,0,0,0,0,100,0),
(@WPID,6,1624.316528,-3060.500488,89.142319,0,0,0,0,100,0),
(@WPID,7,1617.466064,-3070.297119,89.184601,0,0,0,0,100,0),
(@WPID,8,1617.102051,-3082.547607,89.317902,0,0,0,0,100,0),
(@WPID,9,1627.488770,-3091.394531,88.658096,0,0,0,0,100,0),
(@WPID,10,1637.340332,-3094.989258,88.381920,0,0,0,0,100,0),
(@WPID,11,1650.978027,-3098.081299,88.389397,0,0,0,0,100,0),
(@WPID,12,1665.720093,-3104.706787,88.814766,0,0,0,0,100,0);
-- pathing for Felguard CGUID+25 on 
SET @WPID := (@CGUID+25)*10;
UPDATE `creature` SET `MovementType`=2,`position_x`=1606.020386,`position_y`=-2979.190918,`position_z`=182.066589,`currentwaypoint`=0 WHERE `guid` = @CGUID+25;
DELETE FROM `creature_addon` WHERE `guid` = @CGUID+25;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@CGUID+25,@WPID);
DELETE FROM `waypoint_data` WHERE `id`=@WPID;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@WPID,0,1606.020386,-2979.190918,182.066589,0,0,0,0,100,0),
(@WPID,1,1592.612793,-2967.980469,181.734604,0,0,0,0,100,0),
(@WPID,2,1584.635986,-2961.699951,182.099609,0,0,0,0,100,0),
(@WPID,3,1576.772339,-2950.720215,182.331390,0,0,0,0,100,0),
(@WPID,4,1570.186157,-2937.653564,181.647690,0,0,0,0,100,0),
(@WPID,5,1569.346313,-2915.366455,181.606720,0,0,0,0,100,0),
(@WPID,6,1567.291138,-2897.670410,181.974411,0,0,0,0,100,0),
(@WPID,7,1561.564575,-2883.124512,183.536499,0,0,0,0,100,0),
(@WPID,8,1554.509888,-2870.604492,182.784332,0,0,0,0,100,0),
(@WPID,9,1559.559570,-2883.650391,183.535065,0,0,0,0,100,0),
(@WPID,10,1565.662109,-2900.051514,181.913925,0,0,0,0,100,0),
(@WPID,11,1570.201538,-2913.283936,181.571747,0,0,0,0,100,0),
(@WPID,12,1573.806274,-2932.618896,181.725723,0,0,0,0,100,0),
(@WPID,13,1579.702026,-2949.056885,182.503983,0,0,0,0,100,0),
(@WPID,14,1586.535400,-2960.601807,182.164642,0,0,0,0,100,0),
(@WPID,15,1595.999878,-2972.899414,181.872986,0,0,0,0,100,0);
DELETE FROM `spell_target_position` WHERE `id`=53821;
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
(53821, 609, 2359.64, -5662.41, 382.261, 0.596899); -- Teach: Death Gate
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=34852;
-- The Forging of Quel'Serrar (7509)
UPDATE `quest_template` SET `RequiredClasses` = 3 WHERE `Id` = 7509; -- Warrior & Paladin
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=28877;

DELETE FROM `creature_ai_scripts` WHERE `creature_id`=28877;

DELETE FROM `smart_scripts` WHERE `entryorguid`=28877 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`id`,`link`,`event_type`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`target_type`,`comment`) VALUES
(28877,0,0,0,3000,5000,3000,5000,11,32018,2,'Stormwatcher - In combat - Cast Call Lightning'),
(28877,1,2,8,53145,0,0,0,11,53162,1,'Stormwatcher - On spellhit - Summon Stormwatchers Head'),
(28877,2,0,61,0,0,0,0,41,0,1,'Stormwatcher - Linked with id 1 - Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=53145;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`NegativeCondition`,`Comment`) VALUES
(17,53145,31,1,3,28877,0,'Target needs to be Stormwatcher'),
(17,53145,36,1,0,0,1,'Target needs to be dead');
DELETE FROM `spell_target_position` WHERE `id`=71436;
INSERT INTO `spell_target_position`(`id`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUE
(71436,-14459.48,492.46,15.12,3.21);
SET @GOSSIP := 5750;
SET @LOTHOS := 14387;

UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1 WHERE `menu_id`=@GOSSIP; -- 4.3.4 (they are 0)

DELETE FROM `smart_scripts` WHERE `entryorguid`=@LOTHOS AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@LOTHOS, 0, 0, 0, 62, 0, 100, 0, @GOSSIP, 0, 0, 0, 11, 25139, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lothos Riftwaker - On Gossip select - Teleport player');

DELETE FROM `spell_target_position` WHERE `id`=25139;
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
(25139, 409, 1080, -483, -108, 1); -- Teleport to Molten Core DND
SET @GUID := 61994;

SET @NPC_ELM_BUNNY := 23837;
SET @NPC_ELM_BUNNY_LARGE := 24110;
SET @NPC_ELM_BUNNY_LARGE_001 := 26298;
SET @NPC_AKALI := 28952;
SET @NPC_AKALI_SUBDUER := 28988;
SET @NPC_AKALI_PROPHET := 28996;

DELETE FROM `creature_text` WHERE `entry` IN (@NPC_AKALI,@NPC_AKALI_PROPHET);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@NPC_AKALI,0,0,'I''M FREE, LITTLE DRAKKARI. TIME TO PAY FOR YOUR MANY TRESSPASSES!',14,0,100,33,0,771,'Akali'),
(@NPC_AKALI_PROPHET,0,0,'ENOUGH!',14,0,100,15,0,0,'Prophet of Akali'),
(@NPC_AKALI_PROPHET,1,0,'And now, Akali, my master will have your blood and I will take some of your power as well!',14,0,100,397,0,0,'Prophet of Akali'),
(@NPC_AKALI_PROPHET,2,0,'It is done. Run back to your masters. Run back to Har''koa. Tell her that I am coming!',14,0,100,14,0,0,'Prophet of Akali');

UPDATE `creature_model_info` SET `bounding_radius`=1.041666, `combat_reach`=4.5 WHERE `modelid`=25839;

UPDATE `creature_template` SET `rank`=1, `unit_flags`=33536, `dmg_multiplier`=10 WHERE `entry`=@NPC_AKALI;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@NPC_ELM_BUNNY_LARGE,@NPC_AKALI,@NPC_AKALI_SUBDUER);
UPDATE `creature_template` SET `inhabitType`=4 WHERE `entry` IN (@NPC_ELM_BUNNY_LARGE,@NPC_ELM_BUNNY_LARGE_001);
UPDATE `creature_template` SET `faction_A`=2069, `faction_H`=2069, `unit_flags`=33536, `AIName`='SmartAI' WHERE `entry`=@NPC_AKALI_PROPHET;

UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `guid` IN (100333,100334,100335,100336);
UPDATE `creature` SET `modelid`=21999 WHERE `id`=@NPC_ELM_BUNNY_LARGE_001;
DELETE FROM `creature` WHERE `guid` IN (@GUID+0,@GUID+1,@GUID+2);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`MovementType`) VALUES
(@GUID+0,@NPC_ELM_BUNNY_LARGE_001,571,1,1,0,6863.839,-4503.26,443.1838,3.926991,300,0,0),
(@GUID+1,@NPC_ELM_BUNNY_LARGE_001,571,1,1,0,6862.341,-4549.724,443.0588,2.286381,300,0,0),
(@GUID+2,@NPC_ELM_BUNNY,571,1,1,11686,6829.338,-4525.157,442.068,3.420845,300,0,0);

DELETE FROM `creature_addon` WHERE `guid` IN (100333,100334,100335,100336);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(100333,0,0,0,1,0,'52855'),
(100334,0,0,0,1,0,'52855'),
(100335,0,0,0,1,0,'52855'),
(100336,0,0,0,1,0,'52855');

DELETE FROM `creature_summon_groups` WHERE `summonerId`=@NPC_AKALI;
INSERT INTO `creature_summon_groups` (`summonerId`,`summonerType`,`groupId`,`entry`,`position_x`,`position_y`,`position_z`,`orientation`,`summonType`,`summonTime`) VALUES
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6810.893,-4592.669,440.6777,1.299272,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6806.189,-4595.943,440.6777,1.250024,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6822.087,-4599.02,440.6777,1.469111,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6797.534,-4594.82,440.685,1.137566,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6827.478,-4601.454,440.6777,1.543024,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6817.193,-4601.688,440.6777,1.409492,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6834.823,-4602.401,440.6777,1.638796,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6805.295,-4601.961,440.6777,1.263096,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6765.525,-4543.851,440.6777,0.2786701,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6764.082,-4549.868,440.6777,0.3558455,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6765.489,-4564.422,440.6777,0.5454721,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6763.994,-4537.706,440.6782,0.1836674,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6826.999,-4607.5,440.6777,1.539239,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6763.607,-4558.375,440.6785,0.4619856,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6796.735,-4602.545,441.0136,1.167641,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6832.644,-4607.751,440.6777,1.607957,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6810.649,-4609.51,440.6977,1.349023,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6821.64,-4610.604,440.6777,1.477666,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6759.292,-4545.87,440.828,0.2817687,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6758.293,-4555.154,440.7154,0.393915,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6758.89,-4536.409,441.8029,0.152804,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6759.161,-4564.057,440.7889,0.5006734,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6800.313,-4611.478,442.0841,1.242545,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6755.442,-4540.723,441.9008,0.2022173,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6756.493,-4531.063,443.5255,0.07566226,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6754.277,-4551.221,440.8657,0.3288565,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6815.617,-4616.651,440.7146,1.418685,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6753.755,-4559.585,441.2291,0.4221908,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6750.038,-4544.226,441.7151,0.2309312,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6748.174,-4550.871,441.9503,0.301857,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6901.166,-4516.716,440.6777,3.263991,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6904.161,-4525.245,440.6777,3.145305,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6843.423,-4464.692,440.6777,4.488739,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6894.436,-4500.116,440.6777,3.514982,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6908.481,-4530.965,440.6777,3.0727,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6851.518,-4464.19,440.6777,4.368972,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6903.379,-4508.444,440.6777,3.369018,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6862.596,-4466.07,440.6777,4.205543,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6907.354,-4513.603,440.6777,3.293668,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6847.208,-4459.859,440.6799,4.450202,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6901.388,-4500.221,440.6777,3.480376,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6910.758,-4518.518,440.6777,3.22766,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6877.528,-4472.05,440.6777,3.981474,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6906.053,-4501.915,440.6777,3.441033,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6855.152,-4457.84,440.2045,4.351227,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6903.093,-4495.178,440.6777,3.533091,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6871.4,-4463.921,440.6777,4.11605,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6911.422,-4507.554,440.6777,3.357718,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6916.012,-4518.927,440.6807,3.217745,3,100000),
(@NPC_AKALI,0,1,@NPC_AKALI_SUBDUER,6864.756,-4459.202,440.6777,4.224802,3,100000);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (52816,52833,52834,52837,52838,52844,52867,52884);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,52816,0,0,31,0,3,@NPC_ELM_BUNNY_LARGE,0,0,0,'','Spell Akali Chain Anchor On Disturb targets ELM General Purpose Bunny Large'),
(13,1,52816,0,1,31,0,3,@NPC_ELM_BUNNY_LARGE_001,0,0,0,'','Spell Akali Chain Anchor On Disturb targets ELM General Purpose Bunny Large'),
(13,1,52833,0,0,31,0,3,@NPC_AKALI,0,0,0,'','Spell Akali''s Chains - Left Front Paw targets Akali'),
(13,1,52834,0,0,31,0,3,@NPC_AKALI,0,0,0,'','Spell Akali''s Chains - Right Front Paw targets Akali'),
(13,1,52837,0,0,31,0,3,@NPC_ELM_BUNNY_LARGE_001,0,0,0,'','Spell Akali''s Chains - Right Rear Paw targets ELM General Purpose Bunny Large'),
(13,1,52837,0,0,35,0,1,5,3,0,0,'','Spell Akali''s Chains - Right Rear Paw target distance must be 5y or more'),
(13,1,52838,0,0,31,0,3,@NPC_ELM_BUNNY_LARGE_001,0,0,0,'','Spell Akali''s Chains - Left Rear Paw targets ELM General Purpose Bunny Large'),
(13,1,52838,0,0,35,0,1,5,3,0,0,'','Spell Akali''s Chains - Left Rear Paw target distance must be 5y or more'),
(13,1,52844,0,0,31,0,3,@NPC_AKALI,0,0,0,'','Spell Akali''s Chains - Rear Paw Invisible Stun Channel targets Akali'),
(13,1,52867,0,0,31,0,3,@NPC_AKALI_SUBDUER,0,0,0,'','Spell Knockback targets Akali Subduer'),
(13,1,52884,0,0,31,0,3,@NPC_AKALI,0,0,0,'','Spell Drain Power targets Akali');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=52860;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(52860,45254,1,'On spellhit Rampage: Drain Power Effect - Spellcast Suicide');

DELETE FROM `spell_dbc` WHERE `Id`=52867;
INSERT INTO `spell_dbc` (`Id`,`Dispel`,`Mechanic`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`AttributesEx6`,`AttributesEx7`,`Stances`,`StancesNot`,`Targets`,`CastingTimeIndex`,`AuraInterruptFlags`,`ProcFlags`,`ProcChance`,`ProcCharges`,`MaxLevel`,`BaseLevel`,`SpellLevel`,`DurationIndex`,`RangeIndex`,`StackAmount`,`EquippedItemClass`,`EquippedItemSubClassMask`,`EquippedItemInventoryTypeMask`,`Effect1`,`Effect2`,`Effect3`,`EffectDieSides1`,`EffectDieSides2`,`EffectDieSides3`,`EffectRealPointsPerLevel1`,`EffectRealPointsPerLevel2`,`EffectRealPointsPerLevel3`,`EffectBasePoints1`,`EffectBasePoints2`,`EffectBasePoints3`,`EffectMechanic1`,`EffectMechanic2`,`EffectMechanic3`,`EffectImplicitTargetA1`,`EffectImplicitTargetA2`,`EffectImplicitTargetA3`,`EffectImplicitTargetB1`,`EffectImplicitTargetB2`,`EffectImplicitTargetB3`,`EffectRadiusIndex1`,`EffectRadiusIndex2`,`EffectRadiusIndex3`,`EffectApplyAuraName1`,`EffectApplyAuraName2`,`EffectApplyAuraName3`,`EffectAmplitude1`,`EffectAmplitude2`,`EffectAmplitude3`,`EffectMultipleValue1`,`EffectMultipleValue2`,`EffectMultipleValue3`,`EffectMiscValue1`,`EffectMiscValue2`,`EffectMiscValue3`,`EffectMiscValueB1`,`EffectMiscValueB2`,`EffectMiscValueB3`,`EffectTriggerSpell1`,`EffectTriggerSpell2`,`EffectTriggerSpell3`,`EffectSpellClassMaskA1`,`EffectSpellClassMaskA2`,`EffectSpellClassMaskA3`,`EffectSpellClassMaskB1`,`EffectSpellClassMaskB2`,`EffectSpellClassMaskB3`,`EffectSpellClassMaskC1`,`EffectSpellClassMaskC2`,`EffectSpellClassMaskC3`,`MaxTargetLevel`,`SpellFamilyName`,`SpellFamilyFlags1`,`SpellFamilyFlags2`,`SpellFamilyFlags3`,`MaxAffectedTargets`,`DmgClass`,`PreventionType`,`AreaGroupId`,`SchoolMask`,`Comment`) VALUES
(52867,0,0,538968320,525448,67108868,64,2177,0,512,0,0,0,0,1,0,0,101,0,0,0,0,0,1,0,-1,0,0,98,0,0,1,0,0,0,0,0,199,0,0,0,0,0,22,0,0,7,0,0,10,0,0,0,0,0,0,0,0,0,0,0,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,'Knockback');

DELETE FROM `creature_ai_scripts` WHERE `creature_id`=28575;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-100333,-100334,-100335,-100336,-113548,-113549,-113550,-113551,-(@GUID+0),-(@GUID+1),-(@GUID+2),@NPC_AKALI,@NPC_AKALI_SUBDUER,@NPC_AKALI_PROPHET) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC_AKALI*100+0,@NPC_AKALI*100+1,@NPC_AKALI_SUBDUER*100,@NPC_AKALI_PROPHET*100+0,@NPC_AKALI_PROPHET*100+1) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-100333,0,0,1,8,0,100,0,52816,0,0,0,45,0,1,0,0,0,0,10,@GUID+2,@NPC_ELM_BUNNY,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Chain Anchor On Disturb - Set data 0 1 ELM General Purpose Bunny'),
(-100333,0,1,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Chain Anchor On Disturb - Despawn'),
(-100334,0,0,1,8,0,100,0,52816,0,0,0,45,0,1,0,0,0,0,10,@GUID+2,@NPC_ELM_BUNNY,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Chain Anchor On Disturb - Set data 0 1 ELM General Purpose Bunny'),
(-100334,0,1,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Chain Anchor On Disturb - Despawn'),
(-100335,0,0,1,8,0,100,0,52816,0,0,0,45,0,1,0,0,0,0,10,@GUID+2,@NPC_ELM_BUNNY,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Chain Anchor On Disturb - Set data 0 1 ELM General Purpose Bunny'),
(-100335,0,1,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Chain Anchor On Disturb - Despawn'),
(-100336,0,0,1,8,0,100,0,52816,0,0,0,45,0,1,0,0,0,0,10,@GUID+2,@NPC_ELM_BUNNY,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Chain Anchor On Disturb - Set data 0 1 ELM General Purpose Bunny'),
(-100336,0,1,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Chain Anchor On Disturb - Despawn'),

(-113548,0,0,0,38,0,100,0,0,1,0,0,11,52833,0,0,0,0,0,10,98159,@NPC_AKALI,0,0,0,0,0, 'ELM General Purpose Bunny - On data 0 1 set - Spellcast Akali''s Chains - Left Front Paw'),
(-113548,0,1,0,8,0,100,0,52816,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Chain Anchor On Disturb - Despawn'),
(-113549,0,0,0,38,0,100,0,0,1,0,0,11,52834,0,0,0,0,0,10,98159,@NPC_AKALI,0,0,0,0,0, 'ELM General Purpose Bunny - On data 0 1 set - Spellcast Akali''s Chains - Right Front Paw'),
(-113549,0,1,0,8,0,100,0,52816,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Chain Anchor On Disturb - Despawn'),
(-113550,0,0,0,38,0,100,0,0,1,0,0,11,52844,0,0,0,0,0,10,98159,@NPC_AKALI,0,0,0,0,0, 'ELM General Purpose Bunny - On data 0 1 set - Spellcast Rear Paw Invisible Stun Channel'),
(-113550,0,1,0,8,0,100,0,52816,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Chain Anchor On Disturb - Despawn'),
(-113551,0,0,0,38,0,100,0,0,1,0,0,11,52844,0,0,0,0,0,10,98159,@NPC_AKALI,0,0,0,0,0, 'ELM General Purpose Bunny - On data 0 1 set - Spellcast Rear Paw Invisible Stun Channel'),
(-113551,0,1,0,8,0,100,0,52816,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Chain Anchor On Disturb - Despawn'),
(-(@GUID+0),0,0,0,38,0,100,0,0,1,0,0,11,52837,0,0,0,0,0,10,113478,@NPC_ELM_BUNNY_LARGE_001,0,0,0,0,0, 'ELM General Purpose Bunny - On data 0 1 set - Spellcast Akali''s Chains - Right Rear Paw'),
(-(@GUID+0),0,1,0,8,0,100,0,52816,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Chain Anchor On Disturb - Despawn'),
(-(@GUID+1),0,0,0,38,0,100,0,0,1,0,0,11,52838,0,0,0,0,0,10,113479,@NPC_ELM_BUNNY_LARGE_001,0,0,0,0,0, 'ELM General Purpose Bunny - On data 0 1 set - Spellcast Akali''s Chains - Left Rear Paw'),
(-(@GUID+1),0,1,0,8,0,100,0,52816,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On spellhit Chain Anchor On Disturb - Despawn'),

(-(@GUID+2),0,0,1,1,8,100,0,0,0,500,500,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On update OOC (phase 4) - Set event phase 0'),
(-(@GUID+2),0,1,0,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,@NPC_AKALI,30,0,0,0,0,0, 'ELM General Purpose Bunny - On update OOC (phase 4) - Set data 0 1 Akali'),
(-(@GUID+2),0,2,0,38,0,100,0,0,1,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On data 0 1 set - Increment event phase'),

(@NPC_AKALI,0,0,0,38,0,100,0,0,1,0,0,80,@NPC_AKALI*100+0,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali - On data 0 1 set - Run script 0'),
(@NPC_AKALI,0,1,2,8,0,100,0,52859,0,0,0,102,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali - On spellhit Submission - Stop regen health'),
(@NPC_AKALI,0,2,3,61,0,100,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali - On spellhit Submission - Set unit_flags IMMUNE_TO_NPC'),
(@NPC_AKALI,0,3,0,61,0,100,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,6829.587,-4525.521,442.068,0, 'Akali - On spellhit Submission - Move to position'),
(@NPC_AKALI,0,4,0,34,0,100,0,0,1,0,0,80,@NPC_AKALI*100+1,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali - On movement inform - Run script 1'),
(@NPC_AKALI,0,5,0,9,0,100,0,0,80,10000,10000,11,52856,0,0,0,0,0,6,0,0,0,0,0,0,0, 'Akali - On target range 10-80y - Spellcast Charge'),
(@NPC_AKALI,0,6,7,11,0,100,0,0,0,0,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali - On spawn - Set faction default'),
(@NPC_AKALI,0,7,8,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,113548,@NPC_ELM_BUNNY_LARGE_001,0,0,0,0,0, 'Akali - On spawn - Set data 0 1 ELM General Purpose Bunny'),
(@NPC_AKALI,0,8,9,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,113549,@NPC_ELM_BUNNY_LARGE_001,0,0,0,0,0, 'Akali - On spawn - Set data 0 1 ELM General Purpose Bunny'),
(@NPC_AKALI,0,9,10,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,113550,@NPC_ELM_BUNNY_LARGE_001,0,0,0,0,0, 'Akali - On spawn - Set data 0 1 ELM General Purpose Bunny'),
(@NPC_AKALI,0,10,11,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,113551,@NPC_ELM_BUNNY_LARGE_001,0,0,0,0,0, 'Akali - On spawn - Set data 0 1 ELM General Purpose Bunny'),
(@NPC_AKALI,0,11,12,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,@GUID+0,@NPC_ELM_BUNNY_LARGE_001,0,0,0,0,0, 'Akali - On spawn - Set data 0 1 ELM General Purpose Bunny'),
(@NPC_AKALI,0,12,13,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,@GUID+1,@NPC_ELM_BUNNY_LARGE_001,0,0,0,0,0, 'Akali - On spawn - Set data 0 1 ELM General Purpose Bunny'),
(@NPC_AKALI,0,13,14,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,101661,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script - On spawn - Set data 0 1 Akali Subduer'),
(@NPC_AKALI,0,14,15,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,101662,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script - On spawn - Set data 0 1 Akali Subduer'),
(@NPC_AKALI,0,15,16,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,101663,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script - On spawn - Set data 0 1 Akali Subduer'),
(@NPC_AKALI,0,16,17,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,101665,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script - On spawn - Set data 0 1 Akali Subduer'),
(@NPC_AKALI,0,17,18,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,101666,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script - On spawn - Set data 0 1 Akali Subduer'),
(@NPC_AKALI,0,18,19,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,101667,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script - On spawn - Set data 0 1 Akali Subduer'),
(@NPC_AKALI,0,19,20,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,101668,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script - On spawn - Set data 0 1 Akali Subduer'),
(@NPC_AKALI,0,20,21,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,101669,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script - On spawn - Set data 0 1 Akali Subduer'),
(@NPC_AKALI,0,21,22,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,203572,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script - On spawn - Set data 0 1 Akali Subduer'),
(@NPC_AKALI,0,22,23,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,203573,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script - On spawn - Set data 0 1 Akali Subduer'),
(@NPC_AKALI,0,23,24,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,203574,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script - On spawn - Set data 0 1 Akali Subduer'),
(@NPC_AKALI,0,24,25,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,203575,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script - On spawn - Set data 0 1 Akali Subduer'),
(@NPC_AKALI,0,25,26,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,203576,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script - On spawn - Set data 0 1 Akali Subduer'),
(@NPC_AKALI,0,26,0,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,203577,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script - On spawn - Set data 0 1 Akali Subduer'),

(@NPC_AKALI_SUBDUER,0,0,0,2,0,100,0,0,50,90000,90000,11,57843,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer - On health below 50% - Spellcast Mojo Empowered Fire Ward'),
(@NPC_AKALI_SUBDUER,0,1,0,9,0,100,0,25,35,4000,7000,11,9053,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Akali Subduer - On target range 0-35y - Spellcast Fireball'),
(@NPC_AKALI_SUBDUER,0,2,0,9,0,100,0,0,25,3000,5000,11,20801,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Akali Subduer - On target range 0-35y - Spellcast Firebolt'),
(@NPC_AKALI_SUBDUER,0,3,4,54,0,100,0,0,0,0,0,2,2102,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer - Just summoned - Set faction'),
(@NPC_AKALI_SUBDUER,0,4,5,61,0,100,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer - Just summoned - Set unit_flags IMMUNE_TO_PC'),
(@NPC_AKALI_SUBDUER,0,5,6,61,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer - Just summoned - Set run'),
(@NPC_AKALI_SUBDUER,0,6,0,61,0,100,0,0,0,0,0,46,60,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer - Just summoned - Move forward'),
(@NPC_AKALI_SUBDUER,0,7,8,31,0,100,0,52859,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer - On target spellhit Submission - Set homeposition'),
(@NPC_AKALI_SUBDUER,0,8,0,61,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer - On target spellhit Submission - Evade'),
(@NPC_AKALI_SUBDUER,0,9,10,38,0,100,0,0,3,0,0,92,0,0,1,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer - On data 0 3 set - Interrupt spellcast'),
(@NPC_AKALI_SUBDUER,0,10,0,61,0,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer - On data 0 3 set - Stop combat'),
(@NPC_AKALI_SUBDUER,0,11,0,38,0,100,0,0,1,0,0,11,45579,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer - On data 0 1 set - Spellcast Fire Channeling'),
(@NPC_AKALI_SUBDUER,0,12,13,38,0,100,0,0,2,0,0,2,2102,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer - On data 0 2 set - Set faction'),
(@NPC_AKALI_SUBDUER,0,13,0,61,0,100,0,0,0,0,0,92,0,45579,1,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer - On data 0 2 set - Interrupt spellcast'),
(@NPC_AKALI_SUBDUER,0,14,0,38,0,100,0,0,4,0,0,80,@NPC_AKALI_SUBDUER*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer - On data 0 4 set - Run script'),

(@NPC_AKALI_PROPHET,0,0,1,54,0,100,0,0,0,0,0,11,34427,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali - Just summoned - Spellcast Ethereal Teleport'),
(@NPC_AKALI_PROPHET,0,1,0,61,0,100,0,0,0,0,0,1,0,2300,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali - Just summoned - Say line'),
(@NPC_AKALI_PROPHET,0,2,3,52,0,100,0,0,@NPC_AKALI_PROPHET,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali - On text over - Set run'),
(@NPC_AKALI_PROPHET,0,3,0,61,0,100,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,6869.146,-4558.086,443.3982,0, 'Prophet of Akali - On text over - Move to position'),
(@NPC_AKALI_PROPHET,0,4,5,34,0,100,0,0,1,0,0,97,30.7787,0,0,0,0,0,1,0,0,0,6856.265,-4543.67,441.9847,0, 'Prophet of Akali - On movement inform - Jump to position'),
(@NPC_AKALI_PROPHET,0,5,0,61,0,100,0,0,0,0,0,80,@NPC_AKALI_PROPHET*100+0,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali - On WP 1 reached - Run script 0'),
(@NPC_AKALI_PROPHET,0,6,0,38,0,100,0,0,1,0,0,80,@NPC_AKALI_PROPHET*100+1,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali - On data 0 1 set - Run script 1'),

(@NPC_AKALI*100,9,0,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali script 0 - Say line'),
(@NPC_AKALI*100,9,1,0,0,0,100,0,0,0,0,0,15,12721,0,0,0,0,0,18,50,0,0,0,0,0,0, 'Akali script 0 - Quest credit'),
(@NPC_AKALI*100,9,2,0,0,0,100,0,0,0,0,0,107,1,0,0,0,0,0,0,0,0,0,0,0,0,0, 'Akali script 0 - Summon creature group'),
(@NPC_AKALI*100,9,3,0,0,0,100,0,0,0,0,0,45,0,2,0,0,0,0,10,101661,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script 0 - Set data 0 2 Akali Subduer'),
(@NPC_AKALI*100,9,4,0,0,0,100,0,0,0,0,0,45,0,2,0,0,0,0,10,101662,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script 0 - Set data 0 2 Akali Subduer'),
(@NPC_AKALI*100,9,5,0,0,0,100,0,0,0,0,0,45,0,2,0,0,0,0,10,101663,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script 0 - Set data 0 2 Akali Subduer'),
(@NPC_AKALI*100,9,6,0,0,0,100,0,0,0,0,0,45,0,2,0,0,0,0,10,101665,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script 0 - Set data 0 2 Akali Subduer'),
(@NPC_AKALI*100,9,7,0,0,0,100,0,0,0,0,0,45,0,2,0,0,0,0,10,101666,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script 0 - Set data 0 2 Akali Subduer'),
(@NPC_AKALI*100,9,8,0,0,0,100,0,0,0,0,0,45,0,2,0,0,0,0,10,101667,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script 0 - Set data 0 2 Akali Subduer'),
(@NPC_AKALI*100,9,9,0,0,0,100,0,0,0,0,0,45,0,2,0,0,0,0,10,101668,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script 0 - Set data 0 2 Akali Subduer'),
(@NPC_AKALI*100,9,10,0,0,0,100,0,0,0,0,0,45,0,2,0,0,0,0,10,101669,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script 0 - Set data 0 2 Akali Subduer'),
(@NPC_AKALI*100,9,11,0,0,0,100,0,0,0,0,0,45,0,2,0,0,0,0,10,203572,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script 0 - Set data 0 2 Akali Subduer'),
(@NPC_AKALI*100,9,12,0,0,0,100,0,0,0,0,0,45,0,2,0,0,0,0,10,203573,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script 0 - Set data 0 2 Akali Subduer'),
(@NPC_AKALI*100,9,13,0,0,0,100,0,0,0,0,0,45,0,2,0,0,0,0,10,203574,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script 0 - Set data 0 2 Akali Subduer'),
(@NPC_AKALI*100,9,14,0,0,0,100,0,0,0,0,0,45,0,2,0,0,0,0,10,203575,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script 0 - Set data 0 2 Akali Subduer'),
(@NPC_AKALI*100,9,15,0,0,0,100,0,0,0,0,0,45,0,2,0,0,0,0,10,203576,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script 0 - Set data 0 2 Akali Subduer'),
(@NPC_AKALI*100,9,16,0,0,0,100,0,0,0,0,0,45,0,2,0,0,0,0,10,203577,@NPC_AKALI_SUBDUER,0,0,0,0,0, 'Akali script 0 - Set data 0 2 Akali Subduer'),
(@NPC_AKALI*100,9,17,0,0,0,100,0,4600,4600,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali script - Remove unit_flags IMMUNE_TO_NPC'),
(@NPC_AKALI*100,9,18,0,0,0,100,0,55000,55000,0,0,12,@NPC_AKALI_PROPHET,8,0,0,0,0,8,0,0,0,6882.029,-4571.001,442.3118,2.373648, 'Akali script - Summon Akali Prophet'),

(@NPC_AKALI*100+1,9,0,0,0,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali script 1 - Set faction'),
(@NPC_AKALI*100+1,9,1,0,0,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali script 1 - Evade'),
(@NPC_AKALI*100+1,9,2,0,0,0,100,0,200,200,0,0,66,0,0,0,0,0,0,19,@NPC_AKALI_PROPHET,100,0,0,0,0,0, 'Akali script 1 - Turn to'),
(@NPC_AKALI*100+1,9,3,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,@NPC_AKALI_PROPHET,100,0,0,0,0,0, 'Akali script 1 - Set data 0 1 Prophet of Akali'),

(@NPC_AKALI_SUBDUER*100,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,19,@NPC_AKALI_PROPHET,100,0,0,0,0,0, 'Akali Subduer script - Turn to'),
(@NPC_AKALI_SUBDUER*100,9,1,0,0,0,100,0,10000,10000,0,0,5,71,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer script - Play emote'),
(@NPC_AKALI_SUBDUER*100,9,2,0,0,0,100,0,1000,1200,0,0,5,71,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer script - Play emote'),
(@NPC_AKALI_SUBDUER*100,9,3,0,0,0,100,0,1000,1200,0,0,5,71,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer script - Play emote'),
(@NPC_AKALI_SUBDUER*100,9,4,0,0,0,100,0,1000,1200,0,0,5,71,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer script - Play emote'),
(@NPC_AKALI_SUBDUER*100,9,5,0,0,0,100,0,1000,1200,0,0,5,71,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer script - Play emote'),
(@NPC_AKALI_SUBDUER*100,9,6,0,0,0,100,0,1000,1200,0,0,5,71,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer script - Play emote'),
(@NPC_AKALI_SUBDUER*100,9,7,0,0,0,100,0,1000,1200,0,0,5,71,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer script - Play emote'),
(@NPC_AKALI_SUBDUER*100,9,8,0,0,0,100,0,1000,1200,0,0,5,71,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer script - Play emote'),
(@NPC_AKALI_SUBDUER*100,9,9,0,0,0,100,0,1000,1200,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akali Subduer script - Despawn'),

(@NPC_AKALI_PROPHET*100+0,9,0,0,0,0,100,0,0,0,0,0,45,0,3,0,0,0,0,9,@NPC_AKALI_SUBDUER,0,100,0,0,0,0, 'Prophet of Akali script - Set data 0 4 Akali Subduer'), 
(@NPC_AKALI_PROPHET*100+0,9,1,0,0,0,100,0,1000,1000,0,0,11,52859,0,0,0,0,0,19,@NPC_AKALI,100,0,0,0,0,0, 'Prophet of Akali script - Spellcast Submission'), 

(@NPC_AKALI_PROPHET*100+1,9,0,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali script - Say line'),
(@NPC_AKALI_PROPHET*100+1,9,1,0,0,0,100,0,4700,4700,0,0,11,52884,0,0,0,0,0,19,@NPC_AKALI,50,0,0,0,0,0, 'Prophet of Akali script - Spellcast Drain Power'),
(@NPC_AKALI_PROPHET*100+1,9,2,0,0,0,100,0,0,0,0,0,45,0,4,0,0,0,0,9,@NPC_AKALI_SUBDUER,0,100,0,0,0,0, 'Prophet of Akali script - Set data 0 3 Akali Subduer'),
(@NPC_AKALI_PROPHET*100+1,9,3,0,0,0,100,0,11600,11600,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali script - Say line'),
(@NPC_AKALI_PROPHET*100+1,9,4,0,0,0,100,0,3500,3500,0,0,11,34427,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali script - Spellcast Ethereal Teleport'),
(@NPC_AKALI_PROPHET*100+1,9,5,0,0,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Prophet of Akali script - Despawn');
SET @NPC_ELM_BUNNY := 23837;
SET @NPC_HARKOA := 28401;
SET @NPC_KHUFU := 28479;
SET @NPC_AKILZON := 29021;
SET @NPC_HALAZZI := 29022;
SET @NPC_JANALAI := 29023;
SET @NPC_NALORAKK := 29024;

DELETE FROM `creature_text` WHERE `entry`=@NPC_HARKOA AND `groupid`=1;
DELETE FROM `creature_text` WHERE `entry` IN (@NPC_AKILZON,@NPC_HALAZZI,@NPC_JANALAI,@NPC_NALORAKK);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@NPC_HARKOA,1,0,'No, not Akali too!',15,0,100,0,0,0,'Har''koa'),
(@NPC_AKILZON,0,0,'And yet we see only doom in your future. It is your destiny that you do this, $N, but we fear that the prophet is too powerful for you and your friends. Still, you must try.',12,0,100,0,0,12196,'Akil''zon'),
(@NPC_HALAZZI,0,0,'Once more we hear your call, Khufu. We have wisdom for you and $N. You face great peril and must act swiftly or you all and Har''koa will die.',12,0,100,0,0,643,'Halazzi'),
(@NPC_JANALAI,0,0,'The gusty essence of deceased Quetz''lun''s wardens must be gathered to draw him near. To Har''koa must both of these rarities be delivered.',12,0,100,0,0,9919,'Jana''lai'),
(@NPC_NALORAKK,0,0,'The unblemished heart of the guardian must be secured to show defiance and strength. Jealous Zim''Rhuk keeps those who harbor it.',12,0,100,0,0,473,'Nalorakk');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (52934,52935,52936,52937);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,52934,0,0,31,0,3,@NPC_ELM_BUNNY,0,0,0,'','Spell Rampage: Summon Akil''zon targets ELM General Purpose Bunny'),
(13,1,52934,0,0,29,0,28527,10,0,1,0,'','Spell Rampage: Summon Akil''zon target needs to be 35y from Chronicler To''kini'),
(13,1,52934,0,0,29,0,28527,15,0,1,0,'','Spell Rampage: Summon Akil''zon target needs to be 35y from Chronicler To''kini'),
(13,1,52934,0,0,29,0,28527,30,0,1,0,'','Spell Rampage: Summon Akil''zon target needs to be 35y from Chronicler To''kini'),
(13,1,52934,0,0,29,0,28527,35,0,0,0,'','Spell Rampage: Summon Akil''zon target needs to be 35y from Chronicler To''kini'),
(13,1,52935,0,0,31,0,3,@NPC_ELM_BUNNY,0,0,0,'','Spell Rampage: Summon Akil''zon targets ELM General Purpose Bunny'),
(13,1,52935,0,0,29,0,28527,10,0,0,0,'','Spell Rampage: Summon Akil''zon target needs to be 10y from Chronicler To''kini'),
(13,1,52936,0,0,31,0,3,@NPC_ELM_BUNNY,0,0,0,'','Spell Rampage: Summon Akil''zon targets ELM General Purpose Bunny'),
(13,1,52936,0,0,29,0,28527,10,0,1,0,'','Spell Rampage: Summon Akil''zon target needs to be 15y from Chronicler To''kini'),
(13,1,52936,0,0,29,0,28527,15,0,0,0,'','Spell Rampage: Summon Akil''zon target needs to be 15y from Chronicler To''kini'),
(13,1,52937,0,0,31,0,3,@NPC_ELM_BUNNY,0,0,0,'','Spell Rampage: Summon Akil''zon targets ELM General Purpose Bunny'),
(13,1,52937,0,0,29,0,28527,10,0,1,0,'','Spell Rampage: Summon Akil''zon target needs to be 30y from Chronicler To''kini'),
(13,1,52937,0,0,29,0,28527,15,0,1,0,'','Spell Rampage: Summon Akil''zon target needs to be 30y from Chronicler To''kini'),
(13,1,52937,0,0,29,0,28527,30,0,0,0,'','Spell Rampage: Summon Akil''zon target needs to be 30y from Chronicler To''kini');

DELETE FROM `spell_scripts` WHERE `id`=52933;
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(52933,0,0,15,52934,0,0,0,0,0,0),
(52933,0,0,15,52935,0,0,0,0,0,0),
(52933,0,0,15,52936,0,0,0,0,0,0),
(52933,0,0,15,52937,0,0,0,0,0,0);

UPDATE `creature_model_info` SET `bounding_radius`=0.93 WHERE `modelid`=21793;
UPDATE `creature_model_info` SET `bounding_radius`=1.833, `combat_reach`=4.5 WHERE `modelid`=21830;
UPDATE `creature_model_info` SET `bounding_radius`=0.525, `combat_reach`=2.625 WHERE `modelid`=21831;
UPDATE `creature_model_info` SET `bounding_radius`=0.775, `combat_reach`=5 WHERE `modelid`=22256;

DELETE FROM `creature_template_addon` WHERE `entry`=29021;
INSERT INTO `creature_template_addon` (`entry`,`bytes1`) VALUES
(29021,33554432);

UPDATE `creature_template` SET `minlevel`=83, `maxlevel`=83, `faction_A`=1610, `faction_H`=1610, `unit_flags`=512|256, `AIName`='SmartAI' WHERE `entry` IN (@NPC_AKILZON,@NPC_HALAZZI,@NPC_JANALAI,@NPC_NALORAKK);

DELETE FROM `smart_scripts` WHERE `entryorguid`=@NPC_HARKOA AND `source_type`=0 AND `id`=16;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@NPC_KHUFU AND `source_type`=0 AND `id` IN (3,4,5);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC_AKILZON,@NPC_HALAZZI,@NPC_JANALAI,@NPC_NALORAKK) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@NPC_HALAZZI*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_HARKOA,0,16,15,38,0,100,0,0,2,0,0,1,1,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Har''koa - On data 0 2 set - Say line'),

(@NPC_KHUFU,0,3,4,20,0,100,0,12721,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Khufu - On quest rewarded - Store targetlist'),
(@NPC_KHUFU,0,4,5,61,0,100,0,0,0,0,0,100,1,0,0,0,0,0,19,@NPC_HARKOA,100,0,0,0,0,0, 'Khufu - On quest rewarded - Send targetlist to Har''koa'),
(@NPC_KHUFU,0,5,0,61,0,100,0,0,0,0,0,45,0,2,0,0,0,0,19,@NPC_HARKOA,100,0,0,0,0,0, 'Khufu - On quest rewarded - Set data 0 2 Har''koa'),

(@NPC_AKILZON,0,0,0,54,0,100,0,0,0,0,0,11,35426,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akil''zon - Just summoned - Spellcast Arcane Explosion Visual'),
(@NPC_AKILZON,0,1,0,38,0,100,0,0,1,0,0,1,0,0,0,0,0,0,23,0,0,0,0,0,0,0, 'Akil''zon - On data 0 1 set - Say line'),
(@NPC_AKILZON,0,2,0,38,0,100,0,0,2,0,0,41,800,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Akil''zon - On data 0 2 set - Despawn'),

(@NPC_HALAZZI,0,0,1,54,0,100,0,0,0,0,0,11,35426,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Halazzi - Just summoned - Spellcast Arcane Explosion Visual'),
(@NPC_HALAZZI,0,1,0,61,0,100,0,0,0,0,0,80,@NPC_HALAZZI*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Halazzi - Just summoned - Run script'),

(@NPC_JANALAI,0,0,0,54,0,100,0,0,0,0,0,11,35426,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jana''lai - Just summoned - Spellcast Arcane Explosion Visual'),
(@NPC_JANALAI,0,1,0,38,0,100,0,0,1,0,0,1,0,0,0,0,0,0,23,0,0,0,0,0,0,0, 'Jana''lai - On data 0 1 set - Say line'),
(@NPC_JANALAI,0,2,0,38,0,100,0,0,2,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jana''lai - On data 0 2 set - Despawn'),

(@NPC_NALORAKK,0,0,0,54,0,100,0,0,0,0,0,11,35426,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Nalorakk - Just summoned - Spellcast Arcane Explosion Visual'),
(@NPC_NALORAKK,0,1,0,38,0,100,0,0,1,0,0,1,0,0,0,0,0,0,23,0,0,0,0,0,0,0, 'Nalorakk - On data 0 1 set - Say line'),
(@NPC_NALORAKK,0,2,0,38,0,100,0,0,2,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Nalorakk - On data 0 2 set - Despawn'),

(@NPC_HALAZZI*100,9,0,0,0,0,100,0,3300,3300,0,0,1,0,0,0,0,0,0,23,0,0,0,0,0,0,0, 'Halazzi script - Say line'),
(@NPC_HALAZZI*100,9,1,0,0,0,100,0,5200,5200,0,0,45,0,1,0,0,0,0,19,@NPC_NALORAKK,20,0,0,0,0,0, 'Halazzi script - Set data 0 1 Nalorakk'),
(@NPC_HALAZZI*100,9,2,0,0,0,100,0,5600,5600,0,0,45,0,1,0,0,0,0,19,@NPC_JANALAI,20,0,0,0,0,0, 'Halazzi script - Set data 0 1 Jana''lai'),
(@NPC_HALAZZI*100,9,3,0,0,0,100,0,7700,7700,0,0,45,0,1,0,0,0,0,19,@NPC_AKILZON,20,0,0,0,0,0, 'Halazzi script - Set data 0 1 Akil''zon'),
(@NPC_HALAZZI*100,9,4,0,0,0,100,0,8300,8300,0,0,45,0,2,0,0,0,0,19,@NPC_JANALAI,20,0,0,0,0,0, 'Halazzi script - Set data 0 2 Jana''lai'),
(@NPC_HALAZZI*100,9,5,0,0,0,100,0,800,800,0,0,11,42466,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Halazzi script - Spellcast Spirit Visual'),
(@NPC_HALAZZI*100,9,6,0,0,0,100,0,0,0,0,0,45,0,2,0,0,0,0,19,@NPC_AKILZON,20,0,0,0,0,0, 'Halazzi script - Set data 0 2 Akil''zon'),
(@NPC_HALAZZI*100,9,7,0,0,0,100,0,0,0,0,0,45,0,2,0,0,0,0,19,@NPC_NALORAKK,20,0,0,0,0,0, 'Halazzi script - Set data 0 2 Nalorakk'),
(@NPC_HALAZZI*100,9,8,0,0,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Halazzi script - Despawn');
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 202441 AND 202460;
INSERT INTO `creature_addon`(`guid`,`path_id`,`bytes1`) VALUES 
(202441,2024410,50331648),
(202442,2024410,50331648),
(202443,2024430,50331648),
(202444,2024430,50331648),
(202445,2024450,50331648),
(202446,2024410,50331648),
(202447,2024470,50331648),
(202448,2024450,50331648),
(202449,2024450,50331648),
(202450,2024450,50331648),
(202451,2024510,50331648),
(202452,2024520,50331648),
(202453,2024430,50331648),
(202454,2024430,50331648),
(202455,2024410,50331648),
(202456,2024450,50331648),
(202457,2024510,50331648),
(202458,2024510,50331648),
(202459,2024510,50331648),
(202460,2024430,50331648);

DELETE FROM `waypoint_data` WHERE `id` IN (2024410,2024430,2024450,2024470,2024520,2024510);
INSERT INTO `waypoint_data`(`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES 
(2024410,1,7210.96,-1046.89,1006.18),
(2024410,2,6998.46,-1076.85,1024.82),
(2024410,3,6874.25,-1097.38,927.736),
(2024410,4,6614.79,-875.755,812.765),
(2024410,5,6563.27,-811.767,749.876),
(2024410,6,6299.5,-797.577,529.126),
(2024410,7,6194.55,-1013.14,501.542),
(2024410,8,6319.25,-1251.66,468.626),
(2024410,9,6309.16,-1537.86,615.042),
(2024410,10,6748.21,-1664.31,919.312),
(2024410,11,6913.31,-1725.26,954.792),
(2024410,12,7167.58,-1501.69,962.569),
(2024410,13,7440.4,-1295.86,997.291),
(2024410,14,7024.75,-1625.54,957.369),
(2024410,15,7025.49,-1624.87,957.369),
(2024410,16,7167.58,-1501.69,962.569),
(2024410,17,7440.4,-1295.86,997.291),
(2024430,1,7440.4,-1295.86,997.291),
(2024430,2,7210.96,-1046.89,1006.18),
(2024430,3,6998.46,-1076.85,1024.82),
(2024430,4,6874.25,-1097.38,927.736),
(2024430,5,6614.79,-875.755,812.765),
(2024430,6,6563.27,-811.767,749.876),
(2024430,7,6299.5,-797.577,529.126),
(2024430,8,6194.55,-1013.14,501.542),
(2024430,9,6319.25,-1251.66,468.626),
(2024430,10,6309.16,-1537.86,615.042),
(2024430,11,6748.21,-1664.31,919.312),
(2024430,12,6913.31,-1725.26,954.792),
(2024430,13,7167.58,-1501.69,962.569),
(2024430,14,7440.4,-1295.86,997.291),
(2024430,15,7024.75,-1625.54,957.369),
(2024430,16,7025.49,-1624.87,957.369),
(2024430,17,7167.58,-1501.69,962.569),
(2024450,1,6563.27,-811.767,749.876),
(2024450,2,6299.5,-797.577,529.126),
(2024450,3,6194.55,-1013.14,501.542),
(2024450,4,6319.25,-1251.66,468.626),
(2024450,5,6309.16,-1537.86,615.042),
(2024450,6,6748.21,-1664.31,919.312),
(2024450,7,6913.31,-1725.26,954.792),
(2024450,8,7167.58,-1501.69,962.569),
(2024450,9,7440.4,-1295.86,997.291),
(2024450,10,7024.75,-1625.54,957.369),
(2024450,11,7025.49,-1624.87,957.369),
(2024450,12,7167.58,-1501.69,962.569),
(2024450,13,7440.4,-1295.86,997.291),
(2024450,14,7210.96,-1046.89,1006.18),
(2024450,15,6998.46,-1076.85,1024.82),
(2024450,16,6874.25,-1097.38,927.736),
(2024450,17,6614.79,-875.755,812.765),
(2024470,1,6614.79,-875.755,812.765),
(2024470,2,6563.27,-811.767,749.876),
(2024470,3,6299.5,-797.577,529.126),
(2024470,4,6194.55,-1013.14,501.542),
(2024470,5,6319.25,-1251.66,468.626),
(2024470,6,6309.16,-1537.86,615.042),
(2024470,7,6748.21,-1664.31,919.312),
(2024470,8,6913.31,-1725.26,954.792),
(2024470,9,7167.58,-1501.69,962.569),
(2024470,10,7440.4,-1295.86,997.291),
(2024470,11,7024.75,-1625.54,957.369),
(2024470,12,7025.49,-1624.87,957.369),
(2024470,13,7167.58,-1501.69,962.569),
(2024470,14,7440.4,-1295.86,997.291),
(2024470,15,7210.96,-1046.89,1006.18),
(2024470,16,6998.46,-1076.85,1024.82),
(2024470,17,6874.25,-1097.38,927.736),
(2024510,1,6913.31,-1725.26,954.792),
(2024510,2,7167.58,-1501.69,962.569),
(2024510,3,7440.4,-1295.86,997.291),
(2024510,4,7024.75,-1625.54,957.369),
(2024510,5,7025.49,-1624.87,957.369),
(2024510,6,7167.58,-1501.69,962.569),
(2024510,7,7440.4,-1295.86,997.291),
(2024510,8,7210.96,-1046.89,1006.18),
(2024510,9,6998.46,-1076.85,1024.82),
(2024510,10,6874.25,-1097.38,927.736),
(2024510,11,6614.79,-875.755,812.765),
(2024510,12,6563.27,-811.767,749.876),
(2024510,13,6299.5,-797.577,529.126),
(2024510,14,6194.55,-1013.14,501.542),
(2024510,15,6319.25,-1251.66,468.626),
(2024510,16,6309.16,-1537.86,615.042),
(2024510,17,6748.21,-1664.31,919.312),
(2024520,1,7167.58,-1501.69,962.569),
(2024520,2,7440.4,-1295.86,997.291),
(2024520,3,7210.96,-1046.89,1006.18),
(2024520,4,6998.46,-1076.85,1024.82),
(2024520,5,6874.25,-1097.38,927.736),
(2024520,6,6614.79,-875.755,812.765),
(2024520,7,6563.27,-811.767,749.876),
(2024520,8,6299.5,-797.577,529.126),
(2024520,9,6194.55,-1013.14,501.542),
(2024520,10,6319.25,-1251.66,468.626),
(2024520,11,6309.16,-1537.86,615.042),
(2024520,12,6748.21,-1664.31,919.312),
(2024520,13,6913.31,-1725.26,954.792),
(2024520,14,7167.58,-1501.69,962.569),
(2024520,15,7440.4,-1295.86,997.291),
(2024520,16,7024.75,-1625.54,957.369),
(2024520,17,7025.49,-1624.87,957.369);
DELETE FROM `spell_script_names` WHERE `spell_id`=45759;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(45759,'spell_gen_orc_disguise');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=45742;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,45742,0,0,1,0,45760,0,0,0,0,'','Spell Plant Warsong Banner can be casted only if player has aura Warsong Orc Disguise (Male)'),
(17,0,45742,0,0,31,1,3,25430,0,0,0,'','Spell Plant Warsong Banner can be casted only on Magmothregar'),
(17,0,45742,0,0,36,1,0,0,0,1,0,'','Spell Plant Warsong Banner can be casted only if target is dead'),
(17,0,45742,0,1,1,0,45762,0,0,0,0,'','Spell Plant Warsong Banner can be casted only if player has aura Warsong Orc Disguise (Female)'),
(17,0,45742,0,1,31,1,3,25430,0,0,0,'','Spell Plant Warsong Banner can be casted only on Magmothregar'),
(17,0,45742,0,1,36,1,0,0,0,1,0,'','Spell Plant Warsong Banner can be casted only if target is dead');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=25430;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=25430;
DELETE FROM `smart_scripts` WHERE `entryorguid`=25430 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(25430,0,0,0,4,0,100,0,0,0,0,0,11,50413,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Magmothregar - On aggro - Spellcast Magnataur Charge'),
(25430,0,1,0,0,0,100,0,3500,12800,10100,14000,11,50822,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Magmothregar - On update IC - Spellcast Fervor'),
(25430,0,2,0,8,0,100,0,45742,0,0,0,11,45744,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Magmothregar - On spellhit Plant Warsong Banner - Spellcast It Was The Orcs, Honest!: Plant Banner Kill Credit');
DELETE FROM `smart_scripts` WHERE `entryorguid`=19456 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`id`,`link`,`event_type`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`target_type`,`comment`) VALUES 
(19456,0,0,54,0,0,0,0,0,42,0,25,1,'Whitebarks Spirit - On summon - Set invincibility HP at 25%'),
(19456,1,0,4,1,0,0,0,0,1,0,0,1,'Whitebarks Spirit - On aggro (not repeatable) - Say 0'),
(19456,2,3,2,0,24,26,120000,120000,102,0,0,1,'Whitebarks Spirit - 24-26% HP - Disable HP reg (video)'),
(19456,3,4,61,0,0,0,0,0,101,0,0,1,'Whitebarks Spirit - Linked - Set home position'),
(19456,4,5,61,0,0,0,0,0,2,35,0,1,'Whitebarks Spirit - Linked - Change faction to friendly'),
(19456,5,6,61,0,0,0,0,0,1,1,0,1,'Whitebarks Spirit - Linked - Say 1'),
(19456,6,0,61,0,0,0,0,0,24,0,0,1,'Whitebarks Spirit - Linked - evade'),
(19456,7,0,0,0,2500,5500,12000,14500,11,31287,0,2,'Whitebarks Spirit - IC - Casts Entangling Roots'),
(19456,8,0,0,0,7500,7500,9500,16000,11,11442,0,2,'Whitebarks Spirit - IC - Casts Withered Touch'),
(19456,9,0,1,0,60000,60000,60000,60000,41,0,0,1,'Whitebarks Spirit - After 60sec OOC - Despawn');
SET @OGUID := 1160;

DELETE FROM `gameobject` WHERE `guid`=@OGUID;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID, 202275, 530, 1, 1, -2186.307, -12341.81, 56.27893, 0, 0, 0, 0, 1, 120, 255, 1); -- Wrathscale Fountain
SET @CGUID := 40471;

DELETE FROM `creature` WHERE `guid`=@CGUID;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID, 23143, 530, 1, 1, -5142.569, 581.3281, 84.13567, 0.5061455, 120, 0, 0); -- Horus (Area: Netherwing Ledge)
UPDATE `command` SET `help`='Syntax: .gobject info [$object_entry]\r \r Query Gameobject information for selected gameobject or given entry.' WHERE `name`='gobject info';
-- Add Trinity String for Spirit Guide and wintergrasp battle mage
DELETE FROM `trinity_string` WHERE `entry` IN (20071,20072,20074,20073,20070,20075,20076,20077);
INSERT INTO `trinity_string`(`entry`,`content_default`) VALUES 
(20071, 'Guide me to the Sunken Ring Graveyard.'),
(20072, 'Guide me to the Broken Temple Graveyard.'),
(20074, 'Guide me to the Eastspark Graveyard.'),
(20073, 'Guide me to the Westspark Graveyard.'),
(20070, 'Guide me to the Fortress Graveyard.'),
(20075, 'Guide me back to the Horde landing camp.'),
(20076, 'Guide me back to the Alliance landing camp.'),
(20077, 'Queue for Wintergrasp.');
SET @HO_SOOSAY := 28027;
SET @HO_GOSSIP := 9742;
SET @O_STATE   := 50503;
SET @T_STORM   := 53071;
SET @FI_LAFOO  := 52547;
SET @FI_JALOOT := 52548;
SET @FI_MOODLE := 52549;
SET @SEEINVIS  := 52214;
SET @RAINSPEAKERAURA := 51639;
SET @TREASUREPING:= 51420;
SET @GORLOCPING  := 51794;
SET @WOLVARPING  := 51791;
SET @DIGUPGLINTINGBUG:= 51443;
SET @DIGUPSPARKINGHARE   := 51441;
SET @DIGUPSHININGCRYSTAL := 51397;
SET @DIGUPGLINTINGARMOR  := 51398;
SET @DIGUPGLOWINGGEM := 51400;
SET @DIGUPPOLISHEDPLATTER  := 51401;
SET @DIGUPSPARKINGTREASURE := 51402;
SET @BLESSINGOFTHESPARKINGHARE := 51442;
SET @JALOOTSINTENSITY := 52119;
SET @RAINSPEAKERBUNNY := 28455;
SET @LAFOO := 28120;
SET @MOODLE := 28122;
SET @JALOOT := 28121;
SET @GLINTINGDIRT := 28362;
SET @GLINTINGBUG := 28372;
SET @SPARKLINGHARE := 28371;
SET @GLINTINGDIRTSCRIPT := 2836201;
SET @GORLOCTREASURESCRIPT := 2812000;
SET @ELDER_HARKEK := 28138;
SET @SHAMAN_RAKJAK := 28082;
SET @EH_GOSSIP:= 9741;
SET @FRENZYAURA := 51234;
SET @FRENZYBUNNY := 28299;
SET @GOREGEK := 28214;
SET @DAJIK := 28215;
SET @ZEPIK := 28216;
SET @FI_GOREGEK := 52542;
SET @FI_DAJIK := 52544;
SET @FI_ZEPIK := 52545;
SET @CHICKENSEEINVIS := 50735;
SET @DESSAWNRETAINER := 53163;
SET @MOSSWALKERAURA := 51644;
SET @MOSSWALKERBUNNY := 28459;
SET @ANGRYGORLOCCREDIT := 54057;
SET @MISTWHISPERAURA := 51239;
SET @MISTWHISPERBUNNY := 28300;
SET @SPEARBORNAURA := 51642;
SET @SPEARBORNBUNNY := 28457;
SET @KARTAKHOLDAURA := 51643;
SET @KARTAKHOLDBUNNY := 28458;
SET @SPARKTOUCHEDAURA := 51641;
SET @SPARKTOUCHEDBUNNY := 28456;
SET @SAPPHIREHIVEAURA := 51651;
SET @LIFEBLOODPILLARBUNNY := 28460;
SET @LIFEBLOODPILLARAURA:= 51649;
SET @SKYREACHPILLARBUNNY := 28454;
SET @SKYREACHPILLARAURA:= 51645;
SET @SAPPHIREHIVEBUNNY := 28462;
SET @GORLOCLOCATIONPERIODIC := 51793;
SET @WOLVARLOCATIONPERIODIC := 51792;
SET @LOOKINGFORTREASUREAURA := 51407;
SET @SHOLAZARGUARDIANHEARTBEAT := 51623;
SET @DIGGINGFORTEASURE := 51405;
SET @GOREGEKSSHACKLE := 38619;
SET @DAJIKSCHALK := 38621;
SET @ZEPIKSHUNTINGHORN := 38512;
SET @LAFOOSBUGBAG := 38622;
SET @JALOOTSCRYSTAL := 38623;
SET @MOODLESSTRESSBALL := 38624;
SET @INVISIBILTY := 52213;
SET @HARDKNUCKLE := 28096;
SET @HARDKNUCKLEMATRIARCH := 28213;
SET @SAPPHIREQUEEN := 28087;
SET @VENOMTIP := 28358;

UPDATE `creature_template` SET `minlevel`=77, `maxlevel`=77, `exp`=2,`mindmg`=371, `maxdmg`=522,`attackpower`=478 WHERE  `entry`IN (@GOREGEK,@DAJIK,@ZEPIK);
UPDATE `creature_template` SET `unit_flags` =33555200 WHERE `entry`IN (@MOSSWALKERBUNNY,@MISTWHISPERBUNNY,@SPEARBORNBUNNY,@KARTAKHOLDBUNNY,@SPARKTOUCHEDBUNNY,@SAPPHIREHIVEBUNNY,@LIFEBLOODPILLARBUNNY,@SKYREACHPILLARBUNNY);
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry` IN(@HO_SOOSAY,@ELDER_HARKEK,@SHAMAN_RAKJAK);
DELETE FROM `creature_ai_scripts` WHERE `creature_id`IN(@HO_SOOSAY,@ELDER_HARKEK,@SHAMAN_RAKJAK);;
DELETE FROM `smart_scripts` WHERE `entryorguid`IN(@HO_SOOSAY,@ELDER_HARKEK,@SHAMAN_RAKJAK);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@HO_SOOSAY, 0, 0, 0, 1, 0, 100, 0, 0, 0, 0, 0, 75, @O_STATE, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'High-Oracle Soo-say - Out of combat - Add Oracle State Aura'),
(@HO_SOOSAY, 0, 1, 0, 0, 0, 100, 0, 5000, 10000, 12000, 16000, 11, @T_STORM, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'High-Oracle Soo-say - In Combat - Cast Thunderstorm'),
(@HO_SOOSAY,0,2,8,62,0,100,0,@HO_GOSSIP,0,0,0,85,@FI_LAFOO,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Oracle Soo-say - On gossip select - Spellcast Forceitem Lafoo'),
(@HO_SOOSAY,0,3,8,62,0,100,0,@HO_GOSSIP,1,0,0,85,@FI_LAFOO,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Oracle Soo-say - On gossip select - Spellcast Forceitem Lafoo'),
(@HO_SOOSAY,0,4,8,62,0,100,0,@HO_GOSSIP,2,0,0,85,@FI_JALOOT,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Oracle Soo-say - On gossip select - Spellcast Forceitem Jaloot'),
(@HO_SOOSAY,0,5,8,62,0,100,0,@HO_GOSSIP,3,0,0,85,@FI_JALOOT,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Oracle Soo-say - On gossip select - Spellcast Forceitem Jaloot'),
(@HO_SOOSAY,0,6,8,62,0,100,0,@HO_GOSSIP,4,0,0,85,@FI_MOODLE,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Oracle Soo-say - On gossip select - Spellcast Forceitem Moodle'),
(@HO_SOOSAY,0,7,8,62,0,100,0,@HO_GOSSIP,5,0,0,85,@FI_MOODLE,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Oracle Soo-say - On gossip select - Spellcast Forceitem Moodle'),
(@HO_SOOSAY,0,8,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Oracle Soo-say - On gossip select - Close gossip'),
(@HO_SOOSAY,0,9, 0, 20, 0, 100, 0, 12704, 0, 0, 0, 28, @SEEINVIS, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'High-Oracle Soo-say - On Quest Complete - Remove Aura Rainspeaker Treasures: See Invisibility'),
(@HO_SOOSAY,0,10, 0, 19, 0, 100, 0, 12704, 0, 0, 0, 85, @SEEINVIS, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'High-Oracle Soo-say - On Quest Accept - Invoker Cast Rainspeaker Treasures: See Invisibility'),
(@HO_SOOSAY, 0, 11, 0, 20, 0, 100, 0, 12572, 0, 0, 0, 28, @SEEINVIS, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'High-Oracle Soo-say - On Quest Complete - Remove Aura Rainspeaker Treasures: See Invisibility'),
(@HO_SOOSAY, 0, 12, 0, 19, 0, 100, 0, 12574, 0, 0, 0, 57, @LAFOOSBUGBAG, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'High-Oracle Soo-say - On Quest Accept - Remove Lafoos Bug bag'),
(@HO_SOOSAY, 0, 13, 0, 20, 0, 100, 0, 12577, 0, 0, 0, 57, @JALOOTSCRYSTAL, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'High-Oracle Soo-say - On Quest Complete - Remove Jaloots favourite crystal'),
(@HO_SOOSAY, 0, 14, 0, 20, 0, 100, 0, 12581, 0, 0, 0, 57, @MOODLESSTRESSBALL, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'High-Oracle Soo-say - On Quest Complete - Remove Moodles Stress Ball'),
-- 
(@SHAMAN_RAKJAK,0,0,0,19,0,100,0,12529,0,0,0,11,@FI_GOREGEK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Shaman Rakjak - On quest accept - Spellcast Forceitem Goregek'),
(@SHAMAN_RAKJAK,0,1,0,19,0,100,0,12530,0,0,0,11,@FI_GOREGEK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Shaman Rakjak - On quest accept - Spellcast Forceitem Goregek'),
(@SHAMAN_RAKJAK,0,2,0,19,0,100,0,12533,0,0,0,11,@FI_DAJIK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Shaman Rakjak - On quest accept - Spellcast Forceitem Dajik'),
(@SHAMAN_RAKJAK,0,3,0,19,0,100,0,12534,0,0,0,11,@FI_DAJIK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Shaman Rakjak - On quest accept - Spellcast Forceitem Dajik'),
(@SHAMAN_RAKJAK,0,4,0,19,0,100,0,12536,0,0,0,11,@FI_ZEPIK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Shaman Rakjak - On quest accept - Spellcast Forceitem Zepik'),
(@SHAMAN_RAKJAK, 0, 15, 0, 19, 0, 100, 0, 12533, 0, 0, 0, 57, @GOREGEKSSHACKLE, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'High-Shaman Rakjak - On Quest Accept - Remove Goregeks Shackes'),
(@SHAMAN_RAKJAK, 0, 16, 0, 19, 0, 100, 0, 12536, 0, 0, 0, 57, @DAJIKSCHALK, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'High-Shaman Rakjak - On Quest Accept - Remove Dajiks Chalk'),
(@SHAMAN_RAKJAK, 0, 17, 0, 19, 0, 100, 0, 12540, 0, 0, 0, 57, @ZEPIKSHUNTINGHORN, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'High-Shaman Rakjak - On Quest Accept - Remove Zepiks Hunting Horn'),
-- 
(@ELDER_HARKEK,0,4,10,62,0,100,0,@EH_GOSSIP,0,0,0,85,@FI_GOREGEK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Elder Harkek - On gossip select - Spellcast Forceitem Goregek'),
(@ELDER_HARKEK,0,5,10,62,0,100,0,@EH_GOSSIP,1,0,0,85,@FI_GOREGEK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Elder Harkek - On gossip select - Spellcast Forceitem Goregek'),
(@ELDER_HARKEK,0,6,10,62,0,100,0,@EH_GOSSIP,2,0,0,85,@FI_DAJIK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Elder Harkek - On gossip select - Spellcast Forceitem Dajik'),
(@ELDER_HARKEK,0,7,10,62,0,100,0,@EH_GOSSIP,3,0,0,85,@FI_DAJIK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Elder Harkek - On gossip select - Spellcast Forceitem Dajik'),
(@ELDER_HARKEK,0,8,10,62,0,100,0,@EH_GOSSIP,4,0,0,85,@FI_ZEPIK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Elder Harkek - On gossip select - Spellcast Forceitem Zepik'),
(@ELDER_HARKEK,0,9,10,62,0,100,0,@EH_GOSSIP,5,0,0,85,@FI_ZEPIK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Elder Harkek - On gossip select - Spellcast Forceitem Zepik'),
(@ELDER_HARKEK,0,10,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Elder Harkek - On gossip select - Close gossip'),
(@ELDER_HARKEK, 0, 3, 0, 20, 0, 100, 0, 12702, 0, 0, 0, 28, @CHICKENSEEINVIS, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Elder Harkek - On Quest Complete - Remove Aura Frenzyheart Chicken: See Invisibility'),
(@ELDER_HARKEK, 0, 2, 0, 20, 0, 100, 0, 12532, 0, 0, 0, 28, @CHICKENSEEINVIS, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Elder Harkek - On Quest Complete - Remove Aura Frenzyheart Chicken: See Invisibility'),
(@ELDER_HARKEK, 0, 1, 0, 19, 0, 100, 0, 12702, 0, 0, 0, 85, @CHICKENSEEINVIS, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Elder Harkek - On Quest Accept - Invoker Cast Frenzyheart Chicken: See Invisibility'),
(@ELDER_HARKEK, 0, 0, 0, 19, 0, 100, 0, 12532, 0, 0, 0, 85, @CHICKENSEEINVIS, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Elder Harkek - On Quest Accept - Invoker Cast Frenzyheart Chicken: See Invisibility'),
(@ELDER_HARKEK, 0, 11, 0, 19, 0, 100, 0, 12534, 0, 0, 0, 57, @GOREGEKSSHACKLE, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Elder Harkek - On Quest Accept - Remove Goregeks Shackes');
-- 
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN(@HO_GOSSIP,@EH_GOSSIP) AND `id` IN(0,1,2,3,4,5);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@HO_GOSSIP,0,0, 'I need to find Lafoo, do you have his bug bag?',1,1,0,0,0,0, ''),
(@HO_GOSSIP,1,0, 'I need to find Lafoo, do you have his bug bag?',1,1,0,0,0,0, ''),
(@HO_GOSSIP,2,0, 'I need to find Jaloot, do you have his favorite crystal?',1,1,0,0,0,0, ''),
(@HO_GOSSIP,3,0, 'I need to find Jaloot, do you have his favorite crystal?',1,1,0,0,0,0, ''),
(@HO_GOSSIP,4,0, 'I need to find Moodle, do you have his stress ball?',1,1,0,0,0,0, ''),
(@HO_GOSSIP,5,0, 'I need to find Moodle, do you have his stress ball?',1,1,0,0,0,0, ''),
(@EH_GOSSIP,0,0, 'I need to find Goregek, do you have his shackles?',1,1,0,0,0,0, ''),
(@EH_GOSSIP,1,0, 'I need to find Goregek, do you have his shackles?',1,1,0,0,0,0, ''),
(@EH_GOSSIP,2,0, 'I need to find Dajik, do you have his chalk?',1,1,0,0,0,0, ''),
(@EH_GOSSIP,3,0, 'I need to find Dajik, do you have his chalk?',1,1,0,0,0,0, ''),
(@EH_GOSSIP,4,0, 'I need to find Zepik, do you have his hunting horn?',1,1,0,0,0,0, ''),
(@EH_GOSSIP,5,0, 'I need to find Zepik, do you have his hunting horn?',1,1,0,0,0,0, '');
-- 
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`IN(@HO_GOSSIP,@EH_GOSSIP);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@HO_GOSSIP,0,0,0,2,0,@LAFOOSBUGBAG,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Lafoo''s Bug Bag'),
(15,@HO_GOSSIP,0,0,0,9,0,12571,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Taken Quest Make the Bad Snake go away'),
(15,@HO_GOSSIP,0,0,2,2,0,@LAFOOSBUGBAG,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Lafoo''s Bug Bag'),
(15,@HO_GOSSIP,0,0,2,8,0,12571,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Rewarded Quest Make the Bad Snake go away'),
(15,@HO_GOSSIP,0,0,1,2,0,@LAFOOSBUGBAG,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Lafoo''s Bug Bag'),
(15,@HO_GOSSIP,0,0,1,28,0,12571,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has completed Quest Make the Bad Snake go away'),
(15,@HO_GOSSIP,0,0,0,8,0,12573,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Quest Making Peace'),
(15,@HO_GOSSIP,0,0,1,8,0,12573,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Quest Making Peace'),
(15,@HO_GOSSIP,0,0,2,8,0,12573,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Quest Making Peace'),
(15,@HO_GOSSIP,1,0,0,8,0,12695,0,0,0,0,0, '', 'High-Oracle Soo-say - Show gossip option only if player has rewarded quest Return of the Friendly Dryskin'),
(15,@HO_GOSSIP,1,0,0,5,0,1105,224,0,0,0,0, '', 'High-Oracle Soo-say - Show gossip option only if player is at least honored with The Oracles'),
(15,@HO_GOSSIP,1,0,0,2,0,@LAFOOSBUGBAG,1,0,1,0,0, '', 'High-Oracle Soo-say - Show gossip option only if player has no item Lafoo''s Bug Bag'),
(15,@HO_GOSSIP,4,0,0,2,0,@MOODLESSTRESSBALL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Moodle''s Stress Ball'),
(15,@HO_GOSSIP,4,0,0,9,0,12578,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Taken Quest The Angry Gorloc'),
(15,@HO_GOSSIP,4,0,2,2,0,@MOODLESSTRESSBALL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Moodle''s Stress Ball'),
(15,@HO_GOSSIP,4,0,2,8,0,12578,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Rewarded Quest The Angry Gorloc'),
(15,@HO_GOSSIP,4,0,1,2,0,@MOODLESSTRESSBALL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Moodle''s Stress Ball'),
(15,@HO_GOSSIP,4,0,1,28,0,12578,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Completed Quest The Angry Gorloc'),
(15,@HO_GOSSIP,4,0,0,8,0,12579,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Quest Lifeblood of the Mosswalker Shrine'),
(15,@HO_GOSSIP,4,0,1,8,0,12579,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Quest Lifeblood of the Mosswalker Shrine'),
(15,@HO_GOSSIP,4,0,2,8,0,12579,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Quest Lifeblood of the Mosswalker Shrine'),
(15,@HO_GOSSIP,4,0,3,2,0,@MOODLESSTRESSBALL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Moodle''s Stress Ball'),
(15,@HO_GOSSIP,4,0,3,9,0,12578,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Taken Quest The Angry Gorloc'),
(15,@HO_GOSSIP,4,0,5,2,0,@MOODLESSTRESSBALL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Moodle''s Stress Ball'),
(15,@HO_GOSSIP,4,0,5,8,0,12578,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Rewarded Quest The Angry Gorloc'),
(15,@HO_GOSSIP,4,0,4,2,0,@MOODLESSTRESSBALL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Moodle''s Stress Ball'),
(15,@HO_GOSSIP,4,0,4,28,0,12578,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Completed Quest The Angry Gorloc'),
(15,@HO_GOSSIP,4,0,3,8,0,12580,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Quest The Mosswalker Savior'),
(15,@HO_GOSSIP,4,0,4,8,0,12580,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Quest The Mosswalker Savior'),
(15,@HO_GOSSIP,4,0,5,8,0,12580,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Quest The Mosswalker Savior'),
(15,@HO_GOSSIP,5,0,0,8,0,12695,0,0,0,0,0, '', 'High-Oracle Soo-say - Show gossip option only if player has rewarded quest Return of the Friendly Dryskin'),
(15,@HO_GOSSIP,5,0,0,5,0,1105,224,0,0,0,0, '', 'High-Oracle Soo-say - Show gossip option only if player is at least honored with The Oracles'),
(15,@HO_GOSSIP,5,0,0,2,0,@JALOOTSCRYSTAL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show gossip option only if player has no item Jaloot''s Favorite Crystal'),
(15,@HO_GOSSIP,2,0,0,2,0,@JALOOTSCRYSTAL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Jaloot''s Favourite Crystal'),
(15,@HO_GOSSIP,2,0,0,9,0,12574,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Taken Quest Back so soon?'),
(15,@HO_GOSSIP,2,0,2,2,0,@JALOOTSCRYSTAL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Jaloot''s Favourite Crystal'),
(15,@HO_GOSSIP,2,0,2,8,0,12574,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Rewarded Back so soon?'),
(15,@HO_GOSSIP,2,0,1,2,0,@JALOOTSCRYSTAL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Jaloot''s Favourite Crystal'),
(15,@HO_GOSSIP,2,0,1,28,0,12574,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Completed Back so soon?'),
(15,@HO_GOSSIP,2,0,0,8,0,12577,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Home Time'),
(15,@HO_GOSSIP,2,0,1,8,0,12577,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Home Time'),
(15,@HO_GOSSIP,2,0,2,8,0,12577,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Home Time'),
(15,@HO_GOSSIP,3,0,0,8,0,12695,0,0,0,0,0, '', 'High-Oracle Soo-say - Show gossip option only if player has rewarded quest Return of the Friendly Dryskin'),
(15,@HO_GOSSIP,3,0,0,5,0,1105,224,0,0,0,0, '', 'High-Oracle Soo-say - Show gossip option only if player is at least honored with The Oracles'),
(15,@HO_GOSSIP,3,0,0,2,0,@MOODLESSTRESSBALL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show gossip option only if player has no item Moodle''s Stress Ball'),
(15,@EH_GOSSIP,0,0,0,2,0,@GOREGEKSSHACKLE,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Gorekeks Shackles'),
(15,@EH_GOSSIP,0,0,0,9,0,12529,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has Taken Quest The Ape Hunters Slave'),
(15,@EH_GOSSIP,0,0,2,2,0,@GOREGEKSSHACKLE,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Gorekeks Shackles'),
(15,@EH_GOSSIP,0,0,2,8,0,12529,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has Rewarded Quest The Ape Hunters Slave'),
(15,@EH_GOSSIP,0,0,1,2,0,@GOREGEKSSHACKLE,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Gorekeks Shackles'),
(15,@EH_GOSSIP,0,0,1,28,0,12529,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has completed Quest The Ape Hunters Slave'),
(15,@EH_GOSSIP,0,0,3,2,0,@GOREGEKSSHACKLE,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Gorekeks Shackles'),
(15,@EH_GOSSIP,0,0,3,9,0,12530,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has Taken Quest Tormenting the Softknuckles'),
(15,@EH_GOSSIP,0,0,4,2,0,@GOREGEKSSHACKLE,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Gorekeks Shackles'),
(15,@EH_GOSSIP,0,0,4,8,0,12530,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has Rewarded Quest Tormenting the Softknuckles'),
(15,@EH_GOSSIP,0,0,5,2,0,@GOREGEKSSHACKLE,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Gorekeks Shackles'),
(15,@EH_GOSSIP,0,0,5,28,0,12530,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has completed Quest Tormenting the Softknuckles'),
(15,@EH_GOSSIP,0,0,0,14,0,12533,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Wasp Hunters Apprentice'),
(15,@EH_GOSSIP,0,0,1,14,0,12533,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Wasp Hunters Apprentice'),
(15,@EH_GOSSIP,0,0,2,14,0,12533,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Wasp Hunters Apprentice'),
(15,@EH_GOSSIP,0,0,3,14,0,12533,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Wasp Hunters Apprentice'),
(15,@EH_GOSSIP,0,0,4,14,0,12533,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Wasp Hunters Apprentice'),
(15,@EH_GOSSIP,0,0,5,14,0,12533,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Wasp Hunters Apprentice'),
(15,@EH_GOSSIP,0,0,0,14,0,12534,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Underground Menace '),
(15,@EH_GOSSIP,0,0,1,14,0,12534,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Underground Menace '),
(15,@EH_GOSSIP,0,0,2,14,0,12534,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Underground Menace '),
(15,@EH_GOSSIP,0,0,3,14,0,12534,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Underground Menace '),
(15,@EH_GOSSIP,0,0,4,14,0,12534,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Underground Menace '),
(15,@EH_GOSSIP,0,0,5,14,0,12534,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Underground Menace '),
(15,@EH_GOSSIP,2,0,0,2,0,@DAJIKSCHALK,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Dajiks Worn Chalk'),
(15,@EH_GOSSIP,2,0,0,9,0,12533,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has Taken Quest The Wasp Hunters Apprentice'),
(15,@EH_GOSSIP,2,0,2,2,0,@DAJIKSCHALK,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Dajiks Worn Chalk'),
(15,@EH_GOSSIP,2,0,2,8,0,12533,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has Rewarded Quest The Wasp Hunters Apprentice'),
(15,@EH_GOSSIP,2,0,1,2,0,@DAJIKSCHALK,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Dajiks Worn Chalk'),
(15,@EH_GOSSIP,2,0,1,28,0,12533,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has completed Quest The Wasp Hunters Apprentice'),
(15,@EH_GOSSIP,2,0,3,2,0,@DAJIKSCHALK,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Dajiks Worn Chalk'),
(15,@EH_GOSSIP,2,0,3,9,0,12534,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has Taken Quest The Underground Menace'),
(15,@EH_GOSSIP,2,0,4,2,0,@DAJIKSCHALK,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Dajiks Worn Chalk'),
(15,@EH_GOSSIP,2,0,4,8,0,12534,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has Rewarded Quest The Underground Menace'),
(15,@EH_GOSSIP,2,0,5,2,0,@DAJIKSCHALK,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Dajiks Worn Chalk'),
(15,@EH_GOSSIP,2,0,5,28,0,12534,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has completed Quest The Underground Menace'),
(15,@EH_GOSSIP,2,0,0,14,0,12536,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest A Rough Ride'),
(15,@EH_GOSSIP,2,0,1,14,0,12536,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest A Rough Ride'),
(15,@EH_GOSSIP,2,0,2,14,0,12536,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest A Rough Ride'),
(15,@EH_GOSSIP,2,0,3,14,0,12536,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest A Rough Ride'),
(15,@EH_GOSSIP,2,0,4,14,0,12536,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest A Rough Ride'),
(15,@EH_GOSSIP,2,0,5,14,0,12536,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest A Rough Ride'),
(15,@EH_GOSSIP,4,0,0,2,0,@ZEPIKSHUNTINGHORN,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Zepiks Hunting Horn'),
(15,@EH_GOSSIP,4,0,0,9,0,12536,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has Taken Quest A Rough Ride'),
(15,@EH_GOSSIP,4,0,2,2,0,@ZEPIKSHUNTINGHORN,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Zepiks Hunting Horn'),
(15,@EH_GOSSIP,4,0,2,8,0,12536,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has Rewarded Quest A Rough Ride'),
(15,@EH_GOSSIP,4,0,1,2,0,@ZEPIKSHUNTINGHORN,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Zepiks Hunting Horn'),
(15,@EH_GOSSIP,4,0,1,28,0,12536,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has completed Quest A Rough Ride'),
(15,@EH_GOSSIP,4,0,0,8,0,12539,0,0,1,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest Hoofing It'),
(15,@EH_GOSSIP,4,0,1,8,0,12539,0,0,1,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest Hoofing It'),
(15,@EH_GOSSIP,4,0,2,8,0,12539,0,0,1,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest Hoofing It');
-- 
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15, @EH_GOSSIP,1,0,8,12692,0,0,0,0, '', 'Elder Harkek - Show gossip option only if player has rewarded quest Return of the Lich Hunter'),
(15, @EH_GOSSIP,1,0,5,1104,224,0,0,0, '', 'Elder Harkek - Show gossip option only if player is at least honored with Frenzheart Tribe'),
(15, @EH_GOSSIP,1,0,2,@GOREGEKSSHACKLE,1,0,1,0, '', 'Elder Harkek - Show gossip option only if player has no item Goregek''s Shackles'),
(15, @EH_GOSSIP,3,0,8,12692,0,0,0,0, '', 'Elder Harkek - Show gossip option only if player has rewarded quest Return of the Lich Hunter'),
(15, @EH_GOSSIP,3,0,5,1104,224,0,0,0, '', 'Elder Harkek - Show gossip option only if player is at least honored with Frenzheart Tribe'),
(15, @EH_GOSSIP,3,0,2,@DAJIKSCHALK,1,0,1,0, '', 'Elder Harkek - Show gossip option only if player has no item Dajiks Worn Chalk'),
(15, @EH_GOSSIP,5,0,8,12692,0,0,0,0, '', 'Elder Harkek - Show gossip option only if player has rewarded quest Return of the Lich Hunter'),
(15, @EH_GOSSIP,5,0,5,1104,224,0,0,0, '', 'Elder Harkek - Show gossip option only if player is at least honored with Frenzheart Tribe'),
(15, @EH_GOSSIP,5,0,2,@ZEPIKSHUNTINGHORN,1,0,1,0, '', 'Elder Harkek - Show gossip option only if player has no item Zepiks Hunting Horn');
-- Jaloot's Itensity and Blessing of the Sparkling Hare don't stack
DELETE FROM `spell_group` WHERE `id`=@BLESSINGOFTHESPARKINGHARE;
INSERT INTO `spell_group` (`id`, `spell_id`) VALUES 
(@BLESSINGOFTHESPARKINGHARE, @BLESSINGOFTHESPARKINGHARE),
(@BLESSINGOFTHESPARKINGHARE, @JALOOTSINTENSITY);

DELETE FROM `spell_group_stack_rules` WHERE `group_id`=@BLESSINGOFTHESPARKINGHARE;
INSERT INTO `spell_group_stack_rules` (`group_id`,`stack_rule`) VALUES 
(@BLESSINGOFTHESPARKINGHARE,1);
DELETE FROM `creature_template_addon` WHERE `entry`IN(@GLINTINGDIRT,@LAFOO,@JALOOT,@MOODLE,@GLINTINGBUG,@GOREGEK,@DAJIK,@ZEPIK);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@GLINTINGBUG,0,0,0,1,0, '51444'),
(@GOREGEK,0,0,0,1,0, '54178'),
(@DAJIK,0,0,0,1,0, '52734'),
(@ZEPIK,0,0,0,1,0, '54176');
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=@SEEINVIS AND `spell_effect`=@LOOKINGFORTREASUREAURA;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES 
(@SEEINVIS,@LOOKINGFORTREASUREAURA,2, 'Looking for treasure aura triggered by Rainspeaker Treasures: See Invisibility');
DELETE FROM `spell_area` WHERE `spell` =@ANGRYGORLOCCREDIT;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE  `entry`=@GLINTINGDIRT;
DELETE FROM `smart_scripts` WHERE `entryorguid` =@GLINTINGDIRT;
DELETE FROM `smart_scripts` WHERE `entryorguid` BETWEEN @GLINTINGDIRTSCRIPT AND @GLINTINGDIRTSCRIPT+5;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GLINTINGDIRT,0,0 ,0,38, 0,100,1,1,1,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - On Data Set - Increment Phase'),
(@GLINTINGDIRT,0,1 ,0,1, 1,100,1,0,0,0,0,87,@GLINTINGDIRTSCRIPT,@GLINTINGDIRTSCRIPT+1,@GLINTINGDIRTSCRIPT+2,@GLINTINGDIRTSCRIPT+3,@GLINTINGDIRTSCRIPT+4,@GLINTINGDIRTSCRIPT+5,1,0,0,0,0,0,0,0, 'Glinting Dirt - OOC (Phase 2)  - Run Random Script'),
(@GLINTINGDIRT,0,2 ,0,1, 1,100,1,400,400,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - OOC (Phase 2)  - Despawn'),
(@GLINTINGDIRT,0,3 ,0,11, 0,100,0,0,0,0,0,11,@INVISIBILTY,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - On Spawn  - Cast Rainspeaker Treasures: Invisibility'),
(@GLINTINGDIRTSCRIPT,9,0 ,0,0, 0,100,0,5000,5000,0,0,11,@DIGUPSPARKINGHARE,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Cast Dig Up Sparking Hare'),
(@GLINTINGDIRTSCRIPT,9,1 ,0,0, 0,100,0,5500,5500,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Despawn'),
(@GLINTINGDIRTSCRIPT+1,9,0 ,0,0, 0,100,0,5000,5000,0,0,11,@DIGUPSHININGCRYSTAL,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Cast Dig Up Shining Crystal'),
(@GLINTINGDIRTSCRIPT+1,9,1 ,0,0, 0,100,0,5500,5500,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Despawn'),
(@GLINTINGDIRTSCRIPT+2,9,0 ,0,0, 0,100,0,5000,5000,0,0,11,@DIGUPGLINTINGARMOR,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Cast Dig Up Glinting Armor'),
(@GLINTINGDIRTSCRIPT+2,9,1 ,0,0, 0,100,0,5500,5500,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Despawn'),
(@GLINTINGDIRTSCRIPT+3,9,0 ,0,0, 0,100,0,5000,5000,0,0,11,@DIGUPGLOWINGGEM,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Cast Dig Up Glowing Gem'),
(@GLINTINGDIRTSCRIPT+3,9,1 ,0,0, 0,100,0,5500,5500,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Despawn'),
(@GLINTINGDIRTSCRIPT+4,9,0 ,0,0, 0,100,0,5000,5000,0,0,11,@DIGUPPOLISHEDPLATTER,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Cast Dig Up Polished Platter'),
(@GLINTINGDIRTSCRIPT+4,9,1 ,0,0, 0,100,0,5500,5500,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Despawn'),
(@GLINTINGDIRTSCRIPT+5,9,0 ,0,0, 0,100,0,5000,5000,0,0,11,@DIGUPSPARKINGTREASURE,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Cast Dig Up Sparking Treasure'),
(@GLINTINGDIRTSCRIPT+5,9,1 ,0,0, 0,100,0,5500,5500,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Despawn');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN(@RAINSPEAKERBUNNY,@FRENZYBUNNY,@MOSSWALKERBUNNY,@MISTWHISPERBUNNY,@SPEARBORNBUNNY,@KARTAKHOLDBUNNY,@SPARKTOUCHEDBUNNY,@SAPPHIREHIVEBUNNY,@LIFEBLOODPILLARBUNNY,@SKYREACHPILLARBUNNY);
UPDATE `creature_template` SET `AIName`= 'SmartAI',`unit_flags`=32776,`InhabitType`=3 WHERE  `entry`In(@LAFOO,@MOODLE,@JALOOT,@GOREGEK,@DAJIK,@ZEPIK);
UPDATE `creature_template` SET `gossip_menu_id`=9747, `npcflag`=`npcflag`|1, `speed_run`=1.30952 WHERE `entry`=@JALOOT;
UPDATE `creature_template` SET `npcflag`=`npcflag`|1, `speed_run`=1.19048 WHERE `entry`=@MOODLE;
UPDATE `gossip_menu_option` SET `action_menu_id`=9684 WHERE `menu_id`=9677;
UPDATE `creature_template` SET `gossip_menu_id`=9745 WHERE `entry`=28106;
UPDATE `creature_template` SET `speed_walk`=0.66667, `speed_run`=0.99206 WHERE `entry`=@GOREGEK;
UPDATE `creature_template` SET `speed_walk`=0.66667, `speed_run`=0.99206, `npcflag`=`npcflag`|1 WHERE `entry`=@ZEPIK;
UPDATE `gossip_menu_option` SET `action_menu_id`=9684 WHERE `menu_id`=9677;
DELETE FROM `creature_involvedrelation` WHERE  `id`=28216 AND `quest`=12582;

DELETE FROM `gossip_menu` WHERE `entry`=9747;
DELETE FROM `gossip_menu` WHERE `entry`=9562 AND `text_id`=12883;
DELETE FROM `gossip_menu` WHERE `entry`=9570 AND `text_id`=12905;
DELETE FROM `gossip_menu` WHERE `entry`=9678 AND `text_id`=13136;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(9562,12883),
(9570,12905),
(9678,13136),
(9747,13367);

DELETE FROM `npc_text` WHERE `ID`=13136;
INSERT INTO `npc_text` (`ID`,`text0_0`,`text0_1`,`lang0`,`prob0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`text1_0`,`text1_1`,`lang1`,`prob1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`text2_0`,`text2_1`,`lang2`,`prob2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`text3_0`,`text3_1`,`lang3`,`prob3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`text4_0`,`text4_1`,`lang4`,`prob4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`text5_0`,`text5_1`,`lang5`,`prob5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`text6_0`,`text6_1`,`lang6`,`prob6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`text7_0`,`text7_1`,`lang7`,`prob7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`,`WDBVerified`) VALUES
(13136,'Vekjik no want to be bothered.','',0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,12340);

DELETE FROM `creature_equip_template` WHERE `entry` IN (@GOREGEK,@DAJIK,@ZEPIK);
INSERT INTO `creature_equip_template` (`entry`,`id`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES
(@GOREGEK,1,36488,0,0),
(@DAJIK,1,28325,0,0),
(@ZEPIK,1,28914,0,5258);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(@LAFOO,@MOODLE,@JALOOT,@GOREGEK,@DAJIK,@ZEPIK,@GORLOCTREASURESCRIPT,@RAINSPEAKERBUNNY,@FRENZYBUNNY,@MOSSWALKERBUNNY,@MISTWHISPERBUNNY,@SPEARBORNBUNNY,@KARTAKHOLDBUNNY,@SPARKTOUCHEDBUNNY,@SAPPHIREHIVEBUNNY,@LIFEBLOODPILLARBUNNY,@SKYREACHPILLARBUNNY);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GOREGEK,0,0 ,0,11,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On Spawn - Set React State'),
(@GOREGEK,0,1,0,8,0,100,0,@FRENZYAURA,0,45000,70000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On spellhit - Say line'),
(@GOREGEK,0,2,0,8,0,100,0,@DESSAWNRETAINER,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On spellhit - Despawn'),
(@GOREGEK,0,3,0,0,0,100,0,3000,6000,8000,16000,11,54188,2,0,0,0,0,5,0,0,0,0,0,0,0, 'Goregek - IC - Cast Sunder Armor'),
(@GOREGEK,0,4,0,0,0,100,0,5000,8000,15000,20000,11,52743,2,0,0,0,0,2,0,0,0,0,0,0,0, 'Goregek - IC - Cast Head Smack'),
(@GOREGEK,0,5,0,2,0,100,0,0,30,60000,60000,11,52748,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On Less than 30% HP - Cast Voracious Appetite'),
(@GOREGEK,0,6,0,13,0,100,0,12000,20000,0,0,11,6713,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On Target Casting - Cast Disarm'),
(@GOREGEK,0,7 ,0,5,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On Creature Death - Say'),
(@GOREGEK,0,8 ,0,1,0,100,0,10000,40000,45000,90000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Gorekek - OOC - Say'),
(@GOREGEK,0,9 ,0,11,0,100,0,0,0,0,0,11,@WOLVARLOCATIONPERIODIC,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On Spawn - Cast Wolvar Location Periodic'),
(@GOREGEK,0,10 ,0,11,0,100,0,0,0,0,0,11,@SHOLAZARGUARDIANHEARTBEAT,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On Spawn - Cast Sholazar Guardian Heartbeat'),
(@GOREGEK,0,11 ,0,1,0,100,0,10000,40000,45000,90000,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Gorekek - OOC - Say'),
(@GOREGEK,0,12 ,0,1,0,100,0,10000,10000,10000,10000,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - OOC - Set Phase 2'),
(@GOREGEK,0,13 ,0,4,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On Agro - Set Phase 1'),
(@GOREGEK,0,14 ,0,38,0,100,0,1,1,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On Data Set - Say'),
(@GOREGEK,0,15,0,8,2,100,0,@KARTAKHOLDAURA,0,40000,70000,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On spellhit - Say line'),
(@DAJIK,0,0 ,0,11,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On Spawn - Set React State'),
(@DAJIK,0,1,0,8,0,100,0,@FRENZYAURA,0,45000,70000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On spellhit - Say line'),
(@DAJIK,0,2,0,8,0,100,0,@DESSAWNRETAINER,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On spellhit - Despawn'),
(@DAJIK,0,3,0,0,0,100,0,3000,6000,8000,12000,11,54195,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Dajik - IC - Cast Earth''s Wrath'),
(@DAJIK,0,4,0,0,0,100,0,5000,8000,15000,20000,11,54193,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Dajik - IC - Cast Earth''s Fury'),
(@DAJIK,0,5,0,2,0,100,0,0,30,60000,60000,11,54206,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On Less than 30% HP - Cast Mend'),
(@DAJIK,0,6 ,0,5,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On Creature Death - Say'),
(@DAJIK,0,8 ,0,1,0,100,0,10000,40000,45000,90000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - OOC - Say'),
(@DAJIK,0,9,0,8,2,100,0,@SAPPHIREHIVEAURA,0,40000,70000,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On spellhit - Say line'),
(@DAJIK,0,10 ,0,11,0,100,0,0,0,0,0,11,@WOLVARLOCATIONPERIODIC,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On Spawn - Cast Wolvar Location Periodic'),
(@DAJIK,0,11 ,0,11,0,100,0,0,0,0,0,11,@SHOLAZARGUARDIANHEARTBEAT,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik -Goregek - On Spawn - Cast Sholazar Guardian Heartbeat'),
(@DAJIK,0,12 ,0,38,0,100,0,1,1,0,0,1,4,5000,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On Creature Death (Sapphire Queen) - Say'),
(@DAJIK,0,13 ,0,38,0,100,0,1,2,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On Creature Death (Serfex the Reaver) - Say'),
(@DAJIK,0,14 ,0,1,0,100,0,10000,10000,10000,10000,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - OOC - Set Phase 2'),
(@DAJIK,0,15 ,0,4,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On Agro - Set Phase 1'),
(@DAJIK,0,16 ,0,52,0,100,0,4,@DAJIK,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik On - Text Over - Say'),
(@DAJIK,0,17,0,8,2,100,0,@SKYREACHPILLARAURA,0,40000,70000,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On spellhit - Say line'),
(@DAJIK,0,18 ,0,1,0,100,0,10000,40000,45000,90000,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - OOC - Say'),
(@DAJIK,0,19,0,8,2,100,0,@LIFEBLOODPILLARAURA,0,40000,70000,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On spellhit - Say line'),
(@ZEPIK,0,0 ,0,11,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - On Spawn - Set React State'),
(@ZEPIK,0,1,0,8,0,100,0,@FRENZYAURA,0,45000,70000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - On spellhit - Say line'),
(@ZEPIK,0,2,0,8,0,100,0,@DESSAWNRETAINER,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - On spellhit - Despawn'),
(@ZEPIK,0,3,0,0,0,100,0,4000,7000,15000,18000,11,52761,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Zepik the Gorloc Hunter - IC - Cast Barbed Net'),
(@ZEPIK,0,4,0,0,0,100,0,5000,8000,12000,15000,11,52889,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Zepik the Gorloc Hunter - IC - Cast Envenomed Shot'),
(@ZEPIK,0,5,0,0,0,100,0,0,6000,15000,18000,11,52873,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Zepik the Gorloc Hunter - IC - Cast Open Wound'),
(@ZEPIK,0,6,0,0,0,100,0,3000,5000,3000,7000,11,52758,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Zepik the Gorloc Hunter - IC - Cast Piercing Arrow'),
(@ZEPIK,0,7,0,2,0,100,0,0,30,60000,60000,11,52895,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik the Gorloc Hunter - On Less than 30% HP Cast Bandage - Cast Bandage'),
(@ZEPIK,0,8 ,0,5,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - On Creature Death - Say'),
(@ZEPIK,0,9 ,0,1,0,100,0,10000,40000,45000,90000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - OOC - Say'),
(@ZEPIK,0,10,0,8,2,100,0,@MISTWHISPERAURA,0,40000,70000,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - On spellhit - Say line'),
(@ZEPIK,0,11 ,0,11,0,100,0,0,0,0,0,11,@WOLVARLOCATIONPERIODIC,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - On Spawn - Cast Wolvar Location Periodic'),
(@ZEPIK,0,12 ,0,11,0,100,0,0,0,0,0,11,@SHOLAZARGUARDIANHEARTBEAT,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - On Spawn - Cast Sholazar Guardian Heartbeat'),
(@ZEPIK,0,13 ,0,1,0,100,0,10000,10000,10000,10000,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - OOC - Set Phase 2'),
(@ZEPIK,0,14 ,0,4,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - On Agro - Set Phase 1'),
(@ZEPIK,0,15 ,0,38,0,100,0,1,2,0,0,1,4,5000,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - On Data Set - Say'),
(@ZEPIK,0,16 ,0,52,0,100,0,4,@ZEPIK,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - On Text Over - Say'),
(@LAFOO,0,0 ,1,8, 2,100,1,@TREASUREPING,0,60000,60000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - On Spellhit - Say'),
(@LAFOO,0,1 ,0,61, 0,100,0,0,0,0,0,80,@GORLOCTREASURESCRIPT,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - Linked with Previous Event - Run Script'),
(@LAFOO,0,2 ,0,11,0,100,0,0,0,0,0,11,@GORLOCLOCATIONPERIODIC,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - On Spawn - Cast Gorloc Location Periodic'),
(@LAFOO,0,3 ,0,11,0,100,0,0,0,0,0,11,@SHOLAZARGUARDIANHEARTBEAT,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - On Spawn - Cast Sholazar Guardian Heartbeat'),
(@LAFOO,0,4 ,0,38, 0,100,0,1,1,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - On Data Set - Say'),
(@GORLOCTREASURESCRIPT,9,0 ,0,61, 0,100,0,0,0,0,0,69,0,0,0,0,0,0,11,28362,10,0,0,0,0,0, 'Lafoo - Script  - Move to Glinting Dirt'),
(@GORLOCTREASURESCRIPT,9,1 ,0,61, 0,100,0,1000,1000,0,0,45,1,1,0,0,0,0,9,@GLINTINGDIRT,0,2,0,0,0,0, 'Lafoo - Script  - Set Data'),
(@GORLOCTREASURESCRIPT,9,2 ,0,61, 0,100,0,1500,1500,0,0,11,51405,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - Script  - Cast Digging for Treasure'),
(@GORLOCTREASURESCRIPT,9,3 ,0,61, 0,100,0,5000,5000,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - Script  - Evade'),
(@LAFOO,0,6 ,0,0, 0,100,0,0,5000,10000,12000,11,52931,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Lafoo - IC - Cast Toxic Spit'),
(@LAFOO,0,7 ,0,2,0,100,0,0,50,60000,60000,11,52940,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - On Friendly Health - Cast Sleepy Time'),
(@LAFOO,0,8 ,0,11,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - On Spawn - Set React State'),
(@LAFOO,0,9 ,0,5,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - On Creature Death - Say'),
(@LAFOO,0,10 ,0,1,0,100,0,10000,40000,45000,90000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - OOC - Say'),
(@LAFOO,0,11,0,8,0,100,0,@RAINSPEAKERAURA,0,45000,70000,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - On spellhit - Say line'),
(@LAFOO,0,12,0,8,0,100,0,@DESSAWNRETAINER,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - On spellhit - Despawn'),
(@LAFOO,0,13,0,19,0,100,0,12572,0,0,0,85,@SEEINVIS,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Lafoo - On Quest Accept - Invoker Cast Rainspeaker Treasures: See Invisibility'),
(@LAFOO,0,14 ,0,1,0,100,0,10000,10000,10000,10000,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - OOC - Set Phase 2'),
(@LAFOO,0,15 ,0,4,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - On Agro - Set Phase 1'),
(@JALOOT,0,0 ,1,8, 2,100,1,@TREASUREPING,0,60000,60000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On Spellhit - Say'),
(@JALOOT,0,1 ,0,61, 0,100,0,0,0,0,0,80,@GORLOCTREASURESCRIPT,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - Linked with Previous Event - Run Script'),
(@JALOOT,0,2 ,0,11,0,100,0,0,0,0,0,11,@GORLOCLOCATIONPERIODIC,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On Spawn - Cast Gorloc Location Periodic'),
(@JALOOT,0,3 ,0,11,0,100,0,0,0,0,0,11,@SHOLAZARGUARDIANHEARTBEAT,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On Spawn - Cast Sholazar Guardian Heartbeat'),
(@JALOOT,0,4 ,0,38, 0,100,0,1,1,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On Data Set - Say'),
(@JALOOT,0,6,0,0,0,100,0,9000,15000,20000,25000,11,52943,2,0,0,0,0,5,0,0,0,0,0,0,0, 'Jaloot - IC - Cast Lightning Whirl'),
(@JALOOT,0,7,0,0,0,100,0,5000,8000,15000,18000,11,52944,2,0,0,0,0,5,0,0,0,0,0,0,0, 'Jaloot - IC - Cast Lightning Strike'),
(@JALOOT,0,8,0,0,0,100,0,7000,15000,20000,25000,11,52964,2,0,0,0,0,5,0,0,0,0,0,0,0, 'Jaloot - IC - Cast Spark Frenzy'),
(@JALOOT,0,9,0,2,0,100,0,0,30,30000,45000,11,52969,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On Less than 30% HP - Cast Energy Siphon'),
(@JALOOT,0,10 ,0,11,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On Spawn - Set React State'),
(@JALOOT,0,11 ,0,5,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On Creature Death - Say'),
(@JALOOT,0,12 ,0,1,0,100,0,10000,40000,45000,90000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - OOC - Say'),
(@JALOOT,0,13,0,8,0,100,0,@RAINSPEAKERAURA,0,45000,70000,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On spellhit - Say line'),
(@JALOOT,0,14,0,11,0,100,0,0,0,0,0,11,@JALOOTSINTENSITY,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On Spawn - Cast Jaloot''s Intensity'),
(@JALOOT,0,15,0,8,0,100,0,@DESSAWNRETAINER,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On spellhit - Despawn'),
(@JALOOT,0,16,0,8,2,100,0,@SPEARBORNAURA,0,40000,70000,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On spellhit - Say line'),
(@JALOOT,0,17 ,0,1,0,100,0,10000,10000,10000,10000,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - OOC - Set Phase 2'),
(@JALOOT,0,18 ,0,4,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On Agro - Set Phase 1'),
(@MOODLE,0,0 ,1,8, 2,100,1,@TREASUREPING,0,60000,60000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On Spellhit - Say'),
(@MOODLE,0,1 ,0,61, 0,100,0,0,0,0,0,80,@GORLOCTREASURESCRIPT,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - Linked with Previous Event - Run Script'),
(@MOODLE,0,2 ,0,11,0,100,0,0,0,0,0,11,@GORLOCLOCATIONPERIODIC,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On Spawn - Cast Gorloc Location Periodic'),
(@MOODLE,0,3 ,0,11,0,100,0,0,0,0,0,11,@SHOLAZARGUARDIANHEARTBEAT,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On Spawn - Cast Sholazar Guardian Heartbeat'),
(@MOODLE,0,4 ,0,0, 0,100,0,0,5000,20000,30000,11,52974,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - IC - Cast Vicious Roar'),
(@MOODLE,0,5 ,0,20, 0,100,0,12580,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On Quest Complete - Say'),
(@MOODLE,0,6 ,0,0, 0,100,0,0,5000,20000,24000,11,52973,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Moodle - IC - Cast Frost Breath'),
(@MOODLE,0,7,0,0,0,100,0,9000,15000,20000,25000,11,52979,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Moodle - IC - Cast Whirlwind'),
(@MOODLE,0,8,0,0,0,100,0,2000,10000,40000,50000,11,52972,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - IC - Cast Dispersal'),
(@MOODLE,0,9 ,0,2,0,100,0,0,50,60000,60000,11,52979,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On less than 50% HP - Cast Frigid Absorbtion'),
(@MOODLE,0,10 ,0,11,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On Spawn - Set React State'),
(@MOODLE,0,11 ,0,5,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On Creature Death - Say'),
(@MOODLE,0,12 ,0,1,0,100,0,10000,40000,45000,90000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - OOC - Say'),
(@MOODLE,0,13,0,8,0,100,0,@RAINSPEAKERAURA,0,45000,70000,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On spellhit - Say line'),
(@MOODLE,0,14,0,8,0,100,1,@DESSAWNRETAINER,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On spellhit - Despawn'),
(@MOODLE,0,15,0,8,2,100,0,@MOSSWALKERAURA,0,40000,70000,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On spellhit - Say line'),
(@MOODLE,0,16 ,0,61, 0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - Linked with Previous Event - Run Passive'),
(@MOODLE,0,17 ,0,19, 0,100,0,12581,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On Quest Accept - Say'),
(@MOODLE,0,18 ,0,1,0,100,0,10000,10000,10000,10000,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - OOC - Set Phase 2'),
(@MOODLE,0,19 ,0,4,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On Agro - Set Phase 1'),
(@RAINSPEAKERBUNNY,0,0,0,10,0,100,0,1,150,10000,10000,11,@RAINSPEAKERAURA,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Rainspeaker Canopy Bunny - On update OOC - Spellcast Rainspeaker Canopy Aura'),
(@FRENZYBUNNY,0,0,0,10,0,100,0,1,150,10000,10000,11,@FRENZYAURA,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Frenzyheart Hill Bunny - On update OOC - Spellcast Frenzyheart Hill Aura'),
(@MOSSWALKERBUNNY,0,0,0,10,0,100,0,1,200,10000,10000,11,@MOSSWALKERAURA,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Mosswalker Village Bunny - On update OOC - Spellcast Mosswalker Village Aura'),
(@MOSSWALKERBUNNY,0,1,0,10,0,100,0,1,200,1000,1000,85,@ANGRYGORLOCCREDIT,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Mosswalker Village Bunny - On update OOC - Cast quest credit'),
(@MISTWHISPERBUNNY,0,0,0,10,0,100,0,1,200,10000,10000,11,@MISTWHISPERAURA,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Mistwhisper Refuge Bunny - On update OOC - Spellcast Mistwhisper Refuge Aura'),
(@SPEARBORNBUNNY,0,0,0,10,0,100,0,1,200,10000,10000,11,@SPEARBORNAURA,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Spearborn Encampment Bunny - On update OOC - Spellcast Spearborn Encampment Aura'),
(@KARTAKHOLDBUNNY,0,0,0,10,0,100,0,1,200,10000,10000,11,@KARTAKHOLDAURA,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Kartak Hold Bunny - On update OOC - Spellcast Kartak Hold Aura'),
(@SPARKTOUCHEDBUNNY,0,0,0,10,0,100,0,1,200,10000,10000,11,@SPARKTOUCHEDAURA,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Sparktouched Haven Bunny - On update OOC - Spellcast Sparktouched Haven Aura'),
(@SAPPHIREHIVEBUNNY,0,0,0,10,0,100,0,1,200,10000,10000,11,@SAPPHIREHIVEAURA,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Sapphire Hive Bunny - On update OOC - Spellcast Sapphire Hive Aura'),
(@SKYREACHPILLARBUNNY,0,0,0,10,0,100,0,1,200,10000,10000,11,@SKYREACHPILLARAURA,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Skyreach Pillar Bunny - On update OOC - Spellcast Skyreach Pillar Aura'),
(@LIFEBLOODPILLARBUNNY,0,0,0,10,0,100,0,1,200,10000,10000,11,@LIFEBLOODPILLARAURA,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Lifeblood Pillar Bunny - On update OOC - Spellcast Lifeblood Pillar Aura');

UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE  `entry`=@SPARKLINGHARE;
DELETE FROM `smart_scripts` WHERE `entryorguid` =@SPARKLINGHARE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@SPARKLINGHARE,0,0 ,0,6, 0,100,0,0,0,0,0,11,@BLESSINGOFTHESPARKINGHARE,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Sparking Hare - On Death - Cast Blessing of the Sparkling Hare');

DELETE FROM `creature_text` WHERE `entry` IN(@LAFOO,@JALOOT,@MOODLE,@GOREGEK,@DAJIK,@ZEPIK);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@LAFOO, 0, 0, 'Ooh! Shinies!', 12, 0, 18, 0, 0, 0, 'Lafoo'),
(@LAFOO, 0, 1, 'Maybe more shiny bugs! We like bugs!', 12, 0, 17, 0, 0, 0, 'Lafoo'),
(@LAFOO, 0, 2, 'Treasure for Lafoo! Treasure for shrine!', 12, 0, 17, 0, 0, 0, 'Lafoo'),
(@LAFOO, 0, 3, 'Dig, dig, dig...', 12, 0, 16, 0, 0, 0, 'Lafoo'),
(@LAFOO, 0, 4, 'Crunchy bugs so delicious. Want?', 12, 0, 16, 0, 0, 0, 'Lafoo'),
(@LAFOO, 0, 5, 'That weird. Someone took our bugs. You have maybe?', 12, 0, 16, 0, 0, 0, 'Lafoo'),
(@LAFOO, 1, 0, 'No come back this time!', 12, 0, 100, 0, 0, 0, 'Lafoo'),
(@LAFOO, 2, 0, 'One day maybe you can be Soo-dryskin. You like?', 12, 0, 20, 0, 0, 0, 'Lafoo'),
(@LAFOO, 2, 1, 'You have pie? Someone gave us pie year ago. Really yummy.', 12, 0, 20, 0, 0, 0, 'Lafoo'),
(@LAFOO, 2, 2, 'Big comfy tree. Good Home.', 12, 0, 20, 0, 0, 0, 'Lafoo'),
(@LAFOO, 2, 3, 'Never meet Great Ones. Nope, just met their shrines.', 12, 0, 20, 0, 0, 0, 'Lafoo'),
(@LAFOO, 2, 4, 'You got funny looking eyeballs.', 12, 0, 20, 0, 0, 0, 'Lafoo'),
(@LAFOO, 3, 0, 'Home good, but not stay long! More adventures!.', 12, 0, 100, 0, 0, 0, 'Lafoo'),
(@LAFOO, 4, 0, 'Hiss... hiss... dead. All dead', 12, 0, 100, 0, 0, 0, 'Lafoo'),
(@JALOOT, 0, 0, 'Shiny things! Shiny things! Not as shiny as my crystal, but still shiny!', 12, 0, 25, 0, 0, 0, 'Jaloot'),
(@JALOOT, 0, 1, 'More treasures! Treasures of all kinds! Yay treasures!', 12, 0, 25, 0, 0, 0, 'Jaloot'),
(@JALOOT, 0, 2, 'Can never have too many shiny crystals! Nope!', 12, 0, 25, 0, 0, 0, 'Jaloot'),
(@JALOOT, 0, 3, 'We are fast digger! Really fast! See... all done! That was fast, huh?', 12, 0, 25, 0, 0, 0, 'Jaloot'),
(@JALOOT, 1, 0, 'You like that? Bet not! Bet not cause you dead! Hahah!', 12, 0, 34, 0, 0, 0, 'Jaloot'),
(@JALOOT, 1, 1, 'Vic...tor...ious! Dun nun nun dun da da!', 12, 0, 33, 0, 0, 0, 'Jaloot'),
(@JALOOT, 1, 2, 'Killing Spree!', 12, 0, 33, 0, 0, 0, 'Jaloot'),
(@JALOOT, 2, 0, 'Mistcaller really good at controlling weather with shrine. They know just which crystals to use! Really good!', 12, 0, 16, 0, 0, 0, 'Jaloot'),
(@JALOOT, 2, 1, 'Ever trip over own feet? We have. Kind of hurt. No do it, not fun. Nope.', 12, 0, 16, 0, 0, 0, 'Jaloot'),
(@JALOOT, 2, 2, 'Want us to help with something? What we help with? We good at helping.', 12, 0, 16, 0, 0, 0, 'Jaloot'),
(@JALOOT, 2, 3, 'Hello! You''re pretty strong and nice and stuff. I like you. Lets stay friends, okay?', 12, 0, 16, 0, 0, 0, 'Jaloot'),
(@JALOOT, 2, 4, 'Misty. Very misty. Seem sort of misty to you? Maybe not so much.', 12, 0, 16, 0, 0, 0, 'Jaloot'),
(@JALOOT, 2, 5, 'Lets go jump off tree! Fun fun!', 12, 0, 15, 0, 0, 0, 'Jaloot'),
(@JALOOT, 3, 0, 'Chase the hatchlings! Chase the hatchlings! So fast!', 12, 0, 34, 0, 0, 0, 'Jaloot'),
(@JALOOT, 3, 1, 'Great Ones keep home safe because they like Oracles I think! They know we good and nice.', 12, 0, 33, 0, 0, 0, 'Jaloot'),
(@JALOOT, 3, 2, 'Home home home... place of the shinies!', 12, 0, 33, 0, 0, 0, 'Jaloot'),
(@JALOOT, 4, 0, 'We know you have dragon thing! We not scared! We going to get you and dragon thing!', 12, 0, 34, 0, 0, 0, 'Jaloot'),
(@JALOOT, 4, 1, 'Teach you to steal our treasures! Our treasures are... ours, okay?', 12, 0, 33, 0, 0, 0, 'Jaloot'),
(@JALOOT, 4, 2, 'Time to hide puppy-men! We are coming for you!', 12, 0, 33, 0, 0, 0, 'Jaloot'),
(@JALOOT, 5, 0, 'Tartek no match for you! You got the skills. Yeah!', 12, 0, 100, 0, 0, 0, 'Jaloot'),
(@MOODLE, 0, 0, 'What the heck are shiny rabbits doing here anyway?', 12, 0, 25, 0, 0, 0, 'Moodle'),
(@MOODLE, 0, 1, 'Here I am, digging up some useless bauble on the will of someone I just met...does that seem right to you?', 12, 0, 25, 0, 0, 0, 'Moodle'),
(@MOODLE, 0, 2, 'Hey, maybe we''ll find some more useless bugs!', 12, 0, 25, 0, 0, 0, 'Moodle'),
(@MOODLE, 0, 3, 'Yay... more dirt.', 12, 0, 25, 0, 0, 0, 'Moodle'),
(@MOODLE, 1, 0, 'I can''t believe ... they''re all ... dead', 12, 0, 50, 0, 0, 0, 'Moodle'),
(@MOODLE, 1, 1, 'Another one falls to our Onslaught, As it should be.', 12, 0, 50, 0, 0, 0, 'Moodle'),
(@MOODLE, 2, 0, 'There some reason why we''re still here? I''d love to hear it', 12, 0, 33, 0, 0, 0, 'Moodle'),
(@MOODLE, 2, 1, 'Yeah, let''s go now', 12, 0, 33, 0, 0, 0, 'Moodle'),
(@MOODLE, 2, 2, 'I''m done here', 12, 0, 34, 0, 0, 0, 'Moodle'),
(@MOODLE, 3, 0, 'Going to go take a nap? I apologize in advance for accidentally stepping on your face while you sleep.', 12, 0, 33, 0, 0, 0, 'Moodle'),
(@MOODLE, 3, 1, 'Planning to sit on your butt some more, or are we going to go do something that''s actually useful?', 12, 0, 34, 0, 0, 0, 'Moodle'),
(@MOODLE, 3, 2, 'Here I am, brain the size of a planet, and they ask me to take you to the other village. Call that job satisfaction? ''Cause I don''t.', 12, 0, 33, 0, 0, 0, 'Moodle'),
(@MOODLE, 4, 0, 'The Mosswalkers were good people... they did not deserve this.', 12, 0, 17, 0, 0, 0, 'Moodle'),
(@MOODLE, 4, 1, 'I know I talk down to them, but I never want to see any of my people die.', 12, 0, 17, 0, 0, 0, 'Moodle'),
(@MOODLE, 4, 2, 'It''s good to see some of the mosswalker were more resilient than I thought.', 12, 0, 17, 0, 0, 0, 'Moodle'),
(@MOODLE, 4, 3, 'It''s hard to believe any of them survived this.', 12, 0, 17, 0, 0, 0, 'Moodle'),
(@MOODLE, 4, 4, 'There are more that might still be alive! We need to keep moving.', 12, 0, 16, 0, 0, 0, 'Moodle'),
(@MOODLE, 4, 5, 'Where are they dragging those bodies? What are they doing to them?', 12, 0, 16, 0, 0, 0, 'Moodle'),
(@MOODLE, 5, 0, 'This fight''s all yours', 12, 0, 10, 0, 0, 0, 'Moodle'),
(@MOODLE, 6, 0, 'It''s a small comfort to see that they haven''t brought any back in undeath.', 12, 0, 100, 0, 0, 0, 'Moodle'),
(@GOREGEK,0,0,'Home! You better have brought back meat for Goregek, slave.',12,0,20,0,0,0,'Goregek'),
(@GOREGEK,0,1,'Goregek get some sleep. Go bring foodstuffs back, slave thing.',12,0,20,0,0,0,'Goregek'),
(@GOREGEK,0,2,'Goregek go get drink. You sit in corner til Goregek ready.',12,0,20,0,0,0,'Goregek'),
(@GOREGEK,0,3,'Goregek hungry. Go get on fire spit, slave thing. Tell Goregek when you well roasted.',12,0,20,0,0,0,'Goregek'),
(@GOREGEK,0,4,'Gorgek gonna catch chicken good!',12,0,20,0,0,0,'Goregek'),
(@GOREGEK,0,5,'You wait until Goregek ready.',12,0,20,0,0,0,'Goregek'),
(@GOREGEK,0,6,'You wait, slave thing. Goregek eating.',12,0,20,0,0,0,'Goregek'),
(@GOREGEK,1,0,'Goregek best hunter... ever.',12,0,15,0,0,0,'Goregek'),
(@GOREGEK,1,1,'Hah! Goregek''s kill!',12,0,15,0,0,0,'Goregek'),
(@GOREGEK,1,2,'Next time, maybe Goregek let you try.',12,0,15,0,0,0,'Goregek'),
(@GOREGEK,1,3,'I stabbed it in the face! Goregek so good.',12,0,15,0,0,0,'Goregek'),
(@GOREGEK,1,4,'Squeal! Squeal! So good!',12,0,15,0,0,0,'Goregek'),
(@GOREGEK,1,5,'Frenzyheart the strongest!',12,0,15,0,0,0,'Goregek'),
(@GOREGEK,1,6,'That how it done, slave thing. Maybe you figure out how someday.',12,0,10,0,0,0,'Goregek'),
(@GOREGEK,2,0,'Why Goregek even bring you. You useless.',12,0,25,0,0,0,'Goregek'),
(@GOREGEK,2,1,'Elder maybe says other stuff, but you always be slave thing to Goregek.',12,0,25,0,0,0,'Goregek'),
(@GOREGEK,2,2,'Pitch was weakling anyway... why else you think Goregek not bother with him?',12,0,25,0,0,0,'Goregek'),
(@GOREGEK,2,3,'You just get yourself beat up! Hah! You so dumb, slave thing.',12,0,25,0,0,0,'Goregek'),
(@GOREGEK,3,0,'Careful slave thing, the big bad softnuckles might eat you! Hah!',12,0,13,0,0,0,'Goregek'),
(@GOREGEK,3,1,'Hardknuckles still walk on hands... seem kind of dumb to Goregek.',12,0,13,0,0,0,'Goregek'),
(@GOREGEK,3,2,'Run away dumb softknuckle! We gonna poke you more!',12,0,13,0,0,0,'Goregek'),
(@GOREGEK,3,3,'Run away softknuckle! Goregek gonna get you!',12,0,13,0,0,0,'Goregek'),
(@GOREGEK,3,4,'You just watch slave thing, Goregek take care of these hardknuckles!',12,0,12,0,0,0,'Goregek'),
(@GOREGEK,3,5,'Better not get in Goregek''s way!',12,0,12,0,0,0,'Goregek'),
(@GOREGEK,3,6,'Get out of way silly slave thing! Goregek''s kill!',12,0,12,0,0,0,'Goregek'),
(@GOREGEK,3,7,'There were hundreds of times these hardknuckles before Goregek.',12,0,12,0,0,0,'Goregek'),
(@GOREGEK,4,0,'Hah! Goregek the greatest hunter ever! Goregek get biggest hardknuckle!',12,0,100,0,0,0,'Goregek'),
(@GOREGEK,5,0,'Frenzyheart feed Kartak big-tongue so Kartak not eat us. That why we smarter than you, slave thing.',12,0,100,0,0,0,'Goregek'),
(@DAJIK,0,0,'Frenzyheart came here not long ago for new home... big-tongue homes pretty nice, so we maybe take those too. They ugly anyway.',12,0,12,0,0,0,'Dajik'),
(@DAJIK,0,1,'Lot of strong Frenzyheart here. Dajik taught most of them. First time I teach something like you though. You not a Frenzyheart, you know.',12,0,12,0,0,0,'Dajik'),
(@DAJIK,0,2,'Let''s just eat bristlepine instead, okay? All done with chasing.',12,0,12,0,0,0,'Dajik'),
(@DAJIK,0,3,'There reason Frenzyheart not chase back chickens. Look kind of dumb to lose to chicken.',12,0,12,0,0,0,'Dajik'),
(@DAJIK,0,4,'Maybe you not notice, chicken move kind of fast.',12,0,13,0,0,0,'Dajik'),
(@DAJIK,0,5,'Time for more smart Dajik tip! If Goregek let chickens out again, make Goregek get chickens back again.',12,0,13,0,0,0,'Dajik'),
(@DAJIK,0,6,'I placed most of the spikes. Good amount of pointiness I think. You like?',12,0,13,0,0,0,'Dajik'),
(@DAJIK,0,7,'Oh! Dajik has idea! Make chicken sounds and maybe they come to you!',12,0,13,0,0,0,'Dajik'),
(@DAJIK,1,0,'Get the stuff off of body! Dajik hate it when he go skin something and there stuff in the way. So annoying.',12,0,20,0,0,0,'Dajik'),
(@DAJIK,1,1,'Did you see face? Looked so scared, "Ah, big thing going to smash me!" Hah.',12,0,20,0,0,0,'Dajik'),
(@DAJIK,1,2,'Hah! Maybe you learn a little after all!',12,0,20,0,0,0,'Dajik'),
(@DAJIK,1,3,'Yes! Stab few more time just in case! Stab good!',12,0,20,0,0,0,'Dajik'),
(@DAJIK,1,4,'Not sure how thing got here. Not matter if dead though',12,0,20,0,0,0,'Dajik'),
(@DAJIK,2,0,'We came for something, yes? Can''t remember.',12,0,20,0,0,0,'Dajik'),
(@DAJIK,2,1,'Make sure you not forget anything! I forgot stuff once.',12,0,20,0,0,0,'Dajik'),
(@DAJIK,2,2,'Dajik not think he seen you eat anything. You eat sometimes, yeah?',12,0,20,0,0,0,'Dajik'),
(@DAJIK,2,3,'I was going to draw picture of best attack plan... but you have my chalk.',12,0,20,0,0,0,'Dajik'),
(@DAJIK,2,4,'Time for more smart Dajik tip! Make sure thing dead before reach in mouth for loots.',12,0,20,0,0,0,'Dajik'),
(@DAJIK,3,0,'Seem like there more wasps every time Dajik come back. Why they not run out?',12,0,20,0,0,0,'Dajik'),
(@DAJIK,3,1,'Time for more smart Dajik tip! Try not to catch stinger with face. Not work so much.',12,0,20,0,0,0,'Dajik'),
(@DAJIK,3,2,'In case you wonder, wasp sting not feel so good. No need to try.',12,0,20,0,0,0,'Dajik'),
(@DAJIK,3,3,'Drone things not as tough as they look. Wasp things a bit nastier.',12,0,20,0,0,0,'Dajik'),
(@DAJIK,3,4,'Try not to catch stinger with face. Not work so much.',12,0,20,0,0,0,'Dajik'),
(@DAJIK,4,0,'No! You killed the queen thing! What have you... wait, nevermind. Sorry, that okay.',12,0,100,0,7000,0,'Dajik'),
(@DAJIK,5,0,'Dajik''s last learner eaten by sand-thing. We do better this time though!',12,0,100,0,0,0,'Dajik'),
(@DAJIK,6,0,'This not first queen slain by Frenzyheart. Seem like there always more.',12,0,100,0,0,0,'Dajik'),
(@DAJIK,7,0,'Sometimes big-tongues try to come get crystals. Not now because they not like it when we kill them.',12,0,34,0,0,0,'Dajik'),
(@DAJIK,7,1,'Time for more smart Dajik tip! Crystals work little too good for back scratch. No try.',12,0,33,0,0,0,'Dajik'),
(@DAJIK,7,2,'Something big make pillars and crystals and everything. Frenzyheart not care much cause it not here anymore.',12,0,33,0,0,0,'Dajik'),
(@DAJIK,8,0,'If you here to poke more softnuckles, Dajik going to poke you too.That a bad Goregek habit.',12,0,50,0,0,0,'Dajik'),
(@DAJIK,8,1,'Huh... where are we? This not right. I not tell you find hardknuckles, did I?',12,0,50,0,0,0,'Dajik'),
(@DAJIK,9,0,'Time for more smart Dajik tip! Lot of dead things mean lot of chance of being dead thing. Dajik leaving now.',12,0,33,0,0,0,'Dajik'),
(@DAJIK,9,1,'Dead thing there already learn lesson of broken pillar. Leave this lesson for dumb, dead things. Going home now.',12,0,33,0,0,0,'Dajik'),
(@DAJIK,9,2,'You all done with learning! Yup! All done! Dajik leave you and evil red pillar thing now.',12,0,34,0,0,0,'Dajik'),
(@ZEPIK,0,0,'Bring back good meat and the camp treat you like high-shaman for a day. Good deal.',12,0,20,0,0,0,'Zepik'),
(@ZEPIK,0,1,'Elder Harkek pretty good Frenzyheart. He help me a lot when I was littler and not liking Dajik.',12,0,20,0,0,0,'Zepik'),
(@ZEPIK,0,2,'I not in a big hurry. We can rest here a while if want.',12,0,20,0,0,0,'Zepik'),
(@ZEPIK,0,3,'I not live here always... I traveled lot of world on my own not long ago. I like all the stories of beasts and dragons and gods and stuff.',12,0,20,0,0,0,'Zepik'),
(@ZEPIK,0,4,'You should go let chickens out again and say Goregek did it. Never get old.',12,0,20,0,0,0,'Zepik'),
(@ZEPIK,1,0,'Hahah! You see that? Lightning bolt hit him right in the head!',12,0,33,0,0,0,'Zepik'),
(@ZEPIK,1,1,'Good one! It not even see it coming.',12,0,33,0,0,0,'Zepik'),
(@ZEPIK,1,2,'No more play?',12,0,34,0,0,0,'Zepik'),
(@ZEPIK,2,0,'You ever fought big dragon or god or anything? Zepik like hearing stories.',12,0,12,0,0,0,'Zepik'),
(@ZEPIK,2,1,'You pretty good! Natural at hunt, like me.',12,0,12,0,0,0,'Zepik'),
(@ZEPIK,2,2,'Goregek think he the boss of everyone, but he eat too much and hunt too little.',12,0,12,0,0,0,'Zepik'),
(@ZEPIK,2,3,'Bring back good meat and the camp treat you like high-shaman for a day. Good deal.',12,0,12,0,0,0,'Zepik'),
(@ZEPIK,2,4,'Dajik forget what he doing, where he at... sometime even forget his own name. Make him not so good teacher sometimes.',12,0,13,0,0,0,'Zepik'),
(@ZEPIK,2,5,'Elder Harkek pretty good Frenzyheart. He help me a lot when I was littler and not liking Dajik.',12,0,13,0,0,0,'Zepik'),
(@ZEPIK,2,6,'I think one reason I like hunting big-tongues so much... they not as dumb as the other hunts. They give a real fight.',12,0,13,0,0,0,'Zepik'),
(@ZEPIK,2,7,'Dajik tried to show me ways of hunt, but I do better when I do things my way.',12,0,13,0,0,0,'Zepik'),
(@ZEPIK,3,0,'Eat it big-tongues!',12,0,14,0,0,0,'Zepik'),
(@ZEPIK,3,1,'Hah! Leave some for Zepik too.',12,0,14,0,0,0,'Zepik'),
(@ZEPIK,3,2,'That lake near here actually full of sea things. Not sure how it all get here... maybe in floods?',12,0,14,0,0,0,'Zepik'),
(@ZEPIK,3,3,'I think one reason I like hunting big-tongues so much... they not as dumb as the other hunts. They give a real fight.',12,0,14,0,0,0,'Zepik'),
(@ZEPIK,3,4,'Mist big-tongues are smart with their shrine thing sometimes... cover whole area with mist and it get hard to find any.',12,0,14,0,0,0,'Zepik'),
(@ZEPIK,3,5,'Hah! This the fun part!',12,0,15,0,0,0,'Zepik'),
(@ZEPIK,3,6,'Flame! Death! Destruction! The black fire rages within my heart! I must... release it! Hahah!',12,0,15,0,0,0,'Zepik'),
(@ZEPIK,4,0,'Trust me - you going love this!',12,0,100,0,0,0,'Zepik'),
(@ZEPIK,5,0,'BOOM! That so good! More! More!',12,0,100,0,0,0,'Zepik');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=14 AND `SourceGroup`=9678 AND `SourceEntry`=13137;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (@FRENZYAURA,@RAINSPEAKERAURA,@WOLVARPING,@GORLOCPING,@DESSAWNRETAINER,@TREASUREPING,@DIGGINGFORTEASURE,@MOSSWALKERAURA,@SPEARBORNAURA,@MISTWHISPERAURA,@SAPPHIREHIVEAURA,@SKYREACHPILLARAURA);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,7,@FRENZYAURA,0,31,@GOREGEK,0,0,0,0,'','Spell Frenzyheart Hill Aura targets Goregek the Bristlepine Hunter'),
(13,7,@FRENZYAURA,1,31,@DAJIK,0,0,0,0,'','Spell Frenzyheart Hill Aura targets Dajik the Wasp Hunter'),
(13,7,@FRENZYAURA,2,31,@ZEPIK,0,0,0,0,'','Spell Frenzyheart Hill Aura targets Zepik the Gorloc Hunter'),
(13,7,@RAINSPEAKERAURA,0,31,@LAFOO,0,0,0,0,'','Spell Rainspeaker Canopy Aura targets Lafoo'),
(13,7,@RAINSPEAKERAURA,1,31,@MOODLE,0,0,0,0,'','Spell Rainspeaker Canopy Aura targets Jaloot'),
(13,7,@RAINSPEAKERAURA,2,31,@JALOOT,0,0,0,0,'','Spell Rainspeaker Canopy Aura targets Moodle'),
(13,7,@WOLVARPING,0,31,@GOREGEK,0,0,0,0,'','Spell Wolvar Location Ping targets Goregek the Bristlepine Hunter'),
(13,7,@WOLVARPING,1,31,@DAJIK,0,0,0,0,'','Spell Wolvar Location Ping targets Dajik the Wasp Hunter'),
(13,7,@WOLVARPING,2,31,@ZEPIK,0,0,0,0,'','Spell Wolvar Location Ping targets Zepik the Gorloc Hunter'),
(13,7,@GORLOCPING,0,31,@LAFOO,0,0,0,0,'','Spell Gorloc Location Ping targets Lafoo'),
(13,7,@GORLOCPING,1,31,@JALOOT,0,0,0,0,'','Spell Gorloc Location Ping targets Jaloot'),
(13,7,@GORLOCPING,2,31,@MOODLE,0,0,0,0,'','Spell Gorloc Location Ping targets Moodle'),
(13,7,@DESSAWNRETAINER,0,31,@LAFOO,0,0,0,0,'','Spell Dessawn Retainer targets Lafoo'),
(13,7,@DESSAWNRETAINER,1,31,@DAJIK,0,0,0,0,'','Spell Dessawn Retainer targets Dajik the Wasp Hunter'),
(13,7,@DESSAWNRETAINER,2,31,@ZEPIK,0,0,0,0,'','Spell Dessawn Retainer targets  Zepik the Gorloc Hunter'),
(13,7,@DESSAWNRETAINER,3,31,@JALOOT,0,0,0,0,'','Spell Dessawn Retainer targets Jaloot '),
(13,7,@DESSAWNRETAINER,4,31,@MOODLE,0,0,0,0,'','Spell Dessawn Retainer targets Moodle'),
(13,7,@DESSAWNRETAINER,5,31,@GOREGEK,0,0,0,0,'','Spell Dessawn Retainer targets  Goregek'),
(13,7,@TREASUREPING,0,31,@LAFOO,0,0,0,0,'','Spell Dessawn Retainer targets Lafoo'),
(13,7,@TREASUREPING,1,31,@JALOOT,0,0,0,0,'','Spell Dessawn Retainer targets Jaloot '),
(13,7,@TREASUREPING,2,31,@MOODLE,0,0,0,0,'','Spell Dessawn Retainer targets Moodle'),
(13,7,@DIGGINGFORTEASURE,0,31,@GLINTINGDIRT,0,0,0,0,'','digging for treasure targets glinting dirt'),
(13,7,@MOSSWALKERAURA,0,31,@MOODLE,0,0,0,0,'','Mosswalker village aura targets moodle'),
(13,7,@SPEARBORNAURA,0,31,@JALOOT,0,0,0,0,'','spearborn encampment aura targets moodle'),
(13,7,@MISTWHISPERAURA,0,31,@ZEPIK,0,0,0,0,'','mistwhisper refuge aura targets zepik'),
(13,7,@SAPPHIREHIVEAURA,0,31,@DAJIK,0,0,0,0,'','sapphire hive aura targets dajik'),
(13,7,@SKYREACHPILLARAURA,0,31,@DAJIK,0,0,0,0,'','skyreach pillar aura targets dajik'),
(14,9678,13137,0,5,1104,7,0,0,0,'','Shaman Vekjik - Show different gossip if player is hated, hostile or unfriendly with Frenzyheart Tribe');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND  `SourceEntry` IN(@GLINTINGDIRT,@LAFOO,@JALOOT,@MOODLE,@GOREGEK,@DAJIK,@ZEPIK,@MOSSWALKERBUNNY) AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,1,@LAFOO,0,0,9,0,12704,0,0,0,0,'','Lafoo SAI only activates if player is on and has not completed the Appeasing the Great rainstone'),
(22,1,@LAFOO,0,0,29,0,@GLINTINGDIRT,10,0,0,0,'','Execute SAI only if there is glinting dirt within 5 yards'),
(22,1,@LAFOO,0,1,9,0,12572,0,0,0,0,'','Lafoo SAI only activates if player is on and has not completed the Gods like shiny things'),
(22,1,@LAFOO,0,1,29,0,@GLINTINGDIRT,10,0,0,0,'','Execute SAI only if there is glinting dirt within 5 yards'),
(22,1,@JALOOT,0,0,9,0,12704,0,0,0,0,'','Jaloot SAI only activates if player is on and has not completed the Appeasing the Great rainstone'),
(22,1,@JALOOT,0,0,29,0,@GLINTINGDIRT,10,0,0,0,'','Execute SAI only if there is glinting dirt within 5 yards'),
(22,1,@MOODLE,0,0,9,0,12704,0,0,0,0,'','Moodle SAI only activates if player is on and has not completed the Appeasing the Great rainstone'),
(22,1,@MOODLE,0,0,29,0,@GLINTINGDIRT,10,0,0,0,'','Execute SAI only if there is glinting dirt within 5 yards'),
(22,1,@GLINTINGDIRT,0,0,29,1,@LAFOO,5,0,0,0,'','Execute SAI only if Lafoo within 2 yards'),
(22,1,@GLINTINGDIRT,0,1,29,1,@JALOOT,5,0,0,0,'','Execute SAI only if Jaloot within 2 yards'),
(22,1,@GLINTINGDIRT,0,2,29,1,@MOODLE,5,0,0,0,'','Execute SAI only if Moodle within 2 yards'),
(22,13,@MOODLE,0,0,23,1,4297,0,0,1,0,'','Moodle dont execute SAI in Mosswalker Village'),
(22,9,@GOREGEK,0,0,23,1,4303,0,0,1,0,'','Goregek dont execute SAI in Hardknuckle Clearing'),
(22,10,@ZEPIK,0,0,23,1,4306,0,0,1,0,'','Zepik dont execute SAI in Mistwhisper Refuge'),
(22,12,@GOREGEK,0,0,23,1,4303,0,0,0,0,'','Goregek execute SAI in only in Hardknuckle Clearing'),
(22,9,@DAJIK,0,0,23,1,4304,0,0,1,0,'','Dajik Dont execute SAI in Sapphire Hive'),
(22,9,@DAJIK,0,0,23,1,4303,0,0,1,0,'','Dajik execute SAI in Hardknuckle Clearing'),
(22,9,@DAJIK,0,0,23,1,4388,0,0,1,0,'','Dajik execute SAI in Wintergrasp River'),
(22,9,@DAJIK,0,0,23,1,4295,0,0,1,0,'','Dajik execute SAI in The Sundered Shard'),
(22,19,@DAJIK,0,0,23,1,4303,0,0,0,0,'','Dajik execute SAI only in Hardknuckle Clearing'),
(22,11,@LAFOO,0,0,23,1,4291,0,0,1,0,'','Lafoo dont execute sai in rainspeaker canopy'),
(22,13,@JALOOT,0,0,23,1,4291,0,0,1,0,'','Jaloot dont execute sai in rainspeaker canopy'),
(22,13,@JALOOT,0,1,23,1,4308,0,0,1,0,'','Jaloot dont execute sai in spearborn encampment'),
(22,13,@MOODLE,0,0,23,1,4291,0,0,1,0,'','Moodle dont execute sai in rainspeaker canopy'),
(22,9,@GOREGEK,0,0,23,1,4292,0,0,1,0,'','Goregek dont execute sai in frenzyheart hill'),
(22,9,@DAJIK,0,0,23,1,4292,0,0,1,0,'','Dajik dont execute sai in frenzyheart hill'),
(22,10,@ZEPIK,0,0,23,1,4292,0,0,1,0,'','Zepik dont execute sai in frenzyheart hill'),
(22,2,@MOSSWALKERBUNNY,0,0,1,0,@SHOLAZARGUARDIANHEARTBEAT,0,0,0,0,'','Mosswalker Bunny execute SAI only if player has sholazar guardian heartbeat aura');

UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`= @HARDKNUCKLEMATRIARCH;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@HARDKNUCKLEMATRIARCH;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@HARDKNUCKLEMATRIARCH;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@HARDKNUCKLEMATRIARCH, 0, 0, 1, 4, 0, 100, 0, 0, 0, 0, 0, 11, 54287, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hardknuckle Matriarch - On Agro - Cast Enrage'),
(@HARDKNUCKLEMATRIARCH, 0, 1, 0,61, 0, 100, 0, 0, 0, 0, 0, 1 , 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hardknuckle Matriarch - Linked with Previous Event - Say'),
(@HARDKNUCKLEMATRIARCH, 0, 2, 0, 0, 0, 100, 0, 6000, 10000, 12000, 15000, 11 , 61580, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hardknuckle Matriarch - In Combat - Cast Cast Thunderstomp'),
(@HARDKNUCKLEMATRIARCH, 0, 3, 0, 6, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 9, @GOREGEK, 0, 50, 0, 0, 0, 0, 'Hardknuckle Matriarch - On Death Send Data to Goregek');

DELETE FROM `creature_ai_texts` WHERE `entry`= -738;
DELETE FROM `creature_text` WHERE `entry`=@HARDKNUCKLEMATRIARCH;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(@HARDKNUCKLEMATRIARCH, 0, 0, 'We are Not Amused', 12, 0, 100, 0, 0, 0, 'Hardknuckle Matriarch');

UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`= @SAPPHIREQUEEN;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@SAPPHIREQUEEN;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SAPPHIREQUEEN;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@SAPPHIREQUEEN, 0, 0, 0, 0, 0, 100, 0, 6000, 9000, 9000, 14000, 11, 48193, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Sapphire Hive Queen - IC - Cast Poison Stinger'),
(@SAPPHIREQUEEN, 0, 1, 0, 2, 0, 100, 0, 0, 30, 12000, 15000, 11, 54761, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sapphire Hive Queen - On 30% Hp - Cast Enrage'),
(@SAPPHIREQUEEN, 0, 2, 0, 6, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 9, @DAJIK, 0, 50, 0, 0, 0, 0, 'Sapphire Hive Queen - On Death - Set Data Dajik');

UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`= @VENOMTIP;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@VENOMTIP;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@VENOMTIP;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@VENOMTIP, 0, 0, 0, 0, 0, 100, 0, 7000, 9000, 17000, 20000, 11, 61550, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Venomtip - IC - Cast Cobra Strike'),
(@VENOMTIP, 0, 1, 0, 9, 0, 100, 0, 0, 30, 7000, 12000, 11, 32330, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Venomtip - On Range - Cast Poison Spit'),
(@VENOMTIP, 0, 2, 0, 6, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 9, @LAFOO, 0, 50, 0, 0, 0, 0, 'Venomtip - On Death - Set Data Lafoo');
SET @HO_SOOSAY := 28027;
SET @HO_GOSSIP := 9742;
SET @O_STATE   := 50503;
SET @T_STORM   := 53071;
SET @FI_LAFOO  := 52547;
SET @FI_JALOOT := 52548;
SET @FI_MOODLE := 52549;
SET @SEEINVIS  := 52214;
SET @RAINSPEAKERAURA := 51639;
SET @TREASUREPING := 51420;
SET @GORLOCPING   := 51794;
SET @WOLVARPING   := 51791;
SET @DIGUPGLINTINGBUG  := 51443;
SET @DIGUPSPARKINGHARE := 51441;
SET @DIGUPSHININGCRYSTAL := 51397;
SET @DIGUPGLINTINGARMOR  := 51398;
SET @DIGUPGLOWINGGEM := 51400;
SET @DIGUPPOLISHEDPLATTER  := 51401;
SET @DIGUPSPARKINGTREASURE := 51402;
SET @BLESSINGOFTHESPARKINGHARE := 51442;
SET @JALOOTSINTENSITY := 52119;
SET @RAINSPEAKERBUNNY := 28455;
SET @LAFOO  := 28120;
SET @MOODLE := 28122;
SET @JALOOT := 28121;
SET @GLINTINGDIRT  := 28362;
SET @GLINTINGBUG   := 28372;
SET @SPARKLINGHARE := 28371;
SET @GLINTINGDIRTSCRIPT := 2836201;
SET @GORLOCTREASURESCRIPT := 2812000;
SET @ELDER_HARKEK  := 28138;
SET @SHAMAN_RAKJAK := 28082;
SET @EH_GOSSIP := 9741;
SET @FRENZYAURA  := 51234;
SET @FRENZYBUNNY := 28299;
SET @GOREGEK := 28214;
SET @DAJIK := 28215;
SET @ZEPIK := 28216;
SET @FI_GOREGEK := 52542;
SET @FI_DAJIK   := 52544;
SET @FI_ZEPIK   := 52545;
SET @CHICKENSEEINVIS := 50735;
SET @DESSAWNRETAINER := 53163;
SET @MOSSWALKERAURA := 51644;
SET @MOSSWALKERBUNNY := 28459;
SET @ANGRYGORLOCCREDIT := 54057;
SET @MISTWHISPERAURA := 51239;
SET @MISTWHISPERBUNNY := 28300;
SET @SPEARBORNAURA := 51642;
SET @SPEARBORNBUNNY := 28457;
SET @KARTAKHOLDAURA := 51643;
SET @KARTAKHOLDBUNNY := 28458;
SET @SPARKTOUCHEDAURA := 51641;
SET @SPARKTOUCHEDBUNNY := 28456;
SET @SAPPHIREHIVEAURA := 51651;
SET @LIFEBLOODPILLARBUNNY := 28460;
SET @LIFEBLOODPILLARAURA:= 51649;
SET @SKYREACHPILLARBUNNY := 28454;
SET @SKYREACHPILLARAURA:= 51645;
SET @SAPPHIREHIVEBUNNY := 28462;
SET @GORLOCLOCATIONPERIODIC := 51793;
SET @WOLVARLOCATIONPERIODIC := 51792;
SET @LOOKINGFORTREASUREAURA := 51407;
SET @SHOLAZARGUARDIANHEARTBEAT := 51623;
SET @DIGGINGFORTEASURE := 51405;
SET @GOREGEKSSHACKLE := 38619;
SET @DAJIKSCHALK := 38621;
SET @ZEPIKSHUNTINGHORN := 38512;
SET @LAFOOSBUGBAG := 38622;
SET @JALOOTSCRYSTAL := 38623;
SET @MOODLESSTRESSBALL := 38624;
SET @INVISIBILTY := 52213;
SET @CHICKENLOCATIONPING := 51843;
SET @CHICKENNET := 51959;
SET @CHICKENESCAPEE := 28161;
SET @HARDKNUCKLE := 28096;
SET @HARDKNUCKLEMATRIARCH := 28213;
SET @SOFTKNUCKLE := 28127;
SET @SAPPHIREQUEEN := 28087;
SET @VENOMTIP := 28358;
SET @SERFEXTHEREAVER := 28083;
SET @MISTWHISPERLIGHTNINGCLOUD := 28253;
SET @MISTWHISPERLIGHTNINGTARGET := 28254;
SET @ARRANGEDCRYSTALFORMATIONBUNNY := 28273;
SET @SCAREDSOFTKNUCKLE := 50979;
SET @PITCH := 28097;
SET @TRACKERGEKGEK := 28095;
SET @MOSSWALKERVICTIM := 28113;

SET @GOBJGUID := 4598;  -- Needs 2 gobject guids for Lightning Definitly strikes twice, one for spellfocus, other for arranged crystal formation since cant find spell to spawn this,
SET @QUESTPOOL := 359;  -- Needs 4, 2 for oracles and 2 for frenzyheart,

UPDATE `creature_template` SET `unit_class`=2 WHERE  `entry` IN(@DAJIK,@ZEPIK);
UPDATE `creature_template` SET `minlevel`=77, `maxlevel`=77, `exp`=2,`mindmg`=371, `maxdmg`=522,`attackpower`=478 WHERE  `entry`IN (@GOREGEK,@DAJIK,@ZEPIK);
UPDATE `creature_template` SET `unit_flags` =33555200 WHERE `entry`IN (@MOSSWALKERBUNNY,@MISTWHISPERBUNNY,@SPEARBORNBUNNY,@KARTAKHOLDBUNNY,@SPARKTOUCHEDBUNNY,@SAPPHIREHIVEBUNNY,@LIFEBLOODPILLARBUNNY,@SKYREACHPILLARBUNNY);
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry` IN(@HO_SOOSAY,@ELDER_HARKEK,@SHAMAN_RAKJAK);
DELETE FROM `creature_ai_scripts` WHERE `creature_id`IN(@HO_SOOSAY,@ELDER_HARKEK,@SHAMAN_RAKJAK);
DELETE FROM `smart_scripts` WHERE `entryorguid`IN(@HO_SOOSAY,@ELDER_HARKEK,@SHAMAN_RAKJAK);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@HO_SOOSAY,0,0,0,1,0,100,0,0,0,0,0,75,@O_STATE,0,0,0,0,0,1,0,0,0,0,0,0,0, 'High-Oracle Soo-say - Out of combat - Add Oracle State Aura'),
(@HO_SOOSAY,0,1,0,0,0,100,0,5000,10000,12000,16000,11,@T_STORM,0,0,0,0,0,2,0,0,0,0,0,0,0, 'High-Oracle Soo-say - In Combat - Cast Thunderstorm'),
(@HO_SOOSAY,0,2,8,62,0,100,0,@HO_GOSSIP,0,0,0,85,@FI_LAFOO,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Oracle Soo-say - On gossip select - Spellcast Forceitem Lafoo'),
(@HO_SOOSAY,0,3,8,62,0,100,0,@HO_GOSSIP,1,0,0,85,@FI_LAFOO,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Oracle Soo-say - On gossip select - Spellcast Forceitem Lafoo'),
(@HO_SOOSAY,0,4,8,62,0,100,0,@HO_GOSSIP,2,0,0,85,@FI_JALOOT,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Oracle Soo-say - On gossip select - Spellcast Forceitem Jaloot'),
(@HO_SOOSAY,0,5,8,62,0,100,0,@HO_GOSSIP,3,0,0,85,@FI_JALOOT,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Oracle Soo-say - On gossip select - Spellcast Forceitem Jaloot'),
(@HO_SOOSAY,0,6,8,62,0,100,0,@HO_GOSSIP,4,0,0,85,@FI_MOODLE,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Oracle Soo-say - On gossip select - Spellcast Forceitem Moodle'),
(@HO_SOOSAY,0,7,8,62,0,100,0,@HO_GOSSIP,5,0,0,85,@FI_MOODLE,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Oracle Soo-say - On gossip select - Spellcast Forceitem Moodle'),
(@HO_SOOSAY,0,8,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Oracle Soo-say - On gossip select - Close gossip'),
(@HO_SOOSAY,0,9,0,20,0,100,0,12704,0,0,0,28,@SEEINVIS,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Oracle Soo-say - On Quest Complete - Remove Aura Rainspeaker Treasures: See Invisibility'),
(@HO_SOOSAY,0,10,0,19,0,100,0,12704,0,0,0,85,@SEEINVIS,2,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Oracle Soo-say - On Quest Accept - Invoker Cast Rainspeaker Treasures: See Invisibility'),
(@HO_SOOSAY,0,11,0,20,0,100,0,12572,0,0,0,28,@SEEINVIS,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Oracle Soo-say - On Quest Complete - Remove Aura Rainspeaker Treasures: See Invisibility'),
(@HO_SOOSAY,0,12,0,19,0,100,0,12574,0,0,0,57,@LAFOOSBUGBAG,1,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Oracle Soo-say - On Quest Accept - Remove Lafoos Bug bag'),
(@HO_SOOSAY,0,13,0,20,0,100,0,12577,0,0,0,57,@JALOOTSCRYSTAL,1,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Oracle Soo-say - On Quest Complete - Remove Jaloots favourite crystal'),
(@HO_SOOSAY,0,14,0,20,0,100,0,12581,0,0,0,57,@MOODLESSTRESSBALL,1,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Oracle Soo-say - On Quest Complete - Remove Moodles Stress Ball'),
(@SHAMAN_RAKJAK,0,0,0,19,0,100,0,12529,0,0,0,11,@FI_GOREGEK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Shaman Rakjak - On quest accept - Spellcast Forceitem Goregek'),
(@SHAMAN_RAKJAK,0,1,0,19,0,100,0,12530,0,0,0,11,@FI_GOREGEK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Shaman Rakjak - On quest accept - Spellcast Forceitem Goregek'),
(@SHAMAN_RAKJAK,0,2,0,19,0,100,0,12533,0,0,0,11,@FI_DAJIK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Shaman Rakjak - On quest accept - Spellcast Forceitem Dajik'),
(@SHAMAN_RAKJAK,0,3,0,19,0,100,0,12534,0,0,0,11,@FI_DAJIK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Shaman Rakjak - On quest accept - Spellcast Forceitem Dajik'),
(@SHAMAN_RAKJAK,0,4,0,19,0,100,0,12536,0,0,0,11,@FI_ZEPIK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Shaman Rakjak - On quest accept - Spellcast Forceitem Zepik'),
(@SHAMAN_RAKJAK,0,15,0,19,0,100,0,12533,0,0,0,57,@GOREGEKSSHACKLE,1,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Shaman Rakjak - On Quest Accept - Remove Goregeks Shackes'),
(@SHAMAN_RAKJAK,0,16,0,19,0,100,0,12536,0,0,0,57,@DAJIKSCHALK,1,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Shaman Rakjak - On Quest Accept - Remove Dajiks Chalk'),
(@SHAMAN_RAKJAK,0,17,0,19,0,100,0,12540,0,0,0,57,@ZEPIKSHUNTINGHORN,1,0,0,0,0,7,0,0,0,0,0,0,0, 'High-Shaman Rakjak - On Quest Accept - Remove Zepiks Hunting Horn'),
(@ELDER_HARKEK,0,4,10,62,0,100,0,@EH_GOSSIP,0,0,0,85,@FI_GOREGEK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Elder Harkek - On gossip select - Spellcast Forceitem Goregek'),
(@ELDER_HARKEK,0,5,10,62,0,100,0,@EH_GOSSIP,1,0,0,85,@FI_GOREGEK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Elder Harkek - On gossip select - Spellcast Forceitem Goregek'),
(@ELDER_HARKEK,0,6,10,62,0,100,0,@EH_GOSSIP,2,0,0,85,@FI_DAJIK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Elder Harkek - On gossip select - Spellcast Forceitem Dajik'),
(@ELDER_HARKEK,0,7,10,62,0,100,0,@EH_GOSSIP,3,0,0,85,@FI_DAJIK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Elder Harkek - On gossip select - Spellcast Forceitem Dajik'),
(@ELDER_HARKEK,0,8,10,62,0,100,0,@EH_GOSSIP,4,0,0,85,@FI_ZEPIK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Elder Harkek - On gossip select - Spellcast Forceitem Zepik'),
(@ELDER_HARKEK,0,9,10,62,0,100,0,@EH_GOSSIP,5,0,0,85,@FI_ZEPIK,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Elder Harkek - On gossip select - Spellcast Forceitem Zepik'),
(@ELDER_HARKEK,0,10,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Elder Harkek - On gossip select - Close gossip'),
(@ELDER_HARKEK,0,3,0,20,0,100,0,12702,0,0,0,28,@CHICKENSEEINVIS,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Elder Harkek - On Quest Complete - Remove Aura Frenzyheart Chicken: See Invisibility'),
(@ELDER_HARKEK,0,2,0,20,0,100,0,12532,0,0,0,28,@CHICKENSEEINVIS,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Elder Harkek - On Quest Complete - Remove Aura Frenzyheart Chicken: See Invisibility'),
(@ELDER_HARKEK,0,1,0,19,0,100,0,12702,0,0,0,85,@CHICKENSEEINVIS,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Elder Harkek - On Quest Accept - Invoker Cast Frenzyheart Chicken: See Invisibility'),
(@ELDER_HARKEK,0,0,0,19,0,100,0,12532,0,0,0,85,@CHICKENSEEINVIS,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Elder Harkek - On Quest Accept - Invoker Cast Frenzyheart Chicken: See Invisibility'),
(@ELDER_HARKEK,0,11,0,19,0,100,0,12534,0,0,0,57,@GOREGEKSSHACKLE,1,0,0,0,0,7,0,0,0,0,0,0,0, 'Elder Harkek - On Quest Accept - Remove Goregeks Shackes');

DELETE FROM `gossip_menu_option` WHERE `menu_id` IN(@HO_GOSSIP,@EH_GOSSIP) AND `id` IN(0,1,2,3,4,5);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@HO_GOSSIP,0,0, 'I need to find Lafoo, do you have his bug bag?',1,1,0,0,0,0, ''),
(@HO_GOSSIP,1,0, 'I need to find Lafoo, do you have his bug bag?',1,1,0,0,0,0, ''),
(@HO_GOSSIP,2,0, 'I need to find Jaloot, do you have his favorite crystal?',1,1,0,0,0,0, ''),
(@HO_GOSSIP,3,0, 'I need to find Jaloot, do you have his favorite crystal?',1,1,0,0,0,0, ''),
(@HO_GOSSIP,4,0, 'I need to find Moodle, do you have his stress ball?',1,1,0,0,0,0, ''),
(@HO_GOSSIP,5,0, 'I need to find Moodle, do you have his stress ball?',1,1,0,0,0,0, ''),
(@EH_GOSSIP,0,0, 'I need to find Goregek, do you have his shackles?',1,1,0,0,0,0, ''),
(@EH_GOSSIP,1,0, 'I need to find Goregek, do you have his shackles?',1,1,0,0,0,0, ''),
(@EH_GOSSIP,2,0, 'I need to find Dajik, do you have his chalk?',1,1,0,0,0,0, ''),
(@EH_GOSSIP,3,0, 'I need to find Dajik, do you have his chalk?',1,1,0,0,0,0, ''),
(@EH_GOSSIP,4,0, 'I need to find Zepik, do you have his hunting horn?',1,1,0,0,0,0, ''),
(@EH_GOSSIP,5,0, 'I need to find Zepik, do you have his hunting horn?',1,1,0,0,0,0, '');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`IN(@HO_GOSSIP,@EH_GOSSIP);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@HO_GOSSIP,0,0,0,2,0,@LAFOOSBUGBAG,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Lafoo''s Bug Bag'),
(15,@HO_GOSSIP,0,0,0,9,0,12571,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Taken Quest Make the Bad Snake go away'),
(15,@HO_GOSSIP,0,0,2,2,0,@LAFOOSBUGBAG,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Lafoo''s Bug Bag'),
(15,@HO_GOSSIP,0,0,2,8,0,12571,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Rewarded Quest Make the Bad Snake go away'),
(15,@HO_GOSSIP,0,0,1,2,0,@LAFOOSBUGBAG,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Lafoo''s Bug Bag'),
(15,@HO_GOSSIP,0,0,1,28,0,12571,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has completed Quest Make the Bad Snake go away'),
(15,@HO_GOSSIP,0,0,0,8,0,12573,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Quest Making Peace'),
(15,@HO_GOSSIP,0,0,1,8,0,12573,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Quest Making Peace'),
(15,@HO_GOSSIP,0,0,2,8,0,12573,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Quest Making Peace'),
(15,@HO_GOSSIP,1,0,0,8,0,12695,0,0,0,0,0, '', 'High-Oracle Soo-say - Show gossip option only if player has rewarded quest Return of the Friendly Dryskin'),
(15,@HO_GOSSIP,1,0,0,5,0,1105,224,0,0,0,0, '', 'High-Oracle Soo-say - Show gossip option only if player is at least honored with The Oracles'),
(15,@HO_GOSSIP,1,0,0,2,0,@LAFOOSBUGBAG,1,0,1,0,0, '', 'High-Oracle Soo-say - Show gossip option only if player has no item Lafoo''s Bug Bag'),
(15,@HO_GOSSIP,4,0,0,2,0,@MOODLESSTRESSBALL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Moodle''s Stress Ball'),
(15,@HO_GOSSIP,4,0,0,9,0,12578,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Taken Quest The Angry Gorloc'),
(15,@HO_GOSSIP,4,0,2,2,0,@MOODLESSTRESSBALL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Moodle''s Stress Ball'),
(15,@HO_GOSSIP,4,0,2,8,0,12578,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Rewarded Quest The Angry Gorloc'),
(15,@HO_GOSSIP,4,0,1,2,0,@MOODLESSTRESSBALL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Moodle''s Stress Ball'),
(15,@HO_GOSSIP,4,0,1,28,0,12578,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Completed Quest The Angry Gorloc'),
(15,@HO_GOSSIP,4,0,0,8,0,12579,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Quest Lifeblood of the Mosswalker Shrine'),
(15,@HO_GOSSIP,4,0,1,8,0,12579,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Quest Lifeblood of the Mosswalker Shrine'),
(15,@HO_GOSSIP,4,0,2,8,0,12579,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Quest Lifeblood of the Mosswalker Shrine'),
(15,@HO_GOSSIP,4,0,3,2,0,@MOODLESSTRESSBALL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Moodle''s Stress Ball'),
(15,@HO_GOSSIP,4,0,3,9,0,12578,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Taken Quest The Angry Gorloc'),
(15,@HO_GOSSIP,4,0,5,2,0,@MOODLESSTRESSBALL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Moodle''s Stress Ball'),
(15,@HO_GOSSIP,4,0,5,8,0,12578,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Rewarded Quest The Angry Gorloc'),
(15,@HO_GOSSIP,4,0,4,2,0,@MOODLESSTRESSBALL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Moodle''s Stress Ball'),
(15,@HO_GOSSIP,4,0,4,28,0,12578,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Completed Quest The Angry Gorloc'),
(15,@HO_GOSSIP,4,0,3,8,0,12580,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Quest The Mosswalker Savior'),
(15,@HO_GOSSIP,4,0,4,8,0,12580,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Quest The Mosswalker Savior'),
(15,@HO_GOSSIP,4,0,5,8,0,12580,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Quest The Mosswalker Savior'),
(15,@HO_GOSSIP,3,0,0,8,0,12695,0,0,0,0,0, '', 'High-Oracle Soo-say - Show gossip option only if player has rewarded quest Return of the Friendly Dryskin'),
(15,@HO_GOSSIP,3,0,0,5,0,1105,224,0,0,0,0, '', 'High-Oracle Soo-say - Show gossip option only if player is at least honored with The Oracles'),
(15,@HO_GOSSIP,3,0,0,2,0,@JALOOTSCRYSTAL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show gossip option only if player has no item Jaloot''s Favorite Crystal'),
(15,@HO_GOSSIP,2,0,0,2,0,@JALOOTSCRYSTAL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Jaloot''s Favourite Crystal'),
(15,@HO_GOSSIP,2,0,0,9,0,12574,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Taken Quest Back so soon?'),
(15,@HO_GOSSIP,2,0,2,2,0,@JALOOTSCRYSTAL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Jaloot''s Favourite Crystal'),
(15,@HO_GOSSIP,2,0,2,8,0,12574,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Rewarded Back so soon?'),
(15,@HO_GOSSIP,2,0,1,2,0,@JALOOTSCRYSTAL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player doesn''t already have Jaloot''s Favourite Crystal'),
(15,@HO_GOSSIP,2,0,1,28,0,12574,0,0,0,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has Completed Back so soon?'),
(15,@HO_GOSSIP,2,0,0,8,0,12577,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Home Time'),
(15,@HO_GOSSIP,2,0,1,8,0,12577,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Home Time'),
(15,@HO_GOSSIP,2,0,2,8,0,12577,0,0,1,0,0, '', 'High-Oracle Soo-say - Show Gossip if player Has not completed Home Time'),
(15,@HO_GOSSIP,5,0,0,8,0,12695,0,0,0,0,0, '', 'High-Oracle Soo-say - Show gossip option only if player has rewarded quest Return of the Friendly Dryskin'),
(15,@HO_GOSSIP,5,0,0,5,0,1105,224,0,0,0,0, '', 'High-Oracle Soo-say - Show gossip option only if player is at least honored with The Oracles'),
(15,@HO_GOSSIP,5,0,0,2,0,@MOODLESSTRESSBALL,1,0,1,0,0, '', 'High-Oracle Soo-say - Show gossip option only if player has no item Moodle''s Stress Ball'),
(15,@EH_GOSSIP,0,0,0,2,0,@GOREGEKSSHACKLE,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Gorekeks Shackles'),
(15,@EH_GOSSIP,0,0,0,9,0,12529,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has Taken Quest The Ape Hunters Slave'),
(15,@EH_GOSSIP,0,0,2,2,0,@GOREGEKSSHACKLE,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Gorekeks Shackles'),
(15,@EH_GOSSIP,0,0,2,8,0,12529,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has Rewarded Quest The Ape Hunters Slave'),
(15,@EH_GOSSIP,0,0,1,2,0,@GOREGEKSSHACKLE,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Gorekeks Shackles'),
(15,@EH_GOSSIP,0,0,1,28,0,12529,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has completed Quest The Ape Hunters Slave'),
(15,@EH_GOSSIP,0,0,3,2,0,@GOREGEKSSHACKLE,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Gorekeks Shackles'),
(15,@EH_GOSSIP,0,0,3,9,0,12530,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has Taken Quest Tormenting the Softknuckles'),
(15,@EH_GOSSIP,0,0,4,2,0,@GOREGEKSSHACKLE,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Gorekeks Shackles'),
(15,@EH_GOSSIP,0,0,4,8,0,12530,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has Rewarded Quest Tormenting the Softknuckles'),
(15,@EH_GOSSIP,0,0,5,2,0,@GOREGEKSSHACKLE,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Gorekeks Shackles'),
(15,@EH_GOSSIP,0,0,5,28,0,12530,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has completed Quest Tormenting the Softknuckles'),
(15,@EH_GOSSIP,0,0,0,14,0,12533,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Wasp Hunters Apprentice'),
(15,@EH_GOSSIP,0,0,1,14,0,12533,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Wasp Hunters Apprentice'),
(15,@EH_GOSSIP,0,0,2,14,0,12533,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Wasp Hunters Apprentice'),
(15,@EH_GOSSIP,0,0,3,14,0,12533,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Wasp Hunters Apprentice'),
(15,@EH_GOSSIP,0,0,4,14,0,12533,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Wasp Hunters Apprentice'),
(15,@EH_GOSSIP,0,0,5,14,0,12533,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Wasp Hunters Apprentice'),
(15,@EH_GOSSIP,0,0,0,14,0,12534,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Underground Menace '),
(15,@EH_GOSSIP,0,0,1,14,0,12534,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Underground Menace '),
(15,@EH_GOSSIP,0,0,2,14,0,12534,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Underground Menace '),
(15,@EH_GOSSIP,0,0,3,14,0,12534,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Underground Menace '),
(15,@EH_GOSSIP,0,0,4,14,0,12534,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Underground Menace '),
(15,@EH_GOSSIP,0,0,5,14,0,12534,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest The Underground Menace '),
(15,@EH_GOSSIP,2,0,0,2,0,@DAJIKSCHALK,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Dajiks Worn Chalk'),
(15,@EH_GOSSIP,2,0,0,9,0,12533,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has Taken Quest The Wasp Hunters Apprentice'),
(15,@EH_GOSSIP,2,0,2,2,0,@DAJIKSCHALK,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Dajiks Worn Chalk'),
(15,@EH_GOSSIP,2,0,2,8,0,12533,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has Rewarded Quest The Wasp Hunters Apprentice'),
(15,@EH_GOSSIP,2,0,1,2,0,@DAJIKSCHALK,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Dajiks Worn Chalk'),
(15,@EH_GOSSIP,2,0,1,28,0,12533,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has completed Quest The Wasp Hunters Apprentice'),
(15,@EH_GOSSIP,2,0,3,2,0,@DAJIKSCHALK,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Dajiks Worn Chalk'),
(15,@EH_GOSSIP,2,0,3,9,0,12534,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has Taken Quest The Underground Menace'),
(15,@EH_GOSSIP,2,0,4,2,0,@DAJIKSCHALK,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Dajiks Worn Chalk'),
(15,@EH_GOSSIP,2,0,4,8,0,12534,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has Rewarded Quest The Underground Menace'),
(15,@EH_GOSSIP,2,0,5,2,0,@DAJIKSCHALK,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Dajiks Worn Chalk'),
(15,@EH_GOSSIP,2,0,5,28,0,12534,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has completed Quest The Underground Menace'),
(15,@EH_GOSSIP,2,0,0,14,0,12536,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest A Rough Ride'),
(15,@EH_GOSSIP,2,0,1,14,0,12536,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest A Rough Ride'),
(15,@EH_GOSSIP,2,0,2,14,0,12536,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest A Rough Ride'),
(15,@EH_GOSSIP,2,0,3,14,0,12536,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest A Rough Ride'),
(15,@EH_GOSSIP,2,0,4,14,0,12536,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest A Rough Ride'),
(15,@EH_GOSSIP,2,0,5,14,0,12536,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest A Rough Ride'),
(15,@EH_GOSSIP,4,0,0,2,0,@ZEPIKSHUNTINGHORN,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Zepiks Hunting Horn'),
(15,@EH_GOSSIP,4,0,0,9,0,12536,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has Taken Quest A Rough Ride'),
(15,@EH_GOSSIP,4,0,2,2,0,@ZEPIKSHUNTINGHORN,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Zepiks Hunting Horn'),
(15,@EH_GOSSIP,4,0,2,8,0,12536,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has Rewarded Quest A Rough Ride'),
(15,@EH_GOSSIP,4,0,1,2,0,@ZEPIKSHUNTINGHORN,1,1,1,0,0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Zepiks Hunting Horn'),
(15,@EH_GOSSIP,4,0,1,28,0,12536,0,0,0,0,0, '', 'Elder Harkek - Show Gossip if player Has completed Quest A Rough Ride'),
(15,@EH_GOSSIP,4,0,0,8,0,12539,0,0,1,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest Hoofing It'),
(15,@EH_GOSSIP,4,0,1,8,0,12539,0,0,1,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest Hoofing It'),
(15,@EH_GOSSIP,4,0,2,8,0,12539,0,0,1,0,0, '', 'Elder Harkek - Show Gossip if player Has not completed Quest Hoofing It');
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@EH_GOSSIP,1,0,8,12692,0,0,0,0, '', 'Elder Harkek - Show gossip option only if player has rewarded quest Return of the Lich Hunter'),
(15,@EH_GOSSIP,1,0,5,1104,224,0,0,0, '', 'Elder Harkek - Show gossip option only if player is at least honored with Frenzheart Tribe'),
(15,@EH_GOSSIP,1,0,2,@GOREGEKSSHACKLE,1,0,1,0, '', 'Elder Harkek - Show gossip option only if player has no item Goregek''s Shackles'),
(15,@EH_GOSSIP,3,0,8,12692,0,0,0,0, '', 'Elder Harkek - Show gossip option only if player has rewarded quest Return of the Lich Hunter'),
(15,@EH_GOSSIP,3,0,5,1104,224,0,0,0, '', 'Elder Harkek - Show gossip option only if player is at least honored with Frenzheart Tribe'),
(15,@EH_GOSSIP,3,0,2,@DAJIKSCHALK,1,0,1,0, '', 'Elder Harkek - Show gossip option only if player has no item Dajiks Worn Chalk'),
(15,@EH_GOSSIP,5,0,8,12692,0,0,0,0, '', 'Elder Harkek - Show gossip option only if player has rewarded quest Return of the Lich Hunter'),
(15,@EH_GOSSIP,5,0,5,1104,224,0,0,0, '', 'Elder Harkek - Show gossip option only if player is at least honored with Frenzheart Tribe'),
(15,@EH_GOSSIP,5,0,2,@ZEPIKSHUNTINGHORN,1,0,1,0, '', 'Elder Harkek - Show gossip option only if player has no item Zepiks Hunting Horn');
-- Jaloot's Itensity and Blessing of the Sparkling Hare don't stack
DELETE FROM `spell_group` WHERE `id`=@BLESSINGOFTHESPARKINGHARE;
INSERT INTO `spell_group` (`id`,`spell_id`) VALUES 
(@BLESSINGOFTHESPARKINGHARE,@BLESSINGOFTHESPARKINGHARE),
(@BLESSINGOFTHESPARKINGHARE,@JALOOTSINTENSITY);

DELETE FROM `spell_group_stack_rules` WHERE `group_id`=@BLESSINGOFTHESPARKINGHARE;
INSERT INTO `spell_group_stack_rules` (`group_id`,`stack_rule`) VALUES 
(@BLESSINGOFTHESPARKINGHARE,1);

DELETE FROM `creature_template_addon` WHERE `entry`IN(@GLINTINGDIRT,@LAFOO,@JALOOT,@MOODLE,@GLINTINGBUG,@GOREGEK,@DAJIK,@ZEPIK);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(@GLINTINGBUG, 0, 0, 0, 1, 0, '51444'),
(@GOREGEK, 0, 0, 0, 1, 0,'54178'),
(@DAJIK, 0, 0, 0, 1, 0,'52734'),
(@ZEPIK, 0, 0, 0, 1, 0,'54176');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=@SEEINVIS AND `spell_effect`=@LOOKINGFORTREASUREAURA;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES 
(@SEEINVIS, @LOOKINGFORTREASUREAURA, 2, 'Looking for treasure aura triggered by Rainspeaker Treasures: See Invisibility');

DELETE FROM `spell_area` WHERE `spell`=@SEEINVIS;
DELETE FROM `spell_area` WHERE `spell`=@ANGRYGORLOCCREDIT;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE  `entry`=@GLINTINGDIRT;
DELETE FROM `smart_scripts` WHERE `entryorguid` =@GLINTINGDIRT;
DELETE FROM `smart_scripts` WHERE `entryorguid` BETWEEN @GLINTINGDIRTSCRIPT AND @GLINTINGDIRTSCRIPT+5;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GLINTINGDIRT,0,0 ,0,38, 0,100,1,1,1,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - On Data Set - Increment Phase'),
(@GLINTINGDIRT,0,1 ,0,1, 1,100,1,0,0,0,0,87,@GLINTINGDIRTSCRIPT,@GLINTINGDIRTSCRIPT+1,@GLINTINGDIRTSCRIPT+2,@GLINTINGDIRTSCRIPT+3,@GLINTINGDIRTSCRIPT+4,@GLINTINGDIRTSCRIPT+5,1,0,0,0,0,0,0,0, 'Glinting Dirt - OOC (Phase 2)  - Run Random Script'),
(@GLINTINGDIRT,0,2 ,0,1, 1,40,1,100,300,3500,3500,11,@DIGUPGLINTINGBUG,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - OOC (Phase 2)  - Cast Dig up Glinting Bug'),
(@GLINTINGDIRT,0,3 ,0,1, 1,40,1,100,300,3500,3500,11,@DIGUPGLINTINGBUG,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - OOC (Phase 2)  - Cast Dig up Glinting Bug'),
(@GLINTINGDIRT,0,4 ,0,1, 1,40,1,100,300,3500,3500,11,@DIGUPGLINTINGBUG,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - OOC (Phase 2)  - Cast Dig up Glinting Bug'),
(@GLINTINGDIRT,0,5 ,0,1, 1,100,1,400,400,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - OOC (Phase 2)  - Despawn'),
(@GLINTINGDIRT,0,6 ,0,11, 0,100,0,0,0,0,0,11,@INVISIBILTY,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - On Spawn  - Cast Rainspeaker Treasures: Invisibility'),
(@GLINTINGDIRTSCRIPT,9,0 ,0,0, 0,100,0,5000,5000,0,0,11,@DIGUPSPARKINGHARE,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Cast Dig Up Sparking Hare'),
(@GLINTINGDIRTSCRIPT,9,1 ,0,0, 0,100,0,5500,5500,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Despawn'),
(@GLINTINGDIRTSCRIPT+1,9,0 ,0,0, 0,100,0,5000,5000,0,0,11,@DIGUPSHININGCRYSTAL,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Cast Dig Up Shining Crystal'),
(@GLINTINGDIRTSCRIPT+1,9,1 ,0,0, 0,100,0,5500,5500,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Despawn'),
(@GLINTINGDIRTSCRIPT+2,9,0 ,0,0, 0,100,0,5000,5000,0,0,11,@DIGUPGLINTINGARMOR,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Cast Dig Up Glinting Armor'),
(@GLINTINGDIRTSCRIPT+2,9,1 ,0,0, 0,100,0,5500,5500,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Despawn'),
(@GLINTINGDIRTSCRIPT+3,9,0 ,0,0, 0,100,0,5000,5000,0,0,11,@DIGUPGLOWINGGEM,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Cast Dig Up Glowing Gem'),
(@GLINTINGDIRTSCRIPT+3,9,1 ,0,0, 0,100,0,5500,5500,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Despawn'),
(@GLINTINGDIRTSCRIPT+4,9,0 ,0,0, 0,100,0,5000,5000,0,0,11,@DIGUPPOLISHEDPLATTER,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Cast Dig Up Polished Platter'),
(@GLINTINGDIRTSCRIPT+4,9,1 ,0,0, 0,100,0,5500,5500,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Despawn'),
(@GLINTINGDIRTSCRIPT+5,9,0 ,0,0, 0,100,0,5000,5000,0,0,11,@DIGUPSPARKINGTREASURE,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Cast Dig Up Sparking Treasure'),
(@GLINTINGDIRTSCRIPT+5,9,1 ,0,0, 0,100,0,5500,5500,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Dirt - Script  - Despawn');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN(@RAINSPEAKERBUNNY,@FRENZYBUNNY,@MOSSWALKERBUNNY,@MISTWHISPERBUNNY,@SPEARBORNBUNNY,@KARTAKHOLDBUNNY,@SPARKTOUCHEDBUNNY,@SAPPHIREHIVEBUNNY,@LIFEBLOODPILLARBUNNY,@SKYREACHPILLARBUNNY);
UPDATE `creature_template` SET `AIName`= 'SmartAI',`unit_flags`=32776,`InhabitType`=3 WHERE  `entry`In(@LAFOO,@MOODLE,@JALOOT,@GOREGEK,@DAJIK,@ZEPIK);
UPDATE `creature_template` SET `gossip_menu_id`=9747, `npcflag`=`npcflag`|1, `speed_run`=1.30952 WHERE `entry`=@JALOOT;
UPDATE `creature_template` SET `npcflag`=`npcflag`|1, `speed_run`=1.19048 WHERE `entry`=@MOODLE;
UPDATE `gossip_menu_option` SET `action_menu_id`=9684 WHERE `menu_id`=9677;
UPDATE `creature_template` SET `gossip_menu_id`=9745 WHERE `entry`=28106;
UPDATE `creature_template` SET `speed_walk`=0.66667, `speed_run`=0.99206 WHERE `entry`=@GOREGEK;
UPDATE `creature_template` SET `speed_walk`=0.66667, `speed_run`=0.99206, `npcflag`=`npcflag`|1 WHERE `entry`=@ZEPIK;
UPDATE `gossip_menu_option` SET `action_menu_id`=9684 WHERE `menu_id`=9677;
DELETE FROM `creature_involvedrelation` WHERE  `id`=28216 AND `quest`=12582;

DELETE FROM `gossip_menu` WHERE `entry`=9747;
DELETE FROM `gossip_menu` WHERE `entry`=9562 AND `text_id`=12883;
DELETE FROM `gossip_menu` WHERE `entry`=9570 AND `text_id`=12905;
DELETE FROM `gossip_menu` WHERE `entry`=9678 AND `text_id`=13136;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(9562,12883),
(9570,12905),
(9678,13136),
(9747,13367);

DELETE FROM `npc_text` WHERE `ID`=13136;
INSERT INTO `npc_text` (`ID`,`text0_0`,`text0_1`,`lang0`,`prob0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`text1_0`,`text1_1`,`lang1`,`prob1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`text2_0`,`text2_1`,`lang2`,`prob2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`text3_0`,`text3_1`,`lang3`,`prob3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`text4_0`,`text4_1`,`lang4`,`prob4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`text5_0`,`text5_1`,`lang5`,`prob5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`text6_0`,`text6_1`,`lang6`,`prob6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`text7_0`,`text7_1`,`lang7`,`prob7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`,`WDBVerified`) VALUES
(13136,'Vekjik no want to be bothered.','',0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,12340);

DELETE FROM `creature_equip_template` WHERE `entry` IN (@GOREGEK,@DAJIK,@ZEPIK);
INSERT INTO `creature_equip_template` (`entry`,`id`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES
(@GOREGEK,1,36488,0,0),
(@DAJIK,1,28325,0,0),
(@ZEPIK,1,28914,0,5258);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(@LAFOO,@MOODLE,@JALOOT,@GOREGEK,@DAJIK,@ZEPIK,@GORLOCTREASURESCRIPT,@RAINSPEAKERBUNNY,@FRENZYBUNNY,@MOSSWALKERBUNNY,@MISTWHISPERBUNNY,@SPEARBORNBUNNY,@KARTAKHOLDBUNNY,@SPARKTOUCHEDBUNNY,@SAPPHIREHIVEBUNNY,@LIFEBLOODPILLARBUNNY,@SKYREACHPILLARBUNNY);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GOREGEK,0,0 ,0,11,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On Spawn - Set React State'),
(@GOREGEK,0,1,0,8,0,100,0,@FRENZYAURA,0,45000,70000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On spellhit - Say line'),
(@GOREGEK,0,2,0,8,0,100,0,@DESSAWNRETAINER,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On spellhit - Despawn'),
(@GOREGEK,0,3,0,0,0,100,0,3000,6000,8000,16000,11,54188,2,0,0,0,0,5,0,0,0,0,0,0,0, 'Goregek - IC - Cast Sunder Armor'),
(@GOREGEK,0,4,0,0,0,100,0,5000,8000,15000,20000,11,52743,2,0,0,0,0,2,0,0,0,0,0,0,0, 'Goregek - IC - Cast Head Smack'),
(@GOREGEK,0,5,0,2,0,100,0,0,30,60000,60000,11,52748,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On Less than 30% HP - Cast Voracious Appetite'),
(@GOREGEK,0,6,0,13,0,100,0,12000,20000,0,0,11,6713,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On Target Casting - Cast Disarm'),
(@GOREGEK,0,7 ,0,5,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On Creature Death - Say'),
(@GOREGEK,0,8 ,0,1,0,100,0,10000,40000,45000,90000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Gorekek - OOC - Say'),
(@GOREGEK,0,9 ,0,11,0,100,0,0,0,0,0,11,@WOLVARLOCATIONPERIODIC,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On Spawn - Cast Wolvar Location Periodic'),
(@GOREGEK,0,10 ,0,11,0,100,0,0,0,0,0,11,@SHOLAZARGUARDIANHEARTBEAT,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On Spawn - Cast Sholazar Guardian Heartbeat'),
(@GOREGEK,0,11 ,0,1,0,100,0,10000,40000,45000,90000,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Gorekek - OOC - Say'),
(@GOREGEK,0,12 ,0,1,0,100,0,10000,10000,10000,10000,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - OOC - Set Phase 2'),
(@GOREGEK,0,13 ,0,4,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On Agro - Set Phase 1'),
(@GOREGEK,0,14 ,0,38,0,100,0,1,1,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On Data Set - Say'),
(@GOREGEK,0,15,0,8,2,100,0,@KARTAKHOLDAURA,0,40000,70000,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - On spellhit - Say line'),
(@GOREGEK,0,16,0,8,2,100,0,@CHICKENLOCATIONPING,0,6000,10000,11,@CHICKENNET,0,0,0,0,0,19,@CHICKENESCAPEE,5,0,0,0,0,0, 'Goregek - On spellhit - Cast Chicken Net'),
(@DAJIK,0,0 ,0,11,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On Spawn - Set React State'),
(@DAJIK,0,1,0,8,0,100,0,@FRENZYAURA,0,45000,70000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On spellhit - Say line'),
(@DAJIK,0,2,0,8,0,100,0,@DESSAWNRETAINER,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On spellhit - Despawn'),
(@DAJIK,0,3,0,0,0,100,0,3000,6000,8000,12000,11,54195,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Dajik - IC - Cast Earth''s Wrath'),
(@DAJIK,0,4,0,0,0,100,0,5000,8000,15000,20000,11,54193,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Dajik - IC - Cast Earth''s Fury'),
(@DAJIK,0,5,0,2,0,100,0,0,30,60000,60000,11,54206,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On Less than 30% HP - Cast Mend'),
(@DAJIK,0,6 ,0,5,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On Creature Death - Say'),
(@DAJIK,0,8 ,0,1,0,100,0,10000,40000,45000,90000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - OOC - Say'),
(@DAJIK,0,9,0,8,2,100,0,@SAPPHIREHIVEAURA,0,40000,70000,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On spellhit - Say line'),
(@DAJIK,0,10 ,0,11,0,100,0,0,0,0,0,11,@WOLVARLOCATIONPERIODIC,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On Spawn - Cast Wolvar Location Periodic'),
(@DAJIK,0,11 ,0,11,0,100,0,0,0,0,0,11,@SHOLAZARGUARDIANHEARTBEAT,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik -Goregek - On Spawn - Cast Sholazar Guardian Heartbeat'),
(@DAJIK,0,12 ,0,38,0,100,0,1,1,0,0,1,4,5000,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On Creature Death (Sapphire Queen) - Say'),
(@DAJIK,0,13 ,0,38,0,100,0,1,2,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On Creature Death (Serfex the Reaver) - Say'),
(@DAJIK,0,14 ,0,1,0,100,0,10000,10000,10000,10000,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - OOC - Set Phase 2'),
(@DAJIK,0,15 ,0,4,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On Agro - Set Phase 1'),
(@DAJIK,0,16 ,0,52,0,100,0,4,@DAJIK,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik On - Text Over - Say'),
(@DAJIK,0,17,0,8,2,100,0,@SKYREACHPILLARAURA,0,40000,70000,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On spellhit - Say line'),
(@DAJIK,0,18 ,0,1,0,100,0,10000,40000,45000,90000,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - OOC - Say'),
(@DAJIK,0,19,0,8,2,100,0,@LIFEBLOODPILLARAURA,0,40000,70000,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dajik - On spellhit - Say line'),
(@DAJIK,0,20,0,8,2,100,0,@CHICKENLOCATIONPING,0,6000,10000,11,@CHICKENNET,0,0,0,0,0,19,@CHICKENESCAPEE,5,0,0,0,0,0, 'Dajik - On spellhit - Cast Chicken Net'),
(@ZEPIK,0,0 ,0,11,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - On Spawn - Set React State'),
(@ZEPIK,0,1,0,8,0,100,0,@FRENZYAURA,0,45000,70000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - On spellhit - Say line'),
(@ZEPIK,0,2,0,8,0,100,0,@DESSAWNRETAINER,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - On spellhit - Despawn'),
(@ZEPIK,0,3,0,0,0,100,0,4000,7000,15000,18000,11,52761,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Zepik the Gorloc Hunter - IC - Cast Barbed Net'),
(@ZEPIK,0,4,0,0,0,100,0,5000,8000,12000,15000,11,52889,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Zepik the Gorloc Hunter - IC - Cast Envenomed Shot'),
(@ZEPIK,0,5,0,0,0,100,0,0,6000,15000,18000,11,52873,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Zepik the Gorloc Hunter - IC - Cast Open Wound'),
(@ZEPIK,0,6,0,0,0,100,0,3000,5000,3000,7000,11,52758,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Zepik the Gorloc Hunter - IC - Cast Piercing Arrow'),
(@ZEPIK,0,7,0,2,0,100,0,0,30,60000,60000,11,52895,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik the Gorloc Hunter - On Less than 30% HP Cast Bandage - Cast Bandage'),
(@ZEPIK,0,8 ,0,5,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - On Creature Death - Say'),
(@ZEPIK,0,9 ,0,1,0,100,0,10000,40000,45000,90000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - OOC - Say'),
(@ZEPIK,0,10,0,8,2,100,0,@MISTWHISPERAURA,0,40000,70000,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - On spellhit - Say line'),
(@ZEPIK,0,11 ,0,11,0,100,0,0,0,0,0,11,@WOLVARLOCATIONPERIODIC,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - On Spawn - Cast Wolvar Location Periodic'),
(@ZEPIK,0,12 ,0,11,0,100,0,0,0,0,0,11,@SHOLAZARGUARDIANHEARTBEAT,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - On Spawn - Cast Sholazar Guardian Heartbeat'),
(@ZEPIK,0,13 ,0,1,0,100,0,10000,10000,10000,10000,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Goregek - OOC - Set Phase 2'),
(@ZEPIK,0,14 ,0,4,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - On Agro - Set Phase 1'),
(@ZEPIK,0,15 ,0,38,0,100,0,1,2,0,0,1,4,5000,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - On Data Set - Say'),
(@ZEPIK,0,16 ,0,52,0,100,0,4,@ZEPIK,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Zepik - On Text Over - Say'),
(@ZEPIK,0,17,0,8,2,100,0,@CHICKENLOCATIONPING,0,6000,10000,11,@CHICKENNET,0,0,0,0,0,19,@CHICKENESCAPEE,5,0,0,0,0,0, 'Zepik - On spellhit - Cast Chicken Net'),
(@LAFOO,0,0 ,1,8, 2,100,1,@TREASUREPING,0,60000,60000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - On Spellhit - Say'),
(@LAFOO,0,1 ,0,61, 0,100,0,0,0,0,0,80,@GORLOCTREASURESCRIPT,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - Linked with Previous Event - Run Script'),
(@LAFOO,0,2 ,0,11,0,100,0,0,0,0,0,11,@GORLOCLOCATIONPERIODIC,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - On Spawn - Cast Gorloc Location Periodic'),
(@LAFOO,0,3 ,0,11,0,100,0,0,0,0,0,11,@SHOLAZARGUARDIANHEARTBEAT,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - On Spawn - Cast Sholazar Guardian Heartbeat'),
(@LAFOO,0,4 ,0,38, 0,100,0,1,1,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - On Data Set - Say'),
(@GORLOCTREASURESCRIPT,9,0 ,0,61, 0,100,0,0,0,0,0,69,0,0,0,0,0,0,11,28362,10,0,0,0,0,0, 'Lafoo - Script  - Move to Glinting Dirt'),
(@GORLOCTREASURESCRIPT,9,1 ,0,61, 0,100,0,1000,1000,0,0,45,1,1,0,0,0,0,9,@GLINTINGDIRT,0,2,0,0,0,0, 'Lafoo - Script  - Set Data'),
(@GORLOCTREASURESCRIPT,9,2 ,0,61, 0,100,0,1500,1500,0,0,11,51405,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - Script  - Cast Digging for Treasure'),
(@GORLOCTREASURESCRIPT,9,3 ,0,61, 0,100,0,5000,5000,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - Script  - Evade'),
(@LAFOO,0,6 ,0,0, 0,100,0,0,5000,10000,12000,11,52931,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Lafoo - IC - Cast Toxic Spit'),
(@LAFOO,0,7 ,0,2,0,100,0,0,50,60000,60000,11,52940,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - On Friendly Health - Cast Sleepy Time'),
(@LAFOO,0,8 ,0,11,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - On Spawn - Set React State'),
(@LAFOO,0,9 ,0,5,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - On Creature Death - Say'),
(@LAFOO,0,10 ,0,1,0,100,0,10000,40000,45000,90000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - OOC - Say'),
(@LAFOO,0,11,0,8,0,100,0,@RAINSPEAKERAURA,0,45000,70000,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - On spellhit - Say line'),
(@LAFOO,0,12,0,8,0,100,0,@DESSAWNRETAINER,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - On spellhit - Despawn'),
(@LAFOO,0,13,0,19,0,100,0,12572,0,0,0,85,@SEEINVIS,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Lafoo - On Quest Accept - Invoker Cast Rainspeaker Treasures: See Invisibility'),
(@LAFOO,0,14 ,0,1,0,100,0,10000,10000,10000,10000,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - OOC - Set Phase 2'),
(@LAFOO,0,15 ,0,4,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lafoo - On Agro - Set Phase 1'),
(@JALOOT,0,0 ,1,8, 2,100,1,@TREASUREPING,0,60000,60000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On Spellhit - Say'),
(@JALOOT,0,1 ,0,61, 0,100,0,0,0,0,0,80,@GORLOCTREASURESCRIPT,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - Linked with Previous Event - Run Script'),
(@JALOOT,0,2 ,0,11,0,100,0,0,0,0,0,11,@GORLOCLOCATIONPERIODIC,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On Spawn - Cast Gorloc Location Periodic'),
(@JALOOT,0,3 ,0,11,0,100,0,0,0,0,0,11,@SHOLAZARGUARDIANHEARTBEAT,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On Spawn - Cast Sholazar Guardian Heartbeat'),
(@JALOOT,0,4 ,0,38, 0,100,0,1,1,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On Data Set - Say'),
(@JALOOT,0,6,0,0,0,100,0,9000,15000,20000,25000,11,52943,2,0,0,0,0,5,0,0,0,0,0,0,0, 'Jaloot - IC - Cast Lightning Whirl'),
(@JALOOT,0,7,0,0,0,100,0,5000,8000,15000,18000,11,52944,2,0,0,0,0,5,0,0,0,0,0,0,0, 'Jaloot - IC - Cast Lightning Strike'),
(@JALOOT,0,8,0,0,0,100,0,7000,15000,20000,25000,11,52964,2,0,0,0,0,5,0,0,0,0,0,0,0, 'Jaloot - IC - Cast Spark Frenzy'),
(@JALOOT,0,9,0,2,0,100,0,0,30,30000,45000,11,52969,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On Less than 30% HP - Cast Energy Siphon'),
(@JALOOT,0,10 ,0,11,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On Spawn - Set React State'),
(@JALOOT,0,11 ,0,5,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On Creature Death - Say'),
(@JALOOT,0,12 ,0,1,0,100,0,10000,40000,45000,90000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - OOC - Say'),
(@JALOOT,0,13,0,8,0,100,0,@RAINSPEAKERAURA,0,45000,70000,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On spellhit - Say line'),
(@JALOOT,0,14,0,11,0,100,0,0,0,0,0,11,@JALOOTSINTENSITY,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On Spawn - Cast Jaloot''s Intensity'),
(@JALOOT,0,15,0,8,0,100,0,@DESSAWNRETAINER,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On spellhit - Despawn'),
(@JALOOT,0,16,0,8,2,100,0,@SPEARBORNAURA,0,40000,70000,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On spellhit - Say line'),
(@JALOOT,0,17 ,0,1,0,100,0,10000,10000,10000,10000,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - OOC - Set Phase 2'),
(@JALOOT,0,18 ,0,4,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Jaloot - On Agro - Set Phase 1'),
(@MOODLE,0,0 ,1,8, 2,100,1,@TREASUREPING,0,60000,60000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On Spellhit - Say'),
(@MOODLE,0,1 ,0,61, 0,100,0,0,0,0,0,80,@GORLOCTREASURESCRIPT,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - Linked with Previous Event - Run Script'),
(@MOODLE,0,2 ,0,11,0,100,0,0,0,0,0,11,@GORLOCLOCATIONPERIODIC,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On Spawn - Cast Gorloc Location Periodic'),
(@MOODLE,0,3 ,0,11,0,100,0,0,0,0,0,11,@SHOLAZARGUARDIANHEARTBEAT,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On Spawn - Cast Sholazar Guardian Heartbeat'),
(@MOODLE,0,4 ,0,0, 0,100,0,0,5000,20000,30000,11,52974,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - IC - Cast Vicious Roar'),
(@MOODLE,0,5 ,0,20, 0,100,0,12580,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On Quest Complete - Say'),
(@MOODLE,0,6 ,0,0, 0,100,0,0,5000,20000,24000,11,52973,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Moodle - IC - Cast Frost Breath'),
(@MOODLE,0,7,0,0,0,100,0,9000,15000,20000,25000,11,52979,0,0,0,0,0,5,0,0,0,0,0,0,0, 'Moodle - IC - Cast Whirlwind'),
(@MOODLE,0,8,0,0,0,100,0,2000,10000,40000,50000,11,52972,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - IC - Cast Dispersal'),
(@MOODLE,0,9 ,0,2,0,100,0,0,50,60000,60000,11,52979,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On less than 50% HP - Cast Frigid Absorbtion'),
(@MOODLE,0,10 ,0,11,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On Spawn - Set React State'),
(@MOODLE,0,11 ,0,5,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On Creature Death - Say'),
(@MOODLE,0,12 ,0,1,0,100,0,10000,40000,45000,90000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - OOC - Say'),
(@MOODLE,0,13,0,8,0,100,0,@RAINSPEAKERAURA,0,45000,70000,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On spellhit - Say line'),
(@MOODLE,0,14,0,8,0,100,1,@DESSAWNRETAINER,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On spellhit - Despawn'),
(@MOODLE,0,15,0,8,2,100,0,@MOSSWALKERAURA,0,40000,70000,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On spellhit - Say line'),
(@MOODLE,0,16 ,0,61, 0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - Linked with Previous Event - Run Passive'),
(@MOODLE,0,17 ,0,19, 0,100,0,12581,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On Quest Accept - Say'),
(@MOODLE,0,18 ,0,1,0,100,0,10000,10000,10000,10000,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - OOC - Set Phase 2'),
(@MOODLE,0,19 ,0,4,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moodle - On Agro - Set Phase 1'),
(@RAINSPEAKERBUNNY,0,0,0,10,0,100,0,1,150,10000,10000,11,@RAINSPEAKERAURA,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Rainspeaker Canopy Bunny - On update OOC - Spellcast Rainspeaker Canopy Aura'),
(@FRENZYBUNNY,0,0,0,10,0,100,0,1,150,10000,10000,11,@FRENZYAURA,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Frenzyheart Hill Bunny - On update OOC - Spellcast Frenzyheart Hill Aura'),
(@MOSSWALKERBUNNY,0,0,0,10,0,100,0,1,200,10000,10000,11,@MOSSWALKERAURA,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Mosswalker Village Bunny - On update OOC - Spellcast Mosswalker Village Aura'),
(@MOSSWALKERBUNNY,0,1,0,10,0,100,0,1,200,1000,1000,85,@ANGRYGORLOCCREDIT,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Mosswalker Village Bunny - On update OOC - Cast quest credit'),
(@MISTWHISPERBUNNY,0,0,0,10,0,100,0,1,200,10000,10000,11,@MISTWHISPERAURA,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Mistwhisper Refuge Bunny - On update OOC - Spellcast Mistwhisper Refuge Aura'),
(@SPEARBORNBUNNY,0,0,0,10,0,100,0,1,200,10000,10000,11,@SPEARBORNAURA,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Spearborn Encampment Bunny - On update OOC - Spellcast Spearborn Encampment Aura'),
(@KARTAKHOLDBUNNY,0,0,0,10,0,100,0,1,200,10000,10000,11,@KARTAKHOLDAURA,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Kartak Hold Bunny - On update OOC - Spellcast Kartak Hold Aura'),
(@SPARKTOUCHEDBUNNY,0,0,0,10,0,100,0,1,200,10000,10000,11,@SPARKTOUCHEDAURA,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Sparktouched Haven Bunny - On update OOC - Spellcast Sparktouched Haven Aura'),
(@SAPPHIREHIVEBUNNY,0,0,0,10,0,100,0,1,200,10000,10000,11,@SAPPHIREHIVEAURA,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Sapphire Hive Bunny - On update OOC - Spellcast Sapphire Hive Aura'),
(@SKYREACHPILLARBUNNY,0,0,0,10,0,100,0,1,200,10000,10000,11,@SKYREACHPILLARAURA,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Skyreach Pillar Bunny - On update OOC - Spellcast Skyreach Pillar Aura'),
(@LIFEBLOODPILLARBUNNY,0,0,0,10,0,100,0,1,200,10000,10000,11,@LIFEBLOODPILLARAURA,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Lifeblood Pillar Bunny - On update OOC - Spellcast Lifeblood Pillar Aura');

UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE  `entry`=@SPARKLINGHARE;
DELETE FROM `smart_scripts` WHERE `entryorguid` =@SPARKLINGHARE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@SPARKLINGHARE,0,0 ,0,6, 0,100,0,0,0,0,0,11,@BLESSINGOFTHESPARKINGHARE,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Sparking Hare - On Death - Cast Blessing of the Sparkling Hare');

UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE  `entry`=@GLINTINGBUG;
DELETE FROM `smart_scripts` WHERE `entryorguid` =@GLINTINGBUG;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GLINTINGBUG,0,0 ,0,11, 0,100,0,0,0,0,0,89,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Glinting Bug - On Spawn - Set Random Movement');

DELETE FROM `creature_text` WHERE `entry` IN(@LAFOO,@JALOOT,@MOODLE,@GOREGEK,@DAJIK,@ZEPIK);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@LAFOO, 0, 0, 'Ooh! Shinies!', 12, 0, 18, 0, 0, 0, 'Lafoo'),
(@LAFOO, 0, 1, 'Maybe more shiny bugs! We like bugs!', 12, 0, 17, 0, 0, 0, 'Lafoo'),
(@LAFOO, 0, 2, 'Treasure for Lafoo! Treasure for shrine!', 12, 0, 17, 0, 0, 0, 'Lafoo'),
(@LAFOO, 0, 3, 'Dig, dig, dig...', 12, 0, 16, 0, 0, 0, 'Lafoo'),
(@LAFOO, 0, 4, 'Crunchy bugs so delicious. Want?', 12, 0, 16, 0, 0, 0, 'Lafoo'),
(@LAFOO, 0, 5, 'That weird. Someone took our bugs. You have maybe?', 12, 0, 16, 0, 0, 0, 'Lafoo'),
(@LAFOO, 1, 0, 'No come back this time!', 12, 0, 100, 0, 0, 0, 'Lafoo'),
(@LAFOO, 2, 0, 'One day maybe you can be Soo-dryskin. You like?', 12, 0, 20, 0, 0, 0, 'Lafoo'),
(@LAFOO, 2, 1, 'You have pie? Someone gave us pie year ago. Really yummy.', 12, 0, 20, 0, 0, 0, 'Lafoo'),
(@LAFOO, 2, 2, 'Big comfy tree. Good Home.', 12, 0, 20, 0, 0, 0, 'Lafoo'),
(@LAFOO, 2, 3, 'Never meet Great Ones. Nope, just met their shrines.', 12, 0, 20, 0, 0, 0, 'Lafoo'),
(@LAFOO, 2, 4, 'You got funny looking eyeballs.', 12, 0, 20, 0, 0, 0, 'Lafoo'),
(@LAFOO, 3, 0, 'Home good, but not stay long! More adventures!.', 12, 0, 100, 0, 0, 0, 'Lafoo'),
(@LAFOO, 4, 0, 'Hiss... hiss... dead. All dead', 12, 0, 100, 0, 0, 0, 'Lafoo'),
(@JALOOT, 0, 0, 'Shiny things! Shiny things! Not as shiny as my crystal, but still shiny!', 12, 0, 25, 0, 0, 0, 'Jaloot'),
(@JALOOT, 0, 1, 'More treasures! Treasures of all kinds! Yay treasures!', 12, 0, 25, 0, 0, 0, 'Jaloot'),
(@JALOOT, 0, 2, 'Can never have too many shiny crystals! Nope!', 12, 0, 25, 0, 0, 0, 'Jaloot'),
(@JALOOT, 0, 3, 'We are fast digger! Really fast! See... all done! That was fast, huh?', 12, 0, 25, 0, 0, 0, 'Jaloot'),
(@JALOOT, 1, 0, 'You like that? Bet not! Bet not cause you dead! Hahah!', 12, 0, 34, 0, 0, 0, 'Jaloot'),
(@JALOOT, 1, 1, 'Vic...tor...ious! Dun nun nun dun da da!', 12, 0, 33, 0, 0, 0, 'Jaloot'),
(@JALOOT, 1, 2, 'Killing Spree!', 12, 0, 33, 0, 0, 0, 'Jaloot'),
(@JALOOT, 2, 0, 'Mistcaller really good at controlling weather with shrine. They know just which crystals to use! Really good!', 12, 0, 16, 0, 0, 0, 'Jaloot'),
(@JALOOT, 2, 1, 'Ever trip over own feet? We have. Kind of hurt. No do it, not fun. Nope.', 12, 0, 16, 0, 0, 0, 'Jaloot'),
(@JALOOT, 2, 2, 'Want us to help with something? What we help with? We good at helping.', 12, 0, 16, 0, 0, 0, 'Jaloot'),
(@JALOOT, 2, 3, 'Hello! You''re pretty strong and nice and stuff. I like you. Lets stay friends, okay?', 12, 0, 16, 0, 0, 0, 'Jaloot'),
(@JALOOT, 2, 4, 'Misty. Very misty. Seem sort of misty to you? Maybe not so much.', 12, 0, 16, 0, 0, 0, 'Jaloot'),
(@JALOOT, 2, 5, 'Lets go jump off tree! Fun fun!', 12, 0, 15, 0, 0, 0, 'Jaloot'),
(@JALOOT, 3, 0, 'Chase the hatchlings! Chase the hatchlings! So fast!', 12, 0, 34, 0, 0, 0, 'Jaloot'),
(@JALOOT, 3, 1, 'Great Ones keep home safe because they like Oracles I think! They know we good and nice.', 12, 0, 33, 0, 0, 0, 'Jaloot'),
(@JALOOT, 3, 2, 'Home home home... place of the shinies!', 12, 0, 33, 0, 0, 0, 'Jaloot'),
(@JALOOT, 4, 0, 'We know you have dragon thing! We not scared! We going to get you and dragon thing!', 12, 0, 34, 0, 0, 0, 'Jaloot'),
(@JALOOT, 4, 1, 'Teach you to steal our treasures! Our treasures are... ours, okay?', 12, 0, 33, 0, 0, 0, 'Jaloot'),
(@JALOOT, 4, 2, 'Time to hide puppy-men! We are coming for you!', 12, 0, 33, 0, 0, 0, 'Jaloot'),
(@JALOOT, 5, 0, 'Tartek no match for you! You got the skills. Yeah!', 12, 0, 100, 0, 0, 0, 'Jaloot'),
(@MOODLE, 0, 0, 'What the heck are shiny rabbits doing here anyway?', 12, 0, 25, 0, 0, 0, 'Moodle'),
(@MOODLE, 0, 1, 'Here I am, digging up some useless bauble on the will of someone I just met...does that seem right to you?', 12, 0, 25, 0, 0, 0, 'Moodle'),
(@MOODLE, 0, 2, 'Hey, maybe we''ll find some more useless bugs!', 12, 0, 25, 0, 0, 0, 'Moodle'),
(@MOODLE, 0, 3, 'Yay... more dirt.', 12, 0, 25, 0, 0, 0, 'Moodle'),
(@MOODLE, 1, 0, 'I can''t believe ... they''re all ... dead', 12, 0, 50, 0, 0, 0, 'Moodle'),
(@MOODLE, 1, 1, 'Another one falls to our Onslaught, As it should be.', 12, 0, 50, 0, 0, 0, 'Moodle'),
(@MOODLE, 2, 0, 'There some reason why we''re still here? I''d love to hear it', 12, 0, 33, 0, 0, 0, 'Moodle'),
(@MOODLE, 2, 1, 'Yeah, let''s go now', 12, 0, 33, 0, 0, 0, 'Moodle'),
(@MOODLE, 2, 2, 'I''m done here', 12, 0, 34, 0, 0, 0, 'Moodle'),
(@MOODLE, 3, 0, 'Going to go take a nap? I apologize in advance for accidentally stepping on your face while you sleep.', 12, 0, 33, 0, 0, 0, 'Moodle'),
(@MOODLE, 3, 1, 'Planning to sit on your butt some more, or are we going to go do something that''s actually useful?', 12, 0, 34, 0, 0, 0, 'Moodle'),
(@MOODLE, 3, 2, 'Here I am, brain the size of a planet, and they ask me to take you to the other village. Call that job satisfaction? ''Cause I don''t.', 12, 0, 33, 0, 0, 0, 'Moodle'),
(@MOODLE, 4, 0, 'The Mosswalkers were good people... they did not deserve this.', 12, 0, 17, 0, 0, 0, 'Moodle'),
(@MOODLE, 4, 1, 'I know I talk down to them, but I never want to see any of my people die.', 12, 0, 17, 0, 0, 0, 'Moodle'),
(@MOODLE, 4, 2, 'It''s good to see some of the mosswalker were more resilient than I thought.', 12, 0, 17, 0, 0, 0, 'Moodle'),
(@MOODLE, 4, 3, 'It''s hard to believe any of them survived this.', 12, 0, 17, 0, 0, 0, 'Moodle'),
(@MOODLE, 4, 4, 'There are more that might still be alive! We need to keep moving.', 12, 0, 16, 0, 0, 0, 'Moodle'),
(@MOODLE, 4, 5, 'Where are they dragging those bodies? What are they doing to them?', 12, 0, 16, 0, 0, 0, 'Moodle'),
(@MOODLE, 5, 0, 'This fight''s all yours', 12, 0, 10, 0, 0, 0, 'Moodle'),
(@MOODLE, 6, 0, 'It''s a small comfort to see that they haven''t brought any back in undeath.', 12, 0, 100, 0, 0, 0, 'Moodle'),
(@GOREGEK,0,0,'Home! You better have brought back meat for Goregek, slave.',12,0,20,0,0,0,'Goregek'),
(@GOREGEK,0,1,'Goregek get some sleep. Go bring foodstuffs back, slave thing.',12,0,20,0,0,0,'Goregek'),
(@GOREGEK,0,2,'Goregek go get drink. You sit in corner til Goregek ready.',12,0,20,0,0,0,'Goregek'),
(@GOREGEK,0,3,'Goregek hungry. Go get on fire spit, slave thing. Tell Goregek when you well roasted.',12,0,20,0,0,0,'Goregek'),
(@GOREGEK,0,4,'Gorgek gonna catch chicken good!',12,0,20,0,0,0,'Goregek'),
(@GOREGEK,0,5,'You wait until Goregek ready.',12,0,20,0,0,0,'Goregek'),
(@GOREGEK,0,6,'You wait, slave thing. Goregek eating.',12,0,20,0,0,0,'Goregek'),
(@GOREGEK,1,0,'Goregek best hunter... ever.',12,0,15,0,0,0,'Goregek'),
(@GOREGEK,1,1,'Hah! Goregek''s kill!',12,0,15,0,0,0,'Goregek'),
(@GOREGEK,1,2,'Next time, maybe Goregek let you try.',12,0,15,0,0,0,'Goregek'),
(@GOREGEK,1,3,'I stabbed it in the face! Goregek so good.',12,0,15,0,0,0,'Goregek'),
(@GOREGEK,1,4,'Squeal! Squeal! So good!',12,0,15,0,0,0,'Goregek'),
(@GOREGEK,1,5,'Frenzyheart the strongest!',12,0,15,0,0,0,'Goregek'),
(@GOREGEK,1,6,'That how it done, slave thing. Maybe you figure out how someday.',12,0,10,0,0,0,'Goregek'),
(@GOREGEK,2,0,'Why Goregek even bring you. You useless.',12,0,25,0,0,0,'Goregek'),
(@GOREGEK,2,1,'Elder maybe says other stuff, but you always be slave thing to Goregek.',12,0,25,0,0,0,'Goregek'),
(@GOREGEK,2,2,'Pitch was weakling anyway... why else you think Goregek not bother with him?',12,0,25,0,0,0,'Goregek'),
(@GOREGEK,2,3,'You just get yourself beat up! Hah! You so dumb, slave thing.',12,0,25,0,0,0,'Goregek'),
(@GOREGEK,3,0,'Careful slave thing, the big bad softnuckles might eat you! Hah!',12,0,13,0,0,0,'Goregek'),
(@GOREGEK,3,1,'Hardknuckles still walk on hands... seem kind of dumb to Goregek.',12,0,13,0,0,0,'Goregek'),
(@GOREGEK,3,2,'Run away dumb softknuckle! We gonna poke you more!',12,0,13,0,0,0,'Goregek'),
(@GOREGEK,3,3,'Run away softknuckle! Goregek gonna get you!',12,0,13,0,0,0,'Goregek'),
(@GOREGEK,3,4,'You just watch slave thing, Goregek take care of these hardknuckles!',12,0,12,0,0,0,'Goregek'),
(@GOREGEK,3,5,'Better not get in Goregek''s way!',12,0,12,0,0,0,'Goregek'),
(@GOREGEK,3,6,'Get out of way silly slave thing! Goregek''s kill!',12,0,12,0,0,0,'Goregek'),
(@GOREGEK,3,7,'There were hundreds of times these hardknuckles before Goregek.',12,0,12,0,0,0,'Goregek'),
(@GOREGEK,4,0,'Hah! Goregek the greatest hunter ever! Goregek get biggest hardknuckle!',12,0,100,0,0,0,'Goregek'),
(@GOREGEK,5,0,'Frenzyheart feed Kartak big-tongue so Kartak not eat us. That why we smarter than you, slave thing.',12,0,100,0,0,0,'Goregek'),
(@DAJIK,0,0,'Frenzyheart came here not long ago for new home... big-tongue homes pretty nice, so we maybe take those too. They ugly anyway.',12,0,12,0,0,0,'Dajik'),
(@DAJIK,0,1,'Lot of strong Frenzyheart here. Dajik taught most of them. First time I teach something like you though. You not a Frenzyheart, you know.',12,0,12,0,0,0,'Dajik'),
(@DAJIK,0,2,'Let''s just eat bristlepine instead, okay? All done with chasing.',12,0,12,0,0,0,'Dajik'),
(@DAJIK,0,3,'There reason Frenzyheart not chase back chickens. Look kind of dumb to lose to chicken.',12,0,12,0,0,0,'Dajik'),
(@DAJIK,0,4,'Maybe you not notice, chicken move kind of fast.',12,0,13,0,0,0,'Dajik'),
(@DAJIK,0,5,'Time for more smart Dajik tip! If Goregek let chickens out again, make Goregek get chickens back again.',12,0,13,0,0,0,'Dajik'),
(@DAJIK,0,6,'I placed most of the spikes. Good amount of pointiness I think. You like?',12,0,13,0,0,0,'Dajik'),
(@DAJIK,0,7,'Oh! Dajik has idea! Make chicken sounds and maybe they come to you!',12,0,13,0,0,0,'Dajik'),
(@DAJIK,1,0,'Get the stuff off of body! Dajik hate it when he go skin something and there stuff in the way. So annoying.',12,0,20,0,0,0,'Dajik'),
(@DAJIK,1,1,'Did you see face? Looked so scared, "Ah, big thing going to smash me!" Hah.',12,0,20,0,0,0,'Dajik'),
(@DAJIK,1,2,'Hah! Maybe you learn a little after all!',12,0,20,0,0,0,'Dajik'),
(@DAJIK,1,3,'Yes! Stab few more time just in case! Stab good!',12,0,20,0,0,0,'Dajik'),
(@DAJIK,1,4,'Not sure how thing got here. Not matter if dead though',12,0,20,0,0,0,'Dajik'),
(@DAJIK,2,0,'We came for something, yes? Can''t remember.',12,0,20,0,0,0,'Dajik'),
(@DAJIK,2,1,'Make sure you not forget anything! I forgot stuff once.',12,0,20,0,0,0,'Dajik'),
(@DAJIK,2,2,'Dajik not think he seen you eat anything. You eat sometimes, yeah?',12,0,20,0,0,0,'Dajik'),
(@DAJIK,2,3,'I was going to draw picture of best attack plan... but you have my chalk.',12,0,20,0,0,0,'Dajik'),
(@DAJIK,2,4,'Time for more smart Dajik tip! Make sure thing dead before reach in mouth for loots.',12,0,20,0,0,0,'Dajik'),
(@DAJIK,3,0,'Seem like there more wasps every time Dajik come back. Why they not run out?',12,0,20,0,0,0,'Dajik'),
(@DAJIK,3,1,'Time for more smart Dajik tip! Try not to catch stinger with face. Not work so much.',12,0,20,0,0,0,'Dajik'),
(@DAJIK,3,2,'In case you wonder, wasp sting not feel so good. No need to try.',12,0,20,0,0,0,'Dajik'),
(@DAJIK,3,3,'Drone things not as tough as they look. Wasp things a bit nastier.',12,0,20,0,0,0,'Dajik'),
(@DAJIK,3,4,'Try not to catch stinger with face. Not work so much.',12,0,20,0,0,0,'Dajik'),
(@DAJIK,4,0,'No! You killed the queen thing! What have you... wait, nevermind. Sorry, that okay.',12,0,100,0,7000,0,'Dajik'),
(@DAJIK,5,0,'Dajik''s last learner eaten by sand-thing. We do better this time though!',12,0,100,0,0,0,'Dajik'),
(@DAJIK,6,0,'This not first queen slain by Frenzyheart. Seem like there always more.',12,0,100,0,0,0,'Dajik'),
(@DAJIK,7,0,'Sometimes big-tongues try to come get crystals. Not now because they not like it when we kill them.',12,0,34,0,0,0,'Dajik'),
(@DAJIK,7,1,'Time for more smart Dajik tip! Crystals work little too good for back scratch. No try.',12,0,33,0,0,0,'Dajik'),
(@DAJIK,7,2,'Something big make pillars and crystals and everything. Frenzyheart not care much cause it not here anymore.',12,0,33,0,0,0,'Dajik'),
(@DAJIK,8,0,'If you here to poke more softnuckles, Dajik going to poke you too.That a bad Goregek habit.',12,0,50,0,0,0,'Dajik'),
(@DAJIK,8,1,'Huh... where are we? This not right. I not tell you find hardknuckles, did I?',12,0,50,0,0,0,'Dajik'),
(@DAJIK,9,0,'Time for more smart Dajik tip! Lot of dead things mean lot of chance of being dead thing. Dajik leaving now.',12,0,33,0,0,0,'Dajik'),
(@DAJIK,9,1,'Dead thing there already learn lesson of broken pillar. Leave this lesson for dumb, dead things. Going home now.',12,0,33,0,0,0,'Dajik'),
(@DAJIK,9,2,'You all done with learning! Yup! All done! Dajik leave you and evil red pillar thing now.',12,0,34,0,0,0,'Dajik'),
(@ZEPIK,0,0,'Bring back good meat and the camp treat you like high-shaman for a day. Good deal.',12,0,20,0,0,0,'Zepik'),
(@ZEPIK,0,1,'Elder Harkek pretty good Frenzyheart. He help me a lot when I was littler and not liking Dajik.',12,0,20,0,0,0,'Zepik'),
(@ZEPIK,0,2,'I not in a big hurry. We can rest here a while if want.',12,0,20,0,0,0,'Zepik'),
(@ZEPIK,0,3,'I not live here always... I traveled lot of world on my own not long ago. I like all the stories of beasts and dragons and gods and stuff.',12,0,20,0,0,0,'Zepik'),
(@ZEPIK,0,4,'You should go let chickens out again and say Goregek did it. Never get old.',12,0,20,0,0,0,'Zepik'),
(@ZEPIK,1,0,'Hahah! You see that? Lightning bolt hit him right in the head!',12,0,33,0,0,0,'Zepik'),
(@ZEPIK,1,1,'Good one! It not even see it coming.',12,0,33,0,0,0,'Zepik'),
(@ZEPIK,1,2,'No more play?',12,0,34,0,0,0,'Zepik'),
(@ZEPIK,2,0,'You ever fought big dragon or god or anything? Zepik like hearing stories.',12,0,12,0,0,0,'Zepik'),
(@ZEPIK,2,1,'You pretty good! Natural at hunt, like me.',12,0,12,0,0,0,'Zepik'),
(@ZEPIK,2,2,'Goregek think he the boss of everyone, but he eat too much and hunt too little.',12,0,12,0,0,0,'Zepik'),
(@ZEPIK,2,3,'Bring back good meat and the camp treat you like high-shaman for a day. Good deal.',12,0,12,0,0,0,'Zepik'),
(@ZEPIK,2,4,'Dajik forget what he doing, where he at... sometime even forget his own name. Make him not so good teacher sometimes.',12,0,13,0,0,0,'Zepik'),
(@ZEPIK,2,5,'Elder Harkek pretty good Frenzyheart. He help me a lot when I was littler and not liking Dajik.',12,0,13,0,0,0,'Zepik'),
(@ZEPIK,2,6,'Goregek never ''stumble'' into chicken hut... Goregek always have to feed his dumb belly. Always one chicken missing when we catch them all.',12,0,13,0,0,0,'Zepik'),
(@ZEPIK,2,7,'Dajik tried to show me ways of hunt, but I do better when I do things my way.',12,0,13,0,0,0,'Zepik'),
(@ZEPIK,3,0,'Eat it big-tongues!',12,0,14,0,0,0,'Zepik'),
(@ZEPIK,3,1,'Hah! Leave some for Zepik too.',12,0,14,0,0,0,'Zepik'),
(@ZEPIK,3,2,'That lake near here actually full of sea things. Not sure how it all get here... maybe in floods?',12,0,14,0,0,0,'Zepik'),
(@ZEPIK,3,3,'I think one reason I like hunting big-tongues so much... they not as dumb as the other hunts. They give a real fight.',12,0,14,0,0,0,'Zepik'),
(@ZEPIK,3,4,'Mist big-tongues are smart with their shrine thing sometimes... cover whole area with mist and it get hard to find any.',12,0,14,0,0,0,'Zepik'),
(@ZEPIK,3,5,'Hah! This the fun part!',12,0,15,0,0,0,'Zepik'),
(@ZEPIK,3,6,'Flame! Death! Destruction! The black fire rages within my heart! I must... release it! Hahah!',12,0,15,0,0,0,'Zepik'),
(@ZEPIK,4,0,'Trust me - you going love this!',12,0,100,0,0,0,'Zepik'),
(@ZEPIK,5,0,'BOOM! That so good! More! More!',12,0,100,0,0,0,'Zepik');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=14 AND `SourceGroup`=9678 AND `SourceEntry`=13137;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (@FRENZYAURA,@RAINSPEAKERAURA,@WOLVARPING,@GORLOCPING,@DESSAWNRETAINER,@TREASUREPING,@DIGGINGFORTEASURE,@MOSSWALKERAURA,@SPEARBORNAURA,@MISTWHISPERAURA,@SAPPHIREHIVEAURA,@SKYREACHPILLARAURA,@CHICKENLOCATIONPING,51846);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,7,@FRENZYAURA,0,31,@GOREGEK,0,0,0,0,'','Spell Frenzyheart Hill Aura targets Goregek the Bristlepine Hunter'),
(13,7,@FRENZYAURA,1,31,@DAJIK,0,0,0,0,'','Spell Frenzyheart Hill Aura targets Dajik the Wasp Hunter'),
(13,7,@FRENZYAURA,2,31,@ZEPIK,0,0,0,0,'','Spell Frenzyheart Hill Aura targets Zepik the Gorloc Hunter'),
(13,7,@RAINSPEAKERAURA,0,31,@LAFOO,0,0,0,0,'','Spell Rainspeaker Canopy Aura targets Lafoo'),
(13,7,@RAINSPEAKERAURA,1,31,@MOODLE,0,0,0,0,'','Spell Rainspeaker Canopy Aura targets Jaloot'),
(13,7,@RAINSPEAKERAURA,2,31,@JALOOT,0,0,0,0,'','Spell Rainspeaker Canopy Aura targets Moodle'),
(13,7,@WOLVARPING,0,31,@GOREGEK,0,0,0,0,'','Spell Wolvar Location Ping targets Goregek the Bristlepine Hunter'),
(13,7,@WOLVARPING,1,31,@DAJIK,0,0,0,0,'','Spell Wolvar Location Ping targets Dajik the Wasp Hunter'),
(13,7,@WOLVARPING,2,31,@ZEPIK,0,0,0,0,'','Spell Wolvar Location Ping targets Zepik the Gorloc Hunter'),
(13,7,@GORLOCPING,0,31,@LAFOO,0,0,0,0,'','Spell Gorloc Location Ping targets Lafoo'),
(13,7,@GORLOCPING,1,31,@JALOOT,0,0,0,0,'','Spell Gorloc Location Ping targets Jaloot'),
(13,7,@GORLOCPING,2,31,@MOODLE,0,0,0,0,'','Spell Gorloc Location Ping targets Moodle'),
(13,7,@DESSAWNRETAINER,0,31,@LAFOO,0,0,0,0,'','Spell Dessawn Retainer targets Lafoo'),
(13,7,@DESSAWNRETAINER,1,31,@DAJIK,0,0,0,0,'','Spell Dessawn Retainer targets Dajik the Wasp Hunter'),
(13,7,@DESSAWNRETAINER,2,31,@ZEPIK,0,0,0,0,'','Spell Dessawn Retainer targets  Zepik the Gorloc Hunter'),
(13,7,@DESSAWNRETAINER,3,31,@JALOOT,0,0,0,0,'','Spell Dessawn Retainer targets Jaloot '),
(13,7,@DESSAWNRETAINER,4,31,@MOODLE,0,0,0,0,'','Spell Dessawn Retainer targets Moodle'),
(13,7,@DESSAWNRETAINER,5,31,@GOREGEK,0,0,0,0,'','Spell Dessawn Retainer targets  Goregek'),
(13,7,@TREASUREPING,0,31,@LAFOO,0,0,0,0,'','Spell looking for treasure ping targets Lafoo'),
(13,7,@TREASUREPING,1,31,@JALOOT,0,0,0,0,'','Spell looking for treasure ping targets Jaloot '),
(13,7,@TREASUREPING,2,31,@MOODLE,0,0,0,0,'','Spell looking for treasure ping targets Moodle'),
(13,7,@CHICKENLOCATIONPING,0,31,@GOREGEK,0,0,0,0,'','Spell chicken ping targets Goregek'),
(13,7,@CHICKENLOCATIONPING,1,31,@DAJIK,0,0,0,0,'','Spell chicken ping targets Dajik '),
(13,7,@CHICKENLOCATIONPING,2,31,@ZEPIK,0,0,0,0,'','Spell chicken ping targets Zepik'),
(13,7,@DIGGINGFORTEASURE,0,31,@GLINTINGDIRT,0,0,0,0,'','digging for treasure targets glinting dirt'),
(13,7,@MOSSWALKERAURA,0,31,@MOODLE,0,0,0,0,'','Mosswalker village aura targets moodle'),
(13,7,@SPEARBORNAURA,0,31,@JALOOT,0,0,0,0,'','spearborn encampment aura targets moodle'),
(13,7,@MISTWHISPERAURA,0,31,@ZEPIK,0,0,0,0,'','mistwhisper refuge aura targets zepik'),
(13,7,@SAPPHIREHIVEAURA,0,31,@DAJIK,0,0,0,0,'','sapphire hive aura targets dajik'),
(13,7,@SKYREACHPILLARAURA,0,31,@DAJIK,0,0,0,0,'','skyreach pillar aura targets dajik'),
(13,7,51846,0,31,@CHICKENESCAPEE,0,0,0,0,'','Scared Chicken targets only chicken escapee'),
(14,9678,13137,0,5,1104,7,0,0,0,'','Shaman Vekjik - Show different gossip if player is hated, hostile or unfriendly with Frenzyheart Tribe');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND  `SourceEntry` IN(@GLINTINGDIRT,@LAFOO,@JALOOT,@MOODLE,@GOREGEK,@DAJIK,@ZEPIK,@MOSSWALKERBUNNY) AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,17,@GOREGEK,0,0,9,0,12702,0,0,0,0, '', 'Goregek SAI only activates if player is on and has not completed the Chicken Party!'),
(22,17,@GOREGEK,0,0,29,0,@CHICKENESCAPEE,5,0,0,0, '', 'Execute SAI only if there is chicken escapee within 5 yards'),
(22,21,@DAJIK,0,1,9,0,12532,0,0,0,0, '', 'Dajik SAI only activates if player is on and has not completed Flown the Coop!'),
(22,21,@DAJIK,0,1,29,0,@CHICKENESCAPEE,5,0,0,0, '', 'Execute SAI only if there is chicken escapee within 5 yards'),
(22,21,@DAJIK,0,0,9,0,12702,0,0,0,0, '', 'Dajik SAI only activates if player is on and has not completed the Chicken Party!'),
(22,21,@DAJIK,0,0,29,0,@CHICKENESCAPEE,5,0,0,0, '', 'Execute SAI only if there is chicken escapee within 5 yards'),
(22,18,@ZEPIK,0,0,9,0,12702,0,0,0,0, '', 'Dajik SAI only activates if player is on and has not completed the Chicken Party!'),
(22,18,@ZEPIK,0,0,29,0,@CHICKENESCAPEE,5,0,0,0, '', 'Execute SAI only if there is chicken escapee within 5 yards'),
(22,1,@LAFOO,0,0,9,0,12704,0,0,0,0, '', 'Lafoo SAI only activates if player is on and has not completed the Appeasing the Great rainstone'),
(22,1,@LAFOO,0,0,29,0,@GLINTINGDIRT,10,0,0,0, '', 'Execute SAI only if there is glinting dirt within 5 yards'),
(22,1,@LAFOO,0,1,9,0,12572,0,0,0,0, '', 'Lafoo SAI only activates if player is on and has not completed the Gods like shiny things'),
(22,1,@LAFOO,0,1,29,0,@GLINTINGDIRT,10,0,0,0, '', 'Execute SAI only if there is glinting dirt within 5 yards'),
(22,1,@JALOOT,0,0,9,0,12704,0,0,0,0, '', 'Jaloot SAI only activates if player is on and has not completed the Appeasing the Great rainstone'),
(22,1,@JALOOT,0,0,29,0,@GLINTINGDIRT,10,0,0,0, '', 'Execute SAI only if there is glinting dirt within 5 yards'),
(22,1,@MOODLE,0,0,9,0,12704,0,0,0,0, '', 'Moodle SAI only activates if player is on and has not completed the Appeasing the Great rainstone'),
(22,1,@MOODLE,0,0,29,0,@GLINTINGDIRT,10,0,0,0, '', 'Execute SAI only if there is glinting dirt within 5 yards'),
(22,1,@GLINTINGDIRT,0,0,29,1,@LAFOO,5,0,0,0, '', 'Execute SAI only if Lafoo within 2 yards'),
(22,1,@GLINTINGDIRT,0,1,29,1,@JALOOT,5,0,0,0, '', 'Execute SAI only if Jaloot within 2 yards'),
(22,1,@GLINTINGDIRT,0,2,29,1,@MOODLE,5,0,0,0, '', 'Execute SAI only if Moodle within 2 yards'),
(22,13,@MOODLE,0,0,23,1,4297,0,0,1,0, '', 'Moodle dont execute SAI in Mosswalker Village'),
(22,9,@GOREGEK,0,0,23,1,4303,0,0,1,0, '', 'Goregek dont execute SAI in Hardknuckle Clearing'),
(22,10,@ZEPIK,0,0,23,1,4306,0,0,1,0, '', 'Zepik dont execute SAI in Mistwhisper Refuge'),
(22,12,@GOREGEK,0,0,23,1,4303,0,0,0,0, '', 'Goregek execute SAI in only in Hardknuckle Clearing'),
(22,9,@DAJIK,0,0,23,1,4304,0,0,1,0, '', 'Dajik Dont execute SAI in Sapphire Hive'),
(22,9,@DAJIK,0,0,23,1,4303,0,0,1,0, '', 'Dajik execute SAI in Hardknuckle Clearing'),
(22,9,@DAJIK,0,0,23,1,4388,0,0,1,0, '', 'Dajik execute SAI in Wintergrasp River'),
(22,9,@DAJIK,0,0,23,1,4295,0,0,1,0, '', 'Dajik execute SAI in The Sundered Shard'),
(22,19,@DAJIK,0,0,23,1,4303,0,0,0,0, '', 'Dajik execute SAI only in Hardknuckle Clearing'),
(22,11,@LAFOO,0,0,23,1,4291,0,0,1,0, '', 'Lafoo dont execute sai in rainspeaker canopy'),
(22,13,@JALOOT,0,0,23,1,4291,0,0,1,0, '', 'Jaloot dont execute sai in rainspeaker canopy'),
(22,13,@JALOOT,0,1,23,1,4308,0,0,1,0, '', 'Jaloot dont execute sai in spearborn encampment'),
(22,13,@MOODLE,0,0,23,1,4291,0,0,1,0, '', 'Moodle dont execute sai in rainspeaker canopy'),
(22,9,@GOREGEK,0,0,23,1,4292,0,0,1,0, '', 'Goregek dont execute sai in frenzyheart hill'),
(22,9,@DAJIK,0,0,23,1,4292,0,0,1,0, '', 'Dajik dont execute sai in frenzyheart hill'),
(22,10,@ZEPIK,0,0,23,1,4292,0,0,1,0, '', 'Zepik dont execute sai in frenzyheart hill'),
(22,2,@MOSSWALKERBUNNY,0,0,1,0,@SHOLAZARGUARDIANHEARTBEAT,0,0,0,0, '', 'Mosswalker Bunny execute SAI only if player has sholazar guardian heartbeat aura');

UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`= @SOFTKNUCKLE;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SOFTKNUCKLE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@SOFTKNUCKLE,0,0,0,8,0,20 ,0,@SCAREDSOFTKNUCKLE,0,10000,10000,45,1,1,0,0,0,0,10,100797,@HARDKNUCKLEMATRIARCH,0,0,0,0,0, 'Softknuckle - On Spellhit - Set Data on Hardknuckle Matriach');
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`= @HARDKNUCKLE;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@HARDKNUCKLE;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@HARDKNUCKLE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@HARDKNUCKLE,0,0,0,9,0,100,0,10,30,15000,21000,11,49758,2,0,0,0,0,2,0,0,0,0,0,0,0, 'Hardknuckle Charger - On Range - Cast Charge');

UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`= @HARDKNUCKLEMATRIARCH;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@HARDKNUCKLEMATRIARCH;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@HARDKNUCKLEMATRIARCH;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@HARDKNUCKLEMATRIARCH,0,0,1,4,0,100,0,0,0,0,0,11,54287,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Hardknuckle Matriarch - On Agro - Cast Enrage'),
(@HARDKNUCKLEMATRIARCH,0,1,0,61,0,100,0,0,0,0,0,1 ,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Hardknuckle Matriarch - Linked with Previous Event - Say'),
(@HARDKNUCKLEMATRIARCH,0,2,0,0,0,100,0,6000,10000,12000,15000,11 ,61580,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Hardknuckle Matriarch - In Combat - Cast Cast Thunderstomp'),
(@HARDKNUCKLEMATRIARCH,0,3,4,38,0,100,0,1,1,0,0,45,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Hardknuckle Matriarch - On Data Set 1 1 - Set Data 10'),
(@HARDKNUCKLEMATRIARCH,0,4,5,61,0,100,0,0,0,0,0,19,756,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Hardknuckle Matriarch - Linked with Previous Event - Remove unit flags'),
(@HARDKNUCKLEMATRIARCH,0,5,6,61,0,100,0,0,0,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Hardknuckle Matriarch - Linked with Previous Event - Set Visible'),
(@HARDKNUCKLEMATRIARCH,0,6,0,61,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,500,0,0,0,0,0,0, 'Hardknuckle Matriarch - Linked with Previous Event - Attack closest player'),
(@HARDKNUCKLEMATRIARCH,0,7,8,11,0,100,0,0,0,0,0,18,756,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Hardknuckle Matriarch - On spawn - Add unit flags'),
(@HARDKNUCKLEMATRIARCH,0,8,0,61,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Hardknuckle Matriarch - Linked with Previous Event - Set Invisible'),
(@HARDKNUCKLEMATRIARCH,0,9,10,21,0,100,0,0,0,0,0,18,756,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Hardknuckle Matriarch - On Creature reached home - Add unit flags'),
(@HARDKNUCKLEMATRIARCH,0,10,0,61,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Hardknuckle Matriarch - Linked with Previous Event - Set Invisible'),
(@HARDKNUCKLEMATRIARCH,0,11,12,6,0,100,0,0,0,0,0,45,1,1,0,0,0,0,9,@GOREGEK,0,50,0,0,0,0, 'Hardknuckle Matriarch - On Death Send Data to Goregek'),
(@HARDKNUCKLEMATRIARCH,0,12,0,61,0,100,0,0,0,0,0,41,60000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Hardknuckle Matriarch - Linked with Previous Event - Despawn after  1m');

DELETE FROM `creature_ai_texts` WHERE `entry`=-738;
DELETE FROM `creature_text` WHERE `entry` =@HARDKNUCKLEMATRIARCH;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(@HARDKNUCKLEMATRIARCH, 0, 0, 'We are Not Amused', 12, 0, 100, 0, 0, 0, 'Hardknuckle Matriarch');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry` =@SOFTKNUCKLE;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,2,@SOFTKNUCKLE,0,0,23,0,4303,0,0,0,0, '', 'Softknuckle - Only execute SAI in hardknuckle clearing');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`IN(13,17) AND `SourceEntry`=@SCAREDSOFTKNUCKLE;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES 
(17,0,@SCAREDSOFTKNUCKLE,0,0,31,1,3,@SOFTKNUCKLE,0,0,0, '', 'Scared Softknuckle only hits Softknuckle'),
(13,0,@SCAREDSOFTKNUCKLE,0,0,31,1,3,@SOFTKNUCKLE,0,0,0, '', 'Scared Softknuckle only hits Softknuckle');

UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`= @SAPPHIREQUEEN;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@SAPPHIREQUEEN;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SAPPHIREQUEEN;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@SAPPHIREQUEEN,0,0,0,0,0,100,0,6000,9000,9000,14000,11,48193,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Sapphire Hive Queen - IC - Cast Poison Stinger'),
(@SAPPHIREQUEEN,0,1,0,2,0,100,0,0,30,12000,15000,11,54761,1,0,0,0,0,1,0,0,0,0,0,0,0, 'Sapphire Hive Queen - On 30% Hp - Cast Enrage'),
(@SAPPHIREQUEEN,0,2,0,6,0,100,0,0,0,0,0,45,1,1,0,0,0,0,9,@DAJIK,0,50,0,0,0,0, 'Sapphire Hive Queen - On Death - Set Data Dajik');

UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`= @VENOMTIP;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@VENOMTIP;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@VENOMTIP;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@VENOMTIP,0,0,0,0,0,100,0,7000,9000,17000,20000,11,61550,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Venomtip - IC - Cast Cobra Strike'),
(@VENOMTIP,0,1,0,9,0,100,0,0,30,7000,12000,11,32330,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Venomtip - On Range - Cast Poison Spit'),
(@VENOMTIP,0,2,0,6,0,100,0,0,0,0,0,45,1,1,0,0,0,0,9,@LAFOO,0,50,0,0,0,0, 'Venomtip - On Death - Set Data Lafoo');

UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`= @SERFEXTHEREAVER;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@SERFEXTHEREAVER;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SERFEXTHEREAVER;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@SERFEXTHEREAVER,0,0,1,1,0,100,0,0,0,60000,90000,11,20567,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - OOC - Cast Submerge Visual'),
(@SERFEXTHEREAVER,0,1,0,61,0,100,0,0,0,0,0,18,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - Linked with Previous Event  - Set Unselectable and Unattackable Flags'),
(@SERFEXTHEREAVER,0,2,3,4,0,100,0,0,0,0,0,28,20567,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - On Agro - Remove Submerge Visual'),
(@SERFEXTHEREAVER,0,3,4,61,0,100,0,0,0,0,0,28,29147,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - Linked with Previous Event - Remove Submerge Visual'),
(@SERFEXTHEREAVER,0,4,5,61,0,100,0,0,0,0,0,11,37752,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - Linked with Previous Event - Cast Stand'),
(@SERFEXTHEREAVER,0,5,6,61,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - Linked with Previous Event - Stop Combat Movement'),
(@SERFEXTHEREAVER,0,6,7,61,0,100,0,0,0,0,0,19,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - Linked with Previous Event - Remove Unselectable and Unattackable Flags'),
(@SERFEXTHEREAVER,0,7,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - Linked with Previous Event - Set Phase 1'),
(@SERFEXTHEREAVER,0,8,0,0,1,100,0,1000,1000,2100,4500,11,20567,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Serfex the Reaver - IC - Cast Poison'),
(@SERFEXTHEREAVER,0,9,10,9,0,100,0,40,60,0,0,11,68909,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - On Range - Cast Submerge Visual'),
(@SERFEXTHEREAVER,0,10,11,61,0,100,0,0,0,0,0,11,29147,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - Linked with Previous Event - Cast Stand'),
(@SERFEXTHEREAVER,0,11,0,61,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - Linked with Previous Event - Set Phase 2'),
(@SERFEXTHEREAVER,0,12,13,9,1,100,0,0,8,0,0,28,20567,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - On Range - Remove Submerge Visual'),
(@SERFEXTHEREAVER,0,13,14,61,1,100,0,0,0,0,0,11,37752,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - Linked with Previous Event - Cast Stand'),
(@SERFEXTHEREAVER,0,14,15,61,1,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - Linked with Previous Event - Stop Combat Movement'),
(@SERFEXTHEREAVER,0,15,0 ,61,1,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - Linked with Previous Event - Set Phase 1'),
(@SERFEXTHEREAVER,0,16,17,7,0,100,0,0,0,0,0,11,20567,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - Evade - Cast Submerge Visual'),
(@SERFEXTHEREAVER,0,17,18,61,0,100,0,0,0,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - Linked with Previous Event - Allow Combat Movement'),
(@SERFEXTHEREAVER,0,18,19,61,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - Linked with Previous Event - Set Phase 0'),
(@SERFEXTHEREAVER,0,19,20,61,0,100,0,0,0,0,0,11,29147,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - Evade - Cast Submerge Visual'),
(@SERFEXTHEREAVER,0,20,21,61,0,100,0,0,0,0,0,14,100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - Evade - Set Threat'),
(@SERFEXTHEREAVER,0,21,0,61,0,100,0,0,0,0,0,18,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Serfex the Reaver - Evade - Set Untargetable flags'),
(@SERFEXTHEREAVER,0,22,0,6,0,100,0,0,0,0,0,45,1,2,0,0,0,0,9,@DAJIK,0,50,0,0,0,0, 'Serfex the Reaver - On Death - Set Data Dajik');

DELETE FROM `gameobject` WHERE `guid` IN (@GOBJGUID,@GOBJGUID+1);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GOBJGUID,300213,571,1,1,6206.71,4951.67,-98.9126,3.84683,0,0,0.938472,-0.345355,300,0,1),
(@GOBJGUID+1,190502,571,1,1,6206.71,4951.67,-98.9126,3.84683,0,0,0.938472,-0.345355,-5000,0,1);

DELETE FROM `event_scripts` WHERE `id`IN(18475,18474);
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(18475,2,9,@GOBJGUID+1,60,0,0,0,0,0),
(18474,1,10,@MISTWHISPERLIGHTNINGCLOUD,60000,0,6202.683105,4948.736328,-86,0);

UPDATE `creature_template` SET `AIName`= 'SmartAI',`InhabitType`=4 WHERE  `entry`=@MISTWHISPERLIGHTNINGCLOUD;
DELETE FROM `smart_scripts` WHERE `entryorguid` =@MISTWHISPERLIGHTNINGCLOUD;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@MISTWHISPERLIGHTNINGCLOUD,0,0,0,1, 0,100,1,10000,10000,0,0,15,12537,0,0,0,0,0,18,40,0,0,0,0,0,0, 'Mistwhisper Lightning Cloud - OOC - Give Quest Credit'),
(@MISTWHISPERLIGHTNINGCLOUD,0,1,0,1, 0,100,0,3000,5000,2000,11000,11,51172,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Mistwhisper Lightning Cloud - OOC - Cloud to Lightning'),
(@MISTWHISPERLIGHTNINGCLOUD,0,2,3,11, 0,100,0,0,0,0,0,45,1,1,0,0,0,0,10,106338,28273,0,0,0,0,0, 'Mistwhisper Lightning Cloud - On Spawn - Send Data to Arranged Crystal Formation Bunny'),
(@MISTWHISPERLIGHTNINGCLOUD,0,3,0,61,0,100,0,0,0,0,0,45,1,2,0,0,0,0,9,@ZEPIK,0,50,0,0,0,0, 'Mistwhisper Lightning Cloud - Linked with Previous Event - Set Data Zepik');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=51172;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,7,51172,0,0,31,0,3,@MISTWHISPERLIGHTNINGTARGET,0,0,0,0, '', 'Cloud to Lightning hits Mistwhisper Lightning Target'),
(13,7,51172,0,1,31,0,3,@MISTWHISPERLIGHTNINGCLOUD,0,0,0,0, '', 'Cloud to Lightning hits Mistwhisper Lightning Cloud');

UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE  `entry`=@ARRANGEDCRYSTALFORMATIONBUNNY;
DELETE FROM `smart_scripts` WHERE `entryorguid` =@ARRANGEDCRYSTALFORMATIONBUNNY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ARRANGEDCRYSTALFORMATIONBUNNY,0,0,1,38, 0,100,0,1,1,0,0,45,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Arranged Crystal Formation Bunny - On Receive Data - Reset Data'),
(@ARRANGEDCRYSTALFORMATIONBUNNY,0,1,2,61, 0,100,0,0,0,0,0,11,51150,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Arranged Crystal Formation Bunny - Linked with Previous Event - Cast Crystal Shatter Visual'),
(@ARRANGEDCRYSTALFORMATIONBUNNY,0,2,3,61, 0,100,0,0,0,0,0,11,51172,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Arranged Crystal Formation Bunny - Linked with Previous Event - Cast Lightning to Cloud'),
(@ARRANGEDCRYSTALFORMATIONBUNNY,0,3,0,61, 0,100,0,0,0,0,0,70,1,0,0,0,0,0,14,@GOBJGUID+1,190502,0,0,0,0,0, 'Arranged Crystal Formation Bunny - Linked with Previous Event - Despawn Arranged Crystal formation');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN(19,20) AND `SourceGroup`=0 AND `SourceEntry`=12528;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(19,0,12528,0,8,12654,0,0,0,0,'','Playing Along can be taken if player has quest part time hunter completed in log'),
(20,0,12528,0,8,12654,0,0,0,0,'','Playing Along can be taken if player has quest part time hunter completed in log'),
(19,0,12528,1,9,12654,0,0,0,0,'','Playing Along can be taken if player has quest part time hunter taken in log'),
(20,0,12528,1,9,12654,0,0,0,0,'','Playing Along can be taken if player has quest part time hunter taken in log'),
(19,0,12528,2,28,12654,0,0,0,0,'','Playing Along can be taken if player has quest part time hunter rewarded'),
(20,0,12528,2,28,12654,0,0,0,0,'','Playing Along can be taken if player has quest part time hunter rewarded');

UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`= @PITCH;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@PITCH;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@PITCH;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@PITCH,0,0,0,9,0,100,0,5,30,9000,12000,11,54487,2,0,0,0,0,2,0,0,0,0,0,0,0, 'Pitch - On Range - Cast Jump Attack'),
(@PITCH,0,1,0,0,0,100,0,5000,8000,7000,13000,11,24332,2,0,0,0,0,2,0,0,0,0,0,0,0, 'Pitch - In Combat - Cast Rake'),
(@PITCH,0,2,0,11,0,100,0,0,0,0,0,45,1,1,0,0,0,0,9,@TRACKERGEKGEK,0,200,0,0,0,0, 'Pitch - On Spawn - Set Data Tracker Gekgek'),
(@PITCH,0,3,0,6,0,100,0,0,0,0,0,45,1,2,0,0,0,0,9,@TRACKERGEKGEK,0,200,0,0,0,0, 'Pitch - On Death - Set Data Tracker Gekgek'),
(@PITCH,0,4,0,4,0,100,0,0,0,0,0,45,1,3,0,0,0,0,9,@TRACKERGEKGEK,0,200,0,0,0,0, 'Pitch - On Aggro - Set Data Tracker Gekgek'),
(@PITCH,0,5,0,7,0,100,0,0,0,0,0,45,1,4,0,0,0,0,9,@TRACKERGEKGEK,0,200,0,0,0,0, 'Pitch - On Evade - Set Data Tracker Gekgek');

UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`= @TRACKERGEKGEK;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@TRACKERGEKGEK;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@TRACKERGEKGEK;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@TRACKERGEKGEK,0,0,0,0,0,100,0,3000,6000,4000,7000,11,50533,2,0,0,0,0,2,0,0,0,0,0,0,0, 'Tracker Gekgek - In Combat - Cast Flip Attack'),
(@TRACKERGEKGEK,0,1,2,38,0,100,0,1,1,0,0,45,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tracker Gekgek - On Data Set (Pitch Spawn 1 1) - Set Data 1 0'),
(@TRACKERGEKGEK,0,2,3,61,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tracker Gekgek - Linked with Previous Event- Remove Quest Giver Flag'),
(@TRACKERGEKGEK,0,3,0,61,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tracker Gekgek - Linked with Previous Event- Set Phase 2'),
(@TRACKERGEKGEK,0,4,5,38,0,100,0,1,2,0,0,45,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tracker Gekgek - On Data Set (Pitch Die 1 2) - Set Data 1 0'),
(@TRACKERGEKGEK,0,5,6,61,0,100,0,0,0,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tracker Gekgek - Linked with Previous Event- Add Quest Giver Flag'),
(@TRACKERGEKGEK,0,6,7,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tracker Gekgek - Linked with Previous Event- Say'),
(@TRACKERGEKGEK,0,7,0,61,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tracker Gekgek - Linked with Previous Event- Set Phase 0'),
(@TRACKERGEKGEK,0,8,9,38,0,100,0,1,3,0,0,45,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tracker Gekgek - On Data Set (Pitch Aggro 1 3) - Set Data 1 0'),
(@TRACKERGEKGEK,0,9,10,61,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tracker Gekgek - Linked with Previous Event- Say'),
(@TRACKERGEKGEK,0,10,0,61,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tracker Gekgek - Linked with Previous Event- Set Phase 0'),
(@TRACKERGEKGEK,0,10,11,38,0,100,0,1,4,0,0,45,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tracker Gekgek - On Data Set (Pitch Evade 1 4) - Set Data 1 0'),
(@TRACKERGEKGEK,0,11,0,61,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tracker Gekgek - Linked with Previous Event- Say'),
(@TRACKERGEKGEK,0,12,0,10,2,100,0,1,100,30000,90000,1,2,2,0,0,0,0,1,0 ,0,0,0,0,0,0, 'Tracker Gekgek - On Los OOC - Say'),
(@TRACKERGEKGEK,0,13,0,11,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tracker Gekgek - On Spawn - Set Phase 2');

DELETE FROM `creature_text` WHERE `entry` =@TRACKERGEKGEK;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(@TRACKERGEKGEK,0,0, 'No! You steal kill! Now you owe Gekgek!', 12, 0, 100, 0, 0, 0, 'Tracker Gekgek'),
(@TRACKERGEKGEK,1,0, 'Dumb! Don''t shoot at it! Gekgek want trophy in one piece!', 12, 0, 100, 0, 0, 0, 'Tracker Gekgek'),
(@TRACKERGEKGEK,2,0, 'No let it get away! We got it this time.', 12, 0, 33, 0, 0, 0, 'Tracker Gekgek'),
(@TRACKERGEKGEK,2,1, 'Careful! No let it scratch you like last time.', 12, 0, 33, 0, 0, 0, 'Tracker Gekgek'),
(@TRACKERGEKGEK,2,2, 'Ahh! It''s coming right for us!', 12, 0, 34, 0, 0, 0, 'Tracker Gekgek');

UPDATE `creature_template` SET `AIName` = 'SmartAI',`unit_flags`=`unit_flags`&~33554432  WHERE `entry` = @MOSSWALKERVICTIM;
UPDATE `creature` SET `MovementType` = 0, `spawndist`=0 WHERE `id` = @MOSSWALKERVICTIM;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN(28113,2811301,2811302);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@MOSSWALKERVICTIM,0,0,1,62,0,100,0,9728,0,0,0,87,(@MOSSWALKERVICTIM*100)+1,(@MOSSWALKERVICTIM*100)+2,(@MOSSWALKERVICTIM*100)+1,(@MOSSWALKERVICTIM*100)+2,(@MOSSWALKERVICTIM*100)+1,(@MOSSWALKERVICTIM*100)+2,1,0,0,0,0.0,0.0,0.0,0.0, 'Mosswalker Victim - On Gossip Select - Random Script Start'),
(@MOSSWALKERVICTIM,0,1,2,61,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0, 'Mosswalker Victim - Linked with Previous Event - Remove Gossip Flag'),
(@MOSSWALKERVICTIM,0,2,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0, 'Mosswalker Victim - Linked with Previous Event - Close Gossip'),
(@MOSSWALKERVICTIM,0,3,0,25,0,100,0,0,0,0,0,11,58806,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0, 'Mosswalker Victim - On Spawn - Cast Permament Feign Death on Self'),
((@MOSSWALKERVICTIM*100)+1,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Mosswalker Victim - Script 1 - Say'),
((@MOSSWALKERVICTIM*100)+1,9,1,0,0,0,100,0,2000,2000,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Mosswalker Victim - Script 1 - Die'),
((@MOSSWALKERVICTIM*100)+2,9,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Mosswalker Victim - Script 2 - Say'),
((@MOSSWALKERVICTIM*100)+2,9,1,0,0,0,100,0,1000,1000,0,0,85,52157,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Mosswalker Victim -Script 2 - Credit'),
((@MOSSWALKERVICTIM*100)+2,9,2,0,0,0,100,0,100,100,0,0,28,58806,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Mosswalker Victim - Script 2 - Remove Permament Feign Death'),
((@MOSSWALKERVICTIM*100)+2,9,3,0,0,0,100,0,15000,15000,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Mosswalker Victim - Script 2 - Set Invisible'),
((@MOSSWALKERVICTIM*100)+2,9,4,0,0,0,100,0,15500,15500,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Mosswalker Victim - Script 2 - Die');

DELETE FROM `creature_text` WHERE `entry` = @MOSSWALKERVICTIM;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@MOSSWALKERVICTIM,0,0, 'Please take... my shinies. All done...', 12, 0, 100, 0, 0, 0, 'Mosswalker Victim'),
(@MOSSWALKERVICTIM,0,1, 'We not do anything... to them... I no understand.', 12, 0, 100, 0, 0, 0, 'Mosswalker Victim'),
(@MOSSWALKERVICTIM,0,2, 'Use my shinies... make weather good again... make undead things go away.', 12, 0, 100, 0, 0, 0, 'Mosswalker Victim'),
(@MOSSWALKERVICTIM,0,3, 'We gave shinies to shrine... we not greedy... why this happen?', 12, 0, 100, 0, 0, 0, 'Mosswalker Victim'),
(@MOSSWALKERVICTIM,0,4, 'I do something bad? I sorry...', 12, 0, 100, 0, 0, 0, 'Mosswalker Victim'),
(@MOSSWALKERVICTIM,1,0, 'We saved. You nice, dryskin.', 12, 0, 100, 0, 0, 0, 'Mosswalker Victim'),
(@MOSSWALKERVICTIM,1,1, 'Maybe you make weather better too?', 12, 0, 100, 0, 0, 0, 'Mosswalker Victim'),
(@MOSSWALKERVICTIM,1,2, 'You save us! Yay for you!', 12, 0, 100, 0, 0, 0, 'Mosswalker Victim'),
(@MOSSWALKERVICTIM,1,3, 'Thank you! You good!', 12, 0, 100, 0, 0, 0, 'Mosswalker Victim');

DELETE FROM `conditions` WHERE `SourceGroup`=9728 AND `SourceTypeOrReferenceId`=15 ;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry` ,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3` ,`ErrorTextId`,`ScriptName`,`Comment`)
VALUES (15,9728,0 ,0,9,12580,0 ,0,0 ,0, 'Only show gossip when quest player in on and has not completed the mosswalker saviour');

-- set correct previous quest for obtaining oracles or frenzyheart dailys, return of the lich hunter or return of the friendly dry skin not heros burden
UPDATE `quest_template` SET `PrevQuestId`=12695 WHERE  `Id`IN(12735,12737,12736,12726,12761,12762,12705,12704);
UPDATE `quest_template` SET `PrevQuestId`=12692 WHERE  `Id`IN(12703,12760,12759,12758,12734,12741,12732,12702);

-- Pooling/grouping for Oracles/Frenzyheart Dailys
-- already exclusive grouped just not pooled
DELETE FROM `pool_quest` WHERE `pool_entry`=@QUESTPOOL;
INSERT INTO `pool_quest` (`entry`, `pool_entry`, `description`) VALUES
(12735, @QUESTPOOL, 'Oracle Soo-nee - A Cleansing Song'),
(12737, @QUESTPOOL, 'Oracle Soo-nee - Song of Fecundity'),
(12736, @QUESTPOOL, 'Oracle Soo-nee - Song of Reflection'),
(12726, @QUESTPOOL, 'Oracle Soo-nee - Song of Wind and Water');
UPDATE `quest_template` SET `ExclusiveGroup`=12761 WHERE  `Id`IN(12761,12762,12705);
DELETE FROM `pool_quest` WHERE `pool_entry`=@QUESTPOOL+1;
INSERT INTO `pool_quest` (`entry`, `pool_entry`, `description`) VALUES
(12761, @QUESTPOOL+1, 'Oracle Soo-dow - Mastery of the Crystals'),
(12762, @QUESTPOOL+1, 'Oracle Soo-dow - Power of the Great Ones'),
(12705, @QUESTPOOL+1, 'Oracle Soo-dow - Will of the Titans');
DELETE FROM `pool_quest` WHERE `pool_entry`=@QUESTPOOL+2;
UPDATE `quest_template` SET `ExclusiveGroup`=12758 WHERE  `Id`IN(12758,12734,12741,12732);
INSERT INTO `pool_quest` (`entry`, `pool_entry`, `description`) VALUES
(12758, @QUESTPOOL+2, 'Rejek - A Hero''s Headgear'),
(12734, @QUESTPOOL+2, 'Rejek - Rejek: First Blood'),
(12741, @QUESTPOOL+2, 'Rejek - Strength of the Tempest'),
(12732, @QUESTPOOL+2, 'Rejek - The Heartblood''s Strength');
UPDATE `quest_template` SET `ExclusiveGroup`=12703 WHERE  `Id`IN(12703,12760,12759);
DELETE FROM `pool_quest` WHERE `pool_entry`=@QUESTPOOL+3;
INSERT INTO `pool_quest` (`entry`, `pool_entry`, `description`) VALUES
(12703, @QUESTPOOL+3, 'Vekgar - Kartak''s Rampage'),
(12760, @QUESTPOOL+3, 'Vekgar - Secret Strength of the Frenzyheart'),
(12759, @QUESTPOOL+3, 'Vekgar - Tools of War');
DELETE FROM `pool_template` WHERE `entry` BETWEEN @QUESTPOOL AND @QUESTPOOL+3;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(@QUESTPOOL, 1, 'Oracle Soo-nee Dailies'),
(@QUESTPOOL+1, 1, 'Oracle Soo-dow Dailies'),
(@QUESTPOOL+2, 1, 'Rejek Dailies'),
(@QUESTPOOL+3, 1, 'Vekgar Dailies');
-- Return of the lich hunter should be takable by both factions not only horde
UPDATE `quest_template` SET `RequiredRaces`=0 WHERE `Id`=12692;
SET @LAFOO := 28120;
SET @MOODLE := 28122;
SET @JALOOT := 28121;
SET @CHICKENESCAPEE := 28161;
SET @GOREGEK := 28214;
SET @DAJIK := 28215;
SET @ZEPIK := 28216;
SET @MISTWHISPERLIGHTNINGCLOUD := 28253;
SET @MISTWHISPERLIGHTNINGTARGET := 28254;
SET @GLINTINGDIRT := 28362;
SET @RHUNOK := 28416;
SET @TORMENTOR := 28575;
SET @SCAREDSOFTKNUCKLE := 50979;
SET @LIGHTNING := 51172;
SET @FRENZYAURA := 51234;
SET @MISTWHISPERAURA := 51239; 
SET @DIGGINGFORTEASURE := 51405;
SET @TREASUREPING:= 51420;
SET @THROWSPEAR := 51603;
SET @CHAINS1 := 51606;
SET @CHAINS2 := 51607;
SET @RAINSPEAKERAURA := 51639;
SET @SPEARBORNAURA := 51642;
SET @MOSSWALKERAURA := 51644;
SET @SKYREACHPILLARAURA:= 51645;
SET @SAPPHIREHIVEAURA := 51651;
SET @WOLVARPING := 51791;
SET @GORLOCPING := 51794;
SET @CHICKENLOCATIONPING := 51843;
SET @SCAREDCHICKEN := 51846;
SET @DESSAWNRETAINER := 53163;

DELETE FROM `creature_text` WHERE `entry`=@TORMENTOR;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@TORMENTOR,0,0,'Filthy $R intruder. DIE!',12,0,100,0,0,0,'Rhunok''s Tormentor'),
(@TORMENTOR,0,1,'If Rhunok regains his strength, we all die!',12,0,100,0,0,0,'Rhunok''s Tormentor'),
(@TORMENTOR,0,2,'There are intruders about. Slay them before they ruin everything!',12,0,100,0,0,0,'Rhunok''s Tormentor'),
(@TORMENTOR,0,3,'The bear god must be kept enfeebled so that the prophet can finish the ritual.',12,0,100,0,0,0,'Rhunok''s Tormentor'),
(@TORMENTOR,0,4,'Keep him weak!',12,0,100,0,0,0,'Rhunok''s Tormentor');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@TORMENTOR;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@TORMENTOR;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-113481,-113482,-113483,-113558,@TORMENTOR) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@TORMENTOR,0,0,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Rhunok''s Tormentor - On aggro - Say line'),
(@TORMENTOR,0,1,0,0,0,100,0,3000,8000,10000,20000,11,38556,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Rhunok''s Tormentor - On update IC - Spellcast Throw'),
(@TORMENTOR,0,2,0,0,0,100,0,5000,30000,30000,35000,11,54526,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Rhunok''s Tormentor - On update IC - Spellcast Torment'),
(@TORMENTOR,0,3,0,1,0,100,0,5000,30000,30000,40000,11,@THROWSPEAR,0,0,0,0,0,10,95460,@RHUNOK,0,0,0,0,0, 'Rhunok''s Tormentor - On update OOC - Spellcast Throw Spear'),

(-113481,0,0,0,1,0,100,0,0,0,5000,5000,11,@CHAINS1,0,0,0,0,0,10,95460,@RHUNOK,0,0,0,0,0, 'ELM General Purpose Bunny - On update OOC - Spellcast Rhunok''s Chains'),
(-113482,0,0,0,1,0,100,0,0,0,5000,5000,11,@CHAINS2,0,0,0,0,0,10,95460,@RHUNOK,0,0,0,0,0, 'ELM General Purpose Bunny - On update OOC - Spellcast Rhunok''s Chains'),
(-113483,0,0,0,1,0,100,0,0,0,5000,5000,11,@CHAINS1,0,0,0,0,0,10,95460,@RHUNOK,0,0,0,0,0, 'ELM General Purpose Bunny - On update OOC - Spellcast Rhunok''s Chains'),
(-113558,0,0,0,1,0,100,0,0,0,5000,5000,11,@CHAINS2,0,0,0,0,0,10,95460,@RHUNOK,0,0,0,0,0, 'ELM General Purpose Bunny - On update OOC - Spellcast Rhunok''s Chains');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (@THROWSPEAR,@CHAINS1,@CHAINS2,@LIGHTNING,@SCAREDSOFTKNUCKLE,@FRENZYAURA,@RAINSPEAKERAURA,@WOLVARPING,@GORLOCPING,@DESSAWNRETAINER,@CHICKENLOCATIONPING,@TREASUREPING,@DIGGINGFORTEASURE,@MOSSWALKERAURA,@SPEARBORNAURA,@MISTWHISPERAURA,@SAPPHIREHIVEAURA,@SCAREDCHICKEN,@SKYREACHPILLARAURA);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,@LIGHTNING,0,31,3,@MISTWHISPERLIGHTNINGTARGET,0,0,0, '', 'Cloud to Lightning hits Mistwhisper Lightning Target'),
(13,1,@LIGHTNING,1,31,3,@MISTWHISPERLIGHTNINGCLOUD,0,0,0, '', 'Cloud to Lightning hits Mistwhisper Lightning Cloud'),
(13,1,@FRENZYAURA,0,31,3,@GOREGEK,0,0,0,'','Spell Frenzyheart Hill Aura targets Goregek the Bristlepine Hunter'),
(13,1,@FRENZYAURA,1,31,3,@DAJIK,0,0,0,'','Spell Frenzyheart Hill Aura targets Dajik the Wasp Hunter'),
(13,1,@FRENZYAURA,2,31,3,@ZEPIK,0,0,0,'','Spell Frenzyheart Hill Aura targets Zepik the Gorloc Hunter'),
(13,1,@RAINSPEAKERAURA,0,31,3,@LAFOO,0,0,0,'','Spell Rainspeaker Canopy Aura targets Lafoo'),
(13,1,@RAINSPEAKERAURA,1,31,3,@MOODLE,0,0,0,'','Spell Rainspeaker Canopy Aura targets Jaloot'),
(13,1,@RAINSPEAKERAURA,2,31,3,@JALOOT,0,0,0,'','Spell Rainspeaker Canopy Aura targets Moodle'),
(13,1,@WOLVARPING,0,31,3,@GOREGEK,0,0,0,'','Spell Wolvar Location Ping targets Goregek the Bristlepine Hunter'),
(13,1,@WOLVARPING,1,31,3,@DAJIK,0,0,0,'','Spell Wolvar Location Ping targets Dajik the Wasp Hunter'),
(13,1,@WOLVARPING,2,31,3,@ZEPIK,0,0,0,'','Spell Wolvar Location Ping targets Zepik the Gorloc Hunter'),
(13,1,@GORLOCPING,0,31,3,@LAFOO,0,0,0,'','Spell Gorloc Location Ping targets Lafoo'),
(13,1,@GORLOCPING,1,31,3,@JALOOT,0,0,0,'','Spell Gorloc Location Ping targets Jaloot'),
(13,1,@GORLOCPING,2,31,3,@MOODLE,0,0,0,'','Spell Gorloc Location Ping targets Moodle'),
(13,1,@DESSAWNRETAINER,0,31,3,@LAFOO,0,0,0,'','Spell Dessawn Retainer targets Lafoo'),
(13,1,@DESSAWNRETAINER,1,31,3,@DAJIK,0,0,0,'','Spell Dessawn Retainer targets Dajik the Wasp Hunter'),
(13,1,@DESSAWNRETAINER,2,31,3,@ZEPIK,0,0,0,'','Spell Dessawn Retainer targets  Zepik the Gorloc Hunter'),
(13,1,@DESSAWNRETAINER,3,31,3,@JALOOT,0,0,0,'','Spell Dessawn Retainer targets Jaloot '),
(13,1,@DESSAWNRETAINER,4,31,3,@MOODLE,0,0,0,'','Spell Dessawn Retainer targets Moodle'),
(13,1,@DESSAWNRETAINER,5,31,3,@GOREGEK,0,0,0,'','Spell Dessawn Retainer targets  Goregek'),
(13,1,@TREASUREPING,0,31,3,@LAFOO,0,0,0,'','Spell Dessawn Retainer targets Lafoo'),
(13,1,@TREASUREPING,1,31,3,@JALOOT,0,0,0,'','Spell Dessawn Retainer targets Jaloot '),
(13,1,@TREASUREPING,2,31,3,@MOODLE,0,0,0,'','Spell Dessawn Retainer targets Moodle'),
(13,1,@CHICKENLOCATIONPING,0,31,3,@GOREGEK,0,0,0,'','Spell chicken ping targets Goregek'),
(13,1,@CHICKENLOCATIONPING,1,31,3,@DAJIK,0,0,0,'','Spell chicken ping targets Dajik '),
(13,1,@CHICKENLOCATIONPING,2,31,3,@ZEPIK,0,0,0,'','Spell chicken ping targets Zepik'),
(13,3,@SCAREDCHICKEN,0,31,3,@CHICKENESCAPEE,0,0,0,'','Scared Chicken targets only chicken escapee'),
(13,1,@MOSSWALKERAURA,0,31,3,@MOODLE,0,0,0,'','Mosswalker village aura targets moodle'),
(13,1,@SPEARBORNAURA,0,31,3,@JALOOT,0,0,0,'','spearborn encampment aura targets moodle'),
(13,1,@MISTWHISPERAURA,0,31,3,@ZEPIK,0,0,0,'','mistwhisper refuge aura targets zepik'),
(13,1,@SAPPHIREHIVEAURA,0,31,3,@DAJIK,0,0,0,'','sapphire hive aura targets dajik'),
(13,1,@THROWSPEAR,0,31,3,@RHUNOK,0,0,0,'','Spell Throw Spear targets Rhunok'),
(13,1,@CHAINS1,0,31,3,@RHUNOK,0,0,0,'','Spell Rhunok''s Chains targets Rhunok'),
(13,1,@CHAINS2,0,31,3,@RHUNOK,0,0,0,'','Spell Rhunok''s Chains targets Rhunok'),
(13,1,@SKYREACHPILLARAURA,0,31,3,@DAJIK,0,0,0,'','skyreach pillar aura targets dajik');
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=28371;
UPDATE `quest_template` SET `NextQuestId`=12931,`NextQuestIdChain`=12931 WHERE `Id`=12930;
UPDATE `quest_template` SET `PrevQuestId`=12930,`ExclusiveGroup`=-12931 WHERE `Id` IN (12931,12937);
UPDATE `quest_template` SET `PrevQuestId`=12931,`ExclusiveGroup`=-12957 WHERE `Id` IN (12957,12964);
UPDATE `quest_template` SET `PrevQuestId`=12957,`ExclusiveGroup`=-12965 WHERE `Id` IN (12965,12978);
UPDATE `quest_template` SET `NextQuestId`=12984 WHERE `Id`=12980;
UPDATE `quest_template` SET `PrevQuestId`=12980,`NextQuestId`=12988 WHERE `Id`=12984;
UPDATE `quest_template` SET `ExclusiveGroup`=-12988 WHERE `Id`=12988;
UPDATE `quest_template` SET `PrevQuestId`=12984,`ExclusiveGroup`=-12988 WHERE `Id`=12991;
UPDATE `quest_template` SET `PrevQuestId`=12988,`NextQuestId`=12998 WHERE `Id` =12993;
UPDATE `quest_template` SET `PrevQuestId`=12993,`NextQuestIdChain`=13007 WHERE `Id` =12998;
-- Add Enchant Boots - Lesser Accuracy to appropriate trainers
DELETE FROM `npc_trainer` WHERE `spell`=63746;
INSERT INTO `npc_trainer` (`entry`,`spell`,`spellcost`,`reqskill`,`reqskillvalue`,`reqlevel`) VALUES
(201009,63746,5000,333,225,0);
SET @GUID := 110224;
SET @DIRT := 28362;

DELETE FROM `creature` WHERE `guid` BETWEEN @GUID+0 AND @GUID+33;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`MovementType`) VALUES
(@GUID+0 ,@DIRT,571,1,1,0,5652.974,4494.586,-136.6679,2.600541,300,0,0),
(@GUID+1 ,@DIRT,571,1,1,0,5682.897,4479.211,-135.6831,4.817109,300,0,0),
(@GUID+2 ,@DIRT,571,1,1,0,5616.783,4507.514,-136.2347,2.792527,300,0,0),
(@GUID+3 ,@DIRT,571,1,1,0,5566.848,4608.069,-140.0046,0.08726646,300,0,0),
(@GUID+4 ,@DIRT,571,1,1,0,5726.52,4535.192,-138.999,1.256637,300,0,0),
(@GUID+5 ,@DIRT,571,1,1,0,5693.346,4629.685,-138.3224,4.921828,300,0,0),
(@GUID+6 ,@DIRT,571,1,1,0,5733.776,4598.793,-134.9071,0.8028514,300,0,0),
(@GUID+7 ,@DIRT,571,1,1,0,5752.648,4496.542,-132.4478,4.886922,300,0,0),
(@GUID+8 ,@DIRT,571,1,1,0,5705.064,4435.867,-141.0292,5.986479,300,0,0),
(@GUID+9 ,@DIRT,571,1,1,0,5736.984,4459.437,-134.9569,1.291544,300,0,0),
(@GUID+10,@DIRT,571,1,1,0,5579.51,4442.721,-139.8728,5.5676,300,0,0),
(@GUID+11,@DIRT,571,1,1,0,5726.514,4370.49,-138.5187,3.106686,300,0,0),
(@GUID+12,@DIRT,571,1,1,0,5801.268,4529.366,-134.282,3.228859,300,0,0),
(@GUID+13,@DIRT,571,1,1,0,5806.822,4481.874,-131.8635,4.607669,300,0,0),
(@GUID+14,@DIRT,571,1,1,0,5868.016,4498.958,-133.2091,3.525565,300,0,0),
(@GUID+15,@DIRT,571,1,1,0,5865.933,4563.596,-133.3011,3.525565,300,0,0),
(@GUID+16,@DIRT,571,1,1,0,5847.393,4599.288,-136.0588,5.532694,300,0,0),
(@GUID+17,@DIRT,571,1,1,0,5768.064,4605.938,-137.6851,3.874631,300,0,0),
(@GUID+18,@DIRT,571,1,1,0,5743.717,4645.34,-135.1314,3.071779,300,0,0),
(@GUID+19,@DIRT,571,1,1,0,5789.393,4640.829,-135.5909,5.532694,300,0,0),
(@GUID+20,@DIRT,571,1,1,0,5906.656,4612.754,-132.0416,2.600541,300,0,0),
(@GUID+21,@DIRT,571,1,1,0,5842.542,4682.008,-134.9288,4.677482,300,0,0),
(@GUID+22,@DIRT,571,1,1,0,5822.073,4726.694,-132.8639,6.195919,300,0,0),
(@GUID+23,@DIRT,571,1,1,0,5917.018,4735.479,-137.8103,1.43117,300,0,0),
(@GUID+24,@DIRT,571,1,1,0,5863.843,4759.619,-131.9068,5.166174,300,0,0),
(@GUID+25,@DIRT,571,1,1,0,5656.485,4679.363,-132.4746,0.8552113,300,0,0),
(@GUID+26,@DIRT,571,1,1,0,5699.089,4671.949,-135.4732,5.986479,300,0,0),
(@GUID+27,@DIRT,571,1,1,0,5731.342,4688.484,-134.2571,3.438299,300,0,0),
(@GUID+28,@DIRT,571,1,1,0,5760.655,4690.131,-134.4649,5.585053,300,0,0),
(@GUID+29,@DIRT,571,1,1,0,5677.118,4725.341,-135.5663,3.577925,300,0,0),
(@GUID+30,@DIRT,571,1,1,0,5704.706,4763.644,-137.0218,5.009095,300,0,0),
(@GUID+31,@DIRT,571,1,1,0,5751.76,4767.774,-134.9354,3.979351,300,0,0),
(@GUID+32,@DIRT,571,1,1,0,5786.583,4751.955,-133.6232,0.7679449,300,0,0),
(@GUID+33,@DIRT,571,1,1,0,5807.025,4767.91,-134.8856,3.560472,300,0,0);
DELETE FROM `gameobject_loot_template` WHERE `entry`=24320 AND `item` IN (38340,38341,38397);
DELETE FROM `gameobject_loot_template` WHERE `entry`=24326 AND `item`=38397;
DELETE FROM `gameobject_loot_template` WHERE `entry`=24330 AND `item`=38335;
DELETE FROM `gameobject_loot_template` WHERE `entry`=25028 AND `item`=38337;

UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`=100 WHERE `entry` BETWEEN 24319 AND 24340;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`=100 WHERE `entry` IN (25026,25027,25028);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (51060,51068,51088,51094);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(51060,51226,1,'On spellhit Have Withered Batwing - Spellcast Withered Batwing Kill Credit'),
(51068,51227,1,'On spellhit Have Muddy Mire Maggot - Spellcast Muddy Mire Maggot Kill Credit'),
(51088,51228,1,'On spellhit Have Amberseed - Spellcast Amberseed Kill Credit'),
(51094,51229,1,'On spellhit Have Chilled Serpent Mucus - Spellcast Chilled Serpent Mucus Kill Credit');

DELETE FROM `spell_dbc` WHERE `Id`=50574;
INSERT INTO `spell_dbc` (`Id`,`Attributes`,`CastingTimeIndex`,`ProcChance`,`RangeIndex`,`EquippedItemClass`,`Effect1`,`EffectMiscValue1`,`EffectImplicitTargetA1`,`SchoolMask`,`Comment`) VALUES
(50574,256,1,101,11,-1,90,28042,25,1,'Captain Brandon Kill Credit');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=14 AND `SourceGroup`=9668 AND `SourceEntry` IN (13098,13119);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=9668 AND `SourceEntry`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,9668,13098,0,9,12587,0,0,0,'','Alchemist Finklestein - Show different gossip if player has taken quest Troll Patrol'),
(14,9668,13119,0,9,12541,0,0,0,'','Alchemist Finklestein - Show different gossip if player has taken quest Troll Patrol: The Alchemist''s Apprentice'),
(15,9668,0,0,9,12541,0,0,0,'','Alchemist Finklestein - Show gossip option only if player has taken quest Troll Patrol: The Alchemist''s Apprentice');
DELETE FROM `areatrigger_teleport` WHERE `id` IN (4917, 4919, 4921, 4922, 4923, 4924, 4925, 4927, 4928, 4929, 4930, 4931, 4932, 4933, 4934, 4935, 4936, 4941, 4944, 5326, 5328, 5329, 5330, 5331, 5447);
INSERT INTO `areatrigger_teleport` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `name`) VALUES
(4917, 559, 4054.57, 2923.23, 13.8179, 0, 'Arena - Nagrand - Teleport Target - Game On'),
(4919, 562, 6238.89, 264.155, 0.894302, 0, 'Arena - Bladesedge - Teleport Target - Game On'),
(4921, 562, 6238.89, 264.155, 0.894302, 0, 'Arena - Bladesedge - Teleport Target - Game On'),
(4922, 562, 6238.89, 264.155, 0.894302, 0, 'Arena - Bladesedge - Teleport Target - Game On'),
(4923, 562, 6238.89, 264.155, 0.894302, 0, 'Arena - Bladesedge - Teleport Target - Game On'),
(4924, 562, 6238.89, 264.155, 0.894302, 0, 'Arena - Bladesedge - Teleport Target - Game On'),
(4925, 562, 6238.89, 264.155, 0.894302, 0, 'Arena - Bladesedge - Teleport Target - Game On'),
(4927, 572, 1286.57, 1667.4, 39.602, 0, 'Arena - Undercity - Teleport Target - Game On'),
(4928, 572, 1286.57, 1667.4, 39.602, 0, 'Arena - Undercity - Teleport Target - Game On'),
(4929, 572, 1286.57, 1667.4, 39.602, 0, 'Arena - Undercity - Teleport Target - Game On'),
(4930, 572, 1286.57, 1667.4, 39.602, 0, 'Arena - Undercity - Teleport Target - Game On'),
(4931, 572, 1286.57, 1667.4, 39.602, 0, 'Arena - Undercity - Teleport Target - Game On'),
(4932, 572, 1286.57, 1667.4, 39.602, 0, 'Arena - Undercity - Teleport Target - Game On'),
(4933, 572, 1286.57, 1667.4, 39.602, 0, 'Arena - Undercity - Teleport Target - Game On'),
(4934, 572, 1286.57, 1667.4, 39.602, 0, 'Arena - Undercity - Teleport Target - Game On'),
(4935, 572, 1286.57, 1667.4, 39.602, 0, 'Arena - Undercity - Teleport Target - Game On'),
(4936, 572, 1286.57, 1667.4, 39.602, 0, 'Arena - Undercity - Teleport Target - Game On'),
(4941, 572, 1286.57, 1667.4, 39.602, 0, 'Arena - Undercity - Teleport Target - Game On'),
(4944, 562, 6238.89, 264.155, 0.894302, 0, 'Arena - Bladesedge - Teleport Target - Game On'),
(5326, 617, 1291.57, 792.965, 8.11463, 0, 'Arena - Dalaran Arena - Teleport Target'),
(5328, 617, 1291.57, 792.965, 8.11463, 0, 'Arena - Dalaran Arena - Teleport Target'),
(5329, 617, 1291.57, 792.965, 8.11463, 0, 'Arena - Dalaran Arena - Teleport Target'),
(5330, 617, 1291.57, 792.965, 8.11463, 0, 'Arena - Dalaran Arena - Teleport Target'),
(5331, 617, 1291.57, 792.965, 8.11463, 0, 'Arena - Dalaran Arena - Teleport Target'),
(5447, 618, 763.365, -284.29, 28.2767, 0, 'Arena - Orgrimmar - Teleport Target 3');
DELETE FROM `areatrigger_teleport` WHERE `id` IN (5127, 5128, 5129, 5130, 5131, 5132, 5133, 5134, 5135, 5136, 5137, 5138);
INSERT INTO `areatrigger_teleport` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `name`) VALUES
(5127, 0, 2462.76, -5598.19, 550.22, 3.66519, 'Ebon Hold (E.K.) Top Return Target'),
(5128, 0, 2472.67, -5530.1, 420.642, 4.50295, 'Ebon Hold (E.K.) Top West Target'),
(5129, 0, 2462.76, -5598.19, 550.22, 3.66519, 'Ebon Hold (E.K.) Top Return Target'),
(5130, 0, 2397.37, -5581.06, 420.643, 6.07375, 'Ebon Hold (E.K.) Top South Target'),
(5131, 0, 2462.76, -5598.19, 550.22, 3.66519, 'Ebon Hold (E.K.) Top Return Target'),
(5132, 0, 2522.45, -5605.7, 420.642, 2.94961, 'Ebon Hold (E.K.) Top North Target'),
(5133, 0, 2462.76, -5598.19, 550.22, 3.66519, 'Ebon Hold (E.K.) Top Return Target'),
(5134, 0, 2448.02, -5655.82, 420.643, 1.3439, 'Ebon Hold (E.K.) Top East Target'),
(5135, 0, 2435.77, -5610.34, 366.82, 0.610865, 'Ebon Hold (E.K.) Middle -> Bottom Target'),
(5136, 0, 2435.77, -5610.34, 366.82, 0.610865, 'Ebon Hold (E.K.) Middle -> Bottom Target'),
(5137, 0, 2472.9, -5530.64, 420.643, 4.45059, 'Ebon Hold (E.K.) Bottom -> Middle Target'),
(5138, 0, 2415.16, -5733.04, 153.922, 3.64774, 'Ebon Hold (E.K.) Bottom -> Ground Target');
SET @NPC_URSOC := 26633;
SET @NPC_RAGEPAW := 27328;
SET @NPC_SPIRIT := 27373;
SET @NPC_BLOOD := 28854;

DELETE FROM `gossip_menu_option` WHERE `menu_id`=9496 AND `id`=0;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9497 AND `id` IN (0,1,2);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(9496,0,0, 'We have the purified ashes of Vordrassil''s sapling.  If we can subdue Ursoc, we might be able to heal his soul.',1,1,9497,0,0,0, ''),
(9497,0,0, 'Assume your druidic bear form, Tur.',1,1,0,0,0,0, ''),
(9497,1,0, 'Help us subdue him.',1,1,0,0,0,0, ''),
(9497,2,0, 'We could use a healer.',1,1,0,0,0,0, '');

DELETE FROM `gossip_menu` WHERE `entry`=9496 AND `text_id`=12785;
DELETE FROM `gossip_menu` WHERE `entry`=9497 AND `text_id`=12787;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(9496,12785),
(9497,12787);

UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16, `dmg_multiplier`=4.6, `unit_flags`=32832 WHERE `entry`=@NPC_URSOC;
UPDATE `creature_template` SET `gossip_menu_id`=9496, `speed_walk`=0.666667, `speed_run`=0.992063 WHERE `entry`=@NPC_RAGEPAW;
UPDATE `creature_template` SET `speed_run`=0.357143 WHERE `entry`=@NPC_BLOOD;

UPDATE `creature_model_info` SET `bounding_radius`=3.666, `combat_reach`=9 WHERE `modelid`=23964;

DELETE FROM `creature_template_addon` WHERE `entry`=28854;
INSERT INTO `creature_template_addon` (`entry`,`bytes2`,`auras`) VALUES
(28854,1,'52561');

UPDATE `creature` SET `spawntimesecs`=0 WHERE `guid` IN (104065,104066,114077);

DELETE FROM `creature_addon` WHERE `guid` IN (104065,104066,104068,104069,104070,104071);
INSERT INTO `creature_addon` (`guid`,`auras`) VALUES
(104065,'16245'),
(104066,'16245'),
(104068,'16245'),
(104069,'16245'),
(104070,'16245'),
(104071,'16245');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (48398,48399);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=9496 AND `SourceEntry`=0;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry` IN (52551,52554);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=@NPC_RAGEPAW;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,48398,0,0,31,0,3,24921,0,0,'','Spell Tur''s Chains targets Cosmetic Trigger - LAB'),
(13,1,48398,0,0,29,0,@NPC_RAGEPAW,2,0,0,'','Spell Tur''s Chains target needs to be within 2y of Tur Ragepaw'),
(13,1,48399,0,0,31,0,3,24921,0,0,'','Spell Tur''s Chains targets Cosmetic Trigger - LAB'),
(13,1,48399,0,0,29,0,@NPC_RAGEPAW,2,0,0,'','Spell Tur''s Chains target needs to be within 2y of Tur Ragepaw'),
(15,9496,0,0,0,9,0,12236,0,0,0,'','Tur Ragepaw - Show gossip option only if player has taken quest Ursoc, the Bear God'),
(15,9496,0,0,1,9,0,12249,0,0,0,'','Tur Ragepaw - Show gossip option only if player has taken quest Ursoc, the Bear God'),
(17,0,52551,0,0,38,1,80,4,0,0,'','Spell Lifebloom will be casted only if target has less than 80% health'),
(17,0,52554,0,0,38,1,65,4,0,0,'','Spell Nourish will be casted only if target has less than 65% health'),
(22,14,@NPC_RAGEPAW,0,0,1,1,48368,1,0,0,'','SAI of Tur Ragepaw triggers only if under the effect of aura Bearform'),
(22,16,@NPC_RAGEPAW,0,0,1,1,48369,1,0,0,'','SAI of Tur Ragepaw triggers only if under the effect of aura Moonkin Form'),
(22,17,@NPC_RAGEPAW,0,0,1,1,48371,1,0,0,'','SAI of Tur Ragepaw triggers only if under the effect of aura Tree of Life');

DELETE FROM `creature_text` WHERE `entry` IN (@NPC_RAGEPAW,@NPC_SPIRIT);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@NPC_RAGEPAW,0,0, 'Stay behind me, $r.  I will do my best to protect you.',12,0,100,0,0,0, 'Tur Ragepaw'),
(@NPC_RAGEPAW,1,0, 'My freedom means nothing if we fail to save Ursoc.  Make haste, $N.',12,0,100,0,0,0, 'Tur Ragepaw'),
(@NPC_RAGEPAW,2,0, 'I will watch over you and your allies, $r.',12,0,100,0,0,0, 'Tur Ragepaw'),
(@NPC_RAGEPAW,3,0, 'Ursoc, brother of Ursol and guardian of the furbolg tribes... show yourself!',12,0,100,0,0,0, 'Tur Ragepaw'),
(@NPC_SPIRIT,0,0, 'I thank you all. The druids of old were wise to tear down Vordrassil, for its roots seep deep into the dwelling of an ancient evil.',12,0,100,0,0,0, 'Spirit of Ursoc'),
(@NPC_SPIRIT,1,0, 'You know their kind as old gods. Beware Yogg-Saron, the beast with a thousand maws. His evil extends beyond Vordrassil''s roots.',12,0,100,0,0,0, 'Spirit of Ursoc');

DELETE FROM `waypoints` WHERE `entry`=@NPC_RAGEPAW;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(@NPC_RAGEPAW, 1, 4688.4, -3854.87, 327.0471, 'Tur Ragepaw'),
(@NPC_RAGEPAW, 2, 4705.639, -3845.388, 327.5565, 'Tur Ragepaw'),
(@NPC_RAGEPAW, 3, 4726.497, -3846.529, 330.2256, 'Tur Ragepaw'),
(@NPC_RAGEPAW, 4, 4743.628, -3848.904, 332.7676, 'Tur Ragepaw'),
(@NPC_RAGEPAW, 5, 4756.063, -3847.442, 333.9136, 'Tur Ragepaw'),
(@NPC_RAGEPAW, 6, 4782.305, -3843.417, 333.9443, 'Tur Ragepaw'),
(@NPC_RAGEPAW, 7, 4813.348, -3838.03, 336.6674, 'Tur Ragepaw'),
(@NPC_RAGEPAW, 8, 4835.112, -3837.782, 338.4213, 'Tur Ragepaw'),
(@NPC_RAGEPAW, 9, 4865.375, -3842.427, 338.2963, 'Tur Ragepaw');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (@NPC_URSOC,@NPC_BLOOD);
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@NPC_URSOC,@NPC_RAGEPAW,@NPC_SPIRIT,@NPC_BLOOD);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-104065,-104066,-104068,-104069,-104070,-104071,@NPC_URSOC,@NPC_RAGEPAW,@NPC_SPIRIT,@NPC_BLOOD) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC_RAGEPAW*100+0,@NPC_RAGEPAW*100+1,@NPC_RAGEPAW*100+2,@NPC_RAGEPAW*100+3,@NPC_SPIRIT*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-104068,0,0,0,38,0,100,0,0,1,0,0,11,48399,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cosmetic Trigger - LAB - On data 0 1 set - Spellcast Tur''s Chains'),
(-104068,0,1,0,38,0,100,0,0,2,0,0,11,48334,0,0,0,0,0,19,@NPC_RAGEPAW,20,0,0,0,0,0,'Cosmetic Trigger - LAB - On data 0 1 set - Spellcast Tur''s Chains'),
(-104069,0,0,0,38,0,100,0,0,1,0,0,11,48398,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cosmetic Trigger - LAB - On data 0 1 set - Spellcast Tur''s Chains'),
(-104069,0,1,0,38,0,100,0,0,2,0,0,11,48334,0,0,0,0,0,19,@NPC_RAGEPAW,20,0,0,0,0,0,'Cosmetic Trigger - LAB - On data 0 1 set - Spellcast Tur''s Chains'),
(-104070,0,0,0,38,0,100,0,0,1,0,0,11,48399,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cosmetic Trigger - LAB - On data 0 1 set - Spellcast Tur''s Chains'),
(-104070,0,1,0,38,0,100,0,0,2,0,0,11,48334,0,0,0,0,0,19,@NPC_RAGEPAW,20,0,0,0,0,0,'Cosmetic Trigger - LAB - On data 0 1 set - Spellcast Tur''s Chains'),
(-104071,0,0,0,38,0,100,0,0,1,0,0,11,48398,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cosmetic Trigger - LAB - On data 0 1 set - Spellcast Tur''s Chains'),
(-104071,0,1,0,38,0,100,0,0,2,0,0,11,48334,0,0,0,0,0,19,@NPC_RAGEPAW,20,0,0,0,0,0,'Cosmetic Trigger - LAB - On data 0 1 set - Spellcast Tur''s Chains'),
(-104065,0,0,0,8,0,100,0,48399,0,0,0,69,1,0,0,0,0,0,8,0,0,0,4672.254,-3872.959,327.6967,0,'Cosmetic Trigger - LAB - On spellhit Tur''s Chains - Move to position'),
(-104065,0,1,0,34,0,100,0,0,1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cosmetic Trigger - LAB - On movement inform - Despawn'),
(-104066,0,0,0,8,0,100,0,48398,0,0,0,69,1,0,0,0,0,0,8,0,0,0,4677.567,-3874.965,323.9017,0,'Cosmetic Trigger - LAB - On spellhit Tur''s Chains - Move to position'),
(-104066,0,1,0,34,0,100,0,0,1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cosmetic Trigger - LAB - On movement inform - Despawn'),

(@NPC_URSOC,0,0,0,54,0,100,0,0,0,0,0,5,53,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ursoc - Just summoned - Play emote'),
(@NPC_URSOC,0,1,0,0,0,100,0,7000,8000,20000,20000,11,52560,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ursoc - On update IC - Spellcast Summon Blood of the Old God'),
(@NPC_URSOC,0,2,0,0,0,100,0,10000,13000,21000,25000,11,52583,0,0,0,0,0,18,50,0,0,0,0,0,0,'Ursoc - On update IC - Spellcast Old God''s Influence'),
(@NPC_URSOC,0,3,0,9,0,100,0,0,5,9000,12000,11,52581,0,0,0,0,0,2,0,0,0,0,0,0,0,'Ursoc - On target within 5y - Spellcast Crunch Armor'),
(@NPC_URSOC,0,4,0,8,0,100,0,48549,0,0,0,12,@NPC_SPIRIT,3,25000,0,0,0,1,0,0,0,0,0,0,0,'Ursoc - On spellhit Ashes of Vordrassil - Summon Spirit of Ursoc'),
(@NPC_URSOC,0,5,0,6,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,114077,@NPC_RAGEPAW,0,0,0,0,0,'Ursoc - On death - Set data 0 1 Tur Ragepaw'),

(@NPC_RAGEPAW,0,0,1,11,0,100,0,0,0,0,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw - On spawn - Set faction default'),
(@NPC_RAGEPAW,0,1,2,61,0,100,0,0,0,0,0,45,0,2,0,0,0,0,9,24921,2,20,0,0,0,0,'Tur Ragepaw - On spawn - Set data 0 2 Cosmetic Trigger - LAB'),
(@NPC_RAGEPAW,0,2,3,61,0,100,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw - On spawn - Set unit_field_bytes1 (kneel)'),
(@NPC_RAGEPAW,0,3,4,61,0,100,0,0,0,0,0,82,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw - On spawn - Set npcflag gossip'),
(@NPC_RAGEPAW,0,4,0,61,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw - On spawn - Set reaction defensive'),
(@NPC_RAGEPAW,0,5,8,62,0,100,0,9497,0,0,0,80,@NPC_RAGEPAW*100+0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw - On gossip select - Run script 0'),
(@NPC_RAGEPAW,0,6,8,62,0,100,0,9497,1,0,0,80,@NPC_RAGEPAW*100+1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw - On gossip select - Run script 1'),
(@NPC_RAGEPAW,0,7,8,62,0,100,0,9497,2,0,0,80,@NPC_RAGEPAW*100+2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw - On gossip select - Run script 2'),
(@NPC_RAGEPAW,0,8,9,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Tur Ragepaw - On gossip select - Close gossip'),
(@NPC_RAGEPAW,0,9,10,61,0,100,0,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw - On gossip select - Remove npcflag gossip'),
(@NPC_RAGEPAW,0,10,0,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,9,24921,2,20,0,0,0,0,'Tur Ragepaw - On gossip select - Set data 0 1 Cosmetic Trigger - LAB'),
(@NPC_RAGEPAW,0,11,0,38,0,100,0,0,1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw - On data 0 1 set - Despawn'),
(@NPC_RAGEPAW,0,12,0,40,0,100,0,9,@NPC_RAGEPAW,0,0,80,@NPC_RAGEPAW*100+3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw - On WP 9 Reached - Run script 3'),
(@NPC_RAGEPAW,0,13,14,25,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw - On reset - Set event phase 1'),
(@NPC_RAGEPAW,0,14,0,61,0,100,0,0,0,0,0,28,52507,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw - On reset - Remove aura Ragepaw''s Presence'),
(@NPC_RAGEPAW,0,15,0,25,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw - On reset - Set event phase 2'),
(@NPC_RAGEPAW,0,16,0,25,0,100,0,0,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw - On reset - Set event phase 3'),
(@NPC_RAGEPAW,0,17,0,4,1,100,0,0,0,0,0,11,52507,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw - On aggro (phase 1) - Spellcast Ragepaw''s Presence'),
(@NPC_RAGEPAW,0,18,0,9,1,100,0,0,5,2500,4000,11,52504,0,0,0,0,0,2,0,0,0,0,0,0,0,'Tur Ragepaw - On target within 5y (phase 1) - Spellcast Lacerate'),
(@NPC_RAGEPAW,0,19,0,9,1,100,0,0,5,6000,8000,11,52506,0,0,0,0,0,2,0,0,0,0,0,0,0,'Tur Ragepaw - On target within 5y (phase 1) - Spellcast Maul'),
(@NPC_RAGEPAW,0,20,0,14,1,100,0,2000,30,20000,20000,11,6795,0,0,0,0,0,2,0,0,0,0,0,0,0,'Tur Ragepaw - On friendly attacked (phase 1) - Spellcast Growl'),
(@NPC_RAGEPAW,0,21,0,4,2,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw - On aggro (phase 2) - Stop combat movement'),
(@NPC_RAGEPAW,0,22,0,9,2,100,0,0,40,2500,4000,11,52501,0,0,0,0,0,2,0,0,0,0,0,0,0,'Tur Ragepaw - On target within 40y (phase 2) - Spellcast Wrath'),
(@NPC_RAGEPAW,0,23,0,9,2,100,0,0,40,13000,14000,11,52502,0,0,0,0,0,2,0,0,0,0,0,0,0,'Tur Ragepaw - On target within 40y (phase 2) - Spellcast Moonfire'),
(@NPC_RAGEPAW,0,24,0,0,4,100,0,0,0,1500,1500,11,52554,0,0,0,0,0,18,40,0,0,0,0,0,0,'Tur Ragepaw - On update IC (phase 4) - Spellcast Nourish'),
(@NPC_RAGEPAW,0,25,0,0,4,100,0,50,50,1700,1700,11,52551,0,0,0,0,0,18,40,0,0,0,0,0,0,'Tur Ragepaw - On update IC (phase 4) - Spellcast Lifebloom'),
(@NPC_RAGEPAW,0,26,0,4,4,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw - On aggro (phase 4) - Set reaction aggressive'),

(@NPC_SPIRIT,0,0,0,54,0,100,0,0,0,0,0,80,@NPC_SPIRIT*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Spirit of Ursoc - Just summoned - Run script'),

(@NPC_BLOOD,0,0,0,9,0,100,1,0,1.5,0,0,11,52564,0,0,0,0,0,1,0,0,0,0,0,0,0,'Blood of the Old God - On target within 1.5y - Spellcast Corruption of the Old God'),

(@NPC_RAGEPAW*100+0,9,0,0,0,0,100,0,0,0,0,0,11,48368,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 0 - Spellcast Bearform'),
(@NPC_RAGEPAW*100+0,9,1,0,0,0,100,0,300,300,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 0 - Set faction'),
(@NPC_RAGEPAW*100+0,9,2,0,0,0,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 0 - Remove unit_field_bytes1 (kneel)'),
(@NPC_RAGEPAW*100+0,9,3,0,0,0,100,0,2500,2500,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Tur Ragepaw script 0 - Say line'),
(@NPC_RAGEPAW*100+0,9,4,0,0,0,100,0,4700,4700,0,0,53,1,@NPC_RAGEPAW,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 0 - Start WP movement'),
(@NPC_RAGEPAW*100+0,9,6,0,0,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 0 - Set reaction aggressive'),
(@NPC_RAGEPAW*100+0,9,5,0,0,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 0 - Set event phase 1'),

(@NPC_RAGEPAW*100+1,9,0,0,0,0,100,0,0,0,0,0,11,48369,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 1 - Spellcast Moonkin Form'),
(@NPC_RAGEPAW*100+1,9,1,0,0,0,100,0,300,300,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 1 - Set faction'),
(@NPC_RAGEPAW*100+1,9,2,0,0,0,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 1 - Remove unit_field_bytes1 (kneel)'),
(@NPC_RAGEPAW*100+1,9,3,0,0,0,100,0,0,0,0,0,11,24905,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 1 - Spellcast Moonkin Form (Passive)'),
(@NPC_RAGEPAW*100+1,9,4,0,0,0,100,0,0,0,0,0,11,24907,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 1 - Spellcast Moonkin Aura'),
(@NPC_RAGEPAW*100+1,9,5,0,0,0,100,0,400,400,0,0,11,52503,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 1 - Spellcast Empowered Moonkin Aura'),
(@NPC_RAGEPAW*100+1,9,6,0,0,0,100,0,2500,2500,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,'Tur Ragepaw script 1 - Say line'),
(@NPC_RAGEPAW*100+1,9,7,0,0,0,100,0,4700,4700,0,0,53,1,@NPC_RAGEPAW,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 1 - Start WP movement'),
(@NPC_RAGEPAW*100+1,9,8,0,0,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 1 - Set reaction aggressive'),
(@NPC_RAGEPAW*100+1,9,9,0,0,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 1 - Set event phase 2'),

(@NPC_RAGEPAW*100+2,9,0,0,0,0,100,0,0,0,0,0,11,48371,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 2 - Spellcast Tree of Life'),
(@NPC_RAGEPAW*100+2,9,1,0,0,0,100,0,100,100,0,0,11,52553,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 2 - Spellcast Empowered Tree of Life'),
(@NPC_RAGEPAW*100+2,9,2,0,0,0,100,0,0,0,0,0,2,113,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 2 - Set faction'),
(@NPC_RAGEPAW*100+2,9,3,0,0,0,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 2 - Remove unit_field_bytes1 (kneel)'),
(@NPC_RAGEPAW*100+2,9,4,0,0,0,100,0,2600,2600,0,0,1,2,0,0,0,0,0,7,0,0,0,0,0,0,0,'Tur Ragepaw script 2 - Say line'),
(@NPC_RAGEPAW*100+2,9,5,0,0,0,100,0,4700,4700,0,0,53,1,@NPC_RAGEPAW,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 2 - Start WP movement'),
(@NPC_RAGEPAW*100+2,9,6,0,0,0,100,0,0,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 2 - Set event phase 3'),

(@NPC_RAGEPAW*100+3,9,0,0,0,0,100,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 3 - Set homeposition'),
(@NPC_RAGEPAW*100+3,9,1,0,0,0,100,0,6000,6000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tur Ragepaw script 3 - Say line'),
(@NPC_RAGEPAW*100+3,9,2,0,0,0,100,0,300,300,0,0,12,@NPC_URSOC,6,60000,0,0,0,8,0,0,0,4893.267,-3842.415,337.6485,3.124139,'Tur Ragepaw script 3 - Summon Ursoc'),

(@NPC_SPIRIT*100,9,0,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Spirit of Ursoc script 0 - Say line'),
(@NPC_SPIRIT*100,9,1,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Spirit of Ursoc script 0 - Say line');
SET @NPC_LARRY := 19720;
SET @NPC_MALONE := 19725;
SET @NPC_JACK := 19726;

DELETE FROM `gossip_menu_option` WHERE `menu_id`=8033;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(8033, 0, 0, 'Ezekiel said that you might have a certain book...', 1, 1, 0, 0, 0, 0, '');

UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry` IN (@NPC_LARRY,@NPC_MALONE,@NPC_JACK);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC_LARRY,@NPC_MALONE,@NPC_JACK) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC_LARRY,0,0,1,25,0,100,0,0,0,0,0,2,1194,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Dirty" Larry - On reset - Set faction'),
(@NPC_LARRY,0,1,2,61,0,100,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Dirty" Larry - On reset - Set unit_flags IMMUNE_TO_PC'),
(@NPC_LARRY,0,2,3,61,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Dirty" Larry - On reset - Set npcflag gossip, questgiver'),
(@NPC_LARRY,0,3,4,61,0,100,0,0,0,0,0,45,1,2,0,0,0,0,10,70376,@NPC_MALONE,0,0,0,0,0,'Dirty" Larry - On reset - Set data 1 2 "Epic" Malone'),
(@NPC_LARRY,0,4,0,61,0,100,0,0,0,0,0,45,1,2,0,0,0,0,10,70377,@NPC_JACK,0,0,0,0,0,'Dirty" Larry - On reset - Set data 1 2 "Creepjack"'),
(@NPC_LARRY,0,5,6,62,0,100,0,8033,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,'Dirty" Larry - On gossip select - Store targetlist'),
(@NPC_LARRY,0,6,7,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Dirty" Larry - On gossip select - Close Gossip'),
(@NPC_LARRY,0,7,8,61,0,100,0,0,0,0,0,1,0,5000,0,0,0,0,1,0,0,0,0,0,0,0,'Dirty" Larry - On gossip select - Say line'),
(@NPC_LARRY,0,8,9,61,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dirty" Larry - On gossip select - Set npcflag none'),
(@NPC_LARRY,0,9,10,61,0,100,0,0,0,0,0,70,0,0,0,0,0,0,10,70376,@NPC_MALONE,0,0,0,0,0,'Dirty" Larry - On gossip select - Respawn "Epic" Malone '),
(@NPC_LARRY,0,10,0,61,0,100,0,0,0,0,0,70,0,0,0,0,0,0,10,70377,@NPC_JACK,0,0,0,0,0,'Dirty" Larry - On gossip select - Respawn "Creepjack" '),
(@NPC_LARRY,0,11,0,52,0,100,0,0,@NPC_LARRY,0,0,1,1,5000,0,0,0,0,1,0,0,0,0,0,0,0,'Dirty" Larry - On text over - Say line'),
(@NPC_LARRY,0,12,0,52,0,100,0,1,@NPC_LARRY,0,0,1,2,2000,0,0,0,0,1,0,0,0,0,0,0,0,'Dirty" Larry - On text over - Say line'),
(@NPC_LARRY,0,13,0,52,0,100,0,2,@NPC_LARRY,0,0,1,3,2000,0,0,0,0,1,0,0,0,0,0,0,0,'Dirty" Larry - On text over - Say line'),
(@NPC_LARRY,0,14,0,52,0,100,0,3,@NPC_LARRY,0,0,1,4,2000,0,0,0,0,1,0,0,0,0,0,0,0,'Dirty" Larry - On text over - Say line'),
(@NPC_LARRY,0,15,16,52,0,100,0,4,@NPC_LARRY,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dirty" Larry - On text over - Set faction'),
(@NPC_LARRY,0,16,17,61,0,100,0,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dirty" Larry - On text over - Remove unit_flags IMMUNE_TO_PC'),
(@NPC_LARRY,0,17,18,61,0,100,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,'Dirty" Larry - On text over - Attack'),
(@NPC_LARRY,0,18,19,61,0,100,0,0,0,0,0,100,1,0,0,0,0,0,10,70376,@NPC_MALONE,0,0,0,0,0,'Dirty" Larry - On text over - Send targetlist to "Epic" Malone'),
(@NPC_LARRY,0,19,20,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,10,70376,@NPC_MALONE,0,0,0,0,0,'Dirty" Larry - On text over - Set data 1 1 "Epic" Malone'),
(@NPC_LARRY,0,20,21,61,0,100,0,0,0,0,0,100,1,0,0,0,0,0,10,70377,@NPC_JACK,0,0,0,0,0,'Dirty" Larry - On text over - Send targetlist to "Creepjack"'),
(@NPC_LARRY,0,21,0,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,10,70377,@NPC_JACK,0,0,0,0,0,'Dirty" Larry - On text over - Set data 1 1 "Creepjack"'),
(@NPC_LARRY,0,22,23,2,0,100,0,0,20,0,0,15,10231,0,0,0,0,0,16,0,0,0,0,0,0,0,'Dirty" Larry - On health below 20% - Quest credit'),
(@NPC_LARRY,0,23,24,61,0,100,0,0,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dirty" Larry - On health below 20% - Say line'),
(@NPC_LARRY,0,24,3,61,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dirty" Larry - On health below 20% - Evade'),
(@NPC_LARRY,0,25,0,11,0,100,0,0,0,0,0,42,0,15,0,0,0,0,1,0,0,0,0,0,0,0,'Dirty" Larry - On spawn - Set invincibility HP level'),

(@NPC_MALONE,0,0,1,25,0,100,0,0,0,0,0,2,1194,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Epic" Malone - On reset - Set faction'),
(@NPC_MALONE,0,1,0,61,0,100,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Epic" Malone - On reset - Set unit_flags IMMUNE_TO_PC'),
(@NPC_MALONE,0,2,3,38,0,100,0,1,1,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Epic" Malone - On data 1 1 set - Set faction'),
(@NPC_MALONE,0,3,4,61,0,100,0,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Epic" Malone - On data 1 1 set - Remove unit_flags IMMUNE_TO_PC'),
(@NPC_MALONE,0,4,0,61,0,100,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,'"Epic" Malone - On data 1 1 set - Attack'),
(@NPC_MALONE,0,5,0,38,0,100,0,1,2,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Epic" Malone - On data 1 2 set - Evade'),

(@NPC_JACK,0,0,1,25,0,100,0,0,0,0,0,2,1194,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Creepjack" - On reset - Set faction'),
(@NPC_JACK,0,1,0,61,0,100,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Creepjack" - On reset - Set unit_flags IMMUNE_TO_PC'),
(@NPC_JACK,0,2,3,38,0,100,0,1,1,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Creepjack" - On data 1 1 set - Set faction'),
(@NPC_JACK,0,3,4,61,0,100,0,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Creepjack" - On data 1 1 set - Remove unit_flags IMMUNE_TO_PC'),
(@NPC_JACK,0,4,0,61,0,100,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,'"Creepjack" - On data 1 1 set - Attack'),
(@NPC_JACK,0,5,0,38,0,100,0,1,2,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'"Creepjack" - On data 1 2 set - Evade');

DELETE FROM `creature_text` WHERE `entry`=@NPC_LARRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@NPC_LARRY, 0, 0, 'Time to teach you a lesson in manners, little boy! ', 12, 0, 100, 0, 0, 0, '"Dirty" Larry'),
(@NPC_LARRY, 1, 0, 'I''m now going to give you to the count of "3" to get out of here before I sick the dogs on you.', 12, 0, 100, 0, 0, 0, '"Dirty" Larry'),
(@NPC_LARRY, 2, 0, '1...', 12, 0, 100, 0, 0, 0, '"Dirty" Larry'),
(@NPC_LARRY, 3, 0, '2...', 12, 0, 100, 0, 0, 0, '"Dirty" Larry'),
(@NPC_LARRY, 4, 0, 'Time to meet your maker!', 12, 0, 100, 0, 0, 0, '"Dirty" Larry'),
(@NPC_LARRY, 5, 0, 'Alright, we give up! Don''t hurt us!', 12, 0, 100, 0, 0, 0, '"Dirty" Larry');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=8033;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,8033,0,0,9,10231,0,0,0,'','"Dirty" Larry only show gossip if player is on and has not completed What Book? I Dont See Any Book');
SET @NPC_HEBJIN := 28636;
SET @NPC_BAT := 28639;
SET @GO_DRUM := 190695;

DELETE FROM `creature` WHERE `guid` IN (117079,117301);

UPDATE `creature_template` SET `speed_run`=0.857143, `unit_flags`=33024, `AIName`='SmartAI' WHERE `entry`=@NPC_HEBJIN;
UPDATE `creature_template` SET `speed_run`=2, `unit_flags`=256, `AIName`='SmartAI', `InhabitType`=4 WHERE `entry`=@NPC_BAT;

DELETE FROM `event_scripts` WHERE `id`=18773;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(18773,0,10,@NPC_HEBJIN,180000,0,5988.715,-3878.036,417.1502,2.356194);

DELETE FROM `creature_text` WHERE `entry`=@NPC_HEBJIN;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@NPC_HEBJIN,0,0,'Who''s that beatin'' on my drum?',14,0,100,5,0,12009,'Heb''Jin'),
(@NPC_HEBJIN,1,0,'I''m gonna come down there and kill you good, $r!',14,0,100,15,0,0,'Heb''Jin'),
(@NPC_HEBJIN,2,0,'Now you gonna die!',14,0,100,0,0,0,'Heb''Jin');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=52151;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,52151,0,31,3,@NPC_BAT,0,0,'','Spell Bat Net targets Heb''Jin''s Bat');

DELETE FROM `waypoints` WHERE `entry`=@NPC_BAT;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@NPC_BAT,1,5982.633,-3879.573,422.4082,'Heb''Jin''s Bat'),
(@NPC_BAT,2,5968.549,-3869.597,420.1865,'Heb''Jin''s Bat'),
(@NPC_BAT,3,5954.345,-3851.714,395.2976,'Heb''Jin''s Bat'),
(@NPC_BAT,4,5934.977,-3822.782,369.5197,'Heb''Jin''s Bat');

UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=@GO_DRUM;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC_HEBJIN,@NPC_BAT) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GO_DRUM AND `source_type`=1;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC_HEBJIN*100,@NPC_BAT*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_HEBJIN,0,0,0,54,0,100,0,0,0,0,0,80,@NPC_HEBJIN*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Heb''Jin - Just summoned - Run script'),
(@NPC_HEBJIN,0,1,2,38,0,100,0,0,1,0,0,11,52354,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Heb''Jin - On data 0 1 set - Spellcast Script Effect - Creature Attack GUID from Dot Variable'),
(@NPC_HEBJIN,0,2,3,61,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,5937.22,-3820.871,366.5563,0, 'Heb''Jin - On data 0 1 set - Move to position'),
(@NPC_HEBJIN,0,3,4,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Heb''Jin - On data 0 1 set - Say line'),
(@NPC_HEBJIN,0,4,5,61,0,100,0,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Heb''Jin - On data 0 1 set - Remove unit_flags IMMUNE_TO_PC'),
(@NPC_HEBJIN,0,5,0,61,0,100,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Heb''Jin - On data 0 1 set - Start attack'),
(@NPC_HEBJIN,0,6,0,0,0,100,0,1000,1000,7000,8000,11,12734,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Heb''Jin - On update IC - Spellcast Ground Smash'),
(@NPC_HEBJIN,0,7,0,0,0,100,0,5000,5000,10000,12000,11,15548,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Heb''Jin - On update IC - Spellcast Thunder Clap'),
(@NPC_HEBJIN,0,8,0,13,0,100,0,12000,15000,0,0,11,12555,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Heb''Jin - On target casting - Spellcast Pummel'),

(@NPC_BAT,0,0,1,11,0,100,0,0,0,0,0,91,7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Heb''Jin''s Bat - On spawn - Remove unit_field_bytes1 (dead)'),
(@NPC_BAT,0,1,2,61,0,100,0,0,0,0,0,11,52353,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Heb''Jin''s Bat - On spawn - Spellcast Script Effect - Creature Capture GUID to Dot Variable'),
(@NPC_BAT,0,2,0,61,0,100,0,0,0,0,0,4,10892,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Heb''Jin''s Bat - On spawn - Play sound'),
(@NPC_BAT,0,3,0,27,0,100,1,0,0,0,0,53,1,@NPC_BAT,0,0,0,0,1,0,0,0,0,0,0,0, 'Heb''Jin''s Bat - On passenger boarded - Start WP movement'),
(@NPC_BAT,0,4,5,40,0,100,0,4,@NPC_BAT,0,0,28,43671,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Heb''Jin''s Bat - On WP 4 reached - Remove aura Ride Vehicle'),
(@NPC_BAT,0,5,6,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,@NPC_HEBJIN,10,0,0,0,0,0, 'Heb''Jin''s Bat - On WP 4 reached - Set data 0 1 Heb''Jin'),
(@NPC_BAT,0,6,0,61,0,100,0,0,0,0,0,80,@NPC_BAT*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Heb''Jin''s Bat - On WP 4 reached - Run script'),
(@NPC_BAT,0,7,8,8,0,100,0,52151,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Heb''Jin''s Bat - On spellhit Bat Net - Set unit_flags IMMUNE_TO_PC'),
(@NPC_BAT,0,8,9,61,0,100,0,0,0,0,0,90,7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Heb''Jin''s Bat - On spellhit Bat Net - Set unit_field_bytes1 (dead)'),
(@NPC_BAT,0,9,0,61,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Heb''Jin''s Bat - On spellhit Bat Net - Despawn after 5 seconds'),

(@GO_DRUM,1,0,1,70,0,100,0,2,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Heb''Jin''s Drum - On state changed - Store targetlist'),
(@GO_DRUM,1,1,0,61,0,100,0,0,0,0,0,100,1,0,0,0,0,0,19,@NPC_HEBJIN,100,0,0,0,0,0, 'Heb''Jin''s Drum - On state changed - Send targetlist to Heb''Jin'),

(@NPC_HEBJIN*100,9,0,0,0,0,100,0,0,0,0,0,11,52353,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Heb''Jin script - Spellcast Script Effect - Creature Capture GUID to Dot Variable'),
(@NPC_HEBJIN*100,9,1,0,0,0,100,0,3200,3200,0,0,11,52154,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Heb''Jin script - Spellcast Taunt'),
(@NPC_HEBJIN*100,9,2,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Heb''Jin script - Say line'),
(@NPC_HEBJIN*100,9,3,0,0,0,100,0,300,300,0,0,12,@NPC_BAT,8,0,0,0,0,8,0,0,0,5984.547,-3882.621,417.4379,1.919862, 'Heb''Jin script - Summon Heb''Jin''s Bat'),
(@NPC_HEBJIN*100,9,4,0,0,0,100,0,0,0,0,0,100,1,0,0,0,0,0,19,@NPC_BAT,10,0,0,0,0,0, 'Heb''Jin script - Send targetlist'),
(@NPC_HEBJIN*100,9,5,0,0,0,100,0,5700,5700,0,0,1,1,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Heb''Jin script - Say line'),
(@NPC_HEBJIN*100,9,6,0,0,0,100,0,2400,2400,0,0,11,43671,0,0,0,0,0,19,@NPC_BAT,10,0,0,0,0,0, 'Heb''Jin script - Spellcast Ride Vehicle'),

(@NPC_BAT*100,9,0,0,0,0,100,0,2000,2000,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Heb''Jin''s Bat script 1 - Remove unit_flags IMMUNE_TO_PC'),
(@NPC_BAT*100,9,1,0,0,0,100,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Heb''Jin''s Bat script 1 - Start attack');
DELETE FROM `spell_target_position` WHERE `id`=52464;
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
(52464, 609, 2384.13, -5900.07, 107.998, 0);

UPDATE `gameobject_template` SET `ScriptName`='' WHERE `entry`=190767;

DELETE FROM `creature` WHERE `guid`=129164;
DELETE FROM `creature_addon` WHERE `guid`=129164;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=37120;
DELETE FROM `smart_scripts` WHERE `entryorguid`=37120;
INSERT INTO `smart_scripts` (`entryorguid`,`event_type`,`event_param1`,`action_type`,`action_param1`,`action_param2`,`target_type`,`comment`) VALUES
(37120,20,24549,57,49888,1,7,'Highlord Darion Mograine - On quest rewarded - Remove item from player');
-- Malcrom
UPDATE `smart_scripts` SET `event_flags`=1 WHERE `entryorguid`=2305 AND `source_type`=0 AND `id`=2;
-- Kirkhammett
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=15656 AND `source_type`=0 AND `id`=0 AND `link`=1;
-- Runtime errors
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=1124 AND `source_type`=0 AND `id`=14 AND `link`=15;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=1124 AND `source_type`=0 AND `id`=15 AND `link`=16;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=5710 AND `source_type`=0 AND `id`=1 AND `link`=2;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=5997 AND `source_type`=0 AND `id`=8 AND `link`=9;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=7843 AND `source_type`=0 AND `id`=9 AND `link`=10;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=8564 AND `source_type`=0 AND `id`=12 AND `link`=13;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=10824 AND `source_type`=0 AND `id`=8 AND `link`=9;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=12236 AND `source_type`=0 AND `id`=3 AND `link`=4;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=12236 AND `source_type`=0 AND `id`=4 AND `link`=5;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=12236 AND `source_type`=0 AND `id`=9 AND `link`=10;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=12322 AND `source_type`=0 AND `id`=8 AND `link`=9;
-- Timed action scripts aren't supposed to have links set on them
UPDATE `smart_scripts` SET `link`=0, `event_type`=0 WHERE  `entryorguid`=83600 AND `source_type`=9 AND `id`=1 AND `link`=2;
UPDATE `smart_scripts` SET `link`=0, `event_type`=0 WHERE  `entryorguid`=83600 AND `source_type`=9 AND `id`=2 AND `link`=3;
UPDATE `smart_scripts` SET `event_type`=0 WHERE  `entryorguid`=83600 AND `source_type`=9 AND `id`=3 AND `link`=0;
-- Aforementioned issue about links on timed scripts
UPDATE `smart_scripts` SET `link`=0, `event_type`=0 WHERE  `entryorguid`=305400 AND `source_type`=9 AND `id`=1 AND `link`=2;
UPDATE `smart_scripts` SET `event_type`=0 WHERE  `entryorguid`=305400 AND `source_type`=9 AND `id`=2 AND `link`=0;
-- Missing AI's
UPDATE `creature_template` SET `ScriptName`='SmartAI' WHERE `entry` IN 
(10876,14389,13326,13328,12050,12053,10981,10986,10990,11678,11839,12051,12127,13179,13284,13438,13442,13443,13447,13577,13798,14282,14283,10987,10982,11603,11605,13089,13097,13089);
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=19354;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=19354;
DELETE FROM `smart_scripts` WHERE `entryorguid`=19354 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`id`,`event_type`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`target_type`,`comment`) VALUES
(19354,0,0,0,8000,12000,8000,14000,11,16856,0,2,'Arzeth the Merciless - Cast Mortal Strike'),
(19354,1,9,0,0,30,12000,14000,11,15245,1,2,'Arzeth the Merciless - Cast Shadow Bolt Volley'),
(19354,2,8,1,35460,0,0,0,36,20680,1,1,'Arzeth the Merciless - Change Template to Arzeth the Powerless after using Staff of the Dreghood Elders');
UPDATE `smart_scripts` SET `event_type`=37 WHERE `entryorguid` IN (589,476,95) AND `id`=0 AND `source_type`=0;

UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=3448 AND `source_type`=0 AND `id`=3;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=61 AND `source_type`=1 AND `id`=3;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=22231 AND `source_type`=0 AND `id`=0;
ALTER TABLE `game_event`
ADD COLUMN `announce` tinyint(3) unsigned NULL DEFAULT 2 COMMENT '0 dont announce, 1 announce, 2 value from config' AFTER `world_event`;
SET @CGUID := 110258;

SET @NPC_BUNNY := 23837;
SET @NPC_WARRIOR := 28388;
SET @NPC_KUTUBESA := 28494;
SET @NPC_GAWANIL := 28495;
SET @NPC_CHULO := 28496;
SET @NPC_MEDICINEMAN := 28504;

UPDATE `creature` SET `spawntimesecs`=600 WHERE `id`=@NPC_KUTUBESA;
DELETE FROM `creature` WHERE `guid` IN (117763,117764,117766);
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+00 AND @CGUID+25;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+00, @NPC_MEDICINEMAN, 571, 1, 1, 5591.043, -3475.191, 351.5252, 0.1047198, 300, 0, 0),
(@CGUID+01, @NPC_MEDICINEMAN, 571, 1, 1, 5566.45, -3498.799, 351.0538, 4.590216, 300, 0, 0),
(@CGUID+02, @NPC_MEDICINEMAN, 571, 1, 1, 5547.046, -3498.974, 350.4519, 2.339428, 300, 0, 2),
(@CGUID+03, @NPC_MEDICINEMAN, 571, 1, 1, 5526.021, -3355.056, 364.3894, 4.677482, 300, 0, 0),
(@CGUID+04, @NPC_MEDICINEMAN, 571, 1, 1, 5517.316, -3449.934, 351.4341, 3.054326, 300, 0, 0),
(@CGUID+05, @NPC_BUNNY, 571, 1, 1, 5493.355, -3456.877, 350.4105, 2.024582, 300, 0, 0),
(@CGUID+06, @NPC_MEDICINEMAN, 571, 1, 1, 5521.364, -3386.496, 350.327, 5.654867, 300, 0, 2),
(@CGUID+07, @NPC_MEDICINEMAN, 571, 1, 1, 5492.875, -3459.563, 350.4502, 1.58825, 300, 0, 0),
(@CGUID+08, @NPC_MEDICINEMAN, 571, 1, 1, 5529.104, -3382.233, 350.4102, 2.356194, 300, 0, 0),
(@CGUID+09, @NPC_MEDICINEMAN, 571, 1, 1, 5541.636, -3425.828, 350.7735, 1.58825, 300, 0, 0),
(@CGUID+10, @NPC_WARRIOR, 571, 1, 1, 5674.67, -3491.495, 364.4726, 0.5366452, 300, 0, 0),
(@CGUID+11, @NPC_WARRIOR, 571, 1, 1, 5648.147, -3448.292, 362.8895, 5.986479, 300, 0, 0),
(@CGUID+12, @NPC_WARRIOR, 571, 1, 1, 5666.273, -3428.566, 365.5977, 6.085189, 300, 0, 0),
(@CGUID+13, @NPC_WARRIOR, 571, 1, 1, 5503.863, -3369.427, 363.1629, 4.918784, 300, 0, 0),
(@CGUID+14, @NPC_WARRIOR, 571, 1, 1, 5533.224, -3322.825, 366.5383, 0.8552113, 300, 0, 0),
(@CGUID+15, @NPC_WARRIOR, 571, 1, 1, 5528.603, -3501.259, 350.6893, 0.7853982, 300, 0, 0),
(@CGUID+16, @NPC_WARRIOR, 571, 1, 1, 5646.593, -3513.597, 362.6178, 0.2094395, 300, 0, 0),
(@CGUID+17, @NPC_WARRIOR, 571, 1, 1, 5525.68, -3477.987, 350.4114, 5.487214, 300, 0, 0),
(@CGUID+18, @NPC_BUNNY, 571, 1, 1, 5527.289, -3380.66, 350.4102, 1.867502, 120, 0, 0),
(@CGUID+19, @NPC_GAWANIL, 571, 1, 1, 5601.297, -3501.478, 350.4102, 2.059489, 600, 0, 0),
(@CGUID+20, @NPC_CHULO, 571, 1, 1, 5508.03, -3418.04, 350.9052, 5.689773, 600, 0, 0),
(@CGUID+21, @NPC_BUNNY, 571, 1, 1, 5627.774, -3505.409, 355.8583, 5.044002, 120, 0, 0),
(@CGUID+22, @NPC_BUNNY, 571, 1, 1, 5637.709, -3478.724, 354.5638, 4.502949, 120, 0, 0),
(@CGUID+23, @NPC_BUNNY, 571, 1, 1, 5553.081, -3459.962, 350.4102, 6.213372, 120, 0, 0),
(@CGUID+24, @NPC_BUNNY, 571, 1, 1, 5618.041, -3450.443, 353.8071, 4.939282, 120, 0, 0),
(@CGUID+25, @NPC_BUNNY, 571, 1, 1, 5647.352, -3502.605, 362.8272, 4.39823, 120, 0, 0);

DELETE FROM `creature_addon` WHERE `guid` IN (@CGUID+02,@CGUID+06,@CGUID+19,@CGUID+20);
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`emote`) VALUES
(@CGUID+02,(@CGUID+02)*10,1,0),
(@CGUID+06,(@CGUID+06)*10,1,0),
(@CGUID+19,0,1,375),
(@CGUID+20,0,1,375);

DELETE FROM `waypoint_data` WHERE `id` IN ((@CGUID+02)*10,(@CGUID+06)*10);
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
((@CGUID+02)*10,1,5495.677,-3457.071,350.3303,0,10000,0,(@CGUID+02)*100+1,100,0),
((@CGUID+02)*10,2,5579.755,-3533.386,350.4519,0,10000,0,(@CGUID+02)*100+2,100,0),
((@CGUID+06)*10,1,5525.278,-3382.127,350.3272,0,10000,0,(@CGUID+06)*100+1,100,0),
((@CGUID+06)*10,2,5521.364,-3386.496,350.327,0,0,0,0,100,0),
((@CGUID+06)*10,3,5611.445,-3474.975,350.4102,0,10000,0,(@CGUID+06)*100+2,100,0),
((@CGUID+06)*10,4,5521.364,-3386.496,350.327,0,0,0,0,100,0);

DELETE FROM `waypoint_scripts` WHERE `id` IN ((@CGUID+02)*100+1,(@CGUID+02)*100+2,(@CGUID+06)*100+1,(@CGUID+06)*100+2);
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`,`guid`) VALUES
((@CGUID+02)*100+1,0,30,0,0,0,0,0,0,3.001966,858),
((@CGUID+02)*100+1,1,15,51733,1,0,0,0,0,0,859),
((@CGUID+02)*100+2,1,15,51733,1,0,0,0,0,0,860),
((@CGUID+06)*100+1,1,15,51733,1,0,0,0,0,0,861),
((@CGUID+06)*100+2,1,15,51733,1,0,0,0,0,0,862);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=51511;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry` IN (@NPC_KUTUBESA,@NPC_GAWANIL,@NPC_CHULO);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,3,51511,0,31,0,3,@NPC_BUNNY,0,0,'','Spell Toss Ice Boulder targets ELM General Purpose Bunny'),
(13,3,51511,1,31,0,3,@NPC_WARRIOR,0,0,'','Spell Toss Ice Boulder targets Jin''Alai Warrior'),
(13,3,51511,2,31,0,3,@NPC_MEDICINEMAN,0,0,'','Spell Toss Ice Boulder targets Jin''Alai Medicine Man'),
(22,1,@NPC_KUTUBESA,0,38,1,100,0,0,0,'','SAI Kutub''sa triggers only when at full health'),
(22,1,@NPC_GAWANIL,0,38,1,100,0,0,0,'','SAI Gawanil triggers only when at full health'),
(22,1,@NPC_CHULO,0,38,1,100,0,0,0,'','SAI Chulo the Mad triggers only when at full health');

DELETE FROM `creature_template_addon` WHERE `entry`=@NPC_WARRIOR;
INSERT INTO `creature_template_addon` (`entry`,`bytes2`,`emote`) VALUES
(@NPC_WARRIOR,1,375);

DELETE FROM `creature_text` WHERE `entry` IN (@NPC_KUTUBESA,@NPC_GAWANIL,@NPC_CHULO);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@NPC_KUTUBESA,0,0,'Death to the Zandalari and their puppets! Nothing can stop us now!',14,0,100,15,0,0,'Kutube''sa'),
(@NPC_GAWANIL,0,0,'Kill them! Kill them all and take back Zim''Torga!',14,0,100,15,0,0,'Gawanil'),
(@NPC_CHULO,0,0,'Hah! You''ll not get my treasure!',14,0,100,15,0,0,'Chulo the Mad');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (28387,@NPC_WARRIOR,@NPC_KUTUBESA,@NPC_GAWANIL,@NPC_CHULO,@NPC_MEDICINEMAN);
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry` IN (190618,190619,190620,190630);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (28387,@NPC_WARRIOR,@NPC_KUTUBESA,@NPC_GAWANIL,@NPC_CHULO,@NPC_MEDICINEMAN);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-98550,-98551,-(@CGUID+05),-(@CGUID+18),28387,@NPC_WARRIOR,@NPC_KUTUBESA,@NPC_GAWANIL,@NPC_CHULO,@NPC_MEDICINEMAN) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (190618,190619,190620,190630) AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-98550,0,0,0,38,0,100,0,0,1,0,0,11,51848,0,0,0,0,0,1,0,0,0,0,0,0,0,'ELM General Purpose Bunny - On event triggered - Spellcast Cauldron Disturbed'),
(-98551,0,0,0,38,0,100,0,0,1,0,0,11,51848,0,0,0,0,0,1,0,0,0,0,0,0,0,'ELM General Purpose Bunny - On event triggered - Spellcast Cauldron Disturbed'),
(-(@CGUID+05),0,0,0,38,0,100,0,0,1,0,0,11,51848,0,0,0,0,0,1,0,0,0,0,0,0,0,'ELM General Purpose Bunny - On event triggered - Spellcast Cauldron Disturbed'),
(-(@CGUID+18),0,0,0,38,0,100,0,0,1,0,0,11,51848,0,0,0,0,0,1,0,0,0,0,0,0,0,'ELM General Purpose Bunny - On event triggered - Spellcast Cauldron Disturbed'),

(28387,0,0,0,0,0,100,0,5000,7000,10000,14000,11,54673,0,0,0,0,0,2,0,0,0,0,0,0,0,'Zim''Torga Defender - On update IC - Spellcast Ice Boulder'),
(28387,0,1,0,1,0,100,0,20000,30000,30000,30000,11,51511,0,0,0,0,0,1,0,0,0,0,0,0,0,'Zim''Torga Defender - On update OOC - Spellcast Toss Ice Boulder'),

(@NPC_WARRIOR,0,0,0,4,0,100,0,0,0,0,0,11,38556,0,0,0,0,0,2,0,0,0,0,0,0,0,'Jin''Alai Warrior - On aggro - Spellcast Throw'),
(@NPC_WARRIOR,0,1,0,0,0,100,0,5000,6000,10000,12000,11,54630,0,0,0,0,0,2,0,0,0,0,0,0,0,'Jin''Alai Warrior - On update IC - Spellcast Poison Tipped Spear'),
(@NPC_WARRIOR,0,2,0,6,0,10,0,0,0,0,0,45,0,1,0,0,0,0,10,@CGUID+20,@NPC_CHULO,0,0,0,0,0,'Jin''Alai Warrior - On death (10% chance) - Set data 0 1 Chulo the Mad'),
(@NPC_WARRIOR,0,3,0,6,0,10,0,0,0,0,0,45,0,1,0,0,0,0,10,103225,@NPC_KUTUBESA,0,0,0,0,0,'Jin''Alai Warrior - On death (10% chance) - Set data 0 1 Kutube''sa'),
(@NPC_WARRIOR,0,4,0,6,0,10,0,0,0,0,0,45,0,1,0,0,0,0,10,@CGUID+19,@NPC_GAWANIL,0,0,0,0,0,'Jin''Alai Warrior - On death (10% chance) - Set data 0 1 Gawanil'),

(@NPC_KUTUBESA,0,0,1,38,0,100,0,0,1,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kutube''sa - On data 0 1 set - Remove unit_flags IMMUNE_TO_PC'),
(@NPC_KUTUBESA,0,1,2,61,0,100,0,0,0,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kutube''sa - On data 0 1 set - Set visible'),
(@NPC_KUTUBESA,0,2,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kutube''sa - On data 0 1 set - Say line'),
(@NPC_KUTUBESA,0,3,0,4,0,100,0,0,0,0,0,11,57793,0,0,0,0,0,2,0,0,0,0,0,0,0,'Kutube''sa - On aggro - Spellcast Heroic Leap'),
(@NPC_KUTUBESA,0,4,0,0,0,100,0,3000,5000,17500,20000,11,35144,0,0,0,0,0,2,0,0,0,0,0,0,0,'Kutube''sa - On update IC - Spellcast Vicious Rend'),
(@NPC_KUTUBESA,0,5,0,0,0,100,0,6000,8000,20000,25000,11,49807,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kutube''sa - On update IC - Spellcast Whirlwind'),
(@NPC_KUTUBESA,0,6,0,6,0,100,0,0,0,0,0,11,51815,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kutube''sa - On death - The Leaders at Jin''Alai: Summon the Treasure of Kutube''sa'),
(@NPC_KUTUBESA,0,7,8,11,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kutube''sa - On spawn - Set invisible'),
(@NPC_KUTUBESA,0,8,0,61,0,100,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kutube''sa - On spawn - Set unit_flags IMMUNE_TO_PC'),

(@NPC_GAWANIL,0,0,1,38,0,100,0,0,1,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gawanil - On data 0 1 set - Remove unit_flags IMMUNE_TO_PC'),
(@NPC_GAWANIL,0,1,2,61,0,100,0,0,0,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gawanil - On data 0 1 set - Set visible'),
(@NPC_GAWANIL,0,2,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gawanil - On data 0 1 set - Say line'),
(@NPC_GAWANIL,0,3,0,9,0,100,0,0,40,3400,4800,11,20791,0,0,0,0,0,2,0,0,0,0,0,0,0,'Gawanil - On target within 40y - Spellcast Shadow Bolt'),
(@NPC_GAWANIL,0,4,0,9,0,100,0,0,30,16500,18000,11,14868,0,0,0,0,0,2,0,0,0,0,0,0,0,'Gawanil - On target within 30y - Spellcast Curse of Agony'),
(@NPC_GAWANIL,0,5,0,9,0,100,0,0,30,16500,18000,11,39212,0,0,0,0,0,2,0,0,0,0,0,0,0,'Gawanil - On target within 30y - Spellcast Corruption'),
(@NPC_GAWANIL,0,6,0,2,0,100,0,0,70,20000,25000,11,35195,0,0,0,0,0,2,0,0,0,0,0,0,0,'Gawanil - On health below 70% - Spellcast Siphon Life'),
(@NPC_GAWANIL,0,7,0,6,0,100,0,0,0,0,0,11,51814,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gawanil - On death - Spellcast The Leaders at Jin''Alai: Summon the Treasure of Gawanil'),
(@NPC_GAWANIL,0,8,9,11,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gawanil - On spawn - Set invisible'),
(@NPC_GAWANIL,0,9,0,61,0,100,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gawanil - On spawn - Set unit_flags IMMUNE_TO_PC'),

(@NPC_CHULO,0,0,1,38,0,100,0,0,1,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,'Chulo the Mad - On data 0 1 set - Remove unit_flags IMMUNE_TO_PC'),
(@NPC_CHULO,0,1,2,61,0,100,0,0,0,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Chulo the Mad - On data 0 1 set - Set visible'),
(@NPC_CHULO,0,2,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Chulo the Mad - On data 0 1 set - Say line'),
(@NPC_CHULO,0,3,0,0,0,100,0,3000,5000,17500,20000,11,17687,0,0,0,0,0,1,0,0,0,0,0,0,0,'Chulo the Mad - On update IC - Spellcast Flurry'),
(@NPC_CHULO,0,4,0,0,0,100,0,6000,8000,20000,25000,11,50188,0,0,0,0,0,2,0,0,0,0,0,0,0,'Chulo the Mad - On update IC - Spellcast Wildly Flailing'),
(@NPC_CHULO,0,5,0,6,0,100,0,0,0,0,0,11,51813,0,0,0,0,0,1,0,0,0,0,0,0,0,'Chulo the Mad - On death - The Leaders at Jin''Alai: Summon the Treasure of Chulo the Mad'),
(@NPC_CHULO,0,6,7,11,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Chulo the Mad - On spawn - Set invisible'),
(@NPC_CHULO,0,7,0,61,0,100,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,'Chulo the Mad - On spawn - Set unit_flags IMMUNE_TO_PC'),

(@NPC_MEDICINEMAN,0,0,0,11,0,100,0,0,0,0,0,11,51733,0,0,0,0,0,1,0,0,0,0,0,0,0,'Jin''Alai Medicine Man - On spawn - Spellcast Shadow Channelling'),
(@NPC_MEDICINEMAN,0,1,0,21,0,100,0,0,0,0,0,11,51733,0,0,0,0,0,1,0,0,0,0,0,0,0,'Jin''Alai Medicine Man - On homeposition - Spellcast Shadow Channelling'),
(@NPC_MEDICINEMAN,0,2,0,0,0,100,0,5000,6000,15000,20000,11,54626,0,0,0,0,0,2,0,0,0,0,0,0,0,'Jin''Alai Medicine Man - On update IC - Spellcast Vial of Poison'),
(@NPC_MEDICINEMAN,0,3,0,2,0,100,1,0,50,0,0,11,54633,0,0,0,0,0,1,0,0,0,0,0,0,0,'Jin''Alai Medicine Man - On health below 50% - Spellcast Drink Healing Potion'),
(@NPC_MEDICINEMAN,0,4,0,6,0,10,0,0,0,0,0,45,0,1,0,0,0,0,10,@CGUID+20,@NPC_CHULO,0,0,0,0,0,'Jin''Alai Medicine Man - On death (10% chance) - Set data 0 1 Chulo the Mad'),
(@NPC_MEDICINEMAN,0,5,0,6,0,10,0,0,0,0,0,45,0,1,0,0,0,0,10,103225,@NPC_KUTUBESA,0,0,0,0,0,'Jin''Alai Medicine Man - On death (10% chance) - Set data 0 1 Kutube''sa'),
(@NPC_MEDICINEMAN,0,6,0,6,0,10,0,0,0,0,0,45,0,1,0,0,0,0,10,@CGUID+19,@NPC_GAWANIL,0,0,0,0,0,'Jin''Alai Medicine Man - On death (10% chance) - Set data 0 1 Gawanil'),

(190618,1,0,0,70,0,100,0,2,0,0,0,45,0,1,0,0,0,0,19,@NPC_BUNNY,5,0,0,0,0,0,'Blue Cauldron - On state changed - Set data 0 1 ELM General Purpose Bunny'),
(190619,1,0,0,70,0,100,0,2,0,0,0,45,0,1,0,0,0,0,19,@NPC_BUNNY,5,0,0,0,0,0,'Purple Cauldron - On state changed - Set data 0 1 ELM General Purpose Bunny'),
(190620,1,0,0,70,0,100,0,2,0,0,0,45,0,1,0,0,0,0,19,@NPC_BUNNY,5,0,0,0,0,0,'Red Cauldron - On state changed - Set data 0 1 ELM General Purpose Bunny'),
(190630,1,0,0,70,0,100,0,2,0,0,0,45,0,1,0,0,0,0,19,@NPC_BUNNY,5,0,0,0,0,0,'Green Cauldron - On state changed - Set data 0 1 ELM General Purpose Bunny');
SET @NPC_BUNNY1 := 23921;
SET @NPC_BUNNY2 := 23922;
SET @NPC_BUNNY3 := 23923;
SET @NPC_BUNNY4 := 23924;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=42564;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,42564,0,31,3,@NPC_BUNNY1,0,0,'','Spell Ever-burning Torch targets Halgrind Torch Bunny 01'),
(13,1,42564,1,31,3,@NPC_BUNNY2,0,0,'','Spell Ever-burning Torch targets Halgrind Torch Bunny 02'),
(13,1,42564,2,31,3,@NPC_BUNNY3,0,0,'','Spell Ever-burning Torch targets Halgrind Torch Bunny 03'),
(13,1,42564,3,31,3,@NPC_BUNNY4,0,0,'','Spell Ever-burning Torch targets Halgrind Torch Bunny 04');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@NPC_BUNNY1,@NPC_BUNNY2,@NPC_BUNNY3,@NPC_BUNNY4);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC_BUNNY1,@NPC_BUNNY2,@NPC_BUNNY3,@NPC_BUNNY4) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_BUNNY1,0,0,1,8,0,100,0,42564,0,0,0,11,42632,0,0,0,0,0,7,0,0,0,0,0,0,0,'Halgrind Torch Bunny 01 - On spellhit Ever-burning Torch - Spellcast Mission: Eternal Flame: Bunny 01 Kill Credit'),
(@NPC_BUNNY1,0,1,2,61,0,100,0,0,0,0,0,50,186457,20,0,0,0,0,8,0,0,0,868.8023,-4339.792,182.2122,1.937312,'Halgrind Torch Bunny 01 - On spellhit Ever-burning Torch - Summon Blacksmith Smoke (x2.0)'),
(@NPC_BUNNY1,0,2,3,61,0,100,0,0,0,0,0,50,186457,20,0,0,0,0,8,0,0,0,870.0853,-4333.663,175.9133,2.059488,'Halgrind Torch Bunny 01 - On spellhit Ever-burning Torch - Summon Blacksmith Smoke (x2.0)'),
(@NPC_BUNNY1,0,3,4,61,0,100,0,0,0,0,0,50,186457,20,0,0,0,0,8,0,0,0,863.741,-4335.814,175.8825,2.809975,'Halgrind Torch Bunny 01 - On spellhit Ever-burning Torch - Summon Blacksmith Smoke (x2.0)'),
(@NPC_BUNNY1,0,4,5,61,0,100,0,0,0,0,0,50,186457,20,0,0,0,0,8,0,0,0,865.0932,-4329.501,184.862,-1.239183,'Halgrind Torch Bunny 01 - On spellhit Ever-burning Torch - Summon Blacksmith Smoke (x2.0)'),
(@NPC_BUNNY1,0,5,6,61,0,100,0,0,0,0,0,50,186459,20,0,0,0,0,8,0,0,0,868.7471,-4339.819,182.2086,-2.216565,'Halgrind Torch Bunny 01 - On spellhit Ever-burning Torch - Summon Stratholme Fire Medium'),
(@NPC_BUNNY1,0,6,7,61,0,100,0,0,0,0,0,50,186459,20,0,0,0,0,8,0,0,0,870.0593,-4333.669,175.9119,-3.019413,'Halgrind Torch Bunny 01 - On spellhit Ever-burning Torch - Summon Stratholme Fire Medium'),
(@NPC_BUNNY1,0,7,8,61,0,100,0,0,0,0,0,50,186459,20,0,0,0,0,8,0,0,0,863.8395,-4335.782,175.8698,2.251473,'Halgrind Torch Bunny 01 - On spellhit Ever-burning Torch - Summon Stratholme Fire Medium'),
(@NPC_BUNNY1,0,8,0,61,0,100,0,0,0,0,0,50,186459,20,0,0,0,0,8,0,0,0,865.0274,-4329.538,184.8592,-2.513274,'Halgrind Torch Bunny 01 - On spellhit Ever-burning Torch - Summon Stratholme Fire Medium'),

(@NPC_BUNNY2,0,0,1,8,0,100,0,42564,0,0,0,11,42633,0,0,0,0,0,7,0,0,0,0,0,0,0,'Halgrind Torch Bunny 02 - On spellhit Ever-burning Torch - Spellcast Mission: Eternal Flame: Bunny 02 Kill Credit'),
(@NPC_BUNNY2,0,1,2,61,0,100,0,0,0,0,0,50,186457,20,0,0,0,0,8,0,0,0,990.3699,-4312.481,169.8106,-0.1396245,'Halgrind Torch Bunny 02 - On spellhit Ever-burning Torch - Summon Blacksmith Smoke (x2.0)'),
(@NPC_BUNNY2,0,2,3,61,0,100,0,0,0,0,0,50,186457,20,0,0,0,0,8,0,0,0,986.9997,-4317.327,175.7941,-0.9948372,'Halgrind Torch Bunny 02 - On spellhit Ever-burning Torch - Summon Blacksmith Smoke (x2.0)'),
(@NPC_BUNNY2,0,3,4,61,0,100,0,0,0,0,0,50,186457,20,0,0,0,0,8,0,0,0,984.7455,-4311.373,170.311,0.9250239,'Halgrind Torch Bunny 02 - On spellhit Ever-burning Torch - Summon Blacksmith Smoke (x2.0)'),
(@NPC_BUNNY2,0,4,5,61,0,100,0,0,0,0,0,50,186457,20,0,0,0,0,8,0,0,0,989.3688,-4306.89,178.847,-0.6806787,'Halgrind Torch Bunny 02 - On spellhit Ever-burning Torch - Summon Blacksmith Smoke (x2.0)'),
(@NPC_BUNNY2,0,5,6,61,0,100,0,0,0,0,0,50,186459,20,0,0,0,0,8,0,0,0,986.9559,-4317.405,175.7507,-0.7853968,'Halgrind Torch Bunny 02 - On spellhit Ever-burning Torch - Summon Stratholme Fire Medium'),
(@NPC_BUNNY2,0,6,7,61,0,100,0,0,0,0,0,50,186459,20,0,0,0,0,8,0,0,0,990.3775,-4312.451,169.8137,-1.605702,'Halgrind Torch Bunny 02 - On spellhit Ever-burning Torch - Summon Stratholme Fire Medium'),
(@NPC_BUNNY2,0,7,8,61,0,100,0,0,0,0,0,50,186459,20,0,0,0,0,8,0,0,0,984.8902,-4311.392,170.2798,-1.169369,'Halgrind Torch Bunny 02 - On spellhit Ever-burning Torch - Summon Stratholme Fire Medium'),
(@NPC_BUNNY2,0,8,0,61,0,100,0,0,0,0,0,50,186459,20,0,0,0,0,8,0,0,0,989.3943,-4306.688,178.8235,1.448622,'Halgrind Torch Bunny 02 - On spellhit Ever-burning Torch - Summon Stratholme Fire Medium'),

(@NPC_BUNNY3,0,0,1,8,0,100,0,42564,0,0,0,11,42634,0,0,0,0,0,7,0,0,0,0,0,0,0,'Halgrind Torch Bunny 03 - On spellhit Ever-burning Torch - Spellcast Mission: Eternal Flame: Bunny 03 Kill Credit'),
(@NPC_BUNNY3,0,1,2,61,0,100,0,0,0,0,0,50,186457,20,0,0,0,0,8,0,0,0,1082.445,-4486.045,197.2445,2.268925,'Halgrind Torch Bunny 03 - On spellhit Ever-burning Torch - Summon Blacksmith Smoke (x2.0)'),
(@NPC_BUNNY3,0,2,3,61,0,100,0,0,0,0,0,50,186457,20,0,0,0,0,8,0,0,0,1084.6,-4491.493,190.9798,1.239183,'Halgrind Torch Bunny 03 - On spellhit Ever-burning Torch - Summon Blacksmith Smoke (x2.0)'),
(@NPC_BUNNY3,0,3,4,61,0,100,0,0,0,0,0,50,186457,20,0,0,0,0,8,0,0,0,1088.523,-4486.683,191.1761,2.652894,'Halgrind Torch Bunny 03 - On spellhit Ever-burning Torch - Summon Blacksmith Smoke (x2.0)'),
(@NPC_BUNNY3,0,4,5,61,0,100,0,0,0,0,0,50,186457,20,0,0,0,0,8,0,0,0,1091.084,-4492.35,199.8263,1.53589,'Halgrind Torch Bunny 03 - On spellhit Ever-burning Torch - Summon Blacksmith Smoke (x2.0)'),
(@NPC_BUNNY3,0,5,6,61,0,100,0,0,0,0,0,50,186459,20,0,0,0,0,8,0,0,0,1082.465,-4486.012,197.2427,-2.530723,'Halgrind Torch Bunny 03 - On spellhit Ever-burning Torch - Summon Stratholme Fire Medium'),
(@NPC_BUNNY3,0,6,7,61,0,100,0,0,0,0,0,50,186459,20,0,0,0,0,8,0,0,0,1084.627,-4491.507,190.978,2.583081,'Halgrind Torch Bunny 03 - On spellhit Ever-burning Torch - Summon Stratholme Fire Medium'),
(@NPC_BUNNY3,0,7,8,61,0,100,0,0,0,0,0,50,186459,20,0,0,0,0,8,0,0,0,1088.549,-4486.602,191.1885,-0.4886912,'Halgrind Torch Bunny 03 - On spellhit Ever-burning Torch - Summon Stratholme Fire Medium'),
(@NPC_BUNNY3,0,8,0,61,0,100,0,0,0,0,0,50,186459,20,0,0,0,0,8,0,0,0,1090.992,-4492.313,199.8432,-1.937316,'Halgrind Torch Bunny 03 - On spellhit Ever-burning Torch - Summon Stratholme Fire Medium'),

(@NPC_BUNNY4,0,0,1,8,0,100,0,42564,0,0,0,11,42635,0,0,0,0,0,7,0,0,0,0,0,0,0,'Halgrind Torch Bunny 04 - On spellhit Ever-burning Torch - Spellcast Mission: Eternal Flame: Bunny 04 Kill Credit'),
(@NPC_BUNNY4,0,1,2,61,0,100,0,0,0,0,0,50,186457,20,0,0,0,0,8,0,0,0,800.0019,-4499.426,192.1779,0.5934101,'Halgrind Torch Bunny 04 - On spellhit Ever-burning Torch - Summon Blacksmith Smoke (x2.0)'),
(@NPC_BUNNY4,0,2,3,61,0,100,0,0,0,0,0,50,186457,20,0,0,0,0,8,0,0,0,793.686,-4502.086,187.2915,1.53589,'Halgrind Torch Bunny 04 - On spellhit Ever-burning Torch - Summon Blacksmith Smoke (x2.0)'),
(@NPC_BUNNY4,0,3,4,61,0,100,0,0,0,0,0,50,186457,20,0,0,0,0,8,0,0,0,798.1101,-4505.706,186.7136,-0.4886912,'Halgrind Torch Bunny 04 - On spellhit Ever-burning Torch - Summon Blacksmith Smoke (x2.0)'),
(@NPC_BUNNY4,0,4,5,61,0,100,0,0,0,0,0,50,186457,20,0,0,0,0,8,0,0,0,794.305,-4506.923,196.7457,0.7330382,'Halgrind Torch Bunny 04 - On spellhit Ever-burning Torch - Summon Blacksmith Smoke (x2.0)'),
(@NPC_BUNNY4,0,5,6,61,0,100,0,0,0,0,0,50,186459,20,0,0,0,0,8,0,0,0,800.0145,-4499.367,192.1402,-1.047198,'Halgrind Torch Bunny 04 - On spellhit Ever-burning Torch - Summon Stratholme Fire Medium'),
(@NPC_BUNNY4,0,6,7,61,0,100,0,0,0,0,0,50,186459,20,0,0,0,0,8,0,0,0,793.655,-4502.067,187.294,2.268925,'Halgrind Torch Bunny 04 - On spellhit Ever-burning Torch - Summon Stratholme Fire Medium'),
(@NPC_BUNNY4,0,7,8,61,0,100,0,0,0,0,0,50,186459,20,0,0,0,0,8,0,0,0,798.0519,-4505.68,186.7271,0.2094394,'Halgrind Torch Bunny 04 - On spellhit Ever-burning Torch - Summon Stratholme Fire Medium'),
(@NPC_BUNNY4,0,8,0,61,0,100,0,0,0,0,0,50,186459,20,0,0,0,0,8,0,0,0,794.0874,-4507.057,196.7687,-0.2268925,'Halgrind Torch Bunny 04 - On spellhit Ever-burning Torch - Summon Stratholme Fire Medium');
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=2369 AND `source_type`=0 AND `id`=7 AND `link`=8;
UPDATE `creature_text` SET `entry`=29227 WHERE `entry`=29173 AND `groupid`=76;
UPDATE `creature_text` SET `entry`=36794 WHERE `entry`=36658 AND `groupid` IN (1,2);

DELETE FROM `creature_text` WHERE `entry` IN (18879,17491);
INSERT INTO `creature_text`(`entry`,`groupid`,`id`,`text`,`type`,`comment`) VALUES
(18879,0,0,'The %s is very weak',16,'Phase Hunter - Emote'),
(17491,0,0,'Gakarah ma!',12,'Laughing Skull Rogue'),
(17491,0,1,'We are the true Horde!',12,'Laughing Skull Rogue');

DELETE FROM `smart_scripts` WHERE `entryorguid`=26670;
INSERT INTO `smart_scripts` VALUES 
(26670,0,0,1,1,0,100,6,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter - Out Of Combat - Allow Combat Movement'),
(26670,0,1,0,61,0,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter - Out Of Combat - Start Auto Attack'),
(26670,0,2,3,4,0,100,3,0,0,0,0,11,48854,0,0,0,0,0,2,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter (Normal) - On Aggro - Cast Shoot'),
(26670,0,3,0,61,0,100,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter (Normal) - On Aggro - Increment Phase'),
(26670,0,4,5,9,1,100,2,5,30,5000,8000,11,48854,0,0,0,0,0,2,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter (Normal) - At 5 - 30 Range - Cast Shoot'),
(26670,0,5,0,61,0,100,0,0,0,0,0,40,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter (Normal) - At 5 - 30 Range - Display ranged weapon'),
(26670,0,6,7,4,0,100,5,0,0,0,0,11,59241,0,0,0,0,0,2,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter (Heroic) - On Aggro - Cast Shoot'),
(26670,0,7,0,61,0,100,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter (Heroic) - On Aggro - Increment Phase'),
(26670,0,8,9,9,1,100,4,5,30,5000,8000,11,59241,0,0,0,0,0,2,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter (Heroic) - At 5 - 30 Range - Cast Shoot'),
(26670,0,9,0,61,0,100,0,0,0,0,0,40,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter (Heroic) - At 5 - 30 Range - Display ranged weapon'),
(26670,0,10,11,9,1,100,6,25,80,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter - At 25 - 80 Range - Allow Combat Movement'),
(26670,0,11,0,61,0,100,0,0,0,0,0,20,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter - At 25 - 80 Range - Start Auto Attack'),
(26670,0,12,13,9,1,100,6,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter - At 0 - 5 Range - Allow Combat Movement'),
(26670,0,13,14,61,0,100,0,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter - At 0 - 5 Range - Display melee weapon'),
(26670,0,14,0,61,0,100,0,0,0,0,0,20,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter - At 0 - 5 Range - Start Auto Attack'),
(26670,0,15,16,9,1,100,6,5,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter - At 5 - 15 Range - Allow Combat Movement'),
(26670,0,16,0,61,0,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter - At 5 - 15 Range - Start Auto Attack'),(26670,0,17,17,0,0,100,2,9000,14000,22000,26000,11,48871,0,0,0,0,0,5,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter (Normal) - In Combat - Cast Aimed Shot'),(26670,0,18,0,61,0,100,0,0,0,0,0,40,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter (Normal) - In Combat - Display ranged weapon'),(26670,0,19,20,0,0,100,4,9000,14000,22000,26000,11,59243,0,0,0,0,0,5,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter (Heroic) - In Combat - Cast Aimed Shot'),(26670,0,20,0,61,0,100,0,0,0,0,0,40,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter (Heroic) - In Combat - Display ranged weapon'),(26670,0,21,22,0,0,100,2,14000,17000,24000,27000,11,48872,1,0,0,0,0,6,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter (Normal) - In Combat - Cast Multi-Shot'),(26670,0,22,0,61,0,100,0,0,0,0,0,40,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter (Normal) - In Combat - Display ranged weapon'),(26670,0,23,24,0,0,100,4,14000,17000,24000,27000,11,59244,1,0,0,0,0,6,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter (Heroic) - In Combat - Cast Multi-Shot'),(26670,0,24,0,61,0,100,0,0,0,0,0,40,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter (Heroic) - In Combat - Display ranged weapon'),(26670,0,25,0,2,0,100,7,0,15,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter - At 15% HP - Increment Phase'),(26670,0,26,27,2,2,100,7,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter - At 15% HP - Allow Combat Movement'),(26670,0,27,0,61,0,100,0,0,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter - At 15% HP - Flee For Assist'),(26670,0,28,0,7,0,100,6,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ymirjar Flesh Hunter - On Evade - Display melee weapon');

DELETE FROM `creature_text` WHERE `entry` IN (23980,23954);
INSERT INTO `creature_text`(`entry`,`groupid`,`text`,`type`,`sound`,`comment`) VALUES
(23954,0,'I\'ll paint my face with your blood!',14,13207,'ingvar SAY_AGGRO_FIRST'),
(23954,1,'Mjul orm agn gjor!',14,13212,'ingvar SAY_KILL_FIRST'),
(23954,2,'My life for the... death god!',14,13213,'ingvar SAY_DEATH_FIRST'),
(23980,0,'I return! A second chance to carve out your skull!',14,13209,'ingvar SAY_AGGRO_SECOND'),
(23980,1,'I am a warrior born!',14,13214,'ingvar SAY_KILL_SECOND'),
(23980,2,'No! I can do... better! I can...',14,13211,'ingvar SAY_DEATH_SECOND');

DELETE FROM `creature_text` WHERE `entry`=11440;
INSERT INTO `creature_text`(`entry`,`id`,`text`,`type`,`probability`,`comment`) VALUES
(11440,0,'I\'ll crush you!',12,100,'Gordok Enforcer Aggro'),
(11440,1,'Me not feel so good.',12,100,'Gordok Enforcer Aggro'),
(11440,2,'Me smash! You die!',12,100,'Gordok Enforcer Aggro'),
(11440,3,'Raaar!!! Me smash $R!',12,100,'Gordok Enforcer Aggro');
-- Event flag additions
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=7023 AND `source_type`=0 AND `id`=0 AND `link`=1;
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=7023 AND `source_type`=0 AND `id`=1 AND `link`=0;
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=7023 AND `source_type`=0 AND `id`=2 AND `link`=3;
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=7023 AND `source_type`=0 AND `id`=3 AND `link`=0;
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=7023 AND `source_type`=0 AND `id`=4 AND `link`=5;
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=7023 AND `source_type`=0 AND `id`=5 AND `link`=0;
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=7023 AND `source_type`=0 AND `id`=6 AND `link`=7;
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=7023 AND `source_type`=0 AND `id`=7 AND `link`=0;
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=2244 AND `source_type`=0 AND `id`=11 AND `link`=12;
-- Insert Frozen Orb into The Prophet Tharon'ja's loot template
DELETE FROM `creature_loot_template` WHERE `entry`=31360 and `item`=43102;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(31360,43102,100,1,0,1,1);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=23 AND `SourceGroup`=12944 AND `SourceEntry` IN (20761,17051,17022,17018,17023,19444);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=23 AND `SourceGroup`=12944 AND `SourceEntry` IN (19219,17017,17025,19330,19448,17059,17060,17049,19206);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=23 AND `SourceGroup`=12944 AND `SourceEntry` IN (19220,19332,19333,19331,19449,19209,19208,19207,17053,17052);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=23 AND `SourceGroup`=12944 AND `SourceEntry` IN (19211,19210,19212,20040);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
-- Conditon rep Friendly
(23,12944,20761,0,0,5,0,59,16|32|64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Friendly with Thorium Brotherhood'),
(23,12944,17051,0,0,5,0,59,16|32|64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Friendly with Thorium Brotherhood'),
(23,12944,17022,0,0,5,0,59,16|32|64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Friendly with Thorium Brotherhood'),
(23,12944,17018,0,0,5,0,59,16|32|64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Friendly with Thorium Brotherhood'),
(23,12944,17023,0,0,5,0,59,16|32|64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Friendly with Thorium Brotherhood'),
(23,12944,19444,0,0,5,0,59,16|32|64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Friendly with Thorium Brotherhood'),
-- Conditon rep Honored
(23,12944,19219,0,0,5,0,59,32|64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Honored with Thorium Brotherhood'),
(23,12944,17017,0,0,5,0,59,32|64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Honored with Thorium Brotherhood'),
(23,12944,17025,0,0,5,0,59,32|64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Honored with Thorium Brotherhood'),
(23,12944,19330,0,0,5,0,59,32|64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Honored with Thorium Brotherhood'),
(23,12944,19448,0,0,5,0,59,32|64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Honored with Thorium Brotherhood'),
(23,12944,17059,0,0,5,0,59,32|64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Honored with Thorium Brotherhood'),
(23,12944,17060,0,0,5,0,59,32|64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Honored with Thorium Brotherhood'),
(23,12944,17049,0,0,5,0,59,32|64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Honored with Thorium Brotherhood'),
(23,12944,19206,0,0,5,0,59,32|64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Honored with Thorium Brotherhood'),
-- Conditon rep Revered
(23,12944,19220,0,0,5,0,59,64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Revered with Thorium Brotherhood'),
(23,12944,19332,0,0,5,0,59,64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Revered with Thorium Brotherhood'),
(23,12944,19333,0,0,5,0,59,64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Revered with Thorium Brotherhood'),
(23,12944,19331,0,0,5,0,59,64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Revered with Thorium Brotherhood'),
(23,12944,19449,0,0,5,0,59,64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Revered with Thorium Brotherhood'),
(23,12944,19209,0,0,5,0,59,64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Revered with Thorium Brotherhood'),
(23,12944,19208,0,0,5,0,59,64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Revered with Thorium Brotherhood'),
(23,12944,19207,0,0,5,0,59,64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Revered with Thorium Brotherhood'),
(23,12944,17053,0,0,5,0,59,64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Revered with Thorium Brotherhood'),
(23,12944,17052,0,0,5,0,59,64|128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Revered with Thorium Brotherhood'),
-- Conditon rep Exalted
(23,12944,19211,0,0,5,0,59,128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Exalted with Thorium Brotherhood'),
(23,12944,19210,0,0,5,0,59,128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Exalted with Thorium Brotherhood'),
(23,12944,19212,0,0,5,0,59,128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Exalted with Thorium Brotherhood'),
(23,12944,20040,0,0,5,0,59,128,0,0,0, '', 'Lokhtos Darkbargainer - Only sell item if Exalted with Thorium Brotherhood');
-- Updating maxcount for Scarab Scarab Bag
UPDATE `item_loot_template` SET `maxcount`=5 WHERE `entry`=21156 AND `item` IN (20858,20859,20860,20861,20862,20863,20864,20865);
UPDATE `reference_loot_template` SET `maxcount`=2 WHERE `entry`=14001 AND `item` IN (20866,20867,20868,20869,20870,20871,20872,20873);
-- Updating loot for Scarab Coffer
DELETE FROM `gameobject_loot_template` WHERE `entry` IN (17532,17533);
INSERT INTO `gameobject_loot_template` VALUES 
-- Scarab Coffer
(17532,21156,-100,1,0,1,1), -- Always drop a Sacrab Bag
(17532,1,100,1,0,-14001,1), -- Drop a AQ20 idol from reference
-- Large Scarab Coffer
(17533,21156,-100,1,0,1,1), -- Always drop a Sacrab Bag
(17533,1,100,1,0,-14502,1); -- Drop a AQ40 idol from reference
-- Updating loot for Large Scarab Coffer
DELETE FROM `reference_loot_template` WHERE `entry`=14502;
INSERT INTO `reference_loot_template` VALUES 
(14502,20877,0,1,1,1,3), -- 1 to 3  Idol of the Sage
(14502,20879,0,1,1,1,3), -- 1 to 3  Idol of Life
(14502,20878,0,1,1,1,3), -- 1 to 3  Idol of Rebirth
(14502,20881,0,1,1,1,3), -- 1 to 3  Idol of Strife
(14502,20874,0,1,1,1,3), -- 1 to 3  Idol of the Sun
(14502,20882,0,1,1,1,3), -- 1 to 3  Idol of War
(14502,20876,0,1,1,1,3), -- 1 to 3  Idol of Death
(14502,20875,0,1,1,1,3); -- 1 to 3  Idol of Night
-- Simplify skinloot for Axtroz and make sure something drops as well
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance`=50 WHERE `entry`=12899 AND `item`=8170;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance`=35 WHERE `entry`=12899 AND `item`=15414;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance`=10 WHERE `entry`=12899 AND `item`=8165;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance`=0 WHERE `entry`=12899 AND `item`=4304;
-- Update dropchance for rare items on Axtroz
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=5 WHERE `entry`=12899 AND `mincountOrRef`=-24020;
DELETE FROM `gameobject_template` WHERE `entry`=202193;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `WDBVerified`) VALUES 
(202193, 5, 9050, 'Silver Covenant Banner', '', '', '', 0, 0, 0.8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 15595);
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=17210 AND `source_type`=0 AND `id`=2 AND `link`=3;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=23619 AND `source_type`=0 AND `id`=1 AND `link`=2;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=23623 AND `source_type`=0 AND `id`=1 AND `link`=2;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=23624 AND `source_type`=0 AND `id`=1 AND `link`=2;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=23625 AND `source_type`=0 AND `id`=1 AND `link`=2;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=23626 AND `source_type`=0 AND `id`=1 AND `link`=2;
UPDATE `smart_scripts` SET `link`=0, `event_type`=0 WHERE  `entryorguid`=83600 AND `source_type`=9 AND `id`=0 AND `link`=1;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=1173 AND `source_type`=0 AND `id`=8 AND `link`=9;
UPDATE `smart_scripts` SET `link`=0 WHERE  `entryorguid`=23339 AND `source_type`=0 AND `id`=8 AND `link`=9;
UPDATE `creature_template` SET `ScriptName`='' WHERE  `entry` IN (10981,10982,10986,10987,10990,11602,11603,11605,11678,11839,12050,12051,12053,12127,13078,13080,13089,13097,13098,13179,13284,13316,13317,13326,13328,13396,13438,13442,13443,13447,13577,13797,13798,14283);
DROP TABLE IF EXISTS ip2nation;
DROP TABLE IF EXISTS ip2nationCountries;

DELETE FROM `command` WHERE `name` in ('account lock', 'account lock ip', 'account lock country');
INSERT INTO `command` (`name`,`security`,`help`) VALUES
('account lock ip', 0, 'Syntax: .account lock ip [on|off]\nAllow login from account only from current used IP or remove this requirement.'),
('account lock country', 0, 'Syntax: .account lock country [on|off]\nAllow login from account only from current used Country or remove this requirement.');
DELETE FROM `command` WHERE `name` = 'guild rename';
INSERT INTO `command` (`name`, `security`, `help`) VALUES
('guild rename', 3, 'Syntax: .guild rename "$GuildName" "$NewGuildName" \n\n Rename a guild named $GuildName with $NewGuildName. Guild name and new guild name must in quotes.');

SET @ENTRY1 := 96;
SET @ENTRY2 := 97;
DELETE FROM `trinity_string` WHERE `entry` IN (@ENTRY1, @ENTRY2);
INSERT INTO `trinity_string` (`entry`, `content_default`) VALUES
(@ENTRY1, 'The guild name \'%s\' is already taken'),
(@ENTRY2, 'Changed guild name \'%s\' to \'%s\'');
DROP TABLE IF EXISTS `autobroadcast`;
DELETE FROM `command` WHERE `name` = 'character rename';
INSERT INTO `command` (`name`, `security`, `help`) VALUES
('character rename', 2, 'Syntax: .character rename [$name] [$newName] \n\nMark selected in game or by $name in command character for rename at next login.\n\nIf $newName then the player will be forced rename.');

SET @ENTRY  := 98;
SET @ENTRY1 := 167;
DELETE FROM `trinity_string` WHERE `entry` IN (@ENTRY, @ENTRY+1, @ENTRY1);
INSERT INTO `trinity_string` (`entry`, `content_default`) VALUES
(@ENTRY,   '\'%s\' already exists as character name, choose another one'),
(@ENTRY+1, 'Player \'%s\' forced rename to \'%s\''),
(@ENTRY1,  'This name is reserved, choose another one');
UPDATE `creature_template` SET `mechanic_immune_mask`=`mechanic_immune_mask`
|1 -- CHARM
|2 -- DISORIENTED
|4 -- DISARM
|8 -- DISTRACT
|16 -- FEAR
|32 -- GRIP
|64 -- ROOT
|256 -- SILENCE
|512 -- SLEEP
|1024 -- SNARE
|2048 -- STUN
|4096 -- FREEZE
|8192 -- KNOCKOUT
|65536 -- POLYMORPH
|131072 -- BANISH
|524288 -- SHACKLE
|4194304 -- TURN
|8388608 -- HORROR
|67108864 -- DAZE
|536870912 -- SAPPED
WHERE `entry` IN
(28859,31734, -- Malygos
39863,39864,39944,39945,40142,40143,40144,40145, -- Halion
39746,39805, -- General Zarithrian
39747,39823, -- Saviana Ragefire
39751,39899,39920,39922, -- Baltharus the Warborn
37025,38064,37217,38103,  -- Stinky & Precious
10184,36538, -- Onyxia
33113,34003, -- Flame Leviathan
33293,33885, -- XT-002 Deconstructor
32857,33694, -- Stormcaller Brundir
32927,33692, -- Runemaster Molgeim
32867,33693, -- Steelbreaker
32930,33909, -- Kologarn
32933,32934, -- Kologarn Arms
33515,34175, -- Auriaya
32906,33360, -- Freya
32915,33391, -- Elder Brightleaf
32914,33393, -- Elder Stonebark
32913,33392, -- Elder Ironbranch
33350,            -- Mimiron
32865,33147, -- Thorim
33271,33449, -- General Vezax
32871,33070, -- Algalon the Observer
33288,33955); -- Yogg-Saron
UPDATE `creature_text` SET `sound`=16912 WHERE `entry`=36494 AND `groupid`=0 AND `id`=0;
UPDATE `creature_text` SET `sound`=16916 WHERE `entry`=36494 AND `groupid`=1 AND `id`=0;
UPDATE `creature_text` SET `sound`=16917 WHERE `entry`=36494 AND `groupid`=2 AND `id`=0;
UPDATE `creature_text` SET `sound`=16915 WHERE `entry`=36494 AND `groupid`=3 AND `id`=0;
UPDATE `creature_text` SET `type`=14, `sound`=16913 WHERE `entry`=36494 AND `groupid`=4 AND `id`=0;
UPDATE `creature_text` SET `type`=14, `sound`=16914 WHERE `entry`=36494 AND `groupid`=4 AND `id`=1;
UPDATE `creature_text` SET `type`=42 WHERE `entry`=36494 AND `groupid`=5 AND `id`=0;

DELETE FROM `creature_template_addon` WHERE `entry`=36494;
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(36494, 0, 0x0, 0x1, '68792');
UPDATE `spell_target_position` SET `target_map`=0 WHERE `id`=53821;
