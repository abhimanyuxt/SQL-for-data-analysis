CREATE DATABASE scuderiaferrari;
USE scuderiaferrari;
CREATE TABLE drivers(
name VARCHAR(50),
age INT,
wins INT,
dnf INT,
salary int
);
SHOW TABLES;
DESCRIBE drivers;
INSERT INTO drivers(name,age,wins,dnf,salary)
VALUES
('Micheal',30,101,19,345000),
('Vettel',25,40,8,389000),
('Alonso',29,21,18,445000),
('Massa',32,10,13,45000),
('Charles',21,9,16,545000),
('Carlos',30,4,11,445000);
SELECT * FROM drivers;
SELECT * FROM drivers 
WHERE wins>10;
SELECT * FROM drivers 
WHERE dnf<15 AND wins>5;

Select * from drivers 
order by dnf asc;
Select * from drivers 
order by wins asc;

Select * from drivers 
limit 2;

select * from drivers 
where wins in (10,30);
select * from drivers
where dnf in (5,17,16);

select * from drivers 
where salary between 0 and 5000000;

select *
from drivers 
where name like 'A%';
select *
from drivers 
where name like '%l';

select Sum(salary) 
from drivers;
select sum(wins) as total_wins
from drivers;

select avg(dnf) as avg_dnfs
from drivers;
select avg(salary) as avg_salary
from drivers;

select max(wins) 
from drivers;

select name,wins
from drivers 
order by wins desc 
limit 1;

select name,dnf as destructors_championship
from drivers 
order by dnf desc ;

select
sum(wins) as total_wins ,
sum(dnf) as total_dnfs
from drivers;

