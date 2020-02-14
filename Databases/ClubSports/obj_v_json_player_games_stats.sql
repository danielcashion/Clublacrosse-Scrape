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

/*View structure for view v_json_player_games_stats */

/*!50001 DROP TABLE IF EXISTS `v_json_player_games_stats` */;
/*!50001 DROP VIEW IF EXISTS `v_json_player_games_stats` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_json_player_games_stats` AS select `PS`.`player_id` AS `player_id`,`P`.`is_subscriber_YN` AS `is_subscriber_YN`,`G`.`game_date` AS `game_date`,`G`.`game_id` AS `game_id`,concat(group_concat(' {"statistic_name" : "',`S`.`statistic_name`,'", "value" : ',round(`PS`.`statistic_value`,2),'}' separator ',')) AS `json_player_stats` from (((`players_games_stats` `PS` join `statistics` `S` on((`S`.`statistic_id` = `PS`.`statistic_id`))) join `games` `G` on((`PS`.`game_id` = `G`.`game_id`))) join `players` `P` on((`P`.`player_id` = `PS`.`player_id`))) where ((1 = 1) and (`PS`.`is_most_recent` = 1)) group by `PS`.`player_id`,`P`.`is_subscriber_YN`,`G`.`game_date`,`G`.`game_id` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
