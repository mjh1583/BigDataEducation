package kr.gov.httpservlet3;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GuguServlet
 */
@WebServlet("/gugu")
public class GuguServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuguServlet() {
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("doGet() 호출");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		int number = Integer.parseInt(request.getParameter("number"));
		
		//예외 처리하는 코드
		if(number < 1 || number > 9) {
			writer.println("<html><head></head><body>");
			writer.println("<h1>구구단은 2~9단 사이입니다.</h1>");
			writer.println("</body></html>");
			return;
		}
		
		writer.println("<table border=1 width=800 align=center>");
		writer.println("<tr align=center bgcolor='#FFFF66' >");
		writer.println("<td colspan=4>" + number + "단 출력 </td>");
		
		for(int i = 1; i < 10; i++) {
			//홀수와 짝수에 따라서 배경색을 바꾸어줌
			if(i % 2 == 0) {
				writer.println("<tr align=center bgcolor='#ACFA58'>");
			}
			else {
				writer.println("<tr align=center bgcolor='#81BEF7'>");
			}
			writer.println("<td width=200>" + number + "</td>");
			writer.println("<td width=200>" + i + "</td>");
			writer.println("<td width=200>" + number + " * " + i + "</td>");
			writer.println("<td width=200>" + (number * i) + "</td>");
			writer.println("</tr>");
		}
		writer.println("</tr>");
		writer.println("</table>");
		writer.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
