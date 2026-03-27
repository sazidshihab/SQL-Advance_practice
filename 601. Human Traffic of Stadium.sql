use sql_advance;

show tables;

create database human_traffic_601;

create table Stadium (
    `id` int,
    visit_date date,
    people int
);

insert into Stadium values
(1, '2017-05-01', 150),
(2, '2017-05-02', 150),
(3, '2017-05-03', 150),
(4, '2017-05-04', 150),
(5, '2017-05-05', 50),
(6, '2017-05-06', 50),
(7, '2017-05-07', 150),
(8, '2017-05-08', 150),
(9, '2017-05-09', 150),
(10, '2017-05-10', 150),
(11, '2017-05-11', 150),
(12, '2017-05-12', 50),
(13, '2017-05-13', 50),
(14, '2017-05-14', 150),
(15, '2017-05-15', 150),
(16, '2017-05-16', 150),
(17, '2017-05-17', 150),
(18, '2017-05-18', 150),
(19, '2017-05-19', 50),
(20, '2017-05-20', 50),
(21, '2017-05-21', 150),
(22, '2017-05-22', 150),
(23, '2017-05-23', 150),
(24, '2017-05-24', 150),
(25, '2017-05-25', 150),
(26, '2017-05-26', 50),
(27, '2017-05-27', 50),
(28, '2017-05-28', 150),
(29, '2017-05-29', 150),
(30, '2017-06-01', 150);

select * from Stadium;

with cte as(
select *, 
case when id+1=lead(id,1)over(order by id) and people>=100 and lead(people,1)over(order by id) >=100    and
id=lag(id,1)over(order by id)+1 and lag(people,1)over(order by id)>=100 then
1 else 0 end as flag 
from Stadium

), cte1 as(select *,
case when flag =0 and (lag(flag,1)over(order by id)=1 or lead(flag,1)over(order by id)=1) 
then 1 else 0 end as flag2
 from cte)
 select id, visit_date, people from cte1
 where flag =1 or flag2=1
;