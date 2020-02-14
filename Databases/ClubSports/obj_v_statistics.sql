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

/*View structure for view v_statistics */

/*!50001 DROP TABLE IF EXISTS `v_statistics` */;
/*!50001 DROP VIEW IF EXISTS `v_statistics` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_statistics` AS (select `Child`.`statistic_id` AS `statistic_id`,`Child`.`parent_statistic_id` AS `parent_statistic_id`,`Parent`.`statistic_name` AS `parent_statistic_name`,`Child`.`statistic_name` AS `statistic_name`,coalesce(`Parent`.`stat_UI_short`,`Child`.`stat_UI_short`) AS `stat_ui_short`,coalesce(`Child`.`mobile_delay_secs`,`Parent`.`mobile_delay_secs`) AS `mobile_delay_secs`,coalesce(`Child`.`dialogue_box`,`Parent`.`dialogue_box`) AS `dialogue_box`,coalesce(`Child`.`mobile_sort`,`Parent`.`mobile_sort`) AS `mobile_sort`,`Child`.`visible_gameday_YN` AS `visible_gameday_YN` from (`statistics` `Child` left join `statistics` `Parent` on((`Parent`.`statistic_id` = `Child`.`parent_statistic_id`))) where (`Child`.`is_active_YN` <> 0) order by `Child`.`statistic_id`,`Child`.`parent_statistic_id`) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
