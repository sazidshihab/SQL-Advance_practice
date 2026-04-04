create database `3554_category_recommend`;

create table ProductPurchases(
user_id      int,
product_id  int,
quantity     int); 

insert into ProductPurchases values
(1, 101, 2),
(1, 102, 1),
(1, 201, 3),
(1, 301, 1),
(2, 101, 1),
(2, 102, 2),
(2, 103, 1),
(2, 201, 5),
(3, 101, 2),
(3, 103, 1),
(3, 301, 4),
(3, 401, 2),
(4, 101, 1),
(4, 201, 3),
(4, 301, 1),
(4, 401, 2),
(5, 102, 2),
(5, 103, 1),
(5, 201, 2),
(5, 202, 3);



create table ProductInfo (
product_id   int,
category    varchar(30),
price       decimal
);
insert into `ProductInfo` VALUES
(101, 'Electronics', 100),
(102, 'Books', 20),
(103, 'Books', 35),
(201, 'Clothing', 45),
(202, 'Clothing', 60),
(301, 'Sports', 75),
(401, 'Kitchen', 50);



with cte as(
select a.user_id,  b.category  from
ProductPurchases a join ProductInfo b on a.product_id=b.product_id
where a.quantity >0  
),

cte1 as(
select a.user_id, a.category as cat1, b.category as cat2 from cte a cross join
cte b 
where a.category!=b.category and  a.category<b.category and a.user_id=b.user_id
order by a.user_id,a.category
), 

cte2 as(
select distinct a.category as cat1 , b.category as cat2 from ProductInfo a cross join   ProductInfo b
where a.category!=b.category and a.category<b.category 
order by a.category
),

cte3 as(
select distinct a.user_id  customer_count, a.cat1 as `1.cat1`,a.cat2 as `1.cat2`,
b.cat1 as `2.cat1`, b.cat2 as `2.cat2` from cte1 a join cte2 b
on a.cat1=b.cat1 and a.cat2=b.cat2 
)select `1.cat1` as category1, `1.cat2` as category2 , count(customer_count) as customer_count from cte3 
group by `1.cat1`,`1.cat2`,`2.cat1`,`2.cat2`
having customer_count >=3
order by customer_count desc, category1 asc, category2 asc
;