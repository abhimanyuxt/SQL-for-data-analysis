CREATE DATABASE new;
USE new;
CREATE TABLE employee(
name VARCHAR(50),
age INT,
employee_id int
);
SHOW TABLES;
DESCRIBE employee ;
INSERT INTO employee( name , age , employee_id)
VALUES
('Anshika',20,10021),
('Abhimanyu',20,10022),
('Biscuit',22,10022),
('Anshika',20,10021);
SELECT * FROM employee;

SELECT * FROM employee
ORDER BY name ASC ;

SELECT COUNT(*)
FROM employee ;
SELECT COUNT(*) AS total_employee
FROM employee;

SELECT SUM(age)
FROM employee;

SELECT AVG(age) AS avg_age
FROM employee;

SELECT MAX(age) AS max_age
FROM employee;

SELECT  DISTINCT name,age,employee_id
FROM employee;

