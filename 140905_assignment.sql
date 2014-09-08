create table yh_tbl_assignment(numkey varchar2(20), cont varchar2(2000), num Number);
insert into YH_TBL_ASSIGNMENT 
values('a1','테스트',3);

select * from YH_TBL_ASSIGNMENT;

update YH_TBL_ASSIGNMENT 
set CONT=
values('a1','테스트',3);

-- 1. 어제 날짜 09/03 을 '14/09/03 TUE' 로 표현할 것 
SELECT
TO_CHAR(SYSDATE-1, 'YY/MM/DD DY', 'NLS_DATE_LANGUAGE=ENGLISH') "어제 날짜"
FROM DUAL

-- 2. DB상에서 DateFormat을 변경하는 문법을 알아낼 것 -> TO_CHAR
/*
질문
  오라클이 현재는 RR/MM/DD로 default date format으로 되어 있는데, 세션에서 변경하는 방법 말고 영구적으로 default date format을 변경하는 방법이 무엇인지 궁금합니다.

답변
  DATE Format을 변경하는 방법은 크게는 4가지 방법이 있습니다. 여기서 4번은 일회성이고 나머지 1-3은 반 영구적인 변경방법 입니다.

1. INIT[dbname].ora 화일 수정
- NLS_DATE_FORMAT = 'RR-MM-DD' 이와 같이 변수와 값을 추가.
2. Shell 프로그램 이용
- C Shell: OS 상태에서 setenv NLS_DATE_FORMAT 'RR/MM/DD'추가.
- B Shell: NLS_DATE_FORMAT='RR/MM/DD' export NLS_DATE_FORMAT 추가.
- K Shell: B Shell 방법과 추가로 export NLS_DATE_FORMAT='RR/MM/DD' 로 표현 가능
3. SYS.PROPS$ VIEW를 이용하여 UPDATE하는 방법
4. Session 에서 set 하는 방법
- SQLPLUS 상태에서 ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD' 실행
- 단 SESSION 내에서만 활용가능
*/

-- 3. 10월 13일 이후로오늘까지 몇 일이 경과되었는지 알아낼 것. 예를들어 30일이 넘으면 반올림해서 31 이라는 결과를 만들어낼것
SELECT 
  ROUND(SYSDATE- TO_DATE('2013-10-13','RRRR-MM-DD'))||'일 경과' "경과일 수"
FROM DUAL;
 
-- 4.어제 오후 14:00시에시작한 일이 지금 막 끝났다면 몇 시간이 걸려서 작업된 것인지 알아낼것
--  결과시간은 내림으로 처리해서 몇 시간이 소요됐는지 알아낼 것
-- 어제오후 14:00시 SELECT TO_DATE((TO_CHAR(SYSDATE-1)||' 14:00:00'), 'RRRR-MM-DD HH24:MI:SS') FROM DUAL ;
SELECT TRUNC(TO_CHAR(SYSDATE-TO_DATE((TO_CHAR(SYSDATE-1)||' 14:00:00'), 'RRRR-MM-DD HH24:MI:SS'))*24)||'시간 경과'  "경과시간"
  FROM DUAL ;
 
--5. 자신의 생년월에서 현재까지 몇 달을 살았는지 계산해서 알아낼것 (올림해봄..)
-- 두 일자 사이에 달의 수를 조회하는 예제
SELECT CEIL(MONTHS_BETWEEN(TO_DATE(SYSDATE,'RRRR-MM-DD'), 
                      TO_DATE('1988-01-30','RRRR-MM-DD')))  "month"  
  FROM DUAL; 
 
/*
주어진 파일로 데이터 로드
 
참고 -- hr
 
SELECT
 'insert into tbl_emp (employee_id ,first_name, last_name, email, phone_number, hire_date, job_id, salary ,manager_id, department_id ) values ('||
employee_id||','''||first_name||''','''||last_name||''','''||email||''','''||phone_number||''',to_date('''||TO_CHAR(hire_date,'yy-mm-dd')||''',''yy-mm-dd''),'''||job_id||''','''||salary||''','||NVL(manager_id,0)||','''||department_id||''''
||');'
FROM EMPLOYEES
*/
drop table tbl_emp;
create table EMPLOYEES as (select*from HR.EMPLOYEES);
create table tbl_emp (employee_id Number ,first_name varchar2(50), last_name varchar2(50), email varchar2(50), phone_number varchar2(50), hire_date DATE, job_id  varchar2(50), salary NUMBER ,manager_id NUMBER, department_id NUMBER);
SELECT
 'insert into tbl_emp (employee_id ,first_name, last_name, email, phone_number, hire_date, job_id, salary ,manager_id, department_id ) values ('||
employee_id||','''||first_name||''','''||last_name||''','''||email||''','''||phone_number||''',to_date('''||TO_CHAR(hire_date,'yy-mm-dd')||''',''yy-mm-dd''),'''||job_id||''','''||salary||''','||NVL(manager_id,0)||','''||department_id||''''
||');'
FROM EMPLOYEES
/* 셀렉트를 활용해서 원하는 값을 가져옴 */
drop table yh_tbl_emp;
create table yh_tbl_emp as 
(select 
  employee_id ,first_name, last_name, email, phone_number, 
  hire_date, 
  job_id, salary ,manager_id, department_id
  from hr.employees);

--6.tbl_emp 테이블에서 가장 입사일이 빠른 순서대로 정렬할 것
select *
from yh_tbl_emp
order by hire_date desc;
 
--7. tbl_emp 에서 모든 hire_date 에서 100년을빼서 업데이트 할 것,
update YH_TBL_EMP
set HIRE_DATE=TO_CHAR(HIRE_DATE-365*400,'YYYY-MM-DD')
where EMPLOYEE_ID is not null;

-- 'YYYY-MM-DD'로 결과를 출력 
select 
employee_id ,first_name, last_name, email, phone_number, 
  TO_CHAR(HIRE_DATE,'YYYY-MM-DD') hire_date, 
  job_id, salary ,manager_id, department_id
from YH_TBL_EMP;

--8. department_id  별로 평균 근속 년수를 소수점 두 자리까지만 취해서 표시할 것
select department_id 부서ID, round(Avg(sysdate-hire_date)/365, 2)||'년' 근속년수
from YH_TBL_EMP
group by department_id;

-- 9. 각 job_id 별로 부서당 인원을 구하고 그들의 평균연봉을 구할것 
-- 예를들어 IT_PROG직업  60번 부서 인원수 5 명  평균연봉5760 같은 방식
select job_id 직종ID ,department_id 부서, count(*) 인원수, AVG(salary) 평균연봉
from YH_TBL_EMP
group by job_id,department_id;

/* DISTINCT : 중복행을 제거함.
10. distinct 라는 함수를 이용하여 각 부서가 몇 가지의 job_id로 구성되어 있는지 파악하고
   출력할것(  인터넷 검색 허용) */
   select department_id, count(distinct job_id)
   from yh_tbl_emp
   group by department_id;

-- 시퀀스 
create sequence seq_num;
select 'P' || 
LPAD(seq_num.nextval, '10', '0') from dual;
select seq_num.CURRVAL from dual;

-- LPAD와 시퀀스 
create sequence seq_num;
select seq_num.nextval from dual;
select 'P' || 
LPAD(seq_num.nextval, '10','0') from dual;

/* 게시판 만들기 */

-- 테이블 생성 
create table tbl_yh_bbs (
 bbsno number,
 title varchar2(500) not null,
 content varchar2(2000), 
 writer varchar2(50), 
 regdate date default sysdate, 
 viewcnt number default 0
 );
 
-- primary key 지정
alter table tbl_yh_bbs add constraint 
pk_bbs primary key (bbsno);
-- 시퀀스 생성
drop sequence seq_yh_bbs;

create sequence seq_yh_bbs;

-- 테이블에 값 입력 1
insert into tbl_yh_bbs 
(bbsno, title, content, writer) 
values 
(seq_yh_bbs.nextval, '제목..','내용...','user00');

-- 테이블에 값 입력 2 // 현재 내 테이블에 있는 모든 값을 내 테이블에 다시 삽입
insert into tbl_yh_bbs (bbsno, title, content, writer) 
(select seq_yh_bbs.nextval, 
  title||seq_yh_bbs.currval,
  content||seq_yh_bbs.currval,
  'user00' from tbl_yh_bbs);

-- 전체 조회하고 내림차순 정렬 
select * from tbl_yh_bbs order by bbsno desc;

/*
thinker.ipdisk.co.kr
user00/user00
*/