-- Active: 1774469870130@@127.0.0.1@3306@3764_Most_Common_Course
-- Active: 1774469870130@@127.0.0.1@3306@mysql
create database `3764_Most_Common_Course`;

create table course_completions (
user_id    int,
course_id  int,
course_name varchar(20),
completion_date date,
course_rating  int ,
 PRIMARY Key  (user_id,course_id)
)


select * from course_completions;

insert into course_completions values
(1, 101, 'Python Basics', '2024-01-05', 5),
(1, 102, 'SQL Fundamentals', '2024-02-10', 4),
(1, 103, 'JavaScript', '2024-03-15', 5),
(1, 104, 'React Basics', '2024-04-20', 4),
(1, 105, 'Node.js', '2024-05-25', 5),
(1, 106, 'Docker', '2024-06-30', 4),
(2, 101, 'Python Basics', '2024-01-08', 4),
(2, 104, 'React Basics', '2024-02-14', 5),
(2, 105, 'Node.js', '2024-03-20', 4),
(2, 106, 'Docker', '2024-04-25', 5),
(2, 107, 'AWS Fundamentals', '2024-05-30', 4),
(3, 101, 'Python Basics', '2024-01-10', 3),
(3, 102, 'SQL Fundamentals', '2024-02-12', 3),
(3, 103, 'JavaScript', '2024-03-18', 3),
(3, 104, 'React Basics', '2024-04-22', 2),
(3, 105, 'Node.js', '2024-05-28', 3),
(4, 101, 'Python Basics', '2024-01-12', 5),
(4, 108, 'Data Science', '2024-02-16', 5),
(4, 109, 'Machine Learning', '2024-03-22', 5);

with cte as(
select  course_name as first_course, lead(course_name)over(partition by user_id order by completion_date) as second_course  from 
(select *,max(num)over(partition by user_id) as numm, avg(course_rating)over(partition by user_id) as rating from(
    select * , row_number()over(partition by user_id) as num from course_completions
) as ct ) as ctt
where numm>=5 and rating>=4
order by user_id,completion_date
)
select first_course,second_course,count(*) as transition_count from cte
where first_course is not null and second_course is not null
group by first_course,second_course
order by count(*) desc, first_course asc, second_course asc;