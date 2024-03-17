create database library_v2;

use library_v2;

create table address
			(
			addressID int auto_increment primary key,
            housenumber varchar(50),
            streetname varchar(50),
            addressline2 varchar(50),
            town varchar(50),
            postcode varchar(15)
            );
            
INSERT INTO address (housenumber, Streetname, addressline2, town, Postcode)
VALUES 
    (101, ' Maple Avenue', 'Wimbledon', 'London', 'SW19 3TJ'),
    (103, '17 Birch Street', 'Merton', 'London', 'SW19 7HX'),
    (104, '82 Oak Lane', 'Wimbledon', 'London', 'SW19 0QR'),
    (106, '29 Elm Road', 'Wimbledon', 'London', 'SW19 1BD'),
    (107, '53 Cedar Close', 'Merton', 'London', 'SW19 8AU'),
    (108, '12 Pine Grove', 'Morden', 'London', 'SM4 4XP'),
    (109, '64 Sycamore Drive', 'Sutton', 'London', 'SM4 6QR'),
    (110, '37 Willow Terrace', 'Surrey', 'London', 'SM4 3HL'),
    (111, '9 Holly Court', 'Morden', 'London', 'SM4 0PK'),
    (112, '25 Chestnut Lane', 'Sutton', 'London', 'SM4 1SG'),
    (113, '58 Acacia Crescent', 'Worcester Park', 'London', 'KT19 8JK'),
    (114, '14 Beech Street', 'Sutton', 'London', 'KT19 9ZL'),
    (115, '70 Poplar Square', 'Kingston', 'London', 'KT17 7CJ'),
    (116, '49 Mulberry Lane', 'Worcester Park', 'London', 'KT19 0FS'),
    (117, '33 Hawthorn Mew', 'Kingston', 'London', 'KT17 6LN'),
    (118, '76 Juniper Road', 'Bexleyheath', 'London', 'DA14 1BS'),
    (119, '22 Rose Gardens', 'Bexley', 'London', 'DA15 2BB'),
    (120, '14 Fern Street', 'Bromley', 'London', 'DA5 3NJ'),
    (102, '95 Lavender Avenue', 'Orpington', 'London', 'DA2 4NS'),
    (105, '8 Laurel Close', 'Bromley', 'London', 'DA5 1AR');

select *
from address;

CREATE TABLE persons (
    personID int AUTO_INCREMENT PRIMARY KEY,
    Firstname varchar(50) NOT NULL,
    Lastname varchar(50) NOT NULL,
    Date_of_birth date NOT NULL,
    Gender varchar(50) NOT NULL,
    contact_number varchar(15) NOT NULL,
    email varchar(100) NOT NULL,
    addressID int not null,
    foreign key (addressID) references Address (AddressID)
);
INSERT INTO persons (Firstname, Lastname, Date_of_birth, Gender, contact_number, email, addressID) 
VALUES 
('Alec', 'Foster', '2016-08-07', 'M', '07878 901234', 'Alec_Foster@email.com','1'),
('Matia', 'Reynolds', '2014-02-14', 'M', '07601 234567', 'Rey.Matia@email.com','2'),
('khadeeja', 'Khan', '2001-05-03', 'F', '07912 345678', 'kkhadeeja@email.com','3'),
('Arohi', 'Patel', '1988-04-02', 'F', '07523 567890', 'ArohiPatel@email.com', '4'),
('Levi', 'Bailey', '1976-05-19', 'M', '07734 123456', 'IamLeviBailey@email.com', '5'),
('Adam', 'Garcia', '1997-12-29', 'M', '07845 678901', 'Garcia.Adam@email.com','6'),
('Mitchell', 'Thompson', '2005-07-22', 'F', '07656 234567', 'Thompson_Mitchell@email.com', '7'),
('Bobby', 'Green', '1989-05-18', 'F', '07989 012345', 'Bobby.Green@email.com', '8'),
('Oliver', 'Anderson', '2011-08-28', 'M', '07801 234567', 'Oliver_Anderson@email.com', '9');

ALTER TABLE persons
RENAME TO person;

select *
from person;

/* genre comes first in creation as book table requires genre id
*/
create table genre(
GenreID int auto_increment primary key,
Genre_name varchar(50) not null
);
/* book comes next as it is the next table to have links to other tables
*/
create table Book(
BookID int auto_increment primary key,
ISBN varchar(20) not null,
Title varchar(200) not null,
GenreID int not null,
Publication_date date not null,
Pages int not null,
Price float not null,
foreign key (GenreID) references Genre (GenreID)
);

create table Author(
AuthorID int auto_increment primary key,
FirstName varchar(100) not null,
LastName varchar(100) not null
);

create table BookAuthor(
AuthorID int not null,
BookID int not null,
foreign key (AuthorID) references Author (AuthorID),
foreign key (BookID) references Book (BookID)
);

INSERT INTO genre (Genre_name) 
VALUES 
('SciFi/Fantasy'),
('Non fiction'),
('Childrens'),
('Fiction'),
('Mystery'),
('Young Adult');

select * from
genre;

INSERT INTO Book (ISBN, Title, GenreID, Publication_date, Pages, Price)
VALUES 
('989-28-79-68089-3', 'Ballinby Boys', 1, '1979-05-18', 401, 21.50),
('989-28-654-2620-7', 'Nothing But Capers', 2, '1980-09-12', 390, 32.99),
('989-28-3705-987-7', 'Alanna Saves the Day', 3, '1985-09-22', 188, 8.99),
('989-28-79-52883-6', 'Post Alley', 3, '1978-09-08', 384, 27.99),
('989-28-79-05638-4', 'Thatchwork Cottage', 5, '1985-11-15', 485, 27.99),
('989-28-79-22562-9', 'Zero over Twelve', 6, '1986-12-12', 356, 20.99),
('989-28-79-40897-8', 'Portmeirion', 2, '1987-02-20', 656, 21.50),
('989-28-79-74374-1', 'Rystwyth', 2, '1992-01-03', 1218, 21.50),
('989-28-79-43574-5', 'The Mallemaroking', 3, '1978-09-15', 187, 23.99),
('989-28-79-23015-9', 'Can I Be Honest?', 3, '1987-03-06', 404, 18.50),
('989-28-79-27078-0', 'No More Lightning', 5, '1990-10-05', 192, 23.99),
('989-28-79-82749-6', '9803 North Millworks Road', 5, '1981-07-10', 384, 22.99),
('989-28-79-82125-8', 'The Winchcombe Railway Museum Heist', 3, '1984-02-10', 293, 22.99),
('989-28-3705-763-7', '(im)Mortality', 6, '1991-11-15', 324, 22.99),
('989-28-79-86624-2', 'The life and times of an utterly inconsequential person', 4, '1991-05-14', 1296, 35.84),
('989-28-654-3988-7', 'Land Water Sky Space', 4, '1991-03-15', 368, 48.00),
('989-28-79-18127-7', 'And I Said Yes', 5, '1979-04-24', 704, 27.99),
('989-28-79-42728-3', 'Interrobangs for All', 5, '1982-11-05', 493, 27.99),
('989-28-79-07610-8', 'Kalakalal Avenue', 6, '1987-05-15', 432, 27.99),
('989-28-3705-592-3', 'Banana Slug and the Glass Half Full', 6, '1986-10-10', 12, 6.99);

select * from 
Book;

INSERT INTO Author (FirstName, LastName)
VALUES
('Arthur', 'McCrumb'),
('Abraham', 'Stackhouse'),
('Bernard',	'Hopf'),
('Burton', 'Malamud'),
('Bianca', 'Thompson'),
('Charles',	'Fenimore'),
('Carolyn',	'Segal'),
('Clifford', 'Wolitzer'),
('David', 'Beam'),
('Elizabeth', 'Herbach'),
('Elmer', 'Komroff'),
('Gloria', 'Green');

select * from 
author;

INSERT INTO BookAuthor(BookID, AuthorID)
VALUES
(1,	1),
(2,	11),
(3,	3),
(4,	3),
(5,	3),
(6,	6),
(8,	8),
(9,	12),
(10, 10),
(11, 12),
(12, 12),
(13, 4),
(14, 2),
(15, 7),
(16, 4),
(17, 5),
(18, 6),
(19, 6),
(20, 9);

create table Formats 
(
BookTypeID int auto_increment primary key,
BookType varchar(50) not null
);

insert into BookTypes (BookTypeID, BookType) 
values (1, 'Hard Copy'),
(2, 'Ebook'),
(3, 'Audio Book');

create table Usages 
(
foreign key (BookID, FormatID) references Book(BookID),
BookID int,
FormatID int,
Total_Owned int,
Total_Rented int,
Total_Available int
);

insert into BookInventory (BookID, FormatID, Total_Owned, Total_Rented, Total_Available) 
values(1, 1, 1, 1, 0),
(1, 2, 3, 2, 1),
(1, 3, 4, 2, 2),
(2, 1, 3, 0, 3),
(2, 2, 2, 1, 1),
(2, 3, 2, 1, 1),
(3, 1, 2, 1, 1),
(4, 1, 1, 0, 1),
(4, 2, 1, 1, 0),
(4, 3, 1, 0, 1),
(5, 1, 1, 0, 1),
(5, 2, 1, 1, 0),
(6, 1, 2, 0, 2),
(6, 2, 3, 1, 2),
(6, 3, 3, 1, 2),
(7, 1, 1, 1, 0),
(8, 1, 1, 0, 1),
(8, 2, 1, 1, 0),
(8, 3, 3, 2, 1),
(9, 1, 4, 2, 2),
(10, 1, 2, 1, 1),
(10, 2, 2, 0, 2),
(11, 1, 2, 0, 2),
(12, 1, 2, 1, 1),
(12, 2, 1, 1, 0),
(12, 3, 1, 0, 1),
(13, 1, 2, 1, 1),
(13, 3, 2, 1, 1),
(14, 1, 2, 1, 1),
(14, 2, 2, 2, 0),
(15, 1, 3, 3, 0),
(15, 2, 3, 0, 3),
(15, 3, 1, 1, 0),
(16, 1, 1, 1, 0),
(16, 2, 1, 0, 1),
(16, 3, 1, 0, 1),
(17, 1, 2, 2, 0),
(17, 2, 2, 2, 0),
(18, 1, 2, 0, 2),
(18, 2, 2, 0, 2),
(18, 3, 2, 1, 1),
(19, 1, 3, 1, 2),
(19, 2, 3, 0, 3),
(19, 3, 3, 2, 1),
(20, 1, 1, 1, 0),
(20, 2, 1, 1, 0),
(20, 3, 1, 1, 0);

create table Adult_Identifier 
(
foreign key(PersonID ,AdultID) references person(PersonID),
PersonID int,
AdultID int
);

INSERT INTO PersonAdult (PersonID, AdultID) VALUES
(101, 121),
(102, 122),
(103, 123),
(104, 124),
(105, 125),
(106, 126),
(107, 127),
(108, 128),
(109, 129),
(110, 130),
(111, 131),
(112, 132),
(113, 133),
(114, 134),
(115, 135);

Create table Child_Identifier
(
foreign key (PersonID) references person(PersonID),
PersonID int,
ChildID int
);

insert into PersonChild (PersonID, ChildID) values
(116, 136),
(117, 137),
(118, 138),
(119, 139),
(120, 140);

create table Guardian
(
foreign key (AdultID) references Adult_Identifier (AdultID),
foreign key (ChildID) references Child_Identifier (ChildID),
AdultID int,
ChildID int
);

insert into AdultChild (AdultID, ChildID) values
(121, 136),
(121, 137),
(129, 138),
(132, 139),
(132, 140);