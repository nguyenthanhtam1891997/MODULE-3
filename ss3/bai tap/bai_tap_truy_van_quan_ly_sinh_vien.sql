use quan_ly_sinh_vien;
select * from student where student.student_name like "h%";
select * from class having month(class.start_date) = 12 ;
select *from subject_ where subject_.credit between 3 and 5;




set sql_safe_updates =0;
update student set class_id = 2 where student_name = "hung";
set sql_safe_updates =1;



select student.student_name,subject_.subname,mark.mark from
student join mark on student.studen_id=mark.mark_id join subject_ on subject_.sub_id=mark.sub_id
 order by  mark.mark desc,student.student_name asc;