# 만약에 testdb가 있다면 삭제하라.
drop database if exists testdb;
create database testdb;

# testdb 사용하겠다.
use testdb;

# member 테이블 생성
drop table if exists member;
create table member(
	id varchar(20) primary key,
	pw varchar(20) not null,
	username varchar(20) not null,
	phone varchar(20)
);

select * 
	from member;

# 테이블 데이터 입력
insert into member values('hong', '1234', '홍길동', null);
insert into member values('lee', '1234', '이순신', '01077777725');
insert into member values('leebang', '1234', '이방원', '01055558746'),
						 ('leedo', '1234', '이도', null);

# 테이블 데이터 수정
update member
	set pw = '7890';
	
update member
	set pw = '1234';
	
# 테이블에 있는 조건에 맞는 데이터를 수정
update member
	set pw = '7890'
	where id = 'lee';
	
# 테이블에 있는 데이터 삭제
delete from member;

# id가 hong인 데이터만 삭제
delete from member
	where id = 'hong';

# 테이블 정보 확인
describe member;
desc member;

# 테이블 수정
# addr이라는 컬럼 추가
alter table member 
	add column addr varchar(20);

# 테이블 삭제
drop table member;

# 데이터베이스 삭제
drop database testdb;

# phone 컬럼 삭제
alter table member
	drop column phone;
	
delete from member;

select *
	from member;