
create database `10352_Users By Average Session Time`;

create table facebook_web_log (
user_id bigint,
timestamp datetime,
action text
);

insert into facebook_web_log values 
(0, '2019-04-25 13:30:15', 'page_load'),
(0, '2019-04-25 13:30:18', 'page_load'),
(0, '2019-04-25 13:30:40', 'scroll_down'),
(0, '2019-04-25 13:30:45', 'scroll_up'),
(0, '2019-04-25 13:31:10', 'scroll_down'),
(0, '2019-04-25 13:31:25', 'scroll_down'),
(0, '2019-04-25 13:31:40', 'page_exit'),
(1, '2019-04-25 13:40:00', 'page_load'),
(1, '2019-04-25 13:40:10', 'scroll_down'),
(1, '2019-04-25 13:40:15', 'scroll_down'),
(1, '2019-04-25 13:40:20', 'scroll_down'),
(1, '2019-04-25 13:40:25', 'scroll_down'),
(1, '2019-04-25 13:40:30', 'scroll_down'),
(1, '2019-04-25 13:40:35', 'page_exit'),
(2, '2019-04-25 13:41:21', 'page_load'),
(2, '2019-04-25 13:41:30', 'scroll_down'),
(2, '2019-04-25 13:41:35', 'scroll_down'),
(2, '2019-04-25 13:41:40', 'scroll_up'),
(1, '2019-04-26 11:15:00', 'page_load'),
(1, '2019-04-26 11:15:10', 'scroll_down'),
(1, '2019-04-26 11:15:20', 'scroll_down'),
(1, '2019-04-26 11:15:25', 'scroll_up'),
(1, '2019-04-26 11:15:35', 'page_exit'),
(0, '2019-04-28 14:30:15', 'page_load'),
(0, '2019-04-28 14:30:10', 'page_load'),
(0, '2019-04-28 13:30:40', 'scroll_down'),
(0, '2019-04-28 15:31:40', 'page_exit'),
(0, '2019-04-25 13:30:00', 'page_load'),
(0, '2019-04-25 13:30:20', 'page_load'),
(0, '2019-04-25 13:30:40', 'page_exit');

with cte as (
select user_id, timestamp, action, 
case when max(timestamp)over(partition by user_id,day(timestamp),action)=timestamp and 
action='page_load' then 1 end as load_tag,
case when min(timestamp)over(partition by user_id,day(timestamp),action)=timestamp and
action='page_exit' then 1 end as exit_tag
from facebook_web_log
order by user_id,timestamp
)
, cte1 as(
select user_id, timestamp, action, 
case when lead(action,1)over(partition by user_id order by timestamp)='page_exit' then
timestampdiff(second,timestamp,lead(timestamp,1)over(partition by user_id order by timestamp))
end as time_ 
from cte 
where load_tag =1 or exit_tag=1)
select user_id, avg(time_) as avg_session_duration from cte1 where time_ is not null group by 1
;