create database demo;
use demo;
create table Products (
Id int primary key  ,
productCode varchar(55),
productName varchar(55),
productPrice double,
productAmount int,
productDescription varchar(55),
productStatus bit default 1
);

insert into products (Id,productCode,productName,productPrice,productAmount,productDescription,productStatus) 
value
(1,"cm_ch","com năm",2000,3,"com chien",1),
(2,"ch_tr","chao trăng",1000,3,"chao chung súp",1),
(3,"me","me",1000,3,"me chua",1),
(4,"duong","duong",4000,3,"duong mia",1)
;
select * from products;
explain select * from products where productCode = "ch_tr"; -- 4 // --1 
create index Unique_Index on products(productCode);


explain select productName,productPrice from products 
where productName = "me"; -- 4// -- 1


create index  Composite_Index on products(productName,productPrice);

drop index Composite_Index on products;


create view check_list as select productCode, productName, productPrice, productStatus
from products;

select * from check_list;
insert into check_list value ("dau","dâu",5000,0);

drop view check_list ;


delimiter // 
create procedure prin_all()
begin
select * from products;
end // 
delimiter ;
call prin_all();



delimiter // 
create procedure add_product(
in Id int,
productCode varchar(55),
productName varchar(55),
productPrice double,
productAmount int,
productDescription varchar(55),
productStatus bit)
begin
insert into products 
value
(Id,
productCode,
productName,
productPrice,
productAmount,
productDescription,
productStatus);
end//
delimiter ;

call  add_product(6,"hanh","hanh",2000,4,"hanh khô",1);

delimiter //
create procedure change_name( in id int,name_change varchar(55))
begin
set sql_safe_updates = 0;
update products 
set products.productName = name_change where  products.Id = id;
set sql_safe_updates = 1;
end//
delimiter ;



call change_name (3,"bún");
set sql_safe_updates = 0;
delete from products;
set sql_safe_updates = 1;

delimiter //
create procedure delled( in id int)
begin
set sql_safe_updates = 0;
delete from products 
where products.Id = id;
set sql_safe_updates = 1;
end//
delimiter ;

call delled(3);