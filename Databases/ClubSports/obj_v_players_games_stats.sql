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

/*View structure for view v_players_games_stats */

/*!50001 DROP TABLE IF EXISTS `v_players_games_stats` */;
/*!50001 DROP VIEW IF EXISTS `v_players_games_stats` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_players_games_stats` AS select `PS`.`measure_date` AS `measure_date`,`PS`.`game_id` AS `game_id`,`G`.`game_date` AS `game_date`,`PS`.`player_id` AS `player_id`,`P`.`is_subscriber_YN` AS `is_subscriber_YN`,`P`.`team_id` AS `team_id`,`P`.`first_name` AS `first_name`,`P`.`last_name` AS `last_name`,`P`.`jersey_number` AS `jersey_number`,`P`.`position_description` AS `position_description`,`PS`.`statistic_id` AS `statistic_id`,`S`.`statistic_name` AS `statistic_name`,`S`.`stat_UI_short` AS `stat_UI_short`,`VGN`.`opponent_team_id` AS `opponent_team_id`,`VGN`.`opponent_team_name` AS `opponent_team_name`,`VGN`.`opponent_team_score` AS `opponent_team_score`,`VGN`.`opponent_team_year` AS `opponent_team_year`,`VGN`.`team_name` AS `team_name`,`VGN`.`team_score` AS `team_score`,`VGN`.`team1_outcome` AS `team1_outcome`,`PS`.`statistic_value` AS `statistic_value`,`PS`.`is_active_YN` AS `is_active_YN`,`PS`.`is_most_recent` AS `is_most_recent` from ((((`players_games_stats` `PS` join `players` `P` on((`PS`.`player_id` = `P`.`player_id`))) join `statistics` `S` on((`S`.`statistic_id` = `PS`.`statistic_id`))) join `games` `G` on((`G`.`game_id` = `PS`.`game_id`))) left join `v_games_normalized` `VGN` on(((`VGN`.`game_id` = `G`.`game_id`) and (`VGN`.`game_id` = `PS`.`game_id`)))) where ((1 = 1) and (`PS`.`is_active_YN` = 1) and (`P`.`team_id` <> `VGN`.`opponent_team_id`) and (`PS`.`is_most_recent` = 1)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
