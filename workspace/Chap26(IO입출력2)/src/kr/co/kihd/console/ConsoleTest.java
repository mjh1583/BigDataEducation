package kr.co.kihd.console;

import java.io.Console;

public class ConsoleTest {
	
	public static void main(String[] args) {
		
		Console console = System.console();
		/*
		 * Console클래스는 실행시 이클립스의 콘솔뷰에서 하게 되면 null을 리턴한다.
		 * 그래서 NullPointerException을 발생시킨다.
		 * 반드시 명령 프롬포트에서 실행해야한다.
		 */
		System.out.print("id : ");
		String id = console.readLine();
		
		System.out.println("password : ");
		//콘솔창에 입력한 문자가 에코출력X, 즉 보이지 않는다.(보안)
		char[] password = console.readPassword();
		String pStr = new String(password);
		
		System.out.println("-------------------------------------------------------------");
		System.out.println("id : " + id);
		System.out.println("pwd : " + pStr);
		
	}
	
}
