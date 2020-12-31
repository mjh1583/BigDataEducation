package kr.gov.servletcontextlistener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ServletListener implements ServletContextListener{
	
	//톰캣서버 시작될때 자동 호출 됨.
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("contextInitialized() 호출");
	}
	
	//톰캣서버 중지될때 자동 호출
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("contextDestroyed() 호출");
	}
	
	/*
	 * 위 2개의 콜백 메서드는 다른 웹어플리케이션(타 프로젝트)이 실행될때와
	 * 종료될때 같이 실행되기 때문에 위와 같은 코드를 보여주기 원하지않으면 주석처리하면 됨.
	 */
	
}

/*
 * 서블릿의 실행 순서(리스너 포함)
 * 
 * 1.contextInitialized() 호출
 * 2. 생성자 호출
 * 3.initPostConstructor() 선처리
 * 4.init() 호출
 * 5.service() 호출 -- doGet()호출, doPost()호출
 * 6.destroy() 호출
 * 7.destroyPredestroy() 후처리
 * 8.contextDestroyed() 호출
 * 
 */
