create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table class(
class_id int not null primary key auto_increment,
class_name varchar(60) not null,
start_date datetime not null,
status_class bit
);
