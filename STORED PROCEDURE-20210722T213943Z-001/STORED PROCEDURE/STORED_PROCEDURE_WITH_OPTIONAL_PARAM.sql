---STORED PROCEDURE WITH OPTIONAL PARAM.---
ALTER PROCEDURE uspFindProductByListPrice(
@min_list_price  decimal(10,2)=0,
@max_list_price decimal(10,2)=1000000,
@name varchar(255)
)
AS
BEGIN
	SELECT * FROM products WHERE list_price>=@min_list_price
	AND list_price<=@max_list_price AND PRODUCT_NAME LIKE '%'+@NAME+'%'
END