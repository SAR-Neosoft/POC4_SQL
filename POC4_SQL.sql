CREATE database SQLPOC;
USE SQLPOC;

create table author (
id int primary key,
name varchar(100)
);
desc author;
select * from author;
insert into author values(1,"SAR"),(2,"James Bond"),(3,"ABD");



create table post(
id int primary key,
name varchar(100),
authorid int,
createdts datetime,
  foreign key (authorid) references author(id)
);
desc post;
select * from post;
insert into post values(111,"post1",1,current_timestamp()),
(112,"post2",1,current_timestamp()),
(113,"post3",2,current_timestamp()),
(114,"post4",2,current_timestamp());


create table comment (
id int primary key,
content varchar(1000),
postid int ,
createdts datetime,
userid int ,
  foreign key (postid) references post(id) ,
    foreign key (userid) references user(id) 
);
desc comment;
select * from comment;
insert into comment values(120,"comment 1 of post 114",114,current_timestamp(),100);
insert into comment values(121,"comment 2 of post 114",114,current_timestamp(),100);
insert into comment values(122,"comment 3 of post 114",114,current_timestamp(),100);
insert into comment values(123,"comment 4 of post 114",114,current_timestamp(),100);
insert into comment values(124,"comment 5 of post 114",114,current_timestamp(),100);
insert into comment values(125,"comment 6 of post 114",114,current_timestamp(),100);
insert into comment values(126,"comment 7 of post 114",114,current_timestamp(),100);
insert into comment values(127,"comment 8 of post 114",114,current_timestamp(),100);
insert into comment values(128,"comment 9 of post 114",114,current_timestamp(),100);
insert into comment values(129,"comment 10 of post 114",114,current_timestamp(),100);
insert into comment values(130,"comment 11 of post 114",114,current_timestamp(),100);

-- ======================================================================
insert into comment values(140,"comment 1 of post 113",113,current_timestamp(),100);
insert into comment values(141,"comment 2 of post  113",113,current_timestamp(),100);
insert into comment values(142,"comment 3 of post  113",113,current_timestamp(),100);
insert into comment values(143,"comment 4 of post  113",113,current_timestamp(),100);
insert into comment values(144,"comment 5 of post  113",113,current_timestamp(),100);
insert into comment values(145,"comment 6 of post  113",113,current_timestamp(),100);
insert into comment values(146,"comment 7 of post  113",113,current_timestamp(),100);
insert into comment values(147,"comment 8 of post  113",113,current_timestamp(),100);
insert into comment values(148,"comment 9 of post  113",113,current_timestamp(),100);
insert into comment values(149,"comment 10 of post  113",113,current_timestamp(),100);
insert into comment values(150,"comment 11 of post  113",113,current_timestamp(),100); 
-- ================================================================================
insert into comment values(161,"comment 1 of post  111",111,current_timestamp(),100); 


create table user (
id int primary key,
name varchar(100)
);
desc user;

select * from user;
insert into user values(100,"User");

select * from comment c;

-- row_number() adds a sequential integer number to each row

select  *
from (
      select a.name as Author,p.id as postid,p.name AS post,c.content,c.id AS cid,
	  row_number() over(partition by p.id) as row_count
      from author a INNER JOIN post p ON a.id = p.authorid
      INNER JOIN comment c ON c.postid=p.id 
	  WHERE a.name = 'James Bond'
     ) as All_records
where All_records.row_count <= 10;

-- ========================================================================================
-- SELECT a.name,p.name AS post,c.content,c.id AS cid
-- FROM author a
-- INNER JOIN post p ON a.id = p.authorid
-- INNER JOIN comment c ON c.postid=p.id 
-- WHERE a.name = 'James Bond'  ;





-- SELECT a.name as Author,p.name AS post,c.content
-- FROM author a
-- INNER JOIN post p ON a.id = p.authorid
-- INNER JOIN comment c ON c.postid=p.id 
-- WHERE a.name = 'James Bond'  ORDER BY c.id ;  
