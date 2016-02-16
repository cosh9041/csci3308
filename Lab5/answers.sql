-- 1
SELECT * FROM store ORDER BY name;

-- 2
SELECT * FROM store ORDER BY id LIMIT 3;

-- 3
SELECT * FROM store ORDER BY id DESC LIMIT 3;

-- 4
SELECT * FROM store WHERE price > 1; 

-- 5
SELECT price*qty FROM store;

-- 6
SELECT sum(price*qty) FROM store;

-- 7
SELECT COUNT(id) FROM store; -- 5 items

-- 8
SELECT * FROM course WHERE deptID = (SELECT id FROM department WHERE name='CSC');

-- 9
SELECT SUM(count) FROM enrollment; -- 351 total students

-- 10
SELECT COUNT(*) FROM course; -- 7 courses

-- 11
SELECT COUNT(*) FROM department; -- 4 courses

-- 12
SELECT d.name, c.name FROM department AS d, course AS c WHERE c.deptID = d.id;

-- 13
SELECT concat(d.name, c.name) FROM department AS d, course AS c WHERE c.deptID = d.id;

-- 14
SELECT d.name, c.name, e.count FROM department AS d, course AS c, enrollment AS e WHERE c.deptID = d.id && e.id = c.id;

