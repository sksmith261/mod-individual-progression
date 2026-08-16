-- The Colossus kill quests (108745 Zora / 108746 Regal / 108747 Ashi) granted credit
-- only through a C++ hook keyed to whoever landed the killing blow and their group.
-- With world bots roaming Silithus during the AQ war, the killing blow regularly lands
-- in someone else's group (or on an NPC), leaving questing players with nothing.
-- Grant proper quest kill credit on death to every player within 250 yards, the same
-- way world-event bosses do it. The objective count is 1, so players who also receive
-- group credit from the C++ hook cannot be over-credited.
--
-- NOTE: aq_war.sql inserts these creatures' SmartAI rows with id 0; this file only
-- appends id 1 and must stay a separate file — editing aq_war.sql would make the
-- hash-tracked updater re-apply its loot overwrites, which production has reverted.
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (15740, 15741, 15742) AND `id` = 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`,
`event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param6`,
`action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`,
`target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(15740, 0, 1, 0, 6, 0, 100, 0, 0, 0, 0, 0, 0, 0, 33, 15740, 0, 0, 0, 0, 0, 17, 0, 250, 0, 0, 0, 0, 0, 0, 'Colossus of Zora - On Death - Quest credit to players within 250y'),
(15741, 0, 1, 0, 6, 0, 100, 0, 0, 0, 0, 0, 0, 0, 33, 15741, 0, 0, 0, 0, 0, 17, 0, 250, 0, 0, 0, 0, 0, 0, 'Colossus of Regal - On Death - Quest credit to players within 250y'),
(15742, 0, 1, 0, 6, 0, 100, 0, 0, 0, 0, 0, 0, 0, 33, 15742, 0, 0, 0, 0, 0, 17, 0, 250, 0, 0, 0, 0, 0, 0, 'Colossus of Ashi - On Death - Quest credit to players within 250y');
