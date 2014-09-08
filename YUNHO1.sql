SELECT * FROM SCOTT.EMP;
SELECT * FROM SCOTT.DEPT;
SELECT * FROM SCOTT.SALGRADE;
SELECT * FROM SCOTT.BONUS;
select deptno, Max(hiredate)
from scott.emp
group by deptno;