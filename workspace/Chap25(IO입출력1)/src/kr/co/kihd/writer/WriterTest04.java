package kr.co.kihd.writer;

import java.io.FileWriter;
import java.io.Writer;

public class WriterTest04 {
	
	public static void main(String[] args) throws Exception {
		
		Writer writer = new FileWriter("C:/workspace/test10.txt");
		
		String str = "안녕하세요. 지금 자바 IO 기반의 입출력을 공부하고 있습니다.";
		//매개변수가 String 타입니다.
		//String을 파일에 그대로 저장하게 된다.
//		writer.write(str);
		//문자열 2번째 인데스부터 10개의 문자를 파일로 저장하기
		writer.write(str, 2, 10);
		writer.flush();
		System.out.println("파일이 생성되었습니다.");
		
		writer.close();
		
	}
	
}
