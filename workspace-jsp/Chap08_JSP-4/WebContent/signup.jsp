<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 폼</title>
	<style type="text/css">
		/* 스타일 지정 */
		#formArea {
			margin: auto;
			width: 600px;
			border: 1px solid blaxk;
			background-color: #ff99ff;
		}
		
		h2 {
			text-align: center;
		}
	</style>
</head>
<body>
	<section id="formArea">
		<h2>회원 가입을 위해서 아래의 내용을 입력해주세요.</h2>
		<form action="customerbean.jsp" method="post">
			<fieldset>
				<label>아이디 : </label>
				<input type="text" name="id" id="id" required="required"/><br/>
				
				<label>비밀번호 : </label>
				<input type="password" name="pw" id="pw" required="required"/><br/>
				
				<label>이름 : </label>
				<input type="text" name="name" id="name" required="required"/><br/>
				
				<label>생년월일 : </label>
				<input type="date" name="birthday" id="birthday"/><br/>
				
				<label>주소 : </label>
				<input type="text" name="address" id="address"/><br/>
				
				<label>이메일 : </label>
				<input type="email" name="email" id="email"/><br/>
				
				<input type="submit" value="가입하기" />&nbsp;&nbsp;&nbsp;
				<input type="reset" value="초기화" />
			</fieldset>
		</form>
	</section>
</body>
</html>