package kr.co.kihd.polymorphism;

public class CarTest {
	
	public static void main(String[] args) {
		
		Car car = null;
		SportsCar sportsCar = new SportsCar();
		SportsCar sportsCar2 = null;
		PoliceCar policeCar = new PoliceCar();
		
		sportsCar.speedUp();
		
		car = sportsCar;               //1. 업캐스팅(자손->조상) : 조작할 수 있는 멤버가 줄어듬.
		//car.speedUp();               // X
		
		sportsCar2 = (SportsCar) car;  //2. 다운캐스팅(조상->자손) : 조작할 수 있는 멤버가 늘어남.
		                               //다운캐스팅을 할때, 반드시 명시적으로 형변환 코드를 작성해야함. 
		sportsCar2.speedUp();
		
		//3. 서로 관련 없는 클래스들 간의 형변환 : 서로 상속관계가 아니기 때문에 형변환이 이루어질 수 없음.
		//sportCar = policeCar;        //X
		
	}
	
}
