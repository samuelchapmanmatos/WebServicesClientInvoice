USE [NewClient]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 16/03/2023 4:12:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Adress] [nvarchar](40) NOT NULL,
	[Age] [int] NULL,
	[Phone] [nvarchar](20) NULL,
	[NIE] [nvarchar](15) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Client] ADD  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  StoredProcedure [dbo].[SP_Client]    Script Date: 16/03/2023 4:12:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Client] 
	@Id INT,
      @Name NVARCHAR(40),
		@Adress NVARCHAR(40),
      @Age INT,
      @Phone NVARCHAR(20),
      @NIE NVARCHAR(15),
	@opc int,
	@top int
AS

DECLARE @MyCounterID INT;

SET @MyCounterID = 0;
SET @ID = 0;

	if (@opc=1)
	BEGIN
		SELECT Top (@top) Id,[Name],Adress,Age,Phone,NIE FROM Client
	END
	

	if (@opc=2)
	BEGIN
		SELECT Top (@top) Id,[Name],Adress,Age,Phone,NIE FROM Client 
		where [Name] LIKE '%'+@Name+'%' OR Adress LIKE '%' + @Adress + '%'
	END

	

	if (@opc=3 and ((SELECT Id FROM Client WHERE Id = @Id) <= 0))
	BEGIN
		INSERT INTO Client([Name],Adress,Age,Phone,NIE)
		VALUES(@Name,@Adress,@Age,@Phone,@NIE)

		SELECT @MyCounterID = (SELECT SCOPE_IDENTITY());
	END
	

	if (@opc=3 and ((SELECT Id FROM Client WHERE Id = @Id) > 0) )
	BEGIN
	    Update Client 
		SET 
		[Name] = @Name,
		Adress = @Adress,
		Age = @Age,
		Phone = @Phone,
		NIE = @NIE
		WHERE Id = @Id
	END
	
	if(@opc=3)	
	BEGIN
		SELECT * FROM Client WHERE Id = @MyCounterID
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_Client_Change_Status]    Script Date: 16/03/2023 4:12:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Client_Change_Status] 
	@Id INT,
	  @Status bit
AS
BEGIN
	Update Client 
		SET [Status] = @Status
		WHERE Id = @Id

		SELECT * FROM Client WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Client_Insert]    Script Date: 16/03/2023 4:12:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Client_Insert] 
	@Id INT,
      @Name NVARCHAR(40),
		@Adress NVARCHAR(40),
      @Age INT,
      @Phone NVARCHAR(20),
      @NIE NVARCHAR(15),
	  @Status BIT
AS
BEGIN
	INSERT INTO Client([Name],Adress,Age,Phone,NIE,[Status])
		VALUES(@Name,@Adress,@Age,@Phone,@NIE,@Status)

	SELECT * FROM Client WHERE Id = (SELECT SCOPE_IDENTITY())
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Client_Search]    Script Date: 16/03/2023 4:12:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Client_Search] 
      @Name NVARCHAR(40),
		@Adress NVARCHAR(40),
      @Phone NVARCHAR(20),
      @NIE NVARCHAR(15)
AS
BEGIN
	SELECT Id,[Name],Adress,Age,Phone,NIE,[Status] FROM Client 
		where [Name] LIKE '%'+@Name+'%' OR [Name] != '' OR Adress LIKE '%' + @Adress + '%' OR Adress != '' or 
		NIE LIKE '%'+ @NIE +'%' OR NIE != '' or Phone LIKE '%'+ @Phone +'%' OR Phone != ''  AND [Status] = 1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Client_Update]    Script Date: 16/03/2023 4:12:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Client_Update] 
	@Id INT,
      @Name NVARCHAR(40),
		@Adress NVARCHAR(40),
      @Age INT,
      @Phone NVARCHAR(20),
      @NIE NVARCHAR(15),
	  @Status BIT
AS
BEGIN
	Update Client 
		SET 
		[Name] = @Name,
		Adress = @Adress,
		Age = @Age,
		Phone = @Phone,
		NIE = @NIE,
		[Status] = @Status
		WHERE Id = @Id

		SELECT * FROM Client WHERE Id = @Id
END
GO
