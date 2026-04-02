create database `3617_Find_Students_with_Study_Spiral_Pattern`;

create table students (
student_id   int   primary key,
student_name varchar(20),
major   varchar(20)
);

insert into students values
/*
(1, 'Henry Johnson', 'Philosophy'),
(2, 'Ruby Garcia', 'Chemistry'),
(3, 'Ivy Moore', 'Business'),
(4, 'Frank Wright', 'Computer Science'),
(5, 'Bob Wilson', 'Chemistry'),
(6, 'Olivia Chen', 'Literature'),
(7, 'Bob Harris', 'Philosophy'),
(8, 'Anna Thompson', 'Economics'),
(9, 'Ruby Smith', 'Art'),
(10, 'Kate Wright', 'Engineering'),
(11, 'Ruby Thomas', 'Chemistry'),
(12, 'Victor Moore', 'Mathematics'),
(13, 'Yolanda Moore', 'Engineering'),
(14, 'Wendy Martinez', 'Art'),
(15, 'Carol Hill', 'History'),
(16, 'Henry Allen', 'Mathematics'),
(17, 'Sam Hall', 'Literature'),
(18, 'Mia Miller', 'Computer Science');
*/

(1, 'Alice Chen', 'Computer Science'),
(2, 'Bob Johnson', 'Mathematics'),
(3, 'Carol Davis', 'Physics'),
(4, 'David Wilson', 'Chemistry'),
(5, 'Emma Brown', 'Biology');

/*
(1, 'Henry Johnson', 'Philosophy'),
(2, 'Ruby Garcia', 'Chemistry'),
(3, 'Ivy Moore', 'Business'),
(4, 'Frank Wright', 'Computer Science'),
(5, 'Bob Wilson', 'Chemistry'),
(6, 'Olivia Chen', 'Literature'),
(7, 'Bob Harris', 'Philosophy'),
(8, 'Anna Thompson', 'Economics'),
(9, 'Ruby Smith', 'Art'),
(10, 'Kate Wright', 'Engineering'),
(11, 'Ruby Thomas', 'Chemistry'),
(12, 'Victor Moore', 'Mathematics'),
(13, 'Yolanda Moore', 'Engineering'),
(14, 'Wendy Martinez', 'Art'),
(15, 'Carol Hill', 'History'),
(16, 'Henry Allen', 'Mathematics'),
(17, 'Sam Hall', 'Literature'),
(18, 'Mia Miller', 'Computer Science');
*/

drop  table students;

create table study_sessions (
session_id     int  primary key,
student_id    int ,
subject   varchar(15),
session_date   date ,
hours_studied  decimal(5,2),
foreign key study_sessions(student_id) REFERENCES students(student_id)
);

truncate table study_sessions;

drop table study_sessions;


select * from study_sessions;

INSERT INTO study_sessions (session_id, student_id, subject, session_date, hours_studied) VALUES
(1, 1, 'Math', '2023-10-01', 2.5),
(2, 1, 'Physics', '2023-10-02', 3),
(3, 1, 'Chemistry', '2023-10-03', 2),
(4, 1, 'Math', '2023-10-04', 2.5),
(5, 1, 'Physics', '2023-10-05', 3),
(6, 1, 'Chemistry', '2023-10-06', 2),
(7, 2, 'Algebra', '2023-10-01', 4),
(8, 2, 'Calculus', '2023-10-02', 3.5),
(9, 2, 'Statistics', '2023-10-03', 2.5),
(10, 2, 'Geometry', '2023-10-04', 3),
(11, 2, 'Algebra', '2023-10-05', 4),
(12, 2, 'Calculus', '2023-10-06', 3.5),
(13, 2, 'Statistics', '2023-10-07', 2.5),
(14, 2, 'Geometry', '2023-10-08', 3),
(15, 3, 'Biology', '2023-10-01', 2),
(16, 3, 'Chemistry', '2023-10-02', 2.5),
(17, 3, 'Biology', '2023-10-03', 2),
(18, 3, 'Chemistry', '2023-10-04', 2.5),
(19, 4, 'Organic', '2023-10-01', 3),
(20, 4, 'Physical', '2023-10-05', 2.5);


/*
(1, 1, 'Physics', '2023-10-01', 3.3),
(2, 1, 'Chemistry', '2023-10-03', 1.8),
(3, 1, 'Astronomy', '2023-10-05', 2.0),
(4, 1, 'Geology', '2023-10-07', 4.5),
(5, 1, 'Physics', '2023-10-08', 4.0),
(6, 1, 'Chemistry', '2023-10-09', 3.7),
(7, 1, 'Astronomy', '2023-10-10', 1.8),
(8, 1, 'Geology', '2023-10-12', 2.3),
(9, 1, 'Physics', '2023-10-13', 4.4),
(10, 1, 'Chemistry', '2023-10-14', 2.1),
(11, 1, 'Astronomy', '2023-10-15', 5.0),
(12, 1, 'Geology', '2023-10-17', 2.3),
(13, 2, 'Chemistry', '2023-10-01', 2.3),
(14, 2, 'Physics', '2023-10-02', 4.7),
(15, 2, 'Biology', '2023-10-04', 4.7),
(16, 2, 'English', '2023-10-06', 5.5),
(17, 2, 'History', '2023-10-08', 2.8),
(18, 2, 'Chemistry', '2023-10-09', 3.5),
(19, 2, 'Physics', '2023-10-10', 4.8),
(20, 2, 'Biology', '2023-10-11', 1.8),
(21, 2, 'English', '2023-10-12', 5.0),
(22, 2, 'History', '2023-10-14', 4.0),
(23, 3, 'Psychology', '2023-10-01', 4.8),
(24, 3, 'Philosophy', '2023-10-03', 1.6),
(25, 3, 'Art', '2023-10-05', 1.8),
(26, 3, 'Literature', '2023-10-06', 5.8),
(27, 3, 'History', '2023-10-08', 5.9),
(28, 3, 'Psychology', '2023-10-09', 3.5),
(29, 3, 'Philosophy', '2023-10-10', 5.4),
(30, 3, 'Art', '2023-10-12', 5.2),
(31, 3, 'Literature', '2023-10-13', 1.8),
(32, 3, 'History', '2023-10-14', 3.7),
(33, 3, 'Psychology', '2023-10-15', 4.0),
(34, 3, 'Philosophy', '2023-10-17', 1.1),
(35, 3, 'Art', '2023-10-19', 5.4),
(36, 3, 'Literature', '2023-10-21', 2.2),
(37, 3, 'History', '2023-10-22', 5.4),
(38, 4, 'Geometry', '2023-10-01', 5.7),
(39, 4, 'Algebra', '2023-10-02', 2.3),
(40, 4, 'Statistics', '2023-10-04', 5.8),
(41, 4, 'Trigonometry', '2023-10-05', 4.6),
(42, 4, 'Calculus', '2023-10-07', 6.0),
(43, 4, 'Geometry', '2023-10-09', 3.2),
(44, 4, 'Algebra', '2023-10-11', 1.6),
(45, 4, 'Statistics', '2023-10-12', 1.3),
(46, 4, 'Trigonometry', '2023-10-13', 3.9),
(47, 4, 'Calculus', '2023-10-14', 3.9),
(48, 4, 'Geometry', '2023-10-15', 1.4),
(49, 4, 'Algebra', '2023-10-16', 2.1),
(50, 4, 'Statistics', '2023-10-17', 5.3),
(51, 4, 'Trigonometry', '2023-10-18', 3.6),
(52, 4, 'Calculus', '2023-10-20', 4.3),
(53, 5, 'History', '2023-10-01', 4.9),
(54, 5, 'English', '2023-10-03', 2.0),
(55, 5, 'Biology', '2023-10-04', 4.3),
(56, 5, 'History', '2023-10-06', 3.1),
(57, 5, 'English', '2023-10-08', 5.3),
(58, 5, 'Biology', '2023-10-09', 4.4),
(59, 6, 'Statistics', '2023-10-01', 3.7),
(60, 6, 'Algebra', '2023-10-02', 3.1),
(61, 6, 'Geometry', '2023-10-04', 3.3),
(62, 6, 'Trigonometry', '2023-10-05', 3.2),
(63, 6, 'Statistics', '2023-10-06', 1.3),
(64, 6, 'Algebra', '2023-10-07', 5.8),
(65, 6, 'Geometry', '2023-10-08', 1.8),
(66, 6, 'Trigonometry', '2023-10-10', 3.4),
(67, 7, 'Geometry', '2023-10-04', 2.3),
(68, 7, 'Algebra', '2023-10-06', 2.4),
(69, 7, 'Geometry', '2023-10-08', 1.8),
(70, 7, 'Algebra', '2023-10-10', 2.1),
(71, 7, 'Geometry', '2023-10-11', 3.9),
(72, 7, 'Algebra', '2023-10-12', 4.7),
(73, 8, 'Geometry', '2023-10-05', 1.4),
(74, 8, 'Calculus', '2023-10-12', 1.3),
(75, 8, 'Algebra', '2023-10-14', 1.6),
(76, 8, 'Geometry', '2023-10-15', 3.9),
(77, 8, 'Calculus', '2023-10-18', 3.1),
(78, 8, 'Algebra', '2023-10-20', 5.7),
(79, 9, 'Geology', '2023-10-06', 2.5),
(80, 9, 'Chemistry', '2023-10-08', 5.6),
(81, 9, 'Biology', '2023-10-09', 1.0),
(82, 9, 'Geology', '2023-10-10', 1.4),
(83, 10, 'Physics', '2023-10-02', 2.8),
(84, 10, 'Chemistry', '2023-10-03', 3.2),
(85, 10, 'Math', '2023-10-05', 4.1),
(86, 10, 'Physics', '2023-10-06', 4.3),
(87, 11, 'Geology', '2023-10-02', 1.6),
(88, 11, 'Biology', '2023-10-03', 3.8),
(89, 11, 'Astronomy', '2023-10-06', 4.0),
(90, 11, 'Chemistry', '2023-10-09', 4.4),
(91, 12, 'Geology', '2023-10-04', 5.5),
(92, 12, 'Statistics', '2023-10-05', 4.2),
(93, 12, 'Calculus', '2023-10-08', 1.0),
(94, 12, 'Math', '2023-10-10', 5.9),
(95, 12, 'Biology', '2023-10-12', 3.2),
(96, 12, 'Philosophy', '2023-10-16', 1.0),
(97, 12, 'Chemistry', '2023-10-17', 5.5),
(98, 12, 'Calculus', '2023-10-22', 5.2),
(99, 12, 'Philosophy', '2023-10-27', 1.7),
(100, 12, 'Calculus', '2023-10-29', 2.5),
(101, 12, 'Algorithms', '2023-10-30', 2.1),
(102, 13, 'English', '2023-10-03', 3.8),
(103, 13, 'Art', '2023-10-07', 4.7),
(104, 13, 'Physics', '2023-10-09', 5.9),
(105, 13, 'Networks', '2023-10-11', 1.1),
(106, 14, 'Biology', '2023-10-06', 5.1),
(107, 14, 'Physics', '2023-10-09', 4.9),
(108, 14, 'Database', '2023-10-10', 5.4);
*/




/*
(1, 1, 'Physics', '2023-10-01', 3.3),
(2, 1, 'Chemistry', '2023-10-03', 1.8),
(3, 1, 'Astronomy', '2023-10-05', 2),
(4, 1, 'Geology', '2023-10-07', 4.5),
(5, 1, 'Physics', '2023-10-08', 4),
(6, 1, 'Chemistry', '2023-10-09', 3.7),
(7, 1, 'Astronomy', '2023-10-10', 1.8),
(8, 1, 'Geology', '2023-10-12', 2.3),
(9, 1, 'Physics', '2023-10-13', 4.4),
(10, 1, 'Chemistry', '2023-10-14', 2.1),
(11, 1, 'Astronomy', '2023-10-15', 5),
(12, 1, 'Geology', '2023-10-17', 2.3),
(13, 2, 'Chemistry', '2023-10-01', 2.3),
(14, 2, 'Physics', '2023-10-02', 4.7),
(15, 2, 'Biology', '2023-10-04', 4.7),
(16, 2, 'English', '2023-10-06', 5.5),
(17, 2, 'History', '2023-10-08', 2.8),
(18, 2, 'Chemistry', '2023-10-09', 3.5),
(19, 2, 'Physics', '2023-10-10', 4.8),
(20, 2, 'Biology', '2023-10-11', 1.8),
(21, 2, 'English', '2023-10-12', 5),
(22, 2, 'History', '2023-10-14', 4),
(23, 3, 'Psychology', '2023-10-01', 4.8),
(24, 3, 'Philosophy', '2023-10-03', 1.6),
(25, 3, 'Art', '2023-10-05', 1.8),
(26, 3, 'Literature', '2023-10-06', 5.8),
(27, 3, 'History', '2023-10-08', 5.9),
(28, 3, 'Psychology', '2023-10-09', 3.5),
(29, 3, 'Philosophy', '2023-10-10', 5.4),
(30, 3, 'Art', '2023-10-12', 5.2),
(31, 3, 'Literature', '2023-10-13', 1.8),
(32, 3, 'History', '2023-10-14', 3.7),
(33, 3, 'Psychology', '2023-10-15', 4),
(34, 3, 'Philosophy', '2023-10-17', 1.1),
(35, 3, 'Art', '2023-10-19', 5.4),
(36, 3, 'Literature', '2023-10-21', 2.2),
(37, 3, 'History', '2023-10-22', 5.4),
(38, 4, 'Geometry', '2023-10-01', 5.7),
(39, 4, 'Algebra', '2023-10-02', 2.3),
(40, 4, 'Statistics', '2023-10-04', 5.8),
(41, 4, 'Trigonometry', '2023-10-05', 4.6),
(42, 4, 'Calculus', '2023-10-07', 6),
(43, 4, 'Geometry', '2023-10-09', 3.2),
(44, 4, 'Algebra', '2023-10-11', 1.6),
(45, 4, 'Statistics', '2023-10-12', 1.3),
(46, 4, 'Trigonometry', '2023-10-13', 3.9),
(47, 4, 'Calculus', '2023-10-14', 3.9),
(48, 4, 'Geometry', '2023-10-15', 1.4),
(49, 4, 'Algebra', '2023-10-16', 2.1),
(50, 4, 'Statistics', '2023-10-17', 5.3),
(51, 4, 'Trigonometry', '2023-10-18', 3.6),
(52, 4, 'Calculus', '2023-10-20', 4.3),
(53, 5, 'History', '2023-10-01', 4.9),
(54, 5, 'English', '2023-10-03', 2),
(55, 5, 'Biology', '2023-10-04', 4.3),
(56, 5, 'History', '2023-10-06', 3.1),
(57, 5, 'English', '2023-10-08', 5.3),
(58, 5, 'Biology', '2023-10-09', 4.4),
(59, 6, 'Statistics', '2023-10-01', 3.7),
(60, 6, 'Algebra', '2023-10-02', 3.1),
(61, 6, 'Geometry', '2023-10-04', 3.3),
(62, 6, 'Trigonometry', '2023-10-05', 3.2),
(63, 6, 'Statistics', '2023-10-06', 1.3),
(64, 6, 'Algebra', '2023-10-07', 5.8),
(65, 6, 'Geometry', '2023-10-08', 1.8),
(66, 6, 'Trigonometry', '2023-10-10', 3.4),
(67, 7, 'Geometry', '2023-10-04', 2.3),
(68, 7, 'Algebra', '2023-10-06', 2.4),
(69, 7, 'Geometry', '2023-10-08', 1.8),
(70, 7, 'Algebra', '2023-10-10', 2.1),
(71, 7, 'Geometry', '2023-10-11', 3.9),
(72, 7, 'Algebra', '2023-10-12', 4.7),
(73, 8, 'Geometry', '2023-10-05', 1.4),
(74, 8, 'Calculus', '2023-10-12', 1.3),
(75, 8, 'Algebra', '2023-10-14', 1.6),
(76, 8, 'Geometry', '2023-10-15', 3.9),
(77, 8, 'Calculus', '2023-10-18', 3.1),
(78, 8, 'Algebra', '2023-10-20', 5.7),
(79, 9, 'Geology', '2023-10-06', 2.5),
(80, 9, 'Chemistry', '2023-10-08', 5.6),
(81, 9, 'Biology', '2023-10-09', 1),
(82, 9, 'Geology', '2023-10-10', 1.4),
(83, 10, 'Physics', '2023-10-02', 2.8),
(84, 10, 'Chemistry', '2023-10-03', 3.2),
(85, 10, 'Math', '2023-10-05', 4.1),
(86, 10, 'Physics', '2023-10-06', 4.3),
(87, 11, 'Geology', '2023-10-02', 1.6),
(88, 11, 'Biology', '2023-10-03', 3.8),
(89, 11, 'Astronomy', '2023-10-06', 4),
(90, 11, 'Chemistry', '2023-10-09', 4.4),
(91, 12, 'Geology', '2023-10-04', 5.5),
(92, 12, 'Statistics', '2023-10-05', 4.2),
(93, 12, 'Calculus', '2023-10-08', 1),
(94, 12, 'Math', '2023-10-10', 5.9),
(95, 12, 'Biology', '2023-10-12', 3.2),
(96, 12, 'Philosophy', '2023-10-16', 1),
(97, 12, 'Chemistry', '2023-10-17', 5.5),
(98, 12, 'Calculus', '2023-10-22', 5.2),
(99, 12, 'Philosophy', '2023-10-27', 1.7),
(100, 12, 'Calculus', '2023-10-29', 2.5),
(101, 12, 'Algorithms', '2023-10-30', 2.1),
(102, 13, 'English', '2023-10-03', 3.8),
(103, 13, 'Art', '2023-10-07', 4.7),
(104, 13, 'Physics', '2023-10-09', 5.9),
(105, 13, 'Networks', '2023-10-11', 1.1),
(106, 14, 'Biology', '2023-10-06', 5.1),
(107, 14, 'Physics', '2023-10-09', 4.9),
(108, 14, 'Database', '2023-10-10', 5.4);
*/


# Write your MySQL query statement below


with cte_date_fixed_pre as( /* Here,checking date logic if their gap not more than 2 days + creating lead lable from it */
    select *, case when timestampdiff(day,session_date,lead(session_date,1)over(partition by student_id))<=2
    or (max(session_id)over(partition by student_id)=session_id) then 1 else null end as `lead` from study_sessions 
),

cte_date_fixed as(/* Here further filting those student's who has minimum 6 sub rows(3sub in 2 cycle )*/
    select session_id, student_id, subject, session_date, hours_studied from cte_date_fixed_pre where session_id in(
        select session_id from (SELECT session_id, student_id ,sum(`lead`)over(partition by student_id)as lead_sum
         from cte_date_fixed_pre) as a
        where lead_sum>=6 
    )
), 
cte_sequential_sub_pre_ as(
select *,
case when (session_id=min(session_id)over(partition by student_id, subject) or session_id=max(session_id)over(partition by student_id, subject)) then
  round(coalesce((lead(session_id)over(partition by student_id,subject order by session_id)-session_id),0) +
 coalesce((session_id-lag(session_id)over(partition by student_id,subject order by session_id)),0)) 
 else round(session_id-lag(session_id)over(partition by student_id,subject order by session_id)) end as gap
 from cte_date_fixed
), cte_sequential_sub as(
    select session_id, student_id, subject, session_date,hours_studied,
     case when gap=avg(gap)over(partition by student_id) then 1 else null end as fn
     from cte_sequential_sub_pre_
), cte_final as(
select a.student_id,b.student_name,b.major,count(distinct a.subject) as cycle_length,sum(a.hours_studied) as total_study_hours
 from cte_sequential_sub a join students b on a.student_id=b.student_id
  where fn=1
  group by a.student_id
  having count(distinct a.subject)>=3
  order by count(distinct a.subject) desc, sum(a.hours_studied) desc)
  select * from cte_final
;






















with cte as(
select session_id, student_id, subject, session_date,hours_studied,matched_id, lag_id,

case when timestampdiff(day,session_date,lead(session_date,1)over(partition by student_id order by session_date))<=2 then 1 else null end as seq1,
case when matched_id+1=lag_id then 1 else null end as seq2,
max(start_date)over(partition by student_id) as start_date, max(end_date)over(partition by student_id) as end_date, sub_count_pre
 from(
select *,lead(matched_id)over(partition by student_id order by session_date) as lag_id, 
case when matched_id=min(matched_id)over(partition by student_id) then session_date else null end as start_date,
case when session_id=max(matched_id)over(partition by student_id) then session_date else null end as end_date,
sum(case when matched_id is not null then 1 else null end)over(partition by student_id) as sub_count_pre
 from(
select * ,
(select min(session_id) from study_sessions b 
where b.subject=a.subject and b.student_id=a.student_id and a.session_id !=b.session_id and a.session_date<b.session_date ) 
as matched_id from study_sessions a) AS d) as e  ), 


cte1 as(

     select *,sum(seq1)over(partition by student_id) as seq_date, sum(seq2)over(partition by student_id) as seq_sub,
    case when start_date is not null then sum(hours_studied)over(partition by student_id) else null end  as hours_studied_ ,
   case when matched_id=min(matched_id)over(partition by student_id) then 1 else null end as tag,
   case when matched_id=min(matched_id)over(partition by student_id) then ((max(matched_id)over(partition by student_id)+1-session_id)-sub_count_pre) else NULL
   end as sub_count
    from cte 
    
)
select a.student_id,b.student_name, b.major,a.sub_count as cycle_length, a.hours_studied_ as total_study_hours from cte1 a join 
students b on a.student_id=b.student_id
where seq_date+1=sub_count+sub_count_pre and 
seq_sub+1>=3 and
sub_count_pre>=3 and sub_count>=3
order by  sub_count desc, hours_studied_ desc
;