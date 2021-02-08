<%@page import="kr.gov.mvc.model.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	String sessionId = (String)session.getAttribute("sessionId");
	ArrayList<BoardDTO> boardList = (ArrayList<BoardDTO>)request.getAttribute("boardList");
	int totalRecord = ((Integer)request.getAttribute("totalRecord")).intValue();
	int totalPage = ((Integer)request.getAttribute("totalPage")).intValue();
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
		<form action='<c:url value="./boardListAction.do" />' method="post">
			<div class="text-right">
				<h2><span class="badge badge-danger">전체 건수 : <%= totalRecord %></span></h2>
			</div>
			
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
						<th>글쓴이</th>
					</tr>
					<%
						for(int i = 0; i < boardList.size(); i++) {
							BoardDTO notice = boardList.get(i);
					%>
					<tr>
						<td><%= notice.getNum() %></td>  
						<!-- 게시글 제목을 클릭하면 해당 게시글이 보일 수 있도록 a태그 이용 -->
						<td><a href="./boardViewAction.do?num=<%= notice.getNum() %>"><%= notice.getSubject() %></a></td>
						<td><%= notice.getRegistDay() %></td>
						<td><%= notice.getHit() %></td>
						<td><%= notice.getName() %></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			
			<div align="center">  <!-- 페이지 수 표시 -->
				<c:set var="pageNum" value="<%= pageNum %>"/>
				<c:forEach var="i" begin="1" end="<%= totalPage %>">
					<a href='<c:url value="./boardListAction.do?pageNum=${i}"/>'>
						<c:choose>
							<c:when test="${pageNum == i}">
								<font color="4C5317"><b>[${i}]</b></font>
							</c:when>
							<c:otherwise>
								<font color="4C5317">[${i}]</font>
							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
			</div>
			
			<div align="left">  <!-- 검색 -->
				<table>
					<tr>
						<td width="100%" align="left">&nbsp;&nbsp;
							<select name="items" class="txt">
								<option value="subject">제목</option>
								<option value="content">본문</option>
								<option value="name">글쓴이</option>
							</select>
							<input type="text" name="text"/>
							<input type="submit" id="btnAdd" class="btn btn-primary" value="검색"/>
						</td>
						<td width="100%" align="right">
							<!-- 로그인 된 회원들만 글쓰기가 가능하도록 하기 위해서 checkForm() 함수 추가 -->
							<h4><a href="#" onclick="checkForm()" class="badge badge-primary">글쓰기</a></h4>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	
	<hr/>
	<jsp:include page="../footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		function checkForm() {
			if(${sessionId == null}) {  //로그인 여부 판단
				alert("로그인해야 작성할 수 있습니다.");
				return false;
			}
			
			/* 로그인이 되었다면 */
			location.href = "./boardWriteForm.do?id=<%= sessionId %>";
			
		}
	</script>
</body>
</html>