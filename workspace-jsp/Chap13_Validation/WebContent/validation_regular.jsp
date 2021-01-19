<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>정규표현식 이용</title>
</head>
<body>
	<h3>회원 가입</h3>
	<form action="validation_regular_process.jsp" name="member" method="post">
		<p>아이디 : <input type="text" name="id"/></p>
		<p>비밀번호 : <input type="password" name="pw"/></p>
		<p>이름 : <input type="text" name="name"/></p>
		<p>연락처 : <select name="phone1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
				  </select> - <input type="text" maxlength="4" size="4" name="phone2"/> -
				  			  <input type="text" maxlength="4" size="4" name="phone3"/></p>
		<p>이메일 : <input type="text" name="email"/></p>
		<p><input type="button" value="가입하기" onclick="checkMember()"/></p>
	</form>
	
	<script type="text/javascript">
		
		function checkMember() {
			//각각 정규표현식으로 작성
			var regExId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;  //id : 숫자로 시작하면 안됨
			var regExName = /^[가-힣]*$/;  //name : 한글만 받음
			var regExPasswd = /^[0-9]*$/;  //Passwd : 숫자만 받음
			var regExPhone = /^\d{3}-\d{3,4}-\d{4}/;
			var regExEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			
			//form 태그 내에 있는 값들을 DOM객체형의 멤버로 변수에 할당함.
			var form = document.member;
			var id = form.id.value;
			var pw = form.pw.value;
			var name = form.name.value;
			var phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;
			var email = form.email.value;
			
			if(!regExId.test(id)) {
				alert('아이디는 문자로 시작해 주세요.');
				form.id.select();
				form.id.focus();
				return;
			}
			if(!regExPasswd.test(pw)) {
				alert('비밀번호는 숫자로만 입력해 주세요.');
				form.pw.select();
				form.pw.focus();
				return;
			}
			if(!regExName.test(name)) {
				alert('이름은 한글만으로 입력해 주세요.');
				form.name.select();
				form.name.focus();
				return;
			}
			if(!regExPhone.test(phone)) {
				alert('연락처 입력을 확인해 주세요.');
				form.phone2.select();
				form.phone2.focus();
				return;
			}
			if(!regExEmail.test(email)) {
				alert('이메일 입력을 확인해 주세요.');
				form.email.select();
				form.email.focus();
				return;
			}
			
			form.submit();
			
		}
		
	</script>
</body>
</html>