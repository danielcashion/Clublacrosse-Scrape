/*
SQLyog Job Agent v12.09 (64 bit) Copyright(c) Webyog Inc. All Rights Reserved.


MySQL - 5.7.12 : Database - events
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`events` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `events`;

/*View structure for view v_time_zone_offsets */

/*!50001 DROP TABLE IF EXISTS `v_time_zone_offsets` */;
/*!50001 DROP VIEW IF EXISTS `v_time_zone_offsets` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_time_zone_offsets` AS select `tz`.`abbreviation` AS `abbreviation`,`tz`.`gmt_offset` AS `gmt_offset`,`z`.`zone_name` AS `zone_name`,date_format(from_unixtime((unix_timestamp(utc_timestamp()) + `tz`.`gmt_offset`)),'%a, %d %b %Y, %H:%i:%s') AS `local_time` from (`timezones` `tz` join `zone` `z` on((`tz`.`zone_id` = `z`.`zone_id`))) where ((1 = 1) and (`tz`.`time_start` <= unix_timestamp(utc_timestamp()))) order by `tz`.`time_start` desc */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
