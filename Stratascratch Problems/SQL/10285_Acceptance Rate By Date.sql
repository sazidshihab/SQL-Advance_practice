create database `10285_Acceptance Rate By Date`;

use `10285_Acceptance Rate By Date`;

create table fb_friend_requests (
user_id_sender text,
user_id_receiver text,
date date,
action text
);

insert into fb_friend_requests values
('ad4943sdz', '948ksx123d', '2020-01-04', 'sent'),
('ad4943sdz', '948ksx123d', '2020-01-06', 'accepted'),
('dfdfxf9483', '9djjjd9283', '2020-01-04', 'sent'),
('dfdfxf9483', '9djjjd9283', '2020-01-15', 'accepted'),
('ffdfff4234234', 'lpjzjdi4949', '2020-01-06', 'sent'),
('fffkfld9499', '993lsldidif', '2020-01-06', 'sent'),
('fffkfld9499', '993lsldidif', '2020-01-10', 'accepted'),
('fg503kdsdd', 'ofp049dkd', '2020-01-04', 'sent'),
('fg503kdsdd', 'ofp049dkd', '2020-01-10', 'accepted'),
('hh643dfert', '847jfkf203', '2020-01-04', 'sent'),
('r4gfgf2344', '234ddr4545', '2020-01-06', 'sent'),
('r4gfgf2344', '234ddr4545', '2020-01-11', 'accepted');

with cte as (
select date,count(case when action='sent' then 1 end) as sent
from fb_friend_requests
group by 1
), cte1 as(
select   a.date,
count(*) as receive from fb_friend_requests a left join fb_friend_requests b
on a.user_id_sender=b.user_id_sender and a.user_id_receiver=b.user_id_receiver
where a.action!=b.action and a.action='sent'
group by 1
order by a.date)
select a.date,b.receive/a.sent from cte a join cte1 b
on a.date=b.date;



