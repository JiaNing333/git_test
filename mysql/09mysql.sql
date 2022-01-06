-- 練習

-- 1. 取得所有員工資料
select * from `employee`;
-- 2. 取得所有客戶資料
select * from `client`;
-- 3. 按薪水低到高取得員工資料
select * from `employee`
order by `salary`;
-- 4.取得薪水前三高的員工
select * from `employee`
order by `salary` desc
limit 3;
-- 5. 取得所有員工名字
select `name` from `employee`;

-- 6. 取得員工性別 (加上 distinc 可以使資料不重複)
select distinct `sex` from `employee` ;
