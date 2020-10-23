package kr.co.kihd.exception3;

public class ThrowsTest {
	
	//아래 main에서 throws Exception 구문 추가시에 JVM에게 예외를 던짐.
	public static void main(String[] args) throws Exception{
		
		//main()에서 method1()을 호출하고 있으니 여기서 예외처리를 해야함
//		try {
			method1();
//		} catch (Exception e) {
//			System.out.println("예외 발생 : 0으로 나눌 수 없습니다.");
//		}
		
	}
	
	//Throws는 메서드 선언부 끝에 작성을 하며, 호출한 곳으로 예외를 되던지며, 호출한 곳에서 예외를 반드시 처리해야함.
	public static void method1() throws Exception {
		method2();
		
	}
	
	public static void method2() throws Exception {
		System.out.println(10/0);   //산술 예외(실행 예외)
	}
}
