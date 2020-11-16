package kr.co.kihd.generic;

//Person이라는 클래스를 제네릭 타입으로 설계
public class Person<T> {
	
	//T라는 타입이 아직 정해지지 않았다.
	//T는 개발코드에서 정해진다.
	//static은 올 수가 없다.(어떤것이 올지도 모르는데 미리 클래스영역에 올려둘수는 없다.) 
	private T t;
	
	public Person() {
		
	}

	public T getT() {
		return t;
	}

	public void setT(T t) {
		this.t = t;
	}
		
}
