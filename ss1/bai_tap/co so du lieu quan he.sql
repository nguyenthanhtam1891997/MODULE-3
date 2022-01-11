 drop database my_database2;
 drop database student_management;
 create database my_database;
 create database student_management;
 use student_management;
 create table student(
 id_student int,
 name_student varchar(45),
 age int,
 country varchar(45),
 primary key(id_student)
 );
 
 create table class(
 id_class int,
 name_class varchar(45),
 primary key(id_class)
 );

create table student_management.teacher(
id_teacher int,
 name_teacher varchar(45),
 age int,
 country varchar(45),
 primary key(id_teacher)
);
 select * from student_management.student;
 select * from student_management.class;
 
 
