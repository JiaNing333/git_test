-- on delete cascade -- 如果刪掉此資料 , 就直接刪除會不見 / 主鍵表中的記錄被刪除，外鍵表中對應行相應刪除
-- on delete set null; -- 如果被刪掉,顯示null,這樣就不會整筆資料不見

delete from `employee`
where `emp_id` = 207;

select * from `branch`; -- on delete set null 刪除的資料變成null

select * from `work_with`; -- on delete cascade 整筆資料被刪除