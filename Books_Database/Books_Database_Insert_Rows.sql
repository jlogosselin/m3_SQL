


insert into dbo.Book (BookID, Title, PublicationDate) values (1, 'The House of Fortune', '2019-01-01 00:00:00');
insert into dbo.Author (AuthorID, FirstName, LastName, Gender, DateOfBirth) values (1, 'Jessie', 'Burton', 'f', '1988-06-06 00:00:00');
insert into dbo.AuthorBook(AuthorID, BookID) values (1,1);
insert into dbo.Format(FormatID, FormatName) values (1,'Hardback');
insert into dbo.Format(FormatID, FormatName) values (2,'Paperback');
insert into dbo.Format(FormatID, FormatName) values (3,'Kindle');
insert into dbo.Format(FormatID, FormatName) values (4,'PDF');
insert into dbo.BookFormat(BookID, FormatID, Price, QuantityOnHand) values (1,1,34.99,1000);
insert into dbo.BookFormat(BookID, FormatID, Price, QuantityOnHand) values (1,2,18.99,2000);
insert into dbo.BookFormat(BookID, FormatID, Price) values (1,3,9.99);
insert into dbo.BookFormat(BookID, FormatID, Price) values (1,4,10.99);
insert into dbo.Genre(GenreID, GenreName) values (1,'Drama');
insert into dbo.Genre(GenreID, GenreName) values (2,'Fable');
insert into dbo.Genre(GenreID, GenreName) values (3,'Fairy Tale');
insert into dbo.Genre(GenreID, GenreName) values (4,'Fantasy');
insert into dbo.Genre(GenreID, GenreName) values (5,'Fiction');
insert into dbo.Genre(GenreID, GenreName) values (6,'Fiction in verse');
insert into dbo.Genre(GenreID, GenreName) values (7,'Folklore');
insert into dbo.Genre(GenreID, GenreName) values (8,'Historical Fiction');
insert into dbo.Genre(GenreID, GenreName) values (9,'Horror');
insert into dbo.Genre(GenreID, GenreName) values (10,'Humour');
insert into dbo.Genre(GenreID, GenreName) values (11,'Legend');
insert into dbo.Genre(GenreID, GenreName) values (12,'Mystery');
insert into dbo.Genre(GenreID, GenreName) values (13,'Mythology');
insert into dbo.Genre(GenreID, GenreName) values (14,'Poetry');
insert into dbo.Genre(GenreID, GenreName) values (15,'Science Fiction');
insert into dbo.Genre(GenreID, GenreName) values (16,'Short Story');
insert into dbo.Genre(GenreID, GenreName) values (17,'Tall Tale');
insert into dbo.Genre(GenreID, GenreName) values (18,'Biography');
insert into dbo.Genre(GenreID, GenreName) values (19,'Autobiography');
insert into dbo.Genre(GenreID, GenreName) values (20,'History');
insert into dbo.Genre(GenreID, GenreName) values (21,'Speech');
insert into dbo.BookGenre(BookID, GenreID) values (1,5);


insert into dbo.Book (BookID, Title, PublicationDate) values (2, 'Revenge', '2020-09-09 00:00:00');
insert into dbo.Author (AuthorID, FirstName, LastName, Gender, DateOfBirth) values (2, 'Tom', 'Bower', 'm', '1976-02-02 00:00:00');
insert into dbo.AuthorBook(AuthorID, BookID) values (2,2);
insert into dbo.BookFormat(BookID, FormatID, Price, QuantityOnHand) values (2,1,36.99,1000);
insert into dbo.BookFormat(BookID, FormatID, Price, QuantityOnHand) values (2,2,14.99,2000);
insert into dbo.BookFormat(BookID, FormatID, Price) values (2,3,3.99);
insert into dbo.BookFormat(BookID, FormatID, Price) values (2,4,7.99);
insert into dbo.BookGenre(BookID, GenreID) values (2,12);


insert into dbo.Book (BookID, Title, PublicationDate) values (3, 'The Pyramid of Lies', '2021-08-01 00:00:00');
insert into dbo.Author (AuthorID, FirstName, LastName, Gender, DateOfBirth) values (3, 'Duncan', 'Mavin', 'm', '1965-01-10 00:00:00');
insert into dbo.AuthorBook(AuthorID, BookID) values (3,3);
insert into dbo.BookFormat(BookID, FormatID, Price, QuantityOnHand) values (3,1,41.99,500);
insert into dbo.BookFormat(BookID, FormatID, Price, QuantityOnHand) values (3,2,21.99,3000);
insert into dbo.BookFormat(BookID, FormatID, Price) values (3,3,11.99);
insert into dbo.BookFormat(BookID, FormatID, Price) values (3,4,10.99);
insert into dbo.BookGenre(BookID, GenreID) values (3,12);


insert into dbo.Book (BookID, Title, PublicationDate) values (4, 'Her Majestys Royal Coven', '2021-10-12 00:00:00');
insert into dbo.Author (AuthorID, FirstName, LastName, Gender, DateOfBirth) values (4, 'Juno', 'Dawson', 'f', '1992-07-07 00:00:00');
insert into dbo.AuthorBook(AuthorID, BookID) values (4,4);
insert into dbo.BookFormat(BookID, FormatID, Price, QuantityOnHand) values (4,1,39.99,400);
insert into dbo.BookFormat(BookID, FormatID, Price, QuantityOnHand) values (4,2,26.99,4000);
insert into dbo.BookFormat(BookID, FormatID, Price) values (4,3,13.99);
insert into dbo.BookFormat(BookID, FormatID, Price) values (4,4,11.99);
insert into dbo.BookGenre(BookID, GenreID) values (4,8);


insert into dbo.Book (BookID, Title, PublicationDate) values (5, 'A simple story', '2020-11-11 00:00:00');
insert into dbo.AuthorBook(AuthorID, BookID) values (2,5);
insert into dbo.BookFormat(BookID, FormatID, Price, QuantityOnHand) values (5,1,67.99,3000);
insert into dbo.BookFormat(BookID, FormatID, Price, QuantityOnHand) values (5,2,45.99,8000);
insert into dbo.BookFormat(BookID, FormatID, Price) values (5,3,22.99);
insert into dbo.BookFormat(BookID, FormatID, Price) values (5,4,19.99);
insert into dbo.BookGenre(BookID, GenreID) values (5,14);


insert into dbo.Book (BookID, Title, PublicationDate) values (6, 'The walking dead', '2018-05-05 00:00:00');
insert into dbo.AuthorBook(AuthorID, BookID) values (2,6);
insert into dbo.BookFormat(BookID, FormatID, Price, QuantityOnHand) values (6,1,17.99,1000);
insert into dbo.BookFormat(BookID, FormatID, Price, QuantityOnHand) values (6,2,13.99,2000);
insert into dbo.BookFormat(BookID, FormatID, Price) values (6,3,6.99);
insert into dbo.BookFormat(BookID, FormatID, Price) values (6,4,5.99);
insert into dbo.BookGenre(BookID, GenreID) values (6,10);


