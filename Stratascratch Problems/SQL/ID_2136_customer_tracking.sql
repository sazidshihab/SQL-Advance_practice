create database `ID_2136_customer_track`;

create table cust_tracking (
cust_id text,
state bigint,
timestamp timestamp);

insert into cust_tracking values 
('c001', 1, '2024-11-26 07:00:00'),
('c001', 0, '2024-11-26 09:30:00'),
('c001', 1, '2024-11-26 12:00:00'),
('c001', 0, '2024-11-26 14:30:00'),
('c002', 1, '2024-11-26 08:00:00'),
('c002', 0, '2024-11-26 09:30:00'),
('c002', 1, '2024-11-26 11:00:00'),
('c002', 0, '2024-11-26 12:30:00'),
('c002', 1, '2024-11-26 15:00:00'),
('c002', 0, '2024-11-26 16:30:00'),
('c003', 1, '2024-11-26 09:00:00'),
('c003', 0, '2024-11-26 10:30:00'),
('c004', 1, '2024-11-26 10:00:00'),
('c004', 0, '2024-11-26 10:30:00'),
('c004', 1, '2024-11-26 14:00:00'),
('c004', 0, '2024-11-26 15:30:00'),
('c005', 1, '2024-11-26 10:00:00'),
('c005', 0, '2024-11-26 14:30:00'),
('c005', 1, '2024-11-26 15:30:00'),
('c005', 0, '2024-11-26 18:30:00');

with cte as(select cust_id,timestamp,lead(timestamp,1)over(partition by cust_id order by timestamp) as led ,state from cust_tracking
order by 1,2)
select cust_id, sum(timestampdiff(second,timestamp,led)/3600) as diff from cte
where state=1 
group by 1
;