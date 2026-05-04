-- Active: 1774469870130@@127.0.0.1@3306@185. Department Top Three Salaries

create database `3421_Find Students Who Improved`;

use `3421_Find Students Who Improved`;

create table  Scores (
    student_id int,
    subject varchar(15),
    score int,
    exam_date varchar(15)
);

insert into Scores VALUES 
(1, 'Biology', 85, '2022-08-23'),
(1, 'Biology', 50, '2022-10-08'),
(1, 'Biology', 92, '2022-11-26'),
(1, 'Math', 62, '2021-03-11'),
(1, 'Math', 54, '2021-04-02'),
(1, 'Math', 82, '2021-08-12'),
(1, 'Math', 93, '2021-10-27'),
(1, 'Physics', 92, '2023-01-27'),
(1, 'Physics', 82, '2023-02-01'),
(1, 'Physics', 64, '2023-07-26'),
(3, 'Biology', 89, '2023-07-05'),
(3, 'Biology', 85, '2023-09-11'),
(3, 'History', 55, '2023-01-18'),
(3, 'History', 75, '2023-03-17'),
(2, 'History', 93, '2023-02-07'),
(2, 'History', 69, '2023-06-12'),
(2, 'History', 57, '2023-11-09'),
(2, 'History', 66, '2023-12-13'),
(2, 'Biology', 98, '2022-06-12'),
(2, 'Biology', 82, '2022-09-19'),
(2, 'Physics', 83, '2021-07-02'),
(2, 'Physics', 51, '2021-07-27'),
(2, 'Chemistry', 99, '2023-07-02'),
(2, 'Chemistry', 88, '2023-07-07'),
(2, 'Math', 67, '2023-02-23'),
(2, 'Math', 52, '2023-04-06'),
(4, 'Chemistry', 80, '2021-06-10'),
(4, 'Chemistry', 65, '2021-08-16'),
(4, 'Chemistry', 60, '2021-12-28'),
(4, 'Biology', 88, '2023-04-25'),
(4, 'Biology', 50, '2023-06-06'),
(4, 'Biology', 67, '2023-12-08'),
(4, 'Physics', 89, '2021-01-08'),
(4, 'Physics', 57, '2021-01-17'),
(4, 'Physics', 73, '2021-04-26'),
(4, 'Math', 57, '2023-03-01'),
(4, 'Math', 64, '2023-05-21'),
(4, 'Math', 100, '2023-06-26'),
(4, 'Math', 83, '2023-11-27'),
(4, 'History', 78, '2022-06-09'),
(4, 'History', 68, '2022-08-21'),
(4, 'History', 89, '2022-11-15'),
(4, 'History', 52, '2022-12-06');

WITH CTE AS (
    SELECT 
        student_id, 
        subject, 
        score,
        RANK() OVER(PARTITION BY student_id, subject ORDER BY exam_date ASC) as rnk_asc,
        RANK() OVER(PARTITION BY student_id, subject ORDER BY exam_date DESC) as rnk_desc
    FROM Scores
)
SELECT 
    student_id, 
    subject,
    MAX(CASE WHEN rnk_asc = 1 THEN score END) as first_score,
    MAX(CASE WHEN rnk_desc = 1 THEN score END) as latest_score
FROM CTE
GROUP BY student_id, subject
HAVING COUNT(*) >= 2 AND latest_score > first_score
ORDER BY student_id, subject;