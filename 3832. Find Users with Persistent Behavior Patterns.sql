create database `Persistant_behave_3832`;

use `Persistant_behave_3832`;

create table activity(
`user_id` int,
`action_date` date,
`action` varchar(255)
);

insert into activity VALUES
(1, '2024-01-01', 'login'),
(1, '2024-01-02', 'login'),
(1, '2024-01-03', 'login'),
(1, '2024-01-04', 'login'),
(1, '2024-01-05', 'login'),
(2, '2024-01-01', 'login'),
(2, '2024-01-02', 'login'),
(2, '2024-01-03', 'login'),
(2, '2024-01-04', 'login'),
(2, '2024-01-05', 'login'),
(2, '2024-01-06', 'login'),
(2, '2024-01-07', 'login'),
(2, '2024-01-08', 'login'),
(3, '2024-01-01', 'click'),
(3, '2024-01-02', 'click'),
(3, '2024-01-03', 'click'),
(3, '2024-01-04', 'click'),
(3, '2024-01-06', 'login'),
(3, '2024-01-07', 'login'),
(3, '2024-01-08', 'login'),
(3, '2024-01-09', 'login'),
(3, '2024-01-10', 'login'),
(3, '2024-01-11', 'login'),
(4, '2024-01-01', 'view'),
(4, '2024-01-02', 'login'),
(4, '2024-01-04', 'login'),
(4, '2024-01-05', 'login'),
(5, '2024-01-01', 'view'),
(5, '2024-01-02', 'view'),
(5, '2024-01-03', 'view'),
(5, '2024-01-04', 'view'),
(5, '2024-01-05', 'view'),
(6, '2024-01-01', 'login'),
(6, '2024-01-02', 'login'),
(6, '2024-01-03', 'login'),
(6, '2024-01-04', 'login'),
(6, '2024-01-05', 'login'),
(6, '2024-01-06', 'login'),
(6, '2024-01-07', 'login'),
(6, '2024-01-08', 'login'),
(7, '2024-01-01', 'view'),
(7, '2024-01-02', 'view'),
(7, '2024-01-03', 'view'),
(7, '2024-01-04', 'view'),
(7, '2024-01-06', 'logout'),
(7, '2024-01-07', 'logout'),
(7, '2024-01-08', 'logout'),
(7, '2024-01-09', 'logout'),
(7, '2024-01-10', 'logout'),
(7, '2024-01-11', 'logout'),
(8, '2024-01-01', 'view'),
(8, '2024-01-03', 'click'),
(8, '2024-01-04', 'view'),
(8, '2024-01-06', 'click'),
(8, '2024-01-08', 'view'),
(8, '2024-01-09', 'click'),
(9, '2024-01-01', 'login'),
(9, '2024-01-02', 'login'),
(9, '2024-01-03', 'login'),
(9, '2024-01-04', 'login'),
(9, '2024-01-05', 'login'),
(10, '2024-01-01', 'logout'),
(10, '2024-01-02', 'logout'),
(10, '2024-01-03', 'logout'),
(10, '2024-01-04', 'logout'),
(10, '2024-01-05', 'logout'),
(10, '2024-01-06', 'logout'),
(11, '2024-01-01', 'click'),
(11, '2024-01-02', 'click'),
(11, '2024-01-03', 'click'),
(11, '2024-01-04', 'click'),
(11, '2024-01-06', 'view'),
(11, '2024-01-07', 'view'),
(11, '2024-01-08', 'view'),
(11, '2024-01-09', 'view'),
(11, '2024-01-10', 'view'),
(11, '2024-01-11', 'view');




with cte as(
select user_id, action_date, action ,
case when timestampdiff(day,action_date,lead(action_date,4)over(partition by user_id,action order by action_date))=4 then sum(1)over(partition by user_id,action order by action_date) else null end as pkk
from 
activity
),cte1 as(

select user_id, action_date, action,pkk,

case when pkk=min(pkk)over(partition by user_id, action ) 
then max(pkk)over(partition by user_id, action)+4 else null end as max_,
case when pkk=min(pkk)over(partition by user_id, action ) 
then action_date else null end as start_date,
case when pkk<=max(pkk)over(partition by user_id, action)
then lead(action_date,4)over(partition by user_id, action order by action_date) else null end as end_date
from cte

)
,cte2 as(
select user_id,action_date,action,pkk,max_,start_date,
case when pkk=min(pkk)over(partition by user_id, action)
then max(end_date)over(partition by user_id, action) else null end as end_date
from cte1

)
   select user_id,action, max_ as streak_length, start_date, end_date from cte2
   where pkk=1
   order by streak_length desc, user_id asc
   
;
   
   