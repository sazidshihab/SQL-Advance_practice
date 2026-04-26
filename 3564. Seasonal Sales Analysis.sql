-- Active: 1774469870130@@127.0.0.1@3306@185. Department Top Three Salaries
create database `3564. Seasonal Sales Analysis`;
use `3564. Seasonal Sales Analysis`;

create table sales(
    sale_id int primary key,
    product_id int,
    sale_date date,
    quantity int,
    price decimal(10,2)
);

create table products(
    product_id int primary key,
    product_name varchar(255),
    category varchar(255)
);

INSERT INTO products (product_id, product_name, category) VALUES
(1, 'Warm Jacket', 'Apparel'),
(2, 'Designer Jeans', 'Apparel'),
(3, 'Cutting Board', 'Kitchen'),
(4, 'Smart Speaker', 'Tech'),
(5, 'Yoga Mat', 'Fitness');

INSERT INTO sales (sale_id, product_id, sale_date, quantity, price) VALUES
(1, 1, '2023-01-15', 5, 10.00),
(2, 2, '2023-01-20', 4, 15.00),
(3, 3, '2023-03-10', 3, 18.00),
(4, 4, '2023-04-05', 1, 20.00),
(5, 1, '2023-05-20', 2, 10.00),
(6, 2, '2023-06-12', 4, 15.00),
(7, 5, '2023-06-15', 5, 12.00),
(8, 3, '2023-07-24', 2, 18.00),
(9, 4, '2023-08-01', 5, 20.00),
(10, 5, '2023-09-03', 3, 12.00),
(11, 1, '2023-09-25', 6, 10.00),
(12, 2, '2023-11-10', 4, 15.00),
(13, 3, '2023-12-05', 6, 18.00),
(14, 4, '2023-12-22', 3, 20.00),
(15, 5, '2024-02-14', 2, 12.00);

with cte as(
    select 
    case when 
    month(sale_date) in (1,2,12) then 'Winter'
    when month(sale_date) in (3,4,5) then 'Spring'
    when month(sale_date) in (6,7,8) then 'Summer'
    else 'Fall' end as season,
    b.category,
    sum(a.quantity) as total_quantity, round(sum(a.price * a.quantity),2) as total_revenue
    from sales a join products b on
    a.product_id=b.product_id
    group by 1,2
) 
    select 
season, category, total_quantity, total_revenue from (
    select season, category, total_quantity, total_revenue,
rank()over(partition by season order by total_quantity desc,total_revenue desc) as rnkk from cte) as b where rnkk=1
order by 1 asc;
