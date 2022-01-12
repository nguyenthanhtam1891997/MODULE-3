create database quan_ly_nhap_xuat;
use quan_ly_nhap_xuat;
create table nha_cc
(
ma_nha_cc int primary key auto_increment,
ten_nha_cc varchar(50),
dia_chi varchar(50)
);


create table so_nha_cc
(
id_so_cc int primary key auto_increment ,
ma_nha_cc int ,
phone_nha_cc int ,
foreign key (ma_nha_cc) references nha_cc(ma_nha_cc)

);
create table don_dh
(
so_dh int primary key auto_increment,
ngay_dh datetime,
ma_nha_cc int,
foreign key (ma_nha_cc) references nha_cc(ma_nha_cc)
);

create table phieu_xuat
(
so_px int primary key auto_increment,
ngay_xuat datetime
);
create table vat_tu
(
ma_vtu int primary key auto_increment,
ten_vtu varchar(50)
);
create table phieu_nhap
(
so_pn int primary key auto_increment,
ngay_nhap datetime
);
create table chi_tiet_phieu_xuat
(
so_px int,
ma_vtu int,
dg_xuat varchar(50),
sl_xuat int,
primary key (so_px,ma_vtu),
foreign key (so_px) references phieu_xuat(so_px),
foreign key (ma_vtu) references vat_tu(ma_vtu)
);
create table chi_tiet_phieu_nhap
(
so_pn int,
ma_vtu int,
dg_nhap varchar(50),
sl_nhap int,
primary key (so_pn,ma_vtu),
foreign key (so_pn) references phieu_nhap(so_pn),
foreign key (ma_vtu) references vat_tu(ma_vtu)
);
create table chi_tiet_don_dat_hang
(
ma_vtu int,
so_dh int,
primary key (ma_vtu,so_dh),
foreign key (ma_vtu) references vat_tu(ma_vtu),
foreign key (so_dh) references don_dh(so_dh)
);
