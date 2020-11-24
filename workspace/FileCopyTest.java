package kr.co.kihd.outputstream;

import java.io.FileInputStream;
import java.io.FileOutputStream;

public class FileCopyTest {
	
	public static void main(String[] args) throws Exception {
		
		FileInputStream fInputStream = new FileInputStream("C:\\workspace\\write3.txt");
		FileOutputStream fOutputStream = new FileOutputStream("C:\\workspace\\write4_복사본.txt");
		
		int data = 0;
//		while( (data = fInputStream.read()) != -1) {
//			fOutputStream.write(data);
//		}
//		fOutputStream.flush();
//		System.out.println("C드라이브에 write3_복사본.txt 파일이 생성되었습니다.");
		
		byte[] readBytes = new byte[3];
		
		while( (data = fInputStream.read(readBytes)) != -1) {
			fOutputStream.write(readBytes);
			System.out.println("읽은 바이트 수 : " + data);
		}
		fOutputStream.flush();
		System.out.println("C드라이브에 write4_복사본.txt 파일이 생성되었습니다.");
		
		
		fOutputStream.close();
		fInputStream.close();
		
	}
	
}
