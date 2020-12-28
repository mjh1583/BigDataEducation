package kr.gov.servlet2;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/NowTime")
public class NowTime extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NowTime() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//문자셋 지정
		response.setContentType("text/html; charset=utf-8");
		/*
		 * 서블릿 : JSP표준 이전에 등장한 표준임.
		 * 		   자바 웹 어플리케이션 개발이 목적임.
		 * 
		 * 프로그램 실행 : @WebServlet 어노테이션 매핑방법과 web.xml에서의 매핑방법이 있음.
		 *  어노테이션 매핑방법 => 프로그램 개발을 완성한 후 릴리즈 했을때 
		 *  				   수정시 자바소스파일도 수정해야되고 아울러
		 *  				   재컴파일을 계속하게 될것임. => 유지보수 용이하지 않음.
		 *  web.xml에서의 매핑방법 => 낫긴 하지만, 이건 경우에 따라서 각각 다르게 구현
		 *  					   되어야함.
		 */
		PrintWriter out = response.getWriter();
		out.println("<HTML>");
		out.println("<HEAD><TITLE>현재 시간</TITLE></HEAD>");
		out.println("<Body>");
		out.println("지금 시간은");
		out.println(new Date());
		out.println("입니다.");
		
		out.println("</BODY>");
		out.println("</HTML>");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
