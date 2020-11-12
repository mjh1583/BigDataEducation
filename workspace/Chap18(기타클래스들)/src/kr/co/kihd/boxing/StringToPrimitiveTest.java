package kr.co.kihd.boxing;

public class StringToPrimitiveTest {
	
	public static void main(String[] args) {
		
		int value1 = Integer.parseInt("100");  //문자열을 int형으로 언박싱
		double value2 = Double.parseDouble("3.14");
		Boolean value3 = Boolean.parseBoolean("true");
		
		System.out.println(value1);
		System.out.println(value2);
		System.out.println(value3);
			
	}
	
}
