----STORED PROCEDURE WITH @@ROWCOUNT---
ALTER PROCEDURE SELECT_PRODUCT_BY_LIST_PRICE
AS
BEGIN
SELECT * FROM products WHERE list_price>100000;
IF @@ROWCOUNT=0
PRINT 'NO PRODUCTS AVAILABLE WITH THIS LIST PRICE'
END