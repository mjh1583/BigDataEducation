package kr.co.kihd.writer;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.Reader;
import java.io.Writer;

public class FileCopyReaderWriterTest {
	
	public static void main(String[] args) throws Exception {
		
		Reader reader = new FileReader("C:/workspace/FileCopyTest.java");
		Writer writer = new FileWriter("C:/workspace/FileCopyTest_복사본.java");
		
//		int count;
//		StringBuilder sBuilder = new StringBuilder();
//		
//		while( (count = reader.read()) != -1) {
//			sBuilder.append((char)count);
//		}
//		
//		String str = sBuilder.toString();

		String str = "";
		int readBytes;
		char[] cArr = new char[1000];
		int i = 0;
		
		while( (readBytes = reader.read(cArr)) != -1) {
			i++;
			String str1 = new String(cArr);
			str += str1;
			System.out.println("루핑 수 : " + i);
			System.out.println("읽은 바이트 수 : " + readBytes);
		}
		
		writer.write(str);
		writer.flush();
		System.out.println("C드라이브에 FileCopyTest_복사본이 생성되었습니다.");
		
		writer.close();
		reader.close();
		
	}
	
}
