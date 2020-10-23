package kr.co.kihd.exception2;

public class TryCatchTest {

	public static void main(String[] args) {
		
		System.out.println(1);
		System.out.println(2);
		
		try {
			System.out.println(3);
			//System.out.println(4/0);  //ArchimeticException 발생
			System.out.println(5);    //출력이 안됨.
		} catch (Exception e) {
			System.out.println(6);
			//System.out.println(e.getMessage());
		}
		System.out.println(7);
	}

}
