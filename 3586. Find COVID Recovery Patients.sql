-- Active: 1774469870130@@127.0.0.1@3306@3374_First_Letter_Capitalization_II
create database `3586. Find COVID Recovery Patients`;
use `3586. Find COVID Recovery Patients`;


drop table patients;
create table patients (
    patient_id int primary key,
    patient_name varchar(255),
    age int
);

create table covid_tests(
    test_id int primary key,
    patient_id int,
    test_date date,
    result varchar(20),
    foreign key (patient_id) references patients(patient_id)
);

insert into patients(patient_id, patient_name, age) VALUES
(1, 'Alice Smith', 28),
(2, 'Bob Johnson', 35),
(3, 'Carol Davis', 42),
(4, 'David Wilson', 31),
(5, 'Emma Brown', 29);

insert into covid_tests VALUES
(1, 1, '2023-01-15', 'Positive'),
(2, 1, '2023-01-25', 'Negative'),
(3, 2, '2023-02-01', 'Positive'),
(4, 2, '2023-02-05', 'Inconclusive'),
(5, 2, '2023-02-12', 'Negative'),
(6, 3, '2023-01-20', 'Negative'),
(7, 3, '2023-02-10', 'Positive'),
(8, 3, '2023-02-20', 'Negative'),
(9, 4, '2023-01-10', 'Positive'),
(10, 4, '2023-01-18', 'Positive'),
(11, 5, '2023-02-15', 'Negative'),
(12, 5, '2023-02-20', 'Negative');

with cte as(
    select a.patient_id, b.patient_name, b.age , a.result, a.test_date,
    min(case when a.result='Positive' then a.test_date end)over(partition by a.patient_id)
     as positive_date
from covid_tests a join patients b on a.patient_id=b.patient_id
),
cte2 as(
select patient_id,
patient_name,
age,
result,
min(test_date) as test_date
 from cte
where   test_date>=positive_date and result in ('Positive','Negative')
group by 1,2,3,4 ),
cte3 as(
select patient_id, patient_name, age,
timestampdiff(day, test_date, lead(test_date,1)over(partition by patient_id order by test_date)) as recovery_time
from cte2)
select * from cte3 where recovery_time is not null
order by recovery_time ,patient_name
 ;
