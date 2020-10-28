package kr.co.kihd.call;

class A {
	int data;
}

public class PrimitiveParamTest {

	public static void main(String[] args) {
		
		A a = new A();
		a.data = 77;
		System.out.println("메서드 호출 전 main()내의 값 : " + a.data);
		
		System.out.println("dataChange() 호출");
		//Call by Value(값에 의한 복사 호출)
		PrimitiveParamTest.dataChange(a.data);
		System.out.println("메서드 호출 후 main()내의 값 : " + a.data);
	}
	
	public static void dataChange(int data) {
		//지역변수
		//data값은 값 복사가 이루어짐. ==> 호출한곳으로부터 아무런 영향을 받지 않음.
		data = 44;
		System.out.println("dataChange()내의 값 : " + data);
		return;     //리턴 타입이 void이기 때문에 없어도 됨.
	}
}
