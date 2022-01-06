-- aggregate functions 聚合函數

-- 1. 取得員工人數
-- count() *代表全部 (想查詢的屬性) 他會顯示屬值這個屬性的資料有幾筆
select count(*) from `employee` ;  -- // 5
select count(`sup_id`)from `employee` ; -- //4

-- 2. 取得 所有出生於 1970-01-01 之後的女性員工人數
select count(*)from `employee` 
where `birth_data` > '1970-01-01'and `sex` = 'F' ; -- where後面加判斷條件

-- 3. 取得所有員工的平均薪水
select avg(`salary`) from `employee`;

-- 4. 取的所有員工的薪水總和
select sum(`salary`) from `employee` ;

-- 5. 取得薪水最高的員工
select max(`salary`) from `employee`;

-- 6. 取得薪水最低的員工
select min(`salary`) from `employee` ; 