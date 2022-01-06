create database `employees`;
show databases;
use `employees`; -- 告訴MySQL我要用這個資料庫
create table `student`( -- 創一個student表格,以下是student屬性,我需要的一些資料
    `student_id` int primary key ,
    `name` varchar(20) , 
    `major` varchar(20)
);

describe `student`; -- 顯示student表格
drop table `student`; -- 刪除表格

alter table `student` add gpa decimal(3,2); -- 新增gpa屬性到student表格內
describe `student`; 
alter table `student` drop column `name`; -- 刪除屬性
describe `student`; 
alter table `student` add `name` varchar(20);
describe `student`; 