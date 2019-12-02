USE FictionalMuseum;
GO
CREATE INDEX idx_CountryID ON Artist(CountryID);
GO
CREATE INDEX idx_ArtistID ON Artwork(ArtistID);
GO
CREATE INDEX idx_MediumID ON Artwork(MediumID);
GO
CREATE INDEX idx_TitleCode ON Employees(TitleCode);
GO
CREATE INDEX idx_EmployeeContact ON Exhibit(EmployeeContact);
