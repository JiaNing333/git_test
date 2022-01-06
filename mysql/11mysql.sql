-- wildcards 萬用字 % 代表多個字元 _帶表一個字元

-- 1. 取得電話號碼尾數是335的客戶
select * from `client` 
where `phone` like '%335'; -- 前面不管是什麼數字 反正尾數是335

select * from `client` 
where `phone` like '%354%'; -- 中間有354,不管前後是什麼

-- 2. 取得姓艾的客戶
select * from `client`
where `client_name` like '艾%';

-- 3. 取得生日在12月的員工
select * from `employee`
where `birth_data` like '_____12%'; -- 前面五個字元然後12%不管後面是什麼 就可以查到12月生日的員工

