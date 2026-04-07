/*
Dictionary Search
Problem Link: https://www.testdome.com/library?page=1&term=sql&questionId=151816
*/

use test_dome_practice;

CREATE TABLE dictionary (
   id INTEGER NOT NULL PRIMARY KEY, 
   word VARCHAR(100) NOT NULL
);

INSERT INTO dictionary(id, word) VALUES
(1, 'abidance'),
(2, 'abide'),
(3, 'abide by'),
(4, 'abiding'),
(5, 'abridged'),
(6, 'bank'),
(7, 'ball'),
(8, 'banana'),
(9, 'bid'),
(10, 'forbid'),
(11, 'bide'),
(12, 'bit'),
(13, 'book'),
(14, 'boat'),
(15, 'builder'),
(16, 'rabbit'),
(17, 'table'),
(18, 'umbrella'),
(19, 'zebra');


select count(*) from dictionary
where word like '%bid%' ;




