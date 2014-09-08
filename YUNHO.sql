-- 테이블 생성 
create table yh_tbl_myemp(
  name varchar2(50),
  addr VARCHAR2(500),
  gender char(1) default 'M' -- 기본값으로 'M'을 넣어준다. 
);

-- 테이블에 값 넣기
insert into yh_TBL_MYEMP(name, addr)
values('맹윤호', '서울 중랑구 묵동');

-- 전체조회
select * from tbl_myemp;

-- 퀴즈 테이블 생성 
create table yh_tbl_quiz(
  num varchar2(50),
  quizCont VARCHAR2(1000),
  rightAnswer VARCHAR2(200)
);
-- 퀴즈 테이블에 값 넣기
insert into yh_tbl_quiz(num, quizCont,rightAnswer)
values('Q1', '객관식 문제1번','1');
insert into yh_tbl_quiz(num, quizCont,rightAnswer)
values('Q2', '객관식 문제2번','2');
insert into yh_tbl_quiz(num, quizCont,rightAnswer)
values('Q3', '4지선다 문제1번','2');
insert into yh_tbl_quiz(num, quizCont,rightAnswer)
values('Q4', '주관식 문제 1번','1988');

-- 퀴즈 테이블 조회 
select * from yh_tbl_quiz;
select * from yh_tbl_option;

-- 선택된 테이블 삭제 
DROP TABLE yh_tbl_quiz;

-- 퀴즈 옵션 테이블 생성 
create table yh_tbl_option(
  num varchar2(50),
    optionNum VARCHAR2(200),
  optionCont VARCHAR2(1000)
);

-- 퀴즈 테이블에 값 넣기
insert into yh_tbl_option(num, optionNum,optionCont)
values('Q1', '1','맞다');
insert into yh_tbl_option(num, optionNum,optionCont)
values('Q1', '2','틀리다');
insert into yh_tbl_option(num, optionNum,optionCont)
values('Q2', '1','그렇다');
insert into yh_tbl_option(num, optionNum,optionCont)
values('Q2', '2','아니다.');
insert into yh_tbl_option(num, optionNum,optionCont)
values('Q3', '1','보기1');
insert into yh_tbl_option(num, optionNum,optionCont)
values('Q3', '2','보기2');
insert into yh_tbl_option(num, optionNum,optionCont)
values('Q3', '3','보기3');
insert into yh_tbl_option(num, optionNum,optionCont)
values('Q3', '4','보기4');

-- 선택된 테이블 삭제 
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
values('c##user02', '1234','맹윤호','010-2815-9190','yunho0130@gmail.com');

select * from C##USER05.TBL_MEMBER;

select * from scott.emp;
select * from scott.dept;

