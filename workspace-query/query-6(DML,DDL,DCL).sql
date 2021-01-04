-- SQL의 종류
-- 1. DML (Data Maniculation Language) : 테이블의 데이터를 조작
-- 취소도 가능함. rollback이란 키워드로 가능함.
-- ex) select, insert, delete, update

-- 2. DDL (Data Definition Language) : 테이블의 스키마를 정의, 수정
-- 취소가 안됨. 실행하면 바로 물리적 저장 공간에 바로 적용됨.
-- ex) create, drop, alter, truncate(테이블 구조를 그대로 남긴채 데이터를 다 지움.)

-- 3. DCL(Data Control Language) : 접근 권한, 권한 정의하는 기능
-- 특정 사용자에게 어떤 권한을 부여하거나 금지할 때 사용하는 구문
-- ex) grant, revoke

drop database if exists samil;
create database samil;
use samil;

drop table if exists book;
create table book(
	bookid integer primary key,
    bookname varchar(40),
    publisher varchar(40),
    price integer
);

drop table if exists customer;
create table customer(
	custid integer primary key,
    name varchar(40),
    address varchar(50),
    phone varchar(20)
);

drop table if exists orders;
create table orders(
	orderid integer primary key,
    custid integer,
    bookid integer,
    saleprice integer,
    orderdate date,
    foreign key(custid) references customer(custid),
    foreign key(bookid) references book(bookid)
);

insert into book values(1, '축구의 역사', '굿스포츠', 7000);
insert into book values(2, '축구아는 여자', '나무수', 13000);
insert into book values(3, '축구의 이해', '대한미디어', 22000);
insert into book values(4, '골프 바이블', '대한미디어', 35000);
insert into book values(5, '피겨 교본', '굿스포츠', 8000);
insert into book values(6, '역도 단계별 기술', '굿스포츠', 6000);
insert into book values(7, '야구의 추억', '이상미디어', 20000);
insert into book values(8, '야구를 부탁해', '이상미디어', 13000);
insert into book values(9, '올림픽 이야기', '삼성당', 7500);
insert into book values(10, 'Olympic Champions', 'Pearson', 13000);

select * from book;

insert into customer values(1, '박지성', '영국 맨체스터', '000-5000-0001');
insert into customer values(2, '김연아', '대한민국 서울', '000-6000-0001');
insert into customer values(3, '장미란', '대한민국 강원도', '000-7000-0001');
insert into customer values(4, '추신수', '미국 클리블랜드', '000-8000-0001');
insert into customer values(5, '박세리', '대한민국 대전', '000-9000-0001');

select * from customer;

insert into orders values(1, 1, 1, 6000, str_to_date('2014-07-01', '%Y-%m-%d'));
insert into orders values(2, 1, 3, 21000, str_to_date('2014-07-03', '%Y-%m-%d'));
insert into orders values(3, 2, 5, 8000, str_to_date('2014-07-03', '%Y-%m-%d'));
insert into orders values(4, 3, 6, 6000, str_to_date('2014-07-01', '%Y-%m-%d'));
insert into orders values(5, 4, 7, 20000, str_to_date('2014-07-01', '%Y-%m-%d'));
insert into orders values(6, 1, 2, 12000, str_to_date('2014-07-01', '%Y-%m-%d'));
insert into orders values(7, 4, 8, 13000, str_to_date('2014-07-01', '%Y-%m-%d'));
insert into orders values(8, 3, 10, 12000, str_to_date('2014-07-01', '%Y-%m-%d'));
insert into orders values(9, 2, 10, 7000, str_to_date('2014-07-01', '%Y-%m-%d'));
insert into orders values(10, 3, 8, 13000, str_to_date('2014-07-01', '%Y-%m-%d'));

select * from orders;

-- 1. 가격이 20,000원 미만인 도서를 검색하시오.
select *
	from book
    where price < 20000;
    
-- 2. 가격이 10,000원 이상 20,000 이하인 도서를 검색하시오.
select *
	from book
    where price between 10000 and 20000;

select *
	from book
    where price >= 10000 and price <= 20000;

-- 3. 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오.
select *
	from book
    where publisher in('굿스포츠','대한미디어');
    
-- 출판사가 '굿스포츠' 혹은 '대한미디어'가 아닌 도서를 검색하시오.
select *
	from book
    where publisher not in('굿스포츠','대한미디어');
    
-- 4. '축구의 역사'를 출간한 출판사를 검색하시오.
select bookname, publisher
	from book
    where bookname like '축구의 역사';

-- 5. 도서 이름에 '축구'가 포함된 출판사를 검색하시오.
select bookname, publisher
	from book
    where bookname like '%축구%';

-- 6. 도서 이름의 왼쪽 두번재 위치에 '구'라는 문자열을 갖는 도서를 검색하시오
select *
	from book
    where bookname like '_구%';

-- 7. 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오.
select *
	from book
    where bookname like '%축구%' and
    price >= 20000;

-- 8. 도서를 이름순으로 검색하시오.
select * 
	from book
    order by bookname;
    
-- 9. 도서를 가격순으로 검색하고, 가격이같으면 이름순으로 검색하시오.
select *
	from book
    order by price, bookname;
    
-- 10. 고객이 주문한 도서의 총 판매액을 구하시오.
desc orders;

select sum(saleprice) as '총매출'
	from orders;
    
select * from orders;
-- 11. 2번 고객이 주문한 도서의 총 판매액을 구하시오.
select sum(saleprice) as '총 판매액'
	from orders
    where custid = 2;

-- 12. 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가를 구하시오.
select sum(saleprice) as '총 판매액', avg(saleprice) as '평균값',
	min(saleprice) as '최저가', max(saleprice) as '최고가'
    from orders;

-- 13. 삼일 서점의 도서 판매 건수를 구하시오
select count(*) as '도서 판매 건수'
	from orders;

-- 14. 고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오.
select custid, count(*) as '도서 수량', sum(saleprice) as '고객별 총 판매액'
	from orders
    group by custid;

-- 15. 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 
-- 고객별 주문 도서의 총 수량을 구하시오. 단, 두권 이상 구매한 고객만 구하시오.
select custid, count(*) as '도서수량'
	from orders
    where saleprice >= 8000
    group by custid
    having count(*) >= 2;

-- 16. 가장 비싼 도서의 이름을 보이시오.
desc book;

select * from book;

select bookname 
	from book
    where price = (select max(price) from book);
    
-- 17. 도서를 구매한 적이 있는 고객의 이름을 검색하시오.
select name
	from customer
    where custid in(select custid from orders);

-- 18. 대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오.
select name
	from customer
    where custid in(select custid 
						from orders
						where bookid in(select bookid
											from book
                                            where publisher = '대한미디어'));
                                            
-- 19. 다음과 같은 속성을 가진 NewBook 테이블을 생성하시오.
-- 정수형은 integer를 사용하며 문자형은 가변형 문자타입인 varchar를 사용한다.
-- bookid(도서번호) - integer
-- bookname(도서이름) - varchar(20)
-- publisher(출판사) - varchar(20)
-- price(가격) -- integer

drop table if exists NewBook;
create table NewBook(
	bookid integer primary key,
    bookname varchar(20) not null,
    publisher varchar(20),
    price integer default 10000
);

desc newbook;

-- -------------------------------------------------------------------------------------------------------------------
drop database if exists sqldb;
create database sqldb;
use sqldb;

drop table if exists test1;
create table test1(
	id int,
    username varchar(3),
    age int
);

insert into test1 values(1, '홍길동', 33);
select * 
	from test1;

-- 원하는 필드에만 저장하고 싶다면 아래와 같이 쿼리를 작성하면 됨.
-- 저장하지 않은 필드는 당연히 null이 됨.
insert into test1(id, username) values(2, '김연아');

insert into test1(username, age, id) values('김초하', 28, 3);
insert into test1(username, age, id) values('이초하', 'ab', 3);  -- 데이터 타입 불일치

-- auto_increment 구문 : DB엔진이 자동으로 행이 추가될때마다 1씩 증가시킴.
drop table if exists test2;
create table test2(
	id int auto_increment primary key,
    username varchar(3),
    age int
);

insert into test2 values(null, '김철', 35),
						(null, '김구', 35),
						(null, '김군', 35);
                        
select * 
	from test2;

insert into test2 values(10, '김범', 35);

delete from test2
	where id = 2;
    
insert into test2 values(null, '김범', 35);  -- 마지막 수를 기준으로 1 증가함(단점)

-- auto_increment 한 필드가 마지막으로 입력된 것을 조회할때는 last_insert_id() 함수
-- 이용하면 편리함.
select last_insert_id();

-- 테이블에 관련된 수정을 하고자하면 alter 이용하면 됨.
alter table test2 auto_increment = 100;  -- 자동증가를 100부터 함.
insert into test2 values(null, '손오공', 35);
select * 
	from test2;
insert into test2 values(null, '손오', 500);

drop table if exists test3;
create table test3(
	id int auto_increment primary key,
    username varchar(3),
    age int
);

alter table test3 auto_increment = 1000;

insert into test3 values(null, '나연', 33);
insert into test3 values(null, '동수', 30);
insert into test3 values(null, '은혁', 13);
insert into test3 values(null, '미혁', 15);
insert into test3 values(null, '우혁', 17);

-- 아래는 서버변수임(시스템 변수).
-- set 구문 다음 @@붙으면 서버변수임.
-- 증가를 1씩 하는게 아니라, 3씩 하게끔 설정하는 것임.
set @@auto_increment_increment = 3;

select *
	from test3;