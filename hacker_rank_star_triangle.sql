with recursive cte as(
    select 1 as pk,"*" as pkk
    union all
    select pk+1,"*" as pkk from cte where pk<20
)select pkk,
case when pk=1 then '' else pkk end as a_ ,
case when pk in(1,2) then '' else pkk end as a_,
case when pk in(1,2,3) then '' else pkk end as a_ ,
case when pk between 1 and 4 then '' else pkk end as a_,
case when pk between 1 and 5 then '' else pkk end as a_,
case when pk between 1 and 6 then '' else pkk end as a_,
case when pk between 1 and 7 then '' else pkk end as a_,
case when pk between 1 and 8 then '' else pkk end as a_,
case when pk between 1 and 9 then '' else pkk end as a_,
case when pk between 1 and 10 then '' else pkk end as a_,
case when pk between 1 and 11 then '' else pkk end as a_,
case when pk between 1 and 12 then '' else pkk end as a_,
case when pk between 1 and 13 then '' else pkk end as a_,
case when pk between 1 and 14 then '' else pkk end as a_,
case when pk between 1 and 15 then '' else pkk end as a_,
case when pk between 1 and 16 then '' else pkk end as a_,
case when pk between 1 and 17 then '' else pkk end as a_,
case when pk between 1 and 18 then '' else pkk end as a_,
case when pk between 1 and 19 then '' else pkk end as a_,
case when pk between 1 and 20 then '' else pkk end as a_
from cte;

