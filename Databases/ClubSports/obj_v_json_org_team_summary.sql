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

/*View structure for view v_json_org_team_summary */

/*!50001 DROP TABLE IF EXISTS `v_json_org_team_summary` */;
/*!50001 DROP VIEW IF EXISTS `v_json_org_team_summary` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_json_org_team_summary` AS select `O`.`org_id` AS `org_id`,`O`.`org_name` AS `org_name`,`O`.`org_city` AS `org_city`,`O`.`org_state` AS `org_state`,`G`.`region` AS `region`,`O`.`main_contact` AS `main_contact`,`O`.`org_website_url` AS `org_website_url`,`O`.`org_instagram` AS `org_instagram`,`T`.`team_name` AS `team_name`,`T`.`team_id` AS `team_id`,`V`.`json_team_stats` AS `json_team_stats`,`R`.`json_game_results` AS `json_game_results` from ((((`organizations` `O` left join `geographies` `G` on((`O`.`org_state` = `G`.`state_abbr`))) left join `teams` `T` on((`T`.`parent_team_id` = convert(`O`.`org_id` using utf8)))) left join `v_json_teams_stats` `V` on((`V`.`team_id` = `T`.`team_id`))) left join `v_json_team_game_results` `R` on((`T`.`team_id` = `R`.`team_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
