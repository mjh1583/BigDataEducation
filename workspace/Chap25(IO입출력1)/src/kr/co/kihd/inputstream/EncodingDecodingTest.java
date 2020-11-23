package kr.co.kihd.inputstream;

import java.net.URLDecoder;
import java.net.URLEncoder;

public class EncodingDecodingTest {

	public static void main(String[] args) throws Exception {
		
		String hangeul = "한글";
		String[] encodings = new String[] {"x-windows-949", "EUC-KR", "UTF-8", "ISO8859-1"};
		
		String[] encoded = new String[4];
		for(int i = 0; i < encodings.length; i++) {
			//인토딩(기계가 편한 쪽으로 변환)
			encoded[i] = URLEncoder.encode(hangeul, encodings[i]);
			System.out.println(encodings[i] + "으로 인코딩된 값 : " + encoded[i]);
		}
		
		String[] decoded = new String[4];
		for(int i = 0; i < encodings.length; i++) {
			//디코딩(사람이 편한 쪽으로 변환)
			decoded[i] = URLDecoder.decode(encoded[i], encodings[i]);
			System.out.println(encodings[i] + "으로 디코딩된 값 : " + decoded[i]);
		}
	}

}
