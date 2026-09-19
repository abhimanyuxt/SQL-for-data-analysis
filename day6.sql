create database food;
use food;
create table food (
name varchar(50),
region varchar(50),
price int,
total_time_to_create int
);
INSERT INTO food(name, region, price, total_time_to_create)
VALUES
('lasagna', 'italy', 3500, 60),
('risotto', 'italy', 2800, 45),
('tacos', 'mexico', 1800, 25),
('burrito', 'mexico', 2200, 30),
('ramen', 'japan', 2500, 35),
('sushi', 'japan', 4000, 50),
('curry', 'india', 1800, 40),
('biryani', 'india', 2500, 60),
('croissant', 'france', 1200, 20),
('steak', 'france', 4500, 45);
select * from food;

SELECT name, region, price,
       AVG(price) OVER (PARTITION BY region) AS region_avg
FROM food;

select name,region,price,
ROW_NUMBER ()over ( order by price desc ) as row_num
from food;

select name , region , price ,
row_number () over ( partition by region order by price desc) as ranks_region
from food;

SELECT name, region, price,
       rank() over (
           partition by  region
           order by  price desc
       ) as price_rank
from food;

select name,region,price,
dense_rank() over ( order by price desc) as price_rank
from food;

select name,region,price,
lag(price) over (order by price) as previous_price
from food ;

select name,region,price,
lead(price) over (order by price) as new
from food;

select name,price,
sum(price) over ( order by price desc  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW )
as running_total 
from food;

select name , price ,
avg(price) over (order by price rows between 2  preceding and current row)
as moving_avg
from food;

select name , price , region,
dense_rank() over( partition by region order by price desc) as price_
from food;