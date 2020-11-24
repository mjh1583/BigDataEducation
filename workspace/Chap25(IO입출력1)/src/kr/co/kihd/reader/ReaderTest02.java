package kr.co.kihd.reader;

import java.io.FileReader;
import java.io.Reader;

public class ReaderTest02 {
	
	public static void main(String[] args) throws Exception {
		
		Reader reader = new FileReader("C:/workspace/test5.txt");
		
		int readData;
		char[] cArr = new char[2];
		//String str = "";
		//하나의 인스턴스만 만들어서 작업
		StringBuilder sBuilder = new StringBuilder();
		
		//read() 매개변수 char[]타입이란 것에 주목을 반드시 하자.
		while( (readData = reader.read(cArr)) != -1) {
			//읽은 문자를 문자열로 생성
			//str += new String(cArr, 0, readData);
			sBuilder.append(cArr);
			System.out.println("읽은 문자수 : " + readData);
		}
		//문자열 출력
		//System.out.println(str);
		System.out.println(sBuilder);
		
		reader.close();
		
	}
	
}
