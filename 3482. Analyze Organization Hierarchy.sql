create database `3482_Analyze_Organization_Hierarchy`;

create table Employees 
(employee_id    int,
employee_name   varchar(40),
manager_id     int,
salary      int,
department   varchar(40));

truncate Employees;
insert into Employees values
(1, 'Alice', NULL, 12000, 'Executive'),
(2, 'Bob', 1, 10000, 'Sales'),
(3, 'Charlie', 1, 10000, 'Engineering'),
(4, 'David', 2, 7500, 'Sales'),
(5, 'Eva', 2, 7500, 'Sales'),
(6, 'Frank', 3, 9000, 'Engineering'),
(7, 'Grace', 3, 8500, 'Engineering'),
(8, 'Hank', 4, 6000, 'Sales'),
(9, 'Ivy', 6, 7000, 'Engineering'),
(10, 'Judy', 6, 7000, 'Engineering');

/*
(1, 'Marcella Harvey', NULL, 18070, 'Executive'),
(2, 'David Harris', 1, 16975, 'Product'),
(3, 'Joseph Eaves', 1, 17676, 'Marketing'),
(4, 'Amparo Travers', 1, 20191, 'Executive'),
(5, 'Vanessa Marks', 2, 14030, 'Product'),
(6, 'Luigi Spicher', 2, 13674, 'Product'),
(7, 'Danielle Tvedt', 3, 15885, 'Marketing'),
(8, 'Pamela Starnes', 3, 16592, 'Marketing');

/*
  (1, 'Alice', NULL, 12000, 'Executive'),
  (2, 'Bob', 1, 10000, 'Sales'),
  (3, 'Charlie', 1, 10000, 'Engineering'),
  (4, 'David', 2, 7500, 'Sales'),
  (5, 'Eva', 2, 7500, 'Sales'),
  (6, 'Frank', 3, 9000, 'Engineering'),
  (7, 'Grace', 3, 8500, 'Engineering'),
  (8, 'Hank', 4, 6000, 'Sales'),
  (9, 'Ivy', 6, 7000, 'Engineering'),
  (10, 'Judy', 6, 7000, 'Engineering'); */

/*
Hierarchy Levels: For each employee, determine their level in the organization 
(CEO is level 1, employees reporting directly to the CEO are level 2, and so on).
Team Size: For each employee who is a manager, count the total number of employees under them 
(direct and indirect reports).
Salary Budget: For each manager, calculate the total salary budget they control 
(sum of salaries of all employees under them, including indirect reports, plus their own salary).
Return the result table ordered by the result ordered by level in ascending order,
then by budget in descending order, and finally by employee_name in ascending order.
*/


with recursive cte as(
select 1 as lev, employee_id as manager ,employee_id as managed, salary as salary_  from Employees where manager_id is null
UNION all
select lev+1,a.managed, b.employee_id as managed, b.salary as salary_ from cte a  join Employees b
on a.managed= b.manager_id  
),

cte1 as(
select  manager , count(managed) as managed, sum(salary_) as salary_
from cte  
group by manager
), 

cte4 as(
select  a.manager, b.managed, b.salary_ from cte a  join cte b on a.managed=b.manager
where a.manager!=b.managed
union 
select  manager , managed ,salary_ from cte
),

cte5 as(
select manager, count(managed) as team_size ,sum(salary_)as salary_ from cte4 group by manager
),

cte2 as(
select a.employee_id,
case when a.manager_id is null then COALESCE(count(*)over()-1,0) else COALESCE(c.team_size,0) end as team_size, 
case when a.manager_id is null then sum(a.salary)over() else (coalesce(c.salary_,0)+coalesce(a.salary)) end as budget
from Employees a 
left join cte1 b on a.employee_id=b.manager left join cte5 c on c.manager=a.employee_id
order by 
budget DESC
), cte_final as(
select distinct  a.employee_id,c.employee_name, b.lev as level, a.team_size, a.budget 
from cte2 a 
left join cte b on a.employee_id=b.managed left join Employees c on c.employee_id=a.employee_id
order by 
level asc,budget desc,employee_name asc)
select * from cte;






select * from Employees;