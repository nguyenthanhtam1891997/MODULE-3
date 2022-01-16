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
select khach_hang.ma_khach_hang,ho_ten,ten_loai_khach,hop_dong.ma_hop_dong,
dich_vu.ten_dich_vu,ngay_lam_hop_dong,ngay_ket_thuc ,
 case
--   when khach_hang.ma_khach_hang not in (select khach_hang.ma_khach_hang from khach_hang  join hop_dong 
--   on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang ) then 0
--   when hop_dong_chi_tiet.so_luong is null then  dich_vu.chi_phi_thue
-- 	else sum( dich_vu_di_kem.gia * hop_dong_chi_tiet.so_luong)+dich_vu.chi_phi_thue
when hop_dong.ma_khach_hang is null then 0 
when hop_dong_chi_tiet.so_luong is null then  dich_vu.chi_phi_thue
else sum( dich_vu_di_kem.gia * hop_dong_chi_tiet.so_luong)+dich_vu.chi_phi_thue
end 
as "tong_tien"
 from
loai_khach right join khach_hang on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
left join  hop_dong on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
 left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
 group by ma_hop_dong;
-- ma_hop_dong,

-- câu 6
-- select dich_vu.ma_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.chi_phi_thue,loai_dich_vu.ten_dich_vu from
--  hop_dong join dich_vu on dich_vu.ma_dich_vu =hop_dong.ma_dich_vu join
--  loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_dich_vu inner join 
--  khach_hang on 
--  group by dich_vu.ma_dich_vu 

 select dich_vu.ma_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.chi_phi_thue,loai_dich_vu.ten_dich_vu from
 loai_dich_vu left join dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_dich_vu  join
 hop_dong on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu left join
 khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
-- 
  where month(hop_dong.ngay_lam_hop_dong) >= 1 and month(hop_dong.ngay_lam_hop_dong)  <= 3
 group by hop_dong.ma_hop_dong;
 


