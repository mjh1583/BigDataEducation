use employees;

select *
	from employees;

# shopdb라는 데이터베이스를 만드는 것
create database shopdb;

# use명령어는 '~사용하겠다.'
use shopdb;

# member 테이블 생성
create table member(
	memberId varchar(10) not null,
    memberName varchar(10) not null,
    memberAddress varchar(30),
    primary key(memberId)
);

# member 테이블 제거하는 명령어
drop table member;

# member 테이블의 상태를 알아보는 명령어
desc member;

# member에 있는 모든 열의 값들을 다 출력하는 쿼리문.
select *
	from member;
    
# 데이터를 member에 저장하는 쿼리문
# not null이라는 제약조건은 ""저장을 시켜주지만,
# null이라고 저장하면 이것은 null이라고 인정하여 저장 시켜주지 않는다.
insert into member values('shin', '신은혁', '');
insert into member values('lee', '', null);

# 데이터를 삭제해주는 명령어
delete from member where memberId = 'shin';
delete from member where memberId = 'lee';

insert into member values('shin', '신동욱', '');
insert into member values('Dang', '당탕이', '경기도 부천시 중동');
insert into member values('Jee', '지운이', '서울 은평구 중산동');
insert into member values('Han', '한주연', '인천 남구 주안동');
insert into member values('Sang', '상길이', '경기 성남시 분당구');

create table product(
	productName varchar(10) not null,
    cost int not null,
    makeDate date,
    company varchar(10) not null,
    amount int not null,
    primary key(productName)
);

desc product;

insert into product values('컴퓨터', 10, '2013-01-01', '삼성', 17);
insert into product values('세탁기', 20, '20140901', 'LG', 3);
insert into product values('냉장고', 30, '20150102', '대우', 22);

select *
	from product;


