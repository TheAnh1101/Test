INSERT INTO [Roles] ([id], [name]) 
VALUES 
(0,'customer'),
(1,'admin'),
(2,'manager'),
(3,'staff');

GO

INSERT INTO [Users] ([roleID], [username], [password], [status], [dateStart]) 
VALUES 
(1, 'admin', 'admin', 1, '2024-05-18'),
(2, 'manager', 'manager', 1, '2024-05-18'),
(3, 'staff', 'staff', 1, '2024-05-18'),
(0, 'customer', 'customer', 1, '2024-05-18');
