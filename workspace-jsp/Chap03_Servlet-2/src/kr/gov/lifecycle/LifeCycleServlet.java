package kr.gov.lifecycle;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LC")
public class LifeCycleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/*
	 * init() : ctrl + space 눌러 직접 입력하여 코딩
	 * 최초 한번만 실행 됨.
	 */
	@Override
	public void init() throws ServletException {
		System.out.println("init() 호출");
	}
	
    public LifeCycleServlet() {
    	System.out.println("생성자 호출");
    }
    
    /*
     * 실행되었을 때, 서블릿객체가 메모리에 로딩되고, 계속 재사용함.
     * 주소 표시줄에 새로고침을 계속하면 doGet() 호출되는것 볼 수 있음.
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 호출");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() 호출");
	}
	
	/*
	 * doGet(), doPost()가 없다면 service()가 호출되고,
	 * 세가지 메서드가 다 존재하여도 service()가 호출됨.
	 * service() 호출시에는 get,post방식 중 어떤 메서드 방식으로 호출이 되었는지 확인안됨.
	 * 그래서 doGet(), doPost()메서드를 사용함.
	 */
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service() 호출");
	}
	
	//서버를 중지시켜보면 destroy()가 호출되는 것을 볼 수 있음.
	@Override
	public void destroy() {
		System.out.println("destroy() 호출");
	}
	
	/*
	 * 오버라이딩 개념아님. 직접 메서드 만들어주는 것임.
	 * 선처리 부분에 해당함.
	 * init()메서드가 호출되기 전에 먼저 실행함.
	 * @PostConstruct 어노테이션이 컴파일러에게 따로 지시함.
	 */
	@PostConstruct
	private void initPostConstructor() {
		System.out.println("initPostConstructor() 선처리");
	}
	
	/*
	 * 오버라이딩 개념아님. 직접 메서드 만들어주는 것임.
	 * 후처리 부분에 해당함.
	 * destroy()메서드가 호출된 후에 실행함.
	 * @PreDestroy 어노테이션이 컴파일러에게 따로 지시함.
	 */
	@PreDestroy
	private void destroyPreDestroy() {
		System.out.println("destroyPreDestroy() 후처리");
	}
	
}
