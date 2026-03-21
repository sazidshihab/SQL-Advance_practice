/*
## Problem link: https://platform.stratascratch.com/coding/10564-product-engagement-momentum-shifts?code_type=3
*/



create database product_engagement_advance;
use product_engagement_advance;
create table product_engagement(
product_id int,
product_name text,
month_start date,
monthly_active_users int
);

/*drop table product_engagement; */

insert into product_engagement values
(1,'TikTok Lite','2023-05-01',63000),
(1,'TikTok Lite','2023-06-01',62000),
(1,'TikTok Lite','2023-07-01',61000),
(1,'TikTok Lite','2023-08-01',62000),
(1,'TikTok Lite','2023-09-01',68000),
(1,'TikTok Lite','2023-10-01',60000),
(1,'TikTok Lite','2023-11-01',58000),
(1,'TikTok Lite','2023-12-01',55000),
(1,'TikTok Lite','2024-01-01',50000),
(1,'TikTok Lite','2024-02-01',45000),
(1,'TikTok Lite','2024-03-01',38000),
(1,'TikTok Lite','2024-04-01',35000),
(1,'TikTok Lite','2024-05-01',37000),
(1,'TikTok Lite','2024-06-01',42000),
(1,'TikTok Lite','2024-07-01',48000),
(1,'TikTok Lite','2024-08-01',55000),
(1,'TikTok Lite','2024-09-01',65000),

(2,'Instagram Reels','2024-01-01',80000),
(2,'Instagram Reels','2024-02-01',75000),
(2,'Instagram Reels','2024-03-01',68000),
(2,'Instagram Reels','2024-04-01',60000),
(2,'Instagram Reels','2024-05-01',62000),
(2,'Instagram Reels','2024-06-01',70000),
(2,'Instagram Reels','2024-07-01',78000),
(2,'Instagram Reels','2024-08-01',85000),
(2,'Instagram Reels','2024-09-01',100000),

(3,'Facebook Dating','2024-01-01',30000),
(3,'Facebook Dating','2024-02-01',28000),
(3,'Facebook Dating','2024-03-01',25000),
(3,'Facebook Dating','2024-05-01',24000),
(3,'Facebook Dating','2024-06-01',23000),
(3,'Facebook Dating','2024-07-01',25000),
(3,'Facebook Dating','2024-08-01',27000),
(3,'Facebook Dating','2024-09-01',29000),

(4,'Twitter Spaces','2024-01-01',45000),
(4,'Twitter Spaces','2024-02-01',42000),
(4,'Twitter Spaces','2024-03-01',38000),
(4,'Twitter Spaces','2024-04-01',32000),
(4,'Twitter Spaces','2024-05-01',28000),
(4,'Twitter Spaces','2024-06-01',25000),
(4,'Twitter Spaces','2024-07-01',22000),
(4,'Twitter Spaces','2024-08-01',20000),
(4,'Twitter Spaces','2024-09-01',18000),

(5,'YouTube Shorts','2024-01-01',90000),
(5,'YouTube Shorts','2024-02-01',92000),
(5,'YouTube Shorts','2024-03-01',95000),
(5,'YouTube Shorts','2024-04-01',98000),
(5,'YouTube Shorts','2024-05-01',105000),
(5,'YouTube Shorts','2024-06-01',112000),
(5,'YouTube Shorts','2024-07-01',120000),
(5,'YouTube Shorts','2024-08-01',128000),
(5,'YouTube Shorts','2024-09-01',135000),

(6,'Snapchat Plus','2024-01-01',40000),
(6,'Snapchat Plus','2024-02-01',38000),
(6,'Snapchat Plus','2024-03-01',38000),
(6,'Snapchat Plus','2024-04-01',38000),
(6,'Snapchat Plus','2024-05-01',37000),
(6,'Snapchat Plus','2024-06-01',40000),
(6,'Snapchat Plus','2024-07-01',38000),
(6,'Snapchat Plus','2024-08-01',41000),
(6,'Snapchat Plus','2024-09-01',43000),

(7,'LinkedIn Events','2024-01-01',35000),
(7,'LinkedIn Events','2024-02-01',32000),
(7,'LinkedIn Events','2024-03-01',28000),
(7,'LinkedIn Events','2024-04-01',25000),
(7,'LinkedIn Events','2024-06-01',30000),
(7,'LinkedIn Events','2024-07-01',34000),
(7,'LinkedIn Events','2024-08-01',38000),
(7,'LinkedIn Events','2024-09-01',42000),

(8,'Pinterest TV','2024-01-01',20000),
(8,'Pinterest TV','2024-02-01',18000),
(8,'Pinterest TV','2024-04-01',12000),
(8,'Pinterest TV','2024-05-01',10000),
(8,'Pinterest TV','2024-06-01',11000),
(8,'Pinterest TV','2024-07-01',15000),
(8,'Pinterest TV','2024-08-01',20000),
(8,'Pinterest TV','2024-09-01',25000),

(9,   'Test App',   '2024-01-01',   100),
(9,   'Test App',  '2024-02-01',   90),
(9,   'Test App',  '2024-03-01',   80),
(9,   'Test App',   '2024-04-01',   70),
(9,   'Test App',   '2024-05-01',   75),
(9,   'Test App',   '2024-06-01',   85),
(9,   'Test App',   '2024-07-01',   95),
(9,   'Test App',   '2024-08-01',   60),
(9,   'Test App',   '2024-09-01',   200),

(9,   'Test App',   '2024-10-01',   250),
(9,   'Test App',  '2024-11-01',   180),
(9,   'Test App',  '2024-12-01',   160),
(9,   'Test App',   '2025-01-01',   155),
(9,   'Test App',   '2025-02-01',   150),
(9,   'Test App',   '2025-03-01',   145),
(9,   'Test App',   '2025-04-01',   150),
(9,   'Test App',   '2025-05-01',   155),
(9,   'Test App',   '2025-06-01',   300),

(11,   'Edge Case',   '2024-01-01',   100),
(11,   'Edge Case',   '2024-02-01',   90),
(11,   'Edge Case',   '2024-03-01',   80),
(11,   'Edge Case',   '2024-04-01',   70),
(11,   'Edge Case',   '2024-05-01',   75),
(11,   'Edge Case',   '2024-06-01',   85),
(11,   'Edge Case',   '2024-07-01',   95),
(11,  'Edge Case',   '2024-08-01',   200),

(11,   'Edge Case',   '2024-09-01',   150),
(11,   'Edge Case',   '2024-10-01',   140),
(11,   'Edge Case',   '2024-11-01',   130),
(11,  'Edge Case',   '2024-12-01',   120),
(11,   'Edge Case',   '2025-01-01',   75),
(11,   'Edge Case',   '2025-02-01',   85),
(11,   'Edge Case',   '2025-03-01',   95),
(11,   'Edge Case',   '2025-04-01',   300),

(1, 'A', '2024-01-01', 100),
(1, 'A', '2024-02-01', 90),
(1, 'A', '2024-03-01', 90),
(1, 'A', '2024-04-01', 80),
(1, 'A', '2024-05-01', 70),  
(1, 'A', '2024-06-01', 75),
(1, 'A', '2024-07-01', 85),
(1, 'A', '2024-08-01', 95),

(100, 'Hard Case', '2024-01-01', 100),
(100, 'Hard Case', '2024-02-01', 95),
(100, 'Hard Case', '2024-03-01', 90),
(100, 'Hard Case', '2024-04-01', 85),
(100, 'Hard Case', '2024-05-01', 80),   -- 5 declines

(100, 'Hard Case', '2024-06-01', 82),   -- growth starts
(100, 'Hard Case', '2024-07-01', 84),
(100, 'Hard Case', '2024-08-01', 86),

-- small dip inside growth
(100, 'Hard Case', '2024-09-01', 83),   -- breaks monotonicity

-- then strong growth again
(100, 'Hard Case', '2024-10-01', 90),
(100, 'Hard Case', '2024-11-01', 100),
(100, 'Hard Case', '2024-12-01', 110),



(200, 'Shifted Case', '2024-01-01', 100),
(200, 'Shifted Case', '2024-02-01', 95),
(200, 'Shifted Case', '2024-03-01', 90),
(200, 'Shifted Case', '2024-04-01', 85),
(200, 'Shifted Case', '2024-05-01', 80),  -- long decline

-- tiny delay before growth becomes consistent
(200, 'Shifted Case', '2024-06-01', 81),  -- small up
(200, 'Shifted Case', '2024-07-01', 80),  -- small drop again ❗

-- now real growth starts
(200, 'Shifted Case', '2024-08-01', 82),
(200, 'Shifted Case', '2024-09-01', 85),
(200, 'Shifted Case', '2024-10-01', 90),
(200, 'Shifted Case', '2024-11-01', 100),
(200, 'Shifted Case', '2024-12-01', 110),




(300, 'True Edge', '2024-01-01', 100),
(300, 'True Edge', '2024-02-01', 95),
(300, 'True Edge', '2024-03-01', 90),
(300, 'True Edge', '2024-04-01', 85),
(300, 'True Edge', '2024-05-01', 80),

(300, 'True Edge', '2024-06-01', 82),
(300, 'True Edge', '2024-07-01', 84),
(300, 'True Edge', '2024-08-01', 86),

(300, 'True Edge', '2024-09-01', 88),
(300, 'True Edge', '2024-10-01', 90),
(300, 'True Edge', '2024-11-01', 92);

/*
(1, 'A', '2024-09-01', 60),
(1, 'A', '2024-10-01', 65),
(1, 'A', '2024-11-01', 75),
(1, 'A', '2024-12-01', 85);
*/






with minimum_seq as
(
select *, 
( case 
when lead(monthly_active_users,1)over(partition by product_name order by month_start)<monthly_active_users 
and 
lead(monthly_active_users,2)over(partition by product_name order by month_start) < lead(monthly_active_users,1)over(partition by product_name order by month_start)
and
lead(monthly_active_users,3)over(partition by product_name order by month_start) < lead(monthly_active_users,2)over(partition by product_name order by month_start)
and
lead(monthly_active_users,4)over(partition by product_name order by month_start) > lead(monthly_active_users,3)over(partition by product_name order by month_start)
and
lead(monthly_active_users,5)over(partition by product_name order by month_start) > lead(monthly_active_users,4)over(partition by product_name order by month_start)
and
lead(monthly_active_users,6)over(partition by product_name order by month_start) > lead(monthly_active_users,5)over(partition by product_name order by month_start)
and
timestampdiff(month,month_start,lead(month_start,6)over(partition by product_name order by month_start)) = 6
then 1 else 0 end
) as valid
from product_engagement
), 

    
minimum_seq_1 as(
select product_name, month_start, monthly_active_users,
(case
when valid =1  then lead(month_start,3)over(partition by product_name order by month_start) else 0 end
)as growth_resumed,
(case
when valid =1 then lead(month_start,6)over(partition by product_name order by month_start) else 0 end
)as upper_date_might,
(case
when valid =1 then month_start else 0 end
)as bound_start,
valid from minimum_seq
), 

    
set_boundaries as(
select product_name, month_start, monthly_active_users, 
case  when growth_resumed=0 then max(growth_resumed)over(partition by product_name order by month_start rows between unbounded preceding
and current row) else growth_resumed end as growth_resumed ,
max(upper_date_might)over(partition by product_name order by month_start) as upper_date_might,
max(bound_start)over(partition by product_name order by month_start) as bound_start,
valid from minimum_seq_1
), 

    
set_boundaries_1 as(
select product_name, month_start, monthly_active_users, growth_resumed,upper_date_might,
(case when bound_start=0  and timestampdiff(month,month_start, lead(month_start,1)over(partition by product_name order by month_start))=1 
    then (case when monthly_active_users>lead(monthly_active_users,1)over(PARTITION BY product_name ORDER BY month_start
   ) then 0 else 1 end)
    else null end) as decline_start,
(case when upper_date_might!=0 and month_start>=upper_date_might 
then case when
 timestampdiff(month,month_start, lead(month_start,1)over(partition by product_name order by month_start))=1 
 then monthly_active_users else monthly_active_users end 
else 0 end) as max_price, valid
from set_boundaries
),

    
set_boundaries_2 as(
select product_name, month_start, monthly_active_users, growth_resumed,upper_date_might,
(case when max(decline_start)over(partition by product_name order by month_start rows between current row and unbounded following )=0 and upper_date_might =0
then month_start else '2030-01-01' end) as decline_month, max_price,  valid 
from set_boundaries_1
),

    
peak_lower as(
select product_name, month_start, monthly_active_users, growth_resumed, min(decline_month)over(partition by product_name ) as decline_start,
max(max_price)over(partition by product_name,growth_resumed ) as peak_point, 
case when month_start=growth_resumed then monthly_active_users else 0 end as lower_point, valid
from set_boundaries_2
),

    
pre_final as(
select product_name, 
case when month_start>decline_start then decline_start else month_start end  as decline_start, 
growth_resumed, peak_point, max(lower_point)over(partition by product_name,growth_resumed) as lower_point, valid 
from peak_lower),
<<<<<<< HEAD
 final as(
select product_name,decline_start ,date_add(growth_resumed,interval 1 month)as growth_resumed , (peak_point-lower_point)/lower_point as ratio
=======

    
final as(
select product_name,decline_start,growth_resumed, (peak_point-lower_point)/lower_point as ratio
>>>>>>> 3c4e35580188a6aaeab362426266edaf7b45e5ba
from pre_final where valid=1)

    
select * from final;
;














