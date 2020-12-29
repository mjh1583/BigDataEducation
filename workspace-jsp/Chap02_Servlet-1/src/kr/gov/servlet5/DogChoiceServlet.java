package kr.gov.servlet5;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/choiceDog")
public class DogChoiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DogChoiceServlet() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter writer = response.getWriter();
		
		//request.setCharacterEncoding("UTF-8");
		
		String[] dog = request.getParameterValues("dog");
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("</head>");
		
		writer.println("<body bgcolor='green'>");
		writer.println("<table align='center' bgcolor='yellow'>");
		writer.println("<tr>");
		
		for(int i = 0; i < dog.length; i++) {
			writer.println("<td>");
			writer.println("<img src='" + dog[i] + "'>");
			writer.println("</td>");
		}
		writer.println("</tr>");
		writer.println("</table>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
	}

}
