-- create procedure to indert product
CREATE PROCEDURE insertProduct 
    @name NVARCHAR(500), 
    @description NVARCHAR(MAX), 
    @price INT, 
    @discount FLOAT, 
    @gender INT
AS
BEGIN
    -- Insert value for table product and output the new ID
    DECLARE @NewProductID TABLE (id INT);
    
    -- Insert value for table product 
    INSERT INTO [Products] ([name], [description], [price], [discount], [gender], [createdAt], [updatedAt]) 
    OUTPUT INSERTED.[id] INTO @NewProductID
    VALUES (@name, @description, @price, @discount, @gender, GETDATE(), GETDATE());
    
    -- Return the new product ID (optional)
    SELECT id FROM @NewProductID;
END;

GO 

-- create procrdure to insert img for proududct
CREATE TYPE imgTableType AS TABLE 
(
    [name] NVARCHAR(MAX),
    [productID] INT
)
GO
CREATE PROCEDURE insertImgProduct
    @img imgTableType READONLY
AS 
BEGIN 
    INSERT INTO [Images] ([name], [productID]) 
    SELECT [name], [productID] FROM @img;
END

GO

-- create procedure to insert product detail
CREATE TYPE productDetailType AS TABLE 
(
    [productID]  INT,
    [size] NVARCHAR(20),
    [color] NVARCHAR(200),
    [quantity] INT
)
GO
CREATE PROCEDURE insertProductDetail 
    @productDetail productDetailType READONLY
AS 
BEGIN
    INSERT INTO [ProductDetails] ([productID], [size], [color], [quantity])
    SELECT * FROM @productDetail;
END