package kr.co.kihd.interfacee;

//인터페이스의 본질은 추상메서드
public interface Creature {
	
	//인터페이스에서 static final은 부수적 개념
	int MAX = 100;             //static final 생략가능. 컴파일시에 컴파일러가 붙여준다.
	public void method();      //abstract 생략가능. 컴파일시에 컴파일러가 붙여준다.
	
}
