package kr.co.kihd.inetaddress;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;

/*
 * URL : Uniform Resource Location
 * 		 인터넷에 존재하는 서버들의 자원에 접근할 수 있는 주소
 * 		 ex)https://www.android.com/results/?q=watch
 * 		 1. 프로토콜 : 자원에 접근하기 위해 서버와 클라이언트간 통신하는데 사용하는 규약.
 * 		 2. 호스트명 : 자원을 제공하는 서버의 이름
 * 		 3. 포트번호 : 통신에 사용되는 서버의 포트번호(80)
 * 		 4. 경로명 : 접근하려는 자원이 저장된 서버상의 위치
 * 		 5. 파일명 : 접근하려는 자원의 이름
 * 		 6. 쿼리(query) : URL에서 '?'이후의 부분
 */

public class URLTest {
	
	public static void main(String[] args) throws Exception {
		
		URL url = new URL(args[0]);
		
		System.out.println("프로토콜 : " + url.getProtocol());   //URLTest.java 우클릭 => Run as / Run Configurations => Arguments에 주소값 적용
		System.out.println("호스트 : " + url.getHost());
		System.out.println("포트 : " + url.getPort());
		System.out.println("파일 : " + url.getFile());
		
		InputStream ins = url.openStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(ins));
		
		String str = "";
		
		while( (str = br.readLine()) != null) {
			System.out.println(str);
		}
		
		br.close();
		ins.close();
	
	}
	
}
