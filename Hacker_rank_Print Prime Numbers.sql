
SET @@cte_max_recursion_depth = 2000;
WITH  RECURSIVE CTE AS(
    SELECT 1 AS RN
    UNION ALL
    SELECT RN+1 FROM CTE 
    WHERE RN<=1000
),CTE1 AS(
    SELECT A.RN FROM CTE A WHERE A.RN>1 AND  NOT EXISTS(
        SELECT 1 FROM CTE B WHERE B.RN>1 AND A.RN%B.RN=0 AND B.RN<A.RN 
    )
), cte2 as(
SELECT REPLACE(GROUP_CONCAT(RN,'&'),',','') as wrd FROM CTE1)
select  concat(replace(right(wrd,1),'&',''),substr(wrd,1,length(wrd)-1)) from cte2;
