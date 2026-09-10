create database day3;
use day3;
create table data(
name varchar(50),
branch varchar(50),
n_id int,
age int
);
SHOW TABLES;
DESCRIBE data;

insert into data (name,branch,n_id,age)
values
('George','AMG',1,29),
('Max','RBR',2,28),
('Kimi','AMG',3,20),
('Lewis','SF',4,44),
('Fernando','AMR',5,45),
('Franco','ALP',6,29);
select * from data;

select branch , avg(age) as avg_age 
from data
group by branch;
select age , avg(n_id)
from data 
group by age;

select branch,count(*) as total_drivers
from data
group by branch;

select branch , sum(age) as total_age
from data 
group by branch;

select branch,
count(*) as total_drivers,
sum(age) as total_age,
avg(age) as avg_age
from data
group by branch;

select branch , avg(age) as avg_age
from data 
group by branch 
having avg(age)>22;



