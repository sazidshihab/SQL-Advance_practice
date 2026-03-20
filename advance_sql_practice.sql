use sql_advance;
/*
SECTION 1 — Advanced Joins & Set Operations
Problem 1 (Medium)
Find customers who purchased products from both categories: Electronics and Furniture.
Expected output:
| customer_id | name |
*/

with cte1 as(
select  customer_id, product_id from order_items left join orders 
on order_items.order_id = orders.order_id)
, cte2 as (
select distinct cte1.customer_id, `name`, category from cte1  left join customer on cte1.customer_id = customer.customer_id 
left join products on cte1.product_id = products.product_id

), cte3 as(
select customer_id,`name`, count( category) over(partition by `name`) as num from cte2 )
select customer_id,`name`  from cte3 where num>1
;


/*
Problem 2 (Medium-Hard)
Find pairs of customers living in the same city using a SELF JOIN.
Return:
| customer1 | customer2 | city |
Do not repeat mirrored pairs.
*/

with cte as(
select distinct a.customer_id, a.`name` as name1, b.`name` as name2, a.city, a.customer_id+b.customer_id as con from customer a join customer b
on a.city=b.city
where a.`name` != b.`name`
), cte1 as(
select name1, name2, city, row_number() over(partition by con) as conn from cte
) select name1,name2, city from cte1
where conn=1
;



/*
Problem 3 (Hard)
Return customers who bought Electronics but never bought Furniture using set operations.
*/

with cte1 as(
select distinct  b.customer_id as customer , c.category as category from order_items a left join orders b on 
a.order_id = b.order_id  left join products c on a.product_id = c.product_id
), cte2  as(
select customer, 
concat(group_concat(category order by 1 separator ',')) as cat from cte1 group by 1)
select * from cte2 where cat not  regexp 'Furniture' and cat like '%Electronics%'
;



/*
SECTION 2 — Advanced Subqueries
Problem 4 (Medium)
Find products whose price is above the average price of their category.
Return:
| product_name | category | price |
*/

select p.product_name , p.category, p.price from products p
where price > (select avg(price)  from products a where category = p.category);



/*
Problem 5 (Hard – Correlated Subquery)
Find customers whose total order value is higher than the average order value of all customers.
*/


select  c.`name`, sum(d.price*a.quantity) as total from order_items a left join orders b on
a.order_id = b.order_id left join customer c on c.customer_id = b.customer_id left join products d 
on d.product_id = a.product_id group by c.customer_id
having sum(d.price*a.quantity) > (
with cte1 as(
select c.`name`, sum(d.price*a.quantity)  as pp from order_items a left join orders b on
a.order_id = b.order_id left join customer c on c.customer_id = b.customer_id left join products d 
on d.product_id = a.product_id  group by c.customer_id)
select avg(pp) as avgg from cte1
);



/*
SECTION 3 — Window Functions
Problem 6 (Medium)
Rank products by price within each category.
Return:
| product_name | category | price | rank |
*/

select product_name, category, price, rank() over(partition by category order by price desc) as `rank` from products;


/*
Problem 7 (Medium-Hard)
Calculate total revenue for each order and assign a ROW_NUMBER ranking by revenue (highest first).
*/


select a.order_id, sum(b.price* a.quantity)  as revenue , row_number() over(order by sum(b.price* a.quantity) desc ) as roww from order_items a left join products b on
a.product_id = b.product_id group by a.order_id;


/*
Problem 8 (Hard)
Calculate daily revenue change compared to the previous order date using LAG.
Return:
| order_date | revenue | previous_revenue | change |
*/

with cte as (
select a.order_id, a.product_id , b.order_date as order_date, c.price*a.quantity as revenue from order_items a left join orders b on
a.order_id = b.order_id left join products c on a.product_id = c.product_id order by b.order_date), cte1 as(
select order_date, sum(revenue) as revenue from cte group by 1
)
select order_date, revenue, lag(revenue, 1) over(order by order_date) as previous_revenue, abs(revenue - lag(revenue, 1) over(order by order_date)) as `change`
from cte1
;



/*
SECTION 4 — Common Table Expressions (CTE)
Problem 9 (Medium)
Using a CTE, calculate total revenue per customer and return customers who spent more than 1000.

*/

with cte as (
select b.customer_id as  cus_id, c.price*a.quantity as revenue from order_items a left join orders b on
a.order_id = b.order_id left join products c on c.product_id = a.product_id)
select cus_id, sum(revenue) as revenue from cte group by 1
having sum(revenue) > 1000
;


/*
Problem 10 (Hard)
Using a CTE, find the top-selling product in each category based on total quantity sold.
*/

with cte as (
select   b.category as category, a.product_id as product_id,   sum(a.quantity) as quantity from order_items a left join products b on
a.product_id = b.product_id group by 1,2), cte1 as(
select category, product_id, rank() over(partition by category order by quantity desc) as rankk from cte)
select * from cte1 where rankk = 1
;



/*
SECTION 5 — Query Optimization
Problem 11 (Conceptual – Hard)

You run this query:

SELECT *
FROM orders
WHERE YEAR(order_date) = 2023;

Explain:
1️⃣ Why this query may be slow
2️⃣ Rewrite it to make it index-friendly
*/

SELECT *
FROM orders
WHERE month(order_date) = 06;



alter table orders
drop index id_order_date;


EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE order_date > '2023-05-31'
and order_date < '2023-06-30';

create index id_order_date on orders(order_date);




/*
SECTION 6 — Data Integrity & Constraints
Problem 12 (Medium)
Modify the order_items table so that:
quantity must be greater than 0
order_id must reference orders table.
Write the SQL constraints.
*/

alter table order_items
add constraint cons_quantity 
check(quantity>0);

select * from information_schema.table_constraints, information_schema.check_constraints
where table_name = 'order_items';



/*
SECTION 7 — Prepared Statements
Problem 13 (Hard)
Write a prepared statement that retrieves all orders for a given customer_id.
Example call:
EXECUTE get_orders(2);
*/

prepare get_orders  from '
select c.customer_id,c.`name`, a.order_id, d.product_name from order_items a left join orders b on a.order_id = b.order_id
left join customer c on b.customer_id = c.customer_id left join products d on d.product_id = a.product_id
where b.customer_id = ?'
;
set @id = 1;
execute get_orders using @id;



/*
Problem 14
Find customers who purchased in two consecutive months.
*/

with cte as(
select b.order_date,c.customer_id,c.`name` from orders b left join  customer c on b.customer_id = c.customer_id ),
cte1 as(
 select `name`,date_format(order_date,'%Y-%m') as order_date, lag(date_format(order_date,'%Y-%m'),1) over(partition by customer_id order by order_date) as previous from cte),
 cte2 as(
 select `name` ,( case 
 when date_format(date_add(concat(previous, '-01'), interval 1 month),'%Y-%m') =  order_date then 1 else 0 end
 ) as consecutive from cte1 )
 select  distinct `name` from cte2 where consecutive = 1;


/*
Problem 15
Find the top 2 highest revenue customers in each city using window functions.
*/

with cte as(
select c.city,c.`name`, sum( d.price*a.quantity) as price, c.customer_id from order_items a left join orders b on a.order_id = b.order_id 
left join customer c on c.customer_id = b.customer_id join products d on d.product_id = a.product_id 
group by 1,2,4), cte1 as(
select *, row_number() over(partition by city order by price desc ) as rankk from cte)
select city, `name`, price from cte1 where rankk between 1 and 2
;


/*
Practice created from GPT ends here!!!!
*/





/*
*************************************************************************************************************************
Problem from Hackerrank advance: https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem?isFullScreen=true
Creating table and solving
*************************************************************************************************************************
*/


create database hacker_rank_15days;

use  hacker_rank_15days;

create table Hackers (
hacker_id INT PRIMARY KEY,
    `name` VARCHAR(50)
);


create table Submissions (
submission_date date,
submission_id int,
hacker_id  int,
score int,
foreign key Submission(hacker_id) references hackers(hacker_id)
);


insert into Hackers values
(20706,'sazid')
;

insert into Submissions values
('2016-03-03',66,20706,100),
('2016-03-04',67,20706,80),
('2016-03-05',68,20706,90),
('2016-03-06',69,20706,95)
;



/*
Solution with using window function.
*/
with cte1 as(
select  hacker_id,submission_date, count(*) as submitted, lag(submission_date,1) over(partition by hacker_id order by submission_date) as pkk from Submissions group by 1,2 order by 1
),

cte3 as (
select hacker_id, submission_date, submitted, sum(
case 
when submission_date = date_add(pkk,interval 1 day)  then 1 else 0 end) over(partition by hacker_id order by submission_date) as checkk from cte1 
),

valid as(
select  a.submission_date,a.hacker_id,c.`name` , 
datediff(submission_date,'2016-03-01') as date_diff  
, checkk , a.submitted, rank() over(partition by a.submission_date order by a.submitted , a.hacker_id desc) as topper
from cte3 a join  Hackers c 
on c.hacker_id = a.hacker_id
 order by 1,7 desc
 ), 
 
 cte2 as(
select submission_date, sum(
case when date_diff = checkk then 1 else 0 end
) over(partition by submission_date) as total_hacker, hacker_id, `name` , topper, max(topper) over(partition by submission_date) as maxx
from valid 
), cte as(
select submission_date, total_hacker, hacker_id, `name` from cte2 where topper = maxx)
select * from cte
;


/*

*/





select * from Hackers;
select * from Submissions;
















