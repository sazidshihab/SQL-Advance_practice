create database `180. Consecutive Numbers`;
use `180. Consecutive Numbers`;

create table Logs (
    id int,
    num int
);

insert into Logs (id, num) values (1, 1);
insert into Logs (id, num) values (2, 1);
insert into Logs (id, num) values (3, 1);
insert into Logs (id, num) values (4, 2);
insert into Logs (id, num) values (5, 1);
insert into Logs (id, num) values (6, 2);
insert into Logs (id, num) values (7, 2);


with cte as(
select distinct case when 
num=lead(num,1)over(order by id) and num=lead(num,2)over(order by id) then num end as ConsecutiveNums
from Logs)
select * from cte where ConsecutiveNums is not null;