<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp"/>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			
			<%	/* 로그인 인증에 실패했을 때 작동하는 부분 */
				String error = request.getParameter("error");
				if(error != null) {		/* 에러가 났음 */
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요!");
					out.println("</div>");
				}
			%>
			
			<form action="j_security_check" name="form-signin" method="post">
				<div class="form_group">  <!-- 아이디 입력부분 -->
					<label for="inputUserName" class="sr-only">User Name</label>  <!-- class="sr-only" : 출력 숨김 -->
					<input type="text" class="form-control" placeholder="ID" name="j_username" required="required" autofocus="autofocus">
				</div>
				
				<div class="form_group">  <!-- 비밀번호 입력부분 -->
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="password" name="j_password" required="required">
				</div>
				<!-- btn-lg 버튼크기, btn-success 초록색 버튼 -->
				<button class="btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
			
		</div>
	</div>
	
</body>
</html>