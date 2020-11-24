package kr.co.kihd.reader;

import java.io.FileReader;
import java.io.Reader;

public class ReaderTest01 {
	
	public static void main(String[] args) throws Exception {
		//Reader 클래스는 문자특화 클래스로서 하위클래스인 FileReader를 생성해서 대입
		Reader reader = new FileReader("C:/workspace/test5.txt");
		
		int readData = 0;
		
		//readData는 int값으로 끝 2바이트(문자 2바이트이니까)에 저장된다.
		while( (readData = reader.read()) != -1) {
			//문자출력(바이트정보를 강제로 캐스팅)
			System.out.println("읽은 문자 : " + (char)readData);
			//영문자는 아스키코드가 출력이 되고, 한글은 유니코드가 출력.
			System.out.println("읽은 문자 : " + readData);
		}
		
//		while(true) {
//			readData = reader.read();
//			if(readData == -1) {
//				break;
//			}
//			System.out.println("읽은 문자 : " + (char)readData);
//		}
		
		reader.close();
		
	}
	
}
