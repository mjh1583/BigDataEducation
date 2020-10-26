package kr.co.kihd.object4;

public class TimeTest {

	public static void main(String[] args) {
	
		Time time = new Time();
		//time.hour = 10; (private으로 불가)
		System.out.println(time.getHour());
		
		System.out.println(time);
		
		//시를 설정
		time.setHour(10);
		//분을 설정
		time.setMinute(30);
		//초를 설정
		time.setSecond(50);
		System.out.println(time);
		
		time.setHour(50);
		time.setMinute(100);
		time.setSecond(100);
		System.out.println(time);
	}
	
}
