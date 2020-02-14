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

/*View structure for view v_api_member_club_assoc_summary */

/*!50001 DROP TABLE IF EXISTS `v_api_member_club_assoc_summary` */;
/*!50001 DROP VIEW IF EXISTS `v_api_member_club_assoc_summary` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_api_member_club_assoc_summary` AS select `MA`.`member_id` AS `member_id`,`MA`.`association_fk_id` AS `org_id`,`O`.`org_name` AS `org_name`,`O`.`org_type` AS `org_type`,`O`.`num_teams` AS `num_teams`,`O`.`num_players` AS `num_players`,`OJ`.`json_org_info` AS `json_org_info`,`VTS`.`json_team_stats` AS `json_team_stats` from (((((`member_associations` `MA` join `member_association_type` `MAT` on((`MA`.`association_id` = `MAT`.`association_id`))) left join `organizations` `O` on((`MA`.`association_fk_id` = `O`.`org_id`))) left join `teams` `T` on((`T`.`parent_team_id` = convert(`O`.`org_id` using utf8)))) left join `v_json_teams_stats` `VTS` on((`T`.`team_id` = `VTS`.`team_id`))) left join `v_json_org_info` `OJ` on((`OJ`.`parent_team_id` = convert(`MA`.`association_fk_id` using utf8)))) where ((1 = 1) and (`MA`.`app_id` = 1) and (`MA`.`sport_id` = 1) and (`MAT`.`association_id` = 5) and (`O`.`is_active_YN` = 1) and (`MA`.`is_active_YN` = 1)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
