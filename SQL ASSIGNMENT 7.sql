create database countryinfo;
use countryinfo;
CREATE TABLE country (
    id INT PRIMARY KEY,
    country_name VARCHAR(100),
    population INT,
    area FLOAT
);

-- Inserting 10 rows of data into the country table
INSERT INTO country (id, country_name, population, area) VALUES
(1, 'United States', 331002651, 9833517),
(2, 'India', 1380004385, 3287263),
(3, 'China', 1393780000, 9596961),
(4, 'Brazil', 212559417, 8515767),
(5, 'Canada', 37742154, 9984670),
(6, 'Russia', 145934462, 17098242),
(7, 'Australia', 25499884, 7692024),
(8, 'Germany', 83783942, 357022),
(9, 'France', 67022000, 551695),
(10, 'United Kingdom', 67886011, 243610);

CREATE TABLE persons (
    id INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    population_rating decimal(5,2),
    country_id INT,
    country_name VARCHAR(100),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

-- Inserting 10 rows of data into the persons table
INSERT INTO persons (id, fname, lname, population_rating, country_id, country_name) VALUES
(1, 'John', 'Doe', 3.34, 1, 'United States'),
(2, 'Amit', 'Sharma', 2.78, 2, 'India'),
(3, 'Li', 'Wang', 4.44, 3, 'China'),
(4, 'Carlos', 'Mendoza', 3.68, 4, 'Brazil'),
(5, 'Emily', 'Brown', 3.23, 5, 'Canada'),
(6, 'Ivan', 'Petrov', 2.98, 6, 'Russia'),
(7, 'Olivia', 'Johnson', 4.56, 7, 'Australia'),
(8, 'Sophia', 'Schmidt', 3.33, 8, 'Germany'),
(9, 'Lucas', 'Dupont', 4.13, 9, 'France'),
(10, 'James', 'Taylor', 3.22, 10, 'United Kingdom');
#--Add new coloumn named DOB in prsons table with data type as date
ALTER TABLE persons ADD dob DATE;
desc persons;
#-- update person table
UPDATE persons
SET dob = '1990-06-15'
WHERE id = 1;

UPDATE persons
SET dob = '1994-05-13'
WHERE id = 2;

UPDATE persons
SET dob = '1992-08-25'
WHERE id = 3;

UPDATE persons
SET dob = '1992-02-05'
WHERE id = 4;

UPDATE persons
SET dob = '1997-03-13'
WHERE id = 5;

UPDATE persons
SET dob = '1993-09-24'
WHERE id = 6;

UPDATE persons
SET dob = '1996-11-18'
WHERE id = 7;

UPDATE persons
SET dob = '1994-05-30'
WHERE id = 8;

UPDATE persons
SET dob = '1990-12-22'
WHERE id = 9;

UPDATE persons
SET dob = '1999-02-12'
WHERE id = 10;
select * from persons;

#-- user defined function to calculate age using dob

DELIMITER //

create function calculateage(dob DATE)
returns int
deterministic
Begin
    Declare age INT;
    SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    Return age;
END;//
DELIMITER ;
#--fetch the age of persons using the function 
select id,fname,calculateage(dob) as age from persons;

#--Find length of counry name in country table
select country_name,length(country_name) as length_of_countryname from country;

#--Extract first three characters of country name in country table
select country_name, substring(country_name,1,3) as first_three_chars from country;
#--Convert all country names into uppercase and lowercase in the country table
select country_name,upper(country_name) as uppercase,lower(country_name) as lowercase from country;


