/* Final Project Views

USE FictionalMuseum;
GO

--updatable view
CREATE VIEW ArtCatalogue
AS
SELECT ArtworkID, Title, ArtistID, MediumID
FROM Artwork;
GO
SELECT * FROM ArtCatalogue;

--update
UPDATE ArtCatalogue
SET ArtworkID = 410
WHERE ArtworkID = 403;
GO

SELECT * FROM ArtCatalogue;


--view 2
CREATE VIEW EmployeesPerExhibit
AS
SELECT DISTINCT Employees.EmployeeID, LastName, Exhibit.ExhibitID, EmployeeContact
FROM Employees JOIN Exhibit ON Employees.EmployeeID = Exhibit.EmployeeContact;
GO

SELECT * FROM EmployeesPerExhibit;

--view 3
CREATE VIEW ArtistArtworks
AS
SELECT Artist.ArtistName, Artwork.Title
FROM Artist JOIN Artwork ON Artist.ArtistID = Artwork.ArtistID;
GO

SELECT * FROM ArtistArtworks;

--view 4
CREATE VIEW EmployeeTitle
AS
SELECT Employees.FirstName, LastName, Positions.JobTitle
FROM Employees JOIN Positions ON Employees.TitleCode = Positions.TitleCode;
GO

SELECT * FROM EmployeeTitle; */