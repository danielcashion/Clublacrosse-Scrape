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

/*View structure for view v_member_events_association */

/*!50001 DROP TABLE IF EXISTS `v_member_events_association` */;
/*!50001 DROP VIEW IF EXISTS `v_member_events_association` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_member_events_association` AS (select `MA`.`row_num` AS `row_num`,`MA`.`member_id` AS `member_id`,`MA`.`sport_id` AS `sport_id`,`MA`.`app_id` AS `app_id`,`M`.`first_name` AS `first_name`,`M`.`last_name` AS `last_name`,`MA`.`association_fk_id` AS `event_id`,`E`.`event_desc` AS `event_desc`,`E`.`event_startdate` AS `event_start_date`,`E`.`event_enddate` AS `event_end_date`,`E`.`event_city` AS `event_city`,`E`.`event_state` AS `event_state`,`E`.`event_location_lat` AS `event_location_lat`,`E`.`event_location_long` AS `event_location_long`,`E`.`multilocation` AS `multilocation`,`E`.`is_live_YN` AS `is_live_YN`,`E`.`num_teams` AS `num_teams`,`E`.`num_games` AS `num_games`,`MA`.`is_active_YN` AS `is_active_YN`,`MA`.`created_by` AS `created_by`,`MA`.`created_datetime` AS `created_datetime`,`MA`.`updated_by` AS `updated_by`,`MA`.`updated_datetime` AS `update_datetime` from (((`member_associations` `MA` join `member_association_type` `MAT` on(((`MA`.`association_id` = `MAT`.`association_id`) and (`MA`.`association_id` = 4)))) join `events` `E` on((`E`.`event_id` = convert(`MA`.`association_fk_id` using utf8)))) join `members` `M` on((`M`.`member_id` = convert(`MA`.`member_id` using utf8))))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
