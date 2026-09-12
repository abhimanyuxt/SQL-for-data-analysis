create database cars;
use cars;
create table car(
name varchar(50),
model varchar(50),
cost int);
show tables;
insert into car(name,model,cost)
values
('Aston Martin','DB6',100000),
('Ford','R5',20000),
('Land Rover','Defender',300000),
('Ferrari','f40',700000);
select * from car;
select name,cost
from car
where cost = (
select max(cost)
from car);

select name,model ,cost 
from car 
where model in (
select model 
from car 
group by model
having sum(cost)>20000
);

select *
from (
select name,min(cost)
from car
group by name
order by name asc
)
as x;

INSERT INTO car(name, model, cost)
VALUES
('Aston Martin', 'DB11', 150000),
('Ford', 'Mustang', 50000),
('Land Rover', 'Range Rover', 250000),
('Ferrari', 'Roma', 300000);
select * from car;

SELECT c1.name, c1.model, c1.cost
FROM car AS c1
WHERE c1.cost > (
    SELECT AVG(c2.cost)
    FROM car AS c2
    WHERE c2.name = c1.name
);