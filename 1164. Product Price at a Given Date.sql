create database `1164. Product Price at a Given Date`;
use `1164. Product Price at a Given Date`;

create table Products(
    product_id    int,
    new_price     int,
    change_date   date
);

insert into Products VALUES
(1, 20, '2019-08-14'),
(2, 50, '2019-08-14'),
(1, 30, '2019-08-15'),
(1, 35, '2019-08-16'),
(2, 65, '2019-08-17'),
(3, 20, '2019-08-18');

with cte as(
select product_id, new_price, case when change_date=max(case when change_date<='2019-08-16' then change_date end)over(partition by product_id) then new_price else null end as price from Products)
select product_id, coalesce(max(price),10) as price from cte group by 1
;