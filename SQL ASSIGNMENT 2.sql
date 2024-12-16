create  database sales;
use sales;
create table Orders (
Order_id int auto_increment primary key,
Cust_Name varchar(50) not null,
Prod_Category varchar(50),
Ordered_Item varchar(50),
Contact_No varchar(50) unique
);
desc Orders;
alter table Orders add Order_Quantity int;
rename table Orders to Sales_Orders;
insert into Sales_Orders(Order_id,Cust_Name,Prod_Category,
Ordered_Item,Contact_No,Order_Quantity) values(01,'binu','electronics',
'Fridge',9874562341,1),(02,'fiona','jwellery','Nacklace',7854290643,
2),(03,'menaka','kitchen appliances','oven',97561123409,1),
(04,'Tom','Furniture','table',9756234400,3),(05,'Jane','Electronics',
'Mobile Phone',8089765789,2),(06,'Nikil','Electronics','Laptop',
9079865309,1),(07,'Mahesh','Furniture','Sofa',70895563861,1),
(08,'Divya','Jwellery','Bracellet',9687009234,1),(09,'Ady',
'Kitchen Appliances','Mixy',8905567334,2),(10,'kevin','Electronics',
'Laptop',9256880156,4);
select * from Sales_Orders;
select Cust_Name,Ordered_Item from Sales_Orders;
update Sales_Orders set Ordered_Item='Grinder' where Order_id=09;
select * from Sales_Orders;
drop table Sales_Orders;

 









