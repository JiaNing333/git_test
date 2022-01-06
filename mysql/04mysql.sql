create database hadoop ;
show databases ; 
use hadoop;
create table container(
    a varchar(20),
    b varchar(20),
    c varchar(20)
);
describe container;
insert into container values ('a','a','a'),('b','b','b'),('c','c','c');
select * from container;
alter table container add d varchar(20);
describe container;
select * from container;
insert into d values ('a');
insert into container value ('a','a','a','a');
insert into container value ('b','b','b','b');
Set SQL_SAFE_UPDATES = 0;
update container set d = 'f' where a='a';
select * from container;