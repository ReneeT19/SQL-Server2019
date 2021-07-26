
CREATE TABLE stdID(
stdID int IDENTITY(1,1) NOT NULL,
stdName varchar(50) NOT NULL
);

-- create clustered index --

-- this table doesn't have primary key
CREATE TABLE PARTS(
part_id int not null,
part_name varchar(100)
)
INSERT INTO PARTS VALUES (3,'GRIP')
INSERT INTO PARTS VALUES (4,'SHOCK ABSORBER')
INSERT INTO PARTS VALUES (1,'FRAME')
INSERT INTO PARTS VALUES (2,'HEAD TUBE')
INSERT INTO PARTS VALUES (5,'FORK')

SELECT*FROM PARTS WHERE PART_ID = 5 -- ordered in the execution plan is FALSE (table scan)
CREATE CLUSTERED INDEX partid_index ON parts (part_id)
SELECT*FROM PARTS WHERE PART_ID = 5 -- ordered TRUE (clustered index seek) in the execution plan

-- CREATE NON-CLUSTERED INDEX--
SELECT*FROM customers WHERE customer_id = 2
SELECT*FROM customers WHERE CITY='rEDONDO bEACH' -- CLUSTERED INDEX
CREATE INDEX customers_city ON customers(city) -- id is clustered; city is non-clustered

--RENAME INDEX --
EXEC sp_rename customers_city, cust_city

-- DISABLE INDEX --
ALTER INDEX customers_city ON customers DISABLE

SELECT*FROM customers WHERE city='Redondo Beach'
ALTER INDEX customers_city ON customers REBUILD

-- CREATE UNIQUE INDEX --
CREATE UNIQUE INDEX cust_email ON customers(email)
SELECT*FROM customers WHERE email='ester.acevedo@gmail.com'