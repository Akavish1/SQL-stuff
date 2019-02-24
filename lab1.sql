select * from emp where ename like 'S%' and sal > 2000; --1

select avg(sal) from emp where deptno = 10; --2

select count(deptno) from emp where deptno = 10; --3

select distinct job from emp where sal > 1000 and sal < 2000; --4

select ENAME, sal from emp where JOB = 'CLERK'; --5

select avg(sal) from emp where job = 'CLERK'; --6

select * from emp where job != 'CLERK'; --7

select * from emp where deptno != 20; --8

select * from emp where ename like '%RK'; -- 9

select * from emp where ename like 'TURNER'; --10

select * from emp where hiredate>to_date ('02/12/1981','dd/mm/yyyy') and mgr = 7566; --11

select ename, empno from emp where hiredate>=to_date('03/12/1981','dd/mm/yyyy') and hiredate<=to_date('21/01/1982','dd/mm/yyyy') ; --12


