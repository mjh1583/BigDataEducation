package kr.co.kihd.string2;

public class ReplaceTest {
	
	public static void main(String[] args) {
		
		//replace() : 문자열을 대체하는 메서드
		String oldstr = "자바는 객체지향언어입니다";
		String newstr = oldstr.replace("자바", "JAVA");
		
		System.out.println("기존 문장 : " + oldstr);
		System.out.println("새로운 문장 : " + newstr);
		
		System.out.println(oldstr.hashCode());
		System.out.println(newstr.hashCode());
		
	}
	
}
