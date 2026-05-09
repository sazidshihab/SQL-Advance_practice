-- Active: 1774469870130@@127.0.0.1@3306@262. Trips and Users


create database `3220 Odd and Even Transactions`;

create table transactions(
    transaction_id int,
    amount int,
    transaction_date date
);

insert into transactions VALUES
(1, 150, '2024-07-01'),
(2, 200, '2024-07-01'),
(3, 75, '2024-07-01'),
(4, 300, '2024-07-02'),
(5, 50, '2024-07-02'),
(6, 120, '2024-07-03');

select transaction_date,
sum(if (amount%2=1, amount, 0)) as odd_sum,
sum(if (amount%2=0,amount,0)) as even_sum
from transactions
group by 1
order by transaction_date 
;

