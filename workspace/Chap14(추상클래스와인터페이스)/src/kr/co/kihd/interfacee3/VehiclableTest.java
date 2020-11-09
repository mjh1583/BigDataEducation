package kr.co.kihd.interfacee3;

public class VehiclableTest {
	
	public static void main(String[] args) {
		
		Driver driver = new Driver();
		Bus bus = new Bus();
		//Taxi taxi = new Taxi();
		
		bus.setSpeed(-50);
		bus.setSpeed(80);
		driver.drive(bus);		//직접 객체를 생성하여 참조변수(주소)로 넘김
		driver.stop(bus);
		System.out.println();
		
		//직접 객체를 매개변수로 생성하여 넘기는 방법도 있음.
		driver.drive(new Taxi());
		driver.drive(new Bus());
		//driver.drive(new AICar());
		System.out.println();
		
		Vehiclable vehiclable = driver.newCarMethod(new Taxi());
		vehiclable.run();
		vehiclable.stop();
		System.out.println();
		
		vehiclable = driver.newCarMethod(new Bus());
		vehiclable.run();
		vehiclable.stop();
		
	}
	
}
