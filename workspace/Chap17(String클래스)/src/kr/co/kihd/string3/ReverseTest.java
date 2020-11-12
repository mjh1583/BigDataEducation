package kr.co.kihd.string3;

public class ReverseTest {
	
	public static void main(String[] args) {
		
		String str = "안녕하세요";
		String reverse = "";
		int count = str.length();
		
		System.out.println("문자열 길이 : " + count);
		
		for(int i = 0; i < count; i++) {
			reverse += str.charAt(count - (i + 1));
//			System.out.println(reverse);
			//매번 새로운 문자열을 생성하고 있음.
//			System.out.println(reverse.hashCode());
		}
		
		System.out.println("역순 출력 : " + reverse);
		
		String rev = reverseString(str);
		System.out.println("reverseString() 호출 후 : " + rev);
		
	}
	
	//버퍼에서 실행
	public static String reverseString(String str) {
		return new StringBuilder(str).reverse().toString();	
	}
	
}
