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
 select khach_hang.ma_khach_hang,khach_hang.ho_ten, count(hop_dong.ma_hop_dong) as so_lan_dat_phong,loai_khach.ten_loai_khach from
 loai_khach  join khach_hang on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach left join
 hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
 group by hop_dong.ma_khach_hang 
 having loai_khach.ten_loai_khach = "Diamond" and count(hop_dong.ma_hop_dong) > 0
 order by count(hop_dong.ma_hop_dong) asc ;
  -- câu 5
  
  

 
 
 
