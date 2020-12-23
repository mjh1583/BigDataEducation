use sqldb;

-- 서브쿼리 : 쿼리문 안에 또 다른 쿼리문이 있는 것을 의미함.
-- 키가 177초과되는 데이터를 출력하시오
-- 김경호의 키가 177을 알고 있을때 쿼리를 작성할 수 있음.
-- 그런데 김경호라는 이름만 알고 키를 모른다면 어떻게 해야하나?
-- 이때 서브쿼리 이용을 적절히 해주면 됨.

select name, height
	from user 
    where height > 177;

-- 아래는 서브쿼리를 작성해서 위와 같이 동일한 결과를 출력함.
-- 실행순서는 먼저 서브쿼리가 실행되고 그 결과값을 가지고
-- 메인쿼리(상위쿼리)를 진행함
-- 서브쿼리의 결과값이 177인것을 알 수 있음.
select name, height
	from user
    where height > (select height 
						from user 
                        where name = '김경호');

-- 아래 쿼리문을 실행해보면 에러 발생. 그 이유는 서브쿼리 결과값이
-- 반드시 1개여야지만 비교대상이 됨.
-- 서브쿼리의 결과값이 2개 나왔다라는 것은 비교대상이 모호성이 발생함.
select name, height
	from user
    where height > (select height 
						from user 
                        where addr = '경남');

-- 서브쿼리의 결과값이 170, 173임.
-- 위의 코드에다가 서브쿼리 앞에 any를 붙임.
-- 서브쿼리 앞에 any의 의미는 or 개념과 비슷함. 170이거나 173임.
-- 170 이상인 데이터를 다 출력하겠다는 의미가 됨.
-- 서브쿼리에서 반환하는 값은 키(height)라는 것임.
select name, height
	from user
    where height > any (select height 
						from user 
                        where addr = '경남');

-- any나 some은 동일한 기능을 함.
select name, height
	from user
    where height > some (select height 
						from user 
                        where addr = '경남');

-- all은 서브쿼리의 결과 값 둘다 만족하는 데이터만 출력함.
-- 즉, 170, 173 다 만족하는 값은 173인 것임.
select name, height
	from user
    where height > all (select height 
						from user 
                        where addr = '경남');

-- 부등호를 바꾸면 170, 173과 똑같은 결과값만 리턴함.
select name, height, addr
	from user
    where height = any (select height 
						from user 
                        where addr = '경남');

-- 위의 코드를 in()를 사용해서 바꿔본 쿼리임.
select name, height, addr
	from user
    where height in (select height 
						from user 
                        where addr = '경남');

-- 정렬
-- 기본적으로 order by절을 사용함. 오름차순(asc)로 정렬됨
select * 
	from user;
    
select * 
	from user
    order by name;

-- desc : 내림차순 의미. desc는 생략 불가함.
select * 
	from user
    order by name desc;

select * 
	from user
    order by height desc;

select * 
	from user
    order by addr asc, name desc;

-- order by 절을 적절히 잘 이용을 하면 보기 좋게 정렬을 하기 때문에
-- 데이터 가독성이 높아짐.
select * 
	from user
    order by addr asc, name asc;

-- user에서 회원들이 사는 지역이 어딘지 알고 싶다.
-- 아래와 같이 쿼리를 실행하면 중복된 데이터가 나오는 것을 알 수 있음.
-- 그냥 사는 지역만 보고자 한다면 중복된 데이터를 제거하고 출력해야함.
select * 
	from user;

-- 중복을 제거하는 키워드가 바로 distinct임.
-- 현업에서 많이 쓰는 키워드이므로 반드시 기억해야함.
select distinct addr
	from user;
    
-- select distinct 컬럼명1, 컬럼명2, ... from 테이블명 where 조건절

use world;
-- 1) 국가코드가 'KOR'인 도시들의 국가코드를 표시하시오.
select countrycode
	from city
    where countrycode = 'KOR';
-- 2) 국가코드가 'KOR'인 도시들의 국가코드를 중복제거해서 표시하시오.
select distinct countrycode
	from city
    where countrycode = 'KOR';

use employees;

select *
	from employees
    order by hire_date;	
  
-- limit을 쓰지 않고 출력하면 30만건을 다 조회해 가져와서 쿼리를 실행하니 비효율적임
-- ==> limit 키워드를 적절히 이용함.
 select *
	from employees
    order by hire_date
    limit 30;
    
select *
	from employees
    order by hire_date
    limit 100, 5;    

select *
	from employees
    order by hire_date
    limit 1000, 5;      -- 좌측처럼하면 1000번째 부터 5명 출력함.
    
    
    
    
