/*
SQLyog Job Agent v12.09 (64 bit) Copyright(c) Webyog Inc. All Rights Reserved.


MySQL - 5.7.12 : Database - clubsports
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`clubsports` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `clubsports`;

/*View structure for view v_intragame_player_detail */

/*!50001 DROP TABLE IF EXISTS `v_intragame_player_detail` */;
/*!50001 DROP VIEW IF EXISTS `v_intragame_player_detail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_intragame_player_detail` AS select `IR`.`id` AS `IRid`,coalesce(`IR`.`updatedAt`,`IR`.`createdAt`) AS `reported_datetime`,`GP`.`game_id` AS `game_id`,`P`.`team_id` AS `team_id`,`P`.`is_subscriber_YN` AS `is_subscriber_YN`,`T`.`team_name` AS `team_name`,concat(left(`P`.`first_name`,1),'. ',(case when (char_length(`P`.`last_name`) >= 8) then concat(left(`P`.`last_name`,8),'...') else `P`.`last_name` end)) AS `short_name`,`P`.`player_id` AS `player_id`,`P`.`jersey_number` AS `jersey_number`,`VS`.`statistic_id` AS `statistic_id`,coalesce(`VS`.`parent_statistic_id`,`VS`.`statistic_id`) AS `parent_statistic_id`,coalesce(`VS`.`parent_statistic_name`,`VS`.`statistic_name`) AS `parent_statistic_name`,`VS`.`statistic_name` AS `statistic_name`,`VS`.`stat_ui_short` AS `stat_ui_short`,`VS`.`mobile_delay_secs` AS `mobile_delay_secs`,`VS`.`dialogue_box` AS `dialogue_box`,`IR`.`is_active_YN` AS `is_active_YN`,`VS`.`visible_gameday_YN` AS `visible_gameday_YN`,`IR`.`member_id` AS `member_id`,concat(`M`.`first_name`,' ',`M`.`last_name`) AS `reporting_member` from (((((`game_participants` `GP` join `players` `P` on((`P`.`player_id` = `GP`.`player_id`))) join `intragame_reporting` `IR` on(((`IR`.`game_id` = `GP`.`game_id`) and (`P`.`player_id` = `IR`.`player_id`)))) join `members` `M` on((`IR`.`member_id` = `M`.`member_id`))) left join `v_statistics` `VS` on((`VS`.`statistic_id` = `IR`.`statistic_id`))) left join `teams` `T` on((`T`.`team_id` = `P`.`team_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
