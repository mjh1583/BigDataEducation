package kr.co.kihd.outputstream;

import java.io.FileOutputStream;
import java.io.OutputStream;

public class OutputStreamTest03 {

	public static void main(String[] args) throws Exception {
		
		OutputStream oStream = new FileOutputStream("C:\\workspace\\write3.txt");
		
		byte[] data = "ABC빅데이터란".getBytes();
		System.out.println("data바이트 배열의 크기 : " + data.length);
		
		//시작인덱스가 3이고, 15개의 길이만큼 파일로 내보낸다.
		oStream.write(data, 3, 15);
		oStream.flush();
		System.out.println("파일이 저장되었습니다.");
		
		oStream.close();
	}

}
