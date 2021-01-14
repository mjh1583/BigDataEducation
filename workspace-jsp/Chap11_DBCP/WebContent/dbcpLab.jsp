<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	1. DAO(Data Access Object) 패턴
		1) 비즈니스 로직과 데이터 액세스 로직을 분리하는 것이 원칙임.
		2) 의미있는 비즈니스 로직을 가진 엔터프라이즈 애플리케이션이라면 데이터 액세스 계층을
		   DAO 패턴으로 분리해야 함.
		3) 서비스계층에 영향을 주지 않고 데이터 액세스 기술을 변경할 수 있는 장점이 있음.
		
	2. 컨넥션 풀링을 지원하는 DataSource
		1) 미리 정해진 개수만큼의 DB 컨넥션을 풀(Pool)에 준비해두고,
		   애플리케이션이 요청할 때마다 Pool에서 꺼내서 하나씩 할당해주고
		   다시 돌려받아서 Pool에 넣는 식의 기법임.
		2) 다중 사용자를 갖는 엔터프라이즈 시스템에서라면 반드시 DB 컨넥션 풀링
		   기능을 지원하는 DataSource를 사용해야 함.
	
	3. DataSource 종류
		1) 오픈소스 DataSource
			- Apache Commons DBCP
				: 가장 유명한 오픈소스 DB 커넥션 풀(Pool) 라이브러리
		2) ...
		
	* Servers의 context.xml에 Resource 추가해야 사용가능함.
 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DBCP 테스트</title>
</head>
<body>
	<%
		/* Context인터페이스 : 서버에 있는 컨텍스트 패스를 얻기 위해서 생성 
		   서버가 실행 되면 이미 DBCP는 만들어졌기 때문에 가져다 사용하면 됨.
		   Context의 lookup()을 사용하기 위해서 InitialContext() 클래스로 대입함. */
		/* Connection 객체 : 1157588510
		   Connection 객체 : 1385987831
		*/
		Context context = new InitialContext();
		DataSource dataSource = (DataSource)context.lookup("java:comp/env/" + "jdbc/dbconn");
		Connection connection = dataSource.getConnection();
		out.println("DBCP연동 완료");
		out.println("Connection 객체 : " + connection.toString());
		out.println("Thread 명 : " + Thread.currentThread().getName());
		
	%>
</body>
</html>













