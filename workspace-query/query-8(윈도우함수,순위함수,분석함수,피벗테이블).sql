use sqldb;
-- 순위 매기기 : row_number() over()
-- 같은 키가 존재해도 순위를 정해버림
select row_number() over(order by height desc) as '키 순위', username, addr, height 
	from user;

-- 같은 키가 존재하면 이름으로 순위 정해보기.
select row_number() over(order by height desc, username) as '키 순위', username, addr, height
	from user;

-- rank() over() : 일반적으로 가장 많이 사용되는 순위함수
-- 같은 키가 존재하면 동일한 등수로 만들고 동일한 등수의 수만큼 띄우고 순위를 정함.
select rank() over(order by height desc) as '키 순위', username, addr, height
	from user;

-- dense_rank() over()
-- 같은 키가 존재하면 동일한 등수로 만들고 등수의 수만큼 띄우지 않고 순위를 정하기
select dense_rank() over(order by height desc) as '키 순위', username, addr, height 
	from user;

-- over(partiton by 컬럼명) : 컬럼명에 따라서 그룹지어서 그룹안에서 순위를 정하기
select addr, username, height,
	row_number() over(partition by addr order by height desc) as '지역별 키순위'
	from user;

-- ntile(정수) : 해당하는 row개수에 "그룹"으로 나누어주는 함수
select ntile(2) over(order by height desc) as '반번호', username, addr, height 
	from user;

-- 키순위 상관없이 가나다순으로 5개씩 2개로 나눠서 출력하시오.
select ntile(2) over(order by username) as '반번호', username, addr, height
	from user;

-- 3개로 나눔
select ntile(3) over(order by username) as '반번호', username, addr, height
	from user;

-- 4개로 나눔
select ntile(4) over(order by username) as '반번호', username, addr, height
	from user;

-- 10개로 나눔
select ntile(10) over(order by username) as '반번호', username, addr, height
	from user;

-- 분석 함수
-- lead(컬럼명, offset, default) : 현재 row를 기준으로 다음 행을 참조 
-- lag(컬럼명, offset, default) : 현재 row를 기준으로 이전 행을 참조
select username, addr, height as '키', 
	height - (lead(height, 1, 0) over(order by height desc)) as '다음 사람과 키 차이'
	from user;

select username, addr, height as '키', 
	height - (lead(height, 2, 0) over(order by height desc)) as '다음 사람과 키 차이'
	from user;

select username, addr, height as '키', 
	height - (lag(height, 1, 0) over(order by height desc)) as '이전 사람과 키 차이'
	from user;

-- 지역별 최대키와 차이
-- first_value(컬럼) : 정렬된 값 중에서 첫번째 값을 의미함.
-- last_value(컬럼) : 정렬된 값 중에서 맨 마지막 값을 의미함.
select addr, username, height as '키', 
	height - (first_value(height) over(partition by addr order by height desc)) 
	as '지역별 최대키와 차이'
	from user;
	
-- last_value() 사용할때는 반드시 over절에 
-- rows between unbounded preceding and unbounded following : 정렬결과의 처음과 끝을 대상으로 함.
-- 지역별 최소키와 차이
select addr, username, height as '키', 
	height - (last_value(height) over(partition by addr order by height desc 
	rows between unbounded preceding and unbounded following ))
	as '지역별 최소키와 차이'
	from user;

-- 누적 백분율 함수 cume_dist() : 0~1 사이를 리턴함(==> 100을 곱해줌)
select addr, username, height as '키',
	(cume_dist() over(partition by addr order by height desc)) * 100 as '누적인원 백분율'
	from user;

-- case ~~ when ~~ end
-- sql의 조건문에 해당(if/switch문) 
-- 조건값에 따른 처리를 구분할 수 있음.
-- case when 조건값1 then ~~
-- 		when 조건값2 then ~~
-- 		else ~~
-- end

-- 피벗(pivot) : 한 열에 포함된 여러 값 출력, 이를 여러 열로 변환하여 테이블 반환식 회전, 필요하면 집계까지 수행
drop table if exists pivot;
create table pivot(
	uname varchar(10),
	season varchar(5),
	amount int
);

insert into pivot values('김범수', '겨울', 10),
						('윤종신', '여름', 15),
						('김범수', '가을', 25),
						('김범수', '봄', 5),
						('김범수', '봄', 37),
						('윤종신', '겨울', 40),
						('김범수', '여름', 14),
						('김범수', '겨울', 22),
						('김범수', '겨울', 22),
						('윤종신', '여름', 64);
					
select * from pivot;

-- 피벗 테이블을 만드는 첫번째 (sum(), case when...then...end)
select uname, sum(case when season='봄' then amount end) as '봄'
	from pivot
	group by uname;

select uname, 
	sum(case when season='봄' then amount end) as '봄',
	sum(case when season='여름' then amount end) as '여름',
	sum(case when season='가을' then amount end) as '가을',
	sum(case when season='겨울' then amount end) as '겨울'
	from pivot
	group by uname;

-- 피벗 테이블을 만드는 두번째 방법 (sum(), if())
-- (만약에 season이 봄이면 amount를 sum해라.)
select uname, 
	sum(if(season='봄', amount, 0)) as '봄',
	sum(if(season='여름', amount, 0)) as '여름',
	sum(if(season='가을', amount, 0)) as '가을',
	sum(if(season='겨울', amount, 0)) as '겨울'
	from pivot
	group by uname;

select season, 
	sum(if(uname='김범수', amount, 0)) as '김범수',
	sum(if(uname='윤종신', amount, 0)) as '윤종신',
	sum(amount) as '합계'
	from pivot
	group by season
	order by amount;
	