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

/*View structure for view v_unique_teams_in_event */

/*!50001 DROP TABLE IF EXISTS `v_unique_teams_in_event` */;
/*!50001 DROP VIEW IF EXISTS `v_unique_teams_in_event` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_unique_teams_in_event` AS select distinct `CTE`.`IDTournament` AS `IDTournament`,`CTE`.`tournament_name` AS `tournament_name`,`CTE`.`tournament_division_name` AS `tournament_division_name`,`CTE`.`team_name` AS `team_name` from (select `public_data`.`tourneymachine_game_data`.`IDTournament` AS `IDTournament`,`public_data`.`tourneymachine_game_data`.`tournament_name` AS `tournament_name`,`public_data`.`tourneymachine_game_data`.`tournament_division_name` AS `tournament_division_name`,`public_data`.`tourneymachine_game_data`.`away_team_name` AS `team_name` from `public_data`.`tourneymachine_game_data` union select `public_data`.`tourneymachine_game_data`.`IDTournament` AS `IDTournament`,`public_data`.`tourneymachine_game_data`.`tournament_name` AS `tournament_name`,`public_data`.`tourneymachine_game_data`.`tournament_division_name` AS `tournament_division_name`,`public_data`.`tourneymachine_game_data`.`home_team_name` AS `team_name` from `public_data`.`tourneymachine_game_data`) `CTE` order by `CTE`.`tournament_division_name`,`CTE`.`team_name` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
