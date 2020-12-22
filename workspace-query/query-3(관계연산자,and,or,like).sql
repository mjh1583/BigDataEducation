use sqldb;

--  name 컬럼에 있는 내용중에서 '김경호' 인것만 행을 출력하시오.(user)
select * 
	from user 
    where name = '김경호';