CREATE VIEW [dbo].[EmployeeInfo]
	AS 
	SELECT dbo.Employee.Id AS EmployeeId, CASE WHEN dbo.Employee.EmployeeName IS NULL THEN isnull(dbo.Person.FirstName, '') + ' ' + isnull(dbo.Person.LastName, '') ELSE EmployeeName END AS EmployeeFullName, 
                  dbo.Address.ZipCode + '_' + dbo.Address.State + ', ' + dbo.Address.City + '-' + dbo.Address.Street AS EmployeeFullAddress, dbo.Employee.CompanyName + '(' + dbo.Employee.Position + ')' AS EmployeeCompanyInfo
    FROM   dbo.Employee INNER JOIN
                  dbo.Person ON dbo.Employee.PersonId = dbo.Person.Id INNER JOIN
                  dbo.Address ON dbo.Employee.AddressId = dbo.Address.Id
