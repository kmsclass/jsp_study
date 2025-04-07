-- /java/sql/study.sql
create table member (
   id varchar(20) primary key,
   pass varchar(20),
   name varchar(20),
   gender int(1),
   tel varchar(15),
   email varchar(50),
   picture varchar(200)
)

select * from member

drop table book
create table book (
   no int AUTO_INCREMENT primary key,
   writer varchar(50),
   title varchar(100),
   content varchar(2000)
)
select * from book