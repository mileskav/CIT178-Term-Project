USE FictionalMuseum;
GO
ALTER TABLE Artist WITH CHECK
ADD CONSTRAINT FK_CountryID FOREIGN KEY(CountryID) REFERENCES Country(CountryID)
ON UPDATE CASCADE
GO
ALTER TABLE Artwork WITH CHECK
ADD CONSTRAINT FK_ArtistID FOREIGN KEY(ArtistID) REFERENCES Artist(ArtistID)
ON UPDATE CASCADE
GO
ALTER TABLE Artwork WITH CHECK
ADD CONSTRAINT FK_MediumID FOREIGN KEY(MediumID) REFERENCES Medium(MediumID)
ON UPDATE CASCADE
GO
ALTER TABLE Employees WITH CHECK
ADD CONSTRAINT FK_TitleCode FOREIGN KEY(TitleCode) REFERENCES Positions(TitleCode)
ON UPDATE CASCADE
GO
ALTER TABLE Exhibit WITH CHECK
ADD CONSTRAINT FK_EmployeeContact FOREIGN KEY(EmployeeContact) REFERENCES Employees(EmployeeID)
ON UPDATE CASCADE