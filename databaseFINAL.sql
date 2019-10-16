drop database if exists Login;
create database login;
use Login;

drop table if exists users;
create table users (
	username varchar(50),
    password varchar(255),
    personalEmail varchar(40),
    adminLevel char(1) CHECK (adminLevel = '1' OR adminLevel = '2' OR adminLevel = '3'), -- 1 main admin, 2 uni admin, 3 lecturer
    primary key(username)
);

 drop table if exists booking;
 create table booking (
 	username varchar(50),
    bookingDate date,
    startTime timestamp,
    endTime timestamp, 
    uni varchar(50),
    room char(4),
    primary key(username, bookingDate, startTime),
    foreign key(username) references users(username)
 );
 
drop table if exists roomCheck;
create table roomCheck (
	username varchar(50),
 	bookedRoom char(4),
    primary key(username),
    foreign key(username) references users(username)
 );
 
drop table if exists feedback;
create table feedback (
	username varchar(50),
    room char(4),
    noteDate date,
    startTime timestamp,
    notes varchar(450),
    primary key(username, room, startTime),
    foreign key(username) references users(username)
);

insert into users values('stev', '12345', 'stev@gmail.com', '1');
insert into users values('david','12345','david@gmail.com', '2');
insert into users values('Nindra', '1337', 'nindra2400@gmail.com', '3');