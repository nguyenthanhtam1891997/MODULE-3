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


-- câu 6

create view check_id_dich_vu as
select dich_vu.ma_dich_vu from 
 dich_vu left  join hop_dong on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu left join
 khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
 where  year(hop_dong.ngay_lam_hop_dong) = 2021 and month(hop_dong.ngay_lam_hop_dong) <4 
 group by hop_dong.ma_hop_dong;

 select dich_vu.ma_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,
 dich_vu.chi_phi_thue,loai_dich_vu.ten_dich_vu
 from 
 loai_dich_vu left join dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_dich_vu
 where dich_vu.ma_dich_vu not in (select * from check_id_dich_vu);
 
 -- câu 7 ////////////////////////////////////////

 select dich_vu.ma_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.so_nguoi_toi_da,
 dich_vu.chi_phi_thue,loai_dich_vu.ten_dich_vu
 from 
loai_dich_vu left join dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_dich_vu 
left join hop_dong on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu 
left join khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
where year(hop_dong.ngay_lam_hop_dong) = 2020 and dich_vu.ma_dich_vu not in
(select dich_vu.ma_dich_vu from 
 dich_vu left  join hop_dong on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu left join
 khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
 where  year(hop_dong.ngay_lam_hop_dong) =2021
 )
 group by dich_vu.ma_dich_vu;
 -- câu 8 //////////////////////////////////
select  distinct khach_hang.ho_ten from khach_hang; -- cách 1
select  khach_hang.ho_ten from khach_hang -- cách 2
group by khach_hang.ho_ten
having count(khach_hang.ho_ten) <=2;
select khach_hang.ho_ten from khach_hang
where ma_khach_hang in 
( select max(ma_khach_hang) from khach_hang group by khach_hang.ho_ten); -- cách 3

-- câu 9 
select month(hop_dong.ngay_lam_hop_dong) as thang,count(hop_dong.ma_khach_hang) as so_luong_khach_hang
from 
khach_hang right join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2021
group by month(hop_dong.ngay_lam_hop_dong);

-- câu 10 
select hop_dong.ma_hop_dong,hop_dong.ngay_lam_hop_dong,
hop_dong.ngay_ket_thuc,hop_dong.tien_dat_coc,sum(hop_dong_chi_tiet.so_luong ) 
from 
dich_vu left join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
 group by hop_dong.ma_hop_dong
;
-- câu 11 
select dich_vu_di_kem.* from 
loai_khach left join khach_hang on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
inner join hop_dong on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
inner join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
inner join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
where loai_khach.ten_loai_khach = "Diamond" and (khach_hang.dia_chi like "%Vinh%" or khach_hang.dia_chi like "%Quảng Ngãi%")
 group by dich_vu_di_kem.ma_dich_vu_di_kem
; 

-- câu 12
select hop_dong.ma_hop_dong,nhan_vien.ho_ten,khach_hang.ho_ten,khach_hang.so_dien_thoai,
dich_vu.ten_dich_vu,sum(hop_dong_chi_tiet.so_luong )
from
khach_hang left join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
left join nhan_vien on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
where year(hop_dong.ngay_lam_hop_dong) = 2020
and month(hop_dong.ngay_lam_hop_dong) >= 10 and  month(hop_dong.ngay_lam_hop_dong) <= 12 
and hop_dong.ma_hop_dong not in (
select hop_dong.ma_hop_dong from hop_dong
where year(hop_dong.ngay_lam_hop_dong) = 2021 and month(hop_dong.ngay_lam_hop_dong) = 6
)
 group by hop_dong.ma_hop_dong;

-- câu 13
select dich_vu_di_kem.*,sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem from 
hop_dong left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by dich_vu_di_kem.ma_dich_vu_di_kem
having sum(hop_dong_chi_tiet.so_luong) = (select max(hop_dong_chi_tiet.so_luong) from hop_dong_chi_tiet);

-- câu 14
select hop_dong.ma_hop_dong,loai_dich_vu.ten_dich_vu,
dich_vu_di_kem.ten_dich_vu_di_kem,count(hop_dong_chi_tiet.so_luong) as so_lan_su_dung
from
loai_dich_vu left join dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_dich_vu
left join hop_dong on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
 group by dich_vu_di_kem.ten_dich_vu_di_kem
  having  count(hop_dong_chi_tiet.so_luong) = 1;

-- câu 15
select nhan_vien.ma_nhan_vien,nhan_vien.ho_ten,trinh_do.ten_trinh_do,
bo_phan.ten_bo_phan,nhan_vien.so_dien_thoai,nhan_vien.dia_chi
from
bo_phan left join nhan_vien on bo_phan.ma_bo_phan = nhan_vien.ma_bo_phan
left join trinh_do on trinh_do.ma_trinh_do = nhan_vien.ma_trinh_do
left join hop_dong on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
where year(hop_dong.ngay_lam_hop_dong)>=2020 and year(hop_dong.ngay_lam_hop_dong) < 2022
group by nhan_vien.ma_nhan_vien
having count(hop_dong.ma_hop_dong) <= 3
;
-- câu 16 ///////////////////////////////////////////
-- select nhan_vien.ma_nhan_vien,nhan_vien.ho_ten
-- from
-- nhan_vien  inner join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
-- where year(hop_dong.ngay_lam_hop_dong)>=2019 and year(hop_dong.ngay_lam_hop_dong) < 2022
--  
-- group by hop_dong.ma_hop_dong
-- -- having count(hop_dong.ma_hop_dong) 
-- ;
select nhan_vien.ma_nhan_vien,nhan_vien.ho_ten from nhan_vien
where nhan_vien.ma_nhan_vien not in
 (select nhan_vien.ma_nhan_vien
from
nhan_vien inner join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
where year(hop_dong.ngay_lam_hop_dong)>=2019 and year(hop_dong.ngay_lam_hop_dong) < 2022 
  group by hop_dong.ma_hop_dong
 )
 group by nhan_vien.ma_nhan_vien
 ;
-- câu 17
create temporary table ban_tam as
 select loai_khach.ma_loai_khach,khach_hang.ma_khach_hang,khach_hang.ho_ten,hop_dong.ma_hop_dong,
 hop_dong_chi_tiet.ma_hop_dong_chi_tiet,dich_vu_di_kem.ma_dich_vu_di_kem,dich_vu.chi_phi_thue,
 hop_dong_chi_tiet.so_luong,dich_vu_di_kem.gia
from 
loai_khach left join khach_hang on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
left join hop_dong on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
 where loai_khach.ten_loai_khach = "Platinium" and year(hop_dong.ngay_lam_hop_dong) = 2021
group by khach_hang.ma_khach_hang
having sum(dich_vu.chi_phi_thue) + hop_dong_chi_tiet.so_luong * sum(dich_vu_di_kem.gia)  > 10000000 
;
select * from ban_tam;

SET SQL_SAFE_UPDATES = 0;
update khach_hang
set khach_hang.ma_loai_khach = 1
where ma_khach_hang in (select ma_khach_hang from ban_tam) ;
SET SQL_SAFE_UPDATES = 1;
select khach_hang.ma_loai_khach,khach_hang.ho_ten,khach_hang.ma_khach_hang,loai_khach.ten_loai_khach from 
loai_khach left join khach_hang on  khach_hang.ma_loai_khach = loai_khach.ma_loai_khach ;
-- câu 18 //////////////////////////

create temporary table xoa_khach_hang as
select khach_hang.ma_khach_hang,khach_hang.ho_ten,khach_hang.email,khach_hang.so_dien_thoai,khach_hang.ngay_sinh,khach_hang.dia_chi,
hop_dong.ma_hop_dong 
from 
khach_hang left join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where year(hop_dong.ngay_lam_hop_dong) < 2021
group by hop_dong.ma_hop_dong;

select * from xoa_khach_hang;

select khach_hang.ma_khach_hang,khach_hang.ho_ten from khach_hang
where ma_khach_hang in (select ma_khach_hang from xoa_khach_hang);

SET FOREIGN_KEY_CHECKS = 0;
delete from khach_hang
where ma_khach_hang in (select ma_khach_hang from xoa_khach_hang);
SET FOREIGN_KEY_CHECKS = 1;
-- câu 19 //////////////////////////////////
create temporary table nang_gia_dich_vu_di_kem as
select hop_dong.ma_hop_dong,hop_dong_chi_tiet.ma_hop_dong_chi_tiet,
dich_vu_di_kem.ma_dich_vu_di_kem,dich_vu_di_kem.gia,hop_dong_chi_tiet.so_luong,
dich_vu_di_kem.ten_dich_vu_di_kem
from
hop_dong left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
where year(hop_dong.ngay_lam_hop_dong) = 2020 and hop_dong_chi_tiet.so_luong > 10 
;
select * from dich_vu_di_kem
where ma_dich_vu_di_kem in (select ma_dich_vu_di_kem from nang_gia_dich_vu_di_kem);
SET SQL_SAFE_UPDATES = 0;
update dich_vu_di_kem
set dich_vu_di_kem.gia = dich_vu_di_kem.gia * 2 
where ma_dich_vu_di_kem in (select ma_dich_vu_di_kem from nang_gia_dich_vu_di_kem);
SET SQL_SAFE_UPDATES = 1;

-- câu 20
select nhan_vien.ma_nhan_vien,nhan_vien.ho_ten,nhan_vien.email,nhan_vien.ngay_sinh,nhan_vien.dia_chi
from nhan_vien
union all
select khach_hang.ma_khach_hang,khach_hang.ho_ten,khach_hang.email,khach_hang.ngay_sinh,khach_hang.dia_chi
from khach_hang
union all 
select ma_khach_hang,ho_ten,email,ngay_sinh,dia_chi 
from xoa_khach_hang
;