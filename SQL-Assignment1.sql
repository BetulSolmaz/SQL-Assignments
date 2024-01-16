CREATE TABLE [Product](
	[ProductID] [int] PRIMARY KEY NOT NULL,
	[product_name] [nvarchar](50) NOT NULL,
	quantity INT NOT NULL
    );
   

CREATE TABLE [Component](
	[CompID] [int] PRIMARY KEY NOT NULL,
	[Comp_name] [nvarchar](50) NULL ,
	[Comp_quantity] int NOT NULL,
    [description] [nvarchar](50) NULL
    );

CREATE TABLE [Supplier](
	[SupID] [int] PRIMARY KEY NOT NULL,
	[Sup_name] [nvarchar](50) NOT NULL ,
	[aktivation] TINYINT NOT NULL,
    [Address] [nvarchar](200) NOT NULL
    );  

CREATE TABLE [Comp_Sup](
	[CompID] [int] NOT NULL,
	[SupID] int NOT NULL,
    [order_date] date  NULL,
    quantity INT NOT NULL
    PRIMARY KEY ([SupID], [CompID])
    );          
   

CREATE TABLE [Product_Comp](
	[CompID] [int] NOT NULL,
	[ProductID] int NOT NULL,
    [Comp_quantity] INT NOT NULL
    PRIMARY KEY ([ProductID], [CompID])
    );          

ALTER TABLE [Product_Comp] ADD CONSTRAINT FK_CompID FOREIGN KEY (CompID) REFERENCES [Component] (CompID);
ALTER TABLE [Product_Comp] ADD CONSTRAINT FK_ProductID FOREIGN KEY (ProductID) REFERENCES [Product] (ProductID);  

ALTER TABLE [Comp_Sup] ADD CONSTRAINT FK_ComID FOREIGN KEY (CompID) REFERENCES [Component] (CompID);
ALTER TABLE [Comp_Sup] ADD CONSTRAINT FK_SupID FOREIGN KEY (SupID) REFERENCES [Supplier] (SupID);  