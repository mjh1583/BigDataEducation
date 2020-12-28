-- 문제 7
-- 만들어 놓은 mydb에 아래와 같이 테이블을 만드시오
-- 테이블명 : video
-- 열이름     데이터형식      NULL허용     PK    기타
-- video_id  int            X         O     자동증가(1에서부터 시작)
-- title     varchar(20)    X         X
-- genre     varchar(8)     X         X
-- star      varchar(10)    O         X

use mydb;

drop table if exists video;
create table video(
	video_id int AUTO_INCREMENT not null primary key,
    title varchar(20) not null,
    genre varchar(8) not null,
    star varchar(10)
);

-- 문제 8
-- 만들어진 video테이블에 아래의 데이터를 추가하라.
-- null, '태극기휘날리며', '전쟁', '장동건'
-- null, '대부', '액션', null
-- null, '반지의제왕', '액션', '일라이저우드'
-- null, '친구', '액션', '유오성'
-- null, '해리포터', '환타지', '다니엘'
-- null, '형', '코미디', '조정석'

insert into video values(null, '태극기휘날리며', '전쟁', '장동건'),
						(null, '대부', '액션', null),
                        (null, '반지의제왕', '액션', '일라이저우드'),
                        (null, '친구', '액션', '유오성'),
                        (null, '해리포터', '환타지', '다니엘'),
                        (null, '형', '코미디', '조정석');

select *
	from video;

-- 문제 9
-- video 테이블에서 star값이 없는 것만 출력하시오.
select *
	from video
	where star is null;

-- 문제 10
-- video 테이블에서 장르가 액션인 것만 출력하시오
select *
	from video
    where genre = '액션';

-- 문제 11
-- video 테이블에서 주인공이 유오성인 것만 삭제하시오
select *
	from video
    where star = '유오성';

delete 
	from video
    where star = '유오성';

select * from video;

-- 문제 12
-- video 테이블에서 제목이 형인 것을 동생으로 바꾸시오.
update video
    set title = '동생'
    where title = '형';
    
select * from video;

-- 문제 13
-- video 테이블에 있는 모든 데이터를 지우시오.
delete from video;

select * from video;

-- 문제 14
-- video 테이블을 제거하시오.
drop table video;

show tables;