-- subquery 子查詢

-- 1. 找出研發部門的經理名字
-- 只有一個用=
select `name` from `employee`
where `emp_id`=(
    select `manager_id` from `branch`-- 先找這邊
    where `branch_name` = '研發'
);

-- 2. 找出對單一位客戶銷售金額超過50000的員工名字
-- 可能有多個用 in 
select `name` from `employee`
where `emp_id`in (
    select `emp_id` from `work_with`
    where `total_sales` > 50000
);
