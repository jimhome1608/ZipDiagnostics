/*
SQLyog - Free MySQL GUI v5.18
Host - 5.7.28-log : Database - test_station
*********************************************************************
Server version : 5.7.28-log
*/

SET NAMES utf8;

SET SQL_MODE='';

create database if not exists `test_station`;

USE `test_station`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

/*Table structure for table `db_change_log` */

CREATE TABLE `db_change_log` (
  `change_id` int(11) NOT NULL,
  `change_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`change_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

/*Table structure for table `settings` */

CREATE TABLE `settings` (
  `code` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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