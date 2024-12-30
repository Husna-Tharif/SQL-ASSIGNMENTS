create database country2;
use country2;
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

select country.country_name,country.population,country.area,persons.population_rating,persons.country_id 
from country inner join persons on country.id=persons.country_id;

select country.country_name,country.population,country.area,persons.population_rating,persons.country_id 
from persons left join country on country.id=persons.country_id;

select country.id,country.country_name,country.area,persons.population_rating 
from country right join persons on country.id=persons.country_id;
select country_name from country union select country_name from persons;
select country_name from country union all select country_name from persons;
alter table persons add rounded_rating int;
update persons set rounded_rating=round(population_rating) where id<>0;
select population_rating,rounded_rating from persons;
