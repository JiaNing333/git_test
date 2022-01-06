-- 新增公司資料

insert into `branch` values(1,'研發',null),(2,'行政',null),(3,'資訊',null); -- manager_id 先設成null

insert into `employee` values (206,'小黃','1998-10-08','F',50000,1,null),
(207,'小綠','1985-09-16','M',29000,2,206),(208,'小黑','2000-12-19','M',35000,3,206),
(209,'小白','1997-01-22','F',39000,3,207),(210,'小蘭','1925-11-10','F',84000,1,207);

-- manager_id 把資料改回來
update `branch`
set `manager_id` = 206
where `branch_id` = 1 ;

update `branch`
set `manager_id` = 207
where `branch_id` = 2 ;

update `branch`
set `manager_id` = 208
where `branch_id` = 3 ;

insert into `client` values(400,'阿狗','254354335'),(401,'阿貓','25633899'),
(402,'旺來','45354345'),(403,'露西',54354365),(404,'艾瑞克',18783783);

insert into `work_with` values(206,400,70000),(207,401,24000),
(208,400,9800),(208,403,24000),(210,404,87940);