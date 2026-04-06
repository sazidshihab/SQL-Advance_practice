create database `3716. Find Churn Risk Customers`;

create table subscription_events (
event_id          int,
user_id          int,
event_date       date,
event_type       varchar(30),
plan_name        varchar(30),
monthly_amount   decimal
);

insert into subscription_events values (1, 501, '2024-01-01', 'start', 'premium', 29.99),
(2, 501, '2024-02-15', 'downgrade', 'standard', 19.99),
(3, 501, '2024-03-20', 'downgrade', 'basic', 9.99),
(4, 502, '2024-01-05', 'start', 'standard', 19.99),
(5, 502, '2024-02-10', 'upgrade', 'premium', 29.99),
(6, 502, '2024-03-15', 'downgrade', 'basic', 9.99),
(7, 503, '2024-01-10', 'start', 'basic', 9.99),
(8, 503, '2024-02-20', 'upgrade', 'standard', 19.99),
(9, 503, '2024-03-25', 'upgrade', 'premium', 29.99),
(10, 504, '2024-01-15', 'start', 'premium', 29.99),
(11, 504, '2024-03-01', 'downgrade', 'standard', 19.99),
(12, 504, '2024-03-30', 'cancel', NULL, 0.00),
(13, 505, '2024-02-01', 'start', 'basic', 9.99),
(14, 505, '2024-02-28', 'upgrade', 'standard', 19.99),
(15, 506, '2024-01-20', 'start', 'premium', 29.99),
(16, 506, '2024-03-10', 'downgrade', 'basic', 9.99);


with cte as (
    select user_id, event_date,event_type,plan_name,monthly_amount,max_amount,min_amount,max_date,min_date from (
        select user_id, event_date,event_type,plan_name,monthly_amount, 
        max(event_date)over(partition by user_id) as max_date,
        min(event_date)over(partition by user_id) as min_date,
        max(monthly_amount)over(partition by user_id) as max_amount,
        min(monthly_amount)over(partition by user_id) as min_amount
         from   
        subscription_events where user_id not in (select user_id from
        subscription_events where  plan_name is NULL ) and user_id in (select 
        user_id from subscription_events where event_type='downgrade')
         
    ) as a where timestampdiff(day,min_date,max_date) >=60
) , cte1 as(
select user_id,plan_name as current_plan, monthly_amount as current_monthly_amount, max_amount as max_historical_amount, timestampdiff(day,min_date,max_date) as days_as_subscriber, monthly_amount<(max_amount/2) as flag from cte
having flag=1
order by days_as_subscriber desc,user_id asc)
select user_id,current_plan,current_monthly_amount,max_historical_amount,days_as_subscriber from cte1  ;