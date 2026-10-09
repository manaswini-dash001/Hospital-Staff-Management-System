DROP DATABASE IF EXISTS hospital_db;
CREATE DATABASE hospital_db;
USE hospital_db;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(50) DEFAULT 'Main Block'
);
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(100) NOT NULL,
    designation VARCHAR(50) DEFAULT 'Staff',
    salary DECIMAL(10,2) NOT NULL,
    dept_id INT NOT NULL,
    CHECK (salary > 0),
    FOREIGN KEY (dept_id) 
		REFERENCES Department(dept_id)
);

INSERT INTO Department (dept_id, dept_name, location)
VALUES
(1, 'Card', 'Block A'),
(2, 'Neur', 'Block B'),
(3, 'Ortho', 'Block C'),
(4, 'Emer', 'Block D');

INSERT INTO Staff (staff_id, staff_name, designation, salary, dept_id)
VALUES
(101, 'Anne', 'Doctor', 45000, 1),
(102, 'Rahul',  'Nurse', 28000, 2),
(103, 'Amit',  'Doctor', 50000, 1),
(104, 'Sneha',  'Nurse', 32000, 3),
(105, 'Arjun',  'Tech', 22000, 4),
(106, 'Priya', 'Doctor', 60000, 2);

SELECT * FROM Department;
SELECT * FROM Staff;
SELECT * FROM Staff
WHERE salary BETWEEN 25000 AND 50000;

SELECT * FROM Staff
WHERE staff_name LIKE 'A%';

SELECT * FROM Staff
WHERE dept_id IN (1, 2);

SELECT DISTINCT designation
FROM Staff;


SELECT d.dept_name, COUNT(*) AS total_staff
FROM Department d
JOIN Staff s 
ON d.dept_id = s.dept_id
GROUP BY d.dept_id, d.dept_name;

SELECT MAX(salary) AS highest_salary,MIN(salary) AS lowest_salary
FROM Staff;

UPDATE Staff
SET salary = 48000
WHERE staff_id = 101;

SELECT * FROM Staff;


SELECT staff_id AS ID, staff_name AS Employee_Name,
designation AS Job_Title,
salary AS Monthly_Salary,
dept_id AS Department_ID
FROM Staff;


select * from staff 
where salary >= 50000;

UPDATE staff
SET salary = salary + salary*0.10
where dept_id = 2;

select * FROM staff


