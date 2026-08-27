create database join_practice;
use join_practice;

select * from customers;
select * from orders;

select c.customer_name , sum(o.amount) as total_amount
from customers c 
right join orders o on c.customer_id = o.customer_id
group by c.customer_name;

select c.city , o.product , sum(o.amount)as total_amount
from customers c
right join orders o on c.customer_id = o.customer_id
group by c.city , o.product;


SET SQL_SAFE_UPDATES = 0;

update orders
set 
	order_date = str_to_date(order_date,'%Y-%m-%d');

select * from orders
order by order_date asc;

select c.customer_name , o.product , sum(amount)as total_amount
from customers c
inner join orders o on c.customer_id = o.customer_id
where o.order_date between '2023-06-03' and '2023-06-14'
group by c.customer_name , o.product;


create view Mouse_sale as
(
select c.customer_id , c.customer_name ,o.product , o.amount , sum(amount) over(order by order_date)as runnig_amount
from customers c 
right join orders o on c.customer_id = o.customer_id
where o.product = 'Mouse'
);
select * from Mouse_sale;

select product , sum(amount)as total_amount
from orders
group by product;


create view Laptop_sale as
(
select c.customer_id , c.customer_name ,o.product , o.amount , sum(amount) over(order by order_date)as runnig_amount
from customers c 
right join orders o on c.customer_id = o.customer_id
where o.product = 'Laptop'
);
select * from Laptop_sale;

create view Webcam_sale as
(
select c.customer_id , c.customer_name ,o.product , o.amount , sum(amount) over(order by order_date)as runnig_amount
from customers c 
right join orders o on c.customer_id = o.customer_id
where o.product = 'Webcam'
);
select * from Webcam_sale;


create view SSD_sale as
(
select c.customer_id , c.customer_name ,o.product , o.amount , sum(amount) over(order by order_date)as runnig_amount
from customers c 
right join orders o on c.customer_id = o.customer_id
where o.product = 'SSD'
);
select * from SSD_sale;

select o.order_id , c.customer_name , o.amount
from orders o 
left join customers c on c.customer_id = o.customer_id
where c.customer_name = 'Bhavna Shah';


select customer_name , count(*)as total_count
from customers
group by customer_name
order by total_count desc;


select o.customer_id ,o.product ,c.customer_name, sum(o.amount)as total_amount
from orders o
left join customers c on c.customer_id = o.customer_id
where o.customer_id = 34
group by o.customer_id,o.product,c.customer_name;
