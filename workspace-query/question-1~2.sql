-- 문제 1
-- mydb를 만들고, 아래와 같이 테이블을 만들어라.

-- 테이블명 : dept

-- 열이름      데이터형식      NULL허용    PK
-- -------------------------------------
-- DEPTNO    INT            X       O
-- DNAME     VARCHAR(14)    X       
-- LOC       VARCHAR(30)    O

create database mydb;

use mydb;

create table dept(
	deptno int not null,
    dname varchar(14) not null,
    loc varchar(30),
    primary key(deptno)
);

# drop table dept; 테이블 삭제

desc dept;

select *
	from dept;
    
-- 문제 2
-- 만들어진 DEPT테이블에 아래의 데이터를 추가하라.
-- 10, '경리부', '서울'
-- 20, '인사부', '인천'
-- 30, '영업부', '용인'
-- 40, '전산부', '수원'

insert into dept values(10, '경리부', '서울');
insert into dept values(20, '인사부', '인천');
insert into dept values(30, '영업부', '용인');
insert into dept values(40, '전산부', '수원');
