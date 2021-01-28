package kr.gov.requsetdispatcher;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 	* 서블릿 포워드 기능
 * 	1. 포워드 기능 : 하나의 서블릿에서 다른 서블릿이나 JSP와 연동하는 방법
 * 	2. 포워드 용도 : 요청(request)에 대한 추가 작업을 다른 서블릿에게 수행하게 함.
 * 				   요청(request)에 포함된 정보를 다른 서블릿이나 JSP와 공유함.
 * 				   요청(request)에 정보를 포함시켜 다른 서블릿에 전달할 수 있음.
 * 				   모델2 개발 시 서블릿에서 JSP로 데이터를 전달하는 데 사용됨.
 *  3. 서블릿의 포워드 방법
 *  	1) dispatch 방법
 *  		- 일반적으로 포워딩 기능을 지칭
 *  		- RequestDispatcher 클래스의 forward() 메서드를 이용.
 *  	2) redirect 방법
 *  		- HttpServletResponse 객체의 sendRedirect() 메서드를 이용
 *  		- 웹 브라우저에 재요청하는 방식
 */

@WebServlet("/DispatchTest")
public class DispatchTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public DispatchTest() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		request.setAttribute("name", "gumi");  //name이라는 것에 gumi 저장
		request.setAttribute("id", "daegu");
		
		// /hello라고 서블릿맵핑이 되어있는 곳에서도 request, response 객체가 사용됨.
		RequestDispatcher dispatcher = request.getRequestDispatcher("/hello");
		dispatcher.forward(request, response);
		
	}

}
