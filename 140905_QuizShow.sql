/* ����� ���� ���̺� */
create table tbl_yh_UserInfo
(userid varchar2(20), 
userName varchar2(20), 
accountNum varchar2(50), 
PhoneNum varchar2(20),
testdate varchar2(30) default sysdate,
totalmoney NUMBER, 
NumOfRA NUMBER 
);

insert into TBL_YH_USERINFO(userid, USERNAME, accountNum, PhoneNum)
values ('user01', '����ȣ', '�츮���� 123-456-78901', '010-1234-1234');
-- github ������ ���� �����߰� �׽�Ʈ2
insert into TBL_YH_USERINFO(userid, USERNAME, accountNum, PhoneNum)
values ('user02', 'ȫ�浿', '�������� 123-456-78901', '010-4342-3244');

update TBL_YH_USERINFO
set NumOfRA = 3
where userid='user01';

drop table tbl_yh_UserInfo;
SELECT * FROM TBL_YH_USERINFO;

/* ���� ��� ���̺� */ 
create table tbl_yh_userResult(
userid varchar2(20),
quizid varchar2(20), 
money NUMBER
);

/* case�� ����
SELECT deptno, 
       CASE deptno
         WHEN 10 THEN 'ACCOUNTING'
         WHEN 20 THEN 'RESEARCH'
         WHEN 30 THEN 'SALES'
         ELSE 'OPERATIONS'
       END as "Dept Name"
  FROM dept;
  */

drop table TBL_YH_USERRESULT;
select * from TBL_YH_USERRESULT;
-- �ܷ�Ű ����
alter table tbl_yh_userResult
add constraint Result_fk_userid foreign key(userid) references tbl_yh_userinfo(userid);
alter table tbl_yh_userResult
add constraint Result_fk_quizid foreign key(quizid) references tbl_yh_QuizInfo(quizid);
alter table tbl_yh_userResult
add constraint Result_fk_money foreign key(money) references tbl_yh_QuizInfo(money);



 -- ���� ����
 /*
 SELECT e.ename, a.ename "Manager"
  FROM tbl_yh_QuizInfo qi1, tbl_yh_QuizInfo qi2
 WHERE e.empno = a.mgr;
 */

-- ����ڰ� ��������
create table tbl_yh_resultQuiz
(userid varchar2(20);


--insert into tbl_yh_UserInfo
--values ('user01', 'ȫ�浿', '�츮���� 123-2221-114456', 500000, 

/* -- �Ϸ� ����Ʈ -- */ 

/* ��� ���� �ܰ� ���̺� */
-- ���� 
create table tbl_yh_ADprice
(min_ratings_per Number,
max_ratings_per Number,
ADincome NUMber);
-- �ʱⰪ ����
insert into tbl_yh_ADprice values (0,3,20000000);
insert into tbl_yh_ADprice values (3,6,25000000);
insert into tbl_yh_ADprice values (6,10,30000000);
insert into tbl_yh_ADprice values (10,15,40000000);
-- ��� ��ȸ
select * from tbl_yh_ADprice;

/* �������� */
drop table tbl_yh_QuizInfo;
drop sequence seq_yh_quizno;

-- ���̺� �����ϰ� quizid�� pkŰ��...
create table tbl_yh_QuizInfo
(quizid varchar2(20) constraint quizid_pk primary key , 
quizCont varchar2(2000), 
rightAnswer varchar2(50), 
money NUMBER, 
TotalNum NUMBER ,
NumOfRA NUMBER , 
ratesOfRA NUMBER);

-- ������ ����
CREATE SEQUENCE  seq_yh_quizno;
 
 -- ������ ��ȸ
 select seq_yh_quizno.nextval from dual;
 
 -- �� �Է� 
  insert into tbl_yh_QuizInfo(quizid, quizCont, rightAnswer, money, TotalNum, NumOfRA)
 values ('Q1', '��ȭ ���� ���ΰ��� �̼����̴�', '�׷���', '25000', 20, 19);
 insert into tbl_yh_QuizInfo(quizid, quizCont, rightAnswer, money, TotalNum, NumOfRA)
 values ('Q'||seq_yh_quizno.nextval, '������ �����̴� ������', '�׷���', '50000', 20, 17);
insert into tbl_yh_QuizInfo(quizid, quizCont, rightAnswer, money, TotalNum, NumOfRA)
values ('Q'||seq_yh_quizno.nextval, '���ش� �� �⵵ �ΰ�', '4��', '100000', 20, 15);
 insert into tbl_yh_QuizInfo(quizid, quizCont, rightAnswer, money, TotalNum, NumOfRA)
values ('Q'||seq_yh_quizno.nextval, '���ϸ����� ��𿡼� �����Ǿ���?', '�ɶ���', '200000', 20, 10);

 --����� �ϰ� �Է� 
update TBL_YH_QUIZINFO
set ratesOfRA = NUMOFRA/TotalNum
where quizid=quizid;
 -- ��ȸ
 select * from tbl_yh_QuizInfo;
 
 /* ���� ���� */
drop table tbl_yh_options;
create table tbl_yh_options(
quizid varchar2(20),
optionNum NUMBER,
optionCont varchar2(100) 
);
-- �ܷ�Ű ����
ALTER TABLE tbl_yh_options 
ADD CONSTRAINT tbl_fk_quizid 
FOREIGN  KEY(quizid)  
REFERENCES tbl_yh_QuizInfo(quizid);

-- �� ���� 
insert into TBL_YH_OPTIONS values ('Q1', 1, '�׷���');
insert into TBL_YH_OPTIONS values ('Q1', 2, '�ƴϴ�');
insert into TBL_YH_OPTIONS values ('Q2', 1, '�׷���');
insert into TBL_YH_OPTIONS values ('Q2', 2, '�ƴϴ�');
insert into TBL_YH_OPTIONS values ('Q3', 1, '2011');
insert into TBL_YH_OPTIONS values ('Q3', 2, '2012');
insert into TBL_YH_OPTIONS values ('Q3', 3, '2013');
insert into TBL_YH_OPTIONS values ('Q3', 4, '2014');

select * from tbl_yh_options;
