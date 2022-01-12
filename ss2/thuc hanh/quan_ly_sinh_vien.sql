create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table class(
class_id int not null primary key auto_increment,
class_name varchar(60) not null,
start_date datetime not null,
status_class bit
);
create table student(
studen_id int not null primary key auto_increment,
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
status_student bit,
class_id int not null
-- foreign key(class_id) references class(class_id)
);
alter table student
add constraint fk_class_id foreign key(class_id) references class(class_id);
create table subject_(
sub_id int not null auto_increment primary key,
subname varchar(30) not null,
credit tinyint not null default 1 check(credit>=1),
status_subject bit default 1
);
create table mark(
mark_id int not null primary key auto_increment,
sub_id int not null,
student_id int not null,
mark float default 0 check(mark between 0 and 100),
exam_time tinyint default 1,
unique (sub_id,student_id),
foreign key (sub_id) references subject_(sub_id),
foreign key (student_id) references student(studen_id)
);