use quan_ly_sinh_vien;


select subject_.* from subject_
order by credit desc limit 1;

select subject_.* from  subject_
where sub_id = (select sub_id from mark order by mark desc limit 1 );


select student.*,avg(mark.mark) as "diem_trung_binh" from
student join mark on student.studen_id = mark.student_id
group by studen_id order by avg(mark) desc;
