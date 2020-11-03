package kr.co.kihd.overriding2;

public class CarTest {
	
	public static void main(String[] args) {
		
		Car car = new Car(80);
		car.speedUp();
		car.speedDown();
		car.stop();
		
		SportsCar sportsCar = new SportsCar(150);
		sportsCar.speedUp();    //조상클래스의 speedUp()을 호출
		sportsCar.speedDown();  //조상클래스의 speedDown()을 호출
		sportsCar.stop();       //자손클래스의 stop()호출
		
	}
	
}
