<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>파일 업로드(commons.jar 이용)</title>
</head>
<body>
	<!-- enctype 속성 : 전송타입 설정, 
						파일을 전송하기 위해서는 반드시 multipart/form-data로 지정함. -->
	<form action="fileupload_commons_2_process.jsp" method="post" name="fileForm"
			enctype="multipart/form-data">
		<p><b>올린 사람 : </b><input type="text" name="name"/></p>
		<p><b>파 일 : </b><input type="file" name="filename"/></p>
		
		<p><input type="submit" value="파일 업로드"/></p>
	</form>
</body>
</html>