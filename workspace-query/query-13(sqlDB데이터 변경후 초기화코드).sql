drop database if exists sqldb2;
create database sqldb2;

use sqldb2;

drop table if exists user;
-- 회원 테이블
create table user(
	userID char(8) not null primary key,  -- 사용자 아이디(PK)
	userName varchar(10) not null,  -- 이름
	birthday int not null,  -- 출생연도
	addr char(2) not null,  -- 지역(경기, 서울, 경남 식으로 2글자만 입력)
	mobile1 char(3),  -- 휴대폰의 국번(010, 011, 016, ...)
	mobile2 char(8),  -- 휴대폰의 나머지 전화번호(하이픈 제외)
	height smallint,  -- 키
	mDate date -- 회원 가입일	
);

drop table if exists buy;
-- 회원 구매 테이블
create table buy(
	num int auto_increment not null primary key,  -- 순번(PK)
	userID char(8) not null,  -- 아이디(FK)
	prodName char(6) not null,  -- 물품명
	groupName char(4),  -- 분류
	price int not null,  -- 단가
	amount smallint not null,  -- 수량
	foreign key (userID) references user(userID)
);

INSERT INTO user VALUES('YJS', '유재석', 1972, '서울', '010', '11111111', 178, '2008-8-8'); 
INSERT INTO user VALUES('KHD', '강호동', 1970, '경북', '011', '22222222', 182, '2007-7-7'); 
INSERT INTO user VALUES('KKJ', '김국진', 1965, '서울', '019', '33333333', 171, '2009-9-9'); 
INSERT INTO user VALUES('KYM', '김용만', 1967, '서울', '010', '44444444', 177, '2015-5-5'); 
INSERT INTO user VALUES('KJD', '김제동', 1974, '경남', NULL , NULL , 173, '2013-3-3'); 
INSERT INTO user VALUES('NHS', '남희석', 1971, '충남', '016', '66666666', 180, '2017-4-4'); 
INSERT INTO user VALUES('SDY', '신동엽', 1971, '경기', NULL , NULL , 176, '2008-10-10'); 
INSERT INTO user VALUES('LHJ', '이휘재', 1972, '경기', '011', '88888888', 180, '2006-4-4'); 
INSERT INTO user VALUES('LKK', '이경규', 1960, '경남', '018', '99999999', 170, '2004-12-12'); 
INSERT INTO user VALUES('PSH', '박수홍', 1970, '서울', '010', '00000000', 183, '2012-5-5');

INSERT INTO buy VALUES(NULL, 'KHD', '운동화', NULL , 30, 2); 
INSERT INTO buy VALUES(NULL, 'KHD', '노트북', '전자', 1000, 1); 
INSERT INTO buy VALUES(NULL, 'KYM', '모니터', '전자', 200, 1); 
INSERT INTO buy VALUES(NULL, 'PSH', '모니터', '전자', 200, 5); 
INSERT INTO buy VALUES(NULL, 'KHD', '청바지', '의류', 50, 3); 
INSERT INTO buy VALUES(NULL, 'PSH', '메모리', '전자', 80, 10); 
INSERT INTO buy VALUES(NULL, 'KJD', '책' , '서적', 15, 5); 
INSERT INTO buy VALUES(NULL, 'LHJ', '책' , '서적', 15, 2); 
INSERT INTO buy VALUES(NULL, 'LHJ', '청바지', '의류', 50, 1); 
INSERT INTO buy VALUES(NULL, 'PSH', '운동화', NULL , 30, 2); 
INSERT INTO buy VALUES(NULL, 'LHJ', '책' , '서적', 15, 1); 
INSERT INTO buy VALUES(NULL, 'PSH', '운동화', NULL , 30, 2);

select * from user;

select * from buy;
