package kr.co.kihd.variable;

public class VarTest1 {

	public static void main(String[] args) {
		
		int year = 2020;
		int age = 20;
		
		//sysout 입력 후 Ctrl+Space = 자동완성 => 인텔리전스 기능
		System.out.println(year);
		System.out.println(age+year);
		
		String str = new String("자바");
		System.out.println(str);
		System.out.println(str.toString()); 
		
		//사용자정의 클래스이거나 toString() 재정의를 하지 않은 클래스의 참조변수는 출력을 하게 되면, 클래스타입@16진수(주소)
		Object obj = new Object();
		System.out.println(obj); //주소번지 리턴
		
		//L은 long을 지정하기 위해서 접미사 L,l을 붙임
		long result = 10L;
		
		//F는 float을 지정하기 위해서 접미사 F,f를 붙임
		float result2 = 10.1F;
		double dou = 9.999;
		
		char ch = 'A';
		
		System.out.println("long 타입 출력: " + result);
		System.out.println("float 타입 출력: " + result2);
		System.out.println("double 타입 출력: " + dou);
		System.out.println("ch: " + ch);
		
		System.out.println(str + "를 공부합시다");
		System.out.println(obj + " 자바");
		
		//8bit = 1byte, 1024byte = 1kbyte, 1024kB = 1MB, 1024MB = 1GB, 1024GB = 1TB
		//1Byte : -128 ~ 127
		//부호비트 (MSB) : 맨 앞의 한 자리 0,1 (양,음)
		//상수 : 변하지 않는 값 ex) final int MAX = 100;
	}

}