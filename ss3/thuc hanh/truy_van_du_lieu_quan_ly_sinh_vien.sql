use quan_ly_sinh_vien;
select * from student;
select * from student where status_student = true;
select *from subject_ where credit < 10;
select student.studen_id,student.student_name,class.class_name from student join class on student.class_id=class.class_id
where class.class_name = "a1";

select student.studen_id,student.student_name,subject_.subname,mark.mark from 
student join mark on student.studen_id = mark.student_id join subject_ on mark.sub_id = subject_.sub_id
where subject_.subname = "cf";