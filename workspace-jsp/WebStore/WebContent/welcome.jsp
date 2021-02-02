<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 
		* 웹 사이트 구축 (흐름)											   9. 예외처리 페이지 만들기
		1. 시작페이지 만들기												  10. 로그 기록하기
		2. 상품 목록 표시하기 (DB 연결 추가 예정) ==> 3. 상품 상세정보 표시하기 ==> 4. 상품 등록 페이지 만들기 ==> 11. 장바구니 페이지 만들기 => 12. 주문처리 페이지 만들기
		13. Database ==> 회원가입									       5. 상품 이미지 등록하기
		14. 게시판 만들기												   6. 유효성 검사하기 ==> 7. 다국어 처리하기 ==> 8. 보안 처리하기
		
		* 주문처리 페이지
			- 배송 정보 페이지 => 주문 정보 => 주문 완료
									  => 주문 취소
 -->

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>스토어</title>
	<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp"/>	
	
	<%
		String greeting = "스토어에 오신것을 환영합니다.";
		String welcome = "Welcome to the Store!";
	%>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%= greeting %></h1>
		</div>
	</div>
	
	<div class="container">
		<div class="text-center">
			<h3><%= welcome %></h3>
			
			<%
				//웹사이트의 리프레쉬 기능 추가
				response.setIntHeader("Refresh", 5);
				
				Calendar calendar = Calendar.getInstance();
				int hour = calendar.get(Calendar.HOUR_OF_DAY);
				int minute = calendar.get(Calendar.MINUTE);
				int second = calendar.get(Calendar.SECOND);
				int am_pm = calendar.get(Calendar.AM_PM);
				
				String ampm = null;
				if(am_pm == 0) {
					ampm = "오전";
				}
				else {
					ampm = "오후";
				}
				
				String connectionTime = ampm + ":" + hour + ":" + minute + ":" + second;
				
				out.println("현재 접속 시간 : " + connectionTime + "\n");
				
			%>
		</div>
		<hr/>
	</div>
	
	<jsp:include page="footer.jsp"/>
	
</body>
</html>