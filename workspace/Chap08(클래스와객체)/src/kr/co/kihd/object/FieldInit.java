package kr.co.kihd.object;

public class FieldInit {
	
	//기본형 변수
	byte byteField;       //1 byte
	short shortField;     //2
	int intField;         //4 (디폴트 타입)
	long longField;       //8
	
	boolean booleanField; //1
	char charField;       //2
	
	float floatField;     //4
	double doubleField;   //8
	
	//참조형 변수
	int[] arrField;       //4
	String strField;      //4
	
	//this : 객체자기자신의 주소
	//super : 조상객체의 주소
	
	//toSting() : 클래스의 멤버변수(필드)의 값들을 수시로 확인하고자 할때나, 원하는 포맷으로 멤버변수들을 출력하고자 할때 많이 사용함.
	@Override
	public String toString() {
		String str = "byteField : " + byteField +
				", shortField : " + shortField + 
				", intField : " + intField +
				", longField : " + longField +
				", booleanField : " + booleanField +
				", strField : " + strField;
		return str;
	}
	
}
