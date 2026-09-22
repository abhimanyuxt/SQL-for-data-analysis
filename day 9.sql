use khanapina;
CREATE TABLE orders (
    order_id INT,
    customer VARCHAR(50),
    order_date DATE,
    amount INT
);
INSERT INTO orders VALUES
(1, 'Aman', '2026-01-15', 500),
(2, 'Ravi', '2026-02-20', 800),
(3, 'Neha', '2026-02-25', 1200),
(4, 'Aman', '2026-03-10', 700),
(5, 'Ravi', '2026-03-18', 400);
SELECT * FROM orders;

select customer , order_date ,
                 year(order_date) as year,
                 month(order_date) as month
                 from orders;
				
select customer,order_date,
       date_format(order_date,'%m') as month,
       date_format(order_date,'%d') as day,
       date_format(order_date,'%y') as year
       from orders;
       
select order_date,
datediff('2026-01-25',order_date) as remain
from orders;

select order_date ,
	   date_add(order_date,interval 10 day) as 10days,
       date_sub(order_date,interval 10 day) as past10days
       from orders;
       
select customer,order_date,
       dayname(order_date) as day,
       monthname(order_date) as month
from orders;

select customer,
	   upper(customer) as up,
       lower(customer) as low,
       length(customer) as size,
       trim(customer) as remove_gaps,
       replace(customer,'a','b') as replacement
       from orders;

select customer,
	  concat(customer,'-',order_date) as order_info,
      substring(customer,1,3) as sub
from orders;

select * from orders
where amount is null;

SET SQL_SAFE_UPDATES = 0;

UPDATE orders
SET amount = NULL
WHERE order_id = 3;

select * from orders;

SELECT customer,
       COALESCE(amount, 0) AS amount
FROM orders;

select customer,amount,
       case 
       when amount>=1000 then 'high'
       when amount>=500 then 'medium'
       else 'low'
       end as order_category
from orders;

SELECT
    COUNT(CASE WHEN amount >= 1000 THEN 1 END) AS high_orders,
    COUNT(CASE WHEN amount < 1000 THEN 1 END) AS low_orders
FROM orders;
       
SELECT customer
FROM orders
WHERE amount >= 500

UNION ALL

SELECT customer
FROM orders
WHERE amount < 500;
       
       