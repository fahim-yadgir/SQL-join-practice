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

