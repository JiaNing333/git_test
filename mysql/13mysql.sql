-- join 連接

insert into `branch` values (4,'偷懶',null) ;

-- 取得所有部門經理的名字
select `emp_id`,`name`,`branch_name`from `employee`
join `branch`
on `emp_id` = `manager_id`;

-- 前面也可以加表格名稱.屬性 這樣比較好區分誰是誰
select `employee`.`emp_id`,`employee`.`name`,`branch`.`branch_name`from `employee`
join `branch`
on `employee`.`emp_id` = `branch`.`manager_id`;

select `employee`.`emp_id`,`employee`.`name`,`branch`.`branch_name`
from `employee` left join `branch` -- 連接時左邊表格不管條件有沒有成立都會回傳所有資料,右邊表格條件要成立才回傳資料沒有就null
on `employee`.`emp_id` = `branch`.`manager_id`;

select `employee`.`emp_id`,`employee`.`name`,`branch`.`branch_name`
from `employee` right join `branch` 
on `employee`.`emp_id` = `branch`.`manager_id`;
