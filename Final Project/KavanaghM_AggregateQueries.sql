/* Query #1

USE FictionalMuseum;
SELECT ExhibitID, COUNT(ArtworkID) AS [Artworks per Exhibit]
FROM Exhibit
GROUP BY ExhibitID
ORDER BY ExhibitID ASC;

Query #2

USE FictionalMuseum;
SELECT MIN(ArtworkID) AS [Earliest Sculpture Obtained],
	   MAX(ArtworkID) AS [Latest Sculpture Obtained]
FROM Artwork
WHERE MediumID = 'S';

Query #3

SELECT COUNT(TitleCode) AS [TitleCode],
	   AVG(EmployeeID) AS [Employee]
FROM Employees
GROUP BY EmployeeID
ORDER BY EmployeeID ASC;

Query #4

SELECT COUNT(ArtworkID) AS [Total Artwork by Van Gogh]
FROM Artwork
WHERE ArtistID = 102
GROUP BY ArtistID; */
