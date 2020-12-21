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
insert into member values ('shin', '신은혁', '');


