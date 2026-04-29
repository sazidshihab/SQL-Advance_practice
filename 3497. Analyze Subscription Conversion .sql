-- Active: 1774469870130@@127.0.0.1@3306@185. Department Top Three Salaries
create database `3497. Analyze Subscription Conversion`;
use `3497. Analyze Subscription Conversion`;

create table UserActivity (
    user_id int,
    activity_date date,
    activity_type varchar(255),
    activity_duration int
);

insert into UserActivity values(1, '2023-01-01', 'free_trial', 45),
(1, '2023-01-02', 'free_trial', 30),
(1, '2023-01-05', 'free_trial', 60),
(1, '2023-01-10', 'paid', 75),
(1, '2023-01-12', 'paid', 90),
(1, '2023-01-15', 'paid', 65),
(2, '2023-02-01', 'free_trial', 55),
(2, '2023-02-03', 'free_trial', 25),
(2, '2023-02-07', 'free_trial', 50),
(2, '2023-02-10', 'cancelled', 0),
(3, '2023-03-05', 'free_trial', 70),
(3, '2023-03-06', 'free_trial', 60),
(3, '2023-03-08', 'free_trial', 80),
(3, '2023-03-12', 'paid', 50),
(3, '2023-03-15', 'paid', 55),
(3, '2023-03-20', 'paid', 85),
(4, '2023-04-01', 'free_trial', 40),
(4, '2023-04-03', 'free_trial', 35),
(4, '2023-04-05', 'paid', 45),
(4, '2023-04-07', 'cancelled', 0);

with cte as(
    select user_id,activity_type,
avg(activity_duration) as avg_time
 from UserActivity
where user_id in(select user_id from UserActivity where activity_type='paid')
group by 1,activity_type)
select user_id, 
round(max(case when activity_type='free_trial' then avg_time end),2) as trial_avg_duration,
round(max(case when activity_type='paid' then avg_time end),2) as paid_avg_duration
from cte
group by 1
order by user_id
;