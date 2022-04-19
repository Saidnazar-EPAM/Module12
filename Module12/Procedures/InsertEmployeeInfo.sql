CREATE PROCEDURE [dbo].[InsertEmployeeInfo]
	@EmployeeName nvarchar(100) = Null, 
	@FirstName nvarchar(50) = '',
	@LastName nvarchar(50) = '',
	@CompanyName nvarchar(20),
	@Position nvarchar(30) = '',
	@Street nvarchar(50),
	@City nvarchar(20) = '',
	@State nvarchar(50) = '',
	@ZipCode nvarchar(50) = ''
	AS
BEGIN
    SET NOCOUNT ON;
    IF ( isnull(TRIM(@EmployeeName),'') = '')
    BEGIN
    RAISERROR('Invalid Employee Name', 18, 0)
    RETURN
    END
    IF (LEN(@EmployeeName) > 20)
    BEGIN
    SET @EmployeeName = Substring(@EmployeeName, 1, 20);
    RETURN
    END
declare @PersonId int;
declare @AddressId int;

    INSERT INTO [dbo].[Person]
           ([FirstName]
           ,[LastName])
    VALUES
           (@FirstName,
           @LastName);

    SET @PersonId=SCOPE_IDENTITY();

    INSERT INTO [dbo].[Address]
           ([Street]
           ,[City]
           ,[State]
           ,[ZipCode])
     VALUES
           (@Street,
            @City,
            @State,
            @ZipCode)

    SET @AddressId=SCOPE_IDENTITY();

    INSERT INTO [dbo].[Employee]
           ([AddressId]
           ,[PersonId]
           ,[CompanyName]
           ,[Position]
           ,[EmployeeName])
     VALUES
           (@AddressId,
            @PersonId,
            @CompanyName,
            @Position,
            @EmployeeName)
    
	 
    INSERT INTO [dbo].[Company]
           ([Name]
           ,[AddressId])
    VALUES
           (@CompanyName,
            @AddressId)
	
END

