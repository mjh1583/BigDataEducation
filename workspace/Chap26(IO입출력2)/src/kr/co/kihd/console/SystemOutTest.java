package kr.co.kihd.console;

import java.io.OutputStream;

public class SystemOutTest {
	
	public static void main(String[] args) throws Exception {
		
		/*
		 * PrintStream(System.out)은 OutputStream의 자손 클래스이므로
		 * 얼마든지 대입이 가능하다.(다형성)
		 */
		OutputStream oStream = System.out;
		
		//아스키코드표 출력
		for(byte b = 48; b < 58; b++) {
			System.out.print(b + "\t");
			System.out.print("아스키 코드표의 문자값 : ");
			oStream.write(b);
			System.out.println();
		}
		
		oStream.write(13);  //출력스트림을 이용한 줄바꿈
		
		for(byte b = 97; b < 127; b++) {
			System.out.print(b + "\t");   //기계가 알아보기 쉬움.
			System.out.print("아스키 코드표의 문자값 : ");
			oStream.write(b);             //사람이 알아보기 쉬움.
			System.out.println();
		}
		
		oStream.write(13);  //출력스트림을 이용한 줄바꿈
		
	}
	
}
