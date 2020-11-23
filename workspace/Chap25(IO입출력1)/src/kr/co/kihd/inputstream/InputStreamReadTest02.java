package kr.co.kihd.inputstream;

import java.io.FileInputStream;
import java.io.InputStream;

public class InputStreamReadTest02 {
	
	public static void main(String[] args) throws Exception {
		
		InputStream iStream = new FileInputStream("C:\\workspace\\test4.txt");
		
		int readByteNo;
		byte[] bytes = new byte[3];
		
		while( (readByteNo = iStream.read(bytes)) != -1) {
			System.out.println("읽은 바이트 수 : " + readByteNo);
			//String 클래스로 반드시 디코딩해야 한글이 출력됨
			String str = new String(bytes);
			System.out.println("읽은 문자열 : " + str);  //문자열 출력
		}
		
		iStream.close();
		
	}
	
}
