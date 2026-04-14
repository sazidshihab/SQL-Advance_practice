create database `3657_loyal_customers`;
use `3657_loyal_customers`;

create table customer_transactions(
    transaction_id int,
    customer_id int,
    transaction_date date,
    amount decimal(10,2),
    transaction_type varchar(20)
);

insert into customer_transactions values (1, 101, '2024-01-05', 150.00, 'purchase'),
(2, 101, '2024-01-15', 200.00, 'purchase'),
(3, 101, '2024-02-10', 180.00, 'purchase'),
(4, 101, '2024-02-20', 250.00, 'purchase'),
(5, 102, '2024-01-10', 100.00, 'purchase'),
(6, 102, '2024-01-12', 120.00, 'purchase'),
(7, 102, '2024-01-15', 80.00,  'refund'),
(8, 102, '2024-01-18', 90.00,  'refund'),
(9, 102, '2024-02-15', 130.00, 'purchase'),
(10, 103, '2024-01-01', 500.00, 'purchase'),
(11, 103, '2024-01-02', 450.00, 'purchase'),
(12, 103, '2024-01-03', 400.00, 'purchase'),
(13, 104, '2024-01-01', 200.00, 'purchase'),
(14, 104, '2024-02-01', 250.00, 'purchase'),
(15, 104, '2024-02-15', 300.00, 'purchase'),
(16, 104, '2024-03-01', 350.00, 'purchase'),
(17, 104, '2024-03-10', 280.00, 'purchase'),
(18, 104, '2024-03-15', 100.00, 'refund');



with cte as(select customer_id,
count(case when transaction_type='purchase' then 1 end)over(partition by customer_id) as purchase_count,
(timestampdiff(day,min(transaction_date)over(partition by customer_id),max(transaction_date)over(partition by customer_id)))as journey,
count(*)over(partition by customer_id) as total_count,
count(case when transaction_type='refund' then 1 end)over(partition by customer_id) as refund_count
from customer_transactions)
select distinct customer_id from cte
where purchase_count>=3 and journey>=30 and (refund_count/total_count)*100<20
;



# alternative solution

select customer_id
from customer_transactions group by customer_id
having count(case when transaction_type='purchase' then 1 end)>=3 and 
(timestampdiff(day,min(transaction_date),max(transaction_date)))>=30 and 
count(case when transaction_type='refund' then 1 end)/count(*)<0.2 ;