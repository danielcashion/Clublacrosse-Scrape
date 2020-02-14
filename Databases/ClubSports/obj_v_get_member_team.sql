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

/*View structure for view v_get_member_team */

/*!50001 DROP TABLE IF EXISTS `v_get_member_team` */;
/*!50001 DROP VIEW IF EXISTS `v_get_member_team` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_get_member_team` AS select `m`.`member_id` AS `member_id`,`m`.`team_id` AS `team_id`,`t`.`team_name` AS `team_name`,`t`.`sport_id` AS `sport_id` from (`member_teams_association` `m` join `teams` `t` on((`m`.`team_id` = `t`.`team_id`))) where (`m`.`is_active_YN` = 1) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
