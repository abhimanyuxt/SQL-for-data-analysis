CREATE DATABASE indycar_analytics;
USE indycar_analytics;
CREATE TABLE race_sales (
    sale_id INT PRIMARY KEY,
    team VARCHAR(50),
    event_name VARCHAR(50),
    city VARCHAR(50),
    race_date DATE,
    product VARCHAR(50),
    quantity INT,
    amount INT
);
INSERT INTO race_sales
(sale_id, team, event_name, city, race_date, product, quantity, amount)
VALUES
(1, 'Penske', 'St Petersburg GP', 'St Petersburg', '2026-01-15', 'Race Package', 2, 12000),
(2, 'Ganassi', 'St Petersburg GP', 'St Petersburg', '2026-01-15', 'Race Package', 3, 15000),
(3, 'McLaren', 'St Petersburg GP', 'St Petersburg', '2026-01-15', 'VIP Package', 2, 18000),

(4, 'Penske', 'Long Beach GP', 'Long Beach', '2026-02-20', 'Race Package', 3, 12000),
(5, 'Ganassi', 'Long Beach GP', 'Long Beach', '2026-02-20', 'VIP Package', 2, 18000),
(6, 'McLaren', 'Long Beach GP', 'Long Beach', '2026-02-20', 'Race Package', 4, 15000),

(7, 'Penske', 'Indianapolis GP', 'Indianapolis', '2026-03-15', 'VIP Package', 2, 20000),
(8, 'Ganassi', 'Indianapolis GP', 'Indianapolis', '2026-03-15', 'Race Package', 5, 14000),
(9, 'McLaren', 'Indianapolis GP', 'Indianapolis', '2026-03-15', 'VIP Package', 3, 22000),

(10, 'Penske', 'Detroit GP', 'Detroit', '2026-04-18', 'Race Package', 4, 13000),
(11, 'Ganassi', 'Detroit GP', 'Detroit', '2026-04-18', 'VIP Package', 2, 19000),
(12, 'Andretti', 'Detroit GP', 'Detroit', '2026-04-18', 'Race Package', 3, 11000),

(13, 'Penske', 'Road America', 'Elkhart Lake', '2026-05-22', 'VIP Package', 3, 21000),
(14, 'Ganassi', 'Road America', 'Elkhart Lake', '2026-05-22', 'Race Package', 4, 15000),
(15, 'Andretti', 'Road America', 'Elkhart Lake', '2026-05-22', 'VIP Package', 2, 17000),

(16, 'Penske', 'Iowa Speedway', 'Newton', '2026-06-19', 'Race Package', 5, 12000),
(17, 'McLaren', 'Iowa Speedway', 'Newton', '2026-06-19', 'VIP Package', 3, 20000),
(18, 'Andretti', 'Iowa Speedway', 'Newton', '2026-06-19', 'Race Package', 4, 13000);

select * from race_sales;

select month(race_date) as month,sum(amount*quantity)
from race_sales
group by month(race_date)
order by month;

with monthly_revenue as (
select month(race_date) as month,sum(amount*quantity) as revenue 
from race_sales
group by month(race_date)
),
revenue_compare as(
select month , revenue ,
lag(revenue) over ( order by month ) as prev_month 

from monthly_revenue
),
revenue_perc as(

select month,revenue , prev_month ,
    revenue - prev_month AS mom_change
FROM revenue_compare
ORDER BY month
)
select month,revenue,prev_month ,mom_change,
(mom_change / NULLIF(prev_month, 0)) * 100 as mom_perc
from revenue_perc
order by month ;

