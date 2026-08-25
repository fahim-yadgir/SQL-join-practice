create database join_practice;
use join_practice;

select * from customers;
select * from orders;

select c.customer_name , sum(o.amount) as total_amount
from customers c 
right join orders o on c.customer_id = o.customer_id
group by c.customer_name;