package kr.co.kihd.writer;

import java.io.FileWriter;
import java.io.Writer;

public class WriterTest03 {
	
	public static void main(String[] args) throws Exception {
		
		Writer writer = new FileWriter("C:/workspace/test8.txt");
		//문자열 => 문자배열로 리턴
		char[] str = "신사임당이다".toCharArray();
		
		writer.write(str, 1, 4);
		writer.flush();
		System.out.println("파일이 생성되었습니다.");
		
		writer.close();
		
	}
	
}
