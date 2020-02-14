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

/*View structure for view v_api_member_player_assoc_summary */

/*!50001 DROP TABLE IF EXISTS `v_api_member_player_assoc_summary` */;
/*!50001 DROP VIEW IF EXISTS `v_api_member_player_assoc_summary` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_api_member_player_assoc_summary` AS select `MA`.`member_id` AS `member_id`,`MA`.`association_fk_id` AS `player_id`,`P`.`first_name` AS `first_name`,`P`.`last_name` AS `last_name`,`P`.`is_subscriber_YN` AS `is_subscriber_YN`,`P`.`jersey_number` AS `jersey_number`,`P`.`team_id` AS `team_id`,`T`.`team_name` AS `team_name`,`T`.`team_year` AS `team_year`,`T`.`team_level` AS `team_level`,`T`.`parent_team_id` AS `parent_team_id`,`T`.`parent_team_name` AS `parent_team_name` from ((((`member_associations` `MA` join `member_association_type` `MAT` on((`MA`.`association_id` = `MAT`.`association_id`))) left join `players` `P` on((convert(`MA`.`association_fk_id` using utf8) = `P`.`player_id`))) left join `players_summary_stats` `PSS` on((`P`.`player_id` = `PSS`.`player_id`))) left join `teams` `T` on((`P`.`team_id` = `T`.`team_id`))) where ((1 = 1) and (`MA`.`app_id` = 1) and (`MA`.`sport_id` = 1) and (`MA`.`is_active_YN` = 1) and (`MAT`.`association_id` = 2) and (`PSS`.`is_most_recent` = 1) and (`PSS`.`is_active_YN` = 1)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
