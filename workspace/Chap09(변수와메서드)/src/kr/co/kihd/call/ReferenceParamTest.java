package kr.co.kihd.call;

public class ReferenceParamTest {

	public static void main(String[] args) {
		
		A a = new A();
		a.data = 77;
		System.out.println("메서드 호출 전 main()내의 값 : " + a.data);
		
		System.out.println("dataChange() 호출");
		//Call by Reference(주소에 의한 호출)
		//참조형 (값을 읽고 수정도 가능함)
		ReferenceParamTest.dataChange(a);
		System.out.println("메서드 호출 후 main()내의 값 : " + a.data);
	}
	
	//int[], double[], String ==> 참조변수 형태
	public static void dataChange(A a) {
		//지역변수
		//data값은 값 복사가 이루어짐. ==> 호출한곳으로부터 아무런 영향을 받지 않음.
		a.data = 44;
		System.out.println("dataChange()내의 값 : " + a.data);
		return;     //리턴 타입이 void이기 때문에 없어도 됨.
	}
}
