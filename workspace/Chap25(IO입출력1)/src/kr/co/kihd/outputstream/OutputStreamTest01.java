package kr.co.kihd.outputstream;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Arrays;

public class OutputStreamTest01 {

	public static void main(String[] args) throws Exception {
		//파일로부터 출력스트림을 생성하여 대입한다.(다형성)
		OutputStream oStream = new FileOutputStream("C:\\workspace\\write.txt");
		byte[] data = "ABC".getBytes();
		
		System.out.println(Arrays.toString(data));  //아스키코드가 출력됨
		
		//3번 루핑. 한 글자씩 보내기 때문임.
		for(int i = 0; i < data.length; i++) {
			oStream.write(data[i]);
		}
		//write()를 사용하면 무조건 flush()를 호출하여, 반드시 메모리 버퍼를 비우도록 하자.
		//물론 main() 종료하면 알아서 버퍼에서 나가지만, 가능한 flush()를 호출하도록 하는 것을 습관화하도록 한다.
		oStream.flush();
		System.out.println("저장이 완료되었습니다.");
		
		oStream.close();
	}

}
