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

select id,customer, amount*quantity as total_value,
case 
   when quantity*amount >= 50000 then 'high'
   when quantity*amount >= 5000 then 'medium'
   else 'low'
   end as category 
from sales ;

SELECT
    COUNT(CASE WHEN amount * quantity >= 50000 THEN 1 END) AS high_orders,
    COUNT(CASE WHEN amount * quantity >= 5000
                    AND amount * quantity < 50000 THEN 1 END) AS medium_orders,
    COUNT(CASE WHEN amount * quantity < 5000 THEN 1 END) AS low_orders
FROM sales;

select id,order_date,
year (order_date) as year,
month(order_date) as month
from sales;
select id, order_date,
datediff('2026-03-31', order_date) as gap
from sales;

select customer , upper(customer) as upr
from sales;
select customer , substring(customer,1,3)
from sales;
   
select id , customer, 
amount/nullif(quantity,0) as amount_per_quantity
from sales;

   