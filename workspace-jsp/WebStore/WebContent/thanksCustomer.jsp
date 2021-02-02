<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String shopping_cartId = "";
	String shopping_name = "";
	String shopping_date = "";
	String shopping_country = "";
	String shopping_zipCode = "";
	String shopping_addressName = "";
	
	//모든 쿠키로 설정된 내용을 쿠키배열로 받아옴.
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null) {
		for(int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String str = thisCookie.getName();  //쿠키의 Name 가져옴.
			
			//URLDecoder 클래스를 이용하여 문자셋을 다시 맞추어서 가져옴.
			if(str.equals("Shopping_cartId")) {
				shopping_cartId = URLDecoder.decode(thisCookie.getValue(), "utf-8");  //사용자가 입력한 값
			}
			if(str.equals("Shopping_date")) {
				shopping_date = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문 완료</title>
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp"/>	
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	
	<div class="container">
		<h2 class="alert alert-danger">주문해 주셔서 감사합니다.</h2>
	</div>
	
	<div class="container">
		<p>주문은 <% out.println(shopping_date); %>에 배송될 예정입니다.</p>
		<p>주문번호 : <% out.println(shopping_cartId); %></p>
	</div>
	
	<div class="container text-center">
		<p><a href="./products.jsp" class="btn btn-secondary">&laquo;상품 목록</a></p>
	</div>
	
	<jsp:include page="footer.jsp"/>
	
</body>
</html>

<%
	//주문이 완료되었으니 세션 삭제하고 관련 쿠키도 삭제.
	session.invalidate();

	for(int i = 0; i < cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		String str = thisCookie.getName();
		
		if(str.equals("Shopping_cartId")) {
			thisCookie.setMaxAge(0);
		}
		if(str.equals("Shopping_name")) {
			thisCookie.setMaxAge(0);
		}
		if(str.equals("Shopping_date")) {
			thisCookie.setMaxAge(0);
		}
		if(str.equals("Shopping_country")) {
			thisCookie.setMaxAge(0);
		}
		if(str.equals("Shopping_zipCode")) {
			thisCookie.setMaxAge(0);
		}
		if(str.equals("Shopping_addressName")) {
			thisCookie.setMaxAge(0);
		}
		
		//변경된 쿠키를 다시 응답 처리 객체에 재추가
		response.addCookie(thisCookie);
	}
%>