-- 문제 63
-- -44, -77, -100에 대한 절대값을 출력하시오.
select abs(-44), abs(-77), abs(-100);

-- 문제 64
-- cast()을 이용하여 2021-02-17 11:22:44:777을 날짜만 출력하시오.
-- convert() ~~
select cast('2021-02-17 11:22:44:777' as date);
select convert('2021-02-17 11:22:44:777', date);

-- 문제 65
-- 문제 64에서 해당 데이터를 시간만 따로 출력하시오.
select cast('2021-02-17 11:22:44:777' as time);
select convert('2021-02-17 11:22:44:777', time);

-- 문제 66
-- 34.5678을 소수점 아래를 버리고 출력하시오.
select floor(34.5678);
select truncate(34.5678, 0); 

-- 문제 67
-- 27.8987을 반올림하여 소수점을 없애고 출력
select format(27.8987, 0);
select round(27.8987);

-- 문제 68
-- 19.6678을 소수점 1째 자리까지 반올림하시오.
select format(19.6678, 1); 
select round(19.6678, 1);

-- 문제 69
-- 24.4535를 20이 나오도록 하세요.
select round(24.4535, -1);
select truncate(24.4535, -1);

-- 문제 70
-- 78을 3으로 나누었을때 나머지를 구하시오.
select mod(78, 3);
select 78 mod 3;
select 78 % 3;

-- 문제 71
-- 15의 4승을 출력하고, 81의 제곱근을 구하시오.
select pow(15, 4), sqrt(81);

-- 문제 72
-- rand()를 이용하여 로또 번호를 출력하세요.
select floor(1 + (rand() * 45));

-- 문제 73
-- 34.667788을 소수점 2째 자리에서 버림하세요.
select truncate(34.667788, 2); 

-- 문제 74
-- 2021년 01월 13일에서 30일 후의 날짜와 한달 뒤의 날짜를 각각 출력하시오.
select adddate('2021-01-13', interval 30 day);
select adddate('2021-01-13', interval 1 month); 

-- 문제 75
-- 2021년 01월 13일에서 30일 이전 날짜와 한달전의 날짜를 각각 출력하시오.
select subdate('2021-01-13', interval 30 day);
select subdate('2021-01-13', interval 1 month);

-- 문제 76
-- 자신의 태어난 날부터 현재까지 살아온 일수를 출력하시오.
select datediff(curdate(), '20000717');

-- 문제 77
-- 오늘 날짜를 출력하고 1년 중에 몇일 째인지를 출력하시오.
select curdate(), dayofyear(curdate()); 

-- 문제 78
-- 2021년 2월의 마지막날을 출력하시오.
select last_day('20210201');

-- 문제 79
-- 9시 45분이 몇 초인지 출력하시오.
select time_to_sec('09:45'); 

-- 문제 80
-- 5초 후 다음 문구를 출력하시오. 문구 : 열심히 코딩하자!
select sleep(5), '열심히 코딩하자!' ;

-- 문제 81
-- 오늘 날짜를 출력하고 몇 사분기인지를 출력하시오.
select curdate(), quarter(curdate()); 
