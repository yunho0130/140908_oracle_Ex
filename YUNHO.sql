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
values('Q1', '������ ����1��','1');
insert into yh_tbl_quiz(num, quizCont,rightAnswer)
values('Q2', '������ ����2��','2');
insert into yh_tbl_quiz(num, quizCont,rightAnswer)
values('Q3', '4������ ����1��','2');
insert into yh_tbl_quiz(num, quizCont,rightAnswer)
values('Q4', '�ְ��� ���� 1��','1988');

-- ���� ���̺� ��ȸ 
select * from yh_tbl_quiz;
select * from yh_tbl_option;

-- ���õ� ���̺� ���� 
DROP TABLE yh_tbl_quiz;

-- ���� �ɼ� ���̺� ���� 
create table yh_tbl_option(
  num varchar2(50),
    optionNum VARCHAR2(200),
  optionCont VARCHAR2(1000)
);

-- ���� ���̺� �� �ֱ�
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

-- ���õ� ���̺� ���� 
DROP TABLE yh_tbl_option;


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

