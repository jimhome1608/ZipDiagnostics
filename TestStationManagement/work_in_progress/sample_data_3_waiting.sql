/*
SQLyog - Free MySQL GUI v5.18
Host - 5.7.28-log : Database - test_station
*********************************************************************
Server version : 5.7.28-log
*/

SET NAMES utf8;

SET SQL_MODE='';

create database if not exists `test_station`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

/*Table structure for table `db_change_log` */

CREATE TABLE `db_change_log` (
  `change_id` int(11) NOT NULL,
  `change_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`change_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `db_change_log` */

/*Table structure for table `error_log` */

CREATE TABLE `error_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_time` datetime DEFAULT NULL,
  `computer` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `key_word` varchar(255) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `error_log` */

/*Table structure for table `samples` */

CREATE TABLE `samples` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `save_time` datetime NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `family_name` varchar(255) DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `postcode` varchar(255) DEFAULT '',
  `phone` varchar(255) DEFAULT '',
  `email` varchar(255) DEFAULT '',
  `notes` longtext,
  `sample_id` varchar(255) DEFAULT '',
  `test_result` longtext,
  `test_status` varchar(255) DEFAULT '',
  `test_start_time` datetime DEFAULT NULL,
  `result_import_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `samples` */

insert into `samples` (`id`,`save_time`,`first_name`,`family_name`,`date_of_birth`,`postcode`,`phone`,`email`,`notes`,`sample_id`,`test_result`,`test_status`,`test_start_time`,`result_import_time`) values (27,'2020-04-04 18:58:53','Bob','Smith','1965-08-01 00:00:00','3215','03 9787 4000','none','','EESALH2HFWVLUS2PEAI2+W','','Sample Collected',NULL,NULL);
insert into `samples` (`id`,`save_time`,`first_name`,`family_name`,`date_of_birth`,`postcode`,`phone`,`email`,`notes`,`sample_id`,`test_result`,`test_status`,`test_start_time`,`result_import_time`) values (28,'2020-04-04 18:59:51','Joe','Bloggs','1960-01-01 00:00:00','6541','02 9785441','x@here.com.au','notes on Joe.','X3EMCQH4ASK4TVJ9BLSMFW','','Sample Collected',NULL,NULL);
insert into `samples` (`id`,`save_time`,`first_name`,`family_name`,`date_of_birth`,`postcode`,`phone`,`email`,`notes`,`sample_id`,`test_result`,`test_status`,`test_start_time`,`result_import_time`) values (29,'2020-04-04 19:00:28','Mary','Millw','1968-09-01 00:00:00','6542','07 65498742','none','Mary\r\nwas here.','1BYDKE9SUAPZU5GIAQG1WW','','Sample Collected',NULL,NULL);

/*Table structure for table `settings` */

CREATE TABLE `settings` (
  `code` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `settings` */

/*Table structure for table `user_log` */

CREATE TABLE `user_log` (
  `user_id` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  `event` varchar(255) DEFAULT NULL,
  `app_version` varchar(255) DEFAULT NULL,
  `computer_name` varchar(255) DEFAULT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`date_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_log` */

insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-24 11:58:14','login','','DESKTOP-136ALIH','test_station','jim.c@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-24 12:07:56','login','','DESKTOP-136ALIH','test_station','jim.c@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-24 12:08:21','login','','DESKTOP-136ALIH','test_station','jim.c@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-24 12:09:44','login','','DESKTOP-136ALIH','test_station','jim.c@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-24 12:10:21','login','','DESKTOP-136ALIH','test_station','jim.c@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-24 12:10:48','login','','DESKTOP-136ALIH','test_station','jim.c@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-24 12:11:19','login','','DESKTOP-136ALIH','test_station','jim.c@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-24 12:11:55','login','','DESKTOP-136ALIH','test_station','jim.c@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-24 12:12:32','login','','DESKTOP-136ALIH','test_station','jim.c@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-24 12:13:18','login','','DESKTOP-136ALIH','test_station','jim.c@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-24 12:13:48','login','','DESKTOP-136ALIH','test_station','jim.c@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-24 12:16:12','login','','DESKTOP-136ALIH','test_station','jim.c@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-24 12:21:36','login','','DESKTOP-136ALIH','test_station','jim.c@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-24 18:31:36','login','','DESKTOP-136ALIH','test_station','jim.c@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-24 19:29:30','login','','DESKTOP-136ALIH','test_station','jim.c@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-24 19:29:34','login','','DESKTOP-136ALIH','test_station','jim.c@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-24 20:00:55','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-24 20:31:14','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 09:59:51','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 10:14:26','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 10:15:59','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 10:29:19','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 10:32:28','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 10:34:13','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 10:35:05','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 10:37:10','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 10:37:45','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 10:54:44','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 11:01:19','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 11:02:24','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 11:04:25','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 11:04:54','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 11:13:26','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 11:19:26','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 11:20:55','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 11:21:53','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 11:36:23','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 11:37:27','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 11:38:15','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 11:38:56','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 11:49:12','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 11:49:47','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 12:02:34','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 12:53:11','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 12:57:29','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 13:04:20','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 13:05:13','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 13:07:35','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 13:08:11','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 13:09:17','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 13:09:40','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 13:12:16','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 13:12:55','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 13:15:09','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 13:20:24','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 13:21:18','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 13:22:18','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 15:24:33','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 15:29:54','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 15:31:46','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 15:34:48','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 15:36:53','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 15:37:33','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 15:38:38','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 15:39:07','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 15:40:30','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 15:40:43','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 15:58:25','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 15:58:40','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 15:59:22','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 15:59:49','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 16:00:07','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 16:01:56','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 16:02:23','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 16:08:44','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 16:09:57','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 16:14:31','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 16:15:44','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 16:19:32','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 16:21:09','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 16:22:37','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 16:23:05','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 16:24:49','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 16:25:54','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 16:38:29','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 16:40:39','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 16:44:03','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 16:44:50','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 16:49:11','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 18:52:55','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 18:53:38','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 18:56:54','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 18:57:56','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 18:59:48','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 19:02:05','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 19:02:23','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 19:02:31','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 19:04:39','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 19:07:38','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 19:08:37','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 19:11:01','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 19:22:23','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 19:24:40','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 19:25:41','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 19:27:00','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 19:34:12','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 19:37:20','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 19:38:52','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 19:40:20','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-26 19:42:00','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:06:21','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:08:14','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:11:01','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:33:40','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:34:49','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:36:09','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:42:12','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:42:47','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:44:46','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:45:23','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:47:07','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:48:46','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:49:08','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:49:31','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:51:17','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:52:11','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:52:53','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:53:32','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:54:29','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:54:57','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:58:22','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 18:59:27','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:00:11','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:00:44','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:01:14','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:01:30','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:02:34','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:02:57','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:03:26','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:04:34','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:05:19','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:05:57','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:06:40','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:07:00','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:07:39','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:08:57','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:09:17','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:10:10','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:12:20','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:12:55','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:13:36','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:14:05','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:18:56','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-27 19:20:34','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 08:39:06','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 08:39:34','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 09:17:43','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 09:27:29','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 09:29:13','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 09:33:03','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 10:01:49','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 10:05:53','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 10:12:17','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 10:22:55','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 10:25:51','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 10:32:38','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 10:36:42','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 10:36:48','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 10:38:03','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 10:41:55','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 10:45:28','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 15:52:50','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 16:03:46','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 16:05:08','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 16:52:50','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 17:03:31','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 17:04:43','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 17:05:58','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 17:06:46','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 17:12:51','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 17:13:13','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 17:15:22','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 17:24:37','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 17:55:08','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 17:59:32','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 18:02:46','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 18:05:09','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 18:06:35','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 18:07:26','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 18:08:41','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 18:10:17','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 18:21:25','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 18:22:06','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 18:24:47','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 18:25:18','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 18:33:25','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 18:34:21','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 18:38:55','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 18:58:02','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 21:29:44','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 21:29:54','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 21:37:14','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 21:40:10','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 21:41:57','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 21:44:28','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 21:46:13','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 21:47:14','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 21:47:56','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 21:49:49','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 21:50:09','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 21:51:16','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 21:51:39','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 21:52:58','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 21:53:33','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-28 21:55:28','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 09:30:51','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 09:32:27','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 09:34:58','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 09:36:01','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 09:37:48','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 09:38:10','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 09:38:27','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 09:38:38','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 09:39:38','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 09:40:11','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 09:51:16','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 09:52:55','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 09:53:11','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 10:12:14','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 10:14:59','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 10:19:59','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 10:21:11','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 10:22:55','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 10:47:22','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 10:48:27','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 10:49:45','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 10:55:25','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 11:04:34','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 11:30:27','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 11:48:01','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 11:52:46','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 11:54:31','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 11:55:10','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 11:55:46','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 11:56:13','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 11:56:47','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 11:57:28','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 11:57:51','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 11:58:16','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 11:59:57','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 12:01:18','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 12:42:02','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 12:47:14','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 12:47:49','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 12:49:04','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 12:50:50','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 12:53:06','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 12:54:07','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 12:56:00','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 13:02:10','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 13:02:57','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 13:03:51','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 13:08:55','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 13:11:52','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 13:19:05','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 13:27:14','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 14:19:15','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 14:20:09','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 14:23:35','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 14:24:26','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 14:25:11','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 14:28:41','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 14:29:43','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 14:38:42','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 14:50:00','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 14:51:09','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 14:53:11','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 14:53:47','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 14:54:05','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 14:54:43','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 14:55:28','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 15:00:18','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 15:01:42','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 15:03:48','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 15:04:26','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 15:05:03','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 15:05:27','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 15:05:49','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 15:06:35','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 15:07:28','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 15:09:05','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 15:12:32','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 15:17:25','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 15:20:14','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 15:21:37','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 15:23:25','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 15:27:27','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 15:38:52','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 15:45:54','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 15:59:58','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 16:00:47','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 16:01:24','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 16:01:46','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 16:03:29','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 16:07:49','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 16:08:47','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 16:09:06','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 16:10:22','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 16:10:50','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 16:12:18','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 16:14:01','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 16:24:22','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 16:33:44','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 16:36:24','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 16:38:42','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 16:39:01','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 16:42:31','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 16:45:34','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 16:47:06','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 16:47:56','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-29 17:05:35','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 14:33:05','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 14:46:12','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 14:54:27','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 14:54:34','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 14:54:37','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 15:00:40','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 15:00:54','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 15:01:00','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 15:01:08','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 15:03:01','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 15:23:14','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 15:25:53','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 15:26:00','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 15:32:35','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 15:34:02','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 15:43:49','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 16:30:47','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 16:31:38','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 16:34:03','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 16:35:14','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 16:36:49','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 16:37:28','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 16:38:29','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 16:40:57','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 16:41:20','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 16:42:18','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 16:42:31','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 16:56:41','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 17:05:08','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 17:08:12','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 17:09:00','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 17:09:58','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 17:10:28','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 17:10:47','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 17:11:43','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 17:12:07','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 17:18:04','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 17:19:37','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 17:23:56','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 18:14:46','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 18:16:01','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 18:17:00','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 18:17:14','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 18:20:32','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 18:22:05','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 18:23:19','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 18:26:09','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 18:26:26','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 18:28:20','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 18:36:35','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 18:38:21','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 18:39:38','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 18:40:28','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 18:43:57','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-03-31 20:44:57','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 18:39:39','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 18:42:14','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 18:45:19','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 18:58:43','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 18:59:19','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 19:00:08','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 19:01:37','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 19:02:34','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 19:02:56','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 19:05:22','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 19:08:19','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 19:08:50','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 19:10:02','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 19:10:23','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 19:10:52','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 19:11:41','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 19:13:14','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 21:48:39','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 21:50:35','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 21:51:19','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 21:51:49','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 21:57:25','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 21:57:54','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 21:58:44','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-01 21:59:04','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 09:50:46','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 09:52:02','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 09:53:31','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 11:26:46','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 11:30:45','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 11:32:17','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 11:51:12','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 11:58:25','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 12:00:49','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 12:04:30','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 12:07:27','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 12:09:34','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 12:11:32','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 12:11:39','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 12:13:05','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 12:49:02','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 12:49:44','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 12:52:55','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 12:55:46','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 12:58:07','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 13:07:52','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 13:10:12','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 13:14:59','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 13:16:38','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 13:17:56','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 13:19:11','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 13:31:13','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 13:53:07','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 13:55:56','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 15:10:05','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 15:11:05','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 15:11:32','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 15:12:20','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 15:14:28','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 15:17:27','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 15:20:19','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 15:37:04','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 15:37:27','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 15:38:30','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 15:45:41','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 15:46:44','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 15:49:45','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 15:55:39','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 15:59:50','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:02:42','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:11:51','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:15:15','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:15:49','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:23:20','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:24:52','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:25:58','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:26:45','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:27:48','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:30:19','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:30:43','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:33:42','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:34:29','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:35:14','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:37:25','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:43:13','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:43:33','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:45:05','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:45:57','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:47:49','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 16:53:05','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 17:01:40','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 17:02:59','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 17:44:01','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 17:46:40','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 17:49:09','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 17:49:36','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 17:49:39','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 20:08:32','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 20:10:30','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 20:12:08','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 20:13:18','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 20:14:07','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 20:15:03','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-02 20:16:49','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-03 19:21:27','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 10:19:58','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 10:26:52','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 10:33:26','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 10:36:32','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 10:42:16','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 10:43:41','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 10:44:06','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 10:46:00','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 11:07:29','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 11:13:35','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 11:14:37','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 11:16:09','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 11:19:56','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 11:21:56','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 11:22:27','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 11:29:02','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 13:39:19','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 13:42:22','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 13:52:13','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 13:56:10','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 14:19:56','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 14:28:45','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 14:30:19','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 14:32:05','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 14:34:36','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 14:36:38','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 14:40:14','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 16:03:49','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 16:04:21','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 16:05:25','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 16:06:18','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 16:07:16','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 16:21:34','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 16:23:00','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 16:25:09','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 16:25:28','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 16:26:37','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 16:37:05','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 16:40:50','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 16:41:26','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 16:48:36','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 16:50:44','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 16:52:00','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 16:52:49','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 17:03:09','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 17:04:06','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 17:05:03','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 17:05:31','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 17:07:42','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 17:08:14','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 17:11:34','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 17:15:53','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 17:16:44','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 17:17:44','login','1.0.0.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 17:33:39','login','1.0.1.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 17:34:01','login','1.0.1.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 18:34:44','login','1.0.1.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 18:35:32','login','1.0.1.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 18:36:06','login','1.0.1.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 18:38:37','login','1.0.1.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 18:39:49','login','1.0.1.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 18:41:17','login','1.0.1.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 18:46:32','login','1.0.1.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 18:47:33','login','1.0.1.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 18:48:53','login','1.0.1.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 18:49:30','login','1.0.1.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 18:53:22','login','1.0.1.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 18:53:54','login','1.0.1.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 18:54:23','login','1.0.1.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 18:55:26','login','1.0.1.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 18:55:43','login','1.0.1.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 18:57:44','login','1.0.1.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 18:58:27','login','1.0.1.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (1,'2020-04-04 19:30:03','login','1.0.1.0','DESKTOP-136ALIH','test_station','sample@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (2,'2020-03-24 19:29:24','login','','DESKTOP-136ALIH','test_station','jim.c@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (2,'2020-03-24 19:51:47','login','1.0.0.0','DESKTOP-136ALIH','test_station','jim.c@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (2,'2020-03-24 20:01:14','login','1.0.0.0','DESKTOP-136ALIH','test_station','test@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (2,'2020-03-24 20:09:40','login','1.0.0.0','DESKTOP-136ALIH','test_station','test@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (2,'2020-03-24 20:11:35','login','1.0.0.0','DESKTOP-136ALIH','test_station','test@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (2,'2020-03-24 20:13:02','login','1.0.0.0','DESKTOP-136ALIH','test_station','test@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (2,'2020-03-24 20:15:26','login','1.0.0.0','DESKTOP-136ALIH','test_station','test@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (2,'2020-03-24 20:15:52','login','1.0.0.0','DESKTOP-136ALIH','test_station','test@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (2,'2020-03-24 20:19:12','login','1.0.0.0','DESKTOP-136ALIH','test_station','test@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (2,'2020-03-24 20:19:38','login','1.0.0.0','DESKTOP-136ALIH','test_station','test@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (2,'2020-03-24 20:20:34','login','1.0.0.0','DESKTOP-136ALIH','test_station','test@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (2,'2020-03-24 20:21:07','login','1.0.0.0','DESKTOP-136ALIH','test_station','test@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (2,'2020-03-24 20:21:33','login','1.0.0.0','DESKTOP-136ALIH','test_station','test@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (2,'2020-03-24 20:22:32','login','1.0.0.0','DESKTOP-136ALIH','test_station','test@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (2,'2020-03-24 20:44:03','login','1.0.0.0','DESKTOP-136ALIH','test_station','test@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (3,'2020-03-24 19:29:11','login','','DESKTOP-136ALIH','test_station','jim.c@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (3,'2020-03-28 10:37:42','login','1.0.0.0','DESKTOP-136ALIH','test_station','local_admin@axxin.com');
insert into `user_log` (`user_id`,`date_time`,`event`,`app_version`,`computer_name`,`app_name`,`user_name`) values (4,'2020-03-24 19:29:18','login','','DESKTOP-136ALIH','test_station','jim.c@axxin.com');

/*Table structure for table `users` */

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_role` varchar(255) DEFAULT NULL,
  `user_position` varchar(255) DEFAULT NULL,
  `user_full_name` varchar(255) DEFAULT NULL,
  `user_mobile` varchar(255) DEFAULT NULL,
  `user_photo` longblob,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert into `users` (`user_id`,`user_name`,`user_password`,`user_role`,`user_position`,`user_full_name`,`user_mobile`,`user_photo`) values (1,'sample@axxin.com','sample','sample','sample','Jim Clark','04495dddd','');
insert into `users` (`user_id`,`user_name`,`user_password`,`user_role`,`user_position`,`user_full_name`,`user_mobile`,`user_photo`) values (2,'test@axxin.com','test','test','test','Jim Clark','04495dddd','');
insert into `users` (`user_id`,`user_name`,`user_password`,`user_role`,`user_position`,`user_full_name`,`user_mobile`,`user_photo`) values (3,'local_admin@axxin.com','local_admin','local_admin','local_admin','Jim Clark','04495dddd','');
insert into `users` (`user_id`,`user_name`,`user_password`,`user_role`,`user_position`,`user_full_name`,`user_mobile`,`user_photo`) values (4,'system_admin@axxin.com','system_admin','system_admin','system_admin','Jim Clark','04495dddd','');

/* Procedure structure for procedure `user_login` */

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `user_login`(_user_name varchar(255), _user_password varchar(255),  _app_version varchar(255), _computer_name varchar(255), _app_name varchar(255) )
BEGIN 
  DECLARE _found_count int; 
  DECLARE _found_user_id int; 
  set _found_count = (select count(*) from users where user_name = _user_name and user_password = _user_password); 
  if (_found_count < 1) then 
    select _found_count as status, 'Invalid Username/Password' as message; 
  else 
    set _found_user_id = (select user_id from users where user_name = _user_name and user_password = _user_password); 
    if (_user_name <> 'drag.only@axxin.com') then 
     insert into user_log(user_id, date_time, event, app_version, computer_name, app_name, user_name) 
     values  (_found_user_id, now(), 'login', _app_version, _computer_name, _app_name, _user_name); 
    end if; 
  end if; 
  select 
   _found_count as status,  
    user_id, user_name,  
    user_password,  
    ifNull(user_role,'') as user_role,  
    ifNull(user_position,'') as user_position,  
    ifNull(user_full_name, '') as user_full_name,  
    ifNull(user_mobile,'') as user_mobile from users where user_name =  _user_name and  user_password = _user_password; 
END$$

DELIMITER ;

/* Function  structure for function  `get_test_barcode` */

DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `get_test_barcode`(_sample_id int) RETURNS varchar(4096) CHARSET latin1
BEGIN
   declare name varchar(255);   
   declare dob varchar(255);
   declare sid varchar(255);
   set name = (select concat(first_name,' ',family_name) from samples  where id = _sample_id);  
   set dob = (select DATE_FORMAT(date_of_birth,'%d %b %Y') from samples where id = _sample_id); 
   set sid = (select sample_id from samples where id = _sample_id); 
   return Concat(Upper(name),':',Upper(dob),':',sid);		
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;