USE [Module12]
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Person)
BEGIN
INSERT [dbo].[Person] ([FirstName], [LastName]) VALUES 
(N'Saidnazar', N'Saidnazarov'),
(N'Zokir', N'O''ktamov'),
(N'Shodlik', N'Saidnazarov'),
(N'Bahrom', N'Ikromov')
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Address)
BEGIN
INSERT [dbo].[Address] ([Street], [City], [State], [ZipCode]) VALUES 
(N'Oydin', N'Khiva', N'Khorezm', N'220900'),															
(N'K.Sapayev', N'Khiva', N'Khorezm', N'220800'),
(N'Firdavs', N'Urgench', N'Khorezm', N'200800')
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Employee)
BEGIN
INSERT [dbo].[Employee] ([AddressId], [PersonId], [CompanyName], [Position], [EmployeeName]) VALUES 
(1, 1, N'Power', N'Designer', N'Saidnazarov Saidnazar'),
(2, 2, N'Qwerty', N'Developer', NULL),
(1, 3, N'Power', N'Developer', N'Shodlik Saidnazarov'),
(3, 4, N'Ency', N'QA Engineer', NULL)
END
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Company)
BEGIN
INSERT [dbo].[Company] ([Name], [AddressId]) VALUES 
(N'Power', 1),
(N'Qwerty', 2)
END
GO

