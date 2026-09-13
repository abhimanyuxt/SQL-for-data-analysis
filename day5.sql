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

select name, price
from food 
where price <(
select avg(price)
from food
);

select name, total_time_to_create
from food
where  total_time_to_create > 30;
SELECT name,
       price,
       (SELECT AVG(price)
        FROM food) AS avg_price
FROM food;

select avg_price
from (
      select avg(price) as avg_price
      from food)
      as alias ;

SELECT c1.name, c1.region, c1.price
FROM food AS c1
WHERE c1.price > (
    SELECT AVG(c2.price)
    FROM food AS c2
    WHERE c2.region = c1.region
);

with avg_food as (
   select avg(price) as avg_price
   from food 
   )
   select name , price
   from food
   where price>(SELECT avg_price FROM avg_food);
   
with expensive_food as(
    select name, price
    from food
    where price > 2500
)
select *
from expensive_food;
with avg_region as (
    select region,avg(price) as avg_price
    from food 
    group by region
    )
select *
 from avg_region
 where avg_price>500;
 
with region_avg as(
     select region,avg(price) as avg_price
     from food 
     group by region 
     )
select f.name, f.region, f.price, r.avg_price
from food as f
join region_avg as r
    on f.region = r.region;
    
with region_avg as (
select region,avg(price) avg_price
from food
group by region 
),
 region_time as(
 select region,avg(total_time_to_create) as avg_time
 from food 
 group by region 
 )
 select *
 from region_time
 join region_avg
  on region_time.region=region_avg.region;
 
