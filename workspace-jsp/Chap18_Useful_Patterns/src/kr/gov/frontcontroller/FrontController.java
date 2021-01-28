package kr.gov.frontcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// *.do 확장자를 여기서 FrontController가 다 도맡아서 처리하겠다라고 명시함.
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public FrontController() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 호출");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() 호출");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("actionDo() 호출");
		
		String uri = request.getRequestURI();
		System.out.println("URI : " + uri);
		
		//getContextPath()는 프로젝트명이 리턴됨.
		String contextPath = request.getContextPath();
		System.out.println("contextPath : " + contextPath);
		
		String command = uri.substring(contextPath.length());
		System.out.println("command : " + command);
		
		if(command.equals("/insert.do")) {
			System.out.println("---------------------");
			System.out.println("/insert.do 페이지 호출");
			System.out.println("---------------------");
		}
		else if(command.equals("/update.do")) {
			System.out.println("---------------------");
			System.out.println("/update.do 페이지 호출");
			System.out.println("---------------------");
		}
		else if(command.equals("/select.do")) {
			System.out.println("---------------------");
			System.out.println("/select.do 페이지 호출");
			System.out.println("---------------------");
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			
			PrintWriter out = response.getWriter();
			out.println("<html><head></head><body>");
			out.println();
			out.println("</body></html>");
		}
		else if(command.equals("/delete.do")) {
			System.out.println("---------------------");
			System.out.println("/delete.do 페이지 호출");
			System.out.println("---------------------");
		}
	}
	
}
