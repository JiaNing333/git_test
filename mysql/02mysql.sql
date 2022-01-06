-- 前面一個分頁已經創好了
-- 也可以新增一些限制constrints,像是 auto_increment自動+1該欄位不需自行傳入會自動產生,not null不能為空值,unique唯一不可重複,default'你設定的值',設定預設值若那來為位輸入值則會自動帶入default後你設定的值
create table `student`( -- 創一個student表格,以下是student屬性,我需要的一些資料
    `student_id` int primary key ,
    `name` varchar(20) , 
    `major` varchar(20)
);
describe `student` ; 

insert into `student` values(1,'小白','歷史') ,(2,'小黑','生物'),(3,'小綠',null); -- 把資料塞進表格內,順序要按照創建時的順序
insert into `student` values(2,'小黑','生物'),(3,'小綠',null);
select * from `student`; -- 搜尋student表格內全部資料 * ->全部