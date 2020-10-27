package kr.co.kihd.object5;

public class IpadTest {

	public static void main(String[] args) {
		
		Ipad ipad = new Ipad();
		ipad.setCompany("애플");
		ipad.setModel("ipadAir4세대");
		ipad.setRelease(2020);
		ipad.setColor("로즈골드");
		
		System.out.println(ipad);
		
		Ipad ipad2 = new Ipad();
		ipad2.setCompany("삼성");
		ipad2.setModel("S패드");
		ipad2.setRelease(2021);
		ipad2.setColor("골드");
		
		System.out.println(ipad2);
		
		
	}

}
