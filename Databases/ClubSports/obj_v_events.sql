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

/*View structure for view v_events */

/*!50001 DROP TABLE IF EXISTS `v_events` */;
/*!50001 DROP VIEW IF EXISTS `v_events` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_events` AS select `E`.`event_id` AS `event_id`,`E`.`sport_id` AS `sport_id`,`E`.`event_type` AS `event_type`,`E`.`event_desc` AS `event_desc`,trim(replace(replace(replace(replace(replace(replace(`E`.`event_desc`,' 2019',''),'Boys',''),'Girls',''),'Invitational','Invite.'),'Showcase','Showc.'),' ',' ')) AS `event_desc_short`,`E`.`event_address` AS `event_address`,`E`.`event_city` AS `event_city`,`E`.`event_state` AS `event_state`,`E`.`event_startdate` AS `event_startdate`,`E`.`event_enddate` AS `event_enddate`,(to_days(`E`.`event_startdate`) - to_days(now())) AS `days_difference`,`E`.`format_id` AS `format_id`,`EF`.`period_type` AS `period_type`,`EF`.`scoring_rules` AS `scoring_rules`,`EF`.`central_timer` AS `central_timer`,`EF`.`playoff_determination` AS `playoff_determination`,`EF`.`OT_rules` AS `OT_rules`,`E`.`multilocation` AS `multilocation`,`E`.`is_live_YN` AS `is_live_YN`,`E`.`event_location_lat` AS `event_location_lat`,`E`.`event_location_long` AS `event_location_long`,`E`.`event_map_desc` AS `event_map_desc`,`E`.`event_map_url` AS `event_map_url` from (`events` `E` left join `events_format` `EF` on((`E`.`format_id` = `EF`.`format_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
