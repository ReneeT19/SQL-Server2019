
----VIEWS------
CREATE VIEW PRODUCT_INFO
AS
SELECT PRODUCT_NAME,BRAND_NAME,LIST_PRICE FROM products P INNER JOIN
brands B ON P.brand_id=B.brand_id
