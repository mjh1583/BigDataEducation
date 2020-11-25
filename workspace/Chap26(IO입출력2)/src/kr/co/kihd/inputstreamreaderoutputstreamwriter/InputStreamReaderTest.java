package kr.co.kihd.inputstreamreaderoutputstreamwriter;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;

public class InputStreamReaderTest {
	
	public static void main(String[] args) throws Exception {
		
		//주 입력스트림을 바이트 기반인 InputStream으로 설정함.
		InputStream iStream = System.in;
		
		//문자를 받기 위해 보조스트림을 주 입력스트림에 연결한다.
		Reader reader = new InputStreamReader(iStream);
		
		int readCount;
		char[] cArr = new char[100];
		System.out.print("문자열을 입력하세요.");
		
		/*
		 * 콘솔에서 입력을 받을 때는 -1을 리턴하는 경우는 Ctrl+Z를 누르면 됨
		 * 콘솔창의 실행, 중지를 살펴야한다.
		 */
		while( (readCount = reader.read(cArr)) != -1) {
			String str = new String(cArr, 0, readCount);
			System.out.println("키보드로부터 읽은 문자열 : " + str);
		}
		
		reader.close();
		iStream.close();
		
	}
	
}
