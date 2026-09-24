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

select id,customer,city ,product ,amount,
lag(amount) over ( order by amount desc) as previous
from sales;
select id,customer,city ,product ,amount,
lead(amount) over ( order by amount desc) as nexto
from sales;
select id,customer,city ,product ,amount,
SUM(amount * quantity) OVER (ORDER BY order_date) as runnig_total
from sales;
select id,customer,city ,product ,amount,
avg(amount ) OVER (rows between 2 preceding and current row) as runnig_avg
from sales;
with ranko as (
select id,customer,city ,product ,amount,
dense_rank() over ( partition by city order by amount ) as rankn
from sales
)
select id,customer,city,rankn 
from ranko
where rankn=1;

