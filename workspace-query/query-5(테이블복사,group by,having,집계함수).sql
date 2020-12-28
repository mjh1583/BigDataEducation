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