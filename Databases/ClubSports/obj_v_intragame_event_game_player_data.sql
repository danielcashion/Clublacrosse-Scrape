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

/*View structure for view v_intragame_event_game_player_data */

/*!50001 DROP TABLE IF EXISTS `v_intragame_event_game_player_data` */;
/*!50001 DROP VIEW IF EXISTS `v_intragame_event_game_player_data` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_intragame_event_game_player_data` AS select `E`.`event_id` AS `event_id`,`VIPD`.`game_id` AS `game_id`,`G`.`bracket_year` AS `bracket_year`,`VIPD`.`team_id` AS `team_id`,`VIPD`.`team_name` AS `team_name`,`VIPD`.`player_id` AS `player_id`,`VIPD`.`short_name` AS `short_name`,(case when (char_length(`VIPD`.`team_name`) >= 16) then concat(trim(left(`VIPD`.`team_name`,15)),'...') else `VIPD`.`team_name` end) AS `team_name_short`,coalesce(`VIPD`.`parent_statistic_name`,`VIPD`.`statistic_name`) AS `statistic_name`,cast(coalesce(`VIPD`.`parent_statistic_id`,`VIPD`.`statistic_id`) as char charset utf8) AS `statistic_id`,`VS`.`statistic_id` AS `child_statistic_id`,count(1) AS `quantity` from (((`v_intragame_player_detail` `VIPD` join `v_statistics` `VS` on((`VS`.`statistic_id` = `VIPD`.`statistic_id`))) join `games` `G` on((`G`.`game_id` = `VIPD`.`game_id`))) left join `events` `E` on((`E`.`event_id` = `G`.`tournament_id`))) where ((`VIPD`.`is_active_YN` <> 0) and (`VS`.`statistic_id` not in (90,91,100,101,102,104,105,120,200))) group by `E`.`event_id`,`VIPD`.`game_id`,`VIPD`.`team_id`,`VIPD`.`player_id`,`VIPD`.`short_name`,(case when (char_length(`VIPD`.`team_name`) >= 13) then concat(trim(left(`VIPD`.`team_name`,12)),'.') else `VIPD`.`team_name` end),coalesce(`VIPD`.`parent_statistic_name`,`VIPD`.`statistic_name`),`VS`.`mobile_sort`,`VS`.`parent_statistic_id`,`VS`.`statistic_id` order by `VIPD`.`team_name`,`VS`.`mobile_sort` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
