/*
Workers
Problem: https://www.testdome.com/library?page=1&term=sql&questionId=102293
*/
CREATE TABLE employees (
  id INTEGER NOT NULL PRIMARY KEY,
  managerId INTEGER, 
  name VARCHAR(30) NOT NULL,
  FOREIGN KEY (managerId) REFERENCES employees(id)
);

INSERT INTO employees(id, managerId, name) VALUES(1, NULL, 'John');
INSERT INTO employees(id, managerId, name) VALUES(2, 1, 'Mike');


select `name` from employees where `id`  not IN 
(select managerId from employees where managerId is not null) ;

