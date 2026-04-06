create database `3451_Find_Invalid_IP_Addresses`;

create table `logs`(
log_id   int primary key,
ip   varchar(50),
status_code int  );

truncate `logs`;

insert into `logs` VALUES
(1,      '202.66.251.08',     404),
(2,      '99.187.67.331',    301),
(3,      '199.1.217.22.115',  404),         
(4,      '227.129.81.211',    502),         
(5,      '179.103.191.70',  502),        
(6,      '254.108.21.850',   502),         
(7,      '183.174.93.558',    404),         
(8,      '57.115.85.35',      301);


/*
(1,      '192.168.1.1',    200),
(2,      '256.1.2.3',      404),       
(3,      '192.168.001.1',  200),       
(4,      '192.168.1.1',    200),
(5,      '192.168.1',    500),        
(6,      '256.1.2.3',    404),
(7,      '192.168.001.1' ,200);  */

/*
Contains numbers greater than 255 in any octet
Has leading zeros in any octet (like 01.02.03.04)
Has less or more than 4 octets
Return the result table ordered by invalid_count, ip in descending order respectively.
*/


with recursive cte as(
select 1 as val,log_id, trim(substring_index(ip,'.',1)) as first_ , substr(ip,length(substring_index(ip,'.',1))+2) as second_ from `logs`
union all
select val+1, log_id, trim(substring_index(second_,'.',1)) as first_, substr(second_,length(substring_index(second_,'.',1))+2) as second_  from cte 
where second_ <> ''
), 
check_ as(

    select log_id, val, first_ as data_, case when cast(first_ as unsigned)>255 or left(first_,1)='0' or
     count(log_id)over(partition by log_id)!=4 then 1 else 0 end as flag_ from cte 
),
 cte_final as(
 select replace(GROUP_CONCAT(data_ order by log_id,val),',','.' ) as ip from check_

 group by log_id
 having sum(flag_) !=0
 )
 select *, count(ip) as invalid_count from cte_final
 group by ip
 order by invalid_count desc,ip desc;