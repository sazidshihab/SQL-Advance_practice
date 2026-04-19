create database `3611. Find Overbooked Employees`;
use `3611. Find Overbooked Employees`;

create table employees (
    employee_id int primary key,
    employee_name varchar(255),
    department varchar(255)
);
 create table meetings (
    meeting_id int primary key,
    employee_id int,
    meeting_date date,
    meeting_type varchar(255),
    duration_hours decimal(5,2),
    foreign key (employee_id) references employees(employee_id)
 );

 INSERT INTO employees (employee_id, employee_name, department) VALUES
(1, 'Alice Johnson', 'Engineering'),
(2, 'Bob Smith', 'Marketing'),
(3, 'Carol Davis', 'Sales'),
(4, 'David Wilson', 'Engineering'),
(5, 'Emma Brown', 'HR');

INSERT INTO meetings (meeting_id, employee_id, meeting_date, meeting_type, duration_hours) VALUES
(1, 1, '2023-06-05', 'Team', 8.0),
(2, 1, '2023-06-06', 'Client', 6.0),
(3, 1, '2023-06-07', 'Training', 7.0),
(4, 1, '2023-06-12', 'Team', 12.0),
(5, 1, '2023-06-13', 'Client', 9.0),
(6, 2, '2023-06-05', 'Team', 15.0),
(7, 2, '2023-06-06', 'Client', 8.0),
(8, 2, '2023-06-12', 'Training', 10.0),
(9, 3, '2023-06-05', 'Team', 4.0),
(10, 3, '2023-06-06', 'Client', 3.0),
(11, 4, '2023-06-05', 'Team', 25.0),
(12, 4, '2023-06-19', 'Client', 22.0),
(13, 5, '2023-06-05', 'Training', 2.0);

with cte as(
    select b.employee_id, b.employee_name,b.department, yearweek(a.meeting_date,1), sum(a.duration_hours) as hour_ 
    from meetings a join employees b on a.employee_id=b.employee_id
    group by 1,2,3,4
    having hour_ >20 
) select employee_id, employee_name, department, count(*) as meeting_heavy_weeks from cte
group by 1,2,3
having meeting_heavy_weeks>1
order by meeting_heavy_weeks desc,employee_name asc
;