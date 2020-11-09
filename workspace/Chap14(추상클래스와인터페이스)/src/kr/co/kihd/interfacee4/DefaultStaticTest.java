package kr.co.kihd.interfacee4;

public class DefaultStaticTest {
	
	public static void main(String[] args) {
		
		MyInterface myInterface = new DefaultStaticClass();
		myInterface.dMethod();
		myInterface.method();
		
		//인터페이스의 정적메서드 호출하는 방법 동일함
		//(인터페이스명.정적메서드명 호출)
		MyInterface.sMethod();
		
	}
	
}
