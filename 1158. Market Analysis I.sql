create database `1158. Market Analysis I`;
use `1158. Market Analysis I`;

create table Users
(
    user_id        int,
    join_date      date,
    favorite_brand varchar(10)
);

create table Orders
(
    order_id      int,
    order_date    date,
    item_id       int,
    buyer_id      int,
    seller_id     int
);

create table Items
(
    item_id       int,
    item_brand    varchar(10)   
);

insert into Users values
(1, '2018-01-01', 'Lenovo'),
(2, '2018-02-09', 'Samsung'),
(3, '2018-01-19', 'LG'),
(4, '2018-05-21', 'HP');

insert into Orders VALUES
(1, '2019-08-01', 4, 1, 2),
(2, '2018-08-02', 2, 1, 3),
(3, '2019-08-03', 3, 2, 3),
(4, '2018-08-04', 1, 4, 2),
(5, '2018-08-04', 1, 3, 4),
(6, '2019-08-05', 2, 2, 4);

insert into Items VALUES
(1, 'Samsung'),
(2, 'Lenovo'),
(3, 'LG'),
(4, 'HP');

with Order_ as(
    select order_date, buyer_id from Orders where year(order_date) = 2019
)
select b.user_id as buyer_id, b.join_date, count(a.order_date) as orders_in_2019
from Users b  left join Order_ a  on a.buyer_id=b.user_id
group by 1,2
order by 1 
;