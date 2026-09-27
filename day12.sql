CREATE DATABASE indycar;
USE indycar;
CREATE TABLE drivers (
    driver_id INT PRIMARY KEY,
    driver_name VARCHAR(50),
    team VARCHAR(50),
    nationality VARCHAR(30),
    age INT,
    wins INT,
    podiums INT,
    points INT
);
INSERT INTO drivers
(driver_id, driver_name, team, nationality, age, wins, podiums, points)
VALUES
(1, 'Alex Palou', 'Chip Ganassi Racing', 'Spain', 29, 6, 11, 620),
(2, 'Pato O Ward', 'Arrow McLaren', 'Mexico', 27, 3, 8, 510),
(3, 'Josef Newgarden', 'Team Penske', 'USA', 35, 4, 7, 495),
(4, 'Scott Dixon', 'Chip Ganassi Racing', 'New Zealand', 46, 2, 6, 470),
(5, 'Colton Herta', 'Andretti Global', 'USA', 25, 2, 5, 430),
(6, 'Kyle Kirkwood', 'Andretti Global', 'USA', 27, 1, 4, 390),
(7, 'Will Power', 'Team Penske', 'Australia', 45, 1, 4, 375),
(8, 'Scott McLaughlin', 'Team Penske', 'New Zealand', 33, 2, 5, 410),
(9, 'Felix Rosenqvist', 'Meyer Shank Racing', 'Sweden', 34, 1, 3, 330),
(10, 'Marcus Armstrong', 'Meyer Shank Racing', 'New Zealand', 26, 0, 2, 275),
(11, 'Rinus VeeKay', 'Juncos Hollinger Racing', 'Netherlands', 25, 0, 1, 220),
(12, 'Graham Rahal', 'Rahal Letterman Lanigan', 'USA', 37, 0, 2, 250),
(13, 'Christian Lundgaard', 'Arrow McLaren', 'Denmark', 24, 1, 3, 315),
(14, 'Alexander Rossi', 'Ed Carpenter Racing', 'USA', 34, 0, 1, 240),
(15, 'Santino Ferrucci', 'A.J. Foyt Racing', 'USA', 28, 0, 1, 205);

select*from drivers;
CREATE TABLE teams (
    team VARCHAR(50) PRIMARY KEY,
    team_principal VARCHAR(50),
    country VARCHAR(30)
);
INSERT INTO teams
(team, team_principal, country)
VALUES
('Chip Ganassi Racing', 'Mike Hull', 'USA'),
('Arrow McLaren', 'Tony Kanaan', 'USA'),
('Team Penske', 'Jonathan Diuguid', 'USA'),
('Andretti Global', 'Dan Towriss', 'USA'),
('Meyer Shank Racing', 'Mike Shank', 'USA'),
('Juncos Hollinger Racing', 'Ricardo Juncos', 'USA'),
('Rahal Letterman Lanigan', 'Bobby Rahal', 'USA'),
('Ed Carpenter Racing', 'Ed Carpenter', 'USA'),
('A.J. Foyt Racing', 'Larry Foyt', 'USA');

select * from teams;

select driver_name,team
from drivers as d
where exists(
select 1
from teams as t
where d.team=t.team
);
select team_principal,team
from teams as t
where exists (
select 1 
from drivers as d
where t.team = d.team and t.team_principal = 'Tony Kanaan'
);
select team_principal,team
from teams as t
where exists (
select 1
from drivers as d
where t.team=d.team and t.team_principal ='Mike Hull'
);

SELECT t.team
FROM teams AS t
WHERE NOT EXISTS (
    SELECT 1
    FROM drivers AS d
    WHERE d.team = t.team
);

select d1.driver_name as driver_1,
       d2.driver_name as driver_2,
       d1.team
from drivers as d1
join drivers as d2 
on d1.team=d2.team
AND d1.driver_id < d2.driver_id;

CREATE TABLE races (
    race_id INT PRIMARY KEY,
    race_name VARCHAR(50),
    driver_id INT,
    position INT,
    points_earned INT
);
INSERT INTO races
(race_id, race_name, driver_id, position, points_earned)
VALUES
(1, 'St Petersburg', 1, 1, 50),
(2, 'St Petersburg', 2, 4, 32),
(3, 'St Petersburg', 3, 2, 42),
(4, 'Long Beach', 1, 2, 42),
(5, 'Long Beach', 2, 5, 30),
(6, 'Long Beach', 3, 1, 50),
(7, 'Indianapolis', 1, 3, 35),
(8, 'Indianapolis', 3, 4, 32);

select * from races;

select d.driver_name,t.team_principal,r.race_name,r.position
from drivers as d 
join teams as t 
on d.team=t.team
join races as r
on d.driver_id = r.driver_id;

select*from drivers 
where points > any (
select points 
from drivers 
where team = 'Chip Ganassi Racing'
);

SELECT driver_name, points
FROM drivers
WHERE points > (
    SELECT AVG(points)
    FROM drivers
);
       