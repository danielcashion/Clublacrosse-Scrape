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

/*View structure for view v_api_player_stats */

/*!50001 DROP TABLE IF EXISTS `v_api_player_stats` */;
/*!50001 DROP VIEW IF EXISTS `v_api_player_stats` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_api_player_stats` AS select `P`.`player_id` AS `player_id`,`P`.`jersey_number` AS `jersey_number`,nullif(`P`.`first_name`,'') AS `first_name`,nullif(`P`.`last_name`,'') AS `last_name`,(case when (nullif(`P`.`first_name`,'') is not null) then concat(`P`.`first_name`,' ',`P`.`last_name`) else nullif(`P`.`last_name`,'') end) AS `full_name`,`T`.`team_name` AS `team_name`,`T`.`team_year` AS `team_year`,`T`.`team_id` AS `team_id`,`O`.`org_id` AS `org_id`,`O`.`org_name` AS `org_name`,nullif(`P`.`position_description`,'') AS `position_description`,`PSS`.`json_player_stats` AS `json_player_stats` from (((`clubsports`.`players` `P` join `clubsports`.`teams` `T` on((`P`.`team_id` = `T`.`team_id`))) left join `clubsports`.`organizations` `O` on((convert(`O`.`org_id` using utf8) = `T`.`parent_team_id`))) left join (select `p`.`player_id` AS `player_id`,group_concat(json_object('statistic_id',`p`.`statistic_id`,'statistic_name',`S`.`statistic_name`,'statistic_value',`p`.`statistic_value`) separator ',') AS `json_player_stats` from (`clubsports`.`players_summary_stats` `p` join `clubsports`.`statistics` `S` on(((`p`.`statistic_id` = `S`.`statistic_id`) and (`p`.`is_most_recent` = 1)))) group by `p`.`player_id`) `PSS` on((`P`.`player_id` = `PSS`.`player_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
