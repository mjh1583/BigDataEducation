use webstoredb;

drop table if exists member;
create table member(
	id			varchar(10)	not null,
	password	varchar(10) not null,
	name 		varchar(10) not null,
	gender		varchar(4),
	birth		varchar(10),
	mail		varchar(30),
	phone		varchar(20),
	address		varchar(90),
	registDay 	varchar(50),
	primary key(id)
)default charset=utf8mb4;

select * from member;

insert into member values('gumi', '0217', '이방원', '남', '2000/01/01', 'lee@gamil.com', '010', '구미', '2021/02/03');
insert into member values('admin', 'admin0217', '관리자', '', '', '', '', '', '');