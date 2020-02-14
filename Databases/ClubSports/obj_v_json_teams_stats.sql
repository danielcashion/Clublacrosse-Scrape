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

/*View structure for view v_json_teams_stats */

/*!50001 DROP TABLE IF EXISTS `v_json_teams_stats` */;
/*!50001 DROP VIEW IF EXISTS `v_json_teams_stats` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_json_teams_stats` AS select `TS`.`team_id` AS `team_id`,`T`.`parent_team_id` AS `parent_team_id`,`T`.`team_year` AS `team_year`,`T`.`team_name` AS `team_name`,`T`.`team_level` AS `team_level`,`TS`.`measure_date` AS `measure_date`,concat(group_concat(' {"statistic_name" : "',`S`.`statistic_name`,'", "value" : ',round(`TS`.`statistic_value`,3),'}' separator ',')) AS `json_team_stats` from ((`teams_statistics` `TS` join `statistics` `S` on((`S`.`statistic_id` = `TS`.`statistic_id`))) join `teams` `T` on((`T`.`team_id` = `TS`.`team_id`))) where ((1 = 1) and (`TS`.`is_most_recent` = 1) and (`TS`.`is_active_YN` = 1)) group by `TS`.`team_id`,`T`.`team_year`,`T`.`team_name`,`T`.`team_level`,`TS`.`measure_date` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
