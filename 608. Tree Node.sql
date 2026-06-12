create database `608. Tree Node`;
use `608. Tree Node`;

create table Tree
(
    id int,
    p_id int
);

insert into Tree VALUES(1, NULL),
(2, 1),
(3, 1),
(4, 2),
(5, 2);

select id, if(p_id is null,'Root',
if(id in(select p_id from Tree where p_id is not null),'Inner','Leaf'))
as type
from Tree;