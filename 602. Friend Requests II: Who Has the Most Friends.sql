create database `602. Friend Requests II: Who Has the Most Friends`;
use `602. Friend Requests II: Who Has the Most Friends`;

create table RequestAccepted
(
    requester_id   int,
    accepter_id    int,
    accept_date    date
);

insert into RequestAccepted VALUES
(1, 2, '2016-06-03'),
(1, 3, '2016-06-08'),
(2, 3, '2016-06-08'),
(3, 4, '2016-06-09');

select
requester_id as id, count(requester_id) as num from
(select requester_id from RequestAccepted
union all 
select accepter_id from RequestAccepted) as a
group by 1
order by num desc limit 1;
