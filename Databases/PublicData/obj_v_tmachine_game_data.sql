/*
SQLyog Job Agent v12.09 (64 bit) Copyright(c) Webyog Inc. All Rights Reserved.


MySQL - 5.7.12 : Database - public_data
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`public_data` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `public_data`;

/*View structure for view v_tmachine_game_data */

/*!50001 DROP TABLE IF EXISTS `v_tmachine_game_data` */;
/*!50001 DROP VIEW IF EXISTS `v_tmachine_game_data` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_tmachine_game_data` AS select `TGD`.`IDTournament` AS `IDTournament`,`TGD`.`tournament_name` AS `tournament_name`,`TGD`.`tournament_division_name` AS `tournament_division_name`,`TGD`.`location_name` AS `field_desc`,`TGD`.`time_period` AS `time_period`,`TGD`.`game_time` AS `game_time`,`TGD`.`away_team_name` AS `away_team_name`,`TGD`.`home_team_name` AS `home_team_name`,`TNM1`.`team_id` AS `away_team_id`,`TNM2`.`team_id` AS `home_team_id`,`TGD`.`away_score` AS `away_score`,`TGD`.`home_score` AS `home_score`,`TGD`.`away_team_id` AS `tm_away_team_id`,`TGD`.`home_team_id` AS `tm_home_team_id` from ((`tourneymachine_game_data` `TGD` left join `team_name_map` `TNM1` on(((`TNM1`.`raw_team_name` = `TGD`.`away_team_name`) and (`TNM1`.`team_year` = `TGD`.`tournament_division_name`)))) left join `team_name_map` `TNM2` on(((`TNM2`.`raw_team_name` = `TGD`.`home_team_name`) and (`TNM2`.`team_year` = `TGD`.`tournament_division_name`)))) where (1 = 1) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
