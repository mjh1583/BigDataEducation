# DBMS의 종류
-- 관계형 데이터베이스(RDBMS)
-- 	- 테이블(Table based)기반의 RDBMS.
--     - 테이블-컬럼 형태의 데이터 저장 방식
--     - 여러 테이블을 합쳐 큰 테이블을 생성(조인:JOIN)해서 필요한 정보를 찾아내는 방식.
-- NoSQL(Not only SQL) : 비정형 데이터 저장에 사용, 빅데이터

 # 기본용어
--  1) 스키마(Schema) : DB, 테이블 정의 내역
--  2) SQL 쿼리(SQL Query) : RDBMS를 사용하는 전용 질의언어
-- 						 대소문자 가리지 않음.
--  3) 기본키(Primary Key : PK) : 테이블에서 하나의 레코드를 지정할 수 있는 하나 이상의 컬럼집합.
-- 							    ex)주민등록번호
--  4) 외래키(Foreign Key : FK) : 어떤 테이블의 기본키가 다른 테이블의 컬럼에 들어 있을 경우.

 # SQL(Structured Query Language) 
--  1) 데이터베이스에 있는 필요한 정보를 사용할 수 있도록 도와주는 언어.
--  2) 대소문자 구별하지 않음

--  사용자
--  프로그램--------SQL----------DBMS ------------DB
 
 # CRUD(Create, Retrieve(Read), Update, Delete)
 -- - 기본적인 데이터 처리 기능인 생성, 읽기(Read), 갱신, 삭제를 묶어서 일컫는 말  
 
 # 서브쿼리(SubQuery)
-- 	- 쿼리문 내에 또다른 쿼리문이 있는 형태
--     - 사용가능한 위치 select/from/where/having/order by
-- 				  insert/update

use world;
-- 국가명이 'South Korea'의 국가코드를 찾아 이에 해당되는 도시의 수를 표시하시오.
-- count(*)
select count(*)
	from city
    where CountryCode = 'KOR';
    
select code
	from country
    where Name = 'South Korea';
    
select count(*)
	from city
    where CountryCode = (select code 
							from country 
                            where name = 'South Korea');

# 집계(집합) 함수 : aggregation function
-- 테이블의 전체레코드를 대상으로 특정 칼럼을 적용해서 한개의 값을 리턴하는 함수
-- count() : 레코드의 개수를 리턴하는 함수
-- sum()/avg() : 컬럼값의 합/평균을 리턴
-- max()/min() : 컬럼값의 최소/최대값을 리턴

-- select affrgation_function(컬럼명) from 테이블명 where 조건절;

-- city테이블에서 국가코드가 'KOR'인 도시의 수를 표시하시오
select count(*) 
	from city 
    where CountryCode = 'KOR';

-- city테이블에서 국가코드가 'KOR'인 도시들의 인구수 총합을 구하시오.
select sum(population)
	from city
    where countrycode = 'KOR';
    
-- city테이블에서 국가코드가 'KOR'인 도시들의 인구수 평균을 구하시오.
select avg(population)
	from city
    where countrycode = 'KOR';
    
-- city테이블에서 국가코드가 'KOR'인 도시들의 인구수 중 최대값을 구하시오.
select max(population)
	from city
    where countrycode = 'KOR';
    
-- city테이블에서 국가코드가 'KOR'인 도시들의 인구수 중 최소값을 구하시오.
select min(population)
	from city
    where countrycode = 'KOR';
    
-- city 테이블에서 국가코드가 'KOR'인 도시의 평균 인구 수보다 많은 
-- 도시들의 이름과 인구수를 표시하시오.(인구수가 많은 순서로)
select Name, population
	from city
    where population > (select avg(population) 
							from city 
                            where countrycode = 'KOR')
	order by population desc;