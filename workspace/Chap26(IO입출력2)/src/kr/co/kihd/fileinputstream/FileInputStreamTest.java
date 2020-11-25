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
		byte[] bArr = new byte[1000];
		//한 바이트씩 읽기
		while( (data = fis.read(bArr)) != -1) {
			//한글은 깨짐
			//System.out.print((char)data);
			
			/*
			 * 콘솔 출력(System.out.println())을 사용해도 무방하나,
			 * 1바이트씩 읽다 보니 한글이 깨지기 때문에 write()를 사용해도 괜찮음.
			 * write()도 역시 출력스트림이기 때문에 가능한 것이다.
			 */
			System.out.write(bArr);   //콘솔에 write
			i++;
		}
		System.out.println("루핑 수 : " + i);
		
		fis.close();
		
	}
	
}
