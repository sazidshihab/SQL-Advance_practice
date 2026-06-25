create database `1204. Last Person to Fit in the Bus`;
use `1204. Last Person to Fit in the Bus`

create table `Queue` (
    `person_id` int,
    `person_name` varchar(255),
    `weight` int,
    `turn` int
);

insert into `Queue` VALUES
(5, 'Alice', 250, 1),
(4, 'Bob', 175, 5),
(3, 'Alex', 350, 2),
(6, 'John Cena', 400, 3),
(1, 'Winston', 500, 6),
(2, 'Marie', 200, 4);

with cte as(
select person_name,turn,
case when 
sum(weight)over(order by turn)<=1000 then 1 end as temp
from Queue order by turn)
select person_name from cte where temp=1 order by turn desc limit 1;
