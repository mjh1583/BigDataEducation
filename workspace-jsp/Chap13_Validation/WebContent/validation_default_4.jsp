<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>유효성 검사-4</title>
</head>
<body>
	<form action="validation_default_4_process.jsp" name="loginFrm" method="post">
		<p>아이디 : <input type="text" name="id" /></p>
		<p>비밀번호 : <input type="password" name="pw" /></p>
		
		<!-- submit 타입에서 onclick속성 : 클릭했을때, 매핑되어 있는 printForm() 호출함. -->
		<!-- submit 타입에서 onclick을 누르면 경고창 띄우고 페이지 이동 일어남.
			 button 타입에서 onclick을 누르면 경고창 띄우고 페이지 이동 일어나지 않음. -->
		<p><input type="button" value="전송" onclick="checkLogin()" /></p>
	</form>
	
	<script type="text/javascript">
		
		function checkLogin() {
			var form = document.loginFrm;
			
			//아이디의 값이 입력되지 않았다면
			if(form.id.value == "") {
				alert('아이디를 입력해주세요');
				form.id.select();
				form.id.focus();  //id 입력창으로 포커스를 줌.
				return;
			}
			//아이디 길이가 4미만 12초과이면
			if(form.id.value.length < 4 || form.id.value.length > 12) {
				alert('아이디는 4~12자 이내로 입력하셔야 합니다.');
				form.id.select();
				form.id.focus();
				return;
			}
			//아이디가 영문 소문자로만 입력되도록 검사하는 구문
			for(var i = 0; i < form.id.value.length; i++) {
				//아이디 값을 하나씩 가져옴
				var ch = form.id.value.charAt(i);
				if(ch < 'a' || ch > 'z' ) {
					alert('아이디는 영문 소문자로만 입력 가능합니다.');
					form.id.select();
					form.id.focus();
					return;
				}
			}
			//비밀번호의 값이 입력되지 않았다면
			if(form.pw.value == "") {
				alert('비밀번호를 입력해주세요');
				form.pw.select();
				form.pw.focus();  //pw 입력창으로 포커스를 줌.
				return;
			}
			//비밀번호 길이가 4미만값이라면
			//비밀번호는 4자 이상으로 입력해주세요.
			if(form.pw.value.length < 4) {
				alert('비밀번호는 4자 이상으로 입력해주세요.');
				form.pw.select();
				form.pw.focus();
				return;
			}
			//비밀번호를 숫자로만 입력하게끔하는 유효성검사 부분
			if(	isNaN(form.pw.value)) {
				alert('비밀번호는 숫자로만 입력 가능합니다.');
				form.pw.select();
				form.pw.focus();
				return;
			}
			/* 위의 유효성 검사를 다 통과하면
			    자바스크립트 함수 내에서 submit() 호출함.*/
			form.submit();
			
		}
		
	</script>
</body>
</html>