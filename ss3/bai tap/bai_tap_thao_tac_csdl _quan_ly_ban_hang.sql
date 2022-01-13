use quan_ly_ban_hang;
set sql_safe_updates =0;
delete from order_detail;
delete from order_pill where order_pill.order_id <10;
delete from customer;
delete from product;
set sql_safe_updates =1;

insert into customer 
values (1,"minh quan",10),
	   (2,"Ngoc Oanh",20),
        (3,"Hong Ha",50);
insert into order_pill values
(1,1,"2006/3/21",Null),
(2,2,"2006/3/23",Null),
(3,1,"2006/3/16",Null);

insert into product values
( 1,"May Giat",3),
(2,"Tu Lanh",5),
(3,"Dieu Hoa",7),
(4,"Quat",1),
(5,"Bep Dien",2);

insert into order_detail values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

select * from order_pill;
select customer.*,product.* from
customer join order_pill on customer.customer_id=order_pill.customer_id join
order_detail on order_detail.ordei_id=order_pill.order_id join
product on order_detail.product_id=product.product_id;

select customer.customer_name  from
customer left join order_pill on customer.customer_id=order_pill.customer_id
 group by order_pill.customer_id having count(order_pill.customer_id) <=0
 ;
 
 select order_detail.ordei_id,order_pill.order_date,order_detail.order_qty*product.product_price from
 customer join order_pill on customer.customer_id = order_pill.customer_id join
 order_detail on order_detail.ordei_id=order_pill.order_id join
 product on product.product_id =order_detail.product_id;


