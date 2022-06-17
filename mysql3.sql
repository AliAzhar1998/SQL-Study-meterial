create database sql_joins;
show databases;
use sql_joins;
create table cricket (cricket_id int auto_increment, name varchar(30),
primary key(cricket_id));

create table football (football_id int auto_increment, name varchar(30),
primary key(football_id));

insert into cricket (name)
values('Stuart'),('Michael'),('Johnson'),('Hayden'),('Fleming');

select * from cricket;

insert into football (name)
values('Stuart'),('Johnson'),('Hayden'),('Langer'),('Astle');

select * from football;

delete from football where name= 'Stuart''Johnson''Hayden''Langer''Astle';
select * from football;
drop table football;
select * from football;

create table football (football_id int auto_increment, name varchar(30),
primary key(football_id));
insert into football (name)
values('Stuart'),('Johnson'),('Hayden'),('Langer'),('Astle');
select * from football; 

select* from cricket as c inner join
football as f on c.name=f.name;
 select c.cricket_id, c.name, f.football_id,f.name
 from cricket as c inner join football as f on c.name=f.name;

show databases;
use classicmodels;


show tables;

select * from cricket;






























































