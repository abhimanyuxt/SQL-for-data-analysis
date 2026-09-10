create database f1;
use f1;
create table drivers(
name varchar(70),
team varchar(70),
age int,
natinality varchar(70),
racing_number int,
total_races int,
wins int,
dnf int
);
show tables;
describe drivers ;
insert into drivers (name,team,age,nationality,racing_number,total_races,wins,dnf)
values
insert INTO drivers(name, team, age, natinality, racing_number, total_races, wins, dnf)
VALUES
('Lando Norris', 'McLaren', 26, 'British', 1, 13, 2, 0),
('Oscar Piastri', 'McLaren', 25, 'Australian', 81, 13, 0, 0),

('George Russell', 'Mercedes', 28, 'British', 63, 13, 2, 2),
('Kimi Antonelli', 'Mercedes', 19, 'Italian', 12, 13, 7, 1),

('Charles Leclerc', 'Ferrari', 28, 'Monegasque', 16, 13, 1, 1),
('Lewis Hamilton', 'Ferrari', 41, 'British', 44, 13, 1, 0),

('Max Verstappen', 'Red Bull', 28, 'Dutch', 3, 13, 0, 1),
('Isack Hadjar', 'Red Bull', 21, 'French', 6, 11, 0, 0),

('Pierre Gasly', 'Alpine', 30, 'French', 10, 13, 0, 0),
('Franco Colapinto', 'Alpine', 23, 'Argentine', 43, 13, 0, 0),

('Fernando Alonso', 'Aston Martin', 45, 'Spanish', 14, 13, 0, 0),
('Lance Stroll', 'Aston Martin', 27, 'Canadian', 18, 13, 0, 0),

('Gabriel Bortoleto', 'Audi', 21, 'Brazilian', 5, 13, 0, 0),
('Nico Hulkenberg', 'Audi', 39, 'German', 27, 13, 0, 0),

('Sergio Perez', 'Cadillac', 36, 'Mexican', 11, 13, 0, 0),
('Valtteri Bottas', 'Cadillac', 36, 'Finnish', 77, 13, 0, 0),

('Esteban Ocon', 'Haas', 29, 'French', 31, 13, 0, 0),
('Oliver Bearman', 'Haas', 21, 'British', 87, 13, 0, 0),

('Carlos Sainz', 'Williams', 32, 'Spanish', 55, 13, 0, 0),
('Alexander Albon', 'Williams', 30, 'Thai', 23, 13, 0, 0),

('Liam Lawson', 'Racing Bulls', 24, 'New Zealander', 30, 13, 0, 0),
('Arvid Lindblad', 'Racing Bulls', 18, 'British', 41, 13, 0, 0);

select*from drivers; 
 
CREATE TABLE principals (
    team VARCHAR(70),
    team_principal VARCHAR(70)
);
INSERT INTO principals (team, team_principal)
VALUES
('McLaren', 'Andrea Stella'),
('Mercedes', 'Toto Wolff'),
('Ferrari', 'Fred Vasseur'),
('Red Bull', 'Laurent Mekies'),
('Aston Martin', 'Mike Krack'),
('Alpine', 'Flavio Briatore'),
('Williams', 'James Vowles'),
('Haas', 'Ayao Komatsu'),
('Racing Bulls', 'Alan Permane'),
('Audi', 'Jonathan Wheatley'),
('Cadillac', 'Graeme Lowdon');
select*from principals;

select drivers.team,drivers.name,principals.team_principal
from drivers
INNER JOIN principals
ON drivers.team = principals.team;
select drivers.name , principals.team_principal
from drivers 
inner join principals 
on drivers.team = principals.team;

select drivers.name, drivers.team,drivers.wins ,principals.team_principal
from drivers
right join principals
on drivers.team=principals.team;

SELECT drivers.name,drivers.team,principals.team_principal
FROM drivers
RIGHT JOIN principals
ON drivers.team = principals.team;

SELECT d.name, d.team, p.team_principal
FROM drivers AS d
INNER JOIN principals AS p
ON d.team = p.team;

SELECT d.team,p.team_principal,COUNT(d.name) AS driver_count
FROM drivers AS d
INNER JOIN principals AS p
    ON d.team = p.team
GROUP BY d.team, p.team_principal;

select d.team,sum(d.wins) as total_wins ,sum(d.dnf)as total_dnf,p.team,p.team_principal
from drivers as d
INNER JOIN principals AS p
on d.team =p.team
group by d.team,p.team_principal
order by total_wins desc;



