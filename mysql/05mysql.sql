-- 修改,刪除資料
Set SQL_SAFE_UPDATES = 0; -- 設定這個可以讓我們修改跟刪除資料 
drop table `student`;
create table `student`( -- 創一個student表格,以下是student屬性,我需要的一些資料
    `student_id` int primary key ,
    `name` varchar(20), 
    `major` varchar(20),
    `score` int
);
select * from `student`;

insert into `student` values (1,'小白','英語',50),(2,'小黃','生物',90),(3,'小綠','歷史',70),(4,'小藍','英語',80),(5,'小黑','化學',20);
select * from `student`;

-- update ... set ... where ...  

update `student`         -- 更新表格資料 (1)
set `major` = '英語文學' -- 都會被改成英語文學 (3)
where `major` = '英語' ;  -- 只要major是英語 (2)
select * from `student`;

update `student`
set `major` = '生物'
where `student_id` = 3; -- 把 student_id=3 的 major 改成生物
select * from `student`;

update `student`
set `major` = '生化'
where `major` = '生物' or `major` = '化學'; -- 可以多個一起改 major是生物或(or)化學的被改成生化
select * from `student` ;

update `student`
set `name` = '小灰',`major` = '物理'
where `student_id` = 5 ;  -- 把 student_id = 5 的資料改成別的
select * from `student` ; 

update `student`
set `major` = '物理'; -- 如果沒有寫where條件,major會全部被改成物理
select * from `student` ; 

delete from `student`
where `student_id` = 4; -- 刪除 student_id = 4 的這筆資料
select * from `student` ; 

delete from `student`
where `name`='小灰' and `major` = '物理' ; -- 刪除 name = 小灰 和 (and) major
select * from `student` ; 

delete from `student`
where `score` < 60; 
select * from `student` ; 

delete from `student` ;-- 刪除整個表格內容
select * from `student` ; 
