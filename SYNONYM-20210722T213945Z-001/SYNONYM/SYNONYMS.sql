----CREATE SYNONYMS--
CREATE SYNONYM SELPROBYPR FOR SELECT_PRODUCT_BY_LIST_PRICE

EXEC SELPROBYPR

CREATE SYNONYM CAN FOR CANDIDATES

SELECT * FROM CAN
SELECT * FROM CANDIDATES

----LIST ALL SYNONYMS----
SELECT * FROM SYS.synonyms
---DROP------------------
DROP SYNONYM CAN