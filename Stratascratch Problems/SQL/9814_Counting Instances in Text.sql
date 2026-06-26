create DATABASE `19814_counting_instances_in_text`;
USE `19814_counting_instances_in_text`;

create table google_file_store (
filename text,
contents text);

insert into google_file_store values
('draft1.txt', 'The stock exchange predicts a bull market which would make many investors happy.'),
('draft2.txt', 'The stock exchange predicts a bull market which would make many investors happy, but analysts warn of possibility of too much optimism and that in fact we are awaiting a bear market.'),
('final.txt', 'The stock exchange predicts a bull market which would make many investors happy, but analysts warn of possibility of too much optimism and that in fact we are awaiting a bear market. As always predicting the future market is an uncertain game and all investors should follow their instincts and best practices.');

with recursive cte as(
        select trim(substring_index(contents,' ',1)) as txt,
        trim(substr(contents,length(substring_index(contents,' ',1))+1)) as nxt_txt
        from google_file_store
        
        union
        
        select trim(substring_index(nxt_txt,' ',1)) as txt,
        trim(substr(nxt_txt,length(substring_index(nxt_txt,' ',1))+1)) as nxt_txt 
        from cte
        where nxt_txt!=''
), cte1 as(
        select replace(trim((lower(txt))),',','') as word from cte)
select 
word,
count(*) as bull_count
from cte1 group by 1
having word in ('bull','bear')
;