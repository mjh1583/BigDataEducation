-- JOIN 개념
-- 서로 다른 테이블을 공통 컬럼을 기준으로 합치는 (결합하는) 테이블 단위 연산.
-- 조인의 결과 테이블은 이전 테이블의 컬럼 수의 합과 같음.
-- select * from 테이블1 join 테이블2 on 테이블1.컬럼명 = 테이블2.컬럼명 ...
-- 현업에서도 많이 사용 되기때문에 반드시 알아둘 필요가 있음.

use sqldb2;

desc buy;
desc user;

-- user가 첫번째 테이블이 되고, buy가 두번째 테이블이 됨
-- user에 PK인 userID와 buy의 FK인 userID가 서로 같은 것을 조건으로 해서
-- 내부조인 함. KYM의 조건을 줘서 KYM의 내용만 출력된 쿼리문을 작성한 것임.
select *
	from user 
	inner join buy
	on user.userID = buy.userID
	where buy.userID = 'KYM';

-- 아래 에러가 남
-- 바로 userid 때문임. userid는 buy, user 두개의 테이블에 존재하기 때문임.
-- userid 컬럼이 어떤 테이블의 userid인지 모호하기 때문에 에러가 남.
select userid, username, prodname, addr, concat(mobile1, mobile2) as '연락처'
	from buy
	inner join user
	on buy.userID = user.userID;

-- 명시적으로 테이블명.컬럼명으로 표기함
-- =>alias를 사용해서 쿼리를 줄일 수 있음.
select buy.userid, user.username, buy.prodname, user.addr, concat(user.mobile1, user.mobile2) as '연락처'
	from buy
	inner join user
	on buy.userID = user.userID;

-- 테이블에 직접 알리어스 설정하여 활용한 쿼리문임.
select b.userid, u.username, b.prodname, u.addr, concat(u.mobile1, u.mobile2) as '연락처'
	from buy b
	inner join user u
	on b.userID = u.userID;

select b.userid, u.username, b.prodname, u.addr, concat(u.mobile1, u.mobile2) as '연락처'
	from buy b
	inner join user u
	on b.userID = u.userID
	order by u.userID;

select * 
	from user;

select * 
	from buy;

select b.userid, u.username, b.prodname, u.addr, concat(u.mobile1, u.mobile2) as '연락처'
	from user u
	inner join buy b
	on u.userID = b.userID
	order by u.userID;

-- left outer 조인임.
-- 왼쪽 테이블(user)을 다 출력한 구문임.
select b.userid, u.username, b.prodname, u.addr, concat(u.mobile1, u.mobile2) as '연락처'
	from user u
	left outer join buy b
	on u.userID = b.userID
	order by u.userID;

-- buy에 구매기록이 존재하는 사람들에게 신년메시지를 보내고 싶다.
-- 이럴때 해당 사람에 대한 쿼리문을 작성하시오.
select distinct b.userid, u.userName, u.addr, concat(u.mobile1, u.mobile2) as '연락처'
	from buy b
	inner join user u
	on u.userID = b.userID
	where u.mobile1 is not null
	order by u.userID;
