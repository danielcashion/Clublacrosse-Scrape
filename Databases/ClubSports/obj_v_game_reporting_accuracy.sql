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

/*View structure for view v_game_reporting_accuracy */

/*!50001 DROP TABLE IF EXISTS `v_game_reporting_accuracy` */;
/*!50001 DROP VIEW IF EXISTS `v_game_reporting_accuracy` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_game_reporting_accuracy` AS select `IR`.`id` AS `id`,`E`.`event_id` AS `event_id`,`IR`.`game_id` AS `game_id`,`IR`.`statistic_id` AS `statistic_id`,`S`.`statistic_name` AS `statistic_name`,`IR`.`player_id` AS `player_id`,`IR`.`is_active_YN` AS `is_active_YN`,`IR`.`member_id` AS `rpt_member_id`,`initial`.`first_name` AS `rpt_first_name`,`initial`.`last_name` AS `rpt_last_name`,`updater`.`member_id` AS `upd_member_id`,`updater`.`first_name` AS `upd_first_name`,`updater`.`last_name` AS `upd_last_name`,(case when (isnull(`updater`.`member_id`) or (`updater`.`member_id` = `initial`.`member_id`)) then 1 else 0 end) AS `accurate`,(case when (`initial`.`member_id` <> `updater`.`member_id`) then 1 else 0 end) AS `corrected` from (((((`intragame_reporting` `IR` join `games` `G` on((`G`.`game_id` = `IR`.`game_id`))) join `events` `E` on((`G`.`tournament_id` = `E`.`event_id`))) join `statistics` `S` on((`IR`.`statistic_id` = `S`.`statistic_id`))) join `members` `initial` on((`initial`.`member_id` = `IR`.`member_id`))) left join `members` `updater` on((`updater`.`member_id` = `IR`.`updated_member_id`))) order by `IR`.`id` desc */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
