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

/*View structure for view v_json_club_info */

/*!50001 DROP TABLE IF EXISTS `v_json_club_info` */;
/*!50001 DROP VIEW IF EXISTS `v_json_club_info` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_json_club_info` AS select `T`.`parent_team_id` AS `parent_team_id`,`T`.`sport_id` AS `sport_id`,concat(group_concat(' {"team_id":"',`T`.`team_id`,'",',' "team_name":"',`T`.`team_name`,'",',' "team_year":"',`T`.`team_year`,'",',' "team_level":"',`T`.`team_level`,'",',' "sport_id":"',`T`.`sport_id`,'",',' "parent_team_id":"',`T`.`parent_team_id`,'"}' separator ',')) AS `json_org_info` from `teams` `T` where ((1 = 1) and (`T`.`is_active_YN` = 1) and (`T`.`sport_id` in (1,2))) group by `T`.`parent_team_id`,`T`.`sport_id` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
