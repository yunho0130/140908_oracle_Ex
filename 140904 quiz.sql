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
values('Q1', 'OX문제 1번','1');
insert into yh_tbl_quiz(num, quizCont,rightAnswer)
values('Q2', 'OX문제 2번','2');
insert into yh_tbl_quiz(num, quizCont,rightAnswer)
values('Q3', '4지선다 문제1번','2');
insert into yh_tbl_quiz(num, quizCont,rightAnswer)
values('Q4', '주관식 문제 1번: 내 생일은?','1988');
-- update
update yh_tbl_quiz
set quizCont='주관식 문제 1번: 윤호의 생일은? 몇년도인가'
where num='Q4';
SAVEPOINT;
ROLLBACK;
-- 퀴즈 테이블 조회 
select * from yh_tbl_quiz;
select * from yh_tbl_option;

-- 선택된 테이블 삭제 
DROP TABLE yh_tbl_quiz;
drop table yh_tbl_option;
-- 퀴즈 옵션 테이블 생성 
create table yh_tbl_option(pk_val  varchar2(50),
  num varchar2(50),
    optionNum VARCHAR2(200),
  optionCont VARCHAR2(1000)
);

-- 퀴즈 옵션 테이블에 값 넣기
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
--insert into yh_tbl_option(num, optionNum,optionCont)
--values('Q4', '','');

-- 선택된 테이블 삭제 
DROP TABLE yh_tbl_option;

-- 조인 
SELECT q.NUM, q.QUIZCONT,q.RIGHTANSWER, o.OPTIONNUM, o.OPTIONCONT
  FROM yh_tbl_quiz q, yh_tbl_option o
 WHERE q.NUM=o.NUM(+);      -- 모자라는 데이터를 채워넣는다. 

-- 조인 응용 decode
SELECT 
  q.NUM, MAX(q.QUIZCONT) 문제,MAX(q.RIGHTANSWER) 정답,
  nvl(max(decode(o.OPTIONNUM,1,o.OPTIONCONT,'')),' ') op1,
  nvl(max(decode(o.OPTIONNUM,2,o.OPTIONCONT,'')),' ') op2,
  nvl(max(decode(o.OPTIONNUM,3,o.OPTIONCONT,'')),' ') op3,
  nvl(max(decode(o.OPTIONNUM,4,o.OPTIONCONT,'')),' ') op4
  FROM yh_tbl_quiz q, yh_tbl_option o
 WHERE q.NUM=o.NUM(+)      -- 모자라는 데이터를 채워넣는다. 
 group by q.NUM
 order by q.NUM asc ;
--- decode (강사님 코드) 
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

--보기테이블에 인덱스 추가 
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
values('c##user02', '1234','맹윤호','010-2815-9190','yunho0130@gmail.com');

select * from C##USER05.TBL_MEMBER;

select * from scott.emp;
select * from scott.dept;


SELECT e.DEPTNO 부서번호, d.DNAME 부서이름, cNum
  FROM scott.emp e, scott.dept d, count(WHERE e.ENAME) cNum
 WHERE e.DEPTNO=d.DEPTNO;      -- 모자라는 데이터를 채워넣는다. 
 
 

