# mydb 이용합니다.
use mydb;

select * from dept;
select * from emp;

-- 문제 82
-- 경리부 부서 소속사원의 이름과 입사일을 출력하시오.(emp, dept 테이블 이용)
select e.ename, e.hiredate 
	from emp e 
	join dept d 
	on e.deptno = d.deptno
	where d.deptno = 10;

-- 문제 83
-- 직급이 과장인 사원의 이름과 부서명을 출력하시오.
select e.job, e.ename, d.dname 
	from emp e 
	join dept d 
	on e.deptno = d.deptno
	where e.job = '과장';


-- 문제 84
-- 사원이름과 부서이름을 출력하시오.(emp, dept 테이블 이용)
select e.ename, d.dname 
	from emp e 
	join dept d 
	on e.deptno = d.deptno;

-- 문제 85
-- 
select 

-- 문제 86
-- 
select 

-- 문제 87
-- 
select 

-- 문제 88
-- 
select 

-- 문제 89
-- 
select 

-- 문제 90
-- 
select 

-- 문제 91
-- 
select 

-- 문제 92
-- 
select 











