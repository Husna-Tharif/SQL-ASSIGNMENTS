create database Library;
use Library;
-- Create the Branch table
create table Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- Insert  values into the Branch table
insert into Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
values
    (1, 101, '123 Library Street, Cityville', '9945678980'),
    (2, 102, '456 Knowledge Avenue, Townsville', '9876532510'),
    (3, 103, '789 Bookworm Lane, Villagetown', '9661237890'),
    (4, 104, '321 Reading Road, Suburbia', '9716549870'),
    (5, 105, '654 Learning Drive, Metropolis', '9591234560'),
    (6, 106, '987 Wisdom Way, Booktown', '9543219870');
select * from Branch;

-- Create the Employee table
create table Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    foreign key (Branch_no) references Branch(Branch_no)
);

-- Insert sample values into the Employee table
insert into Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
values
    (1, 'Alice Johnson', 'Librarian', 45000.00, 2),
    (101, 'Bob Smith', 'Assistant Librarian', 35000.00, 2),
    (3, 'Carol Lee', 'Archivist', 40000.00, 2),
    (103, 'David Kim', 'Librarian', 46000.00, 2),
    (5, 'Eve Brown', 'Library Assistant', 30000.00, 2),
    (104, 'Frank White', 'Branch Manager', 55000.00, 2);
select * from Employee;
-- Create the Book table
create table Book (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3) CHECK (Status IN ('Yes', 'No')),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

-- Insert values into the Book table
insert into  Book (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
values
    ('978-3-16-148410-0', 'The Great Gatsby', 'Fiction', 10.99, 'Yes', 'F. Scott Fitzgerald', 'Scribner'),
    ('978-0-7432-7356-5', 'To Kill a Mockingbird', 'Fiction', 12.49, 'No', 'Harper Lee', 'J.B. Lippincott & Co.'),
    ('978-0-452-28423-4', '1984', 'Dystopian', 9.99, 'Yes', 'George Orwell', 'Secker & Warburg'),
    ('978-1-5011-7327-7', 'history', 'Biography', 35.99, 'Yes', 'Michelle Obama', 'Crown Publishing'),
    ('978-0-670-81302-8', 'The Catcher in the Rye', 'Fiction', 40.99, 'No', 'J.D. Salinger', 'Little, Brown and Company'),
    ('978-0-06-112008-4', 'Brave New World', 'Dystopian', 27.49, 'Yes', 'Aldous Huxley', 'Chatto & Windus');
select * from Book;
-- Create the Customer table
create table Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- Insert  values into the Customer table
insert into Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
values
    (1, 'John Doe', '123 Elm Street, Cityville', '2021-01-01'),
    (2, 'Jane Smith', '456 Oak Avenue, Townsville', '2019-02-15'),
    (3, 'Alice Brown', '789 Pine Road, Villagetown', '2024-08-10'),
    (4, 'Bob White', '321 Maple Lane, Suburbia', '2023-04-05'),
    (5, 'Emily Davis', '654 Cedar Drive, Metropolis', '2024-07-20'),
    (6, 'Michael Johnson', '987 Birch Way, Booktown', '2022-06-18');
select * from Customer;
-- Create the IssueStatus table
create table  IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    foreign key  (Issued_cust) references Customer(Customer_Id),
    foreign key (Isbn_book) references Book(ISBN)
);

-- Insert sample values into the IssueStatus table
insert into IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
values
    (1, 1, 'The Great Gatsby', '2024-07-01', '978-3-16-148410-0'),
    (2, 4, '1984', '2024-07-05', '978-0-452-28423-4'),
    (3, 3, 'Brave New World', '2023-06-10', '978-0-06-112008-4'),
    (4, 4, 'To Kill a Mockingbird', '2024-07-15', '978-0-7432-7356-5'),
    (5, 5, 'The Catcher in the Rye', '2024-07-20', '978-0-670-81302-8'),
    (6, 6, 'Becoming', '2024-07-25', '978-1-5011-7327-7');
select * from IssueStatus;
-- Create the ReturnStatus table
create table ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    foreign key (Isbn_book2) references Book(ISBN)
);

-- Insert values into the ReturnStatus table
insert into ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
values
    (1, 1, 'The Great Gatsby', '2024-07-10', '978-3-16-148410-0'),
    (2, 2, '1984', '2024-07-15', '978-0-452-28423-4'),
    (3, 3, 'Brave New World', '2024-07-20', '978-0-06-112008-4'),
    (4, 4, 'To Kill a Mockingbird', '2024-07-25', '978-0-7432-7356-5'),
    (5, 5, 'The Catcher in the Rye', '2024-07-30', '978-0-670-81302-8'),
    (6, 6, 'Becoming', '2024-08-01', '978-1-5011-7327-7');
select * from ReturnStatus;

#--1. Retrieve the book title, category, and rental price of all available books.
select Book_title, Category, Rental_Price from Book where Status = 'Yes';
#--2. List the employee names and their respective salaries in descending order of salary.
select Emp_name, Salary from Employee order by  Salary desc;
#--3. Retrieve the book titles and the corresponding customers who have issued those books. 
select IssueStatus.Issued_book_name as Book_Title, Customer.Customer_name as Customer_Name
from IssueStatus
join Customer on IssueStatus.Issued_cust = Customer.Customer_Id;
 #--4.Display the total count of books in each category.
 select Category, COUNT(*) as Total_Book from Book group by Category;
#-- Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
select Emp_name, Position from Employee where Salary > 50000;
#-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
select Customer.Customer_name from Customer left join IssueStatus 
on Customer.Customer_Id = IssueStatus.Issued_cust where
Customer.Reg_date < '2022-01-01'and IssueStatus.Issue_Id is null;
#--7. Display the branch numbers and the total count of employees in each branch.
select Branch_no, COUNT(*) as Total_Employee FROM Employee
GROUP BY Branch_no;
#-- 8. Display the names of customers who have issued books in the month of June 2023
select Customer.Customer_name from Customer join IssueStatus 
on Customer.Customer_Id = IssueStatus.Issued_cust
where IssueStatus.Issue_date between '2023-06-01' and '2023-06-30';
#-- 9. Retrieve book_title from book table containing history.
select Book_title from Book where Book_title like '%history%';
#--10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
select Branch_no, COUNT(*) as Total_Employees from Employee
group by Branch_no having COUNT(*) > 5;
#--11. Retrieve the names of employees who manage branches and their respective branch addresses.
select E.Emp_name as Manager_Name, B.Branch_address 
from Employee E join Branch B on E.Emp_Id = B.Manager_Id;
#--. 12. Display the names of customers who have issued books with a rental price higher than Rs. 25. 
select Customer.Customer_name from Customer
join IssueStatus on Customer.Customer_Id = IssueStatus.Issued_cust
join Book on IssueStatus.Isbn_book = Book.ISBN
where Book.Rental_Price > 25;

