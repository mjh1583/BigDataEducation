-- 문제 52
-- 'Welcome to MySQL'를 대문자, 소문자로 각각 변경하시오.
select lower('Welcome to MySQL'), upper('Welcome to MySQL');
select lcase('Welcome to MySQL'), ucase('Welcome to MySQL');

-- 문제 53
-- 문자 C를 아스키코드값으로 출력하시오.
select ascii('C'); 

-- 문제 54
-- 문자열 '안녕하세요'의 바이트수를 출력하시오.
select length('안녕하세요'); 

-- 문제 55
-- 문자열 '안녕하세요'의 문자의 수를 출력하시오. 
select char_length('안녕하세요');

-- 문제 56
-- 문자열 '안녕하세요', 공백2개, '반갑습니다'의 문자열을 연결하여 출력하시오.
select concat('안녕하세요', space(2), '반갑습니다');

-- 문제 57
-- 문자열 '안녕하세요'에서 '하'의 위치를 출력하시오.
select instr('안녕하세요', '하'); 
select locate('하', '안녕하세요'); 
 
















