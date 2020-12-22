-- 아래 쿼리문은 항상 쌍으로 실행한다.
-- 의미 : 만약 sqldb가 존재한다면 삭제를 하고 다시 sqldb를 만들어라.
drop database if exists sqldb;
create database sqldb;

use sqldb;

-- 회원 테이블 작성
drop table if exists user; 
create table user(
	userID      varchar(8) not null primary key,  -- 사용자 아이디(PK)
    name		varchar(10) not null,  -- 이름 
	birthyear	int not null,  -- 출생연도
    addr	 	varchar(10) not null,  -- 주소
    mobile1		varchar(3),  -- 휴대폰 앞자리 번호(010, 016, 017, 019, 011)
    mobile2     varchar(8),  -- 휴대폰의 나머지 번호(하이픈(-)을 제외)
    height		smallint,	 -- 키(smallint 2바이트)
    mdate		date		 -- 회원 가입일
);

-- 회원 구매 테이블 작성
drop table if exists buy;
create table buy(
	-- auto_increment 명령어 : mysql엔진이 데이터가 들어올때마다, 1씩 자동 증가시켜줌.
	num int AUTO_INCREMENT not null primary key,
    -- userID는 여기서는 PK가 될 수 없음. 일반적으로 한 테이블에 PK는 오로지 하나만 존재함.
    userID varchar(8) not null,
    prodNmae varchar(6) not null,  -- 물품명
    groupName varchar(4),  -- 분류
    price int,  -- 단가
    amount smallint not null,  -- 수량
    -- user에 있는 userID를 참조하라. 여기서는 userID 외래키(FK)
    foreign key(userID) references user(userID)
);

insert into user values('LSG', '이승기', 1987, '서울', '011', '11111111', 182, '2008-08-08');

select * from user;

delete from user;

-- user에 데이터 추가 
insert into user values('LSG', '이승기', 1987, '서울', '011', '11111111', 182, '2008-08-08'),
					   ('KBS', '김범수', 1979, '경남', '011', '22222222', 173, '2012-04-04'),
                       ('KKH', '김경호', 1971, '전남', '019', '33333333', 177, '2007-07-07'),
                       ('JYP', '조용필', 1950, '경기', '011', '44444444', 166, '2009-04-04'),
                       ('SSK', '성시경', 1979, '서울', null, null, 186, '2013-12-12'),
                       ('LJB', '임재범', 1963, '서울', '016', '66666666', 182, '2009-09-09'),
                       ('YJS', '윤종신', 1969, '경남', null, null, 170, '2005-05-05'),
                       ('EJW', '은지원', 1972, '경북', '011', '88888888', 174, '2014-03-03'),
                       ('JKW', '조관우', 1965, '경기', '018', '99999999', 172, '2010-10-10'),
                       ('BBK', '바비킴', 1973, '서울', '010', '00000000', 176, '2013-5-5');

select * from buy;

-- buy에 데이터 추가 
insert into buy values(null, 'KBS', '운동화', null, 30, 2),
					  (null, 'KBS', '노트북', '전자', 1000, 1),
					  (NULL, 'JYP', '모니터', '전자', 200, 1),
					  (null, 'BBK', '모니터', '전자', 200, 5),
					  (null, 'KBS', '청바지', '의류', 50, 3),
					  (null, 'BBK', '메모리', '전자', 80, 10),
					  (null, 'SSK', '책', '서적', 15, 5),
					  (null, 'EJW', '책', '서적', 15, 2),
					  (null, 'EJW', '청바지', '의류', 50, 1),
					  (null, 'BBK', '운동화',  NULL, 30, 2),
					  (NULL, 'EJW', '책',  '서적', 15, 1),
					  (NULL, 'BBK', '운동화',  NULL, 30, 2);