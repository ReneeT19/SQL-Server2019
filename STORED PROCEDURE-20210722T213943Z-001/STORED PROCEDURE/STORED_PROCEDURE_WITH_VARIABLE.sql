------STORED RESULT IN A VARIABLE---
CREATE PROCEDURE FIND_MOST_EXPENSIVE_PRODUCT

AS
BEGIN
DECLARE @NAME VARCHAR(255)

SELECT TOP 1 
@NAME=PRODUCT_NAME 
FROM products ORDER BY list_price DESC

IF @@ROWCOUNT<>0
	BEGIN 
	PRINT 'THE MOST EXPENSIVE PRODUCT IS '+@NAME
	END
ELSE
	BEGIN 
	PRINT 'NO PRODUCT'
	END
END