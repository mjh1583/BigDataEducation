package kr.co.kihd.inputstream;

import java.io.FileInputStream;
import java.io.InputStream;

public class InputStreamReadTest03 {
	
	public static void main(String[] args) throws Exception {
		
		InputStream iStream = new FileInputStream("C:\\workspace\\test4.txt");
		
		int count;
		byte[] readBytes = new byte[10];
		
		//시작인덱스 2이고 5개만 읽어서 저장하는 코드를 작성
		count = iStream.read(readBytes, 2, 5);
		System.out.println("읽은 바이트 수 : " + count);
		System.out.println();
		
		for(byte b : readBytes) {
			System.out.println("읽은 바이트 : " + (char)b);
		}
		
		iStream.close();
		
	}
	
}
