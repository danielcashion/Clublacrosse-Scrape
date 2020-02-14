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

/*View structure for view v_app_parameters */

/*!50001 DROP TABLE IF EXISTS `v_app_parameters` */;
/*!50001 DROP VIEW IF EXISTS `v_app_parameters` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_app_parameters` AS (select `app_parameters`.`param_id` AS `param_id`,`app_parameters`.`app_id` AS `app_id`,`app_parameters`.`sport_id` AS `sport_id`,`app_parameters`.`param_name` AS `param_name`,`app_parameters`.`param_value` AS `param_value`,`app_parameters`.`sort_order` AS `sort_order`,`app_parameters`.`is_active_YN` AS `is_active_YN`,`app_parameters`.`created_by` AS `created_by`,`app_parameters`.`created_datetime` AS `created_datetime`,`app_parameters`.`updated_by` AS `updated_by`,`app_parameters`.`updated_datetime` AS `updated_datetime` from `app_parameters`) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
