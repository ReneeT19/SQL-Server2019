
INSERT INTO brands(brand_name) VALUES('DSGDSGDSG')
SELECT * FROM BRANDS

insert into stdinfo values(3,'scott')
insert into stdinfo values(1,'tiger')
-----CREATE CLUSTERED INDEX-----
CREATE TABLE PARTS(
part_id INT NOT NULL,
part_name VARCHAR(100)
)

INSERT INTO PARTS VALUES(3,'GRIP')
INSERT INTO PARTS VALUES(4,'SHOCK ABSORBER')
INSERT INTO PARTS VALUES(1,'FRAME')
INSERT INTO PARTS VALUES(2,'HEAD TUBE')
INSERT INTO PARTS VALUES(5,'FORK')

SELECT * FROM PARTS WHERE PART_ID=3

CREATE CLUSTERED INDEX PARTIDINDEX
ON PARTS(PART_ID)

SELECT * FROM PARTS WHERE PART_ID=3