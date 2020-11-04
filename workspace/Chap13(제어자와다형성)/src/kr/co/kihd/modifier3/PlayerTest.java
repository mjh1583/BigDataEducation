package kr.co.kihd.modifier3;

public class PlayerTest {
	
	public static void main(String[] args) {
		
		//다형성 미적용 코드
		Player player = new Player("박지성", 40, 20, 60);
		player.info();
		System.out.println();
		
		//다형성이 적용된 코드 (필드의 다형성)
		//하지만 원타입은 벗어나지 못함. 그래서 Striker클래스에 있는 
		//getShoot()메서드는 player2 참조변수가 접근이 안됨.
		Player player2 = new Striker("손흥민", 25, 10, 90, 5);
		
		//메서드에서 상속관계에 있다면, 자손클래스에서 오버라이딩을 하게 되면 현재 참조하고 있는 인스턴스의 메서드를 호출함.
		player2.info();
		//player2.getShoot();
		System.out.println();
		
		Player player3 = new MidFielder("이강인", 18, 18, 80, 120);
		player3.info();
		System.out.println();
		
		Player player4 = new Defender("김영권", 28, 18, 60, 60);
		player4.info();
		
	}
	
}
