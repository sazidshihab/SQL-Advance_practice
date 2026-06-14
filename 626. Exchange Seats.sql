create database `626. Exchange Seats`;
use `626. Exchange Seats`;

create table Seat
(id           int,
student      varchar(50));

show tables;

insert into Seat VALUES
  (1, 'Abbot'),
  (2, 'Doris'),
  (3, 'Emerson'),
  (4, 'Green'),
  (5, 'Jeames');

  select id, 
if (id%2 != 0 and id != max(id)over(), lead(student)over(order by id),
    if(id%2 = 0, lag(student)over(order by id), student))
 as student
from Seat;
