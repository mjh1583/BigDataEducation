-- 수학함수
-- 절대값
select abs(-777); 
select abs(777); 

-- ceiling() : 무조건 올림, floor() : 무조건 내림, round() : 반올림 함수
select ceiling(10.1);
select ceiling(10.0);
select ceiling(10.01);
select floor(10.99999); 
select round(11111.478); 
select round(10.5); 

-- conv() : 진법변환 해줌. 16진수 => 2진수, 10진수 => 8진수
select conv('F', 16, 10); 
select conv('F', 16, 2); 
select conv('FF', 16, 2); 
select conv('100', 10, 8); 

-- mod(), %(이항연산자) : 나머지값 구하는 함수
select mod(220, 10);
select mod(228, 10);
select 228 % 10;
select 228 mod 10;

-- pow() : 거듭제곱 구하는 함수, sqrt() : 제곱근 구하는 함수
select pow(3, 3); 
select sqrt(25); 

-- rand() : 0.000000 ~ 0.999999 사이의 임의값을 출력하는 함수
select rand(); 
select floor(1 + (rand()*6)); 
select floor(1 + (rand()*45)); 

-- sign() : 양수인지 0인지 음수인지를 확인하는 함수
select sign(123), sign(0), sign(-123);

-- truncate() : 해당 자릿수까지만 출력하고 나머지는 버리는 함수
select truncate(2222.2222, 2);
select truncate(2222.2272, 2);
select truncate(2222.2272, -2);

-- 날짜 함수들
-- adddate() : 단위로 day, month, year단위 interval을 주게되면
-- 주어진 날짜로부터 뒷날 리턴함(더하는 개념)
select adddate('2021-02-01', interval 15 day); 
select adddate('2021-02-01', interval 15 month); 
select adddate('2021-02-01', interval 15 year); 

-- subdate() : 단위로 day, month, year단위 interval을 주게되면
-- 주어진 날짜로부터 앞날 리턴함(빼는 개념)
select subdate('2021-02-01', interval 15 day); 
select subdate('2021-02-01', interval 15 month); 
select subdate('2021-02-01', interval 15 year); 

-- addtime() : 시간을 더하는 함수
select addtime('10:10:10', '1:1:1'); 

-- subtime() : 시간을 빼는 함수
select subtime('10:10:10', '1:1:1'); 

-- 현재날짜, 현재시간, 현재날짜와 시간, 현재날짜와 시간
select curdate();
select curtime();
select now();
select sysdate(); 

-- year() 년도, month() 월, day() 일을 추출해서 출력함
select year(curdate());
select month(curdate());
select day(curdate());

select hour(curtime());
select minute(curtime());
select second(curtime());

select datediff('20210101', sysdate()); 
select datediff('20210217', sysdate()); 
-- 현재부터 인자값까지의 날짜 차이 리턴
select datediff(now(), '20210101'); 

-- 시간의 차이 구하기
select timediff('17:30:00', curtime()); 
select timediff(curtime(), '17:30:00'); 

select dayofweek(curdate());  -- 요일을 리턴하는데 상수값 리턴함. 일요일 1을, 월요일 2,... 
select monthname(curdate());  -- 달의 이름을 영어로 리턴함
select dayofyear(curdate());  -- 1년 중에 몇일 째인지 리턴함

-- last_day() : 주어진 달의 마지막날 리턴함.
select last_day(curdate());
select last_day('20210201');

-- makedate() : 2021년에서 60일째 되는 날을 리턴함.
select makedate(2021, 60); 

-- maketime() : 인자값으로 시간을 만들어 리턴함.
select maketime(17, 30, 00);

select period_add('202010', 4); 
select period_diff(202102, 202010); 

select quarter(curdate()) as '분기'; 

-- 시스템 함수
select current_user(), database();
use testdb;
select current_user(), database();

-- found_rows() : 이전 조회된 rows의 건수를 리턴함.(버전별로 상이함)
select found_rows();
select * from member;
select found_rows();

select sleep(3), '3초 후에 이게 보입니다.';
