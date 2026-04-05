create database `585. Investments in 2016`;

create table  Insurance(
pid         int,
tiv_2015    float,
tiv_2016     float ,
lat         float,
lon         float);

insert into  Insurance values
(1, 10, 5, 10, 10),
(2, 20, 20, 20, 20),
(3, 10, 30, 20, 20),
(4, 10, 40, 40, 40);

with cte as (
select pid, tiv_2015, concat(lat,',',lon) as loc , 
 tiv_2016, count(tiv_2015)over(partition by tiv_2015) as cnt from Insurance 
 order by tiv_2015,
loc), 
cte1 as(
select  a.tiv_2015, b.loc , a.tiv_2016,a.cnt from cte a left join cte b 
on a.loc=b.loc and a.pid!=b.pid 
having a.cnt>1 and b.loc is null order by tiv_2015
)
select round(sum(tiv_2016),2) as tiv_2016 from cte1
;