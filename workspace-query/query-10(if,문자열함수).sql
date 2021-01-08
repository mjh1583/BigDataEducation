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
