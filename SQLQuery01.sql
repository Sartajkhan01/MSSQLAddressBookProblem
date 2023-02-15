--Welcome To The Address Book DataBase Problem--

create database AddressBook_serviceDB;
use AddressBook_serviceDB;


--UC2 add Addressbook table--
create table AddressBook(
FirstName varchar(100),
LastName varchar(100),
Address varchar(100),
City varchar(100),
State varchar (100),
Zip bigint,
PhoneNumber bigint,
Email varchar(100)
);
select * from AddressBook;


--UC3 insert contact details into table--
insert into AddressBook(FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email)
values('Sartaj','khan','DGG','DGG','CG',491445,9689556677,'raj@gmail.com'),
('Amar','Jeet','Bhilai','Bhilai','CG',490020,9644556677,'amar@gmail.com'),
('Aviral','Kumar','Raipur','Raipur','CG',492001,9644556677,'avi@gmail.com'),
('Nikhil','Yadav','Bhilai','Bhilai','CG',490020,9644556677,'nikhil@gmail.com');
select * from AddressBook;

--UC4 edit contact by person's name--
update AddressBook set PhoneNumber=9752830300 where FirstName='Aviral';
select * from AddressBook;

--UC5 delete existing contact using name--
delete AddressBook where FirstName='Amar';
select * from AddressBook;

--UC6 retrieve person belonging to city or state--
select * from AddressBook where City = 'Bhilai' or State = 'MP'; 


--UC7 size of addressbook--
select COUNT(*) as StateCount, State from AddressBook group by State;
select COUNT(*) as StateCount, City from AddressBook group by City;


--UC8 sort entries by name alphbatically--
select * from AddressBook order by FirstName;


--UC9 Identify each addressboook with name and type--
alter table Addressbook add ContactType varchar(100) not null default 'Friend';
update AddressBook set ContactType = 'Family' where FirstName = 'Aviral';
select * from AddressBook;

--UC10 get contact count by type--
select COUNT(*) as Type, ContactType from AddressBook group by ContactType;

--UC11 add person to both family and friend--
insert into AddressBook(FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email,ContactType)
values('Krisha','murthy','DGG','DGG','CG',491445,9644556677,'krish07@gmail.com','Friend'),
('Krisha','murthy','DGG','DGG','CG',491445,9644556677,'krish07@gmail.com','Family');
select * from AddressBook;

--UC12 - Creating table using Normalization and ER Diagram --
Create table Address_Book1(
AddressBookId Int Identity(1,1) Primary Key,
AddressBookName varchar(100));

Create table PersonDetail1(   
PersonId Int Identity(1,1) Primary Key,
AddressBookId Int Foreign Key References Address_Book1(AddressBookId),
FirstName varchar(50),
LastName varchar(50),
Address varchar(100),
City varchar(50),
State varchar(50),
Zip int,
PhoneNumber bigint,
Email_ID varchar(50) );

CREATE table PersonTypes1(
PersonTypeId Int Identity(1,1) Primary Key,
PersonType varchar(50) );

CREATE table PersonsDetail_Type1(
PersonId Int Foreign Key References PersonDetail1(PersonId),
PersonTypeId Int Foreign Key References PersonTypes1(PersonTypeId)  );

CREATE table Employee_Department1(
PersonId Int Foreign Key References PersonDetail1(PersonId),
EmployeeID Int  ,
DepartmentID int );
				
select *from Address_Book1;
select *from PersonDetail1;
select *from PersonTypes1;
select *from PersonsDetail_Type1;
select *from Employee_Department1;

INSERT INTO Address_Book1(AddressBookName) Values('Home'),('school'),('college'),(' office');
select *from Address_Book1;



--Inserting values into persontype--
INSERT INTO PersonTypes1(PersonType) VALUES('Family'),('schoolFriend'),('Friend'),('Colleague');
select *from PersonTypes1;

--Insert values in person detail table--
Insert INTO PersonDetail1 VALUES(1,'Bhagya','Pabboji','ABC Colony','Old Alwal','Telangana',456378,9000000001,'bhagya@gmail.com'),
(2,'Shravanthi','Pabboji','ABC Colony','Old Alwal','Telangana',543216,9000000002,'shravanthi@gmail.com'),
(3,'Vishnu','Nali','XYZ Colony','Kanuru','Andhra pradesh',654321,9000000003,'vishnu@gamil.com'),
(4,'Sai','abc','PQR Colony','secunderabad','Telanagana',765432,9000000004,'Sai@gmail.com');
select *from PersonDetail1;

--Insert values in person detail type--
INSERT INTO PersonsDetail_Type1(PersonId,PersonTypeId) VALUES(1,1),(2,3),(3,4),(4,2);
select *from PersonsDetail_Type1;

--Insert values in Employee_Department1 table--
INSERT INTO Employee_Department1 VALUES(1,123,818),(2,456,19112),(3,789,4512),(4,244,161815)
select *from Employee_Department1;



