package kr.co.kihd.polymorphism;

public class InstanceOf {

	public static void main(String[] args) {
		
		//Ctrl + T : 상속계층도를 볼 수 있는 단축키
		SportsCar sportsCar = new SportsCar();
		
		if(sportsCar instanceof SportsCar) {
			System.out.println("SportsCar로 타입변환이 가능합니다.");
		}
		
		if(sportsCar instanceof Car) {
			System.out.println("Car로 타입변환이 가능합니다.");
		}
		
		if(sportsCar instanceof Object) {
			System.out.println("Object로 타입변환이 가능합니다.");
		}
		
		//instanceof 연산자가 결과 true라는 것은 실제 형변환이 가능하다라는 의미이며, 아울러 상속관계에 있는 것이다.

//		if(sportsCar instanceof PoliceCar) {
//			System.out.println("PoliceCar로 타입변환이 가능합니다.");
//		}
				
	}

}
