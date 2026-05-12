-- Active: 1774469870130@@127.0.0.1@3306@185. Department Top Three Salaries
create database `177. Nth Highest Salary`;
use `177. Nth Highest Salary`;

create table Employee(id int, salary int);

insert into Employee VALUES
(1  , 100),
( 2  ,200 ),
(3  , 300 );


DELIMITER //
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
READS SQL DATA
BEGIN
declare M int;
set M=N-1;
  RETURN (
      select distinct salary from Employee
      order by salary desc limit 1 offset M
  );
END//
DELIMITER ;

select getNthHighestSalary(1);