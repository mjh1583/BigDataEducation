package kr.co.kihd.interfacee3;

//독립클래스 (인터페이스 매개변수의 다형성)
public class Driver {
	
	//new Taxi()이거나 new Bus()만 들어올 수 있음.
	//위 2개의 클래스가 Vehiclabe 인터페이스를 구현했기 때문에 들어올 수 있음.
	public void drive(Vehiclable vehiclable) {
		vehiclable.run();
	}
	
	public void stop(Vehiclable vehiclable) {
		vehiclable.stop();
	}
	
	//인터페이스(vehiclable)가 리턴 타입, 매개변수 타입임.
	//즉 리턴타입도 구현클래스가 와야하며, 매개변수 타입도 역시 구현클래스가 와야함.
	public Vehiclable newCarMethod(Vehiclable vehiclable) {
		
		if(vehiclable instanceof Taxi) {
			Taxi taxi = (Taxi)vehiclable;   //다운캐스팅 => 강제형변환 필요
			return taxi;
		}
		else if(vehiclable instanceof Bus) {
			Bus bus = (Bus)vehiclable;		//다운캐스팅 => 강제형변환 필요
			return bus;
		}
		
		return null;
	}
	
}
