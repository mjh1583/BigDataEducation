package kr.co.kihd.generic;

public class TVTest {

	public static void main(String[] args) {
		
		TV<String> tv = new TV<>();
		tv.setE("LG OLED TV");
		String tvName = tv.getE();
		System.out.println("나의 TV는 " + tvName + "입니다.");
		
	}

}
