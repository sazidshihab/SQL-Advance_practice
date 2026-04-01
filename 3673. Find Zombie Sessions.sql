create database `3673_Find_Zombie_Sessions`;

create table `app_events` (
event_id int  primary key,
user_id    int  ,
event_timestamp  datetime ,
event_type   varchar(20),
session_id    varchar(10),
event_value    int 
);


insert into app_events VALUES
(1, 201, '2024-03-01 10:00:00', 'app_open', 'S001', NULL),
(2, 201, '2024-03-01 10:05:00', 'scroll', 'S001', 500),
(3, 201, '2024-03-01 10:10:00', 'scroll', 'S001', 750),
(4, 201, '2024-03-01 10:15:00', 'scroll', 'S001', 600),
(5, 201, '2024-03-01 10:20:00', 'scroll', 'S001', 800),
(6, 201, '2024-03-01 10:25:00', 'scroll', 'S001', 550),
(7, 201, '2024-03-01 10:30:00', 'scroll', 'S001', 900),
(8, 201, '2024-03-01 10:35:00', 'app_close', 'S001', NULL),
(9, 202, '2024-03-01 11:00:00', 'app_open', 'S002', NULL),
(10, 202, '2024-03-01 11:02:00', 'click', 'S002', NULL),
(11, 202, '2024-03-01 11:05:00', 'scroll', 'S002', 400),
(12, 202, '2024-03-01 11:08:00', 'click', 'S002', NULL),
(13, 202, '2024-03-01 11:10:00', 'scroll', 'S002', 350),
(14, 202, '2024-03-01 11:15:00', 'purchase', 'S002', 50),
(15, 202, '2024-03-01 11:20:00', 'app_close', 'S002', NULL),
(16, 203, '2024-03-01 12:00:00', 'app_open', 'S003', NULL),
(17, 203, '2024-03-01 12:10:00', 'scroll', 'S003', 1000),
(18, 203, '2024-03-01 12:20:00', 'scroll', 'S003', 1200),
(19, 203, '2024-03-01 12:25:00', 'click', 'S003', NULL),
(20, 203, '2024-03-01 12:30:00', 'scroll', 'S003', 800),
(21, 203, '2024-03-01 12:40:00', 'scroll', 'S003', 900),
(22, 203, '2024-03-01 12:50:00', 'scroll', 'S003', 1100),
(23, 203, '2024-03-01 13:00:00', 'app_close', 'S003', NULL),
(24, 204, '2024-03-01 14:00:00', 'app_open', 'S004', NULL),
(25, 204, '2024-03-01 14:05:00', 'scroll', 'S004', 600),
(26, 204, '2024-03-01 14:08:00', 'scroll', 'S004', 700),
(27, 204, '2024-03-01 14:10:00', 'click', 'S004', NULL),
(28, 204, '2024-03-01 14:12:00', 'app_close', 'S004', NULL);



select distinct session_id,user_id, tim as session_duration_minutes, scroll as scroll_count
     
     from (
        select user_id,session_id,
        sum(coalesce(case when event_type='scroll' then 1 else null end,0))over(partition by user_id,session_id) as scroll,
        sum(coalesce(case when event_type='click' then 1 else null end,0))over(partition by 
        user_id,session_id) as click,
        sum(coalesce(case when event_value is not null and event_type='purchase' then 1 
        else null end,0))over(partition by user_id,session_id)
         as purchase,
         timestampdiff(minute,min(event_timestamp)over(partition by user_id,session_id),
     max(event_timestamp)over(partition by user_id,session_id)) as tim
          from
    app_events
   
    ) as a 
    where scroll>=5  and
    click/scroll<.20 and 
    purchase =0 and 
    tim>=30

    order by scroll desc,session_id asc

     ;