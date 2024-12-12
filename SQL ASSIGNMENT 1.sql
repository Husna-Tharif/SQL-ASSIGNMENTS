#1. creating database
create database School;
use School;
create table Student(
Roll_No int auto_increment,
Stud_Name varchar(50) not null,
Stud_Marks int not null,
Stud_Grade char(1) not null
);
desc Student;
insert into Student values (101,'jane',459,'A'),
(102,'kevin',215,'C'),(103,'miny',425,'A'),
(104,'pritam',355,'B'),(105,'jack',395,'B');
select * from Student;
alter table Student add Stud_Contact int not null;
desc Student;
alter table Student drop column Stud_Grade;
desc Student;
Rename table Student to CLASSTEN;
truncate table CLASSTEN;
desc CLASSTEN;
drop table CLASSTEN;








