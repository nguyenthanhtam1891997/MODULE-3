create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer(
customer_id int primary key auto_increment ,
customer_name varchar(50) not null,
customer_age int
);
create table product(
product_id int primary key auto_increment,
product_name varchar(55),
product_price int
);
create table order_pill(
order_id int primary key auto_increment,
customer_id int,
order_date date,
order_toto_price int,
foreign key (customer_id) references customer(customer_id)
);
create table order_detail(
ordei_id int,
product_id int,
order_qty varchar(55),
primary key (ordei_id,product_id),
foreign key (ordei_id) references order_pill(order_id),
foreign key (product_id) references product(product_id)
);
insert into customer(customer_name,customer_age) values
("tam",10), 
("kim",20);
select *from customer;
insert into product(product_name,product_price) values
("banh kep",10),
("banh dap",15)
;
select *from product;
 -- drop table order_detail;
 -- drop table order_pill;
insert into order_pill(customer_id,order_date,order_toto_price) values
(1,"2021-03-01",10),
(2,"2021-02-01",3);
select * from order_pill;
insert into order_detail(ordei_id,product_id,order_qty)values
(1,1,"them ớt"),
(1,2,"ham lại");
select *from  order_detail;
 

