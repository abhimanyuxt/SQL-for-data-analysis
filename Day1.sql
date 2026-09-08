CREATE DATABASE temp1;
USE temp1;
SELECT database();
CREATE TABLE student (
name VARCHAR(50),
roll_no INT,
age INT
);
SHOW TABLES;
DESCRIBE student ;
INSERT INTO Student (name,roll_no,age)
VALUES
('Abhimanyu',12,18),
('Adi',19,30),
('Adi',19,30),
('Avi',19,30);
SELECT * FROM student;
SELECT name,roll_no
FROM student;
SELECT name ,age+1 as new_age
FROM student;
SELECT * FROM student 
WHERE age>10;
SELECT * FROM student 
WHERE age<10;

SELECT name,age 
FROM student 
WHERE name ='Abhimanyu';
SELECT * FROM student 
WHERE age>10 AND age>30 ;
SELECT * FROM student 
WHERE age<10 OR age>30 ;
SELECT name,age
FROM student 
WHERE NOT name = 'adi';

SELECT * FROM student 
ORDER BY age DESC;
SELECT * FROM student 
ORDER BY name ASC;

SELECT DISTINCT age,name 
FROM student ;
SELECT DISTINCT * FROM student ;

SELECT * FROM student
LIMIT 4 ;
SELECT * FROM student
LIMIT 8 ;

SELECT * FROM student
WHERE age in (19,30);
SELECT * FROM student 
WHERE age in (18,30);

SELECT *
FROM student
WHERE age BETWEEN 18 AND 30;




