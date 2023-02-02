create table financial_ledger(
	fl_no number(5) primary key,
	fl_date varchar2(20 char) not null,
	fl_category varchar2(20 char) not null,
	fl_expense number(10) default 0,
	fl_income number(10) default 0,
	fl_detail varchar2(1000 char) default '-'
);

create sequence fl_no_seq

drop table financial_ledger cascade constraint purge
drop sequence fl_no_seq

select * from financial_ledger

insert into financial_ledger(fl_no, fl_date,fl_category,fl_expense) values(fl_no_seq.nextval,'2023-01-15','식비',100);
insert into financial_ledger(fl_no, fl_date,fl_category,fl_income) values(fl_no_seq.nextval,'2023-01-15','월급',1000);


select rownum as rn, fl_no,fl_date,fl_category,fl_expense,fl_income,fl_detail 
from financial_ledger order by fl_date asc

select rownum as rn,fl_no,fl_date,fl_category,fl_expense,fl_income,fl_detail from(
	select *
	from financial_ledger order by fl_date asc)


select rownum as rn, TEMP.fl_no,TEMP.fl_date,TEMP.fl_category,TEMP.fl_expense,TEMP.fl_income,TEMP.fl_detail 
from(select fl_no,fl_date,fl_category,fl_expense,fl_income,fl_detail 
from financial_ledger order by fl_date asc)TEMP


SELECT 
ROW_NUMBER() OVER (ORDER BY A.fl_date) AS rn, --그룹별 순번
A.fl_date,
A.fl_category,
A.fl_expense,
A.fl_income,
A.fl_detail
FROM
financial_ledger A

delete from financial_ledger where fl_no=25

select sum(fl_expense) from financial_ledger
where fl_date between '2022-12-01' and '2022-12-31'

select sum(fl_expense) from financial_ledger
where fl_date between (select TO_CHAR(trunc(sysdate,'MM'),'YYYY-MM-DD') from dual
) and (SELECT TO_CHAR(LAST_DAY(SYSDATE),'YYYY-MM-DD') MONTH_LAST_DAY FROM DUAL)

select sum(fl_income) from financial_ledger
where fl_date between (select TO_CHAR(trunc(sysdate,'MM'),'YYYY-MM-DD') from dual
) and (SELECT TO_CHAR(LAST_DAY(SYSDATE),'YYYY-MM-DD') MONTH_LAST_DAY FROM DUAL)


SELECT TO_CHAR(LAST_DAY(SYSDATE),'YYYY-MM-DD') MONTH_LAST_DAY FROM DUAL

select TO_CHAR(trunc(sysdate,'MM'),'YYYY-MM-DD') from dual;





select * from sys.props$ where name ='NLS_CHARACTERSET';

SELECT PARAMETER, VALUE
FROM NLS_DATABASE_PARAMETERS
WHERE PARAMETER LIKE '%CHAR%'

update props$ set VALUE$='KO16MSWIN949' where name='NLS_CHARACTERSET'
update props$ set VALUE$='KOREAN_KOREA.KO16MSWIN949' where name='NLS_LANGUAGE'

SELECT * FROM sys.props$
where name like '%CHARACTERSET%';

