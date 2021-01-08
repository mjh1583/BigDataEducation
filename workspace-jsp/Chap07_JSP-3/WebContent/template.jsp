<%@ page errorPage="exceptionPage.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	//요청 들어오는 page값을 저장하고 있음.
	String pagefile = request.getParameter("page");
	if(pagefile == null) {
		System.out.println("페이지 검사 지나감");
		pagefile = "newitem";
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>템플릿 페이지</title>
	<style type="text/css">
		table {
			margin: auto;  /* 바깥여백 */
			width: 1024px;
			height: 768px;
			color: gray;
			border: 2px red;
		}
		
	</style>
</head>
<body>
	<table border="1">
		<tr>  <!-- top부분 -->
			<td height="15%" width="20px" align="center">Store 로고</td>
			<td height="15%" colspan="2" align="right">
				<jsp:include page="top.jsp" />
			</td>
		</tr>
		<tr>  <!-- left부분 -->
			<td height="20%" align="right" valign="top">
				<jsp:include page="left.jsp" />
			</td>
			<!-- center부분 -->
			<td colspan="2" align="center">
				<jsp:include page='<%= pagefile + ".jsp"%>'/>
			</td>
		</tr>
		<tr>  <!-- bottom부분 -->
			<td height="10%" width="100%" colspan="3" align="center">
				<jsp:include page="bottom.jsp"/>
			</td>
		</tr>
	</table>
</body>
</html>