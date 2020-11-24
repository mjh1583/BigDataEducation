package kr.co.kihd.reader;

import java.io.FileReader;
import java.io.Reader;

public class ReaderTest03 {
	
	public static void main(String[] args) throws Exception {
		
		Reader reader = new FileReader("C:/workspace/test5.txt");
		
		char[] cArr = new char[10];
		
		//cArr배열에 1번째 인덱스부터 test5.txt파일에 있는 3자를 읽어서 저장.
		int readData = reader.read(cArr, 1, 3);
		System.out.println("읽은 문자 수 : " + readData);
		
		//출력결과, 0인덱스에는 공백이 출력되며 1부터 4의 길이만큼만 읽어서 출력함.
		for(int i = 0; i < cArr.length; i++) {
			System.out.println(i + "번째 문자 : " + cArr[i]);
		}
		
		reader.close();
		
	}
	
}
