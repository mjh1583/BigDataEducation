package kr.co.kihd.operator3;

public class StringEqualsTest {

	public static void main(String[] args) {
		// 참조형 타입 ==, != 에 대해서 확인
		
		//리터럴의 경우는 같은 값이 있는지, 먼저 메모리공간(heap)을 확인하고 나서, 같은 값이 있다면 같은 주소를 공유하게 되고
		//없다면 새로운 곳에 인스턴스를 생성해준다.
		String str1 = "구미시";
		//String str2 = "자바";
		String str2 = "구미시";
		
		//참조형 타입에서 ==은 '주소비교'를 하고 있다.
		//같은 리터럴의 경우는 같은 번지를 공유한다.
		boolean result = (str1 == str2);
		System.out.println("str1 == str2 : " + result);

		//new 연산자가 오면 무조건 새로운 인스턴스를 생성한다.
		String str3 = new String("구미시");
		result = (str1 == str3);
		System.out.println("str1 == str3 : " + result);
		
		//String 클래스의 equals()는 주소와 상관없이 '값'이 같다면, 무조건 true를 리턴한다.
		result = str1.equals(str2);
		System.out.println("str1.equals(str2) : " + result);
		
		result = str1.equals(str3);
		System.out.println("str1.equals(str3) : " + result);
		
	}

}
