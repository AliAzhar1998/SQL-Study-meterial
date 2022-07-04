#Subqueries

use sql_intro;

select * from employees;

select emp_name,emp_id,salary from employees
where salary > (select avg(salary) from employees);


select emp_name,emp_id,salary from employees
where salary>(select salary from employees where emp_name='Sophia');

show databases;

use classicmodels;

select * from products;

select * from orderdetails;

select productcode, productname, msrp from products where productcode in 
(select productcode from orderdetails where priceeach < 100);

# stored proceedure

create database sql_iq;
show databases;
use sql_iq;
create table players(players_id int,name varchar(30),
country varchar(30),goals int);
select *  from players;
insert into players 
values(101,'Sam','USA',6),
(103,'Daniel','England',7),
(104,'Anthony','France',10),
(102,'Bruno','Sweden',6),
(105,'Alex','Wales',5),
(105,'Matt','Scotland',3);
select * from players;

delimiter &&
create procedure top_players()
begin
select name, country, goals
from players where goals>6;
End && 
delimiter ;

call top_players();

#SP using IN
USE sql_intro

delimiter //
create procedure sp_sortBySalary(IN var int)
begin
select name, age, Salary from employees
order by salary desc limit var;
end //
delimiter ;

call  sp_sortBySalary(3);

# Trigger in SQL
show databases;
use sql_joins;
create table student
(st_roll int, age int, name varchar(30), mark float);
select * from student;
delimiter //
create trigger mark_verify
before insert on student
for each row
if new.mark< 0 then set new.mark=50;
end if; //
delimiter ;
insert into student 
values(501,10,'Ruth',75.0),
(502,12,'Mike',-20.5),
(503,10,'Davis',90.0),
(504,10,'Jacobs',-12.5);
select * from student;

# to delete the trigger run the code giver down
#drop trigger mark_verify;

use classicmodels;
 select * from customers;
create view cust_details as select customerName, phone, city
from customers;
select * from cust_details;
select * from products;
create view product_description
as
select productName, quantityinstock,msrp,textdescription
from products as p inner join productlines as pl
on p.productline = pl.productline;

select * from product_description;

# Rename description 
rename table product_description
to vehicle_description;

#displlay views
show full tables
where table_type = 'VIEW';

# Delet a view 
drop view cust_details;
#check the view

#Windows function
use sql_intro;
select * from employees;
select emp_name, age, dept,
sum(salary) over (partition by dept) as total_salary
from employees;

# Row number
select row_number() over(order by salary) as row_num,
emp_name, salary from employees order by salary;

create table demo (si_id int, st_name varchar(20));

insert into demo
values (101,'Shane'),
(102,'Bradley'),
(103,'Marath'),
(103,'Marath'),
(104,'Kevin'),
(105,'Kevin');

select * from demo; 

select si_id, st_name, row_number()over
(partition by si_id,st_name order by si_id)
as row_num from demo;


#Rank function

create table demo1 (var_a int);
insert into demo1
values (101),(102),(103),(103),(104),(105),(106),(106),(107);
select * from demo1;
select var_a,
rank() over (order by var_a) as test_rank from demo1;

#first value()
select emp_name, age, salary, first_value(emp_name)
over (order by salary desc) as highest_salary from employees;

select emp_name,dept,salary,first_value (emp_name)
over(partition by dept order by salary desc) as highest_salary from employees;

