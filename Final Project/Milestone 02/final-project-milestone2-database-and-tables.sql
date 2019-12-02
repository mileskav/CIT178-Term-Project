CREATE DATABASE FictionalMuseum;
GO
USE FictionalMuseum;
CREATE TABLE Artist(
	ArtistID int NOT NULL,
	ArtistName varchar(35) NOT NULL,
	CountryID varchar(2) NOT NULL,
	PRIMARY KEY(ArtistID)
);

GO
CREATE TABLE Artwork(
	ArtworkID int NOT NULL,
	Title varchar(50) NOT NULL,
	ArtistID int NOT NULL,
	MediumID varchar(3) NOT NULL, 
	PRIMARY KEY(ArtworkID)
);

GO
CREATE TABLE Medium(
	MediumID varchar(3) NOT NULL,
	MediumName varchar(15) NOT NULL,
	PRIMARY KEY(MediumID)
);

GO
CREATE TABLE Employees(
	EmployeeID int NOT NULL,
	FirstName varchar(20) NOT NULL,
	LastName varchar(30) NOT NULL,
	TitleCode varchar(3) NOT NULL,
	PRIMARY KEY(EmployeeID)
);

GO
CREATE TABLE Positions(
	TitleCode varchar(3) NOT NULL,
	JobTitle varchar(20) NOT NULL,
	PRIMARY KEY(TitleCode)
);

GO

CREATE TABLE Country(
	CountryID varchar(2) NOT NULL,
	CountryName varchar(30) NOT NULL,
	PRIMARY KEY(CountryID)
);

GO
CREATE TABLE Exhibit(
	ExhibitID int NOT NULL,
	ArtworkID int NOT NULL,
	EmployeeContact int NOT NULL,
	PRIMARY KEY(ExhibitID, ArtworkID)
);