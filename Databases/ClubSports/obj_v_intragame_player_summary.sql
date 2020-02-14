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

/*View structure for view v_intragame_player_summary */

/*!50001 DROP TABLE IF EXISTS `v_intragame_player_summary` */;
/*!50001 DROP VIEW IF EXISTS `v_intragame_player_summary` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_intragame_player_summary` AS (select `VIPD`.`game_id` AS `game_id`,`VIPD`.`team_id` AS `team_id`,`VIPD`.`team_name` AS `team_name`,(case when (char_length(`VIPD`.`team_name`) >= 13) then concat(trim(left(`VIPD`.`team_name`,12)),'...') else `VIPD`.`team_name` end) AS `team_name_short`,coalesce(`VIPD`.`parent_statistic_name`,`VIPD`.`statistic_name`) AS `statistic_name`,coalesce(`VS`.`parent_statistic_id`,`VS`.`statistic_id`) AS `statistic_id`,count(1) AS `quantity` from (`v_intragame_player_detail` `VIPD` join `v_statistics` `VS` on((`VS`.`statistic_id` = `VIPD`.`statistic_id`))) where ((`VIPD`.`is_active_YN` <> 0) and (`VS`.`statistic_id` <> 200)) group by `VIPD`.`game_id`,`VIPD`.`team_id`,(case when (char_length(`VIPD`.`team_name`) >= 13) then concat(trim(left(`VIPD`.`team_name`,12)),'.') else `VIPD`.`team_name` end),coalesce(`VIPD`.`parent_statistic_name`,`VIPD`.`statistic_name`),`VS`.`mobile_sort`,coalesce(`VS`.`parent_statistic_id`,`VS`.`statistic_id`) order by `VIPD`.`team_name`,`VS`.`mobile_sort`) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
