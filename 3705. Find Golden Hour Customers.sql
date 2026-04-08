create database `3705 Find Golden Hour Customers`;

create table restaurant_orders(
order_id         int,
customer_id       int,
order_timestamp datetime,
order_amount      decimal,
payment_method    varchar(15),
order_rating     int);


insert into restaurant_orders values 
(1, 101, '2024-03-01 12:30:00', 25.50, 'card', 5),
(2, 101, '2024-03-02 19:15:00', 32.00, 'app', 4),
(3, 101, '2024-03-03 13:45:00', 28.75, 'card', 5),
(4, 101, '2024-03-04 20:30:00', 41.00, 'app', NULL),
(5, 102, '2024-03-01 11:30:00', 18.50, 'cash', 4),
(6, 102, '2024-03-02 12:00:00', 22.00, 'card', 3),
(7, 102, '2024-03-03 15:30:00', 19.75, 'cash', NULL),
(8, 103, '2024-03-01 19:00:00', 55.00, 'app', 5),
(9, 103, '2024-03-02 20:45:00', 48.50, 'app', 4),
(10, 103, '2024-03-03 18:30:00', 62.00, 'card', 5),
(11, 104, '2024-03-01 10:00:00', 15.00, 'cash', 3),
(12, 104, '2024-03-02 09:30:00', 18.00, 'cash', 2),
(13, 104, '2024-03-03 16:00:00', 20.00, 'card', 3),
(14, 105, '2024-03-01 12:15:00', 30.00, 'app', 4),
(15, 105, '2024-03-02 13:00:00', 35.50, 'app', 5),
(16, 105, '2024-03-03 11:45:00', 28.00, 'app', NULL);

with cte as
(
    select customer_id, time(order_timestamp) as order_timestamp, count(customer_id)over(partition by customer_id) as cnt,
    round(avg(order_rating)over(partition by customer_id),2) as avg_rt,
    count(order_rating)over(partition by customer_id) as rt_cnt 
    from restaurant_orders
),
cte1 as
(select customer_id,order_timestamp,cnt,avg_rt,(rt_cnt/cnt)*100 as rt_per from cte
),cte3 as 
(
    select customer_id,order_timestamp,cnt,avg_rt,rt_per from cte1
    where 
    cnt>=3 and rt_per>=50 and avg_rt>=4.0 and 
(order_timestamp between '11:00' and '14:00' 
or order_timestamp between '18:00' and '21:00')
),
 cte2 as
 (
select distinct customer_id,cnt as total_orders, round((count(order_timestamp)over(partition by customer_id)/cnt)*100) as peak_hour_percentage,avg_rt as average_rating from cte3
order by avg_rt desc,customer_id desc)
select * from cte2 where peak_hour_percentage>=60
;