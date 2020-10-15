package kr.co.kihd.operator2;

public class DefaultTypeTest {

	public static void main(String[] args) {

		byte b1 = 127, b2 = 1;
		// byte b3 = b1 + b2;    //byte + byte => int + int => int
		
		//자동캐스팅(int형으로 받아줌)
		int i1 = b1 +b2;
		
		//강제캐스팅
		byte b3 = (byte)(b1 + b2);
		
		System.out.println("i1 = " + i1);
		System.out.println("b3 = " + b3);
		
		char ch = 'A';   // A는 아스키코드 값으로 65
		int i2 = ch + b2; // 65 + 1
		System.out.println("i2 = " + i2);
		
		float f1 = 15.5f;
		//int i3 = b1 + f1;    // float + float = float
		float f2 = b1 + f1;
		System.out.println("f2 = " + f2);
		
		double d1 = 10.5;
		//float f3 = f1 + d1;    // float + double = double
		double d2 = f1 + d1;
		System.out.println("d2 = " + d2);
		
	}

}
