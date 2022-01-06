-- 取得資料
insert into `student` values (1,'小白','英語',50),(2,'小黃','生物',90),(3,'小綠','歷史',70),(4,'小藍','英語',80),(5,'小黑','化學',20);

select * from `student`; -- * 取得所有屬性
select `name` from `student`; -- 只從 student 表格內取 name 屬性資料
select `name`,`major`from `student`; -- 也可以一次取多種屬性出來看,之間用逗號隔開

select *from `student` 
order by `score`;  -- (order by)成績按照分數排,預設是低到高 (asc)

select *from `student` 
order by `score` desc; -- 高到低(desc)

insert into `student` values (6,'小灰','生物',20);
select * from `student`;

select * from `student`
order by `score` , `student_id`; -- 如果成績一樣就用 student_id 做排序

select * from `student` 
order by `score`
limit 2 ; -- 限制筆數,取得分數最低的兩筆

select * from `student` 
order by `score` desc
limit 2 ; -- 限制筆數,取得分數最高的兩筆

select * from `student` 
where `major`='英語' ;-- 只回傳 major = 英語 的資料

select * from `student` 
where `major` in ('歷史','英語','生物'); -- 只要是major是這三種的都會列出來

select * from `student` 
where `major`='英語'or`major`='歷史'or`major`='生物'; -- 跟上面一樣意思,只是上面比較簡短寫起來方便