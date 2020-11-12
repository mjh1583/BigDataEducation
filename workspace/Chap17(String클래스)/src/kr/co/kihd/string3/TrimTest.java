package kr.co.kihd.string3;

public class TrimTest {
	
	public static void main(String[] args) {
		
		String tel1 = "               02";
		String tel2 = "-3306      ";
		String tel3 = "     -1037   ";
		
		//trim() : 좌우 공백만 제거. 중간에 공백은 프로그래머가 직접 제거하는 코드를 작성해야함.
		System.out.println(tel1.trim());
		System.out.println(tel1.trim() + tel2.trim() + tel3.trim());
		
	}
	
}
