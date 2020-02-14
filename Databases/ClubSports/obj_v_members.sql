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

/*View structure for view v_members */

/*!50001 DROP TABLE IF EXISTS `v_members` */;
/*!50001 DROP VIEW IF EXISTS `v_members` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_members` AS select `M`.`member_id` AS `member_id`,`M`.`first_name` AS `first_name`,`M`.`last_name` AS `last_name`,`M`.`is_active_YN` AS `is_active_YN`,`M`.`is_subscriber_YN` AS `is_subscriber_YN`,`M`.`subscription_startdate` AS `subscription_startdate`,`M`.`sport_id_default` AS `sport_id_default`,`M`.`subscription_code` AS `subscription_code`,`M`.`created_datetime` AS `created_datetime`,`M`.`created_by` AS `created_by` from `members` `M` where (`M`.`is_active_YN` = 1) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
