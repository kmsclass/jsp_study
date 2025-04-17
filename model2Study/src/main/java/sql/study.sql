-- /src/sql/study.sql ---
create table board (
   num int  auto_increment primary key,
   writer varchar(30),
   pass varchar(20), 
   title varchar(100),
   content varchar(2000),
   file1 varchar(200),
   boardid varchar(2),
   regdate datetime,  
   readcnt int(10),
   grp int,        
   grplevel int(3), 
   grpstep int(5)   
);
select * from board