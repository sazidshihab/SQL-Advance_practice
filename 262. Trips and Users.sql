create database `262. Trips and Users`;

create table Trips(
`id`          int,
client_id   int,
driver_id   int,
city_id      int,
`status`      enum('completed', 'cancelled_by_driver', 'cancelled_by_client'),
request_at   varchar(20)
);

insert into Trips values
(1, 1, 10, 1, 'completed', '2013-10-01'),
(2, 2, 11, 1, 'cancelled_by_driver', '2013-10-01'),
(3, 3, 12, 6, 'completed', '2013-10-01'),
(4, 4, 13, 6, 'cancelled_by_client', '2013-10-01'),
(5, 1, 10, 1, 'completed', '2013-10-02'),
(6, 2, 11, 6, 'completed', '2013-10-02'),
(7, 3, 12, 6, 'completed', '2013-10-02'),
(8, 2, 12, 12, 'completed', '2013-10-03'),
(9, 3, 10, 12, 'completed', '2013-10-03'),
(10, 4, 13, 12, 'cancelled_by_driver', '2013-10-03');



create table Users(
users_id    int,
banned      enum('Yes', 'No'),
`role`      enum('client', 'driver', 'partner'));

INSERT INTO Users
VALUES 
(1, 'No', 'client'),
(2, 'Yes', 'client'),
(3, 'No', 'client'),
(4, 'No', 'client'),
(10, 'No', 'driver'),
(11, 'No', 'driver'),
(12, 'No', 'driver'),
(13, 'No', 'driver');

select  distinct a.request_at as `Day` , 
round(sum(case when a.status like 'cancelled%' then 1 else 0 end)over(partition by a.request_at) /
(sum(case when a.status like '%completed%' then 1 else 0 end)over(partition by a.request_at) +
  sum(case when a.status like 'cancelled%' then 1 else 0 end)over(
    partition by a.request_at)) ,2) as `Cancellation Rate`

from Trips a join Users b on a.client_id = b.users_id join Users c on a.driver_id = c.users_id
where b.banned = 'No' and c.banned ='No' and a.request_at between '2013-10-01' and '2013-10-03'
;