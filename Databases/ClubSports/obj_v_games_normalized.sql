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

/*View structure for view v_games_normalized */

/*!50001 DROP TABLE IF EXISTS `v_games_normalized` */;
/*!50001 DROP VIEW IF EXISTS `v_games_normalized` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_games_normalized` AS select `G`.`game_date` AS `game_date`,`G`.`game_id` AS `game_id`,`E1`.`sport_id` AS `sport_id`,`E1`.`event_type` AS `event_type`,`E1`.`event_desc` AS `event_desc`,`G`.`tournament_id` AS `event_id`,`G`.`home_team_id` AS `team_id`,`T1`.`team_name` AS `team_name`,`T1`.`team_year` AS `team_year`,`G`.`home_team_score` AS `team_score`,`G`.`away_team_id` AS `opponent_team_id`,`T2`.`team_name` AS `opponent_team_name`,`T2`.`team_year` AS `opponent_team_year`,`G`.`away_team_score` AS `opponent_team_score`,(case when (`G`.`home_team_score` > `G`.`away_team_score`) then 'W' when ((`G`.`home_team_score` = `G`.`away_team_score`) and (`G`.`home_team_score` <> 0)) then 'T' when (`G`.`home_team_score` < `G`.`away_team_score`) then 'L' else NULL end) AS `team1_outcome` from (((`games` `G` left join `events` `E1` on((`G`.`tournament_id` = `E1`.`event_id`))) join `teams` `T1` on((`T1`.`team_id` = `G`.`home_team_id`))) join `teams` `T2` on((`T2`.`team_id` = `G`.`away_team_id`))) union select `G`.`game_date` AS `game_date`,`G`.`game_id` AS `game_id`,`E2`.`sport_id` AS `sport_id`,`E2`.`event_type` AS `event_type`,`E2`.`event_desc` AS `event_desc`,`G`.`tournament_id` AS `event_id`,`G`.`away_team_id` AS `team_id`,`T3`.`team_name` AS `team_name`,`T3`.`team_year` AS `team_year`,`G`.`away_team_score` AS `opponent_score`,`G`.`home_team_id` AS `opponent_team_id`,`T4`.`team_name` AS `opponent_team_name`,`T4`.`team_year` AS `team2_year`,`G`.`home_team_score` AS `team2_score`,(case when (`G`.`away_team_score` > `G`.`home_team_score`) then 'W' when ((`G`.`away_team_score` = `G`.`home_team_score`) and (`G`.`away_team_score` <> 0)) then 'T' when (`G`.`away_team_score` < `G`.`home_team_score`) then 'L' else NULL end) AS `team1_outcome` from (((`games` `G` left join `events` `E2` on((`G`.`tournament_id` = `E2`.`event_id`))) join `teams` `T3` on((`T3`.`team_id` = `G`.`away_team_id`))) join `teams` `T4` on((`T4`.`team_id` = `G`.`home_team_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
