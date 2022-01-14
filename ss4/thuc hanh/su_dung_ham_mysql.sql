use quan_ly_sinh_vien;
select address,count(studen_id) as 'số_lương_học_viên' from student
group by address;

select student.studen_id,student.student_name,avg(mark.mark)
from student left join mark on student.studen_id = mark.student_id
group by student.studen_id,student.student_name;

select studen_id, student_name ,avg(mark.mark) from
student join mark on student.studen_id = mark.student_id
group by studen_id,student_name
having avg(mark.mark) > 15;

select studen_id,student_name,avg(mark) from
student join mark on student.studen_id = mark.student_id
group by studen_id,student_name
having avg(mark) >= all ( select avg(mark) from mark group by mark.student_id);

