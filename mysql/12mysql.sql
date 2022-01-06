-- union 聯集

-- 1. 員工的名字 union 客戶的名字
-- 合併數目要相同 一對一 或 二對二 , 屬性要相同 字串對字串 數字對數字
select `name` from `employee`
union
select `client_name` from `client`;

-- 2. 員工 id + 員工名字 union 客戶 id + 客戶的名字
select `emp_id` as `total_id` ,`name` as `total_name` from `employee` -- as 用來改名字 emp_id 改成 total_id / name 改成 total_name
union
select `client_id`,`client_name` from `client` ;

-- 3. 員工薪水 union 銷售金額
select `salary` as `total_money` from `employee`
union
select `total_sales` from `work_with`;

