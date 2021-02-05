<%@page import="kr.gov.mvc.model.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	String sessionId = (String)session.getAttribute("sessionId");
	ArrayList<BoardDTO> boardList = (ArrayList<BoardDTO>)request.getAttribute("boardList");
	int totalPage = ((Integer)request.getAttribute("totalPage")).intValue();
	int totalRecord = ((Integer)request.getAttribute("totalRecord")).intValue();
	int pageNum = ((Integer)request.getAttribute("pageNum")).intValue();
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 - WebStore</title>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="../menu.jsp"/>	
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	
	<div class="container">
		<form action="" method="post">
			<div class="form-horizontal text-right">
				<h2><span class="badge badge-danger">전체 건수 : <%= totalRecord %></span></h2>
			</div>
		</form>
	</div>
</body>
</html>