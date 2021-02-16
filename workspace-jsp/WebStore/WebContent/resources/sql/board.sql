use webstoredb;

drop table if exists board;

create table board(
	num 		int 		not null 	auto_increment,  -- 게시글 순번
	id 			varchar(10) not null,					 -- 회원 아이디
	name		varchar(20) not null,					 -- 회원 이름
	subject		varchar(100) not null,					 -- 게시글 제목
	content		text		not null,					 -- 게시글 내용
	registDay 	varchar(30),							 -- 게시글 등록 일자
	hit			int,									 -- 게시글 조회수
	ip			varchar(20),							 -- 게시글 등록 시 IP
	primary key(num)			 
)default charset=utf8mb4;

select * from board;

desc board;

insert into webstoredb.board 
(id, name, subject, content, registDay, hit, ip)
values('gumi', '이순신', '설맞이', '새해복많이받으세요..', sysdate(), 1, '');

delete from board where num = 3;
