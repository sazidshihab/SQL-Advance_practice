create database `2054_Consecutive_Days`;

create table sf_events (
    record_date date,
account_id text,
user_id text
);

insert into sf_events values
('2021-01-01', 'A1', 'U1'),
('2021-01-01', 'A1', 'U2'),
('2021-01-06', 'A1', 'U3'),
('2021-01-02', 'A1', 'U1'),
('2020-12-24', 'A1', 'U2'),
('2020-12-08', 'A1', 'U1'),
('2020-12-09', 'A1', 'U1'),
('2021-01-10', 'A2', 'U4'),
('2021-01-11', 'A2', 'U4'),
('2021-01-12', 'A2', 'U4'),
('2021-01-15', 'A2', 'U5'),
('2020-12-17', 'A2', 'U4'),
('2020-12-25', 'A3', 'U6'),
('2020-12-25', 'A3', 'U6'),
('2020-12-25', 'A3', 'U6'),
('2020-12-06', 'A3', 'U7'),
('2020-12-06', 'A3', 'U6'),
('2021-01-14', 'A3', 'U6'),
('2021-02-07', 'A1', 'U1'),
('2021-02-10', 'A1', 'U2'),
('2021-02-01', 'A2', 'U4'),
('2021-02-01', 'A2', 'U5'),
('2020-12-05', 'A1', 'U8');


with cte as(select record_date,account_id, user_id from sf_events
where user_id in (select user_id from (select user_id,count(user_id)over(partition by account_id,user_id)as cnt from  sf_events) as a where cnt>=3)
order by account_id,user_id,record_date)
, 
cte1 as(
select user_id, case when
user_id=lead(user_id,1)over(partition by account_id,user_id order by record_date) and 
timestampdiff(day,record_date,lead(record_date,1)over(partition by account_id,user_id order by record_date)) = 1 and
user_id=lead(user_id,2)over(partition by account_id,user_id order by record_date) and
timestampdiff(day,record_date,lead(record_date,2)over(partition by account_id,user_id order by record_date))=2
then 1 else null end as flg
from cte
)select distinct user_id from cte1 where flg=1
;