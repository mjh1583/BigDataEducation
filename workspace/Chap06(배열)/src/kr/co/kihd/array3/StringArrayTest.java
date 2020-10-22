package kr.co.kihd.array3;

import java.util.Arrays;

public class StringArrayTest {
	
	public static void main(String[] args) {
		//String 배열
		String str = new String("자바");
		System.out.println(str);
		
		//객체(클래스) 배열 => 2차원 배열
		String[] str2 = new String[] {
				"안녕", "구미시", "헬로우월드"     //1차원 배열 형태임
		};
		
		for(int i = 0; i < str2.length; i++)
		{
			System.out.print(str2[i] + " ");
		}
		System.out.println();
		
		System.out.println("String 배열의 주소 : " + str2.toString());
		//Object 클래스는 모든 클래스의 최고 조상
		//String 클래스는 Object 클래스의 toString()을 오버라이딩(재정의)했기 때문에 값이 나옴
		System.out.println("String 배열의 주소 : " + str2[1].toString());
		
		str2[0] = "대한민국";
		System.out.println(Arrays.toString(str2));
		
		//향상된 for문
		for(String temp : str2)
		{
			System.out.print(temp + " ");
		}
		
	}
}
