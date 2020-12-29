-- 테이블을 복사하는 방법
use sqldb;

-- buy의 데이터 전부를 쿼리를 해서 새로운 테이블인 buy_copy로 복사함.
drop table if exists buy_copy;
create table buy_copy (
	select * 
		from buy
);

desc buy;
desc buy_copy;

-- 테이블 복사를 하게 되더라도 PK, FK등의 제약조건은 복사가 되지 않음.
select * from buy_copy;

-- 기본적 쿼리문 순서(매우 중요함)
-- 무조건 아래와 같은 순서로 작성을 해야한다.
-- select...
--   from...
--   where...
--   group by...
--   having...
--   order by...

-- 고객이 구매한 건수를 확인하는 쿼리문.
-- 문제는 중복되는게 많음. 집계가 안되어 보기에 어려움.
-- group by절을 이용하면 편리함.
select userId, amount 
	from buy
	order by userId;

-- 고객별로 구매한 건수가 한 눈에 들어옴
-- sum()은 집계함수임. group by를 할 때 userId로 하겠다는 의미임.
-- 집계함수류가 나오면 무조건 group by 절이 들어가야 함.
-- 현업에서 정말 많이 사용함.
select userID, sum(amount)
	from buy
    group by userID
    order by sum(amount) desc;

select userID as '아이디', sum(amount) as '구매 건수'
	from buy
    group by userID
    order by sum(amount) desc;

select userID as '아이디1', sum(amount) as '구매 건수1'
	from buy
    group by userID
    order by sum(amount) desc;

-- 총 구매액을 집계 해보자.
-- 총 구매액은 총 구매수량 * 단가가 됨.
select *
	from buy;

-- 고객별로 총 구매액을 기준으로 내림차순으로 정렬하는 쿼리문임.
select userID as '아이디', sum(price * amount) as '총 구매액'
	from buy
    group by userID
    order by sum(price * amount) desc;

-- 고객별로 평균 구매갯수를 알아보는 쿼리문을 작성.
select userID as '아이디', avg(amount) as '평균 구매갯수'
	from buy
    group by userID
    order by avg(amount) desc;

-- 모든 고객을 대상으로 평균 구매갯수를 알아보는 쿼리문
select avg(amount)
	from buy;

-- max(), min()
select name, height
	from user;

-- name 별로 group by절을 적용시키니 10개의 데이터가 다 나옴.
select name, max(height), min(height)
	from user
    group by name;
    
-- 서브쿼리 이용하면 적절한 결과 도출 가능
select name, height
	from user
    where height = (
		select max(height)
			from user
    ) or height = (
		select min(height)
			from user
    );

-- 휴대폰이 있는 사람 수 출력
select * 
	from user;
    
select count(*) as '휴대폰이 있는 사람'
	from user
    where mobile1 is not null;

use employees;
select *
	from employees;

use sqldb;

-- 총 구매액으로 내림차순으로 정렬하시오.
select userID as '아이디', sum(price * amount) as '총 구매액'
	from buy
    group by userID
    order by sum(price * amount) desc;
    
-- 총 구매액이 1000만원 이상만 보고싶다면 어떻게 해야 될까요?
-- having : 조건절임
select userID as '아이디', sum(price * amount) as '총 구매액'
	from buy
    group by userID
    having sum(price * amount) >= 1000
    order by sum(price * amount) desc;

-- with rollup
-- 부분별로 소합계를 내어주고 마지막에 총합계를 보여줌.
select groupname, sum(price * amount)
	from buy
    group by groupname
    with rollup;






