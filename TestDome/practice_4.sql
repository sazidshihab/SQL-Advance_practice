

/*
Sessions
Problem : https://www.testdome.com/library?page=1&term=sql&questionId=147182
*/
CREATE TABLE sessions (
  id INTEGER NOT NULL PRIMARY KEY,
  userId INTEGER NOT NULL,
  duration DECIMAL NOT NULL
);

INSERT INTO sessions(id, userId, duration) VALUES(1, 1, 10);
INSERT INTO sessions(id, userId, duration) VALUES(2, 2, 18);
INSERT INTO sessions(id, userId, duration) VALUES(3, 1, 14);


with cte as(
select userId,duration,count(userId)over(partition by userID) as cnt from sessions)
,cte1 as(
    select userID, avg(duration) from cte where cnt>1
    group by userID
)
select * from cte1;


/*
Sessions
Problem : https://www.testdome.com/library?page=1&term=sql&questionId=147182
END -----
*/

-------------------------------------------------------------------------------------------------------------------

/*
Regional sales comparison
Problem: https://www.testdome.com/library?page=1&term=sql&questionsSort=difficulty+desc&questionSets=public&questionId=132329
*/

SET FOREIGN_KEY_CHECKS = 0; -- Turn off safety
DROP TABLE IF EXISTS regions; 
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE regions(
  id INTEGER PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);


SET FOREIGN_KEY_CHECKS = 0; -- Turn off safety
DROP TABLE IF EXISTS states; 
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE states(
  id INTEGER PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  regionId INTEGER NOT NULL,
  FOREIGN KEY (regionId) REFERENCES regions(id)
); 


SET FOREIGN_KEY_CHECKS = 0; -- Turn off safety
DROP TABLE IF EXISTS employees; 
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE employees (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50) NOT NULL, 
  stateId INTEGER NOT NULL,
  FOREIGN KEY (stateId) REFERENCES states(id)
);



SET FOREIGN_KEY_CHECKS = 0; -- Turn off safety
DROP TABLE IF EXISTS sales; 
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE sales (
  id INTEGER PRIMARY KEY,
  amount INTEGER NOT NULL,
  employeeId INTEGER NOT NULL,
  FOREIGN KEY (employeeId) REFERENCES employees(id)
);

INSERT INTO regions(id, name) VALUES(1, 'North');
INSERT INTO regions(id, name) VALUES(2, 'South');
INSERT INTO regions(id, name) VALUES(3, 'East');
INSERT INTO regions(id, name) VALUES(4, 'West');
INSERT INTO regions(id, name) VALUES(5, 'Midwest');

INSERT INTO states(id, name, regionId) VALUES(1, 'Minnesota', 1);
INSERT INTO states(id, name, regionId) VALUES(2, 'Texas', 2);
INSERT INTO states(id, name, regionId) VALUES(3, 'California', 3);
INSERT INTO states(id, name, regionId) VALUES(4, 'Columbia', 4);
INSERT INTO states(id, name, regionId) VALUES(5, 'Indiana', 5);

INSERT INTO employees(id, name, stateId) VALUES(1, 'Jaden', 1);
INSERT INTO employees(id, name, stateId) VALUES(2, 'Abby', 1);
INSERT INTO employees(id, name, stateId) VALUES(3, 'Amaya', 2);
INSERT INTO employees(id, name, stateId) VALUES(4, 'Robert', 3);
INSERT INTO employees(id, name, stateId) VALUES(5, 'Tom', 4);
INSERT INTO employees(id, name, stateId) VALUES(6, 'William', 5);

INSERT INTO sales(id, amount, employeeId) VALUES(1, 2000, 1);
INSERT INTO sales(id, amount, employeeId) VALUES(2, 3000, 2);
INSERT INTO sales(id, amount, employeeId) VALUES(3, 4000, 3);
INSERT INTO sales(id, amount, employeeId) VALUES(4, 1200, 4);
INSERT INTO sales(id, amount, employeeId) VALUES(5, 2400, 5);


with cte as(
select a.id, a.amount,a.employeeId, b.name as emp_name, c.name as state_name, d.name  as `region` from sales a join employees b on a.`employeeId`=b.id
join states c on c.id=b.`stateId` join regions d on d.id=c.`regionId`),
cte3 as(
    select distinct c.name as `region_name`, COALESCE(count(a.id)over(partition by c.name),0) as cnt from employees a JOIN
    states b on a.stateId=b.id join regions c on c.id=b.`regionId`
),
 cte1 as(
    select a.name, COALESCE(sum(b.amount),0) as average from regions a left join cte b 
    on b.`region` =a.name  
    group by a.name
),
 cte2 as(select a.name, round(COALESCE(a.average/c.cnt,0)),round(max(COALESCE(a.average/c.cnt,0))over() - COALESCE(a.average/c.cnt,0)) as difference from cte1 a left join cte3 c on c.region_name=a.name)
select * from cte2
;



/*
Regional sales comparison
Problem: https://www.testdome.com/library?page=1&term=sql&questionsSort=difficulty+desc&questionSets=public&questionId=132329
END
*/


-----------------------------------------------------------------------------------------------------------------