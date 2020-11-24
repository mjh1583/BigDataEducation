package kr.co.kihd.writer;

import java.io.FileWriter;
import java.io.Writer;
import java.util.Arrays;

public class WriterTest01 {
	
	public static void main(String[] args) throws Exception {
		
		//toCharArray()는 문자열을 char[]로 리턴해준다.
		char[] str = "이순신".toCharArray();
		System.out.println(Arrays.toString(str));
		
		Writer writer = new FileWriter("C:/workspace/test6.txt");
		
		for(int i = 0; i < str.length; i++) {
			//한 문자씩 보내는 형태
			writer.write((char)str[i]);   //덜 효율적
			System.out.println("루핑수 : " + (i + 1));
		}
		//강제로 버퍼를 비워준다.
		writer.flush();
		System.out.println("파일이 생성되었습니다.");
		
		writer.close();
		
	}
	
}
