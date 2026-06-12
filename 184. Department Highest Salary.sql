-- Active: 1774469870130@@127.0.0.1@3306@177. Nth Highest Salary
create database `184. Department Highest Salary`;
use `184. Department Highest Salary`;

create table Employee(
id int,
name varchar(50),
salary int,
departmentId int
);

create table Department
(id int,
name varchar(50)
);

insert into Employee values
(1, 'Joe', 70000, 1),
(2, 'Jim', 90000, 1),
(3, 'Henry', 80000, 2),
(4, 'Sam', 60000, 2),
(5, 'Max', 90000, 1);

insert into Department values
( 1  , 'IT'),
( 2 ,  'Sales');

with cte as(select a.name as dept, b.name, b.salary,
case when b.salary=max(b.salary) over(partition by a.name) then 1 end as flag  from Department a join Employee b
on b.departmentId=a.id)
select 
dept as Department, name as Employee, salary as Salary from cte 
where flag =1  ;

