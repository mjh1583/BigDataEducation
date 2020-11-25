package kr.co.kihd.filereaderfilewriter;

import java.io.File;
import java.io.FileReader;

public class FileReaderTest {
	
	public static void main(String[] args) throws Exception {
		
		File filePath = new File("C:\\workspace\\Chap26(IO입출력2)\\src\\kr\\co\\kihd\\filereaderfilewriter\\files\\코로나19 대국민 담화문.txt");
		//System.out.println(filePath.getCanonicalPath());    //절대 경로
		
		/*
		 * XXXReader, XXXWriter붙는 클래스들 : 문자특화기반 클래스
		 * 해당 클래스들은 동영상, 사진, 오디오 등 이진파일을 읽을 수 없음.
		 */
		
		FileReader fReader = new FileReader(filePath);
		//System.out.println("파일크기 : " + filePath.length());
		
		int readCharNo;
		/*
		 * char[]의 사이즈가 크면 클수록 역시 많은 데이터를 한번에 읽기 때문에 
		 * 속도가 향상된다.
		 */
		char[] cArr = new char[200];
		int i = 0;
		
		while( (readCharNo = fReader.read(cArr)) != -1) {
			String str = new String(cArr, 0, readCharNo);
			System.out.print(str);
			i++;
		}
		System.out.println();
		System.out.println("총 루핑수 : " + i);
		
		fReader.close();
		
	}
	
}
