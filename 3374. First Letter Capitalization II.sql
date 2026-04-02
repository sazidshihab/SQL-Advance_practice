create database `3374_First_Letter_Capitalization_II`;

create table user_content (
    content_id int,
    content_text varchar(200)
);

drop table user_content;
insert into user_content VALUES
(1,          'hello world of SQL'),
(2,          'he QUICK-brown fox'),
(3,          'modern-day DATA science'),
(4,          'foo--bar -baz lOO-daR-@Daz-');


/*
( 5,           'over data long-term'),                                            
(10,         'well-known the INTELLIGENCE WEB FOX HTML'),                         
(15,         'well-known hello top'),                                             
(17,         'analysis interface microsoft API azure WELL-KNOWN CLOUD software'),
(20,         'data HTML computing the TOP web real-time user'),
(35,         'multi-tasking FOX SQL learning TOP intelligence big design'),
(39,         'best top google OPEN-SOURCE over LONG-TERM BEST DATA'),
(70,        'multi-tasking CSS DOG python DESIGN artificial python software'),
(76,         'the by lazy brown html'),                                    
(81,         'javascript BROWN OVER HTML data multi-tasking MICROSOFT');

*/

with recursive cte as(
select 1 as val, content_id,
(trim(SUBSTRING_INDEX(content_text,' ',1)))
 as first_, trim(SUBSTR(content_text,LENGTH(SUBSTRING_INDEX(content_text,' ',1))+1)) as second_ from user_content
 

UNION 

select val+1,content_id,
 (trim(SUBSTRING_INDEX(second_,' ',1))) as first_ , trim(SUBSTR(second_,LENGTH(SUBSTRING_INDEX(second_,' ',1))+1)) as second_ from cte
where second_ <> ''
),cte1 as
(select val,content_id,

if (   (first_ not like '-%') and length(first_)-length(replace(first_,'-',''))<2 ,
replace((concat( concat(upper(left(SUBSTRING_INDEX(first_, '-', 1),1)),lower(substr(SUBSTRING_INDEX(first_, '-', 1),2))), 
substring(first_,length(SUBSTRING_INDEX(first_, '-', 1))+1,1),
concat(upper(left(COALESCE(NULLIF(SUBSTRING_INDEX(first_, '-', -1),first_),''),1)),lower(substr(COALESCE(NULLIF(SUBSTRING_INDEX(first_, '-', -1),first_),''),2))))
),',','~'),
concat(upper(left(first_,1)),lower(substr(first_,2)))
)as converted_text from cte 
order by content_id,val
), cte_fina as(
    select content_id, replace(replace(GROUP_CONCAT(converted_text order by val),',',' '),'~',',') as converted_text from cte1
    group by content_id
    order by content_id
)select  a.content_id, b.content_text as original_text,a.converted_text from cte_fina a join user_content b on a.content_id=b.content_id
;



select  a.content_id, b.content_text as original_text,a.converted_text from cte_fina a join user_content b on a.content_id=b.content_id
;