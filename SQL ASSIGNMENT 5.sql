create database country1;
use country1;
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
    population int,
    population_rating INT,
    country_id INT,
    country_name VARCHAR(100),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

-- Inserting 10 rows of data into the persons table
INSERT INTO persons (id, fname, lname,population, population_rating, country_id, country_name) VALUES
(1, 'John', 'Doe',305675, 5, 1, 'United States'),
(2, 'Amit', 'Sharma',10987654, 8, 2, 'India'),
(3, 'Li', 'Wang',25678, 9, 3, 'China'),
(4, 'Carlos', 'Mendoza',1345698, 6, 4, 'Brazil'),
(5, 'Emily', 'Brown',45987, 7, 5, 'Canada'),
(6, 'Ivan', 'Petrov',9844563, 4, 6, 'Russia'),
(7, 'Olivia', 'Johnson',35896, 9, 7, 'Australia'),
(8, 'Sophia', 'Schmidt',789543, 8, 8, 'Germany'),
(9, 'Lucas', 'Dupont',543765, 6, 9, 'France'),
(10, 'James', 'Taylor',37987, 7, 10, 'United Kingdom');
SELECT substring(country_name, 1, 3) AS FirstThreeCharacters
FROM country;
SELECT CONCAT(fname, ' ', lname) AS FullName
FROM persons;
SELECT COUNT(DISTINCT country_name) AS UniqueCountryCount
FROM persons;
SELECT MAX(Population) AS MaxPopulation
FROM country;
INSERT INTO persons(id, fname, lname, population_rating, country_id, country_name)
VALUES (11,'gerk', NULL,6,9,'USA'),
(12,'elina', NULL,8,10,'Canada');
SELECT COUNT(lname) AS LNameCount FROM persons;
SELECT COUNT(*) AS TotalRows FROM persons;
SELECT population FROM country LIMIT 3;
SELECT * FROM country ORDER BY RAND() LIMIT 3;
SELECT country_name, SUM(population) AS TotalPopulation
FROM persons GROUP BY country_name;
select country_name, sum(population) from persons group by country_name having sum(population)>50000;
SELECT country_name, COUNT(*) AS TotalPersons, AVG(population_rating) AS AverageRating
FROM persons GROUP BY country_name HAVING COUNT(*) > 2
ORDER BY AverageRating ASC;








