use sqldb2;

-- 내부조인 : 조건에 해당하는 행만 리턴하는 조인.
-- 외부조인 : 특정 컬럼을 기준으로 매칭된 집합을 출력하지만
-- 			한쪽의 집합은 모두 출력하고 다른 한쪽의 집합은 매칭되는 칼럼의 값만 출력함
-- self 조인 : 동일한 테이블끼리 특정 컬럼을 기준으로 매칭되는 집합을 출력함.
-- cross 조인 : 곱집합을 반환함

select * 
	from buy b;
	
select *
	from `user` u;
	
-- 구매내역이 없는 회원정보까지 다 출력하시오.
select u.userID, u.userName, b.prodName, u.addr, concat(u.mobile1, u.mobile2) as '연락처'
	from user u
	left outer join buy b 
	on u.userID = b.userID
	order by u.userID;

-- right outer join은 left outer join에서 테이블 자리만
-- 바꿔주면 되는 것임.
select u.userID, u.userName, b.prodName, u.addr, concat(u.mobile1, u.mobile2) as '연락처'
	from buy b
	right outer join `user` u
	on u.userID = b.userID
	order by u.userID;

-- 상호 조인
-- cross join의 결과 개수는 두 테이블의 행의 개수를 곱하여 나온 개수가 됨.
-- 카티션 곱(Cartesian Product)이라고도 부름.
-- 일반적으로 대용량데이터를 생성할 때 사용함.
-- buy : 12행, user : 10행

select *
	from buy b 
	cross join `user` u;

use employees;
-- employees : 300,024건
-- title : 443,308건

-- 셀프 조인 : 테이블 하나로 두개 이상엮어서 결과값을 추출해내는 방법임.
-- 셀프조인은 주로 계층구조를 수평적안 관계로 바꾸는 역할을 해줌.
use sqldb2;
drop table if exists emp;
create table emp(
	emp char(3) not null primary key,
	manager char(3),
	emptel varchar(8)
);

insert into emp values('나사장', null, '0000'),
					  ('김재무', '나사장', '2222'),
					  ('김부장', '김재무', '2222-1'),
					  ('이부장', '김재무', '2222-2'),
					  ('우대리', '이부장', '2222-2-1'),
					  ('지사원', '이부장', '2222-2-2'),
					  ('이영업', '나사장', '1111'),
					  ('한과장', '이영업', '1111-1'),
					  ('최정보', '나사장', '3333'),
					  ('윤차장', '최정보', '3333-1'),
					  ('이주임', '윤차장', '3333-1-1');

select * 
	from emp;

select *
	from emp
	where emp = '이부장';

-- 우대리의 상관인 이부장의 전화번호를 나타내시오.
-- emp를 마치 2개가 있는 것처럼 분리해서 조건을 설정해야 함.
select a.emp as '부하직원', b.emp as '직속상관', b.emptel
	from emp a
	inner join emp b
	on a.manager = b.emp
	where a.emp = '우대리';

-- not in과 in을 알아봄.
-- not in : 서브쿼리나 데이터값을 제외할 때 사용되는 것임.
-- in : 포함할때 사용하는 것임.
-- 핸드폰 번호가 없는 사람들을 제외하고 출력하는 쿼리문을 만드시오.
select userName, concat(mobile1, mobile2) as '연락처'
	from user
	where userName not in(
		select userName 
			from user
			where mobile1 is null
	);

-- 핸드폰 번호가 없는 사람만 출력하시오.
select userName, concat(mobile1, mobile2) as '연락처'
	from user
	where userName in(
		select userName 
			from user
			where mobile1 is null
	);
