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

/*View structure for view v_json_team_game_results */

/*!50001 DROP TABLE IF EXISTS `v_json_team_game_results` */;
/*!50001 DROP VIEW IF EXISTS `v_json_team_game_results` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_json_team_game_results` AS select `v_games_normalized`.`team_id` AS `team_id`,`v_games_normalized`.`event_desc` AS `event_desc`,`v_games_normalized`.`event_type` AS `event_type`,`v_games_normalized`.`event_id` AS `event_id`,concat(group_concat(' {	"game_id" : "',`v_games_normalized`.`game_id`,'",\n					"opponent_team_id" : "',`v_games_normalized`.`opponent_team_id`,'",\n					"opponent_team_name" : "',`v_games_normalized`.`opponent_team_name`,'", \n					"team_score" : "',`v_games_normalized`.`team_score`,'", \n					"opponent_team_score" : "',`v_games_normalized`.`opponent_team_score`,'", \n					"team1_outcome" : "',convert(`v_games_normalized`.`team1_outcome` using utf8),'", \n				}' separator ',')) AS `json_game_results` from `v_games_normalized` group by `v_games_normalized`.`team_id`,`v_games_normalized`.`event_desc`,`v_games_normalized`.`event_type`,`v_games_normalized`.`event_id` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
