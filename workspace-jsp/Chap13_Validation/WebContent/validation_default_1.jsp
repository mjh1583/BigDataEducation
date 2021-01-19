<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>유효성 검사-1</title>
</head>
<body>
	<form action="#" name="loginFrm" method="post">
		<p>아이디 : <input type="text" name="id" /></p>
		<p>비밀번호 : <input type="password" name="pw" /></p>
		
		<!-- submit 타입에서 onclick속성 : 클릭했을때, 매핑되어 있는 printForm() 호출함. -->
		<p><input type="submit" value="전송" onclick="printForm()" /></p>
	</form>
	
	<script type="text/javascript">
		/* 
			document : 윈도우 화면
			loginFrm : document의 구성요소 중 name이 loginFrm인 폼,
			id : 폼안에 id값, pw : 폼안에 pw값 (value는 값을 의미함)
		*/
		function printForm() {
			alert('아이디 : ' + document.loginFrm.id.value + '\n' +
					'비밀번호 : ' + document.loginFrm.pw.value);
		}
		
	</script>
</body>
</html>