package kr.co.kihd.exception3;

public class ThrowAndThrowsTest {
	
	public static void main(String[] args) {
		
		boolean result = false;
		
		try {
			result = findClass();
			System.out.println("프로그램을 실행합니다.");
			if(result)
			{
				System.out.println("클래스가 존재합니다.");
			}
		} catch (ClassNotFoundException e) {
			System.out.println("클래스가 존재하지 않습니다.");
			e.printStackTrace();  //개발 디버깅용임. 배포시에는 제거하거나 주석처리를 해야함.
		} catch (Exception e) {
			System.out.println("알 수 없는 예외가 발생했습니다.");
		} finally {
			System.out.println("정상 종료합니다.");
		}
		
	}
	
	public static boolean findClass() throws Exception{
		
		Class class1 = Class.forName("java.lang.Math");
		throw new Exception("강제로 예외 발생");
		
//		if(class1 != null)   //클래스가 있다면
//			return true;
//		else                 //클래스가 없다면
//			return false;
	}
}
