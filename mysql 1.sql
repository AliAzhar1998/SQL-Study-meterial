show databases;
use mysql;
create database sql_intro1;
show databases;
create table emp_details(Name varchar(25), Age int, Sex char(1), DOJ date, City varchar(15), Salary int);
describe emp_details;

insert into emp_details
values("Jimmy",35,"M","2005-05-30","Chicago",70000),
("Shane",30,"M","1999-06-25","Seattle",55000),
("Marry",28,"F","2009-03-10","Boston",62000),
("Dwayne",37,"M","2011-07-12","Austin",57000),
("Sara",32,"F","2017-10-27","New York",72000),
("Ammy",35,"F","2014-12-20","Seattle",80000);
select * from emp_details;
select distinct city from emp_details;
select count(name) from emp_details;
select count(name) as count_name from  emp_details;
select sum(salary) from emp_details;
select avg(salary) from emp_details;
select name, age, city from emp_details;
select * from emp_details where age>30;
select name, age, city from emp_details where sex = 'F';
select * from emp_details where city in('Chicago', 'Austin');
select * from emp_details where doj between '2000-01-01'and '2010-01-01';

select * from emp_details where
age>30 and sex = 'M';

select sex, sum(Salary) as total_salary from emp_details
group by sex;

select * from emp_details order by Salary;
select * from emp_details order by Salary desc;
select (10+20) as addition;

select length('India') as total_leagth;
select repeat('@',10);

select upper('india');
select lower('INDIA');
select length('india') as total_length;
select curdate();
select day(curdate());
select now();

#String FUNCTIONS


select upper('India') as upper_case;
select lower('India') as upper_case;
select lcase('INDIA')as upper_case;
select character_length('India') as total_leagth;
select name,character_length(name) as leagth_name
from emp_details;
select concat("India"," is"," in"," asia");
select name, sex, concat(DOJ," ",name) as name_DOJ from emp_details;
select reverse('India');
select reverse(name) as r_name from emp_details;
select replace('Orange is a vegetable','vegetable','fruit') as correct;
select length('____India______');
select length(ltrim('____India______'));
select length(ltrim("_____India_______"));
select length(rtrim("_____India_______"));
select position("fruit" in "Orange is a fruit") as name;
select ascii('a');
select ascii(4);
