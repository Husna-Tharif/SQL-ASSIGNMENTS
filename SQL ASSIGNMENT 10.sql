create database Teacher;
use Teacher;
-- Create the table named teachers
CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10, 2)
);

-- Insert 8 rows into the teachers table
INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(1, 'Alice Johnson', 'Mathematics', 10, 55000.00),
(2, 'Bob Smith', 'Physics', 8, 50000.00),
(3, 'Carol Lee', 'Chemistry', 5, 47000.00),
(4, 'David Brown', 'Biology', 12, 60000.00),
(5, 'Eve Davis', 'English', 7, 52000.00),
(6, 'Frank Moore', 'History', 15, 65000.00),
(7, 'Grace Wilson', 'Geography', 3, 45000.00),
(8, 'Henry Thomas', 'Computer Science', 6, 48000.00);
select * from teachers;

#--Before insert trigger
DELIMITER $$
CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'salary cannot be negative';
    END IF;
END$$
DELIMITER ;

-- insert a row with a negative salary
INSERT INTO teachers (id, name, subject, experience, salary)
VALUES (10, 'Arun', 'Music', 2, -30000.00);
select * from teachers;
#--after insert trigger
CREATE TABLE teacher_log (
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME
);
select * from teacher_log;
DELIMITER $$

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'insert', NOW());
END$$

DELIMITER ;

-- Insert a new row into the teachers table
INSERT INTO teachers (id, name, subject, experience, salary)
VALUES (11, 'Sophia', 'science', 7, 49000.00);
select * from teachers;
SELECT * FROM teacher_log;

DELIMITER $$
#--before delete trigger
CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete teachers with experience greater than 10 years';
    END IF;
END$$

DELIMITER ;

#-- delete a row with experience > 10
DELETE FROM teachers WHERE id = 4; 
#--after delete trigger
DELIMITER $$
CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END$$

DELIMITER ;
DELETE FROM teachers WHERE id = 3;
SELECT * FROM teacher_log;

