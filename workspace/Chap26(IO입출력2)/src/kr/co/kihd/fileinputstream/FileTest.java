package kr.co.kihd.fileinputstream;

import java.io.File;
import java.net.URI;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FileTest {
	
	public static void main(String[] args) throws Exception {
		
		//아래라인을 실행한다고 해서 C:/Temp1/directory 폴더를 만들지 않는다.
		File directory = new File("C:/Temp1/directory");
		
		File file1 = new File("C:/Temp1/file1.txt");
		File file2 = new File("C:/Temp1/file2.txt");
		File file3 = new File(new URI("file:///C:/Temp1/file3.txt"));  //URI를 이용한 파일 생성
		
//		String uriName = "https://www.google.com/Temp/file3.txt";
//		URI uri = new URI(uriName);
//		System.out.println(uri);
		/*
		 * URI 객체 : 문자열 전송과 조작을 위한 프로토콜
		 * URL 객체 : 네트워크 전송을 위한 프로토콜
		 * 프로토콜 : 통신규약(TCP/IP, UDP..)
		 * URI : 통합 자원 식별자는 인터넷에 있는 자원을 나타내는 유일한 주소
		 */
		
		//directory폴더가 존재하느냐?
		if(!directory.exists()) {
			/*
			 * mkdir() : 부모디렉토리가 없으면 자기자신의 폴더를 만들고,
			 * 			 부모가 있다면 그 안에 자신의 폴더를 만든다.
			 * 			 단, 부모 폴더가 없는데 경로에 부모를 줬다면 폴더는 안 만들어진다. 
			 * mkdirs() :경로상에 없더라도 디렉토리를 다 생성한다.(권장방법)
			 */
			directory.mkdirs();
		}
		
		if(!file1.exists()) {
			file1.createNewFile();
			System.out.println("file1.txt가 생성되었습니다.");
		}
		
		if(!file2.exists()) {
			file2.createNewFile();
			System.out.println("file2.txt가 생성되었습니다.");
		}
		
		if(!file3.exists()) {
			file3.createNewFile();
			System.out.println("file3.txt가 생성되었습니다.");
		}
		
		File temp = new File("C:/workspace");
		//workspace의 서브 디렉토리 및 파일을 배열로 만들어 출력해보기
		File[] contents = temp.listFiles();
		
		System.out.println("날짜  \t   시간  \t  크기  \t\t  이름");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a hh:mm");
		System.out.println("------------------------------------------------------------");
		
		for(File file : contents) {
			System.out.print(sdf.format(new Date(file.lastModified())));
			
			//file이 디렉토리이냐?
			if(file.isDirectory()) {
				//디렉토리 이름 출력
				System.out.print("\t<DIR>\t\t" + file.getName());
			}
			//file이면
			else {
				//파일의 크기와 이름을 출력한다.
				System.out.print("\t" + file.length() + "\t\t" + file.getName());
			}
			
			System.out.println();
		}
		
	}
	
}
