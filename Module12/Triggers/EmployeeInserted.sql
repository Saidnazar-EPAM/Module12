CREATE TRIGGER [EmployeeInserted]
ON [dbo].[Employee]
FOR INSERT
AS
BEGIN
	SET NOCOUNT ON
	INSERT INTO Company
        (Name, AddressId)
    SELECT
        CompanyName, AddressId
        FROM inserted
END
