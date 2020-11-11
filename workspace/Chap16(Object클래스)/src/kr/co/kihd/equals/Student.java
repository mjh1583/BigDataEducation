package kr.co.kihd.equals;

import java.util.Arrays;

public class Student {
	
	int age;
	String name;
	int[] arr;
	
	public Student(int age, String name, int[] arr) {
		this.age = age;
		this.name = name;
		this.arr = arr;
	}
	
	@Override
	public boolean equals(Object obj) {
		System.out.println("오버라이딩된 equals() 호출됨");
		
		//타입변환이 가능한지 여부를 알아보기 위해서 instanceof 연산자 이용
		if(obj instanceof Student) {
			Student student = (Student)obj;    //다운캐스팅(DownCasting)
			//논리적 동등을 위해서 조건문을 설정
			if(this.age == student.age && this.name == student.name && Arrays.equals(this.arr, student.arr)) {
				return true;
			}
		}
		return false;
	}
	
}
