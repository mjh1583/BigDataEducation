package kr.co.kihd.fileinputstream;

import java.io.File;
import java.io.FileInputStream;

public class FileInputStreamTest {
	
	public static void main(String[] args) throws Exception {
		
		File file = new File("C:\\workspace\\Chap26(IO입출력2)\\src\\kr\\co\\kihd\\fileinputstream\\FileInputStreamTest.java");
		//파일의 경로를 얻기
		System.out.println("파일의 경로 : " + file.getPath());
		System.out.println("부모 디렉토리 : " + file.getParent());
		System.out.println("실행 가능한가 : " + file.canExecute());
		System.out.println("읽기 가능한가 : " + file.canRead());
		System.out.println("숨김 파일인가 : " + file.isHidden());
		System.out.println("쓰기나 수정이 가능한가 : " + file.canWrite());
		System.out.println("파일 이름 : " + file.getName());
		System.out.println("파일 크기 : " + file.length());
		System.out.println("URI 출력 : " + file.toURI());
		System.out.println();
		
		FileInputStream fis = new FileInputStream(file);
		
		int data;
		int i = 0;
		while( (data = fis.read()) != -1) {
			i++;
			System.out.write(data);   //콘솔에 write
		}
		System.out.println("루핑 수 : " + i);
		
		fis.close();
		
	}
	
}
