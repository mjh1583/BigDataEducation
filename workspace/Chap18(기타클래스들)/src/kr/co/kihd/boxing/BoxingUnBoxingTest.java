package kr.co.kihd.boxing;

public class BoxingUnBoxingTest {
	
	public static void main(String[] args) {
		
		//박싱(Boxing) 코드(방법) ==> 객체화 시킴
		Integer obj1 = new Integer(100);
		Integer obj2 = new Integer("100");
		//valueOf() : 인자값을 지정된 Number 객체형으로 변환하여 반환
		Integer obj3 = Integer.valueOf(100);
		//컴파일 시 new Integer(100)로 바뀐다.
		Integer obj4 = 100;
		
		System.out.println("박싱후 \n" + obj1);
		System.out.println(obj2);
		System.out.println(obj3);
		System.out.println(obj4);
		
		//언박싱(UnBoxing) 코드(방법) ==> 기본값으로 바꾼다.
		int value1 = obj1.intValue();
		int value2 = obj2;
		int value3 = obj3;
		int value4 = obj4.intValue();
		
		System.out.println("언박싱 후");
		System.out.println(value1);
		System.out.println(value2);
		System.out.println(value3);
		System.out.println(value4);
		
		
	}
	
}
