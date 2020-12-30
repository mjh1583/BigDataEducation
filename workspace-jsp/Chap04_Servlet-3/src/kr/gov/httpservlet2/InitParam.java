package kr.gov.httpservlet2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 아래와 같이 어노테이션을 적용하기 위해서는 web.xml에 기술되어 있는 부분
 * 일단 주석처리함.
 * 주석처리를 해야 아래코드가 적용됨.
 * 어노테이션을 이용해서 직접 초기화 파라메터 값을 지정함.
 */

/*
 * 소결론 : 초기화 파라메터를 사용하는 곳은, 보통 관리자 계정을 많이 사용하고,
 * 보통은 web.xml 파일에 기술하는 거싱 바람직함.
 * 
 */
//두번째 방법
@WebServlet(urlPatterns = {"/InitP"}, 
			initParams = {
					@WebInitParam(name = "id", value = "scott"),
					@WebInitParam(name = "pw", value = "tiger"),
					@WebInitParam(name = "path", value = "C:\\workspace-jsp")
			}
		)
public class InitParam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InitParam() {
    	
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 호출");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		String id = this.getInitParameter("id");
		String pw = this.getInitParameter("pw");
		String path = this.getInitParameter("path");
		
		out.println("<html><head></head><body>");
		out.println("아이디 : " + id + "<br/>");
		out.println("비밀번호 : " + pw + "<br/>");
		out.println("경로 : " + path + "<br/>");
		out.println("</body></html>");
		
		out.close();
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
}
