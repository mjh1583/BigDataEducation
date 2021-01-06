use world;
show tables;
desc city;
select * from city where CountryCode = 'KOR';
select * from city where Population > 5000000;

insert into city(id, name, CountryCode, District, Population) values(10000, 'sample', 'KOR', 'test', 2000000);
insert into city values(20000, 'sampletest', 'KOR', 'test2', 1000000);

select count(*) from city; 
select * from city where ID = 10000;
select * from city where ID = 20000;

update city set Name = 'sampleUpdate' where ID = 10000;
update city set Population = 3000000 where ID = 20000;

delete from city where ID = 10000;
delete from city where ID = 20000;

-- 결과 정렬(order by)
-- select 문의 결과값을 특정한 컬럼을 기준으로 오름차순/내림차순 정렬해서 표시.

-- 국가코드가 'KOR'인 도시를 찾아 인구수의 역순으로 표시하시오.
select * from city where CountryCode = 'KOR' order by Population desc;

-- city 테이블에서 국가코드와 인구수를 출력하시오. 정렬은 국가코드별로 오름차순으로,
-- 동일한 코드(국가)안에서 인구 수의 역순으로 표시하시오.
select CountryCode, Population 
	from city 
	order by CountryCode, Population desc;

-- 결과값 일부 조회 : 상위 몇개만 보여주는 쿼리
-- limit (오라클 - rownum, SQLServer - top)

-- 국가코드가 'KOR'인 도시들 중 인구수 많은 순서로 상위 10개만 표시하시오.
select * from city
	where CountryCode = 'KOR'
	order by Population desc
	limit 10;

-- city 테이블의 내용에서 국가코드가 'KOR'인 도시를 찾아
-- city_kor 테이블에 넣으시오.
desc city;
show create table city;

CREATE TABLE `city_kor` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` char(35) NOT NULL DEFAULT '',
  `CountryCode` char(3) NOT NULL DEFAULT '',
  `District` char(20) NOT NULL DEFAULT '',
  `Population` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
);

insert into city_kor
	select * from city where CountryCode = 'KOR';

select * from city_kor;

-- --------------------------------------------------------------------------
use mydb;
-- mydb 데이터 베이스를 이용
-- 문제 28
-- emp 테이블에서 급여가 500이 초과되는 사원들을 출력하는 쿼리문을 작성하시오.
select *
	from emp
	where sal > 500;

-- 문제 29
-- 서브쿼리를 사용하여 테이블 emp_copy에 emp테이블의 모든 레코드를 추가하는 쿼리문을 작성하시오.
-- 1단계 : emp 테이블 조회(건수 확인)
-- 2단계 : emp_copy 테이블 만들기(emp와 동일하게)
-- 3단계 : 레코드 복사하기
-- 4단계 : emp_copy 테이블 조회(건수 확인)

select count(*) from emp;

drop table if exists emp_copy;
create table emp_copy
	select * from emp;

select count(*) from emp_copy;

-- 문제 30
-- 서브쿼리를 이용하여 emp_copy테이블에 저장된 사원 정보 중
-- 과장들의 최소 급여보다 많은 급여를 받는 사원들의 이름과 급여와 직급을 출력하시오.
-- 단 과장은 출력하지 않는 SQL문을 완성하시오.
select ename, sal, job 
	from emp_copy
	where sal > (
	select min(sal) from emp_copy where job = '과장')
	and job != '과장';

-- 문제 31
-- emp_copy테이블에 저장된 사원 정보 중 인천에 위치한 부서에 소속된 사원들의 급여를
-- 100 인상하는 SQL문을 작성하시오. (서브쿼리 작성시 dept테이블 이용)
select * from emp_copy;
select * from dept;

update emp_copy 
	set sal = sal + 100 
	where deptno = 
	(select deptno 
		from dept 
		where loc = '인천');

-- 문제 32
-- emp_copy 테이블에서 경리부에 소속된 사원들만 삭제하는 SQL문을 작성하시오.
-- (서브쿼리 dept 이용)
select * from emp_copy;
select * from dept;

select * from emp_copy 
	where deptno = (select deptno 
						from dept 
						where dname = '경리부');
					
delete from emp_copy 
	where deptno = (select deptno 
						from dept 
						where dname = '경리부');

-- 문제 33
-- emp를 이용하여 서브쿼리를 이용해서 '이문세'와 동일한 직급을 가진 사원을 출력하는
-- SQL 문을 완성하시오.
select * 
	from emp
	where job = (select job 
					from emp 
					where ename = '이문세');

-- 문제 34
-- 서브쿼리를 이용하여 '이문세'의 급여와 동일하거나 더 많이 받는 사원명과 급여를
-- 출력하는 SQL문을 작성하시오.
select ename, sal
	from emp
	where sal >= (select sal 
					from emp 
					where ename = '이문세');

-- 문제 35
-- 서브쿼리를 이용하여 '인천'에서 근무하는 사원의 이름, 부서번호를 출력하는 SQL문을 작성하시오.
select ename, deptno
	from emp
	where deptno = (select deptno 
						from dept 
						where loc = '인천');

-- 문제 36
-- 급여가 500을 초과하는 사원과 같은 부서에 근무하는 사원의
-- 이름, 월급, 부서번호를 출력하시오.(다중행 서브쿼리)
-- 서브쿼리에 중복된 값이 나올 수 있으니 distinct를 이용
select ename, sal, deptno
	from emp
	where deptno in(select distinct deptno 
						from emp 
						where sal > 500);
					
-- 문제 37
-- 서브쿼리를 이용하여 30번 부서의 최대급여보다 많은 급여를 받는 사원의
-- 이름과 월급을 출력하시오.
select ename, sal
	from emp
	where sal > (select max(sal)
					from emp
					where deptno = 30);

-- 문제 38
-- 30번 부서의 최소 급여보다 많은 급여를 받는 사원의 이름과 월급을 출력하시오.
select ename, sal
	from emp
	where sal > (select min(sal)
					from emp
					where deptno = 30);

-- 문제 39
-- emp 테이블을 이용하여 급여 최고액, 최저액, 급여총액 및 평균급여 출력하시오.
select max(sal) as '급여 최고액', min(sal) as '급여 최저액', sum(sal) as '급여 총액', avg(sal) as '평균 급여'
	from emp;