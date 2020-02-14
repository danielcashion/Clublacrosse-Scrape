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

/*View structure for view v_player_team_games_outcomes */

/*!50001 DROP TABLE IF EXISTS `v_player_team_games_outcomes` */;
/*!50001 DROP VIEW IF EXISTS `v_player_team_games_outcomes` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_player_team_games_outcomes` AS select `P`.`first_name` AS `first_name`,`P`.`last_name` AS `last_name`,`P`.`player_id` AS `player_id`,`P`.`jersey_number` AS `jersey_number`,`T`.`team_name` AS `team_name`,`T`.`team_id` AS `team_id`,`T`.`team_year` AS `team_year`,`VTN`.`opponent_team_name` AS `opponent_team_name`,`VTN`.`team_score` AS `team_score`,`VTN`.`opponent_team_score` AS `opponent_team_score`,`VTN`.`team1_outcome` AS `team1_outcome`,(`VTN`.`team_score` - `VTN`.`opponent_team_score`) AS `GD`,(case when (`VTN`.`team1_outcome` = 'W') then 1 else 0 end) AS `Win`,(case when (`VTN`.`team1_outcome` = 'L') then 1 else 0 end) AS `Loss`,(case when (`VTN`.`team1_outcome` = 'T') then 1 else 0 end) AS `Tie` from ((`players` `P` join `teams` `T` on((`P`.`team_id` = `T`.`team_id`))) join `v_games_normalized` `VTN` on((`VTN`.`team_id` = `T`.`team_id`))) where (`P`.`jersey_number` <> -(1)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
