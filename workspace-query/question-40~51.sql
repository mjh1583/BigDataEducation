-- 문제 40
-- emp 테이블에서 담당 업무 유형별로 급여 최고액, 최저액, 급여총액 및 평균급여 출력하시오.
select max(sal) as '급여 최고액', min(sal) as '급여 최저액', sum(sal) as '급여 총액', avg(sal) as '평균 급여'
	from emp
	group by deptno;
	
-- 문제 41
-- emp 테이블에서 직급별 명수를 출력하시오.
select count(*) 
	from emp
	group by job;
	
-- 문제 42
-- emp 테이블에서 과장의 수를 출력하시오
select job, count(*) 
	from emp
	where job = '과장';
	
-- 문제 43
-- emp 테이블에서 급여 최고액, 급여 최저액의 차액을 출력하시오.
select max(sal) - min(sal)
	from emp;
	
-- 문제 44
-- emp 테이블에서 직급별 사원의 최저 급여를 내림차순으로 출력하시오.
select job, min(sal)
	from emp
	group by job 
	order by min(sal) desc;