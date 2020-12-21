-- 문제 1
-- mydb를 만들고, 아래와 같이 테이블을 만들어라.

-- 테이블명 : dept

-- 열이름      데이터형식      NULL허용    PK
-- -------------------------------------
-- DEPTNO    INT            X       O
-- DNAME     VARCHAR(14)    X       
-- LOC       VARCHAR(14)    O

create database mydb;

use mydb;

create table dept(
	deptno int not null,
    dname varchar(14) not null,
    loc varchar(14),
    primary key(deptno)
);

desc dept;

select *
	from dept;

