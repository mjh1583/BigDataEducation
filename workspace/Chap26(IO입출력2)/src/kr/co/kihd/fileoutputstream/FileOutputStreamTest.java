package kr.co.kihd.fileoutputstream;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class FileOutputStreamTest {
	
	public static void main(String[] args) throws Exception {
		//파일 복사를 하기 위한 경로를 설정
		//String originFileName = "C:\workspace\Chap26(IO입출력2)\src\kr\co\kihd\fileoutputstream\earth.jpg";
		//String originFileName = "C:\\workspace\\Chap26(IO입출력2)\\src\\kr\\co\\kihd\\fileoutputstream\\Norway AMAZING Beautiful Nature with Relaxing Music and sound - 4k Ultra HD Quality.mp4";
		//String originFileName = "C:\\workspace\\Chap26(IO입출력2)\\src\\kr\\co\\kihd\\fileoutputstream\\SampleData.xlsx";
		String originFileName = "C:\\workspace\\Chap26(IO입출력2)\\src\\kr\\co\\kihd\\fileoutputstream\\어서와 자바는 처음이지.ppt";
		//String targetFileName = "C:/Temp1/earth.jpg";
		//String targetFileName = "C:/Temp1/Nature.mp4";
		//String targetFileName = "C:/Temp1/Sample.xlsx";
		String targetFileName = "C:/Temp1/Hello.ppt";
		
		File file = new File(originFileName);
		//파일로부터 데이터를 복사(입력)
		FileInputStream fis = new FileInputStream(file);
		//복사한 파일 출력
		FileOutputStream fos = new FileOutputStream(targetFileName);
		
		int readByteCount;
		int i = 0;
		
		//바이트 배열을 크게 잡을수록 복사시간이 빨라진다.
		//byte[] bArr = new byte[100];
		byte[] bArr = new byte[1000];
		//byte[] bArr = new byte[10000];
		//byte[] bArr = new byte[100000];
		
		//현재 시점을 저장한다.
		long startTime = System.currentTimeMillis();
		while( (readByteCount = fis.read(bArr)) != -1) {
			//fos.write(bArr);
			//읽은 바이트 수 만큼 출력스트림으로 보내는 것
			fos.write(bArr, 0, readByteCount);
			i++;
		}
		fos.flush();
		//복사의 종료 시점
		long endTime = System.currentTimeMillis();
		
		System.out.println("총 루핑수 : " + i);
		System.out.println("복사 시간 : " + (endTime - startTime) + "ms");
		System.out.println("복사한 파일의 크기 : " + (file.length()/1024) + "kbyte");
		
		fos.close();
		fis.close();
		System.out.println(file.getName() + " 파일의 복사가 완료되었습니다.");
	}
	
}
