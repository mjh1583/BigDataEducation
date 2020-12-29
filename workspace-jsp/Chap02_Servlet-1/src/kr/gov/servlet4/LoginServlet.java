package kr.gov.servlet4;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 호출됨");
		
		//클라이언트가 요청한 파라메터 값들을 인코딩을 해주는 코드
		request.setCharacterEncoding("utf-8");
		
		//클라이언트에게서 넘어오는 id, 비밀번호 값을 받고 인코딩 설정 후 출력스트림 얻고 화면에 출력.
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();

		writer.println("아이디 : " + id + "<br/>");
		writer.println("비밀번호 : " + passwd + "<br/>");
//		writer.println("<html>");
//		writer.println("<head>");
//		writer.println("</head>");
//		writer.println("<body>");
//		writer.println("<h1>doGet 방식입니다. 로그인 성공!</h1>");
//		writer.println("</body>");
//		writer.println("</html>");
//		writer.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost 호출됨");
		
		//클라이언트가 요청한 파라메터 값들을 인코딩을 해주는 코드
		request.setCharacterEncoding("utf-8");
		
		//클라이언트에게서 넘어오는 id, 비밀번호 값을 받고 인코딩 설정 후 출력스트림 얻고 화면에 출력.
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();

		writer.println("아이디 : " + id + "<br/>");
		writer.println("비밀번호 : " + passwd + "<br/>");
	}

}
