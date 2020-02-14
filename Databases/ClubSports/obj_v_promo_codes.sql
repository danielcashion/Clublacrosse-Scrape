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

/*View structure for view v_promo_codes */

/*!50001 DROP TABLE IF EXISTS `v_promo_codes` */;
/*!50001 DROP VIEW IF EXISTS `v_promo_codes` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_promo_codes` AS (select `promo_codes`.`promo_id` AS `promo_id`,`promo_codes`.`reference_entity_type` AS `reference_entity_type`,`promo_codes`.`reference_entity` AS `reference_entity`,`promo_codes`.`promo_code` AS `promo_code`,`promo_codes`.`promo_code_desc` AS `promo_code_desc`,`promo_codes`.`promo_code_units` AS `promo_code_units`,`promo_codes`.`promo_code_value` AS `promo_code_value`,`promo_codes`.`promo_code_used_count` AS `promo_code_used_count`,`promo_codes`.`promo_code_limit` AS `promo_code_limit`,`promo_codes`.`promo_startdate` AS `promo_startdate`,`promo_codes`.`promo_enddate` AS `promo_enddate`,`promo_codes`.`is_active_YN` AS `is_active_YN`,`promo_codes`.`created_by` AS `created_by`,`promo_codes`.`created_datetime` AS `created_datetime`,`promo_codes`.`updated_by` AS `updated_by`,`promo_codes`.`updated_datetime` AS `updated_datetime` from `promo_codes`) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
