package kr.co.kihd.filereaderfilewriter;

import java.io.File;
import java.io.FileWriter;

public class FileWriterTest {
	
	public static void main(String[] args) throws Exception {
		
		File file = new File("C:/Temp1/abc.txt");
		//내용이 계속 덮어써진다.
		//FileWriter fWriter = new FileWriter(file);
		
		//생성자에 true라는 매개변수가 붙어있기 때문에, 기존 파일에
		//append가 된다.(내용이 이어진다.)
		FileWriter fWriter = new FileWriter(file, true);
		
		fWriter.write("FileWriter클래스로 보낸 내용입니다." + "\r\n");
		fWriter.write("FileWriter클래스로 다시 보낸 내용입니다." + "\r\n");
		
		System.out.println(file.getName() + "이 생성되었습니다.");
		fWriter.flush();
		
		fWriter.close();
		
	}
	
}
