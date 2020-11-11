package kr.co.kihd.string2;

public class SubStringTest {
	
	public static void main(String[] args) {
		
		String phoneNum = "01012345678";
		
		//substring() : 문자열을 잘라내어 String으로 변환
		String str1 = phoneNum.substring(3);
		System.out.println(str1);
		
		String str2 = phoneNum.substring(0, 3);
		System.out.println(str2);
		
	}
	
}
