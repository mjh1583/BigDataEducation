select * 
	from employees.employees;

use sqldb;

drop table if exists test4;
create table test4(
	id int,
    fname varchar(20),
    lname varchar(20)
);

-- test4에 대용량 데이터 바로 입력
insert into test4 
	select emp_no, first_name, last_name
		from employees.employees;
        
select * 
	from test4;

-- 테이블을 만들면서 바로 select를 이용할 수 있음 (test5)
drop table if exists test5;
create table test5
	(	select emp_no, first_name, last_name
			from employees.employees
	);

select * 
	from test5;
    
-- update 구문
-- update ... set ... where 형태로 사용.
-- 만약 where(조건절)가 없다면, 모든 데이터를 수정해버림. 주의필요함.

-- update를 할때는 먼저 수정할 대상을 select문으로 확인하고 실행해야 안전함.
select *
	from test4
	where fname = 'Kyoichi';
    
update test4
	set lname = '없음'
    where fname = 'Kyoichi';

-- 전체를 대상으로 update하는 경우도 있음.
-- 제품 단가가 올린다던지, 월급이 5%인상 된다던지 등등
-- where 절이 필요 없음.

desc buy;
select * 
	from buy;

update buy
	set price = price * 1.5;

-- delete 문에서도 역시 where가 없다면 모든 데이터를 다 지우게 됨.
-- where절을 반드시 넣도록 함.
select * 
	from test4
    where fname = 'Aamer';

delete from test4
	where fname = 'Aamer';

create table big1 (
	select *
		from employees.employees
);

create table big2 (
	select *
		from employees.employees
);

create table big3 (
	select *
		from employees.employees
);

-- 아래와 같이 데이터를 지우는 3가지 방법이 있음.
-- 속도적인 면을 살펴보면 drop -> truncate -> delete 순으로 빠름.
-- delete구문은 트랙잭션으로 인하여 지우기 때문에 느릴수 밖에 없음.
-- ==> 테이블과 함께 데이터를 다 지우고 싶다면 drop을 권하고
-- 테이블 구조는 남아있게 할려면 truncate(DDL)구문 쓰기를 권잘
-- 하지만, 현업에서는 drop, truncate구문은 잘 사용하지 않음.
drop table big1;
delete from big2;
truncate table big3;

select *
	from big1;

select *
	from big2;

select *
	from big3;
    
use sqldb;
drop table if exists member;
create table member(
	select userid, name, addr
		from user
        limit 3
);
-- 테이블을 위와 같이 만들면, 제약조건은 따로 복사가 안됨.
-- ==> alter구문 이용해서 직접 제약조건을 설정함.

select * 
	from member;

desc member;
desc user;

-- alter라는 DDL구문은 테이블을 수정할 때 사용함.
-- 아래는 member 테이블에 PK를 추가하는 구문임.
alter table member
	add constraint pk_member primary key(userid);

-- 데이터를 입력하기 위해 아래코드 작성
-- 입력안됨. 그 이유는 PK 중복때문.
-- PK는 데이터 무결성을 지키는 제약조건임.
insert into member values('BBK', '바비코', 'LA');
insert into member values('SKJ', '신국주', '서울');
insert into member values('CHUNLI', '춘리', '상해');

-- insert ignore into 구문은 PK가 중복되는 것을 무시하고 아래 2개의 입력은 실행됨.
insert ignore into member values('BBK', '바비코', 'LA');
insert ignore into member values('SKJ', '신국주', '서울');
insert ignore into member values('CHUNLI', '춘리', '상해');

-- on duplicate key update 구문은 현업에서 사용하지 않음.
-- OCP, SQLD 자격증 시험에 한번씩 나오므로 이론적으로 알아둘 필요는 있음.
insert into member values('BBK', '바비코', 'LA')
	on duplicate key update name = '바비코', addr = 'LA';