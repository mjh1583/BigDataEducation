package kr.co.kihd.operator3;

public class LogicalOperatorTest {

	public static void main(String[] args) {
		// 논리연산자 (&&, ||)에 대해서 코드 적용
		
		boolean result = false;
		int i = 10;
		char ch = 'b';
		
		result = (i > 5);    //true
		System.out.println("(i > 5) : " + result);
		                                                                                                                                                     
		result = (i >= 9) && (i < -8);
		System.out.println("(i >= 9) && (i < -8) : " + result);

		result = (i >= 9) || (i < -8);
		System.out.println("(i >= 9) || (i < -8) : " + result);
		
		// 알파벳이 소문자인지 확인하는 식
		result = (ch > 'a' && ch <= 'z');
		System.out.println("(ch > 'a' && ch <= 'z') : " + result);
		
		//ch에 저장되어진 값이 알파벳인지 확인조건
		result = (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z');
		System.out.println("(ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z') : " + result);
		
	}

}
