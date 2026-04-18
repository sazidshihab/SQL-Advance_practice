create database `3626. Find Stores with Inventory Imbalance`;
use `3626. Find Stores with Inventory Imbalance`;

create table stores (
    store_id int,
    store_name varchar(50),
    location varchar(50)
);
 create table inventory (
    inventory_id int,
    store_id int,
    product_name varchar(50),
    quantity int,
    price decimal(10, 2)
);

INSERT INTO stores (store_id, store_name, location) VALUES
(1, 'Downtown Tech', 'New York'),
(2, 'Suburb Mall', 'Chicago'),
(3, 'City Center', 'Los Angeles'),
(4, 'Corner Shop', 'Miami'),
(5, 'Plaza Store', 'Seattle');

-- Insert into inventory table
INSERT INTO inventory (inventory_id, store_id, product_name, quantity, price) VALUES
(1, 1, 'Laptop', 5, 999.99),
(2, 1, 'Mouse', 50, 19.99),
(3, 1, 'Keyboard', 25, 79.99),
(4, 1, 'Monitor', 15, 299.99),
(5, 2, 'Phone', 3, 699.99),
(6, 2, 'Charger', 100, 25.99),
(7, 2, 'Case', 75, 15.99),
(8, 2, 'Headphones', 20, 149.99),
(9, 3, 'Tablet', 2, 499.99),
(10, 3, 'Stylus', 80, 29.99),
(11, 3, 'Cover', 60, 39.99),
(12, 4, 'Watch', 10, 299.99),
(13, 4, 'Band', 25, 49.99),
(14, 5, 'Camera', 8, 599.99),
(15, 5, 'Lens', 12, 199.99);

with cte as
(select a.store_id, a.store_name, a.location ,
b.product_name, b.quantity, b.price, count(*)over(partition by store_id) as totoal_count,
case when price=max(price)over(partition by store_id) then quantity end as max_product,
case when price=max(price)over(partition by store_id) then product_name end as max_name,
case when price=min(price)over(partition by store_id) then quantity end as min_product,
case when price=min(price)over(partition by store_id) then product_name end as min_name
from stores a join 
inventory b on a.store_id=b.store_id
)
, cte1 as(
select distinct store_id,store_name,location,
max(max_name)over(partition by store_id) as most_exp_product,
max(min_name)over(partition by store_id) as cheapest_product,
max(max_product)over(partition by store_id) as max_count,
max(min_product)over(partition by store_id) as min_count,
if  (max(max_product)over(partition by store_id)<max(min_product)over(partition by store_id),
 round(max(min_product)over(partition by store_id)/max(max_product)over(partition by store_id),2),
 null)
 as imbalance_ratio from cte
 where totoal_count >=3
 )
 select store_id,
 store_name,
 location,
 most_exp_product,
 cheapest_product,
imbalance_ratio
  from cte1
 where max_count<min_count
 order by imbalance_ratio desc, store_name asc
;