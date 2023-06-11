CREATE DATABASE MovieApp;

CREATE TABLE Movies (
	Id int PRIMARY KEY IDENTITY,
	Name nvarchar(50) NOT NULL,
	Description nvarchar(50) NOT NULL,
	CoverPhoto nvarchar(255) ,
	DirectorId int FOREIGN KEY REFERENCES Directors(Id),
	GenreId int FOREIGN KEY REFERENCES Genres(Id),
	LanguageId int FOREIGN KEY REFERENCES Languages(Id)
)

CREATE TABLE Directors(
	Id int PRIMARY KEY IDENTITY,
	Name nvarchar(50) NOT NULL,
	Surname nvarchar(50) NOT NULL
)

CREATE TABLE Actors(
	Id int PRIMARY KEY IDENTITY,
	Name nvarchar(50) NOT NULL,
	Surname nvarchar(50) NOT NULL,
	--Movies nvarchar(50) FOREIGN KEY REFERENCES Movies(Id)
)

CREATE TABLE Actors_Movies(
	MovieId int FOREIGN KEY REFERENCES Movies,
	ActorId int FOREIGN KEY REFERENCES Actors
)

CREATE TABLE Genres (
	Id int PRIMARY KEY IDENTITY,
	Name nvarchar(50) NOT NULL,
	--Movies nvarchar(50) FOREIGN KEY REFERENCES Movies(Id)
)

CREATE TABLE Languages (
	Id int PRIMARY KEY IDENTITY,
	Name nvarchar(50) NOT NULL,
	--Movies nvarchar(50) FOREIGN KEY REFERENCES Movies(Id),
)
---
CREATE OR ALTER PROCEDURE GetByDirectorId @DirectorId int
AS
BEGIN
	SELECT Name,LanguageId FROM Movies
	WHERE ID = @DirectorId
END

EXEC GetByDirectorId 1

---

CREATE OR ALTER PROCEDURE GetByGenreId @GenreID int
AS
BEGIN
	SELECT Name, DirectorId FROM Movies
	WHERE GenreId = @GenreID
END

---

CREATE FUNCTION CountOfMovies (@Languageid int)
RETURNS int 
AS
BEGIN
	DECLARE @Count int
	SELECT @Count = COUNT(*) FROM Movies
	WHERE LanguageId = @Languageid
	RETURN @Count
END

SELECT dbo.CountOfMovies(0)

---

CREATE FUNCTION IfBiggerThan3 (@actorid int)
RETURNS bit 
AS
BEGIN
	SELECT COUNT(*) FROM Actors_Movies
	WHERE	
END

SELECT dbo.IfBiggerThan3

---

CREATE TRIGGER ShowMoviesAfterInsert On Movies
AFTER INSERT
AS 
BEGIN
	SELECT * FROM Movies
END

