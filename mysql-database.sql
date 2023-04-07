create database test;
use test;
create table`students` (
    `name` varchar(50) DEFAULT NULL,
    `id` int(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`id`)
);

insert into students (name) values ('Aaren');
insert into students (name) values ('Aarika');
insert into students (name) values ('Abagael');