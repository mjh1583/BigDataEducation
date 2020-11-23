package kr.co.kihd.outputstream;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

public class OutputStreamTest02 {
	
	public static void main(String[] args) throws Exception {
		//파일로부터 출력스트림 생성해서 대입하고 있다.
		OutputStream oStream = new FileOutputStream("C:\\workspace\\write2.txt");
		
		//"ABC가나다" 문자열을 통해서 바이트 배열을 얻고 있다.(인코딩)
		byte[] data = "ABC가나다".getBytes();
		//getBytes()를 사용할때, 매개변수의 값으로 캐릭터셋을 줄수가 있는데
		//EUC-KR, x-windows-949는 한글을 2바이트 인식,
		//UTF-8은 한글을 3바이트로 인식한다.
		//ISO8859-1 캐릭터 셋에서는 한글을 1바이트로 인식한다.
		System.out.println("data 바이트배열의 크기 : " + data.length);
		
		//바이트 배열을 한번에 스트림에 보낸다.
		//앞에서 본 write(int b)메서드에 비해서 훨씬 효율적이다.
		oStream.write(data);
		System.out.println("저장이 완료되었습니다.");
		oStream.flush();
		
		System.out.println();
		//출력으로 내보낸 파일인 write2.txt파일을 읽어들인다.
		InputStream iStream = new FileInputStream("C:\\workspace\\write2.txt");
		int count = 0;
		
		//UTF-8이 한글이 3바이트이므로 바이트 배열을 3바이트 생성함.
		byte[] readBytes = new byte[3];
		int i = 0;
		
		while( (count = iStream.read(readBytes)) != -1) {
			i++;
			String str = new String(readBytes);		//디코딩
			System.out.println("읽은 값 : " + str);
			System.out.println("읽은 바이트 수 : " + count);
		}
		System.out.println("루핑 수 : " + i);
		
		iStream.close();	
		oStream.close();
		
	}
	
}
