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

/*View structure for view v_teams_statistics */

/*!50001 DROP TABLE IF EXISTS `v_teams_statistics` */;
/*!50001 DROP VIEW IF EXISTS `v_teams_statistics` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_teams_statistics` AS (select `teams_statistics`.`measure_date` AS `measure_date`,`teams_statistics`.`team_id` AS `team_id`,`teams_statistics`.`statistic_id` AS `statistic_id`,`statistics`.`statistic_name` AS `statistic_name`,`teams_statistics`.`statistic_value` AS `statistic_value`,`teams_statistics`.`is_active_YN` AS `is_active_YN`,`teams_statistics`.`is_most_recent` AS `is_most_recent` from (`teams_statistics` join `statistics` on((`teams_statistics`.`statistic_id` = `statistics`.`statistic_id`))) where ((`teams_statistics`.`is_active_YN` = 1) and (`teams_statistics`.`is_most_recent` = 1) and (`statistics`.`is_active_YN` = 1))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
