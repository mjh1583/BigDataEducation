package kr.co.kihd.inputstreamreaderoutputstreamwriter;

import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;

public class OutputStreamWriterTest {
	
	public static void main(String[] args) throws Exception {
		
		//주 스트림을 생성함
		FileOutputStream fStream = new FileOutputStream("C:/Temp1/write.txt");
		
		//보조 스트림을 연결함
		Writer writer = new OutputStreamWriter(fStream);
		
		//저장할 데이터
		String data = "문자데이터를 보조출력스트림으로 보내어 바이트 스트림 기반으로 변환되어 저장됨";
		writer.write(data);	
		writer.flush();
		
		writer.close();
		fStream.close();
		System.out.println("파일이 저장되었습니다.");
		
	}
	
}
