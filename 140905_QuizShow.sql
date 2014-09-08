/* 사용자 정보 테이블 */
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
values ('user01', '맹윤호', '우리은행 123-456-78901', '010-1234-1234');
-- github 연동을 위한 라인추가 테스트2
insert into TBL_YH_USERINFO(userid, USERNAME, accountNum, PhoneNum)
values ('user02', '홍길동', '국민은행 123-456-78901', '010-4342-3244');

update TBL_YH_USERINFO
set NumOfRA = 3
where userid='user01';

drop table tbl_yh_UserInfo;
SELECT * FROM TBL_YH_USERINFO;

/* 퀴즈 결과 테이블 */ 
create table tbl_yh_userResult(
userid varchar2(20),
quizid varchar2(20), 
money NUMBER
);

/* case문 문법
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
-- 외래키 지정
alter table tbl_yh_userResult
add constraint Result_fk_userid foreign key(userid) references tbl_yh_userinfo(userid);
alter table tbl_yh_userResult
add constraint Result_fk_quizid foreign key(quizid) references tbl_yh_QuizInfo(quizid);
alter table tbl_yh_userResult
add constraint Result_fk_money foreign key(money) references tbl_yh_QuizInfo(money);



 -- 셀프 조인
 /*
 SELECT e.ename, a.ename "Manager"
  FROM tbl_yh_QuizInfo qi1, tbl_yh_QuizInfo qi2
 WHERE e.empno = a.mgr;
 */

-- 사용자가 맞힌문제
create table tbl_yh_resultQuiz
(userid varchar2(20);


--insert into tbl_yh_UserInfo
--values ('user01', '홍길동', '우리은행 123-2221-114456', 500000, 

/* -- 완료 리스트 -- */ 

/* 운영자 광고 단가 테이블 */
-- 생성 
create table tbl_yh_ADprice
(min_ratings_per Number,
max_ratings_per Number,
ADincome NUMber);
-- 초기값 설정
insert into tbl_yh_ADprice values (0,3,20000000);
insert into tbl_yh_ADprice values (3,6,25000000);
insert into tbl_yh_ADprice values (6,10,30000000);
insert into tbl_yh_ADprice values (10,15,40000000);
-- 결과 조회
select * from tbl_yh_ADprice;

/* 퀴즈정보 */
drop table tbl_yh_QuizInfo;
drop sequence seq_yh_quizno;

-- 테이블 생성하고 quizid를 pk키로...
create table tbl_yh_QuizInfo
(quizid varchar2(20) constraint quizid_pk primary key , 
quizCont varchar2(2000), 
rightAnswer varchar2(50), 
money NUMBER, 
TotalNum NUMBER ,
NumOfRA NUMBER , 
ratesOfRA NUMBER);

-- 시퀀스 생성
CREATE SEQUENCE  seq_yh_quizno;
 
 -- 시퀀스 조회
 select seq_yh_quizno.nextval from dual;
 
 -- 값 입력 
  insert into tbl_yh_QuizInfo(quizid, quizCont, rightAnswer, money, TotalNum, NumOfRA)
 values ('Q1', '영화 명량의 주인공은 이순신이다', '그렇다', '25000', 20, 19);
 insert into tbl_yh_QuizInfo(quizid, quizCont, rightAnswer, money, TotalNum, NumOfRA)
 values ('Q'||seq_yh_quizno.nextval, '원숭이 엉덩이는 빨갛다', '그렇다', '50000', 20, 17);
insert into tbl_yh_QuizInfo(quizid, quizCont, rightAnswer, money, TotalNum, NumOfRA)
values ('Q'||seq_yh_quizno.nextval, '올해는 몇 년도 인가', '4번', '100000', 20, 15);
 insert into tbl_yh_QuizInfo(quizid, quizCont, rightAnswer, money, TotalNum, NumOfRA)
values ('Q'||seq_yh_quizno.nextval, '자일리톨은 어디에서 유래되었나?', '핀란드', '200000', 20, 10);

 --정답률 일괄 입력 
update TBL_YH_QUIZINFO
set ratesOfRA = NUMOFRA/TotalNum
where quizid=quizid;
 -- 조회
 select * from tbl_yh_QuizInfo;
 
 /* 보기 정보 */
drop table tbl_yh_options;
create table tbl_yh_options(
quizid varchar2(20),
optionNum NUMBER,
optionCont varchar2(100) 
);
-- 외래키 지정
ALTER TABLE tbl_yh_options 
ADD CONSTRAINT tbl_fk_quizid 
FOREIGN  KEY(quizid)  
REFERENCES tbl_yh_QuizInfo(quizid);

-- 값 설정 
insert into TBL_YH_OPTIONS values ('Q1', 1, '그렇다');
insert into TBL_YH_OPTIONS values ('Q1', 2, '아니다');
insert into TBL_YH_OPTIONS values ('Q2', 1, '그렇다');
insert into TBL_YH_OPTIONS values ('Q2', 2, '아니다');
insert into TBL_YH_OPTIONS values ('Q3', 1, '2011');
insert into TBL_YH_OPTIONS values ('Q3', 2, '2012');
insert into TBL_YH_OPTIONS values ('Q3', 3, '2013');
insert into TBL_YH_OPTIONS values ('Q3', 4, '2014');

select * from tbl_yh_options;
