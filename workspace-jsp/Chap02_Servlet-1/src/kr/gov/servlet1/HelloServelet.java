package kr.gov.servlet1;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//URL매핑코드가 @WebServlet 어노테이션에 표기됨.

//@WebServler 어노테이션보다 web.xml에서 지정한 매핑코드가 우선 순위 훨씬 높음.
@WebServlet("/HelloServelet")
//서블릿 파일은 HttpServlet클래스를 자동으로 상속받음.
public class HelloServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	//생성자
    public HelloServelet() {
    	
    }
    
    /*
     * 여기서 2가지 메서드가 나옴. -- doGet(), doPost()임.
     * 							이 서블릿 파일이 처리하는 부분임.
     * 이 서블릿을 호출할 때 즉 클라이언트에서 요청이 들어올때,
     * get방식이냐, post방식이냐에 따라 호출이 달라짐.
     * 보통, doGet()메서드는 폼(form)을 그냥 출력하는 형태로 많이 쓰이고,
     * doPost() 메서드는 데이터를 가공하거나 처리코드를 실행할 때 많이 사용함.
     */
    
    //doGet()이 기본
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Hello Servlet!");
		System.out.println("doGet()");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Hello Servlet!");
		System.out.println("doPost()");
	}
	
	/*
	 * 소결론
	 *  1.jsp 파일 : HTML파일내에 jsp코드를 넣는 것.
	 *  2.servlet 파일 : 자바파일이고, 반드시 매핑을 해서 사용해야 함.
	 */
}
