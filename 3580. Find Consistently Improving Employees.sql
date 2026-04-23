create database `3580. Find Consistently Improving Employees`;
use `3580. Find Consistently Improving Employees`;

create table employees(
    employee_id int,
    name varchar(255)
);

create table performance_reviews(
    review_id int,
    employee_id int,
    review_date date,
    rating int
);

insert into employees values
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Carol Davis'),
(4, 'David Wilson'),
(5, 'Emma Brown');

insert into performance_reviews values  
(1, 1, '2023-01-15', 2),
(2, 1, '2023-04-15', 3),
(3, 1, '2023-07-15', 4),
(4, 1, '2023-10-15', 5),
(5, 2, '2023-02-01', 3),
(6, 2, '2023-05-01', 2),
(7, 2, '2023-08-01', 4),
(8, 2, '2023-11-01', 5),
(9, 3, '2023-03-10', 1),
(10, 3, '2023-06-10', 2),
(11, 3, '2023-09-10', 3),
(12, 3, '2023-12-10', 4),
(13, 4, '2023-01-20', 4),
(14, 4, '2023-04-20', 4),
(15, 4, '2023-07-20', 4),
(16, 5, '2023-02-15', 3),
(17, 5, '2023-05-15', 2);

with cte as (
select  a.employee_id,
        b.name, 
        a.review_date,
        a.rating ,
        row_number()over(partition by employee_id order by 
        review_date desc) as rnk, 
        count(*)over(partition by employee_id) as min_,
        case when review_date=max(review_date)over(partition by employee_id)
        then rating-lead(rating,2)over(partition by employee_id order by review_date desc) end 
        as improvement_score
from performance_reviews a 
join employees b on a.employee_id=b.employee_id
order by employee_id, review_date desc 
) , cte1 as (
select *, 
dense_rank()over(partition by employee_id order by  rating desc ) as rnk_
from cte
where rnk<=3 and min_>=3 
), cte2 as
(select *,
count(case when rnk= rnk_ then 1 end)over(partition by employee_id) as flag 
from cte1 where rnk=rnk_ 
)
select  employee_id,
        name,
        improvement_score
from cte2 where flag=3 and improvement_score is not null
order by improvement_score desc, name;