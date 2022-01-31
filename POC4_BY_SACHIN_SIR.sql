create database POC3;

use POC3;

create table AUTHOR (AUTHOR_ID INT auto_increment primary key, AUTHOR_NAME VARCHAR(100) not null);
select*from author;

/*  create table post(
id int primary key,
name varchar2(100),
authorid int foreign key references id of table author
createdts datetime
)*/

CREATE TABLE POST  (POST_ID INT primary key auto_increment, 
                   POST_NAME varchar(300) not null,
                   AUTHOR_ID int,
                   foreign key(AUTHOR_ID) references AUTHOR (AUTHOR_ID),
                    CREATED_AT datetime);
select*from post;

INSERT INTO POST (POST_ID, POST_NAME, AUTHOR_ID, CREATED_AT) VALUES (
                                                                     5, "MY FIFTH POST",2,current_timestamp()),
                                                                     (6, "MY SIXTH POST",2,current_timestamp()),
                                                                     (7, "MY SEVENTH POST",3,current_timestamp()),
                                                                     (8, "MY EIGTH POST",3,current_timestamp()),
                                                                     (9, "MY NINTH POST",3,current_timestamp());
                                                                     

/* create table comment (
id int primary key,
content varchar2(1000),
postid int foreign key references id of table post
createdts datetime
userid int foreign key references id of table user
)*/

CREATE TABLE COMMENT (COMMENT_ID INT PRIMARY KEY auto_increment,
                      CONTENT varchar(10000),
					  POST_ID INT,
                      foreign key(POST_ID) references POST (POST_ID),
                      CREATED_AT datetime,
					   USER_ID INT,
                       foreign key(USER_ID) references USER (USER_ID));
SELECT*FROM COMMENT;

INSERT INTO COMMENT (COMMENT_ID, CONTENT, POST_ID, CREATED_AT,USER_ID) VALUES (
                                                                     11, "MY 1ST COMMENT",2,current_timestamp(),1),
                                                                     (12, "MY 2ND COMMENT",2,current_timestamp(),2),
                                                                     (13, "MY 3RD COMMENT",2,current_timestamp(),3),
                                                                     (14, "MY 4TH COMMENT",2,current_timestamp(),1),
                                                                     (15, "MY 1ST COMMENT",3,current_timestamp(),2),
                                                                     (16, "MY 2ND COMMENT",3,current_timestamp(),2),
                                                                     (17, "MY 3RD COMMENT",3,current_timestamp(),3);
                                                                     


              
/* create table user (
id int primary key,
name varchar2(100)
)*/
					
CREATE TABLE USER (USER_ID INT PRIMARY KEY,
				 USER_NAME VARCHAR(100));
                 
SELECT*FROM USER;
                      
/* Query: Get list of Posts with latest 10 comments of each post authored by 'James Bond'*/


select P.POST_ID,P.POST_NAME,P.CREATED_AT,A.AUTHOR_NAME,C.COMMENT_ID,C.CONTENT,C.CREATED_AT
from POST P
right join AUTHOR A ON P.AUTHOR_ID=A.AUTHOR_ID
right join COMMENT C ON C.POST_ID=P.POST_ID  where A.AUTHOR_NAME="JAMES BOND"  ORDER BY C.CREATED_AT DESC;

