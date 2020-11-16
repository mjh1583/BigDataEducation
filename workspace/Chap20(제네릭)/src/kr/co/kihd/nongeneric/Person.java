package kr.co.kihd.nongeneric;

public class Person {
	
	private Object object;
	
	public Person() {
		
	}
	
	//리턴타입 Object
	public Object getObject() {
		return object;
	}

	//매개변수 타입이 Object  ==> 모든 클래스를 다 매개변수, 리턴타입으로 하겠다.(다형성)
	public void setObject(Object object) {
		this.object = object;
	}
	
}
