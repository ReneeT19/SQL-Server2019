-- JOIN --
CREATE TABLE candidates(
id int IDENTITY(1,1) PRIMARY KEY,
fullname varchar(100) NOT NULL
);
SELECT*FROM candidates

CREATE TABLE employees(
id int IDENTITY PRIMARY KEY,
fullname varchar(100) NOT NULL
);
SELECT*FROM employees

-- IF YOU USE identity, you don't need to insert that column data so only fullname is needed
INSERT INTO candidates (fullname) VALUES 
('A B'),
('C D'),
('E F'),
('G H');
INSERT INTO employees (fullname) VALUES 
('A B'),
('E F'),
('V V'),
('G H');

DROP TABLE candidates
DROP TABLE employees

-- INNER JOIN -- 
SELECT * FROM candidates C INNER JOIN employees E ON C.fullname = E.fullname
SELECT C.id,C.fullname,E.id,E.fullname FROM candidates C INNER JOIN employees E ON C.fullname = E.fullname

-- RIGHT JOIN --
SELECT * FROM candidates C RIGHT JOIN employees E on C.fullname = E.fullname

-- LEFT JOIN --
SELECT * FROM candidates C LEFT JOIN employees E on C.fullname = E.fullname

-- FULL JOIN (full outer join) --
SELECT * FROM candidates C FULL JOIN employees E on C.fullname = E.fullname

