package kr.co.kihd.string3;

public class SplitTest {
	
	public static void main(String[] args) {
		
		String str1 = "사랑해,너를,파닭치킨,양념치킨";
		String[] strArr = str1.split(",");
		
		for(String str : strArr) {
			System.out.println(str);
		}
		
		System.out.println();
		String str2 = "사랑해,너를/파닭치킨&양념치킨,후라이드";
		strArr = str2.split(",|/|&");
		
		for(String str : strArr) {
			System.out.println(str);
		}
		
	}
	
}
