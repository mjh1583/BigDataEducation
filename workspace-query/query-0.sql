# DBMS의 종류
-- 관계형 데이터베이스(RDBMS)
-- 	- 테이블(Table based)기반의 RDBMS.
--     - 테이블-컬럼 형태의 데이터 저장 방식
--     - 여러 테이블을 합쳐 큰 테이블을 생성(조인:JOIN)해서 필요한 정보를 찾아내는 방식.
-- NoSQL(Not only SQL) : 비정형 데이터 저장에 사용, 빅데이터

 # 기본용어
--  1) 스키마(Schema) : DB, 테이블 정의 내역
--  2) SQL 쿼리(SQL Query) : RDBMS를 사용하는 전용 질의언어
-- 						 대소문자 가리지 않음.
--  3) 기본키(Primary Key : PK) : 테이블에서 하나의 레코드를 지정할 수 있는 하나 이상의 컬럼집합.
-- 							    ex)주민등록번호
--  4) 외래키(Foreign Key : FK) : 어떤 테이블의 기본키가 다른 테이블의 컬럼에 들어 있을 경우.

 # SQL(Structured Query Language) 
--  1) 데이터베이스에 있는 필요한 정보를 사용할 수 있도록 도와주는 언어.
--  2) 대소문자 구별하지 않음

--  사용자
--  프로그램--------SQL----------DBMS ------------DB
 
 # CRUD(Create, Retrieve(Read), Update, Delete)
 -- - 기본적인 데이터 처리 기능인 생성, 읽기(Read), 갱신, 삭제를 묶어서 일컫는 말  