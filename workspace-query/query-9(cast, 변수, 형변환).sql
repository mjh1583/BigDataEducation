use sqldb;

show variables;
-- MySQL의 엔진은 어떤 문자셋을 사용하고 있는지 알기 위한 코드
-- utf-8이라는 문자셋 사용함. 한글이 3바이트로 설정되어 있음.
show variables like 'character_set_system';

-- DDL(Data Definition Language) : 데이터베이스와 테이블을 CRUD

-- cast문은 현재 문자열을 date 데이터타입으로 캐스팅(변환) 시켜줌.
select cast('2021-01-08 15:40:30:489' as date) as '날짜';

select cast('2021-01-08 15:40:30:489' as time) as '시각';

-- 8바이트
-- datetime데이터 타입 : 문자형 데이터 타입으로 저장됨.
select cast('2021-01-08 15:40:30:489' as datetime) as '날짜와 시각';

select now();

-- 4바이트
-- timestamp데이터 타입 : 숫자형 데이터 타입으로 저장됨.
select timestamp(now());

drop table if exists timet;
create table timet(
	num int,
	date_timestamp timestamp not null,
	date_datetime datetime not null
);

insert into timet values(1, now(), now());

select * 
	from timet;

-- =========================================================================================
set @var1 = 5;
select @var1;

set @var2 = 3;
set @var3 = 5.77;
set @var4 = '이름 :';

select @var1 + @var2;

-- 보기 좋게 출력하기 위해서 변수 사용함.
select @var4, username
	from user
	where height > 180;

-- 변수는 limit절에 사용못함.
select @var4, username
	from user
	where height > 180;
	-- limit @var2;

-- 동적 쿼리문 사용하기
-- prepare ... execute ... using문 사용.

-- 변수를 지정하고, 
-- myquery라는 명으로 ''안에 있는 쿼리문을 준비함.
-- ? : 변수명을 대입하고 execute문을 실행하는 것임.

-- =>응용SW에서 사용자로부터 입력받아서 출력한다면 이렇게 변수를 사용하면 됨.
-- (중요한 부분이니 잘 정리가 필요함)
set @var1 = 3;
prepare myquery 
	from 'select username, height 
			from user
			order by height
			limit ?';

execute myquery using @var1;

-- buy 테이블의 amount 평균 나타냄 ==> 소숫점을 반올림하고 싶을때?
-- 소수점을 반올림하고 싶을때는 cast(), convert() 사용하면됨.
select avg(amount) as '평균 구매 갯수'
	from buy;

-- signed : 부호가 있는 (양수, 음수)
-- unsigned : 부호가 없는 (양수)
select cast(avg(amount) as signed integer) as '평균 구매 갯수'
	from buy;

select convert(avg(amount), signed integer) as '평균 구매 갯수'
	from buy;

select cast(avg(amount) as decimal(3,2)) as '평균 구매 갯수'
	from buy;

-- concat() : 문자열 연결 함수
select num, cast(price as char(10))
	from buy;
	
select num, cast(price as char(10)), '*', cast(amount as char(4))
	from buy;	
	
select num, concat(cast(price as char(10)), '*', cast(amount as char(4))) as '단가 * 수량'
	from buy;
	
select num, concat(cast(price as char(10)), '*', cast(amount as char(4))) as '단가 * 수량',
	price * amount as '구매액'
	from buy;

-- cast, convert() 함수 : 명시적 형변환함.
select num, concat(cast(price as char(10)), '*', cast(amount as char(4)), ' =') as '단가 * 수량',
	price * amount as '구매액'
	from buy;

-- 묵시적, 암시적, 자동 형변환
select 100 + '100';	
select 100 + cast('100' as signed int);

select concat('100', '원입니다.');

-- concat() 함수 : 인자값으로 숫자가 들어왔어도 문자로 묵시적 형변환 일어남.
select concat(100, '원입니다.');

-- false(거짓) : 0
-- true : 0을 제외한 나머지 숫자
select 1 > '2mega';

select 1 < '2mega';
