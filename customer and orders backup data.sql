create table backup_customers_data
select * from customers;

drop table backup_customers_data;

create table backup_orders_data
select * from orders;

select * from backup_customers_data;