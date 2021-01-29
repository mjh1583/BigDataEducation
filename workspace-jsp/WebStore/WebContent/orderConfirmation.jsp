<%@page import="java.text.DecimalFormat"%>
<%@page import="kr.gov.dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	DecimalFormat dFormat = new DecimalFormat("###,###");		//숫자를 천단위 구분 
	String cartId = session.getId();
	
	String shopping_cartId = "";
	String shopping_name = "";
	String shopping_date = "";
	String shopping_country = "";
	String shopping_zipCode = "";
	String shopping_addressName = "";
	
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null) {
		for(int i = 0;  i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String str = thisCookie.getName();  //쿠키의 Name 가져옴.
			
			//URLDecoder 클래스를 이용하여 문자셋을 다시 맞추어서 가져오는 것
			if(str.equals("Shopping_cartId")) {
				shopping_cartId = URLDecoder.decode(thisCookie.getValue(), "utf-8");  //사용자가 입력한 값
			}
			if(str.equals("Shopping_name")) {
				shopping_name = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			}
			if(str.equals("Shopping_date")) {
				shopping_date = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			}
			if(str.equals("Shopping_country")) {
				shopping_country = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			}
			if(str.equals("Shopping_zipCode")) {
				shopping_zipCode = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			}
			if(str.equals("Shopping_addressName")) {
				shopping_addressName = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			}
			
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문 정보</title>
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css"> 
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 정보</h1>
		</div>
	</div>
	
	<div class="container col-8 alert alert-info">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong><br/>
				성명 : <% out.println(shopping_name); %><br/>
				우편번호 : <% out.println(shopping_zipCode); %><br/>
				주소 : <% out.println(shopping_addressName); %><br/>
			</div>
			
			<div class="col-4" align="right">
				<p><em>배송일 : <% out.println(shopping_date); %></em></p>
			</div>
		</div>
		
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">물품</th>
					<th class="text-center">수량</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>
				
				<%
					int sum = 0;
					ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cardList");
					
					if(cartList == null) {
						cartList = new ArrayList<>();
					}
					
					for(int i = 0; i < cartList.size(); i++) {
						Product product = cartList.get(i);
						int total = product.getUnitPrice() * product.getQuantity();  //한 물품의 가격
						sum += total;  //총합
				%>
				<tr>
					<td class="text-center"><em><%= product.getPname() %></em></td>
					<td class="text-center"><em><%= product.getQuantity() %></em></td>
					<td class="text-center"><em><%= dFormat.format(product.getUnitPrice()) %></em></td>
					<td class="text-center"><em><%= dFormat.format(total) %>원</em></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td class="text-center"><em></em></td>
					<td class="text-center"><em></em></td>
					<td class="text-right"><strong>총액 : </strong></td>
					<td class="text-center text-danger"><strong><%= dFormat.format(sum) %>원</strong></td>
				</tr>
			</table>
			
			<a href="./shoppingInfo.jsp?cartId=<%= shopping_cartId %>" class="btn btn-secondary" role="button">이전</a>
			<a href="./thanksCustomer.jsp" class="btn btn-success" role="button">주문완료</a>
			<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>