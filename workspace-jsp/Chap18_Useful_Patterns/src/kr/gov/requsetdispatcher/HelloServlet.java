package kr.gov.requsetdispatcher;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * * dispatch를 이용한 포워딩 과정
 * 		: dispatch 방식은 클라이언트의 브라우저를 거치지 않고 서버에서 포워딩이 진행
 * 		1) 클라이언트의 웹 브라우저에서 첫번째 서블릿(DispatchTest)에 요청함
 * 		2) 첫번째 서블릿(DispatchTest)은 RequestDispatcher를 이용해 두번째 서블릿(HelloServlet)으로 포워딩함.
 * 		==> 모델2나 스프링 프레임워크에서 포워딩 시 사용
 */

@WebServlet("/hello")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HelloServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		out.println("<html><head></head><body>");
		out.println("<h1>Hello</h1>");
		out.println("<h1>Hello " + request.getAttribute("name") + "</h1>");
		out.println("<h1>Hello " + request.getAttribute("id") + "</h1>");
		
		out.println("</body></html>");
	}
	
}
