create database khanapina;
use khanapina;
create table food (
name varchar(50),
place varchar(50),
price int,
rating int);
insert into food(name,place,price,rating)
values
('pasta','chd',200,5),
('pasta','knl',230,4),
('pizza','chd',400,3),
('pizza','knl',300,3.5),
('burger','knl',100,5),
('burger','chd',150,3),
('pasta','kuk',230,5),
('pizza','kuk',480,2);
select * from food;

select name , avg(rating) as rat ,place
from food 
group by name,place
order by rat desc;

alter table food 
modify rating decimal(2,1);

select * from food;

select name,place,rating ,
dense_rank() over ( partition by place  order by rating desc) as food_Rating
from food;

with ranked_food as (
select name,place,rating,
dense_rank() over (
                   partition by place order by rating desc ) 
                   as place_rating
                   from food )
select name , place , rating 
from ranked_food
where place_rating =1;

with price_food as (
                   select name,place,price,
                   dense_rank() over (
                                     partition by place order by price desc)
                                     as price_f
				   from food
                   )
select name,place,price 
from price_food
where price_f<=2;

select name,place,price,
lag(price) over (
			     partition by place order by price desc) as previous,
lead(price) over 
                 (partition by place order by price desc ) as next
                 from food;
                 
with food_compare as (
                      select name, place , price ,
                      lag(price) over (
                      partition by place order by price desc)
                      as previous_price 
                      from food
                      )
select name,place,price,previous_price,
price - previous_price AS price_change
FROM food_compare;

with food_rank as (
				 select name , place, price ,
                 dense_rank() over (
                 partition by place order by price desc ) as ranko ,
                 lag(price) over (
                 partition by place order by price desc ) as previous
                 from food
                 )
select name,place , price ,
previous as previous_price,
price - previous as price_change 
from food_rank 
where ranko=1;

                 




