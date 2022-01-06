-- 創建公司表格
create database `employee`;
use `employee`;
create table `employee`(
    `emp_id` int primary key,
	`name` varchar(20),
    `birth_data` date,
	`sex` varchar(1),
    `salary` int,
    `branch_id` int,
    `sup_id` int
); -- branch_id and sup_id 還沒設定 foreign key ,是因為 branch_id 是對應到 branch ,但我們還沒有 branch 這張表格所以無法先設定 , sup_id是對應到 employee ,但我們還沒有 mployee 這張表格所以無法先設定
describe `employee`;

create table `branch`(
    `branch_id` int primary key,
    `branch_name` varchar(20),
    `manager_id` int,
    foreign key(`manager_id`) 
    references `employee`(`emp_id`) 
    on delete set null
); -- foreign key(`manager_id`) 對應到 `employee`(`emp_id`)
describe `branch`;

-- 補設定 foreign key , 因為 employee / branch 的表格都已經存在了 , 就可以設定了
alter table `employee` 
add foreign key (`branch_id`) 
references `branch`(`branch_id`)
on delete set null;

alter table `employee`
add foreign key (`sup_id`)
references `employee`(`emp_id`)
on delete set null; -- 如果被刪掉,顯示null,這樣就不會整筆資料不見

create table `client`(
    `client_id` int primary key,
    `client_name` varchar(20),
    `phone` varchar(20)
);

create table `work_with`(
    `emp_id` int,
    `client_id` int,
    `total_sales` int,
    primary key(`emp_id`, `client_id`),
    foreign key(`emp_id`) references `employee`(`emp_id`)on delete cascade,
    foreign key(`client_id`) references `client`(`client_id`)on delete cascade -- 如果刪掉此資料 , 就直接刪除會不見 / 主鍵表中的記錄被刪除，外鍵表中對應行相應刪除
);
