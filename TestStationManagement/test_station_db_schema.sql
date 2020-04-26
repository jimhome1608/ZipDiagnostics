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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Table structure for table `samples` */

CREATE TABLE `samples` (
  `station_id` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL DEFAULT '0',
  `sample_time` datetime NOT NULL,
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
  `test_time` datetime DEFAULT NULL,
  `web_saved` int(11) DEFAULT '0',
  `sample_user_name` varchar(255) DEFAULT NULL,
  `test_start_user_name` varchar(255) DEFAULT NULL,
  `test_result_user_name` varchar(255) DEFAULT NULL,
  `sample_user_id` int(11) DEFAULT NULL,
  `test_start_user_id` int(11) DEFAULT NULL,
  `test_result_user_id` int(11) DEFAULT NULL,
  `result_file` longtext,
  PRIMARY KEY (`station_id`,`id`,`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `samples_history` */

CREATE TABLE `samples_history` (
  `history_id` int(11) NOT NULL,
  `station_id` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL DEFAULT '0',
  `sample_time` datetime NOT NULL,
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
  `test_time` datetime DEFAULT NULL,
  `web_saved` int(11) DEFAULT '0',
  `sample_user_name` varchar(255) DEFAULT NULL,
  `test_start_user_name` varchar(255) DEFAULT NULL,
  `test_result_user_name` varchar(255) DEFAULT NULL,
  `sample_user_id` int(11) DEFAULT NULL,
  `test_start_user_id` int(11) DEFAULT NULL,
  `test_result_user_id` int(11) DEFAULT NULL,
  `result_file` longtext,
  PRIMARY KEY (`history_id`,`station_id`,`id`,`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `settings` */

CREATE TABLE `settings` (
  `code` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT '',
  `description` varchar(255) DEFAULT '',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `stations` */

CREATE TABLE `stations` (
  `id` int(11) NOT NULL,
  `when_created` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `notes` longtext,
  PRIMARY KEY (`id`)
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

/* Procedure structure for procedure `get_next_id` */

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_next_id`()
BEGIN
declare _nextid int;
set _nextid = (select max(id) from samples);
set _nextid = ifnull(_nextid,0);
set _nextid = _nextid + 1;
select _nextid;
END$$

DELIMITER ;

/* Procedure structure for procedure `get_next_station_id` */

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_next_station_id`()
BEGIN
declare _nextid int;
set _nextid = (select max(id) from stations);
set _nextid = ifnull(_nextid,0);
set _nextid = _nextid + 1;
select _nextid as next_station_id;
END$$

DELIMITER ;

/* Procedure structure for procedure `save_sample` */

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `save_sample`(IN _station_id varchar(255),  _id int ,  _test_id int , _sample_time datetime, _first_name varchar(255),  _family_name varchar(255), _date_of_birth datetime,  
          _postcode varchar(255),  _phone varchar(255),  _email varchar(255), _notes longtext,  _sample_id varchar(255),  _test_result varchar(255),  _test_status varchar(255),  
	  _test_start_time datetime,  _result_import_time datetime,  _test_time datetime, _web_saved int,  _sample_user_name varchar(255),  _test_start_user_name varchar(255),  
          _test_result_user_name varchar(255),  _sample_user_id int, _test_start_user_id int,  _test_result_user_id int , _result_file longtext)
BEGIN
   declare new_id int;
   if exists (select * from samples where station_id = _station_id and id = _id and test_id = _test_id) then
	insert into samples_history (select get_next_history_id(),station_id,  id, test_id,  sample_time, first_name,  family_name, date_of_birth,  postcode,  phone,  email, notes,  sample_id,  
         test_result,  test_status,  test_start_time,  result_import_time,  test_time, web_saved,  sample_user_name,  test_start_user_name,  
         test_result_user_name,  sample_user_id, test_start_user_id,  test_result_user_id,  result_file
        from samples where station_id = _station_id and id = _id and test_id = _test_id );
        delete from samples where station_id = _station_id and id = _id  and test_id = _test_id;
   end if;
   insert into `samples` 
	(station_id,  id, test_id,  sample_time, first_name,  family_name, date_of_birth,  postcode,  phone,  email, notes,  sample_id,  
         test_result,  test_status,  test_start_time,  result_import_time,  test_time, web_saved,  sample_user_name,  test_start_user_name,  
         test_result_user_name,  sample_user_id, test_start_user_id,  test_result_user_id,  result_file
	)
	values
	(_station_id,  _id,  _test_id, _sample_time, _first_name,  _family_name, _date_of_birth,  _postcode,  _phone,  _email, _notes,  _sample_id,  
         _test_result,  _test_status,  _test_start_time,  _result_import_time,  _test_time, _web_saved,  _sample_user_name,  _test_start_user_name,  
         _test_result_user_name,  _sample_user_id, _test_start_user_id,  _test_result_user_id,  _result_file
	);
    set new_id = (select max(id) from samples where station_id = _station_id);
    select samples.*, get_sample_id(samples.station_id, samples.id) as sample_id2, concat(first_name,' ', family_name) as full_name  from samples
    where station_id = _station_id and id = new_id;
    
END$$

DELIMITER ;

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

/* Function  structure for function  `get_next_history_id` */

DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_history_id`() RETURNS int(11)
BEGIN
declare _nextid int;
  set _nextid = (select max(history_id) from samples_history);
  set _nextid = ifnull(_nextid,0);
  set _nextid = _nextid + 1;
  return _nextid;
END$$

DELIMITER ;

/* Function  structure for function  `get_next_id` */

DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_id`() RETURNS int(11)
BEGIN
  declare _nextid int;
  set _nextid = (select max(id) from samples);
  set _nextid = ifnull(_nextid,0);
  set _nextid = _nextid + 1;
  return _nextid;
END$$

DELIMITER ;

/* Function  structure for function  `get_sample_id` */

DELIMITER $$

CREATE DEFINER=`root`@`localhost` FUNCTION `get_sample_id`(_station_id varchar(255), _id int) RETURNS varchar(255) CHARSET latin1
BEGIN   
   return Concat(Upper(_station_id),'S',_id);		
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;