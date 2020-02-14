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

/*View structure for view v_api_org_summary */

/*!50001 DROP TABLE IF EXISTS `v_api_org_summary` */;
/*!50001 DROP VIEW IF EXISTS `v_api_org_summary` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_api_org_summary` AS select `O`.`org_id` AS `org_id`,`O`.`org_name` AS `org_name`,`O`.`org_city` AS `org_city`,`O`.`org_state` AS `org_state`,`O`.`main_contact` AS `main_contact`,`O`.`email_address` AS `email_address`,`O`.`org_website_url` AS `org_website_url`,`O`.`org_instagram` AS `org_instagram`,`OJ`.`json_org_info` AS `json_org_info` from (`organizations` `O` join `v_json_club_info` `OJ` on((convert(`O`.`org_id` using utf8) = `OJ`.`parent_team_id`))) where (`O`.`sport_id` in (1,2)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
