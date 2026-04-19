-- Active: 1774469870130@@127.0.0.1@3306@185. Department Top Three Salaries
create database `3601. Find Drivers with Improved Fuel Efficiency`;
use `3601. Find Drivers with Improved Fuel Efficiency`;

create table drivers (
    driver_id int primary key,
    driver_name varchar(255)
);

create table trips(
    trip_id int primary key,
    driver_id int,
    trip_date date,
    distance_km decimal(10,2),
    fuel_consumed decimal(10,2),
    foreign key (driver_id) references drivers(driver_id)
);

INSERT INTO drivers (driver_id, driver_name) VALUES
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Carol Davis'),
(4, 'David Wilson'),
(5, 'Emma Brown');

-- Insert into trips table
INSERT INTO trips (trip_id, driver_id, trip_date, distance_km, fuel_consumed) VALUES
(1, 1, '2023-02-15', 120.5, 10.2),
(2, 1, '2023-03-20', 200.0, 16.5),
(3, 1, '2023-08-10', 150.0, 11.0),
(4, 1, '2023-09-25', 180.0, 12.5),
(5, 2, '2023-01-10', 100.0, 9.0),
(6, 2, '2023-04-15', 250.0, 22.0),
(7, 2, '2023-10-05', 200.0, 15.0),
(8, 3, '2023-03-12', 80.0, 8.5),
(9, 3, '2023-05-18', 90.0, 9.2),
(10, 4, '2023-07-22', 160.0, 12.8),
(11, 4, '2023-11-30', 140.0, 11.0),
(12, 5, '2023-02-28', 110.0, 11.5);

with cte as (
    select a.driver_id,b.driver_name, 
    if (month(a.trip_date)<=6,1,2) as month_, avg((a.distance_km/a.fuel_consumed))
    as fuel_efficiency from trips a join drivers b on a.driver_id=b.driver_id 
    group by 1,2,3
    
), cte1 as 
(select * , count(*)over(partition by driver_id) as flag,
case when month_=1 then lead(fuel_efficiency,1)over(partition by driver_id order by month_) end as second_half_avg, 
case when month_=1 then round(lead(fuel_efficiency,1)over(partition by driver_id order by month_)-fuel_efficiency,2) end as efficiency_improvement
 from cte)
select driver_id, driver_name, round(fuel_efficiency,2) as first_half_avg,round(second_half_avg,2) as second_half_avg ,  efficiency_improvement  from cte1
where flag=2 and second_half_avg is not null and efficiency_improvement>0
order by efficiency_improvement desc,driver_name asc
;