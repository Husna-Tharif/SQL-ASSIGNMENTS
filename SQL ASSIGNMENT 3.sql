create database company;
use company;
-- Create Table manager
CREATE TABLE manager (
    manager_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    age INT CHECK (age > 0),
    last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    gender CHAR(1) CHECK (gender IN ('M', 'F', 'O')),
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Insert 10 Rows of Data
INSERT INTO manager (manager_id, first_name, last_name, dob, age, gender, department, salary)
VALUES
(1, 'John', 'Doe', '1980-04-15', 44, 'M', 'IT', 90000.00),
(2, 'Jane', 'Smith', '1975-08-22', 49, 'F', 'HR', 25000.00),
(3, 'Aaliya', 'khan', '1982-12-11', 42, 'F', 'Marketing', 92000.00),
(4, 'Robert', 'Brown', '1979-03-05', 45, 'M', 'Finance', 95000.00),
(5, 'Emily', 'Davis', '1985-01-19', 39, 'F', 'Sales', 87000.00),
(6, 'Michael', 'Wilson', '1990-02-25', 34, 'M', 'Operations', 30000.00),
(7, 'Linda', 'Taylor', '1972-06-30', 52, 'F', 'Legal', 100000.00),
(8, 'William', 'Anderson', '1987-07-20', 37, 'M', 'R&D', 98000.00),
(9, 'David', 'Thomas', '1995-11-10', 29, 'M', 'Customer Service', 78000.00),
(10, 'Sarah', 'Martinez', '1983-09-13', 41, 'F', 'Supply Chain', 18000.00);
select * from manager;
select first_name,last_name,dob from manager where manager_id=1;
select manager_id,first_name,salary * 12 As annual_income from manager;
select * from manager where first_name !='Aaliya';
select * from manager where department='IT' and salary > 25000;
select * from manager;
select * from manager where salary between 10000 and 35000;
