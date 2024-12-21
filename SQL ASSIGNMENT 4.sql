create database CountryDetails;
use CountryDetails;
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
    population_rating INT,
    country_id INT,
    country_name VARCHAR(100),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

-- Inserting 10 rows of data into the persons table
INSERT INTO persons (id, fname, lname, population_rating, country_id, country_name) VALUES
(1, 'John', 'Doe', 5, 1, 'United States'),
(2, 'Amit', 'Sharma', 8, 2, 'India'),
(3, 'Li', 'Wang', 9, 3, 'China'),
(4, 'Carlos', 'Mendoza', 6, 4, 'Brazil'),
(5, 'Emily', 'Brown', 7, 5, 'Canada'),
(6, 'Ivan', 'Petrov', 4, 6, 'Russia'),
(7, 'Olivia', 'Johnson', 9, 7, 'Australia'),
(8, 'Sophia', 'Schmidt', 8, 8, 'Germany'),
(9, 'Lucas', 'Dupont', 6, 9, 'NULL'),
(10, 'James', 'Taylor', 7, 10, 'United Kingdom');

select distinct country_name from persons;
select fname as First_Name,lname as Last_Name from persons;
select fname from persons where population_rating > 4.0;
select country_name from country where population > 1000000;
select * from persons where country_name = 'USA' or population_rating > 4.5;
select * from persons where country_name is null;
select * from persons;
select * from persons where country_name in ('USA','canada','United Kinddom');
select * from persons where country_name not in ('India');
select * from country where population between 500000 and 2000000;
select * from country where country_name not like 'C%';

