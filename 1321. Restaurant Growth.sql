create database `1321. Restaurant Growth`;
use `1321. Restaurant Growth`;

create table Customer
(customer_id    int,
name          varchar(20),
visited_on    date,
amount        int );

insert into Customer VALUES
(1, 'Jhon', '2019-01-01', 100),
(2, 'Daniel', '2019-01-02', 110),
(3, 'Jade', '2019-01-03', 120),
(4, 'Khaled', '2019-01-04', 130),
(5, 'Winston', '2019-01-05', 110),
(6, 'Elvis', '2019-01-06', 140),
(7, 'Anna', '2019-01-07', 150),
(8, 'Maria', '2019-01-08', 80),
(9, 'Jaze', '2019-01-09', 110),
(1, 'Jhon', '2019-01-10', 130),
(3, 'Jade', '2019-01-10', 150);

with cte as(
    select visited_on, sum(amount) as amount, sum(amount) as average_amount
    from Customer group by 1 order by visited_on
), cte1 as(
select visited_on ,
sum(amount)over(rows between 6 preceding and current row) as amount,
avg(average_amount)over(rows between 6 preceding and current row) as average_amount,
case when 
datediff(visited_on, lag(visited_on,6)over(order by visited_on)) =6
then lag(visited_on,6)over(order by visited_on) end as temp
from cte
)
select visited_on, amount, round(average_amount,2) as average_amount
from cte1 where temp is not null
;