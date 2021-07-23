----CREATE SIMPLE STORED PROCEDURE---
CREATE PROCEDURE uspProductList
AS
BEGIN 
SELECT PRODUCT_ID, PRODUCT_NAME,MODEL_YEAR,LIST_PRICE FROM products
END
----ALTER STORED PROCEDURE---
ALTER PROCEDURE uspProductList
AS
BEGIN 
SELECT PRODUCT_ID, PRODUCT_NAME,MODEL_YEAR,LIST_PRICE FROM products ORDER BY PRODUCT_NAME
END
----DROP STORED PROCEDURE----
DROP PROCEDURE uspProductList