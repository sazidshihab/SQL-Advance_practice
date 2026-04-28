-- Active: 1774469870130@@127.0.0.1@3306
create database `3521. Find Product Recommendation Pairs`;
use `3521. Find Product Recommendation Pairs`;

create table ProductPurchases (
    user_id int,
    product_id int,
    quantity int
);

create table ProductInfo(
    product_id int,
    category varchar(255),
    price decimal(10,2)
);

insert into ProductPurchases values
(1, 101, 2),
(1, 102, 1),
(1, 103, 3),
(2, 101, 1),
(2, 102, 5),
(2, 104, 1),
(3, 101, 2),
(3, 103, 1),
(3, 105, 4),
(4, 101, 1),
(4, 102, 1),
(4, 103, 2),
(4, 104, 3),
(5, 102, 2),
(5, 104, 1);

insert into ProductInfo values
(101, 'Electronics', 100),
(102, 'Books', 20),
(103, 'Clothing', 35),
(104, 'Kitchen', 50),
(105, 'Sports', 75);

    with cte as
    (select  a.product_id as product1_id, b.product_id as product2_id,
    count(*)  as customer_count 
    from ProductPurchases a join ProductPurchases b 
    on a.user_id=b.user_id and a.product_id<b.product_id
    group by 1,2
    having customer_count>=3)
    select a.product1_id,a.product2_id,
    b.category as product1_category, c.category as product2_category, a.customer_count
    from cte a join ProductInfo b on a.product1_id=b.product_id
    join ProductInfo c on a.product2_id=c.product_id
    order by customer_count desc,product1_id,product2_id;

