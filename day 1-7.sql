CREATE DATABASE sql_revision;
USE sql_revision;

CREATE TABLE sales (
    id INT,
    customer VARCHAR(50),
    city VARCHAR(30),
    product VARCHAR(50),
    amount INT,
    quantity INT,
    order_date DATE
);

INSERT INTO sales VALUES
(1, 'Aman', 'Delhi', 'Laptop', 70000, 1, '2026-01-10'),
(2, 'Ravi', 'Delhi', 'Mouse', 1500, 2, '2026-01-15'),
(3, 'Neha', 'Mumbai', 'Laptop', 65000, 1, '2026-02-05'),
(4, 'Aman', 'Delhi', 'Keyboard', 3000, 2, '2026-02-12'),
(5, 'Priya', 'Mumbai', 'Mouse', 1800, 3, '2026-02-20'),
(6, 'Ravi', 'Pune', 'Laptop', 72000, 1, '2026-03-01'),
(7, 'Neha', 'Mumbai', 'Keyboard', 2500, 1, '2026-03-08'),
(8, 'Arjun', 'Pune', 'Mouse', 1200, 2, '2026-03-15');

show tables;

select * from sales;
select customer,product,amount
from sales;

select amount
from sales 
where amount>3000;
select city,amount
from sales 
where amount>2000 and city ='delhi';
select amount 
from sales 
order by amount desc;

select sum(amount*quantity) as total_sales 
from sales;
select avg(amount) as average_amount
from sales;
select city,sum(amount*quantity) as total_sales 
from sales
group by city;
select city,sum(amount*quantity) as total_sales
from sales 
group by city 
having sum(amount*quantity)>70000 ;

select product,amount
from sales 
order by amount desc
limit 1;
select id, customer, product,amount*quantity as total_value
from sales 
order by total_value desc
limit 1;
select id,customer,product , amount*quantity as total_value
from sales
where amount*quantity>
(
select avg( amount*quantity)
from sales
);
select id,customer,product,amount*quantity as total_value,
dense_rank() over ( order by amount*quantity  desc ) as rankn
from sales;
select id,customer,product,city,amount*quantity as total_value,
dense_rank() over ( partition by city order by amount*quantity  desc ) as rankn
from sales;

