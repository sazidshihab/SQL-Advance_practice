
/*
Question Versions
Problem Link: https://www.testdome.com/questions/mysql/question-versions/148875
*/


create DATABASE test_dome_1;

use test_dome_1;

CREATE TABLE questions (
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    childId INTEGER,
    FOREIGN KEY (childId) REFERENCES questions(id)
);

INSERT INTO questions (id, name, childId) VALUES 
                      (3, 'SQL select v3', NULL),
                      (2, 'C# tuples', NULL),
                      (1, 'SQL select v2', 3),
                      (0, 'SQL select', 1);



select * from questions;


drop procedure if exists findLatestVersion;
DELIMITER //
CREATE  PROCEDURE findLatestVersion(
    IN questionId INTEGER)
BEGIN
 
with recursive cte as(
select id,name,childID from questions where id=questionId

union all 

select a.id,a.name,a.childID from questions a join cte b on a.id=b.childID

) select id from cte where childID is null ;

END//
DELIMITER ;


call findLatestVersion(0);

/* 
Solved and submission accepted!
*/