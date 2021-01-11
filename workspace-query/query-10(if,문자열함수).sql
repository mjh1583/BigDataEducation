use sqldb;

-- if함수는 '만약에 ~~이라면' 이라는 뜻임.
-- 1000 > 2000 수식의 결과가 참이면, 1번째 인자값을 출력하고,
-- 거짓이면 2번째 인자값이 출력됨.
select if(1000 > 2000, '참입니다.', '거짓입니다.');
select if(1000 < 2000, '참입니다.', '거짓입니다.');

-- ifnull은 1번쨰 인자값에 따라 널이면 2번째 인자값이 출력되고,
-- 1번째 인자값이 널이 아니면, 1번째 값이 출력을 함.
select ifnull(null, 'null이군요');
select ifnull(1000, 'null이군요');

-- nullif는 두개의 인자값이 같으면 null을 출력하고,
-- 두개의 인자값이 다르면 첫번째 인자값을 출력함.
select nullif(1000, 1000), nullif(1000, 2000);

-- 프로그래밍 언어에서 switch구문과 유사함.
-- case는 함수가 아니고 연산자라고 이해를 해야함.
-- case...when...then...else...end 형태의 문법임.
select case 10
	when 1 then '일'
	when 5 then '오'
	when 10 then '십'
	when 100 then '백'
	else '해당되는 값이 없음'
	end;
	
select case 50
	when 1 then '일'
	when 5 then '오'
	when 10 then '십'
	when 100 then '백'
	else '해당되는 값이 없음'
	end;

-- 문자열 함수
-- ascii 함수 : 인자의 값을 아스키코드값으로 출력함.
-- char 함수 : 숫자로 준 내용을 문자로 나타냄.
select ascii('A'); 
select ascii('B'), char(65);
select char(97);

-- mysql의 문자셋 : utf-8을 사용함.(영문은 1바이트, 한글은 3바이트로 사용됨)
-- bit_length() : 주어진 문자열의 바이트수 * 8해서 비트수를 리턴함.
select bit_length('abc'); 
select bit_length('가나다');  -- 9*8

-- char_length() : 문자열의 문자의 수를 출력함.
select char_length('가나다'), char_length('abc') ; 

-- length() 함수 : 인자값의 바이트 수를 출력함
select length('안녕하세요');
select length('안녕하세요!');

-- concat() : 문자열을 연결해주는 함수
select concat(100, '은', '100과 같다.'); 

-- concat_ws() : 첫번째 주어진 구분자로 문자열 서로 연결해주는 함수.
select concat_ws('-', '2021년', '01', '11'); 

-- elt() : 첫번째 주어진 값의 위치로 가서 있는 것을 출력하는 함수.
-- 찾는 값이 없으면 null을 리턴함.
select elt(2, '일', '이', '삼');
select elt(5, '일', '이', '삼');
select elt(2, '일이삼');

-- field() : 첫번째 주어진 값의 위치를 출력하는 함수
-- 찾는 값이 없으면 0을 리턴함.
select field('이', '일', '이', '삼');
select field('오', '일', '이', '삼');
select field('이', '일이삼');

-- find_in_set() : 첫번째 주어진 값의 구분자를 가지고 문자열의 문자 위치를 출력해주는 함수.
-- 찾는 값이 없으면 0을 리턴함.
select find_in_set('이', '일이삼'); 
select find_in_set('이', '일,이,삼'); 
select find_in_set('이', '일','이','삼'); 

-- instr() : 첫번째 문자열값에서 두번째 값이 있으면 그 위치를 출력함.
-- 찾는 값이 없으면 0을 리턴함.
select instr('일이삼사', '삼'); 
select instr('일이삼사', '오'); 

-- locate() : 인자값의 위치만 다를뿐 instr함수와 동일함.
select locate('오', '일이삼사'); 
select locate('일', '일이삼사'); 

-- format() : 엑셀의 round()와 유사함. 소수점 자리를 지정해서 반올림 해줌.
-- 1000단위도 구분해줌.
select format(77777.11111, 3); 
select format(77777.11151, 3); 

-- 2진수, 16진수, 8진수로 변환해주는 함수
select bin(10), hex(10); 
select bin(10), hex(14); 
select bin(10), hex(15); 
select bin(10), hex(16); 
select bin(10), hex(17); 
select bin(10), hex(30); 
select bin(10), hex(30), oct(10) ; 

-- insert() : replace와 개념이 같음. 2번째 자리부터 3자리를 ???로 대치
select insert('11111', 2, 3, '???');

-- left() : 왼쪽에서 3자,
-- right() : 오른쪽에서 3자를 출력함.
select left('가나다라마', 3), right('가나다라마', 3);

-- 대소문자로 변환해주는 함수. 원하는 함수를 사용하면 됨.
select lower('ABCabc'), upper('ABCabc'); 
select lcase('ABCabc'), ucase('ABCabc'); 

-- 공백을 제거해주는 함수, 왼쪽공백 제거(ltrim), 오른쪽 공백제거(rtrim)
select ltrim('       데이터'), rtrim('      데이터      '); 
-- trim() : 앞뒤 공백을 제거하는 함수. 중간에 공백은 제거하지 못함.
select trim('       데이터          '); 

-- repeat() : 인자값 수만큼 반복해줌.
select repeat('이순신', 5);

-- replace() : insert()와 개념이 같음. 2번째 인자갑을 3번째 인자값으로 대치
select replace('mysql데이터베이스', '데이터', 'data');

-- reverse() : 주어진 인자값을 거꾸로 출력함.
select reverse('이순신'); 

-- space() : 공백 만들어줌
select concat('나의', space(50), '데이터 베이스'); 

-- substring() : 문자열을 잘라내서 출력함
select substring('데이터베이스', 3, 3); 
select substring('데이터베이스', 4, 3); 

-- substring_index() : 구분자 .을 기준으로 2번째 이후로는 출력하지 않음.
-- 2를 주었을때는 오른쪽부터 시작해서 2번째 이후는 출력하지 않음.
select substring_index('데이터베이스.my.sql', '.', 2); 
select substring_index('데이터베이스/my/sql', '/', 1); 
select substring_index('데이터베이스.my.sql', '.', -2); 
