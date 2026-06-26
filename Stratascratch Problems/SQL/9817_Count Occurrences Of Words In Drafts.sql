create database `9817_Count Occurrences Of Words In Drafts`;
use `9817_Count Occurrences Of Words In Drafts`;
 drop table if exists google_file_store;
create table google_file_store(
    file_id int primary key AUTO_INCREMENT,
    file_name varchar(255),
    contents text
);

insert into google_file_store(file_name, contents) values
('draft1.txt',	'The stock exchange predicts a bull market which would make many investors happy.'),
('draft2.txt',	'The stock exchange predicts a bull market which would make many investors happy, but analysts warn of possibility of too much optimism and that in fact we are awaiting a bear market.'),
('final.txt',	'The stock exchange predicts a bull market which would make many investors happy, but analysts warn of possibility of too much optimism and that in fact we are awaiting a bear market. As always predicting the future market is an uncertain game and all investors should follow their instincts and best practices.');

with recursive cte as(
select trim(substring_index(contents,' ',1)) as txt, trim(substr(contents,length(substring_index(contents,' ',1))+1)) as txt1 from google_file_store

union all

select trim(substring_index(txt1,' ',1)) as txt, trim(substr(txt1,length(substring_index(txt1,' ',1))+1)) as txt1 from cte where txt1 <>''
)
select replace(replace(txt,'.',''),',','') as word, count(*) as occurrences from cte group by 1;