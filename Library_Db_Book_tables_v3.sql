create database library_v3;

use library_v3;

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
    (101, '45 Maple Avenue', 'Wimbledon', 'London', 'SW19 3TJ'),
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
('Alec', 'Foster', '07-08-2016', 'M', '07878 901234', 'Alec_Foster@email.com','1'),
('Matia', 'Reynolds', '14-02-2014', 'M', '07601 234567', 'Rey.Matia@email.com','2'),
('khadeeja', 'Khan', '03-05-2001', 'F', '07912 345678', 'kkhadeeja@email.com','3'),
('Arohi', 'Patel', '02-04-1988', 'F', '07523 567890', 'ArohiPatel@email.com', '4'),
('Levi', 'Bailey', '19-05-1976', 'M', '07734 123456', 'IamLeviBailey@email.com', '5'),
('Adam', 'Garcia', '29-12-1997', 'M', '07845 678901', 'Garcia.Adam@email.com','6'),
('Mitchell', 'Thompson', '22-07-2005', 'F', '07656 234567', 'Thompson_Mitchell@email.com', '7'),
('Bobby', 'Green', '18-05-1989', 'F', '07989 012345', 'Bobby.Green@email.com', '8'),
('Oliver', 'Anderson', '28-08-2011', 'M', '07801 234567', 'Oliver_Anderson@email.com', '9');

select *
from persons;

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

select * from author;
select * from book;


