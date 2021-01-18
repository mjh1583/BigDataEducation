-- 조인 : 2개 이상의 테이블에 있는 정보 중 사용자가 필요한 집합에 맞게
-- 		 가상의 테이블처럼 만들어서 결과를 보여주는 것임.

-- 조인의 종류
-- 1) Inner 조인 : 특정 컬럼을 기준으로 정확하게 매칭된 집합을 출력함.
-- 				  조인시 NULL 값을 허용하지 않음.
-- 				  NULL 값을 가진   

use world;

-- city 테이블과 country 테이블을 조인하시오.
-- city.countrycode = country.code
select *
	from city c join country c2 
	on c.CountryCode = c2.Code;

-- 국가 코드와 해당 나라의 GNP를 표시하시오.
select c.CountryCode, c2.GNP 
	from city c join country c2 
	on c.CountryCode = c2.Code
	where c.CountryCode = 'KOR';

use samil;
-- 고객과 고객의 주문에 관한 데이터를 모두 보이시오.
select * 
	from customer c, orders o 
	where c.custid = o.custid;

-- 고객과 고객의 주문에 대한 데이터를 고객번호 순으로 정렬하여 보이시오.
select * 
	from customer c, orders o 
	where c.custid = o.custid
	order by c.custid;

-- 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.
select c.name, o.saleprice 
	from customer c, orders o 
	where c.custid = o.custid;

-- 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정리하시오.
select c.name, sum(o.saleprice) 
	from customer c, orders o 
	where c.custid = o.custid
	group by c.name
	order by c.name;

-- 고객의 이름과 고객이 주문한 도서의 이름을 구하시오.
select c.name, b.bookname 
	from customer c, orders o, book b 
	where c.custid = o.custid 
	and o.bookid = b.bookid;

-- 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.
select c.name, b.bookname 
	from customer c, orders o, book b 
	where c.custid = o.custid 
	and o.bookid = b.bookid
	and b.price = 20000;
	