
create database `2170_department_workforce_analysis`;
use `2170_department_workforce_analysis`;
create table techcorp_workforce(
department text,
first_name text,
id bigint,
joining_date date,
last_name text,
phone_number text,
salary bigint
);
insert into techcorp_workforce(id,	first_name,	last_name,	department,	salary,	phone_number,	joining_date) values
(1, 'Sarah', 'Mitchell', 'HR', 95000, '555-0101', '2021-03-15'),
(2, 'Michael', 'Chen', 'HR', 88000, '555-0102', '2022-06-01'),
(3, 'Emily', 'Rodriguez', 'HR', 82500, NULL, '2021-09-20'),
(4, 'David', 'Park', 'HR', 80000, '555-0104', '2023-01-10'),
(5, 'Lisa', 'Thompson', 'HR', 65000, NULL, '2021-04-05'),
(6, 'Robert', 'Garcia', 'HR', 58000, '555-0106', '2022-11-15'),
(7, 'Jennifer', 'Lee', 'HR', 72000, '555-0107', '2023-05-20'),
(8, 'William', 'Davis', 'HR', 91000, '555-0108', '2019-08-12'),
(9, 'Patricia', 'Wilson', 'HR', 78000, NULL, '2018-02-28'),
(10, 'James', 'Martinez', 'Admin', 87000, '555-0201', '2021-07-01'),
(11, 'Amanda', 'Taylor', 'Admin', 92000, NULL, '2022-03-15'),
(12, 'Christopher', 'Anderson', 'Admin', 81500, '555-0203', '2023-08-22'),
(13, 'Michelle', 'Thomas', 'Admin', 54000, '555-0204', '2021-11-30'),
(14, 'Daniel', 'Jackson', 'Admin', 62000, '555-0205', '2022-09-10'),
(15, 'Jessica', 'White', 'Admin', 48000, NULL, '2023-02-14'),
(16, 'Matthew', 'Harris', 'Admin', 85000, '555-0207', '2017-05-20'),
(17, 'Kevin', 'Brown', 'Engineering', 125000, '555-0301', '2021-01-15'),
(18, 'Angela', 'Miller', 'Engineering', 118000, '555-0302', '2022-04-01'),
(19, 'Brian', 'Moore', 'Engineering', 105000, NULL, '2021-06-20'),
(20, 'Stephanie', 'Clark', 'Engineering', 98000, '555-0304', '2023-03-10'),
(21, 'Timothy', 'Lewis', 'Engineering', 75000, '555-0305', '2022-08-15'),
(22, 'Rebecca', 'Walker', 'Engineering', 68000, NULL, '2023-11-01'),
(23, 'George', 'Hall', 'Engineering', 130000, '555-0307', '2016-09-01'),
(24, 'Donna', 'Allen', 'Engineering', 95000, '555-0308', '2019-12-15'),
(25, 'Ryan', 'Young', 'Marketing', 72000, '555-0401', '2021-05-01'),
(26, 'Laura', 'King', 'Marketing', 85000, NULL, '2022-02-20'),
(27, 'Eric', 'Wright', 'Marketing', 68000, '555-0403', '2023-07-15'),
(28, 'Sharon', 'Scott', 'Marketing', 91000, '555-0404', '2022-10-01'),
(29, 'Kenneth', 'Torres', 'Marketing', 95000, '555-0405', '2018-03-10'),
(30, 'Carol', 'Nguyen', 'Marketing', 78000, NULL, '2015-11-20'),
(31, 'Jason', 'Hill', 'Sales', 65000, '555-0501', '2021-02-15'),
(32, 'Amy', 'Flores', 'Sales', 71000, '555-0502', '2022-05-20'),
(33, 'Jacob', 'Green', 'Sales', 58000, NULL, '2021-08-10'),
(34, 'Kathleen', 'Adams', 'Sales', 82000, '555-0504', '2023-01-25'),
(35, 'Gary', 'Nelson', 'Sales', 76000, '555-0505', '2022-12-01'),
(36, 'Anna', 'Baker', 'Sales', 69000, NULL, '2023-04-15'),
(37, 'Stephen', 'Rivera', 'Sales', 88000, '555-0507', '2017-07-01'),
(38, 'Nicholas', 'Campbell', 'Finance', 92000, '555-0601', '2021-04-01'),
(39, 'Brenda', 'Mitchell', 'Finance', 78000, NULL, '2022-07-15'),
(40, 'Jonathan', 'Carter', 'Finance', 85000, '555-0603', '2021-10-20'),
(41, 'Shirley', 'Roberts', 'Finance', 67000, '555-0604', '2023-06-01'),
(42, 'Edward', 'Gomez', 'Finance', 73000, NULL, '2022-01-10'),
(43, 'Cynthia', 'Phillips', 'Finance', 81000, '555-0606', '2023-09-15'),
(44, 'Jeffrey', 'Evans', 'Finance', 105000, '555-0607', '2014-06-01'),
(45, 'Dorothy', 'Turner', 'Finance', 88000, NULL, '2019-03-20'),
(46, 'Mark', 'Diaz', 'HR', 55000, '555-0109', '2024-01-15'),
(47, 'Sandra', 'Parker', 'Admin', 51000, NULL, '2024-02-01'),
(48, 'Paul', 'Collins', 'Engineering', 88000, '555-0309', '2024-03-10'),
(49, 'Kimberly', 'Stewart', 'Engineering', 92000, '555-0310', '2021-12-01'),
(50, 'Andrew', 'Sanchez', 'Sales', 63000, NULL, '2024-01-20'),
(51, 'Betty', 'Morris', 'Finance', 71000, '555-0608', '2021-11-15');


select department,count(*) as head_count,
sum(salary)as total_payroll, avg(salary) as avg_salary
from techcorp_workforce
where joining_date>'2020-01-01'
group by 1
having head_count>=5
;