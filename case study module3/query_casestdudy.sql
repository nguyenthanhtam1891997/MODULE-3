use quan_ly_furama;
-- câu 2
select nhan_vien.ma_nhan_vien,nhan_vien.ho_ten from nhan_vien
where( nhan_vien.ho_ten like "t%")
or ( nhan_vien.ho_ten like "h%")  
or ( nhan_vien.ho_ten like "k%")
and char_length(nhan_vien.ho_ten) <15;
-- câu 3
 select khach_hang.ma_khach_hang, khach_hang.ho_ten from khach_hang 
 where (2022 -  year(khach_hang.ngay_sinh) > 18 and 2022 -  year(khach_hang.ngay_sinh) < 50) and
 (khach_hang.dia_chi like "%Đà Nẵng%") or (khach_hang.dia_chi like "%Quảng Trị%");
 -- câu 4
 
