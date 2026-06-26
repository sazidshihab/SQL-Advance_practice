-- Active: 1774469870130@@127.0.0.1@3306@585. Investments in 2016
create database `2102_salary_less_than_twice_the_average`;
use `2102_salary_less_than_twice_the_average`;

create table map_employee_hierarchy(
empl_id text,
manager_empl_id text)

create table dim_employee(
empl_city text,
empl_dob date,
empl_id text,
empl_name text,
empl_pin bigint,
salary bigint);

insert into map_employee_hierarchy values ('E849', NULL),
('E850', 'E849'),
('E851', 'E849'),
('E852', 'E850'),
('E853', 'E850'),
('E854', 'E851'),
('E855', 'E851'),
('E856', 'E851'),
('E857', 'E854');

insert into dim_employee(empl_id, empl_name,	empl_city,	empl_dob,	empl_pin,	salary) values
('E849', 'Steven M. Jones', 'Hicksville', '1988-03-29', 1490, 80000),
('E850', 'Marilynn M. Walters', 'New York', '1978-12-26', 9624, 30000),
('E851', 'Kyle M. Massey', 'Lake Katrine', '1977-09-22', 1563, 40000),
('E852', 'Cody A. Mosby', 'Anaheim', '1965-03-18', 4883, 22000),
('E853', 'David J. Mintz', 'Houston', '1977-01-04', 8001, 18000),
('E854', 'Patricia J. Kyser', 'Atlanta', '1986-02-20', 1750, 18000),
('E855', 'Mark M. Daniels', 'Atlanta', '1979-07-13', 2424, 20000),
('E856', 'Gene M. Vanscoy', 'Chicago', '1977-03-11', 1107, 16000),
('E857', 'Mitchell A. Grimm', 'Houston', '1979-11-23', 8597, 16000);


with cte as(
select manager_empl_id,empl_id from map_employee_hierarchy
where manager_empl_id is not null),
cte1 as(
select a.manager_empl_id, b.salary as manager_salary, a.empl_id, c.salary as emp_salary from map_employee_hierarchy a 
 join dim_employee b on a.manager_empl_id=b.empl_id 
join dim_employee c on c.empl_id=a.empl_id
),cte2 as (
select manager_empl_id, max(manager_salary) as manager_salary,
avg(emp_salary) as emp_salary from cte1
group by 1
)
select * from cte2
where manager_salary<emp_salary*2
;