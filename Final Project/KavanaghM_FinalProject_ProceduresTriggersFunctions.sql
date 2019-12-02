/* --Final Project Procedures

--retrieves and displays data
USE FictionalMuseum;
GO
CREATE PROC spExhibit
AS
SELECT ExhibitID
FROM Exhibit JOIN Artwork ON Artwork.ArtworkID = Exhibit.ArtworkID
WHERE ArtistID = 113
ORDER BY ExhibitID ASC;

EXEC spExhibit;

--input parameters
CREATE PROC spEmployees
@LastName varchar(30),
@FirstName varchar(20)
AS
SELECT FirstName, LastName, TitleCode
FROM Employees
WHERE FirstName = @FirstName AND LastName = @LastName;
GO
EXEC spEmployees @FirstName = 'Leslie', @LastName = 'Serrano';

--input and output parameters
CREATE PROC spPosition
@Title varchar(20), @LastName varchar(30) OUTPUT
AS
SELECT @LastName = LastName
FROM Employees 
WHERE TitleCode = @Title;
GO

DECLARE @Title varchar(20) = 'ED';
DECLARE @LastName varchar(30);
EXEC spPosition @Title, @LastName OUTPUT
SELECT @Title AS Position, @LastName AS Employee;

--return value
CREATE PROC spArtCount
AS
DECLARE @ArtworkCount int = (SELECT COUNT(Title) FROM Artwork)
RETURN @ArtworkCount;
GO

DECLARE @ArtworkCount int;
EXEC @ArtworkCount = spArtCount;
PRINT 'There are ' + CONVERT(varchar, @ArtworkCount) + ' pieces of art in the museum database.';

--Final Project User Defined Functions

--scalar and argument
CREATE FUNCTION dbo.fnArtistID
(@ArtistName varchar(35))
RETURNS int
BEGIN
	RETURN (SELECT ArtistID FROM Artist WHERE ArtistName = @ArtistName);
END;

SELECT ArtworkID, Title
FROM Artwork
WHERE ArtistID = dbo.fnArtistID('Vincent Van Gogh');

--table and argument
CREATE FUNCTION fnExhibitInfo
(@ExhibitID int)
RETURNS table
RETURN (SELECT DISTINCT(ExhibitID), EmployeeContact
FROM Exhibit, Employees
WHERE ExhibitID = @ExhibitID);
GO
SELECT * FROM dbo.fnExhibitInfo(102);

--Final Project Triggers

--archive table and triggers
SELECT * INTO ExhibitArchive
FROM Exhibit
WHERE 1=0;

ALTER TABLE ExhibitArchive
ADD Activity varchar(50);
GO

CREATE TRIGGER ExhibitArchive_INSERT ON Exhibit
AFTER INSERT
AS
BEGIN
	DECLARE @ExhibitID int
	DECLARE @ArtworkID int
	DECLARE @EmployeeContact int

SELECT @ExhibitID = INSERTED.ExhibitID, @ArtworkID = INSERTED.ArtworkID, 
@EmployeeContact = INSERTED.EmployeeContact
FROM INSERTED

INSERT INTO ExhibitArchive VALUES(@ExhibitID, @ArtworkID, @EmployeeContact, 'Inserted')
END
GO
INSERT INTO Exhibit VALUES (106, 455, 1066); 
GO
SELECT * FROM ExhibitArchive;

CREATE TRIGGER ExhibitArchive_DELETE ON Exhibit
AFTER DELETE
AS
BEGIN
	DECLARE @ExhibitID int
	DECLARE @ArtworkID int
	DECLARE @EmployeeContact int

SELECT @ExhibitID = DELETED.ExhibitID, @ArtworkID = DELETED.ArtworkID, 
@EmployeeContact = DELETED.EmployeeContact
FROM DELETED

INSERT INTO ExhibitArchive VALUES(@ExhibitID, @ArtworkID, @EmployeeContact, 'Deleted')
END
GO
DELETE FROM Exhibit WHERE ExhibitID = 106;
GO
SELECT * FROM ExhibitArchive;

CREATE TRIGGER ExhibitArchive_UPDATE ON Exhibit
AFTER UPDATE
AS
BEGIN
	DECLARE @ExhibitID int
	DECLARE @ArtworkID int
	DECLARE @EmployeeContact int

SELECT @ExhibitID = INSERTED.ExhibitID, @ArtworkID = INSERTED.ArtworkID, 
@EmployeeContact = INSERTED.EmployeeContact
FROM INSERTED

INSERT INTO ExhibitArchive VALUES(@ExhibitID, @ArtworkID, @EmployeeContact, 'Updated')
END
GO
INSERT INTO Exhibit VALUES (107, 201, 1083); 
GO
UPDATE Exhibit
SET EmployeeContact = 1032
WHERE ExhibitID = 107;
GO
SELECT * FROM ExhibitArchive;

--insert and update
CREATE TRIGGER CountryID_UPDATE ON Artist
AFTER INSERT, UPDATE
AS
UPDATE Artist SET CountryID = UPPER(CountryID)
WHERE CountryID IN (SELECT CountryID FROM Inserted);
GO
INSERT Artist
VALUES (200, 'Jackson Pollock', 'Us'); 
GO
SELECT * FROM Artist; */

