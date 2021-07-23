----STORED PROCEDURE WITH MULTIPLE PARAMETER---
CREATE PROCEDURE uspAddProducts(
@product_name varchar(255),
@brand_id int,
@category_id int,
@model_year smallint,
@list_price decimal(10,2)
)
AS
BEGIN
	INSERT INTO PRODUCTS(product_name,brand_id,category_id,model_year,list_price)
	VALUES(@product_name,@brand_id,@category_id,@model_year,@list_price) 
END