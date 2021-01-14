-- json(javascript object notation) 데이터
-- 타 언어들에 종속되지 않고 서로 교환을 할 수 있는 데이터 포맷형태

use sqldb;

select * from user;

select json_object('username', username, 'height', height) as 'JSON값' 
	from user;

-- user에서 180이상 되는 데이터를 키와 값의 형태의 JSON데이터 포맷형태로 변환하고 있음.
select json_object('username', username, 'height', height) as 'JSON값' 
	from user
	where height >= 180;

-- json이라는 이름의 변수에다가 json포맷형태로 문자열을 저장
set @json = '{ "user" :
		[
			{"username" : "이순신", "height" : 182},
			{"username" : "이도", "height" : 184},
			{"username" : "이제", "height" : 183}
		]
}';

select @json;

-- json변수에 대입된 문자열이 json형태인지 확인함(맞으면 1리턴, 틀리면 0을 리턴함)
select json_valid(@json);

-- json_search() : '이도'가 몇번째 인덱스에 있는냐를 리턴해주는 함수.
-- json 데이터는 배열개념으로 되어있기 때문에 0부터 시작해서 1을 리턴함.
-- 인자값 중 'one'은 문법으로 넣어준 것임.
select json_search(@json, 'one', '이도');

-- json_extract() : 주어진 인덱스의 실제 값을 추출하는 함수임.
select json_extract(@json, '$.user[1].username');
select json_extract(@json, '$.user[1].height');

-- json_insert() : 0번째 인덱스에다가 mdate를 입력하는 함수임.
select json_insert(@json, '$.user[0].mdate', '2021-01-14');

-- json_replace() : 1번째 인덱스에 username을 이방원으로 바꿔주는 함수.
select json_replace(@json, '$.user[1].username', '이방원');

-- json_remove() : 0번째 인덱스를 삭제함.
select json_remove(@json, '$.user[0]');
