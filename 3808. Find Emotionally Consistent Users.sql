create database `3808. Find Emotionally Consistent Users`;

create table reactions
(user_id       int,
content_id    int,
reaction     varchar(25));

insert into reactions values 
(1, 101, 'like'),
(1, 102, 'like'),
(1, 103, 'like'),
(1, 104, 'wow'),
(1, 105, 'like'),
(2, 201, 'like'),
(2, 202, 'wow'),
(2, 203, 'sad'),
(2, 204, 'like'),
(2, 205, 'wow'),
(3, 301, 'love'),
(3, 302, 'love'),
(3, 303, 'love'),
(3, 304, 'love'),
(3, 305, 'love');

with cte as(
    select user_id,reaction, dense_rank()over(partition by user_id order by reaction) as rnk from (select user_id, count(content_id)over(partition by user_id) as cnt, reaction  from reactions) as b where cnt>=5
),
 cte1 as(
select user_id, reaction,rnk, count(rnk)over(partition by user_id,reaction,rnk) as rnk_,
count(rnk)over(partition by user_id) as rnk_total
from cte
),
cte2 as(select user_id, reaction as dominant_reaction,rnk_total,rnk_,round((rnk_/rnk_total),2) as reaction_ratio from cte1
group by user_id,reaction,rnk_total,rnk_
)
 select user_id,dominant_reaction, reaction_ratio from cte2 where reaction_ratio>=0.6
order by reaction_ratio desc,user_id asc
;