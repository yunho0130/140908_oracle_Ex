-- ���̺� ���� 
create table yh_tbl_myemp(
  name varchar2(50),
  addr VARCHAR2(500),
  gender char(1) default 'M' -- �⺻������ 'M'�� �־��ش�. 
);

-- ���̺� �� �ֱ�
insert into yh_TBL_MYEMP(name, addr)
values('����ȣ', '���� �߶��� ����');

-- ��ü��ȸ
select * from tbl_myemp;

-- ���� ���̺� ���� 
create table yh_tbl_quiz(
  num varchar2(50),
  quizCont VARCHAR2(1000),
  rightAnswer VARCHAR2(200)
);
-- ���� ���̺� �� �ֱ�
insert into yh_tbl_quiz(num, quizCont,rightAnswer)
values('Q1', 'OX���� 1��','1');
insert into yh_tbl_quiz(num, quizCont,rightAnswer)
values('Q2', 'OX���� 2��','2');
insert into yh_tbl_quiz(num, quizCont,rightAnswer)
values('Q3', '4������ ����1��','2');
insert into yh_tbl_quiz(num, quizCont,rightAnswer)
values('Q4', '�ְ��� ���� 1��: �� ������?','1988');
-- update
update yh_tbl_quiz
set quizCont='�ְ��� ���� 1��: ��ȣ�� ������? ��⵵�ΰ�'
where num='Q4';
SAVEPOINT;
ROLLBACK;
-- ���� ���̺� ��ȸ 
select * from yh_tbl_quiz;
select * from yh_tbl_option;

-- ���õ� ���̺� ���� 
DROP TABLE yh_tbl_quiz;
drop table yh_tbl_option;
-- ���� �ɼ� ���̺� ���� 
create table yh_tbl_option(pk_val  varchar2(50),
  num varchar2(50),
    optionNum VARCHAR2(200),
  optionCont VARCHAR2(1000)
);

-- ���� �ɼ� ���̺� �� �ֱ�
insert into yh_tbl_option(num, optionNum,optionCont)
values('Q1', '1','�´�');
insert into yh_tbl_option(num, optionNum,optionCont)
values('Q1', '2','Ʋ����');
insert into yh_tbl_option(num, optionNum,optionCont)
values('Q2', '1','�׷���');
insert into yh_tbl_option(num, optionNum,optionCont)
values('Q2', '2','�ƴϴ�.');
insert into yh_tbl_option(num, optionNum,optionCont)
values('Q3', '1','����1');
insert into yh_tbl_option(num, optionNum,optionCont)
values('Q3', '2','����2');
insert into yh_tbl_option(num, optionNum,optionCont)
values('Q3', '3','����3');
insert into yh_tbl_option(num, optionNum,optionCont)
values('Q3', '4','����4');
--insert into yh_tbl_option(num, optionNum,optionCont)
--values('Q4', '','');

-- ���õ� ���̺� ���� 
DROP TABLE yh_tbl_option;

-- ���� 
SELECT q.NUM, q.QUIZCONT,q.RIGHTANSWER, o.OPTIONNUM, o.OPTIONCONT
  FROM yh_tbl_quiz q, yh_tbl_option o
 WHERE q.NUM=o.NUM(+);      -- ���ڶ�� �����͸� ä���ִ´�. 

-- ���� ���� decode
SELECT 
  q.NUM, MAX(q.QUIZCONT) ����,MAX(q.RIGHTANSWER) ����,
  nvl(max(decode(o.OPTIONNUM,1,o.OPTIONCONT,'')),' ') op1,
  nvl(max(decode(o.OPTIONNUM,2,o.OPTIONCONT,'')),' ') op2,
  nvl(max(decode(o.OPTIONNUM,3,o.OPTIONCONT,'')),' ') op3,
  nvl(max(decode(o.OPTIONNUM,4,o.OPTIONCONT,'')),' ') op4
  FROM yh_tbl_quiz q, yh_tbl_option o
 WHERE q.NUM=o.NUM(+)      -- ���ڶ�� �����͸� ä���ִ´�. 
 group by q.NUM
 order by q.NUM asc ;
--- decode (����� �ڵ�) 
select
qno, min(question) , min(answer),
max(decode(opnum,1,optionstr,'')) op1,
max(decode(opnum,2,optionstr,'')) op2,
max(decode(opnum,3,optionstr,'')) op3,
max(decode(opnum,4,optionstr,'')) op4
from tbl_quiz, tbl_option
where qno = quizno(+)
group by qno;
---- 

--�������̺� �ε��� �߰� 
CREATE INDEX option_indx
on yh_tbl_option(pk_val);
select * from yh_tbl_option;

select * from USER01.TBL_MYEMP;

insert into tbl_myemp(name, addr, gender)
(SELECT name, addr, gender from USER01.TBL_MYEMP);

create table tbl_member(
userid varchar2(50),
userpw VARCHAR2(50),
username VARCHAR2(50),
phone VARCHAR2(100),
email varchar2(100)
);

alter table tbl_member
add constraint pk_member primary key (userid);

insert into C##USER05.TBL_MEMBER(userid, userpw, username, PHONE,EMAIL)
values('c##user02', '1234','����ȣ','010-2815-9190','yunho0130@gmail.com');

select * from C##USER05.TBL_MEMBER;

select * from scott.emp;
select * from scott.dept;


SELECT e.DEPTNO �μ���ȣ, d.DNAME �μ��̸�, cNum
  FROM scott.emp e, scott.dept d, count(WHERE e.ENAME) cNum
 WHERE e.DEPTNO=d.DEPTNO;      -- ���ڶ�� �����͸� ä���ִ´�. 
 
 

