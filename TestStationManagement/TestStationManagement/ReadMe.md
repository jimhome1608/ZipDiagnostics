
**Database -> test_station**
<br>Currently using same Database as spectrace setup so would need to run..
```
GRANT ALL PRIVILEGES ON test_station.* TO 'axxin_spectrace'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON test_station.* TO 'axxin_spectrace'@'localhost' WITH GRANT OPTION;
```
But for release will install mysql with a different user and just use the root password for the database so will not be any complications.
<br>User roles, (sample, test, sample_test, local_admin, system_admin)<br>
*insert some sample uses data..*
```
insert into `users` (`user_id`,`user_name`,`user_password`,`user_role`,`user_position`,`user_full_name`,`user_mobile`,`user_photo`) 
values (1, 'sample@axxin.com','sample','sample','sample','Jim Clark','04495dddd','');
insert into `users` (`user_id`,`user_name`,`user_password`,`user_role`,`user_position`,`user_full_name`,`user_mobile`,`user_photo`) 
values (2, 'test@axxin.com','test','test','test','Jim Clark','04495dddd','');
insert into `users` (`user_id`,`user_name`,`user_password`,`user_role`,`user_position`,`user_full_name`,`user_mobile`,`user_photo`) 
values (3, 'local_admin@axxin.com','local_admin','local_admin','local_admin','Jim Clark','04495dddd','');
insert into `users` (`user_id`,`user_name`,`user_password`,`user_role`,`user_position`,`user_full_name`,`user_mobile`,`user_photo`) 
values (4, 'system_admin@axxin.com','system_admin','system_admin','system_admin','Jim Clark','04495dddd','');
```
---
*Insert some samples test data..*
```
insert into `samples` (`id`,`save_time`,`patient_name`,`date_of_birth`,`postcode`,`phone`,`email`,`notes`,`sample_id`,`test_id`,`test_result`) values (4,NULL,'Jim Clark','1962-05-23 00:00:00','3168','999999874','jim@jimclark.net.au','notes','SAMPLE_JIM',NULL,'testresult');
insert into `samples` (`id`,`save_time`,`patient_name`,`date_of_birth`,`postcode`,`phone`,`email`,`notes`,`sample_id`,`test_id`,`test_result`) values (5,NULL,'Yumiko Watanabe','1970-05-23 00:00:00','3168','3216549878','yumiko@gmail.com','notes','SAMPLE YUMIKO',NULL,'testresult');

```
