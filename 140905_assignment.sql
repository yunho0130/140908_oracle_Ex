create table yh_tbl_assignment(numkey varchar2(20), cont varchar2(2000), num Number);
insert into YH_TBL_ASSIGNMENT 
values('a1','�׽�Ʈ',3);

select * from YH_TBL_ASSIGNMENT;

update YH_TBL_ASSIGNMENT 
set CONT=
values('a1','�׽�Ʈ',3);

-- 1. ���� ��¥ 09/03 �� '14/09/03 TUE' �� ǥ���� �� 
SELECT
TO_CHAR(SYSDATE-1, 'YY/MM/DD DY', 'NLS_DATE_LANGUAGE=ENGLISH') "���� ��¥"
FROM DUAL

-- 2. DB�󿡼� DateFormat�� �����ϴ� ������ �˾Ƴ� �� -> TO_CHAR
/*
����
  ����Ŭ�� ����� RR/MM/DD�� default date format���� �Ǿ� �ִµ�, ���ǿ��� �����ϴ� ��� ���� ���������� default date format�� �����ϴ� ����� �������� �ñ��մϴ�.

�亯
  DATE Format�� �����ϴ� ����� ũ�Դ� 4���� ����� �ֽ��ϴ�. ���⼭ 4���� ��ȸ���̰� ������ 1-3�� �� �������� ������ �Դϴ�.

1. INIT[dbname].ora ȭ�� ����
- NLS_DATE_FORMAT = 'RR-MM-DD' �̿� ���� ������ ���� �߰�.
2. Shell ���α׷� �̿�
- C Shell: OS ���¿��� setenv NLS_DATE_FORMAT 'RR/MM/DD'�߰�.
- B Shell: NLS_DATE_FORMAT='RR/MM/DD' export NLS_DATE_FORMAT �߰�.
- K Shell: B Shell ����� �߰��� export NLS_DATE_FORMAT='RR/MM/DD' �� ǥ�� ����
3. SYS.PROPS$ VIEW�� �̿��Ͽ� UPDATE�ϴ� ���
4. Session ���� set �ϴ� ���
- SQLPLUS ���¿��� ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD' ����
- �� SESSION �������� Ȱ�밡��
*/

-- 3. 10�� 13�� ���ķο��ñ��� �� ���� ����Ǿ����� �˾Ƴ� ��. ������� 30���� ������ �ݿø��ؼ� 31 �̶�� ����� ������
SELECT 
  ROUND(SYSDATE- TO_DATE('2013-10-13','RRRR-MM-DD'))||'�� ���' "����� ��"
FROM DUAL;
 
-- 4.���� ���� 14:00�ÿ������� ���� ���� �� �����ٸ� �� �ð��� �ɷ��� �۾��� ������ �˾Ƴ���
--  ����ð��� �������� ó���ؼ� �� �ð��� �ҿ�ƴ��� �˾Ƴ� ��
-- �������� 14:00�� SELECT TO_DATE((TO_CHAR(SYSDATE-1)||' 14:00:00'), 'RRRR-MM-DD HH24:MI:SS') FROM DUAL ;
SELECT TRUNC(TO_CHAR(SYSDATE-TO_DATE((TO_CHAR(SYSDATE-1)||' 14:00:00'), 'RRRR-MM-DD HH24:MI:SS'))*24)||'�ð� ���'  "����ð�"
  FROM DUAL ;
 
--5. �ڽ��� ��������� ������� �� ���� ��Ҵ��� ����ؼ� �˾Ƴ��� (�ø��غ�..)
-- �� ���� ���̿� ���� ���� ��ȸ�ϴ� ����
SELECT CEIL(MONTHS_BETWEEN(TO_DATE(SYSDATE,'RRRR-MM-DD'), 
                      TO_DATE('1988-01-30','RRRR-MM-DD')))  "month"  
  FROM DUAL; 
 
/*
�־��� ���Ϸ� ������ �ε�
 
���� -- hr
 
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
/* ����Ʈ�� Ȱ���ؼ� ���ϴ� ���� ������ */
drop table yh_tbl_emp;
create table yh_tbl_emp as 
(select 
  employee_id ,first_name, last_name, email, phone_number, 
  hire_date, 
  job_id, salary ,manager_id, department_id
  from hr.employees);

--6.tbl_emp ���̺��� ���� �Ի����� ���� ������� ������ ��
select *
from yh_tbl_emp
order by hire_date desc;
 
--7. tbl_emp ���� ��� hire_date ���� 100�������� ������Ʈ �� ��,
update YH_TBL_EMP
set HIRE_DATE=TO_CHAR(HIRE_DATE-365*400,'YYYY-MM-DD')
where EMPLOYEE_ID is not null;

-- 'YYYY-MM-DD'�� ����� ��� 
select 
employee_id ,first_name, last_name, email, phone_number, 
  TO_CHAR(HIRE_DATE,'YYYY-MM-DD') hire_date, 
  job_id, salary ,manager_id, department_id
from YH_TBL_EMP;

--8. department_id  ���� ��� �ټ� ����� �Ҽ��� �� �ڸ������� ���ؼ� ǥ���� ��
select department_id �μ�ID, round(Avg(sysdate-hire_date)/365, 2)||'��' �ټӳ��
from YH_TBL_EMP
group by department_id;

-- 9. �� job_id ���� �μ��� �ο��� ���ϰ� �׵��� ��տ����� ���Ұ� 
-- ������� IT_PROG����  60�� �μ� �ο��� 5 ��  ��տ���5760 ���� ���
select job_id ����ID ,department_id �μ�, count(*) �ο���, AVG(salary) ��տ���
from YH_TBL_EMP
group by job_id,department_id;

/* DISTINCT : �ߺ����� ������.
10. distinct ��� �Լ��� �̿��Ͽ� �� �μ��� �� ������ job_id�� �����Ǿ� �ִ��� �ľ��ϰ�
   ����Ұ�(  ���ͳ� �˻� ���) */
   select department_id, count(distinct job_id)
   from yh_tbl_emp
   group by department_id;

-- ������ 
create sequence seq_num;
select 'P' || 
LPAD(seq_num.nextval, '10', '0') from dual;
select seq_num.CURRVAL from dual;

-- LPAD�� ������ 
create sequence seq_num;
select seq_num.nextval from dual;
select 'P' || 
LPAD(seq_num.nextval, '10','0') from dual;

/* �Խ��� ����� */

-- ���̺� ���� 
create table tbl_yh_bbs (
 bbsno number,
 title varchar2(500) not null,
 content varchar2(2000), 
 writer varchar2(50), 
 regdate date default sysdate, 
 viewcnt number default 0
 );
 
-- primary key ����
alter table tbl_yh_bbs add constraint 
pk_bbs primary key (bbsno);
-- ������ ����
drop sequence seq_yh_bbs;

create sequence seq_yh_bbs;

-- ���̺� �� �Է� 1
insert into tbl_yh_bbs 
(bbsno, title, content, writer) 
values 
(seq_yh_bbs.nextval, '����..','����...','user00');

-- ���̺� �� �Է� 2 // ���� �� ���̺� �ִ� ��� ���� �� ���̺� �ٽ� ����
insert into tbl_yh_bbs (bbsno, title, content, writer) 
(select seq_yh_bbs.nextval, 
  title||seq_yh_bbs.currval,
  content||seq_yh_bbs.currval,
  'user00' from tbl_yh_bbs);

-- ��ü ��ȸ�ϰ� �������� ���� 
select * from tbl_yh_bbs order by bbsno desc;

/*
thinker.ipdisk.co.kr
user00/user00
*/