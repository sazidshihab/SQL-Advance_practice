create database `185. Department Top Three Salaries`;

create table Employee (
`id`            int,
`name`         varchar(50),
salary       int,
departmentId  int );
insert into Employee values
(1, 'Joe', 85000, 1),
(2, 'Henry', 80000, 2),
(3, 'Sam', 60000, 2),
(4, 'Max', 90000, 1),
(5, 'Janet', 69000, 1),
(6, 'Randy', 85000, 1),
(7, 'Will', 70000, 1);



create table Department(
`id`          int,
`name`        varchar(30));

insert into `Department` VALUES
(1, 'IT'),
(2, 'Sales');

with cte as (
select b.name as Department, a.name as Employee ,a.salary as Salary,
dense_rank()over(partition by b.name order by a.salary desc) as rankk
from Employee a join Department b on a.departmentId = b.id

) 
select Department, Employee, Salary from cte
where rankk between 1 and 3
 ;