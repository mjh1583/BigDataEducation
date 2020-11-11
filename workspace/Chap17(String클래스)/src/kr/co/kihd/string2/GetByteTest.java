package kr.co.kihd.string2;

import java.io.UnsupportedEncodingException;

public class GetByteTest {
	
	public static void main(String[] args) throws UnsupportedEncodingException {
		
		String str = "안녕하세요";
		
		//인코딩(기계가 알아보기 편하게 변환하는 과정)
		byte[] bytes1 = str.getBytes("utf-8");
		System.out.println("bytes1(utf-8)의 길이 : " + bytes1.length);
		
		byte[] bytes2 = str.getBytes("euc-kr");
		System.out.println("bytes1(euc-kr)의 길이 : " + bytes2.length);
				
		//디코딩(인간이 알아보기 편하게 변환하는 과정)
		String str1 = new String(bytes1, 0, bytes1.length, "utf-8");
		System.out.println("utf-8로 디코딩한 문자열 : " + str1);
		
		String str2 = new String(bytes2, 0, bytes2.length, "euc-kr");
		System.out.println("euc-kr로 디코딩한 문자열 : " + str2);
		
	}
	
}
