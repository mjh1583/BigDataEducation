<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The WebStore</title>
</head>
<body>
	<!-- header 부분 -->
	<tiles:insertAttribute name="header"/>
	
	<!-- visual 부분 -->
	<tiles:insertAttribute name="visual"/>
	
	<div>
		<div>
			<!-- aside 부분 -->
			<tiles:insertAttribute name="aside"/>
			
			<!-- main 부분 -->
			<tiles:insertAttribute name="main"/>
		</div>
	</div>
	
	<!-- footer 부분 -->
	<tiles:insertAttribute name="footer"/>
</body>
</html>