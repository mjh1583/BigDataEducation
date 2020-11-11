package kr.co.kihd.string;

import java.io.IOException;

public class KeyBoardToString {
	
	public static void main(String[] args) {
		
		byte[] bytes = new byte[100];
//		System.out.println(bytes[99]);

		System.out.print("입력 : ");
		int readBytesNo = 0;
		
		try {
			//키보드(표준입력)으로부터 입력을 받고 그 내용을 bytes에 저장을 하고 입력받은 바이트 수를 리턴
			readBytesNo = System.in.read(bytes);
			String str = new String(bytes, 0, readBytesNo-2, "utf-8");
			System.out.println(str);
			
			System.out.println("입력받은 바이트 수 : " + readBytesNo);
			
			//euc-kr : 한글 2byte, utf-8 : 한글 3byte
			byte[] b = str.getBytes("euc-kr");
			System.out.println(b.length);
			
			byte[] b2 = "안녕하세요".getBytes();
			String str2 = new String(b2, 0, b2.length, "utf-8");
			System.out.println(str2);
			System.out.println(b2.length);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
