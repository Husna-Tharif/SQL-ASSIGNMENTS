create database Worker_Details;
use Worker_Details;
#-- Create table worker
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate DATETIME,
    Department CHAR(25)
);
INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES 
(1, 'Alice', 'Smith', 60000, '2024-01-15 09:00:00', 'Finance'),
(2, 'Bob', 'Johnson', 50000, '2024-02-20 10:30:00', 'HR'),
(3, 'Charlie', 'Brown', 55000, '2024-03-12 08:45:00', 'IT'),
(4, 'Diana', 'Taylor', 70000, '2024-04-18 11:00:00', 'Marketing'),
(5, 'Edward', 'Anderson', 48000, '2024-05-05 09:15:00', 'Operations'),
(6, 'Fiona', 'Wilson', 53000, '2024-06-20 14:00:00', 'Legal'),
(7, 'George', 'Harris', 62000, '2024-07-01 10:00:00', 'Finance'),
(8, 'Hannah', 'Clark', 47000, '2024-08-15 13:30:00', 'HR'),
(9, 'Ian', 'Martinez', 51000, '2024-09-22 12:45:00', 'IT'),
(10, 'Julia', 'White', 68000, '2024-10-10 16:00:00', 'Marketing');
select * from Worker;
#--Create a stored procedure that takes in IN parameters for all the columns in the Worker table 
DELIMITER $$

CREATE PROCEDURE AddWorker (
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END $$

DELIMITER ;
CALL AddWorker(11, 'Mary', 'James', 54000, '2024-01-20 10:00:00', 'HR');

DELIMITER $$
#--create procedure to get salary
CREATE PROCEDURE GetWorkerSalary(IN p_worker_id INT,OUT p_salary INT)
BEGIN
    SELECT Salary INTO p_salary FROM Worker
    WHERE Worker_Id = p_worker_id;
END $$

CALL GetWorkerSalary(5,@p_salary);
select @p_salary as worker1_Salary;

DELIMITER $$
#--create procedue to update department
CREATE PROCEDURE UpdateWorkerDepartment(IN p_worker_id INT,IN p_department CHAR(25))
BEGIN
    UPDATE Worker
    SET Department = p_department
    WHERE Worker_Id = p_worker_id;
END $$
DELIMITER ;
CALL UpdateWorkerDepartment(9, 'Finance');
select * from Worker;
#--create prcedure to get  department worker count
DELIMITER $$

CREATE PROCEDURE GetDepartmentWorkerCount(IN p_department CHAR(25),OUT p_workerCount INT)
BEGIN
    SELECT COUNT(*) 
    INTO p_workerCount
    FROM Worker
    WHERE Department = p_department;
END $$

DELIMITER ;
call GetDepartmentWorkerCount('IT',@p_workerCount);
select @p_workerCount;

DELIMITER $$
#--create procedure to get average salary
CREATE PROCEDURE GetDepartmentAvgSalary(IN p_department CHAR(25),OUT p_avgSalary DECIMAL(10,2))
BEGIN
    SELECT AVG(Salary)
    INTO p_avgSalary
    FROM Worker
    WHERE Department = p_department;
END $$
DELIMITER ;
CALL GetDepartmentAvgSalary('IT',@p_avgSalary);
SELECT @p_avgSalary AS Average_Department_Salary;
