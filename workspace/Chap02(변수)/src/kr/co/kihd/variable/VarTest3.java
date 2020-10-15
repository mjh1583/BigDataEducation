package kr.co.kihd.variable;

public class VarTest3 {

	public static void main(String[] args) {

		int i3 = 100;
		float f1 = (float)i3; //캐스팅 생략 가능
		System.out.println("정수 -> 실수 : " + f1);
		
		
		float f2 = 10.55f;
		int i4 = (int)f2;
		System.out.println("실수 -> 정수 : " + i4);
	
		char ch ='a';
		int i5 = ch;
		//문자값을 정수타입으로 바꾸게 되면 아스키 코드값으로 바뀌어져서 출력이 됨
		System.out.println("문자 -> 정수 : " + i5);
		
		//any 타입 + "" => 문자열 타입
		int i6 = 100;
		String str = "java" + i6;
		System.out.println(str);
	}

}
