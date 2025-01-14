create database country_person;
use country_person;
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
select * from persons;
#--Find thenumber of persons in each country
SELECT country_name, COUNT(*) AS TotalPersons
FROM persons
GROUP BY country_name;
#--Find the number of persons fron each country sorted fron high to low
SELECT country_name, COUNT(*) AS TotalPersonsDescending
FROM persons
GROUP BY country_name
ORDER BY TotalPersonsDescending DESC;
#--Find out an average rating for Persons in respective countries if the average is greater than 3.0
SELECT country_name, AVG(population_rating) AS AverageRating
FROM persons
GROUP BY country_name
HAVING AVG(population_rating) > 3.0;

#-- Find the countries with the same rating as the USA. (Use Subqueries)
SELECT country_name
FROM persons
GROUP BY country_name
HAVING AVG(population_rating) = (
    SELECT AVG(population_rating)
    FROM persons
    WHERE country_name = 'USA'
);
#--Select all countries whose population is greater than the average population of all nations.

SELECT country_name, population
FROM country
WHERE population > (
    SELECT AVG(population)
    FROM country
);


#--create database product
create database product;
use product;
CREATE TABLE Customer (
    Customer_Id INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);
INSERT INTO Customer (First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
('John', 'Doe', 'john.doe@gmail.com', '1234567890', '123 Main St', 'New York', 'NY', '10001', 'USA'),
('Jane', 'Smith', 'jane.smith@gmail.com', '9876543210', '456 Elm St', 'Los Angeles', 'LS', '90001', 'USA'),
('Michael', 'Brown', 'michael.brown@gmail.com', '5551234567', '789 Pine St', 'Toronto', 'TN', '60601', 'Canada'),
('Emily', 'Davis', 'emily.davis@gmail.com', '5559876543', '321 Maple St', 'Bradford', 'BD', '77001', 'UK'),
('Chris', 'Wilson', 'chris.wilson@gmail.com', '4445556666', '654 Cedar St', 'California', 'CA', '85001', 'USA'),
('Emma', 'Johnson', 'emma.johnson@gmail.com', '3334445555', '987 Oak St', 'Ottawa', 'TW', '92101', 'Canada'),
('Oliver', 'Martinez', 'oliver.martinez@gmail.com', '2223334444', '741 Birch St', 'Bristol', 'BL', '75201', 'UK'),
('Sophia', 'Garcia', 'sophia.garcia@gmail.com', '1112223333', '852 Walnut St', 'Carlisle', 'CL', '95101', 'UK'),
('Liam', 'Hernandez', 'liam.hernandez@gmail.com', '9998887777', '963 Chestnut St', 'Austin', 'AT', '73301', 'USA'),
('Isabella', 'Lopez', 'isabella.lopez@gmail.com', '7776665555', '159 Spruce St', 'Edmonton', 'ED', '33101', 'Canada');

CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name,Email FROM Customer;
SELECT * FROM customer_info;
#--Create a view named US_Customers that displays customers located in the US.
CREATE VIEW US_Customers AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name,Email,City
FROM  Customer WHERE Country = 'USA';
SELECT * FROM US_Customers;

#--Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state
CREATE VIEW Customer_details AS SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name,
Email,Phone_no,State FROM Customer;
SELECT * FROM Customer_details;
#-- Update phone numbers of customers who live in California for Customer_details view.
UPDATE Customer SET Phone_no = '8809877' WHERE  City = 'California' AND Customer_Id  > 0;
#--Count the number of customers in each state and show only states with more than 5 customers.
SELECT State, COUNT(*) AS Total_Customers FROM Customer GROUP BY State
HAVING COUNT(*) > 5;
#--Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view.
SELECT State, COUNT(*) AS Total_Customers FROM Customer_details GROUP BY State;
#-- Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.

SELECT * FROM Customer_details ORDER BY State ASC;

