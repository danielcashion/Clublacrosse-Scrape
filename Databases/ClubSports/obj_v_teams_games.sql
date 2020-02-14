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

/*View structure for view v_teams_games */

/*!50001 DROP TABLE IF EXISTS `v_teams_games` */;
/*!50001 DROP VIEW IF EXISTS `v_teams_games` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_teams_games` AS (select `G`.`game_id` AS `game_id`,date_format(`G`.`game_date`,'%m/%d/%Y') AS `game_date`,date_format(`G`.`game_time`,'%H:%i') AS `game_time`,(to_days(`G`.`game_date`) - to_days(now())) AS `days_ago`,`G`.`tournament_id` AS `tournament_id`,`G`.`sport_id` AS `sport_id`,`G`.`home_team_id` AS `home_team_id`,`G`.`bracket_year` AS `bracket_year`,`G`.`division` AS `division`,`E`.`period_type` AS `period_type`,`E`.`event_desc` AS `event_desc`,`G`.`field_description` AS `field_description`,`T2`.`team_name` AS `home_team_name`,coalesce(`T2`.`parent_team_name`,`T2`.`team_name`) AS `home_name_short`,`G`.`home_team_score` AS `home_team_score`,`G`.`away_team_id` AS `away_team_id`,`T1`.`team_name` AS `away_team_name`,coalesce(`T1`.`parent_team_name`,`T1`.`team_name`) AS `away_name_short`,`G`.`away_team_score` AS `away_team_score`,(case when (`G`.`home_team_score` > `G`.`away_team_score`) then 1 else 0 end) AS `home_team_win`,(case when (`G`.`home_team_score` < `G`.`away_team_score`) then 1 else 0 end) AS `home_team_loss`,(case when ((`G`.`home_team_score` = `G`.`away_team_score`) and (`G`.`home_team_score` <> 0)) then 1 else 0 end) AS `home_team_tie`,(case when (`G`.`away_team_score` > `G`.`home_team_score`) then 1 else 0 end) AS `away_team_win`,(case when (`G`.`away_team_score` < `G`.`home_team_score`) then 1 else 0 end) AS `away_team_loss`,(case when ((`G`.`away_team_score` = `G`.`home_team_score`) and (`G`.`home_team_score` <> 0)) then 1 else 0 end) AS `away_team_tie`,`G`.`game_location_city` AS `game_location_city`,`G`.`game_location_state` AS `game_location_state`,`G`.`game_location_lat` AS `game_location_lat`,`G`.`game_location_long` AS `game_location_long`,`G`.`is_active_YN` AS `is_active_YN`,`G`.`is_live_YN` AS `is_live_YN`,`G`.`is_final_YN` AS `is_final_YN`,`O1`.`org_logo_url` AS `away_team_logo`,`O2`.`org_logo_url` AS `home_team_logo` from (((((`games` `G` left join `v_events` `E` on((`G`.`tournament_id` = `E`.`event_id`))) left join `teams` `T1` on((`T1`.`team_id` = `G`.`away_team_id`))) left join `teams` `T2` on((`T2`.`team_id` = `G`.`home_team_id`))) left join `organizations` `O1` on((`T1`.`parent_team_id` = convert(`O1`.`org_id` using utf8)))) left join `organizations` `O2` on((`T2`.`parent_team_id` = convert(`O2`.`org_id` using utf8))))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
